Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61C2C5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 10:47:25 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10359.1786704442171013948
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 03:47:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=frtxVD3m;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso10546025e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 03:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786704440; x=1787309240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4NGCD/w2Xcg0/pen+5TteuDf3Qqs/4Tj1fgs8NgiC6s=;
        b=frtxVD3mmVH9N5bqg58Ui3dWA9AYimAJND8VqjdEwAKLaJpBKNf8F2Ff1E2B0C+gil
         WvwKHpBydrexVUOirK1vGjGHvg98IIUFj9dcKdVkw+Pafj/qat+gNHeYbWlXzMv5lnkz
         1HDgHGmbfyacP1ouS1CR4AV3CNFUddD+arr7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786704440; x=1787309240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4NGCD/w2Xcg0/pen+5TteuDf3Qqs/4Tj1fgs8NgiC6s=;
        b=FHOdQ9dcAvtrmMNURhq88iMGSZikWFkFypOnAwZN/5XXS+l1ntL3mqfgw8tu/N7Hje
         DOj6+axEByjNmNMZnpYIb5YZhyLvo/EGDyN5WCeGhAV57WfiVNjbKM/H6rU4XVP5rFi0
         Vqilygs22WVQ+oZRJ/BlCQwVxotq4b6tAmbu1OT07Y3mlCDC6oKavrN/7kn3sxyt6+kW
         1mGR672yVNQ/3zcqArKVLBqm3SzIZb9pzlcyu3KWHOCkOfqvoT7JOmoJQvB81VtDvLsx
         lEwp/jikANhyrbdx9s5WLhPYedaWjy1MKh3WpHufA+U6GnVGJRS0Qa05x8fPuGQ5vFqS
         EEMg==
X-Gm-Message-State: AOJu0YxEtiMVyOpUGggyMsAnOk1mfox8nAvngg2R2OSNVse51iiuDcWL
	K6e8+Zd1rVniUwHIq6cAo6xrA263vhVPqPR0MFZSzFZxoldBTPEUFLlbZXGDAm9FLqo/x8fWkdc
	jEpWhfgU=
X-Gm-Gg: AR+sD10M1tZTUcAgR1lehE6PzPyy9CZn2LpnVP0og1lOGx61htN84g3/7W2SVxALfux
	r+zg7zczYsLShUZoKQ28iCuZVbIKdJcFQQR4QqLfe8hDdlr+6PxEOJk+vNpgPxFQq3tW2li2nBY
	YdhoI2g2E5bzzJOE+xtt5iTnLNoTCxp5JRu90vneCfTTqc9E8gFPKq36NzrHs7/PKMhdnvonxto
	bsPED4qNRH7gakEPMjB/D/uTFb79x3ykqskRDvNHW/5DEzPTceAjwBAF3xYuh4q3GUumGUk2/g5
	aqRwCSgeKdCi/41NXO79oj5fRn5q+y7SJnfkEI4nNinLI6Od102+FDIhxVh7hFpRTVHLYa0c8Ip
	QbAt9vEhn/pw4V17lXE6ABaYn1MV+oo/KFr9TtL9Fr4vrOs2LeXGmQkjVVm+XD05jkcBM71NWnf
	EjPP5BkIsV/LhhpRtM86CUp71IGiTxWgonUNa0FYwi7/cVJ3D84VgRbQToNguS3mYR9/AsAUzIp
	bwDMJ7MYmP/slEtpA==
X-Received: by 2002:a05:600c:5394:b0:495:4811:d71c with SMTP id 5b1f17b1804b1-4998796cfadmr79158135e9.13.1786704440014;
        Fri, 14 Aug 2026 03:47:20 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9095:412f:3012:ddca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499877a6e0asm26046965e9.2.2026.08.14.03.47.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 03:47:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] gdk-pixbuf: upgrade 2.44.7 -> 2.44.8
Date: Fri, 14 Aug 2026 11:47:11 +0100
Message-ID: <20260814104712.2536471-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260814104712.2536471-1-richard.purdie@linuxfoundation.org>
References: <20260814104712.2536471-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 10:47:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243436

2.44.8
======

- glycin: Support x-/y-dpi options for png, tiff and jpeg
- Translation updates

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...meson.build-allow-a-subset-of-tests-in-cross-compile.patch | 4 ++--
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch   | 2 +-
 .../gdk-pixbuf/{gdk-pixbuf_2.44.7.bb => gdk-pixbuf_2.44.8.bb} | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.44.7.bb => gdk-pixbuf_2.44.8.bb} (97%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
index 2b41d1cca9f..bdd94b558ff 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
@@ -1,4 +1,4 @@
-From 38bc595a5c365074b924ed2706a402679b3f6df4 Mon Sep 17 00:00:00 2001
+From 29e3a3675d2d5e0d23d4d10c5126f80832ff336d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 26 Jan 2023 20:29:46 +0100
 Subject: [PATCH] meson.build: allow (a subset of) tests in cross compile
@@ -22,7 +22,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  2 files changed, 9 insertions(+), 7 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index b88ef70..b181054 100644
+index 2bd6092..63a05bf 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -434,10 +434,10 @@ subdir('gdk-pixbuf')
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
index 2dd790115d7..7e7838624d8 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
@@ -1,4 +1,4 @@
-From dc1096f95914b7faf786e3c2682aa0b453605a3f Mon Sep 17 00:00:00 2001
+From 269cf3b1b42f24af59f1f0be4ee874aa986fd2e1 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 1 Apr 2014 17:23:36 +0100
 Subject: [PATCH] gdk-pixbuf: add an option so that loader errors are fatal
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.7.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb
similarity index 97%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.7.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb
index 8efc14b59a2..71749280764 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.7.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb
@@ -14,7 +14,7 @@ SECTION = "libs"
 
 DEPENDS = "glib-2.0 shared-mime-info"
 
-SRC_URI[archive.sha256sum] = "172f80e3626ec31520a970400f1a3694e04718f6c2cd2885f75250fb5a6995a4"
+SRC_URI[archive.sha256sum] = "919f529512961a12e81cd4b4b466a48c3933469e7f9a310c6513cd4fb252ba3c"
 
 inherit gettext gnomebase pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gi-docgen lib_package manpages
 

