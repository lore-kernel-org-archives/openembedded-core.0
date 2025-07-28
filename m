Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83865C83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 16:19:18 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.85774.1753719548574185281
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 09:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AHyGo/B8;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: festevam@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-75ab31c426dso3770861b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 09:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753719547; x=1754324347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gX06MMikJZWJbDKafoAYDWsm/DVwppIbMAIQgAhU+ms=;
        b=AHyGo/B8rHwNgYdEOjHUjVNFlKtBmD6B+q1DZ6pS3faLLZDjDhB/n0F8n3RrIM9IN8
         52rABAFdGfcZwIxa4KcYBwkoi9UayWvPjV+Mf8bRDRE3RJBKoLgTubX9fmuiUgCQ7oqQ
         BDeXvjLjDzZ33k5ecU743IYgsRY3cHgZUvLeu2WX1lHGCHTbwhSmZjAI/hKArZ4iYukb
         fakabXNm7qC6ZIiaNuPuPad3/3OEl6P+LGWgLHrAPDAP9EFH1BIUD8BvtRmn/FWuR3qs
         mtRtQ/03yjriyAkq23o+kjdce1Imz5N7MYQrupAXSBCHFrpmPA/aKzD5z0vkKYovY2SO
         BnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753719547; x=1754324347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gX06MMikJZWJbDKafoAYDWsm/DVwppIbMAIQgAhU+ms=;
        b=odyQaD6zdywfyh0LF72rBCMwR07gU4Wqv4xhPk0Zkf70wvV3n7KxWGVC3+0fOO2QE5
         o/PfkaWvtwhCZEeIoEWV4LI3EnR/LYD2vbb+vU00A8F1yGdv9X6pP6URlvlSd3hOAQ/l
         xk9YFstMH1A4LbzLWV5KUAzAPyk8jwVdZ1RQlAfWXAyUQ6wbq3ObKkVwF/V1lP0L0YBu
         OQJyO5is8eNfo4WTB6MIJNyBxuYrg2W8ZNlssfgQgwjPfRPS18SHeQ/bPmt9cBw72sXJ
         W/EgKZIXqg4PvCbLk5ufr1a+QAw8PWFOvZ/LzMdJzRlE7pUvTU2Mi3IREavt/PG8jk2R
         vdRw==
X-Gm-Message-State: AOJu0Yxg6tnyrz2J+FMlJNEcO7TmC1gDqc6JHwjaYy/bP2BgcR/8Vjew
	RzATYuDWpoQnOXDlKzfuDiLnFyVhXiXxeK+DWmkNB2c0bYWsYe2G/4JHpj7E5g==
X-Gm-Gg: ASbGnctoQkft/dpvNN2U6qdJWBFPr9SoJr/fobrHVnbG6o5Yt+QhIMWERSylezsZCV/
	UJQoqR9XfRE7lyl71u2JXurXTmTS3/nu2P1S6aaLos+nYOh9lOP4IHGdAytZ9dQKqY3w+yDNc5n
	Ipi2ygfTtIJTmNwXiLJnxXmezEWe5J2Hek1d9N7A82ILKvDo7ObvnNYdw6zbAphkdR4mSF1T+7Y
	uGcbciTggRLdB+7kFVW1YmMRawQsRdw+vEhM0+IBx1ox9dRj891EsvFOEdxV2uT+gkLLortckU+
	NWxPt3aWdo/e/4A5YXDSwKaxNuRsjDG25TPppjbUjwigZqVsJ4SxUcqamIre9vfy0FfnJNPha5e
	VjzzQ8GiOiOWkPd7+/q1HOLf/1r91k/hPHj1E1HOKP6tHd6A=
X-Google-Smtp-Source: AGHT+IEakeaqvJ3NRRtA+VMy+sLCnWs/7+41zjm0Cocg62/ym293HFiPnBKeDQKyXwIilZtKKslVBQ==
X-Received: by 2002:a05:6a21:6b05:b0:23d:ac50:333e with SMTP id adf61e73a8af0-23dac5033c2mr1138216637.43.1753719547275;
        Mon, 28 Jul 2025 09:19:07 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:e084:9754:adef:34f3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640baa00a9sm5431124b3a.140.2025.07.28.09.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 09:19:06 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] maintainers: Use my personal e-mail address
Date: Mon, 28 Jul 2025 13:18:41 -0300
Message-Id: <20250728161841.3008383-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 16:19:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221014

Switch to my personal e-mail address for OE related work.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 927aac16d6d1..ed1bc18ba39e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -842,8 +842,8 @@ RECIPE_MAINTAINER:pn-ttf-bitstream-vera = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-ttyrun = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-tzcode-native = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-tzdata = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-u-boot = "Fabio Estevam <festevam@denx.de>"
-RECIPE_MAINTAINER:pn-u-boot-tools = "Fabio Estevam <festevam@denx.de>"
+RECIPE_MAINTAINER:pn-u-boot = "Fabio Estevam <festevam@gmail.com>"
+RECIPE_MAINTAINER:pn-u-boot-tools = "Fabio Estevam <festevam@gmail.com>"
 RECIPE_MAINTAINER:pn-udev-extraconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-unfs3 = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-unifdef = "Ross Burton <ross.burton@arm.com>"
-- 
2.34.1


