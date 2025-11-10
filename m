Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D6FCCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 10:24:23 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45279.1762770254221386282
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 02:24:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H8oXkwPJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso3340925b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 02:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762770253; x=1763375053; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJVlE/CJqTcEJVAHopim9KesOMsbZVZwkL7eO8Kxxko=;
        b=H8oXkwPJTL5+Z5FEZTsWaOPgTsidNZMnewQHLkW7Ue0g5wTcxlzwoQmzyyZZppzzaF
         LeD0HW9aRF0W3HzU1Z+deKRMVDpOUkG4hcHzT586lL2Ut1Irgn1bMttZORsVP41HvWlG
         E4mAkvNkg6Xg8U2XaYFXQ+cKM6DGqE/VT1WEAwgHFs9XLxpVqJPEckwI6lyiUuRJY7vw
         vRDDt1WOQ53475PM65gygWZz7HCj21zqzXgUTY3iHco5AmnoU8xD6pEwfNlvlfDlnxQ5
         oaLkGSEgOVXOOfrVWEXoU6nvXXV8cFixrumvZxYokFHTUpBXpAhV4lFugGF8Biv13amt
         JMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770253; x=1763375053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wJVlE/CJqTcEJVAHopim9KesOMsbZVZwkL7eO8Kxxko=;
        b=vCCt/l29IjmoYu+bjV0Hg3L1VKqRSgdMG1vKCjn2wJULDQtPyYkW+eJdoOcmm7+n5Y
         vc7a0W86pzUle78BHrfZ7Xaaizj5dAs/k/ED+rhNAW09nEmPzphXcQlxVP4xm/3L9ETt
         s5tl0EIwPdc8YttngW8rMcYUucH/yS6PTWTZGOxDQDIlMTwA+xIjKCdZ7KzTw3agQQR8
         TChcHJ3oUJBOgAQTRcVZN1uhVgYFcDubx0rlKS7Sc8gWDrhQ6WXeNlkc5oXqBhIy2BeM
         ZCten7e4mIUeh/UrEbiL3ve9Y1fyvPHQGGqG++fdDHvohphjEfUDPv6o0jr95jvf+Vr4
         3RtQ==
X-Gm-Message-State: AOJu0Ywfx62l0sP9VVe5VOPGaYBR2t7bFSxe3wRSWZn7cGLIUlfQKR3r
	RpS6fg3jGYwajBnqXBmAzRuoJDN03UwIFa1oExZP3MIxATifDPzekSTN03zAjw==
X-Gm-Gg: ASbGncv7FZKLhHVJdsyLH9e5Uh+C0G38j+g2TPItQNavjO2mY3Y3Nq1Nw8eK3ZL+P05
	ZN9Dcahiu0TalNQF6IDcn3mRCpWi5zEOW9bUvBPJSmeVdytcXNQEP0i1UenZ3Vj7goocUZVykzm
	AbGd1Zd2HTfw5i7V7wgaOkaPvcD+CGHE3KNai/Jtvp47v+pXLNsgkxT0o1iUoQbN/+0FGQEW9RY
	KVo1ZqN9cP43Rkb4qsaqT4WLMExol/InSMolkoZ553b+bZlIXssnxvxAGbOM0o+2H9ScT7ogari
	AQCVZh11vFBQLb5+uWSaMZ0chPrtQaapyAJU9GfHG7XziLOGzy1EXhIuqPgl+TMt3/9XbDebYuO
	0+GWzOgTouNUhYexUa+xg5//JgpPX0E7RrYYfe7MLZD+XUVRw/7N+RUYXZ3DRBQlCfq9FPcW9hB
	ew+nE23ON0qoFvBw==
X-Google-Smtp-Source: AGHT+IGzqUd//4+fqgYV6hJSwkt/hwLszac7Xk7M0EHADHQ6nDApMdsqmhHHDrDCsoW9FKbrF8Qwiw==
X-Received: by 2002:a05:6a20:5493:b0:353:946f:fd64 with SMTP id adf61e73a8af0-353a385a692mr10101870637.50.1762770253417;
        Mon, 10 Nov 2025 02:24:13 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f9ed21desm12753677a12.11.2025.11.10.02.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:24:13 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][walnascar][PATCH 4/5] ca-certificates: upgrade 20241223 -> 20250419
Date: Mon, 10 Nov 2025 23:23:50 +1300
Message-ID: <20251110102359.2917153-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110102359.2917153-1-ankur.tyagi85@gmail.com>
References: <20251110102359.2917153-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 10:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226116

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
index 749e170548..fd30b602ae 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
@@ -14,10 +14,9 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRC_URI[sha256sum] = "dd8286d0a9dd35c756fea5f1df3fed1510fb891f376903891b003cd9b1ad7e03"
+SRC_URI[sha256sum] = "33b44ef78653ecd3f0f2f13e5bba6be466be2e7da72182f737912b81798ba5d2"
 SRC_URI = "https://snapshot.debian.org/archive/debian/20241223T143500Z/pool/main/c/${BPN}/${BPN}_${PV}.tar.xz \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
-           file://0002-sbin-update-ca-certificates-add-a-sysroot-option.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \
            file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch \
            "

