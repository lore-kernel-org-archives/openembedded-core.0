Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C3CC3F6B0
	for <webhook@archiver.kernel.org>; Sat,  6 Aug 2022 12:10:24 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.2558.1659787817539416870
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 05:10:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l91kPFPE;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id s13so2066477wmj.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 05:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=bQwVcmsP2lUsiF0zq8rD7V3y5dt7XlcIctR184//WPI=;
        b=l91kPFPE2pEe2Q2FKGDNDLO4n4YVyBt1eS4dlq47a9zwRoqLkzAXIysgGD2iJFu+ft
         jr3vkZqwSGzghWnJoN/7D7ZfLQBb9mS6lq05/PugI4hcNspzjv1651chlZkB8zR3Z9l9
         9ea8COFEezfZ6tnsfNax664PQWSoM0kkkZKWNLHM8oB5+aaOv0l5L9LXGeUzkmyglk2u
         gVQNmnzLhPIdByCyVITs56OW+IIOpltRs3zI+FMFzjgqYIL1fCCEou3feq3YrpIskRIh
         fyGNJGZcwyrZGctPSphoNVFF4IAeSOumOi27JSBoiwQ2B4BGAgPHd3Y8qYIuEcySQXwb
         UMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=bQwVcmsP2lUsiF0zq8rD7V3y5dt7XlcIctR184//WPI=;
        b=aGpMlbsXlRMjOi6vjMSrXGplu8XSQ5XGPjT90ogek71/eOL/dWlgeqDaWlRAwiWX61
         hy8WREdlxIPPosxZhqM/o7Qs16WNRJRtVADrXsp+aIerLKnUGBXiNU/7nk4w5LVQnmZ6
         xhRQ3S3xnk1H5jx9Ez6Ee/A7jMSiEBks/Q1Ew3isVBqtdEtB3tTJIcUvKiZLpoSEWvDX
         9t9aGMCYPIxNaWCJ4Cm6W3ga2l17dcf5SX+idaGVL3NsTDGAOyr6AsvlQ8DbnDV0w9BX
         6fQxRN9nCNx+7qAGhQr0IzGJqosxj+bqypCgKnTt8NbRx9SwSPqCi1mtExInvmal18EZ
         LzGA==
X-Gm-Message-State: ACgBeo2MJPT8wkVugzxjMMVzRrECwYY81GOJm0gr1gTjFKrbjzb3vU3m
	nvrJ/cyh4Lbi3aih1vRXradCBDmjLu4=
X-Google-Smtp-Source: 
 AA6agR6MFhWVPKENNy0feSUWBQ4E7E1k8Sw6bWakvIaeXFk2rv71NMcHg0KdTPNKdAP6ulE0cFJVnQ==
X-Received: by 2002:a05:600c:3485:b0:3a3:71cf:12ca with SMTP id
 a5-20020a05600c348500b003a371cf12camr7475731wmq.28.1659787815465;
        Sat, 06 Aug 2022 05:10:15 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 s20-20020a7bc394000000b003a4e5f85087sm7433225wmj.38.2022.08.06.05.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 05:10:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] syslinux: refresh patches with devtool
Date: Sat,  6 Aug 2022 14:09:39 +0200
Message-Id: <20220806120939.3750329-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220806120939.3750329-1-Martin.Jansa@gmail.com>
References: <20220806120939.3750329-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Aug 2022 12:10:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168972

* add git headers so that all can be applied with git am

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...nux-syslinux-support-ext2-3-4-device.patch | 15 +++++------
 ...inux-syslinux-implement-open_ext2_fs.patch | 21 +++++++--------
 ...x-syslinux-implement-install_to_ext2.patch | 13 ++++-----
 ...add-ext_file_read-and-ext_file_write.patch | 13 ++++-----
 ...syslinux-implement-handle_adv_on_ext.patch | 13 ++++-----
 ...mplement-write_to_ext-and-add-syslin.patch | 21 +++++++--------
 ...x-implement-ext_construct_sectmap_fs.patch | 13 ++++-----
 ...linuxext-implement-syslinux_patch_bo.patch | 11 +++-----
 ...syslinux-implement-install_bootblock.patch | 11 +++-----
 ...multiple-definition-of-symbol-errors.patch | 17 ++++++++++--
 ...on-t-install-obsolete-file-com32.ld.patch} |  7 ++---
 ...binstaller-Fix-build-with-glibc-2.36.patch |  2 +-
 .../syslinux/0013-remove-clean-script.patch   | 27 +++++++++++++++++++
 ... => 0014-Fix-reproducibility-issues.patch} | 18 ++++++++++---
 .../syslinux-remove-clean-script.patch        | 17 ------------
 .../syslinux/syslinux_6.04-pre2.bb            |  8 +++---
 16 files changed, 115 insertions(+), 112 deletions(-)
 rename meta/recipes-devtools/syslinux/syslinux/{0001-install-don-t-install-obsolete-file-com32.ld.patch => 0011-install-don-t-install-obsolete-file-com32.ld.patch} (88%)
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0013-remove-clean-script.patch
 rename meta/recipes-devtools/syslinux/syslinux/{determinism.patch => 0014-Fix-reproducibility-issues.patch} (60%)
 delete mode 100644 meta/recipes-devtools/syslinux/syslinux/syslinux-remove-clean-script.patch

