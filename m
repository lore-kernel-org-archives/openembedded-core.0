Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83785C76188
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 00:27:32 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.35732.1678494447580790605
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 16:27:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DmDS1DVA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id g3so6565605wri.6
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 16:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678494449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYljIHjcR5Zzg4dKV4YH0HwXjkEUgCIlx1MsGAAcBd8=;
        b=DmDS1DVAcf9LUTXn1CGB98JO2TPGwN2HDtsGX45xpOsFImJNP5zNShi5SZC/rNw1oZ
         oMzfD6I/BTzz7x8HzoMODjeDrNPeJovQRwsR0VXDnMAZUUKAY7BYosJhtbhBz2QLO9BP
         33HcuNFnL9TzeAFnWg4YKDno3pkxOWCAPwohc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678494449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYljIHjcR5Zzg4dKV4YH0HwXjkEUgCIlx1MsGAAcBd8=;
        b=fFGNALXfI3G4qxck9h2pDvCdgaFx8jXtM6fvDZSAuULnUsg8QaSdzJefFvXYh7f9oU
         v249HKYI/eBJ8pqD5k8cYvg6RWOWImtvGrOQBLg0fWfdJXaWdKEsM5aeSp8AoguBLBKd
         CVNP5Il0X4nQQr9HznAAVkcLPVL2o+NC5wSH4Cy4hXmmz+f2tR/91fTJQ1V7a8t+DjW5
         iFXEC1D2TExdk0RoClCHrYCU8KWUThYx4f8hUQ0QmaCaN+oYvFomqdtvYrOuXAoSwRru
         6CGYIWL9XCTXp6bsNH6urEqk9kKxkIlaw9xAkgDERz+ZJn3DVd1BlfYeUpr/Zqv4Nri9
         fFaA==
X-Gm-Message-State: AO0yUKXAJCkYK15c0h5kWbbrwczQGhNluAU8+DKrUjVYXWPg4q9AIUEY
	j4++PJKO+3p0NA6aaogwrCkjqaEY6Chdt8kYfzc=
X-Google-Smtp-Source: AK7set+5OjBwKAZeT6sNPOelXG/TH83AOCz8jDLedaEfOoLXiSlejVW5rdE7ZPXWhpakpPUPCLcsCw==
X-Received: by 2002:a5d:43d0:0:b0:2ca:8ae5:ea2 with SMTP id v16-20020a5d43d0000000b002ca8ae50ea2mr16413861wrr.40.1678494449517;
        Fri, 10 Mar 2023 16:27:29 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d400f000000b002cea299a575sm291736wrp.101.2023.03.10.16.27.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 16:27:29 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/16] gawk: Fix ptest dependency
Date: Sat, 11 Mar 2023 00:27:16 +0000
Message-Id: <20230311002722.3211118-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
References: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 00:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178353

The gawk ptests need some locale information, add the missing dependency
so tests work in minimal images.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/gawk/gawk_5.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/gawk/gawk_5.2.1.bb b/meta/recipes-extended/gawk/gawk_5.2.1.bb
index fbe6e7040b0..d13110ddbec 100644
--- a/meta/recipes-extended/gawk/gawk_5.2.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.2.1.bb
@@ -62,7 +62,7 @@ do_install_ptest() {
 	rm -f ${D}${PTEST_PATH}/test/timeout.*
 }
 
-RDEPENDS:${PN}-ptest += "make"
+RDEPENDS:${PN}-ptest += "make locale-base-en-us"
 
 RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-en-us.iso-8859-1"
 
-- 
2.38.1


