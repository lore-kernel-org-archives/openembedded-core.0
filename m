Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 717EDC79F99
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 21:46:39 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6150.1788817597631025858
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 14:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ixufsAzO;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1c7364550so4082129a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 14:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788817597; x=1789422397; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8+zc3JS9MyWDEOfX11u+KrpyHtxrV1Sanr9/sVO1Hk=;
        b=ixufsAzObVS2NEJw7LvESlfs8zUG2rfQ30UarB8elhiv221C4JuVj5DXD3OmzSBhb7
         atV8i2RMr1/MrfrMBj0x0gic49twrh8TWUgYNLnXiMgKZ0wwUcZZwxG8dVYCbm1+N1cu
         aOPb5tJDE0CwB6dKcaUVLTdOgHW4rUXzhVzE2ufyGb0u8zQ8klWx5BcGefNFcyHaVYwk
         3UUfN4N+Lw6THOmSkbSQJjP3g0UciDH2qXBcbMlsUl5Ii3yo8KWlQAt4PNYumV5dvFsX
         HBY+PBd3X2Smdu/ehdDIEAEsfJx14dUyNYwTUphI7e8/3D1WO8Ig2xmU+6kp//YJQzw6
         v0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788817597; x=1789422397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r8+zc3JS9MyWDEOfX11u+KrpyHtxrV1Sanr9/sVO1Hk=;
        b=hpm6iIsuggB9qZZRg75iOb5NnoyljEovhuoYObO86nweTEdLGw52zmt6qz43Jd8ifS
         t8f7lC0P/RJ7Sga9opvu8DlU2SzGBjWHPzB6rI9mp0yKFA5cq3CGpxs/zEZmq8NZoDCo
         Vz5dVSW7Sf7bumFDaCaBLK14ouee0sHpMG6weX0QtLgomFtSA0/3gR45WXK7Ehskxjvx
         PzJYuLvnigvZ+6xQx9oBxslfgSqyPrR8Huuhauf4N8uj7GsGcYiLp2oRW2bhv5b/bK0o
         quFfBX1opkyoeSFXIbfYyiswb2zwI1oJG8gpdKqN0typyoVxXsnD0TsxUFpKK+FHw2L4
         DnMg==
X-Gm-Message-State: AFuF++mm8yJ4qbVeatJOc2hQdZ3RNjnlQq9x1ANhqigmxCbOCU54PaX2
	6TbX7JbJMA3Mt143G86jK7kMUg9XGFsn09TaJK5VhL6nF8Fx32Xr57m+gBnzPtGQ
X-Gm-Gg: AYBFou1biH3qVnZkHIUTe35Wm1G4KDInAOidsui3CcBNXY1UQ5qqbBbYD0HFuLfrTUA
	3y3RdvibISRLl397EBS4O1Vb86jbRA92A9RkksfO1974HlwkAlhYwpRdGCse5dk1f6pFuGIGikF
	d6BTv/DZx0VhjfjAcxHx0AenItFIns4jJs1tyz6n5i7TLyfbWQ9InGGyCIE74zxFPco0D5jGBkK
	68rmlb6Vr6YEQt/MEOvHWLbI9YDq77fMudKnGipeqeCZQvBhAs1iELzKSfrbgz9jA59y05k0hyC
	vLEUpRIlFetN8Ob/gBZGa9KNWsMB0C7ASBsOLzWL/Ywqc+bLqA1FgiQPiYxoy9JYqVdbNjEb5to
	B8wZhm8e6D6peIBHcAbaVp1CiQeQXQpzcf0l9ARHa4eBXV+tMnWjxipe2ehUPmnmoJCCQV3tyCs
	Xi6C0L3xWaM8ouV+MjBwtlZ0yxCyB8rd7xrpTo9LWZeb9BZ/uL3SuS8KfDgq2T+enGPCurGtOE
X-Received: by 2002:a05:6a00:8c02:b0:85b:635e:7814 with SMTP id d2e1a72fcca58-86169e6ed2bmr35785667b3a.12.1788817596923;
        Mon, 07 Sep 2026 14:46:36 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615371e5f9sm4763519b3a.47.2026.09.07.14.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:46:36 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Jaipaul Cheernam <jaipaul.cheernam@est.tech>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][wrynose][PATCH 2/2] ca-certificates: upgrade 20260601 -> 20260816
Date: Tue,  8 Sep 2026 09:46:21 +1200
Message-ID: <20260907214622.3484241-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907214622.3484241-1-ankur.tyagi85@gmail.com>
References: <20260907214622.3484241-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 21:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245307

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
---
 ...vert-mozilla-certdata2pem.py-print-a-warning-for-e.patch | 6 +++---
 ...date-ca-certificates-don-t-use-Debianisms-in-run-p.patch | 2 +-
 ...date-ca-certificates-use-relative-symlinks-from-ET.patch | 2 +-
 ...certificates_20260601.bb => ca-certificates_20260816.bb} | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20260601.bb => ca-certificates_20260816.bb} (97%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
index 1226508c98..001b468624 100644
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
index 1a29da756f..dcfa355411 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
@@ -1,4 +1,4 @@
-From 63086d41f76b1c3357e23c6509df72d3f75af20c Mon Sep 17 00:00:00 2001
+From bab2e13b69af12c1864cccf371ebc4ef57a6fec2 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 6 Jul 2015 15:19:41 +0100
 Subject: [PATCH] ca-certificates: remove Debianism in run-parts invocation
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch b/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
index 929945b56f..4d97c81b0d 100644
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
index 1bc64fe34a..9dd3a05948 100644
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

