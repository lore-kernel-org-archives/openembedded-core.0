Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D468ACA5FA4
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 16:46:47 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40599.1790527606752937802
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 09:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S4GED9dn;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so8116115e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 09:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790527605; x=1791132405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EskHquBxWONdagXq98f1h4Dc1Jzxa1CerCNDHdLIYRM=;
        b=S4GED9dnJ48V8mLQ7pfdwFGaJu+D/AiOWM6mnlMP7GZIP7xR345AGJHjrzs+MODAEO
         75+1yD+kwr6Y+srsctS7jNGKWcjxI1n+EIJSujs3l8Cm8ClDxoLRxh3kM23Y8ZTp5N+f
         Z121jXJPShTYRRikYt/20UXrwm0YzIICyE9h0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790527605; x=1791132405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EskHquBxWONdagXq98f1h4Dc1Jzxa1CerCNDHdLIYRM=;
        b=RgPHUsb4SmQ9qE9DFmPMdbMC8tb+yJsc/SKh0Hr8ANYCWmaGRbqNw3MIONPn3T9V4v
         G12E856aGZduMbp8PomE8V99zURG+BZ8gSsuXDcwluPmRkexcby9uy22hc1BrqkDviNa
         jgsEIgeGoHGJOiuQlauXFWZh8fv5/RuNK+AEMdem5t95N1mDG9/lEm+E3xwE/5uhYiH8
         DR2yf+CkvmMlkw0knPvAxw1weSDlg7Mk1PX4qwyGfxICfrEqwfIFRDl46vxfyTs3XDDE
         yZFFE/KTVBN205Xp6zDnDHfxrclnFwMlEBKJeHOmS1k81ndMLqJsquP1+4c55mhKOaQ8
         s+NA==
X-Gm-Message-State: AFuF++l4fCuEevCfWnEHVLE17rywy735SR3lzKzwpy0tb5WaMJRKfLha
	pyLX6+iEVnOGaOwRSt2tQJAbTdCosKnTumCmsuFugAIi55qUYiHoZY+KPxNgODyjdUH5VENSe9B
	kRMjcQfY=
X-Gm-Gg: AYBFou3htoLMc26pHzBp5dCvd01J8c9xhYIV3c96xtxlElq4xIkUIesLDePf2umEEso
	ZujLW5GsyhYIAkoOnpsWlx1yIwt0mUHsa7IwlZhaKEGJDhwktd70Lx40a1IyOob18EIpiLzAXdb
	eMLmST2HVH8k/K7b17/Jy7d3l1oAkUh0jp1dB4gQRPYeGFH9vad0ClLZ3tcT9QT7d/4Q5tjNfBX
	3Aw3Jk0EeILByIF8VZ8pOlEzSu7wmYDwP9WEm8j+p3gHSJy7MaYlzYludxesCjxuERGM5c6MBq5
	SKpkxpqAj4RTbE+65FRI1mMTU7cyFlBt0SjqRntXL5ngPtIflf5JtZefaCB5fQpwqMl45rn9Abi
	s4ks/Iyz+6cIFuHl8wA93lKX0T8V3xf7QUmQce+J+Wa/IcWRwFfCcv5+9tUbX79gJmV9b4ah79i
	RL3e3e594hrjsCCNd1l3GifRCAf+e7QViPYxakZIn/ENRNQE/PCm+kTkyPEddrGAeDNn9h9WDdg
	XuHx+Ha20EoztIGtkV+rKA8lNXVPbg5LleeiQ==
X-Received: by 2002:a05:600c:4e55:b0:49f:bd3c:bc1a with SMTP id 5b1f17b1804b1-49fe66f506fmr182854575e9.21.1790527605036;
        Sun, 27 Sep 2026 09:46:45 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6474:fa9a:9a9b:3f85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0029203absm54683365e9.6.2026.09.27.09.46.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:46:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] parted: upgrade 3.7 -> 3.8
Date: Sun, 27 Sep 2026 17:46:30 +0100
Message-ID: <20260927164631.2484854-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927164631.2484854-1-richard.purdie@linuxfoundation.org>
References: <20260927164631.2484854-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 16:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246697

version 3.8
  NEWS: Releasing stable version 3.8
  maint: Update to latest gnulib
  maint: post-release administrivia

version 3.7.14
  maint: Update to latest gnulib
  NEWS: Update news for next release
  hurd: Fix gnu_read problems with block size > 512b
  maint: post-release administrivia

