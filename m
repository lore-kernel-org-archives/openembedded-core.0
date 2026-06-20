Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68DCBCDB46B
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:26 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5953.1781960416330326923
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vdl6xK2S;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso29804285e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960414; x=1782565214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nzu8G+pZT/bw/hT6kv9yEr/LUlHyp5K+A0xXxvcvTYU=;
        b=vdl6xK2SOVkdd9tP+TeFdKCi7UT9225nJCUGhIia/MK1/vzODZdsvEK4ExkdKpjiO8
         rXXlAfWQMrLkuXr8ufRzkxu5S53J5sHk/7BnUOSxdCZd5v59rqlxUGB3Zv5kNtAhWE9n
         EIM61RCkRHWr93EUhpaVwGe4SNIvWbwjpLvs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960414; x=1782565214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nzu8G+pZT/bw/hT6kv9yEr/LUlHyp5K+A0xXxvcvTYU=;
        b=bIMhoVDnPnEllruE/QFeRB1IhVsVmw06bG5XU3j+syA+CTPC7gGZ8Mw4tUar8cfLQC
         7lEdFeFrCQWFhTsMoofRJfYI5e1GukomTo7TkpepR1Hs/FY9499ebBpJCJu6MmLrpzwd
         2r7Mzg/WtRD3Iv3wDPNWdaoC4pQOL9om0aF+YF8PSVv3iPtGMD0bnsts8TPOzPKpz3Xg
         u90g3xYG8LQThdMTvb46V0e+qneF8rZC9ElllKyAwCR1Z/cIVXDZqGk8gW1d06aYePla
         pDwNH3l+5AGWVG9jiakJ+t5ah2iC4w3wtRSDC4lu7DadtmBh/bL5UM0CPUs8rQS7TZdj
         3+GA==
X-Gm-Message-State: AOJu0Ywvg+U6nadETjvGVO/pLfGcJ/7Q2QygDOAqlYPH1yDgL0Auz+bx
	Eee66lxsWFBRitFtHMtaUfxoe9Yo52dFWeJOzBAI+efET1HOUUYaYn/Z1Dq88TYU+BRoZujCLOq
	G5CtS
X-Gm-Gg: AfdE7cnbG0iwMw1XLMkR8tS2sx+sza7OWjcEjH8fio6ynpOqCdGwnjq+JK0tedPhotE
	inudz1ZE6reCdKDiQ+1z0h5K0W0hRNEVBTrE8Sd6gzlV6UTIKfFzNiWltf2fQUs4YJ15QuuCl9j
	lq88k9yjFP/rruedkIRyrmsJwtyDJGxFajpdRgK1lKfu3POhyWvjZnsw6U7XNJ1DXJE+Pm19C4S
	BpAL3E88qk44fJaDix5kk2AHLBcXfzM0XloMt4SZoMric/RtXwESGj3C5pF8VFNIQGQtjXDcQqN
	P70211lF/nKN3gJ8D4tw0dwWaO7eMhHSOoVLGPvfjyMy/R7onqs1TyYY93avS8vxQstTfwOb2nP
	u9dbU7roOzHra7sbn1ou97xh1c+pmK5sCK2Gdd4quJQ4sZJaoV+QqOuyNY4AOy2RmFvf1E65yjZ
	WtkoFCJHMyjsZVrEwFf6cuc1rEvF1DmYTicw8wfgRwx4gmCCs4zFc8trrJiCEeikNFsxy+Jspiq
	h3TnjSCH/2osXAV
X-Received: by 2002:a05:600c:3e87:b0:492:46c2:f5b4 with SMTP id 5b1f17b1804b1-49246c2f68fmr80794635e9.32.1781960414514;
        Sat, 20 Jun 2026 06:00:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 11/36] squashfs-tools: add another CPE
Date: Sat, 20 Jun 2026 14:59:26 +0200
Message-ID: <250a9af785cea1b9314a12757905c5269bd327aa.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239221

From: Quentin Schulz <quentin.schulz@cherry.de>

The NVD has two additional CPEs for squashfs-tools pointing at the same
GitHub git repo, squashfs_project:squashfs-tools[1] and
squashfs-tools_project:squashfs-tools[2].

There are no other matches for squashfs-tools in the NVD except those
two, so don't specify the vendor for now and match both vendors with
only one entry in CVE_PRODUCT.

[1] https://nvd.nist.gov/products/cpe/detail/029FFEC5-FB40-4591-A864-90CB97E80FEA
[2] https://nvd.nist.gov/products/cpe/detail/ADE3E55D-5CBD-49B3-85B4-2035A9B380B3

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e1e4729b511a676a961982f88827d79afb81d2ae)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb
index 7741039fcf9..9a1ebd575c1 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb
@@ -38,4 +38,4 @@ ARM_INSTRUCTION_SET:armv6 = "arm"
 
 BBCLASSEXTEND = "native nativesdk"
 
-CVE_PRODUCT = "squashfs"
+CVE_PRODUCT = "squashfs squashfs-tools"

