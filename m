Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id F3EC671989
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 20:46:46 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l132so10607384wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 13:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JXV1olxgQuL4ouGzmhTFqZYMjzLvPXdEoIzESEaD3TM=;
	b=eBFht9olIcRxL5UAjXwlV64zH9UUvPGr0DJ91UjQbpUkn/kWiyudEarF3MVkVvJaOu
	3EMWAYbiOfJTgacvoAnZLTC9lN0nyvrKcKZDwJWKCyZ1ZXxDN/5OxWLpj3lkwLHLs6Df
	XtQ5DZEE2US0UXdFB+wldp0QkkwBn9pD1kB7zYmtdV2v0ifp9CeLkLrRTYZuJRWpHggC
	O0URbyr0FQP2ln6R3kzWJyX6YtYMVZXRNhahNE6J9B5G16paz8EX9uBdSJaMzfdUzHjJ
	6T01zhuW12F6SMyyoZBo4R76ugeRbLw5N6jxv/7Nc5b7LzD+LBgaDVkqJ05HrWEVO3UB
	b78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JXV1olxgQuL4ouGzmhTFqZYMjzLvPXdEoIzESEaD3TM=;
	b=a+yZZyjeEmZkFnjH2AV+piolfhGiYUA1DoKmgQlg23Dz2lVTF5f7Cof2u5EwLMN/cI
	J+IxjlalIaGT1b4rrH6ofycMlFuGmzFuq2fVuwV9pfBOSXjxSsLK3DVneqZY2KHAwmJr
	3pyiS7qwOUrwFyjaUhAVfd8dC/Gy8L8FIJD3zaui5Y3c/aDc2guYiPJPdqHYdZXTD6vP
	j5a2ckQXPGOTduyR+xl7eeLHc7I9Aey6g6zu7OpjkyMZwIkBIbRiEhOG69gBTvNldj8S
	1rW0jpgQVgXNdTUg5ybxUbeMfaIf/nwefNKC/T+10oU6zayb3gZySy83YG+HqFWaKQbd
	JYhg==
X-Gm-Message-State: AE9vXwOuwVKgicvQxXNlMeXMrDK9B1NqP3myNpPE+PDB3ucfEzuj2+Wi0234PA4Ts/q4MA==
X-Received: by 10.28.191.14 with SMTP id p14mr5432567wmf.39.1474490807557;
	Wed, 21 Sep 2016 13:46:47 -0700 (PDT)
Received: from localhost.localdomain (p4FDF06F5.dip0.t-ipconnect.de.
	[79.223.6.245]) by smtp.googlemail.com with ESMTPSA id
	au10sm35299442wjc.12.2016.09.21.13.46.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Sep 2016 13:46:46 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2016 22:46:38 +0200
Message-Id: <1474490798-1507-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] libnewt: link whiptail properly with libnewt
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Sep 2016 20:46:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Configuration failed to detect gold as GNU linker. It was searching for
'GNU ld' but gold returns 'GNU gold (GNU Binutils 2.27.0.20160806) 1.12' which
does not match. When not linking by GNU linker Makefile did some magic link
target alignment:

ifneq ($(GNU_LD),)
SHLIBFLAGS= -Wl,--version-script,newt.0.52.ver -Wl,-soname,$(LIBNEWTSONAME)
else
SHLIBFLAGS=
endif

which caused:

| WARNING: libnewt-0.52.19-r0 do_package_qa: QA Issue: /usr/bin/whiptail contained in package whiptail requires libnewt.so, but no providers found in RDEPENDS_whiptail? [file-rdeps]

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../files/0001-detect-gold-as-GNU-linker-too.patch | 31 ++++++++++++++++++++++
 meta/recipes-extended/newt/libnewt_0.52.19.bb      |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/newt/files/0001-detect-gold-as-GNU-linker-too.patch

diff --git a/meta/recipes-extended/newt/files/0001-detect-gold-as-GNU-linker-too.patch b/meta/recipes-extended/newt/files/0001-detect-gold-as-GNU-linker-too.patch
new file mode 100644
index 0000000..a4b3afd
--- /dev/null
+++ b/meta/recipes-extended/newt/files/0001-detect-gold-as-GNU-linker-too.patch
@@ -0,0 +1,31 @@
+From 58245b859ffbcb1780575bf1b0a018d55e74e434 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 21 Sep 2016 21:14:40 +0200
+Subject: [PATCH] detect gold as GNU linker too
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 03e8bda..c2fce51 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -28,7 +28,7 @@ AC_CHECK_SIZEOF([void *])
+ AC_MSG_CHECKING([for GNU ld])
+ LD=`$CC -print-prog-name=ld 2>&5`
+ 
+-if test `$LD -v 2>&1 | $ac_cv_path_GREP -c "GNU ld"` = 0; then
++if test `$LD -v 2>&1 | $ac_cv_path_GREP -c "GNU "` = 0; then
+   # Not
+   GNU_LD=""
+   AC_MSG_RESULT([no])
+-- 
+2.5.5
+
diff --git a/meta/recipes-extended/newt/libnewt_0.52.19.bb b/meta/recipes-extended/newt/libnewt_0.52.19.bb
index 22bdaf5..a26ce1f 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.19.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.19.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://fedorahosted.org/releases/n/e/newt/newt-${PV}.tar.gz \
            file://cross_ar.patch \
            file://Makefile.in-Add-tinfo-library-to-the-linking-librari.patch \
            file://pie-flags.patch \
+           file://0001-detect-gold-as-GNU-linker-too.patch \
 "
 
 SRC_URI[md5sum] = "e4aa0f7943edd39c52481a87f68f412a"
-- 
2.5.5