diff --git a/meta/recipes-devtools/syslinux/syslinux/0001-linux-syslinux-support-ext2-3-4-device.patch b/meta/recipes-devtools/syslinux/syslinux/0001-linux-syslinux-support-ext2-3-4-device.patch
index 47a8dac10e..1a4a4e3755 100644
--- a/meta/recipes-devtools/syslinux/syslinux/0001-linux-syslinux-support-ext2-3-4-device.patch
+++ b/meta/recipes-devtools/syslinux/syslinux/0001-linux-syslinux-support-ext2-3-4-device.patch
@@ -1,7 +1,7 @@
-From 60f3833ab2b5899771b4eab654e88f9888b99501 Mon Sep 17 00:00:00 2001
+From a469ce05055c44fdca1ca094ff3a735cc059480d Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Wed, 31 Dec 2014 16:01:55 +0800
-Subject: [PATCH 1/9] linux/syslinux: support ext2/3/4 device
+Subject: [PATCH] linux/syslinux: support ext2/3/4 device
 
 * Support ext2/3/4 deivce.
 * The open_ext2_fs() checks whether it is an ext2/3/4 device,
@@ -19,10 +19,10 @@ Tested-by: Du Dolpher <dolpher.du@intel.com>
  1 file changed, 36 insertions(+)
 
 diff --git a/linux/syslinux.c b/linux/syslinux.c
-index 912de71..36fc202 100755
+index 46d5624..1cc276b 100755
 --- a/linux/syslinux.c
 +++ b/linux/syslinux.c
-@@ -256,6 +256,23 @@ int do_open_file(char *name)
+@@ -257,6 +257,23 @@ int do_open_file(char *name)
      return fd;
  }
  
@@ -46,7 +46,7 @@ index 912de71..36fc202 100755
  int main(int argc, char *argv[])
  {
      static unsigned char sectbuf[SECTOR_SIZE];
-@@ -313,6 +330,24 @@ int main(int argc, char *argv[])
+@@ -314,6 +331,24 @@ int main(int argc, char *argv[])
  	die("can't combine an offset with a block device");
      }
  
@@ -71,7 +71,7 @@ index 912de71..36fc202 100755
      xpread(dev_fd, sectbuf, SECTOR_SIZE, opt.offset);
      fsync(dev_fd);
  
-@@ -322,6 +357,7 @@ int main(int argc, char *argv[])
+@@ -323,6 +358,7 @@ int main(int argc, char *argv[])
       */
      if ((errmsg = syslinux_check_bootsect(sectbuf, &fs_type))) {
  	fprintf(stderr, "%s: %s\n", opt.device, errmsg);
@@ -79,6 +79,3 @@ index 912de71..36fc202 100755
  	exit(1);
      }
  
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/syslinux/syslinux/0002-linux-syslinux-implement-open_ext2_fs.patch b/meta/recipes-devtools/syslinux/syslinux/0002-linux-syslinux-implement-open_ext2_fs.patch
index 77cf060451..1acd9b0b69 100644
--- a/meta/recipes-devtools/syslinux/syslinux/0002-linux-syslinux-implement-open_ext2_fs.patch
+++ b/meta/recipes-devtools/syslinux/syslinux/0002-linux-syslinux-implement-open_ext2_fs.patch
@@ -1,7 +1,7 @@
-From 07fb737fb60c08eaaa41989d531fc23009523546 Mon Sep 17 00:00:00 2001
+From c6ddb179577dd4c4ea4d1d154f979e90e53d6bf1 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Wed, 31 Dec 2014 16:09:18 +0800
-Subject: [PATCH 2/9] linux/syslinux: implement open_ext2_fs()
+Subject: [PATCH] linux/syslinux: implement open_ext2_fs()
 
 The open_ext2_fs() checks whether it is an ext2/ext3/ext4 device, and
 return:
@@ -15,14 +15,14 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Tested-by: Du Dolpher <dolpher.du@intel.com>
 ---
  linux/Makefile   |  2 +-
- linux/syslinux.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ linux/syslinux.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++++
  2 files changed, 81 insertions(+), 1 deletion(-)
 
 diff --git a/linux/Makefile b/linux/Makefile
-index 11667e1..ac1ac58 100644
+index 5a49d81..67cbbb4 100644
 --- a/linux/Makefile
 +++ b/linux/Makefile
-@@ -51,7 +51,7 @@ spotless: clean
+@@ -52,7 +52,7 @@ spotless: clean
  installer: syslinux syslinux-nomtools
  
  syslinux: $(OBJS)
@@ -32,10 +32,10 @@ index 11667e1..ac1ac58 100644
  syslinux-nomtools: syslinux
  	ln -f $< $@
 diff --git a/linux/syslinux.c b/linux/syslinux.c
-index 36fc202..cc4e7da 100755
+index 1cc276b..f3727ea 100755
 --- a/linux/syslinux.c
 +++ b/linux/syslinux.c
