Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD1DAC982DE
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:39 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1709.1789682909118750693
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cUQd+ENh;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so654015e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682907; x=1790287707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o5aL+fvqGYA3rcrCveOkhNH2DtGceknKLUuCvB57fmI=;
        b=cUQd+ENhASgEVj9mdoIvn12w4+tpmpZ7M+IeZu3kDLPwd76fglodUAsF62Sv6WfhKz
         XMPzXQt0wKAskz3x/nt2J0B9tKbsHhgy+UOlMUzJk+HasKRSLiALJzLrS6cvaeRpYt8E
         gcX1XXWasCWg/iFVSJO1hu5WZlP45RyA9Z3O8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682907; x=1790287707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=o5aL+fvqGYA3rcrCveOkhNH2DtGceknKLUuCvB57fmI=;
        b=XgNCC5NMTE42Ky7mKXONYX18bWlqUhsSlyslJJnlLwc6AS3sQg5ra7E0EVKzShrARW
         c4bKk4UwE/zu61bb+4meoicXDM42nkDrslzXURenALvbLG+YPdSa2/iY9kfMUJRR2mfR
         kMabTCgNFbhX3TQWC5WwrhL70TL8j+0qQT24js5FhyhKkpVAj4KMrvsS4xwUg2lRUwO8
         1SwBrXSvdJutgJkzFqLBvVu6xcCdM75vGqwK+OPiqd7YfEKCrXy1X3T5CBWYH1tEAMzc
         4UaDFeGOzu+2YozAENuWv4ZzHUOZNkLxRi5J6dmOdm2DMFE4j+UmI2k4Zs1YqRlQCF+W
         flkQ==
X-Gm-Message-State: AFuF++kDeNTX7YVNZpBbj59uT4fT9BReEtmjsfUW/RWHaDS4yItwo77r
	Fz0uHuLUmWY1cl36YPzgvoyXqlBbzPHeNn9m51OcNS9W36NA33fzatc5OtFwdsjOLtu/nubY5i7
	nGZ9CFt8=
X-Gm-Gg: AYBFou0iSzxjWbDRu8/+4wt4tmm4wKOLX97uU2aSWwzfKCoXbD5CSIg/04DQdFAxIgW
	Tnvxp39rRGIbu3Q6Wt9tima5Fxavt7NRJT0NPTZ45gbQioqLInTKROOuzpnoIuCeVp7dfvd5+4d
	WpU2OEz1IxumOGMPEEwNM5nbNZzMWYT6wLIQMGO1/RrkkEKuRg/4nBFgxrYYxX0gUiBY0Goq7/C
	wPJoMkFFRuTLEMenjHaW48lVYG3HrIngM22rVmx7TF3JumC+kE7fUIe7P4wXBCal4BM5XJzWAVS
	uRMjj+rh168tK0uCvFCnE0pXlItB8WP4zyuuLFfPwob0c7UB+H7envrhE+x/bzzyFrfgzeiYnPG
	F6DFW+Cn0JfJljJ8dSEH9Z9Qhzch6HyeGu6HWcJKRcMzj1XSC3xRJKzKPPoOCaFBvO+A2dqqeo/
	91vK4Uc/d9XGMBJLsZlRVeh7cep3apJ2QL0b9Thuopl0BgCS0VcL8XGuKak7IshaxqUmivTN5Mh
	f5dYEeLuIIy73M7/Tg1Kyu2+4co4UA2uwPlssBhIfK5PWtIDOl0YxF/niWBQ1SPaa8WDsp+wNs=
X-Received: by 2002:a05:600c:34c6:b0:49c:fa20:cc0a with SMTP id 5b1f17b1804b1-49fc5742ebamr2464465e9.33.1789682907438;
        Thu, 17 Sep 2026 15:08:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 70/79] ffmpeg: Fix for CVE-2026-64831
Date: Fri, 18 Sep 2026 00:06:55 +0200
Message-ID: <93c481ea002a8defebf022155ebbc7226f989647.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246165

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/92737390dc133daadce47dd7d2ec8ef3d9ebcbed
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-64831

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ffmpeg/ffmpeg/CVE-2026-64831.patch        | 36 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64831.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64831.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64831.patch
new file mode 100644
index 00000000000..29218b3608f
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64831.patch
@@ -0,0 +1,36 @@
+From 60044ad2b2dbd9a728a1471b0e36eed3157a6ad5 Mon Sep 17 00:00:00 2001
+From: Pavel Kohout <disclosure@aisle.com>
+Date: Tue, 30 Jun 2026 21:55:49 +0200
+Subject: [PATCH] avcodec/vulkan_hevc: reject too many VPS HRD parameter sets
+
+Fixes: stack buffer overflow
+Fixes: tD7Mj0ST7ND3
+Fixes: 82864c21112157951ce91b4430a9018edd02f5ab (vulkan_hevc: use VK_KHR_video_maintenance2 if available)
+Found-by: Pavel Kohout (Aisle Research)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2026-64831
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/92737390dc133daadce47dd7d2ec8ef3d9ebcbed]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavcodec/vulkan_hevc.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/libavcodec/vulkan_hevc.c b/libavcodec/vulkan_hevc.c
+index 5e15c6b931..34676113a9 100644
+--- a/libavcodec/vulkan_hevc.c
++++ b/libavcodec/vulkan_hevc.c
+@@ -875,6 +875,9 @@ static int vk_hevc_end_frame(AVCodecContext *avctx)
+                 vksps_p.vcl_hdr, &vksps_p.ptl, &vksps_p.dpbm,
+                 &vksps_p.pal, vksps_p.str, &vksps_p.ltr);
+ 
++        if (sps->vps->vps_num_hrd_parameters > HEVC_MAX_SUB_LAYERS)
++            return AVERROR_INVALIDDATA;
++
+         vkvps_p.sls = vkvps_ps;
+         set_vps(sps->vps, &vkvps, &vkvps_p.ptl, &vkvps_p.dpbm,
+                 vkvps_p.hdr, vkvps_p.sls);
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index 8c1969369b6..02b9cf65a5f 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-ffbuild-commonmak-Consolidate-pattern-rules-for-comp.patch \
            file://0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch \
            file://CVE-2026-64830.patch \
+           file://CVE-2026-64831.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"

