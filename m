Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89EEFC5473A
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:41 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.9387.1724319331591062317
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dxUGwt4W;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5bec4fc82b0so3020599a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319330; x=1724924130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8obj1v++zUDhxWm9ybJ873b/fIytNWJwsr0bhpojlpQ=;
        b=dxUGwt4Wur4RXjtbdKWsoySN83AJOJ35BQikSe9yTuLPZ0y76DOjZROcvEXp51X9wG
         7p1Ef6CzypbASJjwwfBcNw4QqBUo6Tn+IRGiiAKLLVvciODsCQsK9OfcDvpbc1Q/PuDP
         V4tSCslC97gtoPNMbanP8yIbq0/j3JY45NRW67Jvwg5WsCFnZ3lqbUrfMvT8aqp4PVvs
         nA8hCLb6A9teqXO4uPMq0y1qwQ6S+H/W81/n670wZSHDr35DCUZNc+lq6KaRe+WSAUUI
         Si3zBcJ0gt5sA5HpW7KI9aSChLqJTOzpFfmD9+NXLlCdDv2Uw0UsZrSuDzGv0XHXQ7J3
         0itw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319330; x=1724924130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8obj1v++zUDhxWm9ybJ873b/fIytNWJwsr0bhpojlpQ=;
        b=Mtz7i+UDlM+ig4DeutpsyPpJz/dN2E2+2kpZqf9W2Jw2btOq9pUVmfLegI9HaaFYq0
         8uoLWzxAGXsACQajHLID2hHgdrxFWNUHnuA22O4iF3zCIEp17BkGmo51DxVWMYDmD1Hr
         sfPLWco5O8i0AXxm6AlKtk+B4Foq7vJWc1x6/VEpPqx6Q7a9qNtLRHAHX0daag0pjcLK
         +2WyCWXrrOcnths41aE8/PYHmMYcD2jhVNWsHpa+2xUCnBxdifaN7f7X06yKse/xR+bk
         SlyH/rwrsQarngvE14eGiRVIKrb0MuPmDJNFfX0rswAm6PN9DUbyU7iTmcAlgNqtTNQ3
         FDFg==
X-Gm-Message-State: AOJu0YwlcdLHd3q5sJHUrDL2knWT2cveGzBSkULqBa1oxPIfDrbdzY0v
	A3v1v/PFaTRgbw6LMo6WSVgRqKp/UstjS2dj73HnKjw8A7ztoH1ZPC8VZw==
X-Google-Smtp-Source: AGHT+IHJ0Yd57hOjvWpBg6tToNG16b/evvcN27Y6lHPevXWBAvPuAqy6h/zQfQGDGzTpmxc/cVHorw==
X-Received: by 2002:a05:6402:5255:b0:5be:fb2e:d334 with SMTP id 4fb4d7f45d1cf-5bf2c04bbcdmr2411035a12.12.1724319329570;
        Thu, 22 Aug 2024 02:35:29 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/32] dpkg: upgrade 1.22.10 -> 1.22.11
Date: Thu, 22 Aug 2024 11:34:56 +0200
Message-Id: <20240822093521.36790-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203622

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch        | 6 +++---
 .../dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch  | 4 ++--
 .../dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch         | 2 +-
 .../dpkg/dpkg/0001-script.c-avoid-use-of-chroot.patch       | 5 +----
 ...apt-to-linux-wrs-kernel-version-which-has-characte.patch | 6 +++---
 ...e-lutimes-function-doesn-t-work-properly-for-all-s.patch | 6 +++---
 .../dpkg/0006-add-musleabi-to-known-target-tripets.patch    | 2 +-
 ...pkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch | 4 ++--
 .../dpkg/dpkg/add_armeb_triplet_entry.patch                 | 6 ++----
 meta/recipes-devtools/dpkg/dpkg/arch_pm.patch               | 2 +-
 meta/recipes-devtools/dpkg/dpkg/noman.patch                 | 4 ++--
 .../dpkg/dpkg/remove-tar-no-timestamp.patch                 | 4 ++--
 .../dpkg/{dpkg_1.22.10.bb => dpkg_1.22.11.bb}               | 2 +-
 13 files changed, 24 insertions(+), 29 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.22.10.bb => dpkg_1.22.11.bb} (94%)

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch b/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch
index 99044fbb1a9..8943f6c2f02 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch
@@ -1,4 +1,4 @@
-From 21459bb8d9a997e6a92885a4ef337ede9cc5aba7 Mon Sep 17 00:00:00 2001
+From 5c332c2a4625519a2b6065b9d9fc724e84c9b6d6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 29 Apr 2020 22:02:23 -0700
 Subject: [PATCH] Add support for riscv32 CPU
@@ -23,10 +23,10 @@ index 575c008e3..7a801a03a 100644
  s390		s390		s390			32	big
  s390x		s390x		s390x			64	big
 diff --git a/scripts/Dpkg/Vendor/Debian.pm b/scripts/Dpkg/Vendor/Debian.pm
