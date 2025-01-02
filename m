Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 082D1E7718B
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:41:07 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.5380.1735810866105741783
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 01:41:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KVwI6Flp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3863703258fso7106315f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 01:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735810864; x=1736415664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dW0HfrTwdos4CosycPmwkstzy2OfP0ZN/Hc83/Wh64=;
        b=KVwI6FlpPOFSO00XQcE9n23BDAy0IvKvD0gsmrv0RUTuB4Dylj0yPYbfvt64XtqNLK
         jDzwJOqz2bgmj0jYu5hyV/PaWZcFNp+dnZfZRvaQN5BWKcZ7Vg9Dx0XKvr9SCEHgoVcY
         SdysEO6FhzOW8R+56/QpLGmFlid+CvNo3RbnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810864; x=1736415664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dW0HfrTwdos4CosycPmwkstzy2OfP0ZN/Hc83/Wh64=;
        b=GY5qDPDlE04a4x3eVD1KOfVhusczAL8NFPJAKaK7mQEb/xfDvhXVrMZKHsKr1Tg2ON
         BaCDoeRS1lJ6GvVNudFqzCeLqxN3z4ysHybbRyTwzw03LR4jdbYVK3cpTQPdDTC70Jj6
         CpalkK/rw61f8bTn9JpjsGp5cHiyZtaGpM92dNrEFJmP9hmnwam6XhA2zyy1IvqGWR33
         Bfs8pAlfeGHFiqTsH+sEuI5+YWWXni4X+C5/6OwVtr+Qyj+7iCcYg05oYknz5l+jI2Yw
         fDXS3SJf3xciT58y/jhE7ME81T56+a/g6IpsExBhWHZaWqkNGYUp1AZ6o806tmo35+2w
         Fu9g==
X-Gm-Message-State: AOJu0YwZ8MjmX9C7dvOD0ySoRk+q6v0fX0q1wJZnGOAnabt9/1WSD46L
	1gn0ab/fLIjFQwCgK87BxJ4QCizzDJLiwUpQQwGKlUkVhthtrFzU/32a/sK+CLLpOFKgeNownDX
	C79Y=
X-Gm-Gg: ASbGncuWAHMkpNlzGNUMlVOqB4wcWBlFJOTp6wiZUupFszMeaZfOrl3Z/tWVfn5exnP
	kE1lCcco55WnmQ07Tfpj8agdhh6zC1FIpMizodTZUz8B5LvHV/KU8xlEE1OXIsjgx44eWW0nE2y
	tnJe/87XcWIHPVthUcUsQ649gTnO2IVDNQdqNmr50mTJM/hj+i5sxhppPMvKtLObvNx8Q1vsoQP
	TlzXBi1TpXAMZQiiAnNiNessS+3452mXGtUNU9Atd3msGTwgJDirlMZ1I6EileSy2BatRPox77B
	NI+Vyey9mg==
X-Google-Smtp-Source: AGHT+IEbEWJoYU50kPF9BpJX++SBeF++swbr5E2S/kM3QpeBNTDO4lAG9VwDuMYNFefRjWQSNXsQKQ==
X-Received: by 2002:a5d:6c64:0:b0:386:4a16:dadb with SMTP id ffacd0b85a97d-38a1a1feedcmr42712563f8f.11.1735810863970;
        Thu, 02 Jan 2025 01:41:03 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ae2e:9f02:55c2:739d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119ccsm479785625e9.24.2025.01.02.01.41.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 01:41:03 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/21] ca-certificates: upgrade 20240203 -> 20241223
