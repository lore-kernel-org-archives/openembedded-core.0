Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB7FC6FD1C
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 22:58:35 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.5690.1678402708625168456
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 14:58:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Hs6n1WjN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id x7so2529628pff.7
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678402708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fXzX0gdS//EIMxZzQUaZCbLKFQDz8MeQa6aWrRdF6OA=;
        b=Hs6n1WjNCJBxF+YIeb6dXIeA4gGb2VWZrcw32piFloAxpFpbQHkNWt1kT46mvph5QP
         vjA64tYwCGbFo2CHdzhlOl2UwI+9SH9cI2f0uxAUnxrSm4bvL/00ZE52J/3WiZAMu/n0
         9upqAUp2KOMVaFPSZqE1ptz5TZL29tqTGHj4XKj6yc21Bk1vCqwA+ilqXFXJCpu9xitt
         aCZ6Lu5zsxYDRDWsxU87AH7wJ/1Rk2oIb1Cx5a+GGnIWK+e2OTJxvFQ4maehK0rCLDJD
         PLpkZ0ZM+odtLWahYS1Jb+Qu4S7cQzpt/BKhEENnVF4774O2h/Xm8xkzCS6334AVoNg4
         rLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678402708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXzX0gdS//EIMxZzQUaZCbLKFQDz8MeQa6aWrRdF6OA=;
        b=Fr8ORgjMVnKW/nKzYMIyYOupsaAb2ytkzgOzbiuwETaGnjqcxfmjo5jclPq1miWlKh
         wWts8+JL5+SmfgdLEbpT6PDefH3GBvqmd89+0CMz2N64yiwR8YcHgj28238t0zHoYzGP
         a5ICn0VCAhD8mWESG72RsMV2qFudCdv6dNh08iJDh4CnLpYB0D2EgFBGYABaP17mGwuy
         79E5+H5wWaM0YmrmqD4ddcPw2uMsPtIE54XHVtC/2BbQskMS2PvrJ8bvmA2ROgiGHBWv
         +5TcLGppeHEXTL2bB0z8lEA1DKM0i963RxBSKRPUXzpcuQn21Ji6DHeCnfCTUM5oMSJi
         8o3Q==
X-Gm-Message-State: AO0yUKVn0nbbMknaAPSbwSikzV+TAQwRq2xL11kdJdPzN4ZjTtn1tUJH
	OmeoCtFvAGQmNd9AuU44qy8M2Ksus2MHBdDM+E0=
X-Google-Smtp-Source: AK7set+thEsv6lEqLlf8eVx9kIc5C6LuMK90tl0WUZZ8meAY11T4aUaXDQwFYnvjPr5HQ/STWDSgSQ==
X-Received: by 2002:a62:8406:0:b0:60e:950c:7a4f with SMTP id k6-20020a628406000000b0060e950c7a4fmr3323121pfd.8.1678402707687;
        Thu, 09 Mar 2023 14:58:27 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm89717pfa.166.2023.03.09.14.58.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 14:58:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 09/27] linux-yocto-rt/5.15: update to -rt59
Date: Thu,  9 Mar 2023 12:57:44 -1000
Message-Id: <b85e81e9012e3dbc20d6e0432ec38cb4b97d24ee.1678401759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 22:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178282

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    4d335265c101 'Linux 5.15.94-rt59'
    c3b4464f5d2b 'Linux 5.15.93-rt58'
    c67bd325f576 'Linux 5.15.92-rt57'
    48e551ae0f55 'Linux 5.15.86-rt56'
    977a63a270ad 'Linux 5.15.85-rt55'
    adaa1d9e19a5 'Linux 5.15.79-rt54'
    ff3c61c5ead1 'Linux 5.15.76-rt53'
    e17260e8d340 'Linux 5.15.73-rt52'
    c83f436b7981 'Linux 5.15.71-rt51'
    e01c9e3ba82d 'Linux 5.15.70-rt50'
    debedeb4264e mm/memcg: Only perform the debug checks on !PREEMPT_RT
    1ef2cd0b8676 mm/memcg: Add a comment regarding the release `obj'.
    f8d153e08d42 mm/memcg: Add missing counter index which are not update in interrupt.
    11624404f67a mm/memcg: Disable migration instead of preemption in drain_all_stock().
    0a1f4de6ed4f mm/memcg: Protect memcg_stock with a local_lock_t
    3f15202f27da mm/memcg: Opencode the inner part of obj_cgroup_uncharge_pages() in drain_obj_stock()
    40dbbd2f9773 mm/memcg: Protect per-CPU counter by disabling preemption on PREEMPT_RT where needed.
    6269831106f5 mm/memcg: Disable threshold event handlers on PREEMPT_RT
    8da0e71b7b7d mm/memcg: Revert ("mm/memcg: optimize user context object stock access")

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f318c27fdc4ac276743bd37c466e3fc7296bcfd5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index caa5e5197f..0f557ba2c5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c69881f9ba51496f0930cd39bd67f9dfb8d3a612"
+SRCREV_machine ?= "4d335265c1010cdf45dc0169b1b79638323a5109"
 SRCREV_meta ?= "509f4b9d68337f103633d48b621c1c9aa0dc975d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.34.1


