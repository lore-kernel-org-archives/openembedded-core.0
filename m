Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A27EDC388F3
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.4052.1650427837219305112
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 21:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=F+lkc9+m;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650427835; i=@fujitsu.com;
	bh=zprUwp9fZ+dPYtQ7gu5aPOt+Ws9GWC2/eH/c4IFA5q8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=F+lkc9+mbtzKB5XN+Qeubzr9cM4nz62NhMKo1bYuhnI+Aeh9+T2OKMdB5b7XNNoqn
	 ZSk2/djCLy2daj/I+B0tTqNOm0tP0TrYR+wVFoaTzksdXc82k2G6v+pdRbcw4+cLVA
	 tuhgdv8N+pQgZYH1al01CItOrsN6VAZUGwpV5cgMQH+jR7gBa/EOBZNEizpi7H5vHf
	 fRT89Z99o9lumTMHU7thWmMW0L3K9K3JfWgomkLGokk1K95vWIsGNRw9YcEI5ekdiD
	 qA3FZpFLWr05gn7gk0Xmm2e1kG7sJqg1BpORSTBx+xLg4qRFu8TWyH3fK1CA5QMt/2
	 uzRU+TcfYAGXg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8MRorurPT7
  JoPm2mcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnHgx0SWghk8Ff/blrI0MP7g6mLk4hASmMUk
  MfX+fmYIZw+jRHPDIfYuRk4ONgE1iem3brB2MXJwiAjoSVz9JwoSZhZQkXjxuwesRFjAWmLj7
  PtsICUsAqoS13eEgoR5BZwk5sx7xghiSwgoSEx5+J4ZxOYUcJZoXtTEAmILAdU8f/qaDaJeUO
  LkzCcsEOMlJA6+eMEM0asoMftyMwuEXSExa1Yb0wRG/llIWmYhaVnAyLSK0S6pKDM9oyQ3MTN
  H19DAQNfQ0FTXHEiZmeklVukm6qWW6ian5pUUJQKl9RLLi/VSi4v1iitzk3NS9PJSSzYxAgMz
  pdht2Q7GfX0/9Q4xSnIwKYnylrXEJwnxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4LUCyQkWpaanV
  qRl5gCjBCYtwcGjJMJbDJLmLS5IzC3OTIdInWLU5VjbcGAvsxBLXn5eqpQ4b28bUJEASFFGaR
  7cCFjEXmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzFvSCjSFJzOvBG7TK6AjmICOqJ4SC3J
  ESSJCSqqBae+xc27tCQGhvx7wuTg+8Zkz/4xqR9D+2xmPAzcwC3hElv/KV+UVLWJME6xbU3L0
  rXXCc8GPb2uEb7HlRQSru19nKLQR92T6zLpavTT+73k2VuZ752qETgrUK78/NyHFvLfN5Pn1h
  S6pUamnefQ8c7UzM36uPP5tZ/rk+5Pu+534+ifm1judVxpF87YlOn19dKs97NXmBqtNEcuXWm
  71/Lv3U87pDtX7oRcMNJuk7tddzGA93Mig7P5c93Gjc2/4XA2z94dXHFxwyGbLrZMv46InvN/
  y7LpRS/fxuyY6DmXrWEQeTdRwNFXheft/DZ/M68mLWMITZtlxJF3atbz4nUEcS8vGxriTbHPe
  hqctUmIpzkg01GIuKk4EAJ4XoClTAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-545.messagelabs.com!1650427834!332643!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25959 invoked from network); 20 Apr 2022 04:10:34 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-5.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Apr 2022 04:10:34 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23K4ARgZ023955
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 05:10:34 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 20 Apr 2022 05:10:30 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xdpyinfo: upgrade 1.3.2 -> 1.3.3
Date: Wed, 20 Apr 2022 12:10:19 +0800
Message-ID: <1650427819-28266-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650427819-28266-1-git-send-email-wangmy@fujitsu.com>
References: <1650427819-28266-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164653

temporarily override SRC_URI which is hard-coded in xorg-app-common.inc
since new versions of packages use a new compression format - .tar.xz

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xdpyinfo_1.3.2.bb => xdpyinfo_1.3.3.bb}        | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xdpyinfo_1.3.2.bb => xdpyinfo_1.3.3.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.2.bb b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-app/xdpyinfo_1.3.2.bb
rename to meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb
index 2d10b7acca..fa0fe36451 100644
--- a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.2.bb
+++ b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb
@@ -8,13 +8,14 @@ predefined values for various parameters used in communicating between \
 clients and the server, and the different types of screens and visuals \
 that are available."
 
+SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.xz"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=f3d09e6b9e203a1af489e16c708f4fb3"
 DEPENDS += "libxtst libxext libxxf86vm libxi libxrender libxinerama libdmx libxau libxcomposite"
 PE = "1"
 
 SRC_URI += "file://disable-xkb.patch"
 
-SRC_URI[md5sum] = "8809037bd48599af55dad81c508b6b39"
-SRC_URI[sha256sum] = "30238ed915619e06ceb41721e5f747d67320555cc38d459e954839c189ccaf51"
+SRC_URI[sha256sum] = "356d5fd62f3e98ee36d6becf1b32d4ab6112d618339fb4b592ccffbd9e0fc206"
 
 EXTRA_OECONF = "--disable-xkb"
-- 
2.25.1


