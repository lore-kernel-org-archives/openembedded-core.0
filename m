Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD96AE9E31E
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 14:52:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20722.1770821517506627597
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 06:51:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48FD1339
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 06:51:50 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 44E2D3F63F
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 06:51:56 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vim: fix race when installing the Swedish tutorial
Date: Wed, 11 Feb 2026 14:51:47 +0000
Message-ID: <20260211145147.3456921-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 14:52:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230992

A mkdir might not happen, resulting in an install failure.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...001-translation-sv-add-missing-mkdir.patch | 52 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/0001-translation-sv-ad=
d-missing-mkdir.patch

diff --git a/meta/recipes-support/vim/files/0001-translation-sv-add-missi=
ng-mkdir.patch b/meta/recipes-support/vim/files/0001-translation-sv-add-m=
issing-mkdir.patch
new file mode 100644
index 0000000000..37337c3d9d
--- /dev/null
+++ b/meta/recipes-support/vim/files/0001-translation-sv-add-missing-mkdi=
r.patch
@@ -0,0 +1,52 @@
+From 2dd7e39942f4f7740c3a645148521d3b6b443c41 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 11 Feb 2026 14:39:06 +0000
+Subject: [PATCH] translation(sv): add missing mkdir
+
+The installtutor target doesn't explicitly create the Swedish directory
+that it is going to put files into:
+
+  make[1]: Entering directory 'vim-9.1.2128/src'
+  /bin/sh install-sh -c -d DESTDIR/usr/share/vim/vim91
+  chmod 755 DESTDIR/usr/share/vim/vim91
+  /bin/sh install-sh -c -d DESTDIR/usr/share/vim/vim91/tutor/en
+  chmod 755 DESTDIR/usr/share/vim/vim91/tutor/en
+  /bin/sh install-sh -c -d DESTDIR/usr/share/vim/vim91/tutor/sr
+  chmod 755 DESTDIR/usr/share/vim/vim91/tutor/sr
+  /bin/sh install-sh -c -d DESTDIR/usr/share/vim/vim91/tutor/it
+  chmod 755 DESTDIR/usr/share/vim/vim91/tutor/it
+  /bin/sh install-sh -c -d DESTDIR/usr/share/vim/vim91/tutor/ru
+  chmod 755 DESTDIR/usr/share/vim/vim91/tutor/ru
+  cp ../runtime/tutor/README* ../runtime/tutor/tutor* DESTDIR/usr/share/=
vim/vim91/tutor
+  cp ../runtime/tutor/en/* DESTDIR/usr/share/vim/vim91/tutor/en/
+  cp ../runtime/tutor/it/* DESTDIR/usr/share/vim/vim91/tutor/it/
+  cp ../runtime/tutor/ru/* DESTDIR/usr/share/vim/vim91/tutor/ru/
+  cp ../runtime/tutor/sr/* DESTDIR/usr/share/vim/vim91/tutor/sr/
+  cp ../runtime/tutor/sv/* DESTDIR/usr/share/vim/vim91/tutor/sv/
+  cp: target 'DESTDIR/usr/share/vim/vim91/tutor/sv/': No such file or di=
rectory
+
+Add the missing dependency on $(DEST_TUTOR)/sv to ensure this directory
+is created.
+
+Upstream-Status: Submitted [https://github.com/vim/vim/pull/19385]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 75d8ff6c1c..b4c31bed60 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -2487,7 +2487,7 @@ installgtutorbin: $(DEST_BIN)
+ 	$(INSTALL_DATA) gvimtutor $(DEST_BIN)/$(GVIMNAME)tutor
+ 	chmod $(SCRIPTMOD) $(DEST_BIN)/$(GVIMNAME)tutor
+=20
+-installtutor: $(DEST_RT) $(DEST_TUTOR)/en $(DEST_TUTOR)/it $(DEST_TUTOR=
)/sr $(DEST_TUTOR)/ru
++installtutor: $(DEST_RT) $(DEST_TUTOR)/en $(DEST_TUTOR)/it $(DEST_TUTOR=
)/sr $(DEST_TUTOR)/sv $(DEST_TUTOR)/ru
+ 	-$(INSTALL_DATA) $(TUTORSOURCE)/README* $(TUTORSOURCE)/tutor* $(DEST_T=
UTOR)
+ 	-$(INSTALL_DATA) $(TUTORSOURCE)/en/* $(DEST_TUTOR)/en/
+ 	-$(INSTALL_DATA) $(TUTORSOURCE)/it/* $(DEST_TUTOR)/it/
+--=20
+2.43.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
index a9f0661f2a..cb106cba1d 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -16,6 +16,7 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmast=
er;protocol=3Dhttps;tag=3Dv${PV}
            file://disable_acl_header_check.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
+           file://0001-translation-sv-add-missing-mkdir.patch \
            "
=20
 PV .=3D ".2128"
--=20
2.43.0


