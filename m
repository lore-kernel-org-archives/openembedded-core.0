Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F604CA5FC7
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 14:21:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14621.1790778111898067180
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 07:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=cGDb66Va;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0818497
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 07:21:47 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D79E43F85F
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 07:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790778111; bh=6sKzKHDgsCfdaxE/2+BZqQls9DJPG7Bnqd85j8M8AGo=;
	h=From:To:Subject:Date:From;
	b=cGDb66VahTHQGiDbGqgmChAGSXdHRUhJWmVwIEEMK26+O2xf+771qUVuCQh866/RM
	 lKXwen8mSjtg6LeHdHA01CsE2YBDPgL0e0mWievPOITfPNi9ibcglKlYNyKOMlwgrJ
	 7IJr8WCtcU63mzB5PiGbw7zhEf8/itElRTUvFeDw=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemtap: rationalise bb/inc split
Date: Wed, 30 Sep 2026 15:21:46 +0100
Message-ID: <20260930142146.3586658-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 14:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246973

systemtap is split into a .bb and .inc file.  Whilst I'd normally merge
these as there is currently no need for this, it might be sensible in
the future to create subrecipes that build specific parts of systemtap.

So, rationalise the contents of the .inc and .bb so the inc is just the
fetching and other common variables:

- Move HOMEPAGE to the .inc
- Move patches to the .bb
- Move the build exclusion to the .bb

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/systemtap/systemtap_5.6.bb  | 11 ++++++++++-
 meta/recipes-kernel/systemtap/systemtap_git.inc | 15 +++------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_5.6.bb b/meta/recipe=
s-kernel/systemtap/systemtap_5.6.bb
index f0b14ef90ac..b58bb1543b4 100644
--- a/meta/recipes-kernel/systemtap/systemtap_5.6.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_5.6.bb
@@ -2,11 +2,13 @@ SUMMARY =3D "Script-directed dynamic tracing and perfor=
mance analysis tool for Lin
 DESCRIPTION =3D "It provides free software infrastructure to simplify th=
e \
 gathering of information about the running Linux system. This assists \
 diagnosis of a performance or functional problem."
-HOMEPAGE =3D "https://sourceware.org/systemtap/"
=20
 require systemtap_git.inc
=20
 SRC_URI +=3D " \
+           file://0001-Do-not-let-configure-write-a-python-location-into=
-th.patch \
+           file://0001-staprun-stapbpf-don-t-support-installing-a-non-ro=
ot.patch \
+           file://readline.patch \
            file://0001-improve-reproducibility-for-c-compiling.patch \
            file://0001-staprun-address-ncurses-6.3-failures.patch \
            file://0001-python3.stpm-record-the-installed-libpython-path.=
patch \
@@ -112,3 +114,10 @@ BBCLASSEXTEND =3D "nativesdk"
 # Emits lot of warning which are treated as errors
 # They must be looked into before disabling
 TOOLCHAIN =3D "gcc"
+
+# systemtap can't be built without optimization, if someone tries to com=
pile an
+# entire image as -O0, break with fatal.
+python () {
+    if bb.utils.contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) =3D=
=3D "x":
+        bb.fatal("systemtap can't be built with -O0, using -O1 -Wno-erro=
r or -O1 instead.")
+}
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recip=
es-kernel/systemtap/systemtap_git.inc
index 9a12050e003..a725a15ec10 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,20 +1,11 @@
+HOMEPAGE =3D "https://sourceware.org/systemtap/"
+
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
-SRC_URI =3D "git://sourceware.org/git/systemtap.git;protocol=3Dhttps;bra=
nch=3Dmaster;tag=3Drelease-${PV} \
-           file://0001-Do-not-let-configure-write-a-python-location-into=
-th.patch \
-           file://0001-staprun-stapbpf-don-t-support-installing-a-non-ro=
ot.patch \
-           file://readline.patch \
-           "
+SRC_URI =3D "git://sourceware.org/git/systemtap.git;protocol=3Dhttps;bra=
nch=3Dmaster;tag=3Drelease-${PV}"
=20
 SRCREV =3D "211e84349504077f0c84f759601b02f946465d29"
=20
 COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|=
riscv64|riscv32).*-linux'
 COMPATIBLE_HOST:libc-musl =3D 'null'
-
-# systemtap can't be built without optimization, if someone tries to com=
pile an
-# entire image as -O0, break with fatal.
-python () {
-    if bb.utils.contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) =3D=
=3D "x":
-        bb.fatal("systemtap can't be built with -O0, using -O1 -Wno-erro=
r or -O1 instead.")
-}
--=20
2.43.0


