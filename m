Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D32671A50
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 06:08:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6C68d6U027994
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 23:08:39 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 11 Jul 2018 23:08:38 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jul 2018 14:12:00 +0800
Message-ID: <ad8b4772465856e3ea1205bacbd4c3adf0b3a050.1531375710.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1531375709.git.Qi.Chen@windriver.com>
References: <cover.1531375709.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] systemd-boot: upgrade to 239
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
X-List-Received-Date: Thu, 12 Jul 2018 06:08:38 -0000
Content-Type: text/plain

Upgrade systemd-boot to 239.

The following patch is removed due to recent fix about meson's cpu family
mapping and validation.

  0001-Also-check-i386-i586-and-i686-for-ia32.patch

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../{systemd-boot_237.bb => systemd-boot_239.bb}   |  5 ++--
 ...01-Also-check-i386-i586-and-i686-for-ia32.patch | 28 ----------------------
 2 files changed, 2 insertions(+), 31 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_237.bb => systemd-boot_239.bb} (91%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-Also-check-i386-i586-and-i686-for-ia32.patch

diff --git a/meta/recipes-core/systemd/systemd-boot_237.bb b/meta/recipes-core/systemd/systemd-boot_239.bb
similarity index 91%
rename from meta/recipes-core/systemd/systemd-boot_237.bb
rename to meta/recipes-core/systemd/systemd-boot_239.bb
index afd3848..7fe420c 100644
--- a/meta/recipes-core/systemd/systemd-boot_237.bb
+++ b/meta/recipes-core/systemd/systemd-boot_239.bb
@@ -3,9 +3,8 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
 
 DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native"
 
-SRC_URI += "file://0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch \
-            file://0027-remove-nobody-user-group-checking.patch \
-            file://0001-Also-check-i386-i586-and-i686-for-ia32.patch \
+SRC_URI += "file://0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch \
+            file://0006-remove-nobody-user-group-checking.patch \
             file://0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch \
             "
 
diff --git a/meta/recipes-core/systemd/systemd/0001-Also-check-i386-i586-and-i686-for-ia32.patch b/meta/recipes-core/systemd/systemd/0001-Also-check-i386-i586-and-i686-for-ia32.patch
deleted file mode 100644
index 877bb1c..0000000
--- a/meta/recipes-core/systemd/systemd/0001-Also-check-i386-i586-and-i686-for-ia32.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 3e8c19bb1bbc4493c591f75c00c1fefe3b1c8a69 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Tue, 27 Feb 2018 20:42:41 -0800
-Subject: [PATCH] Also check i386, i586 and i686 for ia32
-
-Upstream-Status: Pending
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 28cb8b60e..489531a43 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1217,7 +1217,7 @@ conf.set10('SYSTEMD_SLOW_TESTS_DEFAULT', slow_tests)
- if get_option('efi')
-         efi_arch = host_machine.cpu_family()
- 
--        if efi_arch == 'x86'
-+        if efi_arch == 'x86' or efi_arch == 'i386' or efi_arch == 'i586' or efi_arch == 'i686'
-                 EFI_MACHINE_TYPE_NAME = 'ia32'
-                 gnu_efi_arch = 'ia32'
-         elif efi_arch == 'x86_64'
--- 
-2.13.0
-
-- 
1.9.1


