Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA846C55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 16:58:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21214.1785862694852057545
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 09:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=XWVTo8JN;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B8731476
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 09:58:10 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1D2733F66F
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 09:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785862694; bh=1FvUplVL9rUZya5FNXhG7iaEWTJqZknrmnvSXkw3EpY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XWVTo8JNQWqQ9Ju+BZZcV0+OmHejzoLlXpUjKYaXVccnSTLCAuOOLMPmI+6wa3970
	 r9SEBN7jQ/jeZKiJblHs7vykloU+qmayKXrBY6NrWZE4gaQiBqSlzik3Nip7+Gdzti
	 tHRDuVWW9VuqojrvIpdj54CrqRAvTNjqDw0n12v4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/9] classes/cargo-c: pass flags via CARGO_BUILD_FLAGS
Date: Tue,  4 Aug 2026 17:58:02 +0100
Message-ID: <20260804165803.598030-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804165803.598030-1-ross.burton@arm.com>
References: <20260804165803.598030-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 16:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242788

We need to pass the same flags to cbuild and cinstall, as otherwise it
will build in do_compile and then rebuild with the right paths in
do_install.

Add the flags to CARGO_BUILD_FLAGS so that they get used in all calls
and do_install no longer does any building. Example from buildstats:

PKG                        TASK        ABSDIFF  RELDIFF  WALLTIME1 -> WAL=
LTIME2
gstreamer1.0-plugins-rs    do_install  -263.6s   -99.0%     266.2s -> 2.7=
s

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/cargo_c.bbclass | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/cargo_c.bbclass b/meta/classes-recipe/ca=
rgo_c.bbclass
index e68ac93a610..cd486b20067 100644
--- a/meta/classes-recipe/cargo_c.bbclass
+++ b/meta/classes-recipe/cargo_c.bbclass
@@ -16,6 +16,13 @@ BASEDEPENDS:append =3D " cargo-c-native"
=20
 B =3D "${WORKDIR}/build"
=20
+CARGO_BUILD_FLAGS +=3D "\
+    --destdir ${D} \
+    --prefix ${prefix} \
+    --libdir ${libdir} \
+    --library-type cdylib \
+    "
+
 do_compile[progress] =3D "outof:\s+(\d+)/(\d+)"
 cargo_c_do_compile() {
     oe_cargo_fix_env
@@ -27,11 +34,7 @@ cargo_c_do_compile() {
 cargo_c_do_install() {
     oe_cargo_fix_env
     export RUSTFLAGS=3D"${RUSTFLAGS}"
-    cargo-cinstall cinstall ${CARGO_BUILD_FLAGS} \
-        --destdir ${D} \
-        --prefix ${prefix} \
-        --libdir ${libdir} \
-        --library-type cdylib
+    cargo-cinstall cinstall ${CARGO_BUILD_FLAGS}
 }
=20
 EXPORT_FUNCTIONS do_compile do_install
--=20
2.43.0


