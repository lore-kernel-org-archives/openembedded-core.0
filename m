Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CC9C54E6A
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:33:47 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.2084.1710351224902516461
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 10:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U6+tVkCE;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-513ca834ad7so167059e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 10:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710351223; x=1710956023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7k/fb0sDwRV/aQB+k4Bvm/URZrFTCJSSeccv3EZSLEw=;
        b=U6+tVkCEOlRNdmGbmqP1pdBQLR5qlKzaj+G8D10zqBtIcXeDI6EuRLNvE+iYZsttjm
         Bpp2wnokV78RAD7+JoLxXsbZwMtB83rvDfBWmY5/2hbF789EntePkptZ0E8U0TsWF7mj
         1asDy9/f6kDhJaLQjzJXbwytG3eULrBLDVGmFUbH/qZrVwynnEtv8rw5ad5N8rIQQB9j
         /x0XE/Lq+XZJdIl680agQPZKRcPiLwm2OFCZ/YTOmDFX+P1vPqmh9yW4Pngw/i7Kad6k
         jal1vWhbQvu9sU/55Qepbm9+o/FfDnzk65eqjsEAlnr6Lj8lq5ydSO4cyncpEa2pJVW6
         BTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710351223; x=1710956023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7k/fb0sDwRV/aQB+k4Bvm/URZrFTCJSSeccv3EZSLEw=;
        b=XkCdchT1EljyINuidyQVeQebMAZEodFTF95KUVyVlr+DJ6tpcpECllY9ijaAVwoSfV
         DNTfwomo4eOoHxkvqKhDWxJIbvx7nEPqjt+CbbFz75pF13FwCGRmjRebafsmY8V4amuS
         5paT/85Kxkk1/7UQNZQoEn91atepauKzIAdXmGNjIvwyJxPE3L593oZrOnaMtkjTYjn9
         kVxtq0zlPDX1Zz6GjemfA4XUnyFKj1JhPNsrd3UzLPUBmrXGnaRHXnlz5CBCtW72pZOE
         mlDa2uFv9DwMcb6yCI7Edo2vXSIWYre94GSEdLO6a/qylERNTJyntY/P6KZkd3SDhJ64
         ca7A==
X-Gm-Message-State: AOJu0YxsfjC5wngprY/nFERjBE4tFekpDTSr3rvsdHhgUTPUgP5DZrom
	4kogdHYCaDJYmkT7JlawsFHhTNpcpm+ox+Qf730x7DJAXnWMKu+WOK+ZO/Da
X-Google-Smtp-Source: AGHT+IHET4itGw4x96Pi3E0t5Ma/v/F2TW98m4DE5MU1xfbflVLSCynCEvT4P64jCigD+uNpYGanUg==
X-Received: by 2002:ac2:4919:0:b0:513:2cb2:53a1 with SMTP id n25-20020ac24919000000b005132cb253a1mr8843544lfi.53.1710351222883;
        Wed, 13 Mar 2024 10:33:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a05600c1d0500b00412ea52b102sm2989710wms.34.2024.03.13.10.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:33:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/21] dpkg: update 1.22.0 -> 1.22.5
Date: Wed, 13 Mar 2024 18:33:20 +0100
Message-Id: <20240313173336.3900178-5-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313173336.3900178-1-alex@linutronix.de>
References: <20240313173336.3900178-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 17:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197057

