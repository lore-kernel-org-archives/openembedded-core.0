Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C124C54739
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:41 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.9388.1724319332810087968
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gWO79BbZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-371ba7e46easo259022f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319331; x=1724924131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckVzB81xXXScn4UL8yTr9u+TBca83ESXbtmxkvoE4VA=;
        b=gWO79BbZ+xLp9nBr4J0l6J8Ccbpabah9PP1HHjxc1lBNi+jEvM/KNsOSMp9gs8HfDW
         hG2lyVHSWLNkBpk7lYaWALvbVIEHqQhC902m6Y/QSnjtaSkfEdCWkCe/uo/ZE1vG/JtD
         F/3nAYBWVkbeYOoWe6GgjTalX8URZ8x+CX3CvdY8r9iwveKFM0mj8D/iJLVqTSv+R6Yz
         NlfX6d/Rqf2MzhsChsxbgWCwyVufnC7djn9RNkkn0F7NDQbnL3objRrtiETtdwT3hwcK
         p5sCZhdRrMvEn5Js6gYe4/oCfOBdmbxNbxsBVIcJ5VKTFDs05HNsF2Z/FI80CuK09U78
         IXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319331; x=1724924131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ckVzB81xXXScn4UL8yTr9u+TBca83ESXbtmxkvoE4VA=;
        b=KSN/wCK82cZ33PtWpN0gDRmE7IJfQozWCelvFPmffs3UF8nqQUNjlaMRcCpEGCKOGE
         Buj8evq+A7IBTQuKFK/eFLUITQsVWN2+e+J+7duAeEwVeZQrtObardmNC20wfhGgAYwr
         4GOeas3RZvKoUmysIXbTuoZJCSfLLgMtPqDX0hoCWmcCWH7jgN+lBr59t9FwlczS+IY/
         6lW+0xsW9XGyTpVZad5ElU+XR8h2Ms7Jj5nW5ObyW5OYpFKX5R4Mb2N5XW6whYqOg2fe
         ouM4JvSidxbIHoAOitVN0GFInRhbwuRzzOr36wqdb2HI/J8KGZABgZRRVInIy/1p427b
         OqVw==
X-Gm-Message-State: AOJu0YxFbJLprFB7lsXB0fde++O37AdI4xABIJ9evReZIsIJpHkHGW1c
	zWPLzewPJWL2FdtXR3aYR2dprByt2vIkIhSVsMr9z5RgPktLQI14FKFoZQ==
X-Google-Smtp-Source: AGHT+IG+zkozyy4Ke8R/3hXVwroIvxpdvPdOJajtGWcsmkHhA75lB1RkhMEDen7dOeLE5Xq1UuEGFA==
X-Received: by 2002:adf:f805:0:b0:368:526d:41d8 with SMTP id ffacd0b85a97d-372fd5876a2mr3284912f8f.23.1724319330917;
        Thu, 22 Aug 2024 02:35:30 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:30 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/32] epiphany: upgrade 46.0 -> 46.3
Date: Thu, 22 Aug 2024 11:34:58 +0200
Message-Id: <20240822093521.36790-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203623

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../epiphany/{epiphany_46.0.bb => epiphany_46.3.bb}           | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_46.0.bb => epiphany_46.3.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_46.0.bb b/meta/recipes-gnome/epiphany/epiphany_46.3.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_46.0.bb
rename to meta/recipes-gnome/epiphany/epiphany_46.3.bb
index 9052fe170bb..d9ad38d6933 100644
--- a/meta/recipes-gnome/epiphany/epiphany_46.0.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_46.3.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "f4348f2cf51c07c0c106d130172d4d23f2cd4068771e1de007b758ca2ade5660"
+SRC_URI[archive.sha256sum] = "a9e1ad206449117fc5ebe4d0177c1d7a2ff503d6b55019072a068ff2ab278656"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index e5054667649..e129d503e82 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From bd45c75fe691e275d7a7d7e641ac66b153369a1c Mon Sep 17 00:00:00 2001
+From 4ec86871f8c2a854aec9e6955566fa437fd5f09a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index a2800eb62d6..ba674e4aad8 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From c297f5b89d7c8e98ac98e1d9a7506df6db6fc025 Mon Sep 17 00:00:00 2001
+From 641c9d5fc0d9f16151a20a5df2f0b4059d1130a1 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
 
 diff --git a/meson.build b/meson.build
-index e416cc7..ee5f7b1 100644
+index 2691828..c466af6 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index 1b4404c8cad..53837f448b2 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From b38a4ceaeec05efb1b822d52c43590e7fd518113 Mon Sep 17 00:00:00 2001
+From 2fcc2b3c3751b2fb63474ca78b24e4b6375d62a9 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue
-- 
2.39.2


