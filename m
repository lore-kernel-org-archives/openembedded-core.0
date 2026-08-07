Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD18C2A09B
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 16:29:10 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46453.1786120144369158654
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 09:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hjBpwTmU;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-908934450cdso17895746d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 09:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786120143; x=1786724943; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EETM1P827SITss01+Z4e0YSmahnkJ9NJHHxgig4FSE8=;
        b=hjBpwTmUcWVYo9P7lJsQ54qlAWEm+b2yMxNtgQVUXUAfilRDXJCQo3sFIL6TZ3EZvz
         iKbvaNi43CHH58rpnbHN6g0eEPhsGbjzkMYsPs+9KiCY2jTggm2vDxcFf+GmwTQXgauD
         ciP5SUPxMyg9X8pPdQ3BPlfSTqE16OeVSPvavjz6GnR2DoJJsFaM032gw+mOppEW64hF
         cauMi3wEnBsLy14ZrciDZieDVKCoXYtjMfkAw+zA3opAvd4Sy3K4Lh12Co/12P/p9BO1
         iEjhBuBr+KHLqexE97IypLFSgD46yJrMsQdxQCE5xTsClnkJ32rkrrFew9Cw/kzhFz8n
         fkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786120143; x=1786724943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EETM1P827SITss01+Z4e0YSmahnkJ9NJHHxgig4FSE8=;
        b=cxeDWGVlZ+eWsZjwZS1D4+3io62wPisokuOqgwh/M+ct7whDvilavmm2fahh/gj8ur
         zBV3Ddl9GysL/clT9ADuD6m+GUEfQVI1F3XZQaIRnUypOHneo3wC31FPwaTWJ8sLbo41
         a4g+zM2sJeWQz8R8mjggAG5DKdzWXZ4M+HZpvIJhtvbeEdZVp/7ltGTcS4v367GbNo7+
         cVhClzUtvpBv21gHvUGqMYyotF+4qidQ874sAJPK+7L3NSpa7un1lsA8e+wApQipf99C
         aVkrASYIX/jvBRjEpDH6kO8QcjOJoRbifeayF0Z/U/tKphOd65vQwfQf38Gw/9vINfHf
         vE8A==
X-Gm-Message-State: AOJu0YzlGIznokbRSGokZvSOBuaZnRsvgo3Pz/WfJzfPWcCEhfH7xI1f
	sa1uaA5LZKohDfvKs23LdtBvUqKADvYAFyjXqM1Ui7IfPmonI9x8rZM4
X-Gm-Gg: AR+sD101ZViRY/py1OEr4Fah/o984KPWa1Yf3zo5gI+/zWWM+4f+1SPG6zV7SSD27HE
	hQsGYYOcKgX0W0Gg9zReg2pGnJluQsPDIhwlUFcMgYCh4aTrifAF4wM2Hud22liA30kF/X3clSR
	8C/Nt5IwFYTrpTILIu14YXTtklieU0ETut7pGqSNJpPmJtw4zdcVpJmIbM29kGcuWVGmN8bF9EZ
	mEZhIr4LpFeCFQBL6YxnLg5CMJCRwL6AV0/Ai/0Rs5DzMh34zg4OvdMaLaSH0xh7Qurn/8R1JkD
	S5719ZiWFMhCRIQBy1bF38rE/u6pH+LjMbUqLu3nTUPiNqirvfq4p0hrNsv6iYAl5Y80TjI+k3+
	cKAXA2w/aRywzk0MGN4VkzYoiH1IND0X6EFGCBTWddbrSytuCXcstLKJQ0JP+Pp77sgSERUSGIM
	54a1nTCD2gg4w2sfEKTOIzntpOlvN+y+lj7qpuxtT4o8cBhrU4KkM1ibRbEfpXtuogF80vvNGce
	geuNuKzPTt/OTiPRGdnwSwsK16rnGxzcxK4xF44dKhLMFEB/WvaIiU1+oFUys2Fz3vkxA9TlUXJ
	0OY/rHwAR8U0xgTrSi5/Lf1Wcc6a7XgBXbLeaixuZmeKNSx3J+fURsn4gSOTI3JundG2D1OTeuA
	9W55fnhbgMWH6uCbG
X-Received: by 2002:a05:6214:2485:b0:907:bfc0:781e with SMTP id 6a1803df08f44-90a3471cce9mr15334126d6.30.1786120143132;
        Fri, 07 Aug 2026 09:29:03 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a92fed68sm12521756d6.31.2026.08.07.09.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:29:02 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] kernel-yocto: consolidated pull request
Date: Fri,  7 Aug 2026 12:28:55 -0400
Message-ID: <20260807162900.2623274-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 16:29:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243017

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

Here are the latest linux-yocto bumps for both the core and
reference BSPs.

Note: v7.2 will be the next reference kernel, it is on rc6 now,
so expect both that an a libc-headers bump in the next few
weeks.

Bruce

openembedded-core (2):
  linux-yocto/6.18: update to v6.18.41
  linux-yocto/6.18: update to v6.18.43

meta-yocto (2):
  yocto-bsps: update to v6.18.41
  yocto-bsps: update to v6.18.43

 openembedded-core:
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      | 24 ++++++++++++------------
 3 files changed, 18 insertions(+), 18 deletions(-)

 meta-yocto:
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

