Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397A3C4452D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 03:51:49 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40518.1784692304873798071
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 20:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Z/CZk7u8;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7389cff36bdso3046939137.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 20:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784692304; x=1785297104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0TvVbS6No7TjUireW+17Q0TP1YklDTjHC7wK/Pw1css=;
        b=Z/CZk7u8mEmKyyE+sXYQuXkhOuYlDMFyCSzPStDEwarxj8LqunJaPp5WWn5eJSzoal
         i90zNNUQjVmqE00CkqhY+98xr2fQSQN9fA5Ub0B+QIoi6A55J38eU4HR7QcoOA+Wk2G1
         Pkr6aywnuJp/ww9xBlWfrXlazb5EStDnYcGnaIRjOUqW0uTYUXpSvR95lFphiGXHT5jN
         fC6jdo0Ce5n5/d6cMu5EWfo2PL9SjVRK4KnZe6FJ/2316Np6fjNmnzKlt4wH2YUUeAqj
         YH0QGF6vLPcSdqlWKI8kimfpJdWRu5pQxlAoreh9EAn94W6fJO24ZZ06kze/SBv83YbJ
         OJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784692304; x=1785297104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0TvVbS6No7TjUireW+17Q0TP1YklDTjHC7wK/Pw1css=;
        b=EPLQhtVoLsaGVqCvlbA4G0sWAEHUTA7XTQIoe06wdgI/maAtwIDVzsIMLFy8x0u06t
         pxS18qNqI9EgFun+EhaWfKQnMHm/DpcjvTRqSuEk/KPUwElP6cOL7CYatG3wC8hTlI+p
         9qZs4PoJgm4s768Nx828+ilAnpveqZj6/24jHO+uLD1r4wVCyv7eqqBoZkWcAvaMpr7s
         lywJ75Pt97MscmIWecukG2OKZ9D/kscbA/wwcqOdIGffQNRjqYXW16LO2193vPyY7ykB
         lCHosorvJgkpy3X1j1ztL64AzNBIHHCj/SdVTiFaNSadsMP1ZeONIUem820nOqAEsdCW
         lKWQ==
X-Gm-Message-State: AOJu0Yy9u/M2zDOc8xJK/OczQBF0z5SgpLpQuA4Lq7sXg4jT2LSSoV5l
	y+mVUVJVOijna0H/PWzRx/1Ur+P6UPLewgshV3TJ/AW+REOovOmDkWse
X-Gm-Gg: AR+sD10rBh1qIhhgsEOW1WqJwUjdJCgr3ukmfaK+B5J5yXPDYBGhoioWJwm5V9esMaX
	q8q1QHlkQwFq2s0n9g63lBLSlOfAqE8mntstt5lbeYLFhdu+c1GN2XfeeS3W8wXo1tFHLPCYByk
	uV39BybaHxHb2VbuZNJmioODWFAjGktviySqdEtb9Y5IWyi07e5QT25sNkQ+2s/iaF1Vk0rvbam
	A7kno+gt0od3wRnzEXFfrySsSoTI/N2H+gfXbYkKcKmDz6amfq5ZVgL4aQC/xTETGIfFdZHysPX
	HnPdqJ/P1esDfe7JLMifvhMMtPveMoPm7ceem3bCbAvKpWCr95aYuuZof7/vaqv1jNBY6dKbhFl
	RnCfrmdnTqJQ+Jmn5gTOoCjR210ULzTUwaKxJjVfIYWXneXmcBeXau4/3dLd8TCsBBEFulrvBts
	gI1A8jgjtZV7MAu1BffLr8ykyk/Ur8JAMQ7zv4ocCj7DSfDM/t6s/Ra8bBkMRCHVVbDOB7CPYHJ
	0slgtaWP5GmzNn6c6w7kKYqhCGn2V3Jqd8YzJddyUtgEbd5YvCkX4nveVKKayimwuDABE+mRs2i
	7JF8J+gbkn2DcOtAkgEEzksr94Na5YFiJA==
X-Received: by 2002:a05:6102:848e:10b0:747:5bd0:a2b7 with SMTP id ada2fe7eead31-7475bd0a69dmr3110442137.5.1784692303724;
        Tue, 21 Jul 2026 20:51:43 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-74ad320c9dfsm1645875137.4.2026.07.21.20.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 20:51:42 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto-dev: enable BSP config audit reporting
Date: Tue, 21 Jul 2026 23:51:39 -0400
Message-ID: <20260722035139.1349872-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722035139.1349872-1-bruce.ashfield@gmail.com>
References: <20260722035139.1349872-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 03:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241582

From: Bruce Ashfield <bruce.ashfield@gmail.com>

linux-yocto-dev did not set KCONF_BSP_AUDIT_LEVEL, so it inherited the
kernel-yocto.bbclass default of 0. That silently suppresses the 'invalid
fragment elements' and 'redefinition' audit categories: do_kernel_configcheck
still runs and still writes .kernel-meta/cfg/{invalid,redefinition}.txt, but
nothing is ever reported to the user.

This was hiding real breakage. Five config options removed upstream in v7.1
(CONFIG_HAMRADIO, CONFIG_CRYPTO_MICHAEL_MIC, CONFIG_ISDN, CONFIG_ISDN_CAPI,
CONFIG_NF_CT_PROTO_UDPLITE) sat stale in the kernel-cache fragments for a
full release cycle without a single warning.

The versioned recipes already set this (linux-yocto and linux-yocto-rt use
1, linux-yocto-tiny uses 2); the dev recipe being the sole exception is
backwards, since the dev kernel tracks a moving upstream and is precisely
where dropped symbols should surface first.

Set it to 1 to match linux-yocto.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index f82f3c326b..ef6e1e0759 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -16,6 +16,7 @@ include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
 KBRANCH = "v7.2/standard/base"
 KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=master;destsuffix=${KMETA};protocol=https"
-- 
2.43.0


