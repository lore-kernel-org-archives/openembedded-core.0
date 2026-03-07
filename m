Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3ACF5511A
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 22:53:06 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19038.1772923977009531313
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 14:52:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Z73TH7A3;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4853510b4f3so2233445e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 14:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772923975; x=1773528775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=asSZSFR5s9lAOWJohLIOefjCUAGvqS41IV/qtzwmtB0=;
        b=Z73TH7A3vVCLvLoiDNfIbPfKoGI6bBo4hOzopGa9j0vHfJViNa9UDJBV7f58K/vj9f
         RzgY5h4NO/0822q4+k971QlbWu4lfJnMThpJen1MJMLyQ9eysSG4nQBkA9J8qHK3wegt
         InGRZDnk+JPsnYcOslDmivaVZ3eZ2tyBOemw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772923975; x=1773528775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=asSZSFR5s9lAOWJohLIOefjCUAGvqS41IV/qtzwmtB0=;
        b=sdryLOoZlf/6j+YXzjUrP16nBcpZsBeOUNMv8jCT1VkK3TJokFPCkdL+xlhytn8Vsp
         vbjciWOt08tB1vBak2ZpC5BT15T2E1/MbTM9Inkanmzz795jipIzAsBvXE8kFUQ/IAlL
         imVOvbo+VsLutCcHiV3QU+XEoOVFoGA045Ox3sTkVgR51P0DPKoQfimPdyctOm6Rrbkv
         SaxR46hZFuR2haaSY1GkMLRkhD5q5yAeOlePk+oEs/RDos7XnJFS6OyI+vb06AFj/eWA
         mj2vwD1Vs3K9nMzXpXu19hAwhsBKsko948bwwPYMD2/h/G3LInaDOnQFH8Dq52eiHMP5
         S0tA==
X-Gm-Message-State: AOJu0YwnL61KQDZLcKqXQCCz5doLcHzeaK8y2ngY+kt9SByA/EgzK/L5
	OcuzDuMG9h/aFuH50A+ibYXYIqXD96SylG2cL6Oih7oOQCG4bOjhhQtwRtO5XaigXey4y5i0TT0
	kAagV
X-Gm-Gg: ATEYQzy9HKfj9FdoOAHJ944IsAr0/tEPUsjPtvVmr88vF59RFv6n5IN8BYxXxhQA+7D
	3iJrbiioeOscHEjcKc9qrNBYh9AkIXb2jZQg1vovJ+xrr/OXXdMLpn8ktDMiBn4a5XsaXY89mRU
	njyDchvzclBNhlL0q2fpq5ak16TLhPpzj18hm2jVn6gKVA/UJcmIXbW82IXIi43EZ1pi9kCQa5x
	t7JmmFqux2QPoukIWdG+kiCaVyWhcA1sYIgjVRhkkYYULJe4dM2Sqvaam4fmoVdygEzUFXoO3fH
	paVyPrFooDoQg84Xi7Iz4UajrU6up1sfy8SkjyJVWkLNYwXG9rK1V+q9MqvxO6T560pcSVU8HBq
	ngaCmyx2UhT9frYmHYs4+PNsr+qzoAbvWzziaR9i67J2A1Ah/NKKblEwfuGE6twTICgoowD9Bq3
	qXDb9I2LEV5mNLAYhi1UXqZNu4uUETyhCxMHA/uKRFa1VHTNzIjAXe8sFdAajthvR0t5uUP2wj6
	QUdCV2k3MSXOuK/qLCR7ATcXGw=
X-Received: by 2002:a05:600c:4ec6:b0:47f:b737:5ce0 with SMTP id 5b1f17b1804b1-48526964261mr112444415e9.23.1772923975077;
        Sat, 07 Mar 2026 14:52:55 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e3fsm133287175e9.6.2026.03.07.14.52.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 14:52:54 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/11] ffmpeg: set status for CVE-2025-10256
Date: Sat,  7 Mar 2026 23:52:19 +0100
Message-ID: <26da85be0717c00201e1ae1c1bdb67963a03ed92.1772923420.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772923420.git.yoann.congal@smile.fr>
References: <cover.1772923420.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 22:53:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232627

From: Peter Marko <peter.marko@siemens.com>

Per [1] is patch for this CVE [2].
This is equivalent of [3] which is included in n6.1.3.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-10256
[2] https://github.com/FFmpeg/FFmpeg/commit/a25462482c02c004d685a8fcf2fa63955aaa0931
[3] https://github.com/FFmpeg/FFmpeg/commit/00b5af29a4203a31574c11b3df892d78d5d862ec

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
index eb64b5c8d59..080241d34f9 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
@@ -48,7 +48,7 @@ CVE_STATUS[CVE-2023-39018] = "cpe-incorrect: This issue belongs to ffmpeg-cli-wr
 CVE_STATUS[CVE-2025-1373]  = "fixed-version: Vulnerable code not present in any release"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_FIXED_61x"
-CVE_STATUS_FIXED_61x = "CVE-2023-49502 CVE-2023-50007 CVE-2023-50008 CVE-2023-50009 CVE-2023-50010 CVE-2024-31578 CVE-2024-31582 CVE-2024-31585 CVE-2025-1594"
+CVE_STATUS_FIXED_61x = "CVE-2023-49502 CVE-2023-50007 CVE-2023-50008 CVE-2023-50009 CVE-2023-50010 CVE-2024-31578 CVE-2024-31582 CVE-2024-31585 CVE-2025-1594 CVE-2025-10256"
 CVE_STATUS_FIXED_61x[status] = "cpe-incorrect:these CVEs are fixed in 6.1.x"
 
 CVE_STATUS[CVE-2025-25468] = "cpe-incorrect:vulnerability was introduced in v8.0"

