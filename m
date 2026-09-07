Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A23E9C79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 22:28:39 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6928.1788820116223376376
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 15:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sBGWBF0A;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d032846c95so43737505ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 15:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788820115; x=1789424915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PSGQWQnt+zOZj67RUqj1knAza7PccQ22DvUYKge/Zg=;
        b=sBGWBF0AEJzllLN5JLOidG9c5sfS9OMWe/9fZCCw9C1yR5cxJ/kisaBvIlxkWZ+HvY
         0HoSSciKbTJC/oo7MBEYqNpHk+QxIelPC+lwBEJEihcLI1OMKmLGjtt0bsFFdwAe1iFk
         rBKZo3SeNVu0wYyH/kFPUx6oZFkhX1mR1A90Nldwn3i59LFQos9C/MPOgQde52t4c3y0
         FCIUPwPNiEgHIeblurMiHAOwajXt9WLTf/rIfs68t5f9M+igPPiHxjdoUThEvkOtJ1SC
         1jmdN+zR+feDijjeGIm/vGSQUsQ8HNiG6BTw2EehIc2Aam0iJ5/Dmu4p/O6ydf51n5zu
         VVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788820115; x=1789424915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9PSGQWQnt+zOZj67RUqj1knAza7PccQ22DvUYKge/Zg=;
        b=P99gNgvF8vWjTJNzBBqH1IKTfZthNVfZ/SOF1IZeTbT7Ukt8/uN8iiyGl4osOc53A9
         oeIG7bM99pi6GGtKnZADrk2KpgV81WGJbKyj54y9sTj/lwtKYe97YJVS0z0/jX7MJqXl
         nW/ZHlmxdD3X88GCBAyi81ixc61tz7vl6NC0eGuFTC/LxFgn7XTHkUM0xG2lt2NjtrRE
         Kk0XXdB0N3dgze9PGpIavg4UEb5LbveZJaLn7bUDAfdQFt1ykNf9TlPtDu/UU5ponk1S
         wKXhX2w8DPy/W2MiuHfslQGb5fX5329NHyOfKq08yWvKTI7QlrPZ/1F3poxnGxfzZsq9
         2/Gg==
X-Gm-Message-State: AFuF++kwfEw1Yxcaluq2NEsJLIipMIyrOmu8dsRrG4NeME5u3F+1Y8Vm
	sG8Jq+URYwZuaBnoo41mcetyb19CoL4mhBrBupjeRPrYBFKjzkEqyawVfYX3xTzA
X-Gm-Gg: AYBFou2XkrLNWeRSQpvCKAOeH7qYV+MuEXGxm/WJUL0JxnCfF2o+AAEkLqirqPB8rS1
	yjY5tK3DtcrYGImiYejuUA3MDFVhYQvBswWbgSdDSjLU0iN9FOpqvC5rSO+QHWi2orUbqreyzbY
	MtCswEH4A4ST3miPjbgmSMEni1pVpIDhA7aNPBKZuitW5PZDrvuHp0tbQlbhR96tGUjFX/GTFPp
	qRaYQUhzvLhJSWThJgCmVk8WbNyPDfVr/3seJSZvB44s4grAZ7j0+Et2odrnCDC3REIH4475Mbb
	8BUSg10fIxPx7qY2AzjGyv66f8JYaVgwoTT+aWy0OtafGxLYOlcclJfX74Ua7VxX+aWnzWi/f1f
	BfceHcKcZSY64SrXoJAULEX9FmaoVK1babvQobpZhJZmj7qyWkqOOP/JGBoZwubeJnc9uT0ht+O
	rR154IIBOR3PQ7+ZO2FZ+tv8klFI8T/6m2+vBGSxk3XqwyEDH2UvfqhTbUTF45p4eD964EIzbj+
	okNu60Vq48=
X-Received: by 2002:a17:902:8bc6:b0:2d9:4871:393d with SMTP id d9443c01a7336-2db1267fbf6mr236407865ad.21.1788820115461;
        Mon, 07 Sep 2026 15:28:35 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm30022489eec.17.2026.09.07.15.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 15:28:35 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Jaipaul Cheernam <jaipaul.cheernam@est.tech>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][scarthgap][PATCH 2/2] ca-certificates: upgrade 20260601 -> 20260816
Date: Tue,  8 Sep 2026 10:28:19 +1200
Message-ID: <20260907222819.410906-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907222819.410906-1-ankur.tyagi85@gmail.com>
References: <20260907222819.410906-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 22:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245311

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
index b23f20a782..33ca9291f4 100644
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