Drop pager.patch as macros removed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/dpkg/dpkg.inc           |  2 +-
 .../0001-Add-support-for-riscv32-CPU.patch    | 13 +++++-------
 ...ild.c-ignore-return-of-1-from-tar-cf.patch |  9 ++++----
 .../0001-dpkg-Support-muslx32-build.patch     | 15 ++++++-------
 ...rs-kernel-version-which-has-characte.patch | 10 ++++-----
 ...s-expect-D-to-be-set-when-running-in.patch |  5 ++---
 ...tion-doesn-t-work-properly-for-all-s.patch | 12 ++++-------
 ...add-musleabi-to-known-target-tripets.patch | 18 ++++++++--------
 ...c-Remove-usage-of-clamp-mtime-in-tar.patch | 12 +++++------
 .../dpkg/dpkg/add_armeb_triplet_entry.patch   | 21 ++++++++++---------
 meta/recipes-devtools/dpkg/dpkg/arch_pm.patch | 12 ++++++-----
 meta/recipes-devtools/dpkg/dpkg/noman.patch   | 11 +++++-----
 meta/recipes-devtools/dpkg/dpkg/pager.patch   | 21 -------------------
 .../dpkg/dpkg/remove-tar-no-timestamp.patch   | 13 ++++++------
 .../dpkg/{dpkg_1.22.0.bb => dpkg_1.22.5.bb}   |  3 +--
 15 files changed, 73 insertions(+), 104 deletions(-)
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/pager.patch
 rename meta/recipes-devtools/dpkg/{dpkg_1.22.0.bb => dpkg_1.22.5.bb} (92%)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index b3e8c05d626..4c1d42e0af9 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -11,7 +11,7 @@ RDEPENDS:${PN}:class-native = ""
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-inherit autotools gettext perlnative pkgconfig perl-version update-alternatives
+inherit autotools gettext perlnative pkgconfig perl-version update-alternatives bash-completion
 
 PERL:class-native = "${STAGING_BINDIR_NATIVE}/perl-native/perl"
 
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch b/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch
index 52e85705fab..b8a86975851 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch
@@ -1,4 +1,4 @@
-From 279e4c274f5f295823cf9fa95d3ba131f6d711db Mon Sep 17 00:00:00 2001
+From 21459bb8d9a997e6a92885a4ef337ede9cc5aba7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 29 Apr 2020 22:02:23 -0700
 Subject: [PATCH] Add support for riscv32 CPU
@@ -11,10 +11,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+)
 
 diff --git a/data/cputable b/data/cputable
-index 9f2a8e0..1d935b1 100644
+index 575c008e3..7a801a03a 100644
 --- a/data/cputable
 +++ b/data/cputable
-@@ -41,6 +41,7 @@ powerpc		powerpc		(powerpc|ppc)		32	big
+@@ -43,6 +43,7 @@ powerpc		powerpc		(powerpc|ppc)		32	big
  powerpcel	powerpcle	powerpcle		32	little
  ppc64		powerpc64	(powerpc|ppc)64		64	big
  ppc64el		powerpc64le	powerpc64le		64	little
@@ -23,10 +23,10 @@ index 9f2a8e0..1d935b1 100644
  s390		s390		s390			32	big
  s390x		s390x		s390x			64	big
 diff --git a/scripts/Dpkg/Vendor/Debian.pm b/scripts/Dpkg/Vendor/Debian.pm
-index a352bbd..fa1d90b 100644
+index fcf5b1e2a..175c9f436 100644
 --- a/scripts/Dpkg/Vendor/Debian.pm
 +++ b/scripts/Dpkg/Vendor/Debian.pm
