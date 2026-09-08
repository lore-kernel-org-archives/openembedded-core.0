Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC0E5C79FA1
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 01:17:41 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9817.1788830255327957956
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 18:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Rl6Z9kwK;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-90e7d9c747eso53459126d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 18:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788830254; x=1789435054; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uJSkmR3Oxh552gKCDHAJUWLC3ebtlObBba1MvwGz3co=;
        b=Rl6Z9kwKpv0SHai/gbGmuOAeA0NvXnx9RpR7VT6KQ+uRJCvy2XpYR+9TT7KVwLYEwi
         SW/4Xw7s5UX23C1Ik2Ug9hR5Q1FTuD2da/8fnPsyxE7BnqKXR5xZFRZRzKfKh927s66r
         T5Z4HGqmZwbJuPGwsLHPoIyl5c41r44lQtqSvLt2B6y2FJhAcbO7fy1AL0rtbnaNIOCF
         WK0HOAfsD+FCTgDSKol3EmnUr7w/VW1Brs0jkeZv1R+aaeiJfDaM75Mh2eXzcyjNemVH
         S4HIDi1B3/Zd+xDpukKDlsk5lMhMExmFWWdWxI4QtZvt+JCmQvFiFm+w97dndsksSw28
         tq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788830254; x=1789435054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJSkmR3Oxh552gKCDHAJUWLC3ebtlObBba1MvwGz3co=;
        b=L8SDUI118JhZtuG769MHy7O52YJDYfo3dts0dCUp+QM9glp+/L9VN7oYvFeCu8ayrQ
         xd4Qy9gIObMhUn/5XfsFglBcg7GY4EkwRaPFxQDIQX9HhC66xQBep/Asv2+wuGcdXpFS
         QH3DG0tD0sltB6fgD8yDIcpwQpZ0uehQwVb3MVVJo9hOFhxabjNiKz3Fw0hAPjbG3CLy
         dFtpXRreun2n2YFo1X1MMrJv6Fw/7cG3UOB9R4zWldcdKRZHIkAFqXmdzQn2ytH3pdAV
         cahxSm5c1PZv/y/kdztuy1XhdKz+1sdFzODHaj0onENBDeqMG8xccVuaJb/FPHXSPBES
         GVIw==
X-Gm-Message-State: AFuF++mUt19iQRwEGsrcVfzj6L9BHU3MyywIOjhe1gqYXnq3vmJqzpfb
	wpiVLxJ+V9nP9GtjIoVfqeJpVmizMXmgV9/Ev8e3WiWx+CY69XvIcQJB
X-Gm-Gg: AYBFou2UwCWu9FktcMwkZcEZiHpFlsGqqGpmam2VV2MnojNG0eq9wSNDZkdQKRsU9yA
	7ajk2VXzfvrXgu9ZckxFVQlgf6ONkGP9XvJM8DOIFqeeFhguaf8pd3Y9pydfTHSoWSGg8dvTGXz
	4kUTacsfMz79s2wQlYqMTKBvTkNMn6nLFySYEBYFvO+1pUbkY4+6C+bGAD+qiSzxSjdYaMuACzf
	4XGOOkGUJhdR1nZ9d7Qu1dG7rXJnrt4Ul8eOCo4mWEQB9KSrW3Gcy9fgAyv4d9U8kYzvf0i2SAg
	Lls4E6facrGD1NzQIX3OmnpmNtDW7T1YtOU8jfmVrW1NIkxEf5i7UyLgWsViw9WqRI6Otd0IqzO
	1xL/Nodo+kpYIGanpGZIEurgfuK2EIBEOGkOio7ElwmlmCZ2LVe6VgaQ3Z4b15rbo80fgP1jY9A
	q1Ux94jdA3NgybYCys5a8ggRyQMZzKeVAXml5EcK5ASKSd1TIgpKb2fJlqCFoxk+G3kDhj5fiY6
	hIImaZ8iR2X1sWBy0fiJH5WFLR2qNiT4ucxX1eMDRxRe+MsxHqvEKzjpRkjI7wc/bxw819oxUmk
	bZ6Ifr3VEN4KRYmS55wpRCPNwM8xQmX9eWe5XKG1QLrHMz6zYyI7t2EPU2hgfFYLB33V1+5NCiG
	xHfYj
X-Received: by 2002:a05:6214:3389:b0:910:39e7:dbb9 with SMTP id 6a1803df08f44-9103efbf07dmr367587936d6.33.1788830253934;
        Mon, 07 Sep 2026 18:17:33 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104049d30asm105271876d6.0.2026.09.07.18.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 18:17:33 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] linux-yocto: -stable updates
Date: Mon,  7 Sep 2026 21:17:25 -0400
Message-ID: <20260908011731.2895743-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 01:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245312

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

Since we are working through 7.2 integration, I wanted to get these
stable updates out while the older (6.18 and less) are still under
test (those -stable updates will follow).

I did sneak a 6.18-rt update in, but it was trivial and tested
independently.

(yes, the yocto-bsps update is in this series, even though it
is for the yocto-bsp repo)

Cheers,

Bruce


openembedded-core (4):
  linux-yocto/7.2: menuconfig,mconf-cfg: Fix broken menuconfig
  linux-yocto/7.2: rt: update to v7.2-rt5
  linux-yocto/6.18: rt: update to v6.18.37-rt6
  linux-yocto/7.2: update to v7.2.4

meta-yocto (1):
  yocto-bsps: update to v7.2.4

 openembedded-core:
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb  |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_7.2.bb       | 24 ++++++++++++------------
 6 files changed, 32 insertions(+), 32 deletions(-)

 meta-yocto:
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_7.2.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