-@@ -72,6 +72,7 @@
+@@ -73,6 +73,7 @@
  #include "syslxfs.h"
  #include "setadv.h"
  #include "syslxopt.h" /* unified options */
@@ -43,7 +43,7 @@ index 36fc202..cc4e7da 100755
  
  extern const char *program;	/* Name of program */
  
-@@ -82,6 +83,9 @@ char *mntpath = NULL;		/* Path on which to mount */
+@@ -83,6 +84,9 @@ char *mntpath = NULL;		/* Path on which to mount */
  int loop_fd = -1;		/* Loop device */
  #endif
  
@@ -53,7 +53,7 @@ index 36fc202..cc4e7da 100755
  void __attribute__ ((noreturn)) die(const char *msg)
  {
      fprintf(stderr, "%s: %s\n", program, msg);
-@@ -266,6 +270,82 @@ int do_open_file(char *name)
+@@ -267,6 +271,82 @@ int do_open_file(char *name)
   */
  static int open_ext2_fs(const char *device, const char *subdir)
  {
@@ -136,6 +136,3 @@ index 36fc202..cc4e7da 100755
  }
  
  /* The install func for ext2, ext3 and ext4 */
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/syslinux/syslinux/0003-linux-syslinux-implement-install_to_ext2.patch b/meta/recipes-devtools/syslinux/syslinux/0003-linux-syslinux-implement-install_to_ext2.patch
index 84ba10526a..8d2fef2d49 100644
--- a/meta/recipes-devtools/syslinux/syslinux/0003-linux-syslinux-implement-install_to_ext2.patch
+++ b/meta/recipes-devtools/syslinux/syslinux/0003-linux-syslinux-implement-install_to_ext2.patch
@@ -1,7 +1,7 @@
-From 64d856b243812907068776b204a003a3a8fa122a Mon Sep 17 00:00:00 2001
+From 9110cf47d04ca1958d14228908a5c57a23769e7d Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Wed, 31 Dec 2014 16:17:42 +0800
-Subject: [PATCH 3/9] linux/syslinux: implement install_to_ext2()
+Subject: [PATCH] linux/syslinux: implement install_to_ext2()
 
 * The handle_adv_on_ext() checks whether we only need update adv.
 * The write_to_ext() installs files (ldlinux.sys or ldlinux.c32) to the
@@ -13,14 +13,14 @@ Upstream-Status: Submitted
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Tested-by: Du Dolpher <dolpher.du@intel.com>
 ---
- linux/syslinux.c | 79 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ linux/syslinux.c | 79 ++++++++++++++++++++++++++++++++++++++++++++++++
  1 file changed, 79 insertions(+)
 
 diff --git a/linux/syslinux.c b/linux/syslinux.c
-index cc4e7da..45f080d 100755
+index f3727ea..fc5edb1 100755
 --- a/linux/syslinux.c
 +++ b/linux/syslinux.c
-@@ -346,11 +346,90 @@ static int open_ext2_fs(const char *device, const char *subdir)
+@@ -347,11 +347,90 @@ static int open_ext2_fs(const char *device, const char *subdir)
  fail:
      (void) ext2fs_close(e2fs);
      return -1;
@@ -111,6 +111,3 @@ index cc4e7da..45f080d 100755
  }
  
  int main(int argc, char *argv[])
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/syslinux/syslinux/0004-linux-syslinux-add-ext_file_read-and-ext_file_write.patch b/meta/recipes-devtools/syslinux/syslinux/0004-linux-syslinux-add-ext_file_read-and-ext_file_write.patch
index 64b56d92e0..0a32969154 100644
--- a/meta/recipes-devtools/syslinux/syslinux/0004-linux-syslinux-add-ext_file_read-and-ext_file_write.patch
+++ b/meta/recipes-devtools/syslinux/syslinux/0004-linux-syslinux-add-ext_file_read-and-ext_file_write.patch
@@ -1,7 +1,7 @@
-From 35d3842cc4b930c5102eed2921e0189b7f4fd069 Mon Sep 17 00:00:00 2001
+From 1957fc6c069493c6789557936adb675f5e7e51ba Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Wed, 31 Dec 2014 16:43:37 +0800
-Subject: [PATCH 4/9] linux/syslinux: add ext_file_read() and ext_file_write()
+Subject: [PATCH] linux/syslinux: add ext_file_read() and ext_file_write()
 
 Will use them to read and write on the extX device.
 
@@ -10,14 +10,14 @@ Upstream-Status: Submitted
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Tested-by: Du Dolpher <dolpher.du@intel.com>
 ---
- linux/syslinux.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ linux/syslinux.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++++
  1 file changed, 62 insertions(+)
 
 diff --git a/linux/syslinux.c b/linux/syslinux.c
-index 45f080d..247c86a 100755
+index fc5edb1..c7c1994 100755
 --- a/linux/syslinux.c
 +++ b/linux/syslinux.c
-@@ -349,6 +349,68 @@ fail:
+@@ -350,6 +350,68 @@ fail:
  
  }
  
