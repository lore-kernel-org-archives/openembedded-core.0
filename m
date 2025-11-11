Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A0EBCD13D2
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 14:59:09 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19448.1762873145122814915
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 06:59:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DjwQJLEa;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3436d6aa66dso777303a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 06:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762873144; x=1763477944; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ciXvvYKDCYykGcM2nNqCpu2jwCwOT4DfYjqoH5quoWQ=;
        b=DjwQJLEa11A0KbLbfhs0+3P2Jqcry0INSZ1fIbWlqhS9jeN2eMlIUwRzsBwFklFXcH
         FxLV1xsgR+bpxDcEs3UnC17pUfD47jvCGV372zBQxICupEk9j+ShiHyNqHYNcKQPf/xg
         hnb89jYpqJ2lZkiftPvpEFVwGmUZE5N3VcZ+UrAVyGFCXEHt/TxSa+yEXi7P+qyO3mKf
         TJqpbaVeXCuy4d7UgUEoxxoWe3qKJQLvRs6K1JXZvnaH6dyhA6OrZmTeM4w3mx+ZIwWk
         IPkvk8ckj07QJi/8So6uw2GNcDs02LFpqNWbxqs2jMtTV26jIVEfxwA723WhqjKMWDeG
         VDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873144; x=1763477944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ciXvvYKDCYykGcM2nNqCpu2jwCwOT4DfYjqoH5quoWQ=;
        b=IFkFLXZsR3bIIEo4hDbORdReHOCIvwRi9Wq+LtgXbvPVDjN6WefXtAr0yYZFBUSElk
         +nk9PvxMC/XTCcg3j/VM54kDA4U1qS99iHyv9zyKQdtkIj8e6Zvjjid1A1aCWmhJAs2A
         2FURmwwhK+rCNnE3/vt9U8rbwGwLxhvXklISK3P8eTZIuzd5J84Re5sMm1aGILzH61zI
         LKXGvXmeFfRPlWZKabVFrAjTsoyQJzKpUXgpUn7GMwVVD2PbgfuIf4DUcQmynkubPydU
         myR9nAI1Ny9jL/hpQwxsYqNKD8OG/3qtXwvXe/o0ekxUWJgonu2bvEw141Q8WmC1OjE+
         udpA==
X-Gm-Message-State: AOJu0Yw8W01SGZ9/3VXuenle2dYxWexOwRbYEhTyHT2gN1y+ArhN8XzS
	5N2BGiFt3rv0to0a/6aoXU4xczEwBLeCciHCwsUV3mvjsYHGy4+JnSfiFHJ3SAT8rGhQYOFzlT5
	PjdUfjAU=
X-Gm-Gg: ASbGnctO5DRbgTDY3Gs0VUT+jdIHQ29oLcwaAkiHbjf8bY8H85MJ+PRqBqByJrl5PYz
	JIb9+W/ggZM69b8u98duop+keel1wql/MW77MUXrwWjpbHdbO5cZEpn9aDrv5SUN1UvvTDG+Eur
	VZ6l4iQHrr9L4SFa9qsKBFl7FXAI4Mc/U9iAAwGprwp/C9vlDth/oYRi1nBM6pFhJQTpA8n5IEG
	Qi8linQZ2mLrEIYjtCLEEP/9IZasADrTSvhB35rR5I8mWjwDQ1V1KRNfBHBkB+QsDZyYTeu/Rbq
	/L1XdxuhB35y0sCrgBXRiwIsoH5ptbFdlIFPUWniQFuf5t8UF6IOEG6IxF5AoUoLvHhiT6/nxPw
	8MiG3qCrjlzEu4+LOv4iH2lqJNvSG0o8g4DwJMk9faxLq1i1dYQPEGtkJb0W0yW31gZsj6jcYbB
	Lt9w==
X-Google-Smtp-Source: AGHT+IHE3D62Uuql84msV2YYkt8Xcu5nlzYB499btenYv+vbrgX1UE7wqbNyBlGtHtkOX21px8qAMQ==
X-Received: by 2002:a17:90b:3849:b0:343:72d5:2c18 with SMTP id 98e67ed59e1d1-343bf23f306mr4598786a91.12.1762873144246;
        Tue, 11 Nov 2025 06:59:04 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:db6b:ed5a:7890:6b41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343685301f8sm11662588a91.5.2025.11.11.06.59.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:59:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/19] ca-certificates: upgrade 20240203 -> 20241223
Date: Tue, 11 Nov 2025 06:58:22 -0800
Message-ID: <7e4ce7c927f6328e013db53690a2ef841b1bb9bf.1762872962.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762872962.git.steve@sakoman.com>
References: <cover.1762872962.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 14:59:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226179

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 48a236c2f78fee5e6db19c6be23b4a18df025607)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 78898f5150..da2a247e51 100644
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
index 1feefeb96a..cad30929f5 100644
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
index 792b4030b2..48c69f0cbc 100644
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
index 4bd967f788..214f88909a 100644
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
index f8b0791bea..c2a54c0096 100644
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
index eff1d97bc5..bbdc7dd68d 100644
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
-- 
2.43.0


