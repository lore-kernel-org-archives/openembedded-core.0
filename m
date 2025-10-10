Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253FACCD183
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 02:51:11 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.2329.1760064661760427901
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 19:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dp/2gs3E;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7811a02316bso1160212b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760064661; x=1760669461; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NVb10l57E/6IzZn8zpFywYt8vcqq3IIkAc76gXP9yuM=;
        b=dp/2gs3EogfV7JMWn7pwSw8uXFWwp4r5orHm94mFqu8DmgMmFsfEWY7ASdXBYUEXaD
         TJT4fhanTIhBS365klsi4mQ7D87wFUXJf06HM3XOs+xacPjFaXaPnRzmSGr90c667Tj2
         tzxuwF09FEakwcKaiql9RA6Fm3tyH38SyewGVvJXPQea1M6+9te6bPsvc3FMagfc+wD7
         R7p1y/jSDJETC0+rNHRwsBvc4L9+3Qo3pe3EL4S7AlX0+F4ZS4IQAd4P+4BG2Yu23JGj
         waEj6dPh2sNLvAobFCZQNPMGheFImCRrrkaG+Y4xhqtrL5Gyb3MhWKaa1FUmMS95xYA7
         nxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760064661; x=1760669461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVb10l57E/6IzZn8zpFywYt8vcqq3IIkAc76gXP9yuM=;
        b=mtQgn2KaBa12eJRzdFaaafWCGwX1XNfZb0vJKipevz5JJ8Bzx/l0i5vlNnr5xquRxF
         8z22lzDakpKhEjPbgkG+iI69H6EnZwEmH8BxwVpGo9u2xENsUhP1MM93+UKP3p1XAK/t
         oTc04PIJSQTGHMn1idLuUuWc2HcfnKod+2YQWpXOxmVHQO/r10LinjIuTZWv6Vdiv6Ye
         VTL7mU9B/PHeDVcM4SaJJQAV2LGeX27g1vqOSI1pFjVcvx81ijtLLIXemcC17Z96yepG
         TH2WH8a/o7AjiCm+xql1eu7bNZ35M/PbsyuJa0GLfpK/eKLLsi9A3ANHPPbpX6pbgd4N
         d2nQ==
X-Gm-Message-State: AOJu0YxZEB4R2Tfn3l0AMAqqwn2gK4e0/l8x3qF5nVBK6maRR+me7qS6
	AENhvijLseXlnOTidwL6v5Hb0OTjqLm1kETGzG9saA0Sl45mhAY9hk0Bl5X+5/gtIfXNFfeW8Mt
	JznJ7
X-Gm-Gg: ASbGnctOSPmFaHFHzbSC1Os7EjnwV0TBVb0hXPoE6DvlruQFIAIdtiA2vcdDaa7D41w
	bUaIz+ph9Zz0vBxG2Sx8Xe7R22A/NkQtf18iolkdRAg4e1njm1ED4qqXGevM+wlTMBqJyFIccim
	i2dH5whbMhAlccwhsjQAGHlPaFluIGCp3RUBUq2i0VDZj073/S6cptaCueDXrc4nthHBrgnLlWA
	umkAog8gu9p1UTLfv3SADSxkOLtvCpiMr1tFRCBQ0lRlO5TAfALkS3SlI9ckF96AjJUB3iLY89S
	b4zMyZI3dausQAD0LRsxzuEM63ChIIgShrm9/iri/m1008DcmUCqlo8SOUOaOaKj01fWTzUGdfg
	kkzRnSBkB4MZSM9qFBexdyvKENm/tDgmJ
X-Google-Smtp-Source: AGHT+IFcBAQ10czuC+wk2Dx3SAcRMTBZjbpR4xfyXzkZJl06QGqev/bRM0AisDqhhb3XcpVlLUS9MA==
X-Received: by 2002:a05:6a00:138c:b0:781:1ff0:21c5 with SMTP id d2e1a72fcca58-79385708f39mr10642062b3a.3.1760064660968;
        Thu, 09 Oct 2025 19:51:00 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:abff:bce5:2cb1:3b46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb116basm1215764b3a.30.2025.10.09.19.51.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 19:51:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/18] ffmpeg: ignore 8 CVEs fixed in 6.1.1 and 6.1.3 releases
Date: Thu,  9 Oct 2025 19:50:30 -0700
Message-ID: <8286570b3baf275ff48c45ca0864348a8d3faa01.1760064493.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760064493.git.steve@sakoman.com>
References: <cover.1760064493.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 02:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224655

From: Peter Marko <peter.marko@siemens.com>

Following are mentioned in commit upgrading the recipe to 6.1.3:
* CVE-2023-49502 CVE-2023-50007 CVE-2023-50008 CVE-2024-31578 CVE-2024-31582

Following are fixed via mentioned commits already in 6.1.1:
* CVE-2023-50009: https://github.com/FFmpeg/FFmpeg/commit/162b4c60c8f72be2e93b759f3b1e14652b70b3ba
* CVE-2023-50010: https://github.com/FFmpeg/FFmpeg/commit/e809c23786fe297797198a7b9f5d3392d581daf1
* CVE-2024-31585: https://github.com/FFmpeg/FFmpeg/commit/3061bf668feffc7c1f0b244205167b3b86da8015

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb
index dbd0a3f270..38c6d1f2b7 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb
@@ -50,6 +50,10 @@ CVE_STATUS[CVE-2023-39018] = "cpe-incorrect: This issue belongs to ffmpeg-cli-wr
 # Fixed: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/43be8d07281caca2e88bfd8ee2333633e1fb1a13
 CVE_STATUS[CVE-2025-1373]  = "fixed-version: Vulnerable code not present in any release"
 
+CVE_STATUS_GROUPS += "CVE_STATUS_FIXED_61x"
+CVE_STATUS_FIXED_61x = "CVE-2023-49502 CVE-2023-50007 CVE-2023-50008 CVE-2023-50009 CVE-2023-50010 CVE-2024-31578 CVE-2024-31582 CVE-2024-31585"
+CVE_STATUS_FIXED_61x[status] = "cpe-incorrect:these CVEs are fixed in 6.1.x"
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
-- 
2.43.0