Date: Thu,  2 Jan 2025 09:40:34 +0000
Message-ID: <20250102094059.322187-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
References: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 09:41:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209263

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...certdata2pem.py-print-a-warning-for-e.patch | 13 +++++--------
 ...ficates-don-t-use-Debianisms-in-run-p.patch | 14 +++++++++-----
 ...02-update-ca-certificates-use-SYSROOT.patch | 18 +++++++++---------
 ...ficates-use-relative-symlinks-from-ET.patch |  4 ++--
 .../ca-certificates/default-sysroot.patch      | 16 ++++++++++++----
 ...20240203.bb => ca-certificates_20241223.bb} |  2 +-
 6 files changed, 38 insertions(+), 29 deletions(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20240203.bb => ca-certificates_20241223.bb} (97%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
index 78898f5150c..da2a247e51c 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
@@ -1,4 +1,4 @@
-From cb43ec15b700b25f3c4fe44043a1a021aaf5b768 Mon Sep 17 00:00:00 2001
+From 630736f427c0a1bd0be0b5a2f6d51d63b2c4c9fd Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 18 Oct 2021 12:05:49 +0200
 Subject: [PATCH] Revert "mozilla/certdata2pem.py: print a warning for expired
@@ -16,10 +16,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  3 files changed, 1 insertion(+), 13 deletions(-)
 
 diff --git a/debian/changelog b/debian/changelog
-index 531e4d0..4006509 100644
+index 52d41ca..bdb2c8a 100644
 --- a/debian/changelog
 +++ b/debian/changelog
-@@ -120,7 +120,6 @@ ca-certificates (20211004) unstable; urgency=low
+@@ -138,7 +138,6 @@ ca-certificates (20211004) unstable; urgency=low
      - "Trustis FPS Root CA"
      - "Staat der Nederlanden Root CA - G3"
    * Blacklist expired root certificate "DST Root CA X3" (closes: #995432)
@@ -28,7 +28,7 @@ index 531e4d0..4006509 100644
   -- Julien Cristau <jcristau@debian.org>  Thu, 07 Oct 2021 17:12:47 +0200
  
 diff --git a/debian/control b/debian/control
-index 4434b7a..5c6ba24 100644
+index b5f2ab0..d0e830e 100644
 --- a/debian/control
 +++ b/debian/control
 @@ -3,7 +3,7 @@ Section: misc
@@ -41,7 +41,7 @@ index 4434b7a..5c6ba24 100644
  Rules-Requires-Root: no
  Vcs-Git: https://salsa.debian.org/debian/ca-certificates.git
 diff --git a/mozilla/certdata2pem.py b/mozilla/certdata2pem.py
-index ede23d4..7d796f1 100644
+index 4df86a2..7d796f1 100644
 --- a/mozilla/certdata2pem.py
 +++ b/mozilla/certdata2pem.py
 @@ -21,16 +21,12 @@
@@ -75,6 +75,3 @@ index ede23d4..7d796f1 100644
          bname = obj['CKA_LABEL'][1:-1].replace('/', '_')\
                                        .replace(' ', '_')\
                                        .replace('(', '=')\
--- 
-2.20.1
-
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
index 1feefeb96ab..cad30929f5e 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
@@ -1,3 +1,8 @@
+From 348163df412e53b1b7ec3e81ae5f22caa0227c37 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Mon, 6 Jul 2015 15:19:41 +0100
+Subject: [PATCH] ca-certificates: remove Debianism in run-parts invocation
+
 ca-certificates is a package from Debian, but some host distros such as Fedora
 have a leaner run-parts provided by cron which doesn't support --verbose or the
  -- separator between arguments and paths.
@@ -9,7 +14,6 @@ This solves errors such as
 | [...]/usr/sbin/update-ca-certificates: line 230: Not a directory: --: command not found
 | E: Not a directory: -- exited with code 127.
 
-
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
@@ -17,10 +21,10 @@ Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
  sbin/update-ca-certificates | 4 +---
  1 file changed, 1 insertion(+), 3 deletions(-)
 
-Index: git/sbin/update-ca-certificates
-===================================================================
---- git.orig/sbin/update-ca-certificates
-+++ git/sbin/update-ca-certificates
+diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
+index 36cdd9a..2d3e1fe 100755
+--- a/sbin/update-ca-certificates
++++ b/sbin/update-ca-certificates
 @@ -202,9 +202,7 @@ if [ -d "$HOOKSDIR" ]
  then
  
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch b/meta/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch
index 792b4030b25..48c69f0cbc0 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch
@@ -1,19 +1,19 @@
-Upstream-Status: Pending
-
-From 724cb153ca0f607fb38b3a8db3ebb2742601cd81 Mon Sep 17 00:00:00 2001
+From cdb53438bae194c1281c31374a901ad7ee460408 Mon Sep 17 00:00:00 2001
 From: Andreas Oberritter <obi@opendreambox.org>
 Date: Tue, 19 Mar 2013 17:14:33 +0100
-Subject: [PATCH 2/2] update-ca-certificates: use $SYSROOT
+Subject: [PATCH] update-ca-certificates: use $SYSROOT
+
+Upstream-Status: Pending
 
 Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
 ---
- sbin/update-ca-certificates |   14 +++++++-------
+ sbin/update-ca-certificates | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)
 
-Index: git/sbin/update-ca-certificates
-===================================================================
---- git.orig/sbin/update-ca-certificates
-+++ git/sbin/update-ca-certificates
+diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
+index 5a0a1da..36cdd9a 100755
+--- a/sbin/update-ca-certificates
++++ b/sbin/update-ca-certificates
 @@ -24,12 +24,12 @@
  verbose=0
  fresh=0
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch b/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
index 4bd967f7884..214f88909a9 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
@@ -1,4 +1,4 @@
-From a9fc13b2aee55655d58fcb77a3180fa99f96438a Mon Sep 17 00:00:00 2001
+From 38d47c53749c6f16d5d7993410b256116e0ee0b8 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Wed, 28 Mar 2018 16:45:05 +0100
 Subject: [PATCH] update-ca-certificates: use relative symlinks from
@@ -45,7 +45,7 @@ Signed-off-by: André Draszik <andre.draszik@jci.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
-index 00f80c7..7e911a9 100755
+index f7d0dbf..97a589c 100755
 --- a/sbin/update-ca-certificates
 +++ b/sbin/update-ca-certificates
 @@ -29,6 +29,7 @@ CERTSDIR=$SYSROOT/usr/share/ca-certificates
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/default-sysroot.patch b/meta/recipes-support/ca-certificates/ca-certificates/default-sysroot.patch
index f8b0791bea1..c2a54c00961 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/default-sysroot.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/default-sysroot.patch
@@ -1,13 +1,21 @@
+From 50aadd3eb1c4be43d3decdeb60cede2de5a687be Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Fri, 23 Aug 2013 12:26:14 -0700
+Subject: [PATCH] ca-certificates: add recipe (version 20130610)
+
 Upstream-Status: Pending
 
 update-ca-certificates: find SYSROOT relative to its own location
 
 This makes the script relocatable.
+---
+ sbin/update-ca-certificates | 33 +++++++++++++++++++++++++++++++++
+ 1 file changed, 33 insertions(+)
 
-Index: git/sbin/update-ca-certificates
-===================================================================
---- git.orig/sbin/update-ca-certificates
-+++ git/sbin/update-ca-certificates
+diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
+index 2d3e1fe..f7d0dbf 100755
+--- a/sbin/update-ca-certificates
++++ b/sbin/update-ca-certificates
 @@ -66,6 +66,39 @@ do
    shift
  done
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb b/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
similarity index 97%
rename from meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
index eff1d97bc5e..bbdc7dd68d3 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
@@ -14,7 +14,7 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRC_URI[sha256sum] = "3286d3fc42c4d11b7086711a85f865b44065ce05cf1fb5376b2abed07622a9c6"
+SRC_URI[sha256sum] = "dd8286d0a9dd35c756fea5f1df3fed1510fb891f376903891b003cd9b1ad7e03"
 SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \

