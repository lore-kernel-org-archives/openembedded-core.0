Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E845CD13D2
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 10:22:23 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45187.1762770137550052287
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 02:22:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cj7pBZKz;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3418ad69672so1867382a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 02:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762770137; x=1763374937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZ1bM1vRZ/GJSfd99GJMpzu4W6Q0ncAFANPSw0OOE/Q=;
        b=cj7pBZKzISHnGRmgaY9/C1hjAhiMIRnqU0f2LpCjtQD2BuFRtEun+LqmYeAV+dfu5H
         WLfCYE0V+/x88Jy6dJp7ez2iSrQwg+cFUcR60zuFwytW+K39+foni4WLgyJD5YCdvVwZ
         uW2Rg9o7k5v112mKzWs3jt1a1Vczcz5ECEQ44AESi9+botPboCb6TPXkNVHHQe0gDAnu
         JAVOOZxhq3lBoLeCozyE5IORfzGfmqEoA/vCMIyh6ZRcZnIl5XC//MEl+s3mQCYi+ywp
         1LyjmwoPFXBiEUIqzF/Ol7aS2d1I5I/y7P4wZwBEr2iNdzc611ME90RyaYtrK8psb6qQ
         /qtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770137; x=1763374937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EZ1bM1vRZ/GJSfd99GJMpzu4W6Q0ncAFANPSw0OOE/Q=;
        b=Ha6G1Bhfowr4BJilxjwr2RmX22UNYlcJXKaQQVCDQ+VY6+yY9gxpoJ5FE/H5EmaR9u
         3s0wr6HXk27fAi4JHht6vMgoj9iUbC5SkbfiMUafvKJoAaHZUyreVWxwzZFH+8uUdNn/
         /4+TGku8hgNL3TD6HkZCvNuHSsK38B94y+uk6mmrXhlHrRdnZNqmFrUApVLGw+keVZYk
         +bXyUQ8U6Ld0jN8NJQupAEI/lO4pc+5kE0L8IzuCLtsi70BNln0c7gOi4j0cFHnJO4Ek
         mOkyaSnpji/jQNfec5TIOJWGeb4BY5AKHVQ0tFc8jRWQiavx6CNOXiKzirSs2xYHyRJU
         B0dA==
X-Gm-Message-State: AOJu0YzSyGNzKTDGpd4NnRUQhO+zlqNSnFY9Z/tN1MUPs+OsONdZF1jR
	UArglzMh6TGgTy85b1pTHnBEQs5EBauH/UmEWTlfo7r0oXxZFdtmP9MImrIa6g==
X-Gm-Gg: ASbGnctErTPJ0H8SnFNT2ABpty5RqblZtP+ZxShVKhBgDTraYBwj0HpbXmniapANs3u
	IUW63I+bLLs2x2iG8k/msEr/Y5oDZYk7AxvXWgpoJXSboHlD4LtySf7QkMBOPUinDtJ8DMcC1fI
	78sVm5Y6EBewKGOg3c17/cBSOZZbKOAtHLeb2z/07Axk0XY0tAgWMnn28QklDKSHc8iCTQGouLN
	pi27SNnZZEqoKVFnmwVkX/iYdPlCpffNL2YFZQyC4kYITxe+BVkSr43pti9YNnq/JuYFQqYEQpx
	Ka/P+y7s3dRot+7ZyPSnLwEEkVHGHx+eXyVV3He1WpTjWrCeZPUmaPLA1ppjwEegyy1SnpJH/Pc
	wRoe2+BNtyYAzSv04Da8HQFyc+9V4iHmRQdc7WREU50zkVOM6gyBU+qZ0afGarhtD+sh20BLHiR
	BJXWcJfTlmS2Z7QM74Mk1a5bz0
X-Google-Smtp-Source: AGHT+IFxUaWv68dKFovGuUt77E3HDFS2Cvr9uWplUkWmF2QOxwgmu2pMDgJq+oW4MZwyjYod08GYDg==
X-Received: by 2002:a17:90b:3a83:b0:341:88c5:2073 with SMTP id 98e67ed59e1d1-3436cb0d1fbmr8419280a91.2.1762770136795;
        Mon, 10 Nov 2025 02:22:16 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343705c1354sm6999894a91.18.2025.11.10.02.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:22:16 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][scarthgap][PATCH 8/9] ca-certificates: upgrade 20241223 -> 20250419
Date: Mon, 10 Nov 2025 23:21:46 +1300
Message-ID: <20251110102149.2915435-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110102149.2915435-1-ankur.tyagi85@gmail.com>
References: <20251110102149.2915435-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 10:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226111

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
refreshed for 20250419