-index fcf5b1e2a..175c9f436 100644
+index edf94bc19..d76f97494 100644
 --- a/scripts/Dpkg/Vendor/Debian.pm
 +++ b/scripts/Dpkg/Vendor/Debian.pm
-@@ -202,6 +202,7 @@ sub set_build_features {
+@@ -216,6 +216,7 @@ sub set_build_features {
          powerpc
          ppc64
          ppc64el
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
index 95a49053e85..185bbb90f18 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
@@ -1,4 +1,4 @@
-From 4c5e6c280a2ab4d2009d3264e94286f5fe244d0b Mon Sep 17 00:00:00 2001
+From 067992f2d0b0ff6ca114031636eb0e1eac791892 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
 Date: Tue, 16 Jun 2020 03:57:25 +0000
 Subject: [PATCH] build.c: ignore return of 1 from tar -cf
@@ -28,7 +28,7 @@ Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/deb/build.c b/src/deb/build.c
-index 92aba9553..6436b33da 100644
+index 87bd4142e..e85fd7d0f 100644
 --- a/src/deb/build.c
 +++ b/src/deb/build.c
 @@ -481,6 +481,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch b/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
index 602a0b22c5d..67fce89d805 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
@@ -1,4 +1,4 @@
-From 1d192b60fc43e24e1c2d6ff452dabeee7a227cc0 Mon Sep 17 00:00:00 2001
+From df6c641e3fc248d0c864e4e752c4609412067df7 Mon Sep 17 00:00:00 2001
 From: sweeaun <swee.aun.khor@intel.com>
 Date: Sun, 10 Sep 2017 00:14:15 -0700
 Subject: [PATCH] dpkg: Support muslx32 build
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.patch b/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.patch
index 7d4dc97e944..d0459cd0179 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.patch
@@ -1,4 +1,4 @@
-From cf135f2b3395e54dc1adfe51c1a25922e01c167e Mon Sep 17 00:00:00 2001
+From 5e5f06d396fe631990474ba6df83428987855365 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 26 Aug 2015 16:25:45 +0300
 Subject: [PATCH] script.c: avoid use of chroot
@@ -86,6 +86,3 @@ index e9aee0bf9..181e7c710 100644
  }
  
  /**
--- 
-2.39.2
-
diff --git a/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch b/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
index fc097e5a669..a5c80773a58 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
@@ -1,4 +1,4 @@
-From 0cac67ce5920d6d0c9df4278bfa77da878a8a37a Mon Sep 17 00:00:00 2001
+From 6e88e8b7b6924751112966f329525956735de9b4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 26 Aug 2015 16:16:16 +0300
 Subject: [PATCH] Adapt to linux-wrs kernel version, which has character '_'
@@ -13,10 +13,10 @@ Upstream-Status: Inappropriate [embedded specific]
  1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/lib/dpkg/parsehelp.c b/lib/dpkg/parsehelp.c
-index 63a36f55c..81901bd5a 100644
+index a999b5e78..7be0378ab 100644
 --- a/lib/dpkg/parsehelp.c
 +++ b/lib/dpkg/parsehelp.c
-@@ -275,14 +275,12 @@ parseversion(struct dpkg_version *rversion, const char *string,
+@@ -291,14 +291,12 @@ parseversion(struct dpkg_version *rversion, const char *string,
    ptr = rversion->version;
    if (!*ptr)
      return dpkg_put_error(err, _("version number is empty"));
diff --git a/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch b/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
index 35c0c246f67..e49d54152c8 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
@@ -1,4 +1,4 @@
-From 80ad29d22f8ca4033a6a79a726580fee17bdade9 Mon Sep 17 00:00:00 2001
+From 0fc90a3ed01a7fce34de925979460638b8a57402 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 26 Aug 2015 16:27:45 +0300
 Subject: [PATCH] The lutimes function doesn't work properly for all systems.
@@ -11,10 +11,10 @@ Upstream-Status: Inappropriate [embedded specific]
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/main/archives.c b/src/main/archives.c
-index 7e399f922..ec3b6878f 100644
+index d7279e1f5..f9c6facc9 100644
 --- a/src/main/archives.c
 +++ b/src/main/archives.c
-@@ -491,8 +491,9 @@ tarobject_set_mtime(struct tar_entry *te, const char *path)
+@@ -490,8 +490,9 @@ tarobject_set_mtime(struct tar_entry *te, const char *path)
  
    if (te->type == TAR_FILETYPE_SYMLINK) {
  #ifdef HAVE_LUTIMES
diff --git a/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch b/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
index 2573afb8e4d..4f60a89a566 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
@@ -1,4 +1,4 @@
-From 1c9e78dda91ba66fbd8fe02b66b6c603d08d3343 Mon Sep 17 00:00:00 2001
+From e3dc69aa987b379e247dde3fce479e43be6c81aa Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 30 Dec 2015 23:05:41 +0000
 Subject: [PATCH] add musleabi to known target tripets
diff --git a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch b/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
index 3d3a4f0bb9e..ded1707dfd9 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
@@ -1,4 +1,4 @@
-From 6dd80236a91a505b5753bb74e5f1b47330d8b16b Mon Sep 17 00:00:00 2001
+From 20ba7fd8939e97bec3d70a67c0aac76ddc67898d Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
 Date: Tue, 21 Feb 2017 11:23:27 -0600
 Subject: [PATCH] dpkg-deb/build.c: Remove usage of --clamp-mtime in tar
@@ -27,7 +27,7 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/deb/build.c b/src/deb/build.c
-index 1f0c050ee..92aba9553 100644
+index a418dd122..87bd4142e 100644
 --- a/src/deb/build.c
 +++ b/src/deb/build.c
 @@ -504,7 +504,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
diff --git a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch b/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
index b5eaa501722..d1fac2168a9 100644
--- a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
@@ -1,14 +1,12 @@
-From 1c3a109df54b6092fa85a1fe2b7771e3b959655f Mon Sep 17 00:00:00 2001
+From 8ded32a35287a840de7e505c66e76cccd9edbac6 Mon Sep 17 00:00:00 2001
 From: "Krishnanjanappa, Jagadeesh"
  <jagadeesh.krishnanjanappa@caviumnetworks.com>
 Date: Wed, 8 Apr 2015 18:08:14 +0530
-Subject: [PATCH] dpkg: add triplet entry to fix build error for armeb
+Subject: [PATCH] add armeb triplet entry into triplettable.
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
-[PATCH] add armeb triplet entry into triplettable.
-
 Cross-compling dpkg application for armeb fails with below error
 during configure task,
 
diff --git a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
index ec5d5034883..b5a29231ddd 100644
--- a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
@@ -1,4 +1,4 @@
-From bdf60ebbeb433a80e6cfcbde9d83d89564e79e20 Mon Sep 17 00:00:00 2001
+From 812dbb64f2805a3257ef9c9a61abbd10e0b3a08c Mon Sep 17 00:00:00 2001
 From: Joe Slater <jslater@windriver.com>
 Date: Mon, 26 Aug 2013 23:38:45 +0000
 Subject: [PATCH] dpkg: fix configuration issue for mips64
diff --git a/meta/recipes-devtools/dpkg/dpkg/noman.patch b/meta/recipes-devtools/dpkg/dpkg/noman.patch
index e80549d7405..3f3e08351c5 100644
--- a/meta/recipes-devtools/dpkg/dpkg/noman.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/noman.patch
@@ -1,4 +1,4 @@
-From 008ec5150dd086ffa3940cb520f1ca91939f138d Mon Sep 17 00:00:00 2001
+From e671b43a52bf5785fe4aad84712dbabc6c86b39e Mon Sep 17 00:00:00 2001
 From: Chris Larson <kergoth@openedhand.com>
 Date: Tue, 5 Sep 2006 07:24:58 +0000
 Subject: [PATCH] Add dpkg, modified from upstream oe.
@@ -9,7 +9,7 @@ Upstream-Status: Inappropriate [disable feature]
  1 file changed, 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 7186045d4..daca9faf2 100644
+index 74f8df197..35e5eee39 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -11,7 +11,6 @@ SUBDIRS = \
diff --git a/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch b/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
index 9307725e8b5..d3a1a13098d 100644
--- a/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
@@ -1,4 +1,4 @@
-From add92699ca1397205e1d7b46c3ab43de06b9a6c7 Mon Sep 17 00:00:00 2001
+From 7d69de114aa696cfb5e31b491a657ca6b6cbbbd5 Mon Sep 17 00:00:00 2001
 From: Constantin Musca <constantinx.musca@intel.com>
 Date: Tue, 28 Aug 2012 17:02:40 +0300
 Subject: [PATCH] busybox-1.19.4 tar utility doesn't support
@@ -12,7 +12,7 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 1 deletion(-)
 
 diff --git a/src/deb/extract.c b/src/deb/extract.c
-index 8b78a7eab..fd7595808 100644
+index 08b281564..c35a182ee 100644
 --- a/src/deb/extract.c
 +++ b/src/deb/extract.c
 @@ -338,7 +338,6 @@ extracthalf(const char *debar, const char *dir,
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.22.10.bb b/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb
similarity index 94%
rename from meta/recipes-devtools/dpkg/dpkg_1.22.10.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.22.11.bb
index b2474048553..47a8d5d5eaf 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.22.10.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb
@@ -17,6 +17,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "ef5536cfe24e4c41c6fdc56e4530161fade3887c"
+SRCREV = "ee7e9118d0a9581cb00c5ce02dccd561b3096387"
 
 S = "${WORKDIR}/git"
-- 
2.39.2