@@ -86,6 +86,3 @@ index 45f080d..247c86a 100755
  /*
   * Install the boot block on the specified device.
   * Must be run AFTER file installed.
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/syslinux/syslinux/0005-linux-syslinux-implement-handle_adv_on_ext.patch b/meta/recipes-devtools/syslinux/syslinux/0005-linux-syslinux-implement-handle_adv_on_ext.patch
index 829e7c4ca1..76885f762b 100644
--- a/meta/recipes-devtools/syslinux/syslinux/0005-linux-syslinux-implement-handle_adv_on_ext.patch
+++ b/meta/recipes-devtools/syslinux/syslinux/0005-linux-syslinux-implement-handle_adv_on_ext.patch
@@ -1,7 +1,7 @@
-From cdb980b37f40dc2c41891434c7736e49da53756e Mon Sep 17 00:00:00 2001
+From ee3a60829edc9d3344dc872fb0158e7b006f02be Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Wed, 31 Dec 2014 16:47:52 +0800
-Subject: [PATCH 5/9] linux/syslinux: implement handle_adv_on_ext()
+Subject: [PATCH] linux/syslinux: implement handle_adv_on_ext()
 
 It reads adv if found on the device, or resets syslinux_adv, or update
 the adv if update adv only.
@@ -11,14 +11,14 @@ Upstream-Status: Submitted
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Tested-by: Du Dolpher <dolpher.du@intel.com>
 ---
- linux/syslinux.c | 97 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ linux/syslinux.c | 97 ++++++++++++++++++++++++++++++++++++++++++++++++
  1 file changed, 97 insertions(+)
 
 diff --git a/linux/syslinux.c b/linux/syslinux.c
-index 247c86a..de5d272 100755
+index c7c1994..90b8edd 100755
 --- a/linux/syslinux.c
 +++ b/linux/syslinux.c
-@@ -421,6 +421,103 @@ int install_bootblock(int fd, const char *device)
+@@ -422,6 +422,103 @@ int install_bootblock(int fd, const char *device)
  
  static int handle_adv_on_ext(void)
  {
@@ -122,6 +122,3 @@ index 247c86a..de5d272 100755
  }
  
  /* Write files, adv, boot sector */
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/syslinux/syslinux/0006-linux-syslinux-implement-write_to_ext-and-add-syslin.patch b/meta/recipes-devtools/syslinux/syslinux/0006-linux-syslinux-implement-write_to_ext-and-add-syslin.patch
index cba87252a5..ba6d29d3bb 100644
--- a/meta/recipes-devtools/syslinux/syslinux/0006-linux-syslinux-implement-write_to_ext-and-add-syslin.patch
+++ b/meta/recipes-devtools/syslinux/syslinux/0006-linux-syslinux-implement-write_to_ext-and-add-syslin.patch
@@ -1,7 +1,7 @@
-From 922e56c10e36d876777580c84daef9a66bea6525 Mon Sep 17 00:00:00 2001
+From 758731ce2432ab29a73505bbeb99a960996ab686 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Wed, 31 Dec 2014 17:20:43 +0800
-Subject: [PATCH 6/9] linux/syslinux: implement write_to_ext() and add
+Subject: [PATCH] linux/syslinux: implement write_to_ext() and add
  syslinuxext.c
 
 * The write_to_ext() write file to the extX device, and handle the boot
@@ -17,7 +17,7 @@ Tested-by: Du Dolpher <dolpher.du@intel.com>
  libinstaller/syslinuxext.c |   7 +++
  libinstaller/syslinuxext.h |   5 ++
  linux/Makefile             |   3 +-
- linux/syslinux.c           | 118 +++++++++++++++++++++++++++++++++++++++++++++
+ linux/syslinux.c           | 118 +++++++++++++++++++++++++++++++++++++
  4 files changed, 132 insertions(+), 1 deletion(-)
  create mode 100644 libinstaller/syslinuxext.c
  create mode 100644 libinstaller/syslinuxext.h
@@ -47,10 +47,10 @@ index 0000000..8abd8b9
 +
 +void syslinux_patch_bootsect(int dev_fd);
 diff --git a/linux/Makefile b/linux/Makefile
-index ac1ac58..3b23867 100644
+index 67cbbb4..567134c 100644
 --- a/linux/Makefile
 +++ b/linux/Makefile
-@@ -30,7 +30,8 @@ SRCS     = syslinux.c \
+@@ -31,7 +31,8 @@ SRCS     = syslinux.c \
             ../libinstaller/syslxmod.c \
  	   ../libinstaller/bootsect_bin.c \
  	   ../libinstaller/ldlinuxc32_bin.c \
@@ -61,7 +61,7 @@ index ac1ac58..3b23867 100644
  
  .SUFFIXES: .c .o .i .s .S
 diff --git a/linux/syslinux.c b/linux/syslinux.c
-index de5d272..f0c97a8 100755
+index 90b8edd..7a20fe6 100755
 --- a/linux/syslinux.c
 +++ b/linux/syslinux.c
 @@ -46,6 +46,7 @@
@@ -72,7 +72,7 @@ index de5d272..f0c97a8 100755
  
  #include "linuxioctl.h"
  
