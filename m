Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1B7CD3423
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:29:46 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9359.1777739382836955115
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=et42o57v;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d75312379so2149961f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739381; x=1778344181; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5r9qLMh1R4n67Hds9KHgbw8tGwNX96ohjtGM7uFZJ+8=;
        b=et42o57vzziSmUx0KucaWg0Vmorc6K+EW5eiGT0ZuNWj3hc+GRAVq6zsga+iXhTe5D
         /oA+kuFSRD54jWBfgwcwYPxJwCIAhdtJ3s6gvEYrAPHDkzTizgquY4/UA01G1Jl8J1Mv
         CuHQ3BQXoNGrFq1mpmWmlOSjzDvuFbFsjeAD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739381; x=1778344181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5r9qLMh1R4n67Hds9KHgbw8tGwNX96ohjtGM7uFZJ+8=;
        b=ddSVfbFzhHMFnt+HRWqTepMM0q0Tg/EDjTkbcTzi0HPOBfrDAgdqJ/rGthA4LUkrUx
         bQYcONDGcGdAyFCwnpdPz0FyRDWj+Q0eOJbyXKGHhhb6Hfbvl1bR5jvaQOdDlAO40JN9
         O89cumIr2yIcFs4vZBq4lFVuj1rhw778JMiPt0I6gKXyXv0WpwDMqwsawT1uB6YaRFNz
         BkxsvZ7G+Jfh65AmJ/NlfH+K8i2in4TSxA5PxzAhdHzPq+VLiOCCfLhfdvlo2Q4P978B
         gd/8dGSR1CWi2iHq5a/l+vA+tKbcgVwMg8ZfoD+IACh2meUZnx5FCXH/aaA4TB2a3oCu
         yUmA==
X-Gm-Message-State: AOJu0YwzLgGNw1Ypn3tg2+p4f3hoE72sKa7tSAwd5YirFdkYf25BARa5
	9XDlImns+/cSOXIqyVyk8dVh33rxtDuJfrRrRpgLuklFaO2kN5+3UgbvRhNr3T4AoNjnpS8LcbF
	da3TVHuBhf81o1JHEcE+zNjLp5cr8OH0eyQreEQ3/L3Ixf6U5aa27kY4IUkik4K15/8gQK1NPdJ
	dy/6Mliev4xdWv9y8=
X-Gm-Gg: AeBDievXvQiqrmCZpL+Q5xemvLgM1qYuGcy3k7EsSR1n8+l3hyYP9UXZEEUBk/jVwAX
	1S6CdoVU3yo8HHLxFcVCE7jvwN79+95jseS4zdHWqK2GRQarA0/5uEXzS3KA3UB25G4mJiaFY39
	3JAcKLtO1FHK/m1sosmuaklpUtISPZdKTMhsxgSnW3BZtMo+WiN5Pliha1UB3BeFozdiYqdLhAA
	5lQopERZGyGi0b7eDs3tQLrqH/evdb3OPBbiEfAPvkyDlfZOZjb0OvkRlOHNiWacEo2sJysn829
	cWL+Cc7TwvPdu6A9zmd+53tqlDsWGSABxQSkI0j1p0KYZJP7Sx5lCmTqISuWa7+4ArjHSCU4OJL
	t6w6Da2n9vH/zfN82wHS0q2MMrEeDUafqfYZvxv9gcRoYPvReZFqQTDGGy+UfAULQIn1HytQ0BC
	P8cqF472iQ2aMRwXKM2Qdr2LAVxlwzbRKxAo/pt2FafXlZiu1gQumoI6SuvP7Ehk0=
X-Received: by 2002:a05:6000:2c03:b0:43e:a75e:352 with SMTP id ffacd0b85a97d-44bb34e629dmr5762908f8f.4.1777739380807;
        Sat, 02 May 2026 09:29:40 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.29.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:29:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/62] epiphany: upgrade 50.3 -> 50.4
Date: Sat,  2 May 2026 17:28:26 +0100
Message-ID: <20260502162929.1377831-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:29:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236315

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../epiphany/{epiphany_50.3.bb => epiphany_50.4.bb}           | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_50.3.bb => epiphany_50.4.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_50.3.bb b/meta/recipes-gnome/epiphany/epiphany_50.4.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_50.3.bb
rename to meta/recipes-gnome/epiphany/epiphany_50.4.bb
index d5cacc848aa..8fa187828bb 100644
--- a/meta/recipes-gnome/epiphany/epiphany_50.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_50.4.bb
@@ -32,7 +32,7 @@ SRC_URI += "\
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "032d6a41e2a079cd41b05ca7abfb3870adf0353d1566194bed8790953a894640"
+SRC_URI[archive.sha256sum] = "1e26f9901f0f08bfe943aa70163c953334c7ec3d4aefc8d354e8a9c140b334a7"
 
 export GI_TYPELIB_PATH = "${STAGING_LIBDIR}/girepository-1.0/"
 
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index 6c00ab9b40b..3506113945d 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 91045ece41faefbeac14b60d7b19b0c652e586fb Mon Sep 17 00:00:00 2001
+From 00469cfc5818c776aa02546e9e5643a5cf903e8b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index 54a3305aafd..4d3e13bb31f 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From 46084da03b5f20423a2946d988c68e9ea9339c9c Mon Sep 17 00:00:00 2001
+From d3a99151068c9abc231cf562b2875bec83ddd1eb Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
 
 diff --git a/meson.build b/meson.build
-index df0340c..8ec6c79 100644
+index c7dedcb..9518ced 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index 8ebcdc99915..0aeefc6f2b9 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From ca504370b9aa893ceac21141d8f24e28a474b674 Mon Sep 17 00:00:00 2001
+From 435d89fd265c334fc4b64a315d6d2732853c4463 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue
@@ -14,7 +14,7 @@ RP 2021/2/25
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/lib/ephy-profile-utils.c b/lib/ephy-profile-utils.c
-index a2f6181..5218077 100644
+index ea2ea99..13c27c8 100644
 --- a/lib/ephy-profile-utils.c
 +++ b/lib/ephy-profile-utils.c
 @@ -130,10 +130,10 @@ ephy_profile_utils_do_migration (const char *profile_directory,

