Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E9EC61DE2
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:33 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3062.1787945910696322719
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hs4EXygD;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b0dbfbf7bso9385295e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945909; x=1788550709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W5Hgt9YwQt6jCaRqAav7dyfuTGGEOdQvLu84h72Y9Og=;
        b=hs4EXygDQNAvVIeeI8kgMA4wKraABVbfRcp+/6NFGQS8JMU+C8OGc3bkXtMxGQmQMC
         MmuWIDrUbHDYIubjECLBCG3CE9VLct8ohCVetW5deLhIPaIVlIJrWr/ryMtzVBmfbb3w
         wSnu7smZaUh1cbJXE1llYS4MwkBNMqS43AxdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945909; x=1788550709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=W5Hgt9YwQt6jCaRqAav7dyfuTGGEOdQvLu84h72Y9Og=;
        b=QnhWGTacuSHvqgrDmXgVqdkh23lKfol1F66yH+196JJGjqtoJcNk8T06br0+/HkA94
         gtQbGX+Jy6Vf4d+2huhs9iOpX85KyZjgGxPdTmjDLR3s2MF8EpTp3L6KV9/+cbz23oOp
         iS6PIQIqG8YQcEdwz0GFGHqeldz5ZE6Q2k4ucAg7tc/NBEIonG1hGdci7vIXwH9N3nlo
         1H/ytj6SPJp9N+jCWkXkSoMrupnm5AXz+nSfoGB0jBHtFeTKerd/gQkadgumBJ1CRlfx
         2ikR7HZWZtxEORavWXtHAcc4EW82zgythSDL8KiUOrhIvXhzLlV+YafwPu2G0w7KPftl
         CTbA==
X-Gm-Message-State: AFuF++lp2YAYzm7MkUmVpQ/hp6o11z1TKSxIMIsltmsVbqMm/YcidUAM
	gOZ/d/sv66zy0RyqspZEBJkryzB9C5n6uRCUa27ZtqLQq1Yyrr35zpT2z//kARzSD4GvNh9bEnE
	R67JO5jM=
X-Gm-Gg: AR+sD10tcrBFU716xyt4u+nReoSqFDc4uviGZ9AQiWliizJbVwLjN+U3SctX9fyd472
	HU4LHhzi+vcGzP5ahNzM42XpAwpgFth4wuw7dHdJEgi/8jIyGT0dptOSCwgPlacihmv4hBtLcdR
	9XVtXnAJkPRtg23k/50HI3nmrSHypADRDCrZGgFvp5OqTubbmt6ug7C3lFNUeN+Dn7nm1bIZPGT
	xKI1BFPsKGLuO5ZjJWrvsPwwsq9siXUyQH4BZ5L26t/gpcrY97DFpuG0hq9MSRf+qgqf6mJ3Z8a
	fJL28DoyFRh2m/LhUDQBiarb3v47BLJ298kRyi2G3P0mrNZMAtDHMUw/wOdel2ae8ihNA3hwy5f
	1sRkeFU6cCXgxcoIl2X21kR7b8EASSYzYoPGGVAVCjFteKlTfOOBAqSwsKv8b3kV0HniNuOhn4E
	9q5FazwUzL42IRWnV9zT+8xZvF0T2cGpnxcsyEyv2eMCWnnfReW6lSLE8BEQwwV+hhWUJSiF9Zj
	T8As9bGJhAHD+dnN36fIbyS2h35qiz2BBFNqcc+ccwcFMzqFTk769bafNptjJgu
X-Received: by 2002:a05:600c:4e4c:b0:499:8174:9f39 with SMTP id 5b1f17b1804b1-49b91bd95b5mr77590935e9.0.1787945908962;
        Fri, 28 Aug 2026 12:38:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 43/56] p11-kit: set status for CVE-2026-13757
Date: Fri, 28 Aug 2026 21:35:53 +0200
Message-ID: <87669b86247d5181260f4325d1e5a4a59df0b672.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244604

From: Peter Marko <peter.marko@siemens.com>

This is a RedHat version-less CVE.
Per [1] this is fixed in 0.26.3.

[1] https://security-tracker.debian.org/tracker/CVE-2026-13757

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 3bb664fbba47febc9c26dd7f7965e508870a023f)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/p11-kit/p11-kit_0.26.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb b/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
index 5a42d0dc508..fde122d3ca5 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
@@ -44,3 +44,4 @@ BBCLASSEXTEND = "native nativesdk"
 CFLAGS += "-Wno-error=incompatible-pointer-types"
 
 CVE_STATUS[CVE-2026-2100] = "fixed-version: fixed since 0.26.2"
+CVE_STATUS[CVE-2026-13757] = "fixed-version: fixed since 0.26.3"

