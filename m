Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB7ACD37B8
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:40 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8167.1778224350633879179
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ATPN4aua;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so1186683f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224349; x=1778829149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q5xkKxCL3Jzsz3b6I3G9J3CF3bgTKUICtGA4MgL7tWk=;
        b=ATPN4auaHbLlfhwUcbXmbu4SA3gT5MAgj1VZ4KUChPsb3/xBta3z5kuMpjh8YGH5wl
         AhU1uhSD65yElkQv0yi0BLjXMtbb1hThg0ewWdQ+Vd/EnyyjuoF3LVhxHldRKyz+S2LB
         Sgk7223JiAGvO/lJLPUgdLM4gHvI82SA6Bmnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224349; x=1778829149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q5xkKxCL3Jzsz3b6I3G9J3CF3bgTKUICtGA4MgL7tWk=;
        b=RmM9rkfo025CKV+GiWda8ico5XqOz2/bZBUy37Hgam/5AXE/9OuH/4lvo1QuJl0Ezk
         U6QJpKDcDgUfkGIs5KWAAAp5HPZotzU7cPoMHhQFi4JNhEZjNzMaTfHAH1Vp/GlmXNkk
         R0+1MPhDkJPlat+fYF26PHKic2Dp0VnFsrWwD6qiIaTntO4Y57REKRam7Rs2uAseBZnN
         FDCoSMALFY/e2KRT8apVjJ75oUNQoA3k2QpbKktQtijR9BUp+CCXyR9Eo6LZ6Zwu11KI
         KMtmq6Lcwp0C8mHgHDeFHEWIgCpWarKurvfWuE2z+ZjBf554fp2VcRmE07twsP366nNU
         mUnA==
X-Gm-Message-State: AOJu0YzVt66V/4GCrInyrWWHSUhSrZ2XLZE7XN+1kdsKb6F4hTZp6k87
	NeG3EHuj8XYwl9hfkBJnO6czCkTbQg8wHBiHvMlzZnrxYvmfhjneive/0X9Jcktds3SDF8g6OdH
	ZeUBmxXM=
X-Gm-Gg: Acq92OF/wNTF3GrUkrQsEKyyYrJr5b/9+YeaJoIWVgwuZDYe6twT1STOsbcDoIUkzvv
	1psb0E4D11oV0U13joy/zR/o9zFvfmF4nDqRXUuEtjCp2JSBVBQeppe5PT6vZou3euio3mZnCAl
	W1+BrxcGDwPAg+3PwnYZ13Kb+rgjrCv1AM/BSmRYx9QbJwI1GksGl+/DFP8TgXo4h5bQrT2GRKZ
	DXomCU/v0L2oQDFSrJQcVzBGaKJ53alXrABZDvPuzX61T4htCbsfKOGAbu47SYidEHXtpxg8eEJ
	x62eh3k/tNGTx/ncWnWrL4wuoysdHzfGkO5XNrCL+pSZ2mWMdz11ETi4kECRtun/Ds/e9np6JMB
	PgHgHsI05ee/Px/wHlNt2LSiIwIQlwXKeUXV9wR6S9s86R+/wO+rRVXuWbStTNSfvbEwluDaQpM
	/rYS1UCh4jL0/wnsaHU/F5GD1Pe3QWWCM8r7WLw6nNrqgF5h17Wnh3bME/l9f/MvImATGamTp4P
	r1Zp2y1CcDRODL5sWUqofA+B84=
X-Received: by 2002:a05:6000:2386:b0:43f:e938:1e67 with SMTP id ffacd0b85a97d-4515d99fff7mr17756950f8f.38.1778224348626;
        Fri, 08 May 2026 00:12:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 25/52] gtk4: upgrade 4.22.1 -> 4.22.2
Date: Fri,  8 May 2026 09:11:18 +0200
Message-ID: <aba4e1e7bb58de35c8c4c404dd5b28319560e8be.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236667

From: Wang Mingyu <wangmy@fujitsu.com>

Bugs fixed:
- #8117 Docs for the new SVG parser?
- #8119 Wrong colors used for fallback symbolic icons containing classes
- #8125 svg: Animating hrefs does not work
- !9590 vulkan: fix GDK_VULKAN_FEATURE_SWAPCHAIN_MAINTENANCE check
- !9660 Various Vulkan fixes
- !9665 tests: fix libtestutils build under Windows.
- !9667 Update Serbian translation
- !9678 testsuite: Add dmabuf compare tests to needs-udmabuf suite
- !9681 dmabuf: Support dmabufs with fewer fds than planes
- !9682 Update Galician translation
- !9701 Update Turkish translation
- !9704 Update Catalan translation
- !9711 Load less icons as symbolics
- !9719 Fix traditional symbolic fallback
- !9736 svg: Fix invalidation
- !9739 Assorted backports

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 4d325cb65a0a62af5a34872485dcde5a07765659)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-gnome/gtk+/{gtk4_4.22.1.bb => gtk4_4.22.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.22.1.bb => gtk4_4.22.2.bb} (97%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb b/meta/recipes-gnome/gtk+/gtk4_4.22.2.bb
similarity index 97%
rename from meta/recipes-gnome/gtk+/gtk4_4.22.1.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.22.2.bb
index bbe595c376a..f2cef8d13ac 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.22.2.bb
@@ -33,7 +33,7 @@ LIC_FILES_CHKSUM = " \
     file://tests/testgtk.c;endline=25;md5=49d06770681b8322466b52ed19d29fb2 \
 "
 
-SRC_URI[archive.sha256sum] = "cd7b5a9c41127da6fb321c5a842ad73c62e6996f9ce3f1960ca509f6559d55fc"
+SRC_URI[archive.sha256sum] = "b1c987370a0c30780cde351bdbee02eef816728f1c1c2ec7c8093281c0709ee8"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 