-@@ -72,6 +73,7 @@
+@@ -73,6 +74,7 @@
  #include "syslxfs.h"
  #include "setadv.h"
  #include "syslxopt.h" /* unified options */
@@ -80,7 +80,7 @@ index de5d272..f0c97a8 100755
  #include <ext2fs/ext2fs.h>
  
  extern const char *program;	/* Name of program */
-@@ -419,6 +421,12 @@ int install_bootblock(int fd, const char *device)
+@@ -420,6 +422,12 @@ int install_bootblock(int fd, const char *device)
  {
  }
  
@@ -93,7 +93,7 @@ index de5d272..f0c97a8 100755
  static int handle_adv_on_ext(void)
  {
      int                 i, retval, found_file;
-@@ -524,6 +532,116 @@ fail:
+@@ -525,6 +533,116 @@ fail:
  static int write_to_ext(const char *filename, const char *str, int length,
                          int i_flags, int dev_fd, const char *subdir)
  {
@@ -210,6 +210,3 @@ index de5d272..f0c97a8 100755
  }
  
  /* The install func for ext2, ext3 and ext4 */
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/syslinux/syslinux/0007-linux-syslinux-implement-ext_construct_sectmap_fs.patch b/meta/recipes-devtools/syslinux/syslinux/0007-linux-syslinux-implement-ext_construct_sectmap_fs.patch
index 3913811917..57cdaf437b 100644
--- a/meta/recipes-devtools/syslinux/syslinux/0007-linux-syslinux-implement-ext_construct_sectmap_fs.patch
+++ b/meta/recipes-devtools/syslinux/syslinux/0007-linux-syslinux-implement-ext_construct_sectmap_fs.patch
@@ -1,7 +1,7 @@
-From a95b831e18dd123f859bc5e6c4cecdcc0184ee37 Mon Sep 17 00:00:00 2001
+From 906205015601d5d1190e7326f51ea4316a74a479 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Fri, 2 Jan 2015 12:18:02 +0800
-Subject: [PATCH 7/9] linux/syslinux: implement ext_construct_sectmap_fs()
+Subject: [PATCH] linux/syslinux: implement ext_construct_sectmap_fs()
 
 The ext_construct_sectmap_fs() constucts the sector according to the
 bmap.
@@ -11,14 +11,14 @@ Upstream-Status: Submitted
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Tested-by: Du Dolpher <dolpher.du@intel.com>
 ---
- linux/syslinux.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ linux/syslinux.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++
  1 file changed, 50 insertions(+)
 
 diff --git a/linux/syslinux.c b/linux/syslinux.c
-index f0c97a8..c741750 100755
+index 7a20fe6..4e43921 100755
 --- a/linux/syslinux.c
 +++ b/linux/syslinux.c
-@@ -421,10 +421,60 @@ int install_bootblock(int fd, const char *device)
+@@ -422,10 +422,60 @@ int install_bootblock(int fd, const char *device)
  {
  }
  
@@ -79,6 +79,3 @@ index f0c97a8..c741750 100755
  }
  
  static int handle_adv_on_ext(void)
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/syslinux/syslinux/0008-libinstaller-syslinuxext-implement-syslinux_patch_bo.patch b/meta/recipes-devtools/syslinux/syslinux/0008-libinstaller-syslinuxext-implement-syslinux_patch_bo.patch
index f1d01fa43c..b026eba5ad 100644
--- a/meta/recipes-devtools/syslinux/syslinux/0008-libinstaller-syslinuxext-implement-syslinux_patch_bo.patch
+++ b/meta/recipes-devtools/syslinux/syslinux/0008-libinstaller-syslinuxext-implement-syslinux_patch_bo.patch
@@ -1,4 +1,4 @@
-From efce87e5ab98664c57e5f4e3955a2f3747df5737 Mon Sep 17 00:00:00 2001
+From acfc8214d3d60b7e251ae66a59b81cdd1ff7a6dc Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Fri, 2 Jan 2015 12:26:46 +0800
 Subject: [PATCH] libinstaller/syslinuxext: implement syslinux_patch_bootsect()
@@ -22,7 +22,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  3 files changed, 176 insertions(+), 165 deletions(-)
 
 diff --git a/extlinux/Makefile b/extlinux/Makefile
-index 1721ee54..62a49728 100644
+index 1721ee5..62a4972 100644
 --- a/extlinux/Makefile
 +++ b/extlinux/Makefile
 @@ -32,7 +32,8 @@ SRCS     = main.c \
@@ -36,7 +36,7 @@ index 1721ee54..62a49728 100644
  
  .SUFFIXES: .c .o .i .s .S
 diff --git a/extlinux/main.c b/extlinux/main.c
-index ebff7eae..9add50fb 100644
+index ebff7ea..9add50f 100644
 --- a/extlinux/main.c
 +++ b/extlinux/main.c
 @@ -62,6 +62,7 @@
@@ -244,7 +244,7 @@ index ebff7eae..9add50fb 100644
      /* Construct the boot file map */
  
 diff --git a/libinstaller/syslinuxext.c b/libinstaller/syslinuxext.c
