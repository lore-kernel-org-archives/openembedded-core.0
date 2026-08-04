Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E7D3C55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 22:05:09 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27922.1785881104079077534
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 15:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=mHhoV4kM;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from alhe-dev-ub.waqitnwczulubdoacjva2kqlvd.phxx.internal.cloudapp.net (unknown [134.33.52.9])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6EFD520B7169
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 15:04:43 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6EFD520B7169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1785881083;
	bh=N3hRxB1WokQdnU9ugSgRl26vbcCceegIhlq3SFiFmHM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mHhoV4kMVovtxx2v2Q/acOZ+42GCsO9NX1717keQq0O+XkB4zk2TEor5xMTbx60xD
	 aZ0asVwERFpk4xPC4G7TfMvArrrzsU1PWd6+0Tq6xsiHkdYvU2wre5iMXc3HYPkQ05
	 K4WnWQalptCAkiVAVCWLPXJfjDZKnNAWfPTyO73w=
From: Alejandro Hernandez <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] bitbake.conf, rust-common.bbclass: include RUST_BUILD_SYS in the task hash
Date: Tue,  4 Aug 2026 22:04:56 +0000
Message-ID: <20260804220456.2342710-4-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804220456.2342710-1-alhe@linux.microsoft.com>
References: <20260804220456.2342710-1-alhe@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 22:05:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242808

RUST_BUILD_SYS is currently listed in BB_BASEHASH_IGNORE_VARS, which
tells bitbake that rust recipes should hash-match regardless of the
build machine's triplet. In practice that is not true:

rustc computes each crate's Strict Version Hash (SVH) using inputs
that include the *stage0/stage1 bootstrap compiler* fingerprint, which
in turn depends on the build host arch. That seed cascades through
every dependent crate's mangled symbols and the packing order of
rodata sections, so an sstate blob populated on one worker arch and
reused on a differently-arched worker produces byte-different (but
semantically identical) artifacts and fails the reproducibility
selftest causing autobuilder intermittent issues when the sstate
matches for the incorrect architecture.

Remove RUST_BUILD_SYS from BB_BASEHASH_IGNORE_VARS so the task hash
tracks the build triplet and mixed-arch autobuilder pools get an
sstate miss instead of a silently-wrong hit. RUST_HOST_SYS and
RUST_TARGET_SYS stay excluded because they're already covered by the
target/host arch hash inputs.

While this is not ideal, it should unblock the reproducible test case,
another solution would be to patch rust sources manually and attempt
to upstream that change.

This also has the side-effect that multiple variants of the conflicting
rust recipes sstate artifacts are created, but they'll be correctly used
now in each architecture.

Also add an explanatory comment next to the RUST_*_SYS[vardepvalue]
declarations in rust-common.bbclass so future readers don't re-add
the exclusion.

Verified locally: Tier 1 sighash test toggling BUILD_ARCH now produces
different task hashes for rust/libstd-rs/rpm-sequoia/python3-crypto-
graphy/cargo/librsvg, where previously the hashes matched despite the
build machine change.

[YOCTO #15554]

Assisted-by: AI - OpenAI
Signed-off-by: Alejandro Hernandez <alhe@linux.microsoft.com>
---
 meta/classes-recipe/rust-common.bbclass | 10 ++++++++++
 meta/conf/bitbake.conf                  |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recip=
e/rust-common.bbclass
index 6bc42016d1..98b46c4e3c 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -114,6 +114,16 @@ RUST_HOST_SYS[vardepvalue] =3D "${RUST_HOST_SYS}"
 RUST_TARGET_SYS =3D "${@rust_base_triple(d, 'TARGET')}"
 RUST_TARGET_SYS[vardepvalue] =3D "${RUST_TARGET_SYS}"
=20
+# Note: RUST_BUILD_SYS is intentionally NOT on BB_BASEHASH_IGNORE_VARS
+# (see meta/conf/bitbake.conf). rustc's crate SVH (Strict Version Hash)
+# is seeded by the stage0/stage1 bootstrap compiler whose fingerprint
+# depends on the BUILD host arch; that seed cascades through every
+# dependent crate's mangled symbols and rodata packing order. Excluding
+# RUST_BUILD_SYS from task hashes let a mixed-arch autobuilder pool
+# populate sstate on one worker arch and get a cache hit on a differentl=
y-
+# arched worker, producing byte-different (but semantically identical)
+# artifacts and failing reproducibility tests. See Yocto bug #15554.
+
 # wrappers to get around the fact that Rust needs a single
 # binary but Yocto's compiler and linker commands have
 # arguments. Technically the archiver is always one command but
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index bdf37d0da2..ee23459506 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -969,7 +969,7 @@ BB_HASHEXCLUDE_COMMON ?=3D "TMPDIR FILE PATH PWD BB_T=
ASKHASH BBPATH BBSERVER DL_DI
     SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIREC=
TORIES \
     OMP_NUM_THREADS BB_CURRENTTASK"
 BB_BASEHASH_IGNORE_VARS ?=3D "${BB_HASHEXCLUDE_COMMON} PSEUDO_INCLUDE_PA=
THS BUILDHISTORY_DIR \
-    SSTATE_DIR SOURCE_DATE_EPOCH RUST_BUILD_SYS RUST_HOST_SYS RUST_TARGE=
T_SYS"
+    SSTATE_DIR SOURCE_DATE_EPOCH RUST_HOST_SYS RUST_TARGET_SYS"
 BB_HASHCONFIG_IGNORE_VARS ?=3D "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_A=
GENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_PASSTHROUGH_ADDITIONS DISABLE_SANI=
TY_CHECKS \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED=
 \
--=20
2.43.0


