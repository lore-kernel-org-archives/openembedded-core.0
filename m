Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1245FE77174
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:50:12 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.8198.1733295006885468210
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:50:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dlra8Go4;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434a044dce2so78164485e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733295005; x=1733899805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJc5csVPgL3Qd+e441doY4TfaacqOENboyYzBVbs//M=;
        b=Dlra8Go4GO3TJ/PEjeZ5HvPiB5ArYRXySf94WT79ui1/MaNaI6+XK2bnPE/c6axYM+
         82yTxJfCb8eFnCCuQZCcWcYnD3E7cQJ7Mrhh96CPp+KH5PjjHQAGdj2b/AZITBmupPuT
         auKo6mRNbFPIXIIIytTeoqEPqKPaVp4sXi8PRXzRZcWfeRfRhfIum0BHRIgvcZclTyTH
         PmUBOwAuJAJ8qHlUsC3LixErOzCyd72E/TtZFGrAl25ai97GKTTDNKAa//x0rwjhdYRI
         GaZUZyHPLdA10V4iWuJPW7nfcHstqbolpiHLMqKiVp26scj5FidMRKdomK4uGmPyVBw6
         x1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733295005; x=1733899805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJc5csVPgL3Qd+e441doY4TfaacqOENboyYzBVbs//M=;
        b=o73+Uz69nfZOClccpRw3vc1gNgmucjbBxqjSycUUofoO3MwJwW4i9GmOWDehGyHPbl
         b4fcXfvAixaCdXOwBOUWGG+kUdCv9YGtDfXXLSy/UVka2llo5Fg3wpnM26B4sbu6fvqu
         upWv26RJw9zZmf/cXT4Sfwk6E0UIaDEkOCoKT2kd92eaPeBe9syZRZRO+k2f1rR5mIIV
         Y2ZeEadmzuHJkeaRveoxCNkyxDgBdWUzUWD90GIqLEyyAXX1MmLSlVZIJCTGn5hN9Z1f
         4AjhX4O79KjP8TeSnwCqj/wVJDRhGpTiVrKtJyXjMYKsdueBIAztjd9WHPnLiBCAP3Xx
         kxdg==
X-Gm-Message-State: AOJu0YxtP6CUmoi99jOExBp+86WwroSuuvr7OF4nhO7D0AuhOGhhPdbQ
	oDurWV2Y+TeUhW78ENK1zEGXITQnI97bnVdWC48drTIZUkKchUXMURKhfA==
X-Gm-Gg: ASbGncuVbIX3gzj2oqZ/Gz+tUeVNST15GmtMEYz3oyL6r7HI4JRi1cBmFsW0nejxFdU
	xhWa7IVG4M+s5PnYQuIIaAa2jdEjizCJRkwsyJ+u2m3T23FboJubErUqmq+vKjfMSQBZrCzBFYY
	TQg02jkdj/i7Qgd8+D4aSxhPhT/kQc/WPxznDmIO164lmUlTr7IE4SHY0j4BI5PVs5+1iVgpMlS
	YUyP0lXuTW5RWD96MBFJdFTx+hc+NmRO6EAePGNYjxuUosyDHEAiTKxd6UEtwk1eJlInkcTb6sQ
	jrFbxnEe1cA=
X-Google-Smtp-Source: AGHT+IFf9NOoQiTc+huiWICaMkuDxn0/dGEyfaGqOAcu/jRBB5D8MUH11OcwpSpZpuRFWkmEBUoPjQ==
X-Received: by 2002:a05:600c:4f03:b0:434:a852:ba77 with SMTP id 5b1f17b1804b1-434d09d0432mr50411405e9.15.1733295005133;
        Tue, 03 Dec 2024 22:50:05 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:50:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 37/37] rpm: replace use of rpm2cpio with rpm2archive
Date: Wed,  4 Dec 2024 07:49:20 +0100
Message-Id: <20241204064920.817016-37-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:50:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208266

From: Alexander Kanavin <alex@linutronix.de>

rpm2cpio has been deprecated upstream, so this prepares for its
eventual removal.

rpm2archive produces a tar archive which can be uncompressed
with tar executable from the host.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/testexport.bbclass      |  1 -
 meta/classes-recipe/testimage.bbclass       |  1 -
 meta/lib/oe/package_manager/rpm/__init__.py |  6 +++---
 meta/lib/oeqa/utils/testexport.py           | 10 +++++-----
 meta/recipes-devtools/rpm/rpm_4.20.0.bb     |  2 +-
 5 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/meta/classes-recipe/testexport.bbclass b/meta/classes-recipe/testexport.bbclass