-@@ -306,6 +306,7 @@ sub _add_build_flags {
+@@ -202,6 +202,7 @@ sub set_build_features {
          powerpc
          ppc64
          ppc64el
@@ -34,6 +34,3 @@ index a352bbd..fa1d90b 100644
          riscv64
          s390x
          sparc
--- 
-2.26.2
-
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
index f2367c95e95..95a49053e85 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
@@ -1,4 +1,4 @@
-From e3ade3464b8a1129a55c2790cf114d9ae01e3cda Mon Sep 17 00:00:00 2001
+From 4c5e6c280a2ab4d2009d3264e94286f5fe244d0b Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
 Date: Tue, 16 Jun 2020 03:57:25 +0000
 Subject: [PATCH] build.c: ignore return of 1 from tar -cf
@@ -23,16 +23,15 @@ Upstream-Status: Inappropriate [OE specific]
 Original patch by RP 2015/3/27, rebased by Paul Eggleton
 
 Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
-
 ---
  src/deb/build.c | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/deb/build.c b/src/deb/build.c
-index 76613adec..7c216d1a9 100644
+index 92aba9553..6436b33da 100644
 --- a/src/deb/build.c
 +++ b/src/deb/build.c
-@@ -482,6 +482,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+@@ -481,6 +481,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
  {
    int pipe_filenames[2], pipe_tarball[2];
    pid_t pid_tar, pid_comp;
@@ -40,7 +39,7 @@ index 76613adec..7c216d1a9 100644
  
    /* Fork off a tar. We will feed it a list of filenames on stdin later. */
    m_pipe(pipe_filenames);
-@@ -534,7 +535,9 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+@@ -533,7 +534,9 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
    /* All done, clean up wait for tar and <compress> to finish their job. */
    close(pipe_filenames[1]);
    subproc_reap(pid_comp, _("<compress> from tar -cf"), 0);
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch b/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
index d66ab4476ae..e8d8576f859 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
@@ -1,4 +1,4 @@
-From a328c8bec0bf8071ae8f20fee4c7475205064ba1 Mon Sep 17 00:00:00 2001
+From 1d192b60fc43e24e1c2d6ff452dabeee7a227cc0 Mon Sep 17 00:00:00 2001
 From: sweeaun <swee.aun.khor@intel.com>
 Date: Sun, 10 Sep 2017 00:14:15 -0700
 Subject: [PATCH] dpkg: Support muslx32 build
@@ -13,10 +13,10 @@ Signed-off-by: sweeaun <swee.aun.khor@intel.com>
  2 files changed, 2 insertions(+)
 
 diff --git a/data/ostable b/data/ostable
-index be64342..87db273 100644
+index 860355774..28779beca 100644
 --- a/data/ostable
 +++ b/data/ostable
-@@ -19,6 +19,7 @@ base-uclibc-linux	linux-uclibc		linux[^-]*-uclibc
+@@ -21,6 +21,7 @@ base-uclibc-linux	linux-uclibc		linux[^-]*-uclibc
  eabihf-musl-linux	linux-musleabihf	linux[^-]*-musleabihf
  eabi-musl-linux		linux-musleabi		linux[^-]*-musleabi
  base-musl-linux		linux-musl		linux[^-]*-musl
@@ -25,17 +25,14 @@ index be64342..87db273 100644
  eabi-gnu-linux		linux-gnueabi		linux[^-]*-gnueabi
  abin32-gnu-linux	linux-gnuabin32		linux[^-]*-gnuabin32
 diff --git a/data/tupletable b/data/tupletable
-index 28f00bf..748ffab 100644
+index 82ae3604e..707d85bdb 100644
 --- a/data/tupletable
 +++ b/data/tupletable
-@@ -10,6 +10,7 @@ base-uclibc-linux-<cpu>		uclibc-linux-<cpu>
+@@ -26,6 +26,7 @@ base-uclibc-linux-<cpu>		uclibc-linux-<cpu>
  eabihf-musl-linux-arm		musl-linux-armhf
  eabi-musl-linux-arm		musl-linux-armel
  base-musl-linux-<cpu>		musl-linux-<cpu>
 +x32-musl-linux-amd64		x32
- ilp32-gnu-linux-arm64		arm64ilp32
  eabihf-gnu-linux-arm		armhf
  eabi-gnu-linux-arm		armel
--- 
-2.7.4
-
+ eabi-gnu-linux-armeb		armeb
diff --git a/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch b/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
index ef5f7c3ec30..fc097e5a669 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
@@ -1,8 +1,8 @@
-From b4ea54158c399874e12394ebc91afe98954695e2 Mon Sep 17 00:00:00 2001
+From 0cac67ce5920d6d0c9df4278bfa77da878a8a37a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 26 Aug 2015 16:16:16 +0300
-Subject: [PATCH 2/5] Adapt to linux-wrs kernel version, which has character
- '_' inside. Remove the first-char-digit-check (as the 1.15.8.5 version does).
+Subject: [PATCH] Adapt to linux-wrs kernel version, which has character '_'
+ inside. Remove the first-char-digit-check (as the 1.15.8.5 version does).
 
 Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
 Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
@@ -32,6 +32,4 @@ index 63a36f55c..81901bd5a 100644
 +    if (!c_isdigit(*ptr) && !c_isalpha(*ptr) && strchr(".-+~_", *ptr) == NULL)
        return dpkg_put_warn(err, _("invalid character in revision number"));
    }
-
--- 
-2.11.0
+ 
diff --git a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
index bd4d5d53538..916c7dfb005 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
@@ -1,4 +1,4 @@
-From ff325b35639a797edd92b373fbebf7b8b9f3f0c3 Mon Sep 17 00:00:00 2001
+From b6c28222276704a1e1a544983e38dfa2f3fb481a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 26 Aug 2015 16:25:45 +0300
 Subject: [PATCH] Our pre/postinsts expect $D to be set when running in a
@@ -11,13 +11,12 @@ RP 2011/12/07
 ALIMON 2016/05/26
 ALIMON 2017/02/21
 KKang 2019/02/20
-
 ---
  src/main/script.c | 53 +++--------------------------------------------
  1 file changed, 3 insertions(+), 50 deletions(-)
 
 diff --git a/src/main/script.c b/src/main/script.c
-index ecce4d842..16f4e6ff5 100644
+index 017d92efe..181e7c710 100644
 --- a/src/main/script.c
 +++ b/src/main/script.c
 @@ -97,58 +97,11 @@ static const char *
diff --git a/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch b/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
index bbd5aba4182..35c0c246f67 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
@@ -1,8 +1,7 @@
-From adb6bfd0feeceaf030df0debe3343d7f73e708a0 Mon Sep 17 00:00:00 2001
+From 80ad29d22f8ca4033a6a79a726580fee17bdade9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 26 Aug 2015 16:27:45 +0300
-Subject: [PATCH 4/5] The lutimes function doesn't work properly for all
- systems.
+Subject: [PATCH] The lutimes function doesn't work properly for all systems.
 
 Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
@@ -12,10 +11,10 @@ Upstream-Status: Inappropriate [embedded specific]
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/main/archives.c b/src/main/archives.c
-index 92340b9..7a55c27 100644
+index 7e399f922..ec3b6878f 100644
 --- a/src/main/archives.c
 +++ b/src/main/archives.c
-@@ -490,8 +490,9 @@ tarobject_set_mtime(struct tar_entry *te, const char *path)
+@@ -491,8 +491,9 @@ tarobject_set_mtime(struct tar_entry *te, const char *path)
  
    if (te->type == TAR_FILETYPE_SYMLINK) {
  #ifdef HAVE_LUTIMES
@@ -26,6 +25,3 @@ index 92340b9..7a55c27 100644
  #endif
    } else {
      if (utimes(path, tv))
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch b/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
index 8797ea55c6b..8ac646b1a13 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
@@ -1,7 +1,10 @@
-From f8910022dc3ec622272f168cd0022dbdf6dff93a Mon Sep 17 00:00:00 2001
+From 1c9e78dda91ba66fbd8fe02b66b6c603d08d3343 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 30 Dec 2015 23:05:41 +0000
 Subject: [PATCH] add musleabi to known target tripets
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 helps compiling dpkg for musl/arm-softfloat
 
@@ -14,10 +17,10 @@ Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
  2 files changed, 2 insertions(+)
 
 diff --git a/data/ostable b/data/ostable
-index 99c1f889d..be6434271 100644
+index 64f424490..860355774 100644
 --- a/data/ostable
 +++ b/data/ostable
-@@ -17,6 +17,7 @@
+@@ -19,6 +19,7 @@
  eabi-uclibc-linux	linux-uclibceabi	linux[^-]*-uclibceabi
  base-uclibc-linux	linux-uclibc		linux[^-]*-uclibc
  eabihf-musl-linux	linux-musleabihf	linux[^-]*-musleabihf
@@ -26,17 +29,14 @@ index 99c1f889d..be6434271 100644
  eabihf-gnu-linux	linux-gnueabihf		linux[^-]*-gnueabihf
  eabi-gnu-linux		linux-gnueabi		linux[^-]*-gnueabi
 diff --git a/data/tupletable b/data/tupletable
-index 5f500f6ca..28f00bfe6 100644
+index 7436f8056..82ae3604e 100644
 --- a/data/tupletable
 +++ b/data/tupletable
-@@ -8,6 +8,7 @@
+@@ -24,6 +24,7 @@
  eabi-uclibc-linux-arm		uclibc-linux-armel
  base-uclibc-linux-<cpu>		uclibc-linux-<cpu>
  eabihf-musl-linux-arm		musl-linux-armhf
 +eabi-musl-linux-arm		musl-linux-armel
  base-musl-linux-<cpu>		musl-linux-<cpu>
- ilp32-gnu-linux-arm64		arm64ilp32
  eabihf-gnu-linux-arm		armhf
--- 
-2.11.0
-
+ eabi-gnu-linux-arm		armel
diff --git a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch b/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
index 117f9234ad2..3d3a4f0bb9e 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
@@ -1,7 +1,10 @@
-From 8659eeeeda74d71e12080121f0b13a88cbdda433 Mon Sep 17 00:00:00 2001
+From 6dd80236a91a505b5753bb74e5f1b47330d8b16b Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
 Date: Tue, 21 Feb 2017 11:23:27 -0600
 Subject: [PATCH] dpkg-deb/build.c: Remove usage of --clamp-mtime in tar
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 Recently dpkg added --clamp-mtime to tar to create reproducible
 build tarballs [1].
@@ -24,10 +27,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/deb/build.c b/src/deb/build.c
-index 5c74ff3..76613ad 100644
+index 1f0c050ee..92aba9553 100644
 --- a/src/deb/build.c
 +++ b/src/deb/build.c
-@@ -505,7 +505,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+@@ -504,7 +504,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
  
      command_init(&cmd, TAR, "tar -cf");
      command_add_args(&cmd, "tar", "-cf", "-", "--format=gnu",
@@ -36,6 +39,3 @@ index 5c74ff3..76613ad 100644
      /* Mode might become a positional argument, pass it before -T. */
      if (options->mode)
        command_add_args(&cmd, "--mode", options->mode, NULL);
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch b/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
index d165616a191..cbdf01dbd9a 100644
--- a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
@@ -1,5 +1,11 @@
-Author: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
-Date:   Wed Apr 8 18:08:14 2015 +0530
+From 1c3a109df54b6092fa85a1fe2b7771e3b959655f Mon Sep 17 00:00:00 2001
+From: "Krishnanjanappa, Jagadeesh"
+ <jagadeesh.krishnanjanappa@caviumnetworks.com>
+Date: Wed, 8 Apr 2015 18:08:14 +0530
+Subject: [PATCH] dpkg: add triplet entry to fix build error for armeb
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 [PATCH] add armeb triplet entry into triplettable.
 
@@ -25,24 +31,19 @@ Upstream-Status: Pending
 
 Signed-off-by: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
 Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
-
 ---
  data/tupletable | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/data/tupletable b/data/tupletable
-index b7802bec3..5f500f6ca 100644
+index ae9f2ddb4..7436f8056 100644
 --- a/data/tupletable
 +++ b/data/tupletable
-@@ -12,6 +12,7 @@ base-musl-linux-<cpu>		musl-linux-<cpu>
- ilp32-gnu-linux-arm64		arm64ilp32
+@@ -27,6 +27,7 @@ eabihf-musl-linux-arm		musl-linux-armhf
+ base-musl-linux-<cpu>		musl-linux-<cpu>
  eabihf-gnu-linux-arm		armhf
  eabi-gnu-linux-arm		armel
 +eabi-gnu-linux-armeb		armeb
  abin32-gnu-linux-mips64r6el	mipsn32r6el
  abin32-gnu-linux-mips64r6	mipsn32r6
  abin32-gnu-linux-mips64el	mipsn32el
--- 
-2.11.0
-
-
diff --git a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
index 4e0d22acbbf..df2cd88ca42 100644
--- a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
@@ -1,3 +1,8 @@
+From bdf60ebbeb433a80e6cfcbde9d83d89564e79e20 Mon Sep 17 00:00:00 2001
+From: Joe Slater <jslater@windriver.com>
+Date: Mon, 26 Aug 2013 23:38:45 +0000
+Subject: [PATCH] dpkg: fix configuration issue for mips64
+
 configure cannot determine the proper cpu, os, or
 architecture for mips64, and possibly other arch's
 because of faulty code added to Arch.pm in the latest
@@ -6,16 +11,15 @@ release from upstream.  We remove that code.
 Upstream-Status: Pending
 
 Signed-off-by: Joe Slater <jslater@windriver.com>
-
 ---
  scripts/Dpkg/Arch.pm | 3 ---
  1 file changed, 3 deletions(-)
 
 diff --git a/scripts/Dpkg/Arch.pm b/scripts/Dpkg/Arch.pm
-index 1720847b8..6345ce3b9 100644
+index 0d352eeb9..4ef5fa307 100644
 --- a/scripts/Dpkg/Arch.pm
 +++ b/scripts/Dpkg/Arch.pm
-@@ -323,9 +323,6 @@ sub _load_tupletable()
+@@ -326,9 +326,6 @@ sub _load_tupletable()
  		    (my $dt = $debtuple) =~ s/<cpu>/$_cpu/;
  		    (my $da = $debarch) =~ s/<cpu>/$_cpu/;
  
@@ -25,5 +29,3 @@ index 1720847b8..6345ce3b9 100644
  		    $debarch_to_debtuple{$da} = $dt;
  		    $debtuple_to_debarch{$dt} = $da;
  		}
--- 
-2.11.0
diff --git a/meta/recipes-devtools/dpkg/dpkg/noman.patch b/meta/recipes-devtools/dpkg/dpkg/noman.patch
index 6900716b11c..e80549d7405 100644
--- a/meta/recipes-devtools/dpkg/dpkg/noman.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/noman.patch
@@ -1,11 +1,15 @@
-Upstream-Status: Inappropriate [disable feature]
+From 008ec5150dd086ffa3940cb520f1ca91939f138d Mon Sep 17 00:00:00 2001
+From: Chris Larson <kergoth@openedhand.com>
+Date: Tue, 5 Sep 2006 07:24:58 +0000
+Subject: [PATCH] Add dpkg, modified from upstream oe.
 
+Upstream-Status: Inappropriate [disable feature]
 ---
  Makefile.am | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index d963a10..7cef7f5 100644
+index 7186045d4..daca9faf2 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -11,7 +11,6 @@ SUBDIRS = \
@@ -16,6 +20,3 @@ index d963a10..7cef7f5 100644
  	# EOL
  
  ACLOCAL_AMFLAGS = -I m4
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/dpkg/dpkg/pager.patch b/meta/recipes-devtools/dpkg/dpkg/pager.patch
deleted file mode 100644
index e56b9d28af0..00000000000
--- a/meta/recipes-devtools/dpkg/dpkg/pager.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-pager: Use less instead of pager
-
-pager is a Debianism. Istead use directly pager.
-
-Upstream-Status: Inappropriate [OE-Core integration specific]
-
-Suggested-by: Burton, Ross <ross.burton@intel.com>
-Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
-diff --git a/lib/dpkg/dpkg.h b/lib/dpkg/dpkg.h
-index 2bb067a..6cbce80 100644
---- a/lib/dpkg/dpkg.h
-+++ b/lib/dpkg/dpkg.h
-@@ -95,7 +95,7 @@ DPKG_BEGIN_DECLS
- #define MAXUPDATES         250
- 
- #define DEFAULTSHELL        "sh"
--#define DEFAULTPAGER        "pager"
-+#define DEFAULTPAGER        "less"
- 
- #define MD5HASHLEN           32
- #define MAXTRIGDIRECTIVE     256
diff --git a/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch b/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
index ebf838ffe91..9307725e8b5 100644
--- a/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
@@ -1,4 +1,8 @@
-busybox-1.19.4 tar utility doesn't support --warning=no-timestamp
+From add92699ca1397205e1d7b46c3ab43de06b9a6c7 Mon Sep 17 00:00:00 2001
+From: Constantin Musca <constantinx.musca@intel.com>
+Date: Tue, 28 Aug 2012 17:02:40 +0300
+Subject: [PATCH] busybox-1.19.4 tar utility doesn't support
+ --warning=no-timestamp
 
 Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
@@ -8,10 +12,10 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 1 deletion(-)
 
 diff --git a/src/deb/extract.c b/src/deb/extract.c
-index a1b2dc0..95e2372 100644
+index 8b78a7eab..fd7595808 100644
 --- a/src/deb/extract.c
 +++ b/src/deb/extract.c
-@@ -333,7 +333,6 @@ extracthalf(const char *debar, const char *dir,
+@@ -338,7 +338,6 @@ extracthalf(const char *debar, const char *dir,
  
        command_add_arg(&cmd, "-f");
        command_add_arg(&cmd, "-");
@@ -19,6 +23,3 @@ index a1b2dc0..95e2372 100644
  
        m_dup2(p2[0],0);
        close(p2[0]);
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb b/meta/recipes-devtools/dpkg/dpkg_1.22.5.bb
similarity index 92%
rename from meta/recipes-devtools/dpkg/dpkg_1.22.0.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.22.5.bb
index 7eaae9f22ec..9f1d00e2089 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.22.5.bb
@@ -12,12 +12,11 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
            file://0006-add-musleabi-to-known-target-tripets.patch \
            file://0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch \
            file://0001-dpkg-Support-muslx32-build.patch \
-           file://pager.patch \
            file://0001-Add-support-for-riscv32-CPU.patch \
            "
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "744487c98a622b9b38c22c6ca330315af4a30a11"
+SRCREV = "1c92a4a8bfbeea30ceb0109b096c4ec845e3c6ce"
 
 S = "${WORKDIR}/git"
-- 
2.39.2