-index bb54cefc..9ae82884 100644
+index bb54cef..9ae8288 100644
 --- a/libinstaller/syslinuxext.c
 +++ b/libinstaller/syslinuxext.c
 @@ -1,7 +1,178 @@
@@ -426,6 +426,3 @@ index bb54cefc..9ae82884 100644
 +    set_32(&sbs->bsHiddenSecs, geo.start);
  }
  
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/syslinux/syslinux/0009-linux-syslinux-implement-install_bootblock.patch b/meta/recipes-devtools/syslinux/syslinux/0009-linux-syslinux-implement-install_bootblock.patch
index cd89d92485..1c875e81f6 100644
--- a/meta/recipes-devtools/syslinux/syslinux/0009-linux-syslinux-implement-install_bootblock.patch
+++ b/meta/recipes-devtools/syslinux/syslinux/0009-linux-syslinux-implement-install_bootblock.patch
@@ -1,7 +1,7 @@
-From 76c465e87312dbc6cffd05427f1f4d2ebdee4f13 Mon Sep 17 00:00:00 2001
+From c28aae8bd381f77e66e6bac79761df7a484b054c Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Fri, 2 Jan 2015 12:28:35 +0800
-Subject: [PATCH 9/9] linux/syslinux: implement install_bootblock()
+Subject: [PATCH] linux/syslinux: implement install_bootblock()
 
 Refer to the install_bootblock() in extlinux/main.c to make
 linux/syslinux.c's install_bootblock() which only supports ext2/3/4.
@@ -15,10 +15,10 @@ Tested-by: Du Dolpher <dolpher.du@intel.com>
  1 file changed, 20 insertions(+)
 
 diff --git a/linux/syslinux.c b/linux/syslinux.c
-index c741750..917f83a 100755
+index 4e43921..93ed880 100755
 --- a/linux/syslinux.c
 +++ b/linux/syslinux.c