index 76db4c625fa..cc4088c71a1 100644
--- a/meta/classes-recipe/testexport.bbclass
+++ b/meta/classes-recipe/testexport.bbclass
@@ -29,7 +29,6 @@ require conf/testexport.conf
 TEST_EXPORT_SDK_ENABLED ?= "0"
 
 TEST_EXPORT_DEPENDS = ""
-TEST_EXPORT_DEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-native:do_populate_sysroot', '', d)}"
 TEST_EXPORT_DEPENDS += "${@bb.utils.contains('TEST_EXPORT_SDK_ENABLED', '1', 'testexport-tarball:do_populate_sdk', '', d)}"
 TEST_EXPORT_LOCK = "${TMPDIR}/testimage.lock"
 
diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index c218372edb5..97ed4223c47 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -100,7 +100,6 @@ TESTIMAGE_BOOT_PATTERNS ?= ""
 
 TESTIMAGEDEPENDS = ""
 TESTIMAGEDEPENDS:append:qemuall = " qemu-native:do_populate_sysroot qemu-helper-native:do_populate_sysroot qemu-helper-native:do_addto_recipe_sysroot"
-TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'dnf-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'createrepo-c-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'ipk', 'opkg-utils-native:do_populate_sysroot package-index:do_package_index', '', d)}"
diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index f40c880af49..323ec5008fb 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -393,8 +393,8 @@ class RpmPM(PackageManager):
         # Strip file: prefix
         pkg_path = pkg_name[5:]
 
-        cpio_cmd = bb.utils.which(os.getenv("PATH"), "cpio")
-        rpm2cpio_cmd = bb.utils.which(os.getenv("PATH"), "rpm2cpio")
+        tar_cmd = bb.utils.which(os.getenv("PATH"), "tar")
+        rpm2archive_cmd = bb.utils.which(os.getenv("PATH"), "rpm2archive")
 
         if not os.path.isfile(pkg_path):
             bb.fatal("Unable to extract package for '%s'."
@@ -405,7 +405,7 @@ class RpmPM(PackageManager):
         os.chdir(tmp_dir)
 
         try:
-            cmd = "%s %s | %s -idmv" % (rpm2cpio_cmd, pkg_path, cpio_cmd)
+            cmd = "%s -n %s | %s xv" % (rpm2archive_cmd, pkg_path, tar_cmd)
             output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
         except subprocess.CalledProcessError as e:
             bb.utils.remove(tmp_dir, recurse=True)
diff --git a/meta/lib/oeqa/utils/testexport.py b/meta/lib/oeqa/utils/testexport.py
index e89d130a9c6..3ab024d9e99 100644
--- a/meta/lib/oeqa/utils/testexport.py
+++ b/meta/lib/oeqa/utils/testexport.py
@@ -60,17 +60,17 @@ def process_binaries(d, params):
     export_env = d.getVar("TEST_EXPORT_ONLY")
 
     def extract_binary(pth_to_pkg, dest_pth=None):
-        cpio_command = runCmd("which cpio")
-        rpm2cpio_command = runCmd("ls /usr/bin/rpm2cpio")
-        if (cpio_command.status != 0) and (rpm2cpio_command.status != 0):
-            bb.fatal("Either \"rpm2cpio\" or \"cpio\" tools are not available on your system."
+        tar_command = runCmd("which tar")
+        rpm2archive_command = runCmd("ls /usr/bin/rpm2archive")
+        if (tar_command.status != 0) and (rpm2archive_command.status != 0):
+            bb.fatal("Either \"rpm2archive\" or \"tar\" tools are not available on your system."
                     "All binaries extraction processes will not be available, crashing all related tests."
                     "Please install them according to your OS recommendations") # will exit here
         if dest_pth:
             os.chdir(dest_pth)
         else:
             os.chdir("%s" % os.sep)# this is for native package
-        extract_bin_command = runCmd("%s %s | %s -idm" % (rpm2cpio_command.output, pth_to_pkg, cpio_command.output)) # semi-hardcoded because of a bug on poky's rpm2cpio
+        extract_bin_command = runCmd("%s -n %s | %s xv" % (rpm2archive_command.output, pth_to_pkg, tar_command.output)) # semi-hardcoded because of a bug on poky's rpm2cpio
         return extract_bin_command
 
     if determine_if_poky_env(): # machine with poky environment
diff --git a/meta/recipes-devtools/rpm/rpm_4.20.0.bb b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
index ec4276d16ea..97483f7ddd5 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
@@ -61,7 +61,7 @@ OECMAKE_GENERATOR = "Unix Makefiles"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "archive"
 
 PACKAGECONFIG[plugins] = "-DENABLE_PLUGINS=ON,-DENABLE_PLUGINS=OFF"
 PACKAGECONFIG[testsuite] = "-DENABLE_TESTSUITE=ON,-DENABLE_TESTSUITE=OFF"
-- 
2.39.5


