Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37B2C47087
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web09.1093.1649350860788846505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JG+St2ty;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id bq8so12142991ejb.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GPzAfzb+3IeI0PV8tguxkGBbHLbRwcZ9lFaOGxiGtY8=;
        b=JG+St2ty/NeOeWq9IJ7HWPS7fJL5E0a96OjmmkKOK4/vq7l1L57kSmz9tjmrMMRqBs
         N/gJ4I4neWcqoF40wDccGzsgVvuf62tPZzGOOsMERWJI1WeJpmHb0Gp0s9hFiV4B5MWm
         Fgies7lVs5FWxhw2g3hOfbooywHuX/uF0qwrtpaOzSKeRqfQ2a3hkEcJjL+3BoaAcREv
         IfGVdcaoTIHoeR+1bTy8DtQeBhJ0H7/M0Yq8zG0iD+/lGFUOlOtB0ANoYRbxXWyE3Kdx
         Z/ZxwhzCSLAMDm9UdFRwRqj+4SsYzcTBqZHi7Nd+i0ZFLb3Jb1+rE0tM3Y9QGi8SWIq8
         6Q3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GPzAfzb+3IeI0PV8tguxkGBbHLbRwcZ9lFaOGxiGtY8=;
        b=0HnZOhBP3wqon2e6Jd1fLKgQkzhJRmoZVTGvtGYnMDaHYkgsUgnrghZx/9fBpEV7o3
         aPqb5YrVETCfYeaWGSzBQI+XPwm30DhtOs2Fc0Fugz4WuxGf7xMN+P2PD0JHlOcVulbJ
         XCPDwz/SthcIFSFxR4snsuHDMxOL2gej0g63GQd9ucGbT5wURey0UYObn8mukaZIJ61O
         MXydWboGoY94Be49UgCHsPfiON+Hi7OShBFRcDwqkMdZrCknFalfl4Wzehms3wMpOaX3
         PxlU99jaZ1T/sjgVH4SNpcJVQzwfRbY2GzYdKPhc6EkO7j3akr0a4qkVNFqAFYWZ6YyM
         zmjw==
X-Gm-Message-State: AOAM5338qRkkh73bO1Iot/rFk3bS3LjJbXZyrTNm72VGGg8heGEbFSDU
	rZQEkl0N2vVqnc8rCr7StMJbhSi/u7I=
X-Google-Smtp-Source: 
 ABdhPJxT9+y3EzGIQWek8tW3Xzuv2Acq2RmWFdN+e62hEfsJ6FkeqdO+1TnmnvqJIg2dtSCt4dGrpQ==
X-Received: by 2002:a17:907:7e94:b0:6e4:9d72:a784 with SMTP id
 qb20-20020a1709077e9400b006e49d72a784mr14056658ejc.346.1649350859306;
        Thu, 07 Apr 2022 10:00:59 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gt34-20020a1709072da200b006df6bb3db69sm7796879ejc.158.2022.04.07.10.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 10:00:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/17] librsvg: upgrade 2.52.7 -> 2.54.0
Date: Thu,  7 Apr 2022 19:00:28 +0200
Message-Id: <20220407170029.3500874-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220407170029.3500874-1-alex@linutronix.de>
References: <20220407170029.3500874-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164132

Upstream has replaced gtk-doc with gi-docgen however it is not possible to
configure. So it's disabled until the merge request to do so lands:
https://gitlab.gnome.org/GNOME/librsvg/-/merge_requests/687

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../librsvg/librsvg/0001-Disable-docs.patch   | 24 +++++++++++++++++++
 .../{librsvg_2.52.7.bb => librsvg_2.54.0.bb}  |  9 ++++---
 2 files changed, 30 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/0001-Disable-docs.patch
 rename meta/recipes-gnome/librsvg/{librsvg_2.52.7.bb => librsvg_2.54.0.bb} (85%)

diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-Disable-docs.patch b/meta/recipes-gnome/librsvg/librsvg/0001-Disable-docs.patch
new file mode 100644
index 0000000000..13d25d4f08
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/0001-Disable-docs.patch
@@ -0,0 +1,24 @@
+From e62887dfa36812d5b8bc1c2c2fec69ba985309d8 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 5 Apr 2022 09:21:14 +0200
+Subject: [PATCH] Disable docs
+
+Upstream has replaced gtk-doc with rst2man and gi-docgen in a way
+that is not possible to disable and requires g-i. There's a
+pull request to address this, until then let's patch it out:
+https://gitlab.gnome.org/GNOME/librsvg/-/merge_requests/687
+
+Upstream-Status: Inappropriate [see above]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+
+diff --git a/Makefile.am b/Makefile.am
+index e380bc9..5b3fbb5 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,4 +1,4 @@
+-SUBDIRS = . gdk-pixbuf-loader tests doc win32
++SUBDIRS = . gdk-pixbuf-loader tests win32
+ 
+ NULL =
+ 
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.52.7.bb b/meta/recipes-gnome/librsvg/librsvg_2.54.0.bb
similarity index 85%
rename from meta/recipes-gnome/librsvg/librsvg_2.52.7.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.54.0.bb
index 78eb93c635..96c54f16d6 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.52.7.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.54.0.bb
@@ -11,16 +11,19 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                    "
 
 SECTION = "x11/utils"
-DEPENDS = "cairo gdk-pixbuf glib-2.0 libcroco libxml2 pango"
+# Note: docutils/gi-docgen should be made optional when upstream enables that
+# https://gitlab.gnome.org/GNOME/librsvg/-/merge_requests/687
+DEPENDS = "cairo gdk-pixbuf glib-2.0 libcroco libxml2 pango python3-docutils-native gi-docgen-native"
 BBCLASSEXTEND = "native nativesdk"
 
-inherit gnomebase gtk-doc pixbufcache upstream-version-is-even gobject-introspection rust vala
+inherit gnomebase pixbufcache upstream-version-is-even gobject-introspection rust vala
 
 SRC_URI += "file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.patch \
            file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch \
+           file://0001-Disable-docs.patch \
            "
 
-SRC_URI[archive.sha256sum] = "057c1eeeaf85c84e254bdb707459207f5840da5b4d52b4711c03140ed09e6887"
+SRC_URI[archive.sha256sum] = "baf8ebc147f146b4261bb3d0cd0fac944bf8dbb4b1f2347d23341f974dcc3085"
 
 # librsvg is still autotools-based, but is calling cargo from its automake-driven makefiles
 # so we cannot use cargo class directly, but still need bits and pieces from it 
-- 
2.30.2