-@@ -419,6 +419,26 @@ static int ext_file_write(ext2_file_t e2_file, const void *buf, size_t count,
+@@ -420,6 +420,26 @@ static int ext_file_write(ext2_file_t e2_file, const void *buf, size_t count,
   */
  int install_bootblock(int fd, const char *device)
  {
@@ -45,6 +45,3 @@ index c741750..917f83a 100755
  }
  
  /* The file's block count */
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/syslinux/syslinux/0010-Workaround-multiple-definition-of-symbol-errors.patch b/meta/recipes-devtools/syslinux/syslinux/0010-Workaround-multiple-definition-of-symbol-errors.patch
index 44cb153276..3665af9c49 100644
--- a/meta/recipes-devtools/syslinux/syslinux/0010-Workaround-multiple-definition-of-symbol-errors.patch
+++ b/meta/recipes-devtools/syslinux/syslinux/0010-Workaround-multiple-definition-of-symbol-errors.patch
@@ -1,4 +1,4 @@
-From 951928f2cad5682c2844e6bd0f7201236c5d9b66 Mon Sep 17 00:00:00 2001
+From f2a5b64785958226c022cac9931b059b98f4e896 Mon Sep 17 00:00:00 2001
 From: Merlin Mathesius <mmathesi@redhat.com>
 Date: Wed, 13 May 2020 08:02:27 -0500
 Subject: [PATCH] Workaround multiple definition of symbol errors
@@ -7,7 +7,6 @@ Lifted from Fedora https://src.fedoraproject.org/rpms/syslinux/blob/master/f/000
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  com32/cmenu/Makefile           | 2 +-
  com32/elflink/ldlinux/Makefile | 2 +-
@@ -18,6 +17,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  efi/Makefile                   | 2 +-
  7 files changed, 7 insertions(+), 7 deletions(-)
 
+diff --git a/com32/cmenu/Makefile b/com32/cmenu/Makefile
+index b81b68e..2ae989c 100644
 --- a/com32/cmenu/Makefile
 +++ b/com32/cmenu/Makefile
 @@ -49,7 +49,7 @@ makeoutputdirs:
@@ -29,6 +30,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  		-o $@ $^
  
  tidy dist:
+diff --git a/com32/elflink/ldlinux/Makefile b/com32/elflink/ldlinux/Makefile
+index 87c0d36..2be2a01 100644
 --- a/com32/elflink/ldlinux/Makefile
 +++ b/com32/elflink/ldlinux/Makefile
 @@ -33,7 +33,7 @@ endif
@@ -40,6 +43,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  LNXCFLAGS += -D__export='__attribute__((visibility("default")))'
  LNXLIBOBJS = get_key.lo
+diff --git a/com32/gpllib/Makefile b/com32/gpllib/Makefile
+index 1fec914..2d764d0 100644
 --- a/com32/gpllib/Makefile
 +++ b/com32/gpllib/Makefile
 @@ -24,7 +24,7 @@ makeoutputdirs:
@@ -51,6 +56,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  tidy dist clean:
  	find . \( -name \*.o -o -name .\*.d -o -name \*.tmp \) -print0 | \
+diff --git a/com32/hdt/Makefile b/com32/hdt/Makefile
+index 61736d0..1d94785 100644
 --- a/com32/hdt/Makefile
 +++ b/com32/hdt/Makefile
 @@ -52,7 +52,7 @@ QEMU			?= qemu-kvm
@@ -62,6 +69,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  memtest:
  	-[ ! -f $(FLOPPY_DIR)/$(MEMTEST) ] && $(WGET) $(MEMTEST_URL) -O $(FLOPPY_DIR)/$(MEMTEST)
+diff --git a/core/Makefile b/core/Makefile
+index 50ff35a..f0a5562 100644
 --- a/core/Makefile
 +++ b/core/Makefile
 @@ -156,7 +156,7 @@ LDSCRIPT = $(SRC)/$(ARCH)/syslinux.ld
@@ -73,6 +82,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  		-T $(LDSCRIPT) \
  		--unresolved-symbols=report-all \
  		-E --hash-style=gnu -M -o $@ $< \
+diff --git a/dos/Makefile b/dos/Makefile
+index 4c930d1..5d1c72c 100644
 --- a/dos/Makefile
 +++ b/dos/Makefile
 @@ -19,7 +19,7 @@ include $(MAKEDIR)/embedded.mk
@@ -84,6 +95,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  OPTFLAGS = -g
  INCLUDES = -include code16.h -nostdinc -iwithprefix include \
  	   -I$(SRC) -I$(SRC)/.. -I$(SRC)/../libfat \
+diff --git a/efi/Makefile b/efi/Makefile
+index f4501e7..72e081e 100644
 --- a/efi/Makefile
 +++ b/efi/Makefile
 @@ -71,7 +71,7 @@ $(OBJS): | $(OBJ)/$(ARCH)
diff --git a/meta/recipes-devtools/syslinux/syslinux/0001-install-don-t-install-obsolete-file-com32.ld.patch b/meta/recipes-devtools/syslinux/syslinux/0011-install-don-t-install-obsolete-file-com32.ld.patch
similarity index 88%
rename from meta/recipes-devtools/syslinux/syslinux/0001-install-don-t-install-obsolete-file-com32.ld.patch
rename to meta/recipes-devtools/syslinux/syslinux/0011-install-don-t-install-obsolete-file-com32.ld.patch
index bfd7f41b13..4bc423a1de 100644
--- a/meta/recipes-devtools/syslinux/syslinux/0001-install-don-t-install-obsolete-file-com32.ld.patch
+++ b/meta/recipes-devtools/syslinux/syslinux/0011-install-don-t-install-obsolete-file-com32.ld.patch
@@ -1,4 +1,4 @@
-From bf6db5b48ec25f83939f1fdebb59028bc3c40b00 Mon Sep 17 00:00:00 2001
+From 66447f7c5c6996481ebd68ce8224d3de7525aad8 Mon Sep 17 00:00:00 2001
 From: "H. Peter Anvin (Intel)" <hpa@zytor.com>
 Date: Wed, 6 Feb 2019 11:30:51 -0800
 Subject: [PATCH] install: don't install obsolete file com32.ld
@@ -16,7 +16,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/com32/lib/Makefile b/com32/lib/Makefile
-index 74fff149..6a931492 100644
+index 74fff14..6a93149 100644
 --- a/com32/lib/Makefile
 +++ b/com32/lib/Makefile
 @@ -113,7 +113,6 @@ spotless: clean
@@ -27,6 +27,3 @@ index 74fff149..6a931492 100644
  	-rm -rf $(INSTALLROOT)$(COM32DIR)/include
  	cp -r $(SRC)/../include $(INSTALLROOT)$(COM32DIR)
  
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/syslinux/syslinux/0012-libinstaller-Fix-build-with-glibc-2.36.patch b/meta/recipes-devtools/syslinux/syslinux/0012-libinstaller-Fix-build-with-glibc-2.36.patch
index 69fea47088..cdd170d856 100644
--- a/meta/recipes-devtools/syslinux/syslinux/0012-libinstaller-Fix-build-with-glibc-2.36.patch
+++ b/meta/recipes-devtools/syslinux/syslinux/0012-libinstaller-Fix-build-with-glibc-2.36.patch
@@ -1,4 +1,4 @@
-From 0c4f97b2dd22365d32b865dd002282e454a7edf0 Mon Sep 17 00:00:00 2001
+From 821d31148c07a8318277be32bc6a943c7fd2ba3f Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Aug 2022 11:53:55 +0000
 Subject: [PATCH] libinstaller: Fix build with glibc-2.36
diff --git a/meta/recipes-devtools/syslinux/syslinux/0013-remove-clean-script.patch b/meta/recipes-devtools/syslinux/syslinux/0013-remove-clean-script.patch
new file mode 100644
index 0000000000..c0af7eff86
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/syslinux/0013-remove-clean-script.patch
@@ -0,0 +1,27 @@
+From a11c8f88de6b6c42c805ba76e70532977bfd24bf Mon Sep 17 00:00:00 2001
+From: Saul Wold <sgw@linux.intel.com>
+Date: Wed, 10 Dec 2014 10:26:33 -0800
+Subject: [PATCH] remove clean script
+
+This script try to call git submodule, since we are downloading
+the tarball it seems in-correct to do this.
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ efi/Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/efi/Makefile b/efi/Makefile
+index 72e081e..3cfb3f6 100644
+--- a/efi/Makefile
++++ b/efi/Makefile
+@@ -102,7 +102,6 @@ tidy dist:
+ 	rm -f *.so *.o wrapper
+ 	find . \( -name \*.o -o -name \*.a -o -name .\*.d -o -name \*.tmp \) -print0 | \
+ 		xargs -0r rm -f
+-	$(topdir)/efi/clean-gnu-efi.sh $(EFI_SUBARCH) $(objdir)
+ 
+ clean: tidy
+ 
diff --git a/meta/recipes-devtools/syslinux/syslinux/determinism.patch b/meta/recipes-devtools/syslinux/syslinux/0014-Fix-reproducibility-issues.patch
similarity index 60%
rename from meta/recipes-devtools/syslinux/syslinux/determinism.patch
rename to meta/recipes-devtools/syslinux/syslinux/0014-Fix-reproducibility-issues.patch
index 2fb8c64df3..372b2a5ff5 100644
--- a/meta/recipes-devtools/syslinux/syslinux/determinism.patch
+++ b/meta/recipes-devtools/syslinux/syslinux/0014-Fix-reproducibility-issues.patch
@@ -1,3 +1,8 @@
+From e49e86bd3199f51ada8a4a1d51aa8d627645279e Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Sat, 27 Feb 2021 23:42:03 +0000
+Subject: [PATCH] Fix reproducibility issues
+
 In order to build deterministic binaries, we need to sort the wildcard expansion
 so the libraries are linked in the same order each time. This fixes reproducibility
 issues within syslinux builds.
@@ -5,10 +10,15 @@ issues within syslinux builds.
 Upstream-Status: Pending
 RP 2021/3/1
 
-Index: syslinux-6.04-pre2/mk/lib.mk
-===================================================================
---- syslinux-6.04-pre2.orig/mk/lib.mk
-+++ syslinux-6.04-pre2/mk/lib.mk
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ mk/lib.mk | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/mk/lib.mk b/mk/lib.mk
+index f3fb07c..815698c 100644
+--- a/mk/lib.mk
++++ b/mk/lib.mk
 @@ -130,8 +130,8 @@ LIBENTRY_OBJS = \
  	exit.o
  
diff --git a/meta/recipes-devtools/syslinux/syslinux/syslinux-remove-clean-script.patch b/meta/recipes-devtools/syslinux/syslinux/syslinux-remove-clean-script.patch
deleted file mode 100644
index 7c003e165b..0000000000
--- a/meta/recipes-devtools/syslinux/syslinux/syslinux-remove-clean-script.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-This script try to call git submodule, since we are downloading
-the tarball it seems in-correct to do this.
-
-Upstream-Status: Inappropriate [OE-Specific]
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-Index: syslinux-6.03/efi/Makefile
-===================================================================
---- syslinux-6.03.orig/efi/Makefile
-+++ syslinux-6.03/efi/Makefile
-@@ -101,7 +101,6 @@ tidy dist:
- 	rm -f *.so *.o wrapper
- 	find . \( -name \*.o -o -name \*.a -o -name .\*.d -o -name \*.tmp \) -print0 | \
- 		xargs -0r rm -f
--	$(topdir)/efi/clean-gnu-efi.sh $(EFI_SUBARCH) $(objdir)
- 
- clean: tidy
- 
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index d8dac8ccf9..5604901592 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 DEPENDS = "nasm-native util-linux e2fsprogs"
 
 SRC_URI = "https://www.zytor.com/pub/syslinux/Testing/6.04/syslinux-${PV}.tar.xz \
-           file://syslinux-remove-clean-script.patch \
            file://0001-linux-syslinux-support-ext2-3-4-device.patch \
            file://0002-linux-syslinux-implement-open_ext2_fs.patch \
            file://0003-linux-syslinux-implement-install_to_ext2.patch \
@@ -19,10 +18,11 @@ SRC_URI = "https://www.zytor.com/pub/syslinux/Testing/6.04/syslinux-${PV}.tar.xz
            file://0008-libinstaller-syslinuxext-implement-syslinux_patch_bo.patch \
            file://0009-linux-syslinux-implement-install_bootblock.patch \
            file://0010-Workaround-multiple-definition-of-symbol-errors.patch \
-           file://0001-install-don-t-install-obsolete-file-com32.ld.patch \
+           file://0011-install-don-t-install-obsolete-file-com32.ld.patch \
            file://0012-libinstaller-Fix-build-with-glibc-2.36.patch \
-           file://determinism.patch \
-           "
+           file://0013-remove-clean-script.patch \
+           file://0014-Fix-reproducibility-issues.patch \
+"
 
 SRC_URI[md5sum] = "2b31c78f087f99179feb357da312d7ec"
 SRC_URI[sha256sum] = "4441a5d593f85bb6e8d578cf6653fb4ec30f9e8f4a2315a3d8f2d0a8b3fadf94"
-- 
2.35.1


