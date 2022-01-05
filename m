Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1065C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 15:19:31 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.1720.1641395941760702382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 07:19:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=NMXo2Kxk;
 spf=pass (domain: intel.com, ip: 192.55.52.88,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641395970; x=1672931970;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=0GTaRMgaMyMTaPRKelEdfNAY5Otl/5i25j8/k5bo4mo=;
  b=NMXo2KxkxPcZr3hD8Yc0sID7rkaAYga7yytdZd8bXPkP86odTzLqOtBu
   0KRvPXLXsTPS+W4xq7UA1AbKTAgA8deZJSuTsTKJDCauk+jGtVCEnu5b2
   k76xWw2W08iJG836+uOPp0X3hr4l+DoklkhPBGwtXpyjnNK6Rck5C5kES
   gTeX9jkk/Owedsw81LFEnAUCX+ZMLtWeqq+5RomZ8TQ1Ihmm1UB+lsc1S
   5oiZpLz5icMceKnl5DLJ69HpGvA1KiR7nMgzgvhJ+oHWxlyqMtJRRrflT
   x8ZcR9z3mh4i0bPRSpHEF2RkD3lYlClCBPoi9I2FjkEl2/7bNYWFmRmds
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="266742853"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="266742853"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:26 -0800
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="668128694"
Received: from hanwenlx-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.129.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:25 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 17/24] xserver-xorg: fix CVE-2021-4010
Date: Wed,  5 Jan 2022 23:18:37 +0800
Message-Id: 
 <487971876baa9913541a187d98deddc00e60d3f8.1641395036.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1641395036.git.anuj.mittal@intel.com>
References: <cover.1641395036.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 15:19:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160202

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2021-4010 for xserver-xorg.

CVE: CVE-2021-4010

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.33.1


