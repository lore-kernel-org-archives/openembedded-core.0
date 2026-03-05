Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CC3F47CB2
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 18:51:07 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51922.1772736659635574691
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 10:51:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BxpZZ+kn;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso77430255e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 10:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772736658; x=1773341458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4XFtyD+8VhxcXRFwM8BRu+yYgDlFWdF+IfIgjIBc3Pk=;
        b=BxpZZ+knv9OOwTXHQyjgv9x37Qfo2A7WoHKnFcqU0iMU11tdqcRwxd3RCsgUtkk8ix
         C8gRioYtNZoM+XxLzR24rXLhx4hjIAnQP4YiPqxKVTWUarzTtCdj/kHy0WEkvCLHXDZP
         e8MW/jzb8r4SLMcX1916YVlweldVbCmyNAEVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772736658; x=1773341458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XFtyD+8VhxcXRFwM8BRu+yYgDlFWdF+IfIgjIBc3Pk=;
        b=LSTEDgv3EW9zCKNlWBxeX0h59bl1h8mtH8RpvM+0BifvyUjywzxGvyqEoHjigYsTAW
         u9LDQVF8gXqvmvpIBsiTek4RXRAzREz2spcjOI7QurQo43jf21LWzyY0BKeffVBX0zcu
         JikhT3O2SlvoeAhhT6Rz7vX1/Bq4cGHJ01r0gFjYSnzu5MgGH1IfVQhUDEOTTS6Bof3W
         /lFVQpnG+uCT97aOOlsCtjzwAJ97gixZv8VXFEwfsY7/HFG6Uh3K1qrJNsGhQFXGus25
         Rg75qXPRxH1LTxL2jn0Vp2XczQjLf+K++vDE+ZBBcj/gdzx7x1msvw0mwGPPBhh8Hri+
         RU+Q==
X-Gm-Message-State: AOJu0YzR1S+C9TsWkOwb1ZOihfnD2TWSWwU7LHhwh8O1L6UU86kYz8ks
	emYyXTxoIGioKLD7xEYoGtUD7VGulYpCKoa/MlX3L+yY69MjJ5xRX3ApKpKSTNBYMr/WBnnkgch
	4Z9oj
X-Gm-Gg: ATEYQzzixQ8v6hRUpzPBkzuy6PBt27D5V40kwirZ9dQ3Q1gnmhb8yealwOQNstjD6vX
	XLRfXhyHNS3NQPke+vC4f9An3XD74/k7zzXNG0cFp4La+wLwqbyIE/vcHdMkr2O6zMmzRK3dVoW
	Dgf6t/sgHcuhdipRYFQXaAFkVx9PDvepMwwVKxLwc5PI5NuSC37k/tdXrw2/NDhdVwG+OZ4UiFs
	whF0S/wC3rRYSsNqVdnnccWPT2R7ez3KKTiNsb/bCOoo+BV/I4lk5Gid1VlMUG21lFUw66CxsUz
	dBeQKZWhUkLlyMFS3R3xntPrywmMBnF7u/SBECkKGFBZYc5nQ1S60gnWJLPK8xZpgD8r5eIM3zj
	WOQiLBfeeSteF0zJQXU3xPs+2NPaRi+5hFcX+t8eCtiW6p6nONdJAZUxdka7YEDHaw/wwLoMC8t
	3EVOCX3nNworMg1KCyJV6Iudh8/1sHiJRpOSWCA87/MGqPKp/5TYXRI+AWyzYHp5VtvyqCLBoyX
	kEIWwt+S1wea0K5BVENrqZ9RR9N
X-Received: by 2002:a05:600c:c84:b0:480:4be7:4f53 with SMTP id 5b1f17b1804b1-485198c70a6mr118102515e9.31.1772736657605;
        Thu, 05 Mar 2026 10:50:57 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00675b4cbd8c1678f5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:675b:4cbd:8c16:78f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fae473bsm48164595e9.7.2026.03.05.10.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 10:50:57 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 1/2] maintainers.inc: add note about C locale sorting
Date: Thu,  5 Mar 2026 19:50:18 +0100
Message-ID: <20260305185018.1545386-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 18:51:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232507

From: Yoann Congal <yoann.congal@smile.fr>

Other locale might have different order for the "-" character and lead
to unstable sorting.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/conf/distro/include/maintainers.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index c43107ccdc..b9a2da0387 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -25,7 +25,8 @@
 #
 #	RECIPE_MAINTAINER:pn-<recipe name> = "Full Name <address@domain>"
 #
-# Please keep this list in alphabetical order.
+# Please keep this list in alphabetical order using the C locale.
+# (e.g. use 'LC_ALL=C sort' to sort the list).
 #
 RECIPE_MAINTAINER:pn-acl = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-acpica = "Ross Burton <ross.burton@arm.com>"