version 3.7.13
  NEWS: Update news for next release
  maint: Update copyright statements to 2026
  maint: Update to latest gnulib and bootstrap script
  parted: Fix partition number allocation in do_print
  fdasd: Make sure data set name is positive
  resize: Make sure hfsc_new_cachetable cannot overflow on 32bit
  resize: Make sure 32bit build cannot overflow frag_count
  libparted: Catch FAT metadata triggered errors
    This fixes two CVE's:
       - CVE-2026-89085 - heap buffer overflow in _init_fats / fat_table_read
      - CVE-2026-89088 - heap buffer overflow in duplicate_legacy_root_dir
  Adding support for ExFAT filesystem
  Added and registered exfat probing function
  Updated msdos label probe to properly detect full-disk exfat fs
  Reflected ExFAT support in doc
  Added ExFAT detection test in t1700-probe-fs.sh
  Cleanup zero as null pointer constant warnings
  maint: Distribute Doxyfile
  bug#80795: [PATCH] build: mark functions with const attribute, per gcc warnings
  fixes warning since glibc-2.43
  maint: post-release administrivia

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...1-t9042-dos-partition-limit.sh-unconditionally-skip.patch | 5 +----
 meta/recipes-extended/parted/files/fix-doc-mandir.patch      | 2 +-
 .../recipes-extended/parted/{parted_3.7.bb => parted_3.8.bb} | 2 +-
 3 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/parted/{parted_3.7.bb => parted_3.8.bb} (96%)

diff --git a/meta/recipes-extended/parted/files/0001-t9042-dos-partition-limit.sh-unconditionally-skip.patch b/meta/recipes-extended/parted/files/0001-t9042-dos-partition-limit.sh-unconditionally-skip.patch
index bec7eabebe8..d5d3481b472 100644
--- a/meta/recipes-extended/parted/files/0001-t9042-dos-partition-limit.sh-unconditionally-skip.patch
+++ b/meta/recipes-extended/parted/files/0001-t9042-dos-partition-limit.sh-unconditionally-skip.patch
@@ -1,4 +1,4 @@
-From b03c399e392c492782e680f66dd47bd34b325ab9 Mon Sep 17 00:00:00 2001
+From c8168ea990a1048eb01b20433b754244cdf0c475 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Wed, 8 Jul 2026 09:45:06 -0400
 Subject: [PATCH] t9042-dos-partition-limit.sh: unconditionally skip
@@ -26,6 +26,3 @@ index 87a32df..d6e8d75 100644
  grep '^#define USE_BLKID 1' "$CONFIG_HEADER" > /dev/null ||
    skip_ 'this system lacks a new-enough libblkid'
  
--- 
-2.55.0
-
diff --git a/meta/recipes-extended/parted/files/fix-doc-mandir.patch b/meta/recipes-extended/parted/files/fix-doc-mandir.patch
index 76551f0b6ee..65c78d4e464 100644
--- a/meta/recipes-extended/parted/files/fix-doc-mandir.patch
+++ b/meta/recipes-extended/parted/files/fix-doc-mandir.patch
@@ -1,4 +1,4 @@
-From fe0f3729a7b6396b0d9cc54897955c1af56fc9db Mon Sep 17 00:00:00 2001
+From b41b5d85eb38efc12e17def65ff172036844c8b1 Mon Sep 17 00:00:00 2001
 From: Andreas Oberritter <obi@opendreambox.org>
 Date: Thu, 15 Mar 2012 23:17:52 +0100
 Subject: [PATCH] parted: update to version 3.1
diff --git a/meta/recipes-extended/parted/parted_3.7.bb b/meta/recipes-extended/parted/parted_3.8.bb
similarity index 96%
rename from meta/recipes-extended/parted/parted_3.7.bb
rename to meta/recipes-extended/parted/parted_3.8.bb
index a669919dd79..13115a20c67 100644
--- a/meta/recipes-extended/parted/parted_3.7.bb
+++ b/meta/recipes-extended/parted/parted_3.8.bb
@@ -14,7 +14,7 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
 SRC_URI:append:riscv64 = " file://0001-t9042-dos-partition-limit.sh-unconditionally-skip.patch \
                            "
 
-SRC_URI[sha256sum] = "008de57561a4f3c25a0648e66ed11e7b30be493889b64334a6d70f2c1951ef7b"
+SRC_URI[sha256sum] = "a2b7811f47b0ddb1f7b1d0aa456f7c1270da70708ce231c2fe054c7199eafa63"
 
 inherit autotools pkgconfig gettext texinfo ptest
 