0002-sbin-update-ca-certificates-add-a-sysroot-option.patch
removed since it's included in 20250419

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e39cc1fb7234bf2b37856296d3c0d10ddf8cae64)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ertdata2pem.py-print-a-warning-for-e.patch |  6 ++--
 ...icates-don-t-use-Debianisms-in-run-p.patch |  6 ++--
 ...ca-certificates-add-a-sysroot-option.patch | 36 -------------------
 ...0241223.bb => ca-certificates_20250419.bb} |  3 +-
 4 files changed, 7 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0002-sbin-update-ca-certificates-add-a-sysroot-option.patch
 rename meta/recipes-support/ca-certificates/{ca-certificates_20241223.bb => ca-certificates_20250419.bb} (94%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
index da2a247e51..1226508c98 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
@@ -1,4 +1,4 @@
-From 630736f427c0a1bd0be0b5a2f6d51d63b2c4c9fd Mon Sep 17 00:00:00 2001
+From 743774cd53ed1c45bb660eddacf6dadb5ee3e145 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 18 Oct 2021 12:05:49 +0200
 Subject: [PATCH] Revert "mozilla/certdata2pem.py: print a warning for expired
@@ -16,10 +16,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  3 files changed, 1 insertion(+), 13 deletions(-)
 
 diff --git a/debian/changelog b/debian/changelog
-index 52d41ca..bdb2c8a 100644
+index dbe3e9c..496e05d 100644
 --- a/debian/changelog
 +++ b/debian/changelog
-@@ -138,7 +138,6 @@ ca-certificates (20211004) unstable; urgency=low
+@@ -156,7 +156,6 @@ ca-certificates (20211004) unstable; urgency=low
      - "Trustis FPS Root CA"
      - "Staat der Nederlanden Root CA - G3"
    * Blacklist expired root certificate "DST Root CA X3" (closes: #995432)
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
index cad30929f5..1a29da756f 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
@@ -1,4 +1,4 @@
-From 348163df412e53b1b7ec3e81ae5f22caa0227c37 Mon Sep 17 00:00:00 2001
+From 63086d41f76b1c3357e23c6509df72d3f75af20c Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 6 Jul 2015 15:19:41 +0100
 Subject: [PATCH] ca-certificates: remove Debianism in run-parts invocation
@@ -22,10 +22,10 @@ Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
  1 file changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
-index 36cdd9a..2d3e1fe 100755
+index 91d8024..1e737b9 100755
 --- a/sbin/update-ca-certificates
 +++ b/sbin/update-ca-certificates
-@@ -202,9 +202,7 @@ if [ -d "$HOOKSDIR" ]
+@@ -210,9 +210,7 @@ if [ -d "$HOOKSDIR" ]
  then
  
    echo "Running hooks in $HOOKSDIR..."
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0002-sbin-update-ca-certificates-add-a-sysroot-option.patch b/meta/recipes-support/ca-certificates/ca-certificates/0002-sbin-update-ca-certificates-add-a-sysroot-option.patch
deleted file mode 100644
index ba5bb69657..0000000000
--- a/meta/recipes-support/ca-certificates/ca-certificates/0002-sbin-update-ca-certificates-add-a-sysroot-option.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From d6bb773745c2e95fd1a414e916fbed64e0d8df66 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 31 Mar 2025 17:42:25 +0200
-Subject: [PATCH] sbin/update-ca-certificates: add a --sysroot option
-
-This allows using the script in cross-compilation environments
-where the script needs to prefix the sysroot to every other
-directory it operates on. There are individual options
-to set those directories, but using a common prefix option
-instead is a lot less clutter and more robust.
-
-Upstream-Status: Submitted [https://salsa.debian.org/debian/ca-certificates/-/merge_requests/13]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- sbin/update-ca-certificates | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
-index 4bb77a0..1e737b9 100755
---- a/sbin/update-ca-certificates
-+++ b/sbin/update-ca-certificates
-@@ -59,6 +59,14 @@ do
-     --hooksdir)
-       shift
-       HOOKSDIR="$1";;
-+    --sysroot)
-+      shift
-+      SYSROOT="$1"
-+      CERTSCONF="$1/${CERTSCONF}"
-+      CERTSDIR="$1/${CERTSDIR}"
-+      LOCALCERTSDIR="$1/${LOCALCERTSDIR}"
-+      ETCCERTSDIR="$1/${ETCCERTSDIR}"
-+      HOOKSDIR="$1/${HOOKSDIR}";;
-     --help|-h|*)
-       echo "$0: [--verbose] [--fresh]"
-       exit;;
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb b/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
similarity index 94%
rename from meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
index 676e9e0c78..f06a30bd6d 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
@@ -14,10 +14,9 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRC_URI[sha256sum] = "dd8286d0a9dd35c756fea5f1df3fed1510fb891f376903891b003cd9b1ad7e03"
+SRC_URI[sha256sum] = "33b44ef78653ecd3f0f2f13e5bba6be466be2e7da72182f737912b81798ba5d2"
 SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
-           file://0002-sbin-update-ca-certificates-add-a-sysroot-option.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \
            file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch \
            "

