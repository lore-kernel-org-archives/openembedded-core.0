Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 430BDC433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Dec 2021 01:31:04 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.46365.1640741463218031722
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Dec 2021 17:31:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1BT1V2hs013158
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Dec 2021 17:31:02 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1BT1UvOZ028074
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Dec 2021 17:31:02 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 28 Dec 2021 17:30:58 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 28 Dec 2021 17:30:57 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>
Subject: [hardknott][PATCH 3/4] xserver-xorg: fix CVE-2021-4010
Date: Wed, 29 Dec 2021 09:30:50 +0800
Message-ID: <20211229013051.36342-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211229013051.36342-1-kai.kang@windriver.com>
References: <20211229013051.36342-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Dec 2021 01:31:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160041

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2021-4010 for xserver-xorg.

CVE: CVE-2021-4010

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../xserver-xorg/CVE-2021-4010.patch          | 39 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.10.bb      |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4010.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4010.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4010.patch
new file mode 100644
index 0000000000..06ebe7d077
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4010.patch
@@ -0,0 +1,39 @@
+Backport patch to fix CVE-2021-4010.
+
+CVE: CVE-2021-4010
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/6c4c530]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 6c4c53010772e3cb4cb8acd54950c8eec9c00d21 Mon Sep 17 00:00:00 2001
+From: Povilas Kanapickas <povilas@radix.lt>
+Date: Tue, 14 Dec 2021 15:00:02 +0200
+Subject: [PATCH] Xext: Fix out of bounds access in SProcScreenSaverSuspend()
+
+ZDI-CAN-14951, CVE-2021-4010
+
+This vulnerability was discovered and the fix was suggested by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Povilas Kanapickas <povilas@radix.lt>
+---
+ Xext/saver.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Xext/saver.c b/Xext/saver.c
+index 1d7e3cadf..f813ba08d 100644
+--- a/Xext/saver.c
++++ b/Xext/saver.c
+@@ -1351,8 +1351,8 @@ SProcScreenSaverSuspend(ClientPtr client)
+     REQUEST(xScreenSaverSuspendReq);
+ 
+     swaps(&stuff->length);
+-    swapl(&stuff->suspend);
+     REQUEST_SIZE_MATCH(xScreenSaverSuspendReq);
++    swapl(&stuff->suspend);
+     return ProcScreenSaverSuspend(client);
+ }
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
index ac32bb25c2..84b0acb42f 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
@@ -11,6 +11,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://0001-hw-xwayland-Makefile.am-fix-build-without-glx.patch \
            file://CVE-2021-4008.patch \
            file://CVE-2021-4009.patch \
+           file://CVE-2021-4010.patch \
            "
 SRC_URI[sha256sum] = "977420c082450dc808de301ef56af4856d653eea71519a973c3490a780cb7c99"
 
-- 
2.17.1


