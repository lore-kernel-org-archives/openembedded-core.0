Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22DA5CAC58E
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 16:34:13 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.2111.1757608448900305862
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 09:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ps/jK+nT;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3e3aafe06a7so648894f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 09:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757608447; x=1758213247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2oUneSM3ViaOwu73GE2BSVEG32pcE5I3kOlb8BJwyBU=;
        b=Ps/jK+nTNqFf6UvmqviiXMXs2Qhy/y1XPzAINXGifcUjnWDNcK7y6bzHgkrV4rI7FV
         aqdNbmfbRDa+GSSjgwdV5qLrfF3ghbTX/q+h3m/pag7ux01uAX/aYFZMo/752HfaqBBS
         B/XtF+al1F7yEXMUpFLGV9n97TMhIrPTcnZBcTsovQ/oOFYDxUmGdhazAgtKOTplRHw/
         0ExofvrxQmj7z8jnTGOllRMxxcHOoSBkK2N2YXq2m8zTs3NZp36BSP0OCpxxFTFz/Nkj
         Z7uR7Ds/hQWuGYHSGcDn5+jwJlJVcvi3MdXku7ml6HNF6MQoCjSSYfVB0dnK8yUtv9o0
         TSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757608447; x=1758213247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2oUneSM3ViaOwu73GE2BSVEG32pcE5I3kOlb8BJwyBU=;
        b=BNdpRVRurfmjINQYuKrqA2Y0eSfB3Ihlu+qDunbjJG2fmYx0uhu5TMCE0lCFHWov75
         japR3Ol/0g6rEUG97j6R0H3f42zS22L6slCK8ggPqhYgorG6hiO4PFG8OZ1IOnBZtvCj
         gggxizEtNndERT/sU/1mKXQ3BNdiX5OqUO/cLr7ERjf8IslxtE5CX2Eg7kDKn/3xGyCz
         EQc/7mEvM/5+HtqAXznBChAK2aA4Jh8BwVERgpvVgzBfb3pPsD5/vLQFYlb9EenCUxi+
         TNPzr++xonilxCTVmJyDcUGucVywpdYq/B6jiQHMMbTDHfioO8s+AgYrv84e1kpKCFUE
         3IAQ==
X-Gm-Message-State: AOJu0YzZOXrB/veDLt0D7IBmrJNhO8eX+0Xu4qQuUVtl4/rpo2ukGbld
	Hkwb3AQHkk9rt2nCtTwcTJ7xKT10k7R5n0rFmraC0nQk9MicLHMyQVk8sBWKKA==
X-Gm-Gg: ASbGnct7yHJlPBdF0af4ljNW0z72zmzF1HKu5OtBYh5kkSHCth6soGct+zxKzerRrM3
	bEoZichcTeW7FT2bpKiGe5BqXXRDgTjZjWl0yCML3NOMJ85TSbJ7fxJCu8p5peO0nsLU0Eh3CmA
	3NRk8miyzei776BUn+w7k2irZT9PnsvQITVdzgfWsSja1V27c23Ux5qs/IwM6d4WBOg/NJ9qY7P
	F2GwcAFrNIInPEIAa0kSd5tLZFAsPQXTD9TLIFkTkq9No1RwmsmmYG3+XprfanG+e+e/IPrUIt4
	WkAnbHJlmbSwOexNBLDdJhAB/IupJuyTf3yLJskwZ3Hz+PjouJE5neAyR0h+36eoOjSErSnwLK4
	wkGxUH6Z+3Omhkz8YLO36bZCciY0zijXFCOiUkaQvIWBy31ihS32YdKsC9owIgWoqzr5+r8l5Ka
	hBc9xjAV/477m7kfZjvHg/kZyjlDtYgH7KpLePlqpVtC/Y7B18gjCxgnve32Hg9xizLnKN
X-Google-Smtp-Source: AGHT+IEB2EmNwYY7NTWpqXOLBs17BTrtNr9frjCbTUxxOaj4YosKtzNUaz0/lAvbhq80u9E9e+QWvw==
X-Received: by 2002:a05:6000:26c3:b0:3e5:4da4:d894 with SMTP id ffacd0b85a97d-3e64392d297mr16967220f8f.31.1757608446971;
        Thu, 11 Sep 2025 09:34:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e01512379sm32733805e9.0.2025.09.11.09.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 09:34:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] maintainers.inc: unassign Tom Rini
Date: Thu, 11 Sep 2025 18:33:59 +0200
Message-Id: <20250911163359.1766373-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 16:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223289

From: Alexander Kanavin <alex@linutronix.de>

This was requested via private email.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 0cd1ee7647f..d4715bb22b3 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -274,7 +274,7 @@ RECIPE_MAINTAINER:pn-icon-naming-utils = "Richard Purdie <richard.purdie@linuxfo
 RECIPE_MAINTAINER:pn-icu = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-ifupdown = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-igt-gpu-tools = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-inetutils = "Tom Rini <trini@konsulko.com>"
+RECIPE_MAINTAINER:pn-inetutils = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-init-ifupdown = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-init-system-helpers = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-initramfs-boot = "Unassigned <unassigned@yoctoproject.org>"
@@ -858,8 +858,8 @@ RECIPE_MAINTAINER:pn-utfcpp = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-v86d = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-vala = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-valgrind = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-vim = "Tom Rini <trini@konsulko.com>"
-RECIPE_MAINTAINER:pn-vim-tiny = "Tom Rini <trini@konsulko.com>"
+RECIPE_MAINTAINER:pn-vim = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-vim-tiny = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-virglrenderer = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-volatile-binds = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-vte = "Unassigned <unassigned@yoctoproject.org>"
-- 
2.39.5


