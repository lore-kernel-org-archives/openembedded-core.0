Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21664C982DC
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:07:54 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1667.1789682872776456416
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2U4oJJIQ;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so315665e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682871; x=1790287671; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ESC2QBsbUE5N5PD+6ShhZ82iIHEXAgPIIkbO9VXSidI=;
        b=2U4oJJIQX5KuiLNz4PrOnHoMw8D/Ok4nwarQX0pz6M/5GRH/OCNbVCqyIBRGf6//Ot
         T7lPAu2vCzpRA4kjquJ7rhCquZi5Qxkn+CMwUPAdMG1QR+s9qYo6Y/XJqEysHHhthNHQ
         IMghjw+rLaPFzUkOLTLd6dqn+SWHiveADt7Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682871; x=1790287671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ESC2QBsbUE5N5PD+6ShhZ82iIHEXAgPIIkbO9VXSidI=;
        b=ll2C1F5w9mZzdujQb0C1/Ve7az60Ilquihn/fPmCyBAeY+Fjlksago5B2rZSGD28Mz
         S8Kvw76MQCWex6UbrvUFMvhBhmIBSa/vU3uuKliIkuhz9uty8FMdoWOMC0gThWaH9POO
         bvyg7TDS1Nkmkrz/uKCYalt8366x7PjywXVhAQTZeGNkzoWOuo+FPv1nUQQDG3eBahuW
         5jZPNZe/3Xsyuao2l6+n4pNGWsgVamQmVDXIAYYUKTWV/kadPuit933iZ7j+jnM6xkRz
         FTeERKcAcVdriNXxvp/kS2m2UmxA8N0CGNQpe04Eo4CuIWPAlsko1N3LHKi+BKLI5IHi
         OXAw==
X-Gm-Message-State: AFuF++kvsdYna7ci1eU0/LkKRFDjtqsYVnKJpAxMIlCiPsFBu93p6V03
	xIJ4do156JSSCASzwUP+hh/P2eejIwLIXO0ZYJOkGTBjVZj9z5Mm2vsW7R4ZTmnZSpISwvD25JF
	IoY63ETo=
X-Gm-Gg: AYBFou05YrBDWeTgvN/MZRc648T7wvygc79Q/oV9Xnt4v+yMx+g8hnK58AU24wTfFJq
	uFpiiWERfZrRcsydfO2LkteEKsfo7qsqZFN6g6GKIU3itvP7mjS4r7g5XD/4PCxE87cn0aW3M8t
	nRjOFehL9us9EA4nlyPqqz30SbyljxP2wAEAwzW9YdF2Abht4NXMvmmuVktSQoBZshlbes9pUFP
	L+sZ9TASumbITqgM54+gVQR4O2g8/ZNpRDQu8xn31B3f3ZMapA7bu8h0skKydBqnat68WcFGUgO
	JlyHj3vPwrmMfgiHNXoGDWIFrAtEpqk6amWP7ONK/Wx68mHZt8BjIPWtGBloGqLtEdh+dES65L4
	8ii3nbrBJEnPxStn/qgDbBH7TJGa7BzB6WrFHm0jH/A7zps2xlrH+tlMX7jXmKKFCEKwqoJ36ae
	vKcHBA1TUCvLv+jE3MRVER+qJkJoU93EH1WbmPNIS09BaFSbyox6w/jtT+51Sr0hMIPX+d0FOH3
	NByWHkJLUatyx3U/FunWGkt7jCCU0HIppujTrWN5zgdVrxqgJlDFr/yfHyO9UN+HVbckxkDSh8=
X-Received: by 2002:a05:600c:4e42:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-49fc4f85e54mr6913325e9.6.1789682871008;
        Thu, 17 Sep 2026 15:07:51 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.07.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:07:50 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 03/79] ca-certificates: upgrade 20260601 -> 20260816
Date: Fri, 18 Sep 2026 00:05:48 +0200
Message-ID: <62e75e4ad0cdbbe692d196bc68dae81d3a75196a.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246099

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Source: debian/changelog

ca-certificates (20260816) unstable; urgency=medium

  * Update Mozilla certificate authority bundle to version 2.90
    The following certificate authorities were added (+):
    + "SECOM TLS ECC Root CA 2024"
    + "SECOM TLS RSA Root CA 2024"
    + "Telia EC TLS Root CA v3"
    + "Telia RSA TLS Root CA v3"
    The following certificate authorities were removed (-):
    - "Atos TrustedRoot 2011"
    - "Entrust Root Certification Authority"
    - "SecureSign Root CA12"
    - "ePKI Root Certification Authority"

 -- Julien Cristau <jcristau@debian.org>  Sun, 16 Aug 2026 23:04:36 +0200

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e639396818e7152896e75364cff5fb97ae19cb32)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...vert-mozilla-certdata2pem.py-print-a-warning-for-e.patch | 6 +++---
 ...date-ca-certificates-don-t-use-Debianisms-in-run-p.patch | 2 +-
 ...date-ca-certificates-use-relative-symlinks-from-ET.patch | 2 +-
 ...certificates_20260601.bb => ca-certificates_20260816.bb} | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20260601.bb => ca-certificates_20260816.bb} (97%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
index 1226508c983..001b4686246 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
@@ -1,4 +1,4 @@
-From 743774cd53ed1c45bb660eddacf6dadb5ee3e145 Mon Sep 17 00:00:00 2001
+From 8ea56b7d5eadb04309dc3cf1e6b0d94d1d053d80 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 18 Oct 2021 12:05:49 +0200
 Subject: [PATCH] Revert "mozilla/certdata2pem.py: print a warning for expired
@@ -16,10 +16,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  3 files changed, 1 insertion(+), 13 deletions(-)
 
 diff --git a/debian/changelog b/debian/changelog
-index dbe3e9c..496e05d 100644
+index 7ad495f..058ef5e 100644
 --- a/debian/changelog
 +++ b/debian/changelog
-@@ -156,7 +156,6 @@ ca-certificates (20211004) unstable; urgency=low
+@@ -234,7 +234,6 @@ ca-certificates (20211004) unstable; urgency=low
      - "Trustis FPS Root CA"
      - "Staat der Nederlanden Root CA - G3"
    * Blacklist expired root certificate "DST Root CA X3" (closes: #995432)
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
index 1a29da756fc..dcfa3554117 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
@@ -1,4 +1,4 @@
-From 63086d41f76b1c3357e23c6509df72d3f75af20c Mon Sep 17 00:00:00 2001
+From bab2e13b69af12c1864cccf371ebc4ef57a6fec2 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 6 Jul 2015 15:19:41 +0100
 Subject: [PATCH] ca-certificates: remove Debianism in run-parts invocation
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch b/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
index 929945b56f9..4d97c81b0d7 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
@@ -1,4 +1,4 @@
-From a69933f96a8675369de702bdb55e57dc21f65e7f Mon Sep 17 00:00:00 2001
+From 8a5b4e2dd1479de0338db7a7234d037ef0f71c2f Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Wed, 28 Mar 2018 16:45:05 +0100
 Subject: [PATCH] update-ca-certificates: use relative symlinks from
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb b/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb
similarity index 97%
rename from meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20260816.bb
index 1bc64fe34a4..9dd3a05948c 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb
@@ -14,7 +14,7 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRC_URI[sha256sum] = "7ab6301f7f34eef90a4d278647c260bc0762e0e14561f4649854cf4b0d4bea21"
+SRC_URI[sha256sum] = "d939bcdd0cb058712cf4175bac76997676eb8b68fe9473765e1b40fb3d5b186a"
 SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \

