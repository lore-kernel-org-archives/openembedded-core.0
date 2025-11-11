Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6767ECD13D9
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 14:59:09 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19452.1762873148230186949
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 06:59:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hrqa7LJ6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b4933bc4bbso858418b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 06:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762873147; x=1763477947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8+oNzc0AvRQJpZqGl0/Yol/dB/2CNWtHzdIHAZft8A=;
        b=hrqa7LJ6haksFE/0XMG1bHh0QqSqoELPn16u4TLWOJUzuWs29pepyDf8Cje9t47Zpy
         uE+503M12COCjq26rXeFIUkI/3rArHH5nHXqkD67DMKVjg40JaM3I9OpI9t1/KiyM+dm
         HICKRWbjF6YD61eDvUL+M0qZIphdGxsiT4M54zt/XitQ2Q+ZqDBsvcGukMM73gMsRZkQ
         f1ZzJNjiSgJxQIJmmSVb940QRNkUIDcJRCw8Xdk5Sn4fC186YdIHfgueBmmz0H0dYAiC
         HWZARxKEHrJH3Ap/ofs3Bi6yIAFU7xjyes8hBeZ7sTAwZhp0uoNviyov63fIBSHXkgWt
         G31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873147; x=1763477947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p8+oNzc0AvRQJpZqGl0/Yol/dB/2CNWtHzdIHAZft8A=;
        b=udePxmZrcbSaaW/Lt/9HFbQtDLHzitkYF37yAuiDmw9J8n32PHKgdXhvL33EPE22qL
         cOXMEMHPFWxU/xOFuAy7PxJdGzSk3U7Ws5aS135ZCaKXROu2tVwIYoLLZ+uSk3CDaBoQ
         39iVXc3Mx/dzB6Cb4XulvkJkC0rbJw/FLL9mwqwzyA+ZsbrVSQ4jiaEf1eXo75CoZ/bw
         Vtxm3yvX8YXRd5vx1K4/72eDf7kSvxdYz2B5KDvlkRRpIRCcUc8+fFcKk3zQDjgXsgja
         VAK1FzsO6LeJSk0qFCmBNVJ7AzRy9kaK2+8pG1H73123lKArnwJ54oqBu5/fI4WdX30Z
         l3Cg==
X-Gm-Message-State: AOJu0Yx5kQvyY/5iL3JewaAvJwDvoJg9dSYCaR4CX4bKNlx2cpqsFhUH
	mil0RVo3geRdPbCmulE5C7SP+w3S9u2qbxwNV1vfS0DCHhZNCtQ/nDkYUgmcAEysDqVOk4P+RA4
	5wL0rV4Q=
X-Gm-Gg: ASbGncv8HiND9TYPz0JbZrMcYbAtg5sWRBunvvdPFwYG3isrQCrK24MpkyFrFfC2A7U
	HH2DdkEpSiDngGoIMnpadau1vPFFvf+IEETABZvA1BZlaHuGTNrSfncKEt2kzslEXDAfgUauowX
	nOXB7PEzg5fFZl01tj+n2CXhtKY0240zqIwQbUeu8gi1F6Ou+ICJ6vdEFsYZFy4Rla6f6G4uMsG
	Cl0hU0thXPvmiolNkU6rX8A4Mw3/exTmVLOVSjim3iL8jqWY3wbkWbImLmcN2oY0SYSQuWhseYp
	HibDRtmpwTd3ZG/DDKWDcZAXkI/gC8TlGScDscTNvwlHCtBjWLJb5mb5FuYyyYyV0f3hsBR+7Bm
	9jyDFGyBeqQx052MO5iN+aPkTpLdhEQxqvc2eDrT8ZPkqh/klZZ54sP3EbRdbZkQkqz77nzVI6i
	QxQzIitEc+UfCD
X-Google-Smtp-Source: AGHT+IEB2+LJfu9RX4YkOo1cAptu4WHOnpcrLtipUhNZRuRugBBlIc9nd8szI/DLYVAVP15SeiXR1A==
X-Received: by 2002:a17:90b:2fcf:b0:314:2cd2:595d with SMTP id 98e67ed59e1d1-343bf0dd30dmr4131345a91.8.1762873147385;
        Tue, 11 Nov 2025 06:59:07 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:db6b:ed5a:7890:6b41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343685301f8sm11662588a91.5.2025.11.11.06.59.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:59:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/19] ca-certificates: upgrade 20241223 -> 20250419
Date: Tue, 11 Nov 2025 06:58:24 -0800
Message-ID: <dd05818a422c8c5be1aef06405d200280b382b91.1762872962.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762872962.git.steve@sakoman.com>
References: <cover.1762872962.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 14:59:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226181

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
-- 
2.43.0


