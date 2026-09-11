Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB7BC88E4C
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 11:27:27 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37143.1789126042305176524
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 04:27:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=s+EWF3XM;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout03.t-online.de (Postfix) with SMTP id DB775E295
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 13:27:19 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.228.20]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x4zPZ-3o6gaG0; Fri, 11 Sep 2026 13:27:17 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] cargo_common: map the cargo vendoring directory for the C compiler
Date: Fri, 11 Sep 2026 13:27:08 +0200
Message-ID: <20260911112708.719078-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789126037-33FFC839-5E71626A/0/0 CLEAN NORMAL
X-TOI-MSGID: 42a20d15-8522-4ba3-931e-df5941048852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789126039; i=f_l_k@t-online.de;
	bh=ZwyLXUSfNfHACA0EXQF+Gpsxsiz08z7SRzT6Q4wzqBQ=;
	h=From:To:Subject:Date;
	b=s+EWF3XMM92PPMk6Jnhm4HltiQWUuSOdx62b2Yw8sOsKzNvFkseVOD6/d22vYoqAa
	 TLcpvRaHMHXpFzG8TXZTp96u/iIOX9hzAy2EWdAuZZs8MAnJLQ4Q1Yl/Qw3RNgqhKT
	 ziWlRJ3zP577cfipyDhIQeBBrwYMXT4hBU1iv1UMjzAFz0mGfgYbDrghxotCjEZ8FW
	 9G7748QY4tXzW70B6KkHwgdBSZEmzk95Xq+6d2hguLozb6kKfrXFSe3DXeebMYMDsG
	 AyexU0sasPvbRY1eCXdSTjU+ZqImrEB8zr8yI/puLo/5T+gZtS00oIft22g/kWWOQa
	 WLdZ9c0ads9+g==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 11:27:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245637

Crates that ship C or assembly sources, ring being a prominent one,
compile them through the cc crate rather than rustc. RUST_DEBUG_REMAP
only passes --remap-path-prefix to rustc, and DEBUG_PREFIX_MAP covers
S, B and the sysroots, so nothing rewrites the paths below CARGO_HOME.
The build directory of every vendored crate therefore ends up in the
debug symbols, which trips the buildpaths QA check and leaves recipes
working around it by dropping their -dbg package.

Add the vendoring directory to DEBUG_PREFIX_MAP so those objects are
remapped like the rest.

Tested on corei7-64 with yazi and eilmeldung, both of which had dropped
their -dbg package for this reason: after the change they package the
debug symbols with no reference to the build tree left.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/classes-recipe/cargo_common.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-reci=
pe/cargo_common.bbclass
index 2e1df9d9d3..37ae729ea6 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -51,6 +51,11 @@ CARGO_TARGET_SUBDIR =3D "${RUST_HOST_SYS}/${BUILD_DIR}=
"
 # Where we download our registry and dependencies to
 export CARGO_HOME =3D "${UNPACKDIR}/cargo_home"
=20
+# Crates that compile C or assembly sources do so through the cc crate, =
which
+# is not covered by the rustc specific RUST_DEBUG_REMAP, so map the vend=
oring
+# directory for the C compiler as well.
+DEBUG_PREFIX_MAP +=3D "-ffile-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGS=
RC_DIR}"
+
 # Don't instruct cargo to use crates downloaded by bitbake. Some rust pa=
ckages,
 # for example the rust compiler itself, come with their own vendored sou=
rces.
 # Specifying two [source.crates-io] will not work.
--=20
2.55.0


