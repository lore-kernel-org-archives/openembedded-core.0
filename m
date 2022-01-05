Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCE3C433EF
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 15:19:25 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.1720.1641395941760702382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 07:19:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=mpPKquY+;
 spf=pass (domain: intel.com, ip: 192.55.52.88,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641395965; x=1672931965;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=i9uNqMyLMWMiYyxSFdUdkNLI0eBLpQv44Q+8awy3p9Q=;
  b=mpPKquY+DFDI717Tk33Y0yxdnTTwe7At3abXCU//VdWZEx0l9Hqu96Bi
   abUxe9ryZph6AZvKV0AO3rTcXJ7FYkLTk1BvbxpSCr7JM9xrEdpFTUPzI
   EraQxvNcmrLcGsws2zK6IzCriqJJpJgm0UaiuVIi131z4vxkNK8Tq9N9x
   V62cPSYSqj4qcb3rSQTiu6ogJ2NmlkKTnOBFKyyBsr1E776S2bP34jeIF
   zYMsw9IqTF7fm97pEoYq8V2O2nub0bLVLrtZTjDjKuN4WE8wXb21SP8Ai
   UKg5VKTKGVDW7FJpSPWrBXRZ+2F7JzWmg/TPcm0QfPSZO39r2ieSBS9Qf
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="266742845"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="266742845"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:25 -0800
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="668128686"
Received: from hanwenlx-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.129.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:24 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 16/24] xserver-xorg: fix CVE-2021-4009
Date: Wed,  5 Jan 2022 23:18:36 +0800
Message-Id: 
 <33581b19a2eb00b5905325e966edd7f7519a2924.1641395036.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1641395036.git.anuj.mittal@intel.com>
References: <cover.1641395036.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 15:19:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160201

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2021-4009 for xserver-xorg.

CVE: CVE-2021-4009

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../xserver-xorg/CVE-2021-4009.patch          | 50 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.10.bb      |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4009.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4009.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4009.patch
new file mode 100644
index 0000000000..ddfbb43ee4
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4009.patch
@@ -0,0 +1,50 @@
+Backport patch to fix CVE-2021-4009.
+
+CVE: CVE-2021-4009
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/b519675]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From b5196750099ae6ae582e1f46bd0a6dad29550e02 Mon Sep 17 00:00:00 2001
+From: Povilas Kanapickas <povilas@radix.lt>
+Date: Tue, 14 Dec 2021 15:00:01 +0200
+Subject: [PATCH] xfixes: Fix out of bounds access in
+ *ProcXFixesCreatePointerBarrier()
+
+ZDI-CAN-14950, CVE-2021-4009
+
+This vulnerability was discovered and the fix was suggested by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Povilas Kanapickas <povilas@radix.lt>
+---
+ xfixes/cursor.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/xfixes/cursor.c b/xfixes/cursor.c
+index 60580b88f..c5d4554b2 100644
+--- a/xfixes/cursor.c
++++ b/xfixes/cursor.c
+@@ -1010,7 +1010,8 @@ ProcXFixesCreatePointerBarrier(ClientPtr client)
+ {
+     REQUEST(xXFixesCreatePointerBarrierReq);
+ 
+-    REQUEST_FIXED_SIZE(xXFixesCreatePointerBarrierReq, pad_to_int32(stuff->num_devices));
++    REQUEST_FIXED_SIZE(xXFixesCreatePointerBarrierReq,
++                       pad_to_int32(stuff->num_devices * sizeof(CARD16)));
+     LEGAL_NEW_RESOURCE(stuff->barrier, client);
+ 
+     return XICreatePointerBarrier(client, stuff);
+@@ -1027,7 +1028,8 @@ SProcXFixesCreatePointerBarrier(ClientPtr client)
+ 
+     swaps(&stuff->length);
+     swaps(&stuff->num_devices);
+-    REQUEST_FIXED_SIZE(xXFixesCreatePointerBarrierReq, pad_to_int32(stuff->num_devices));
++    REQUEST_FIXED_SIZE(xXFixesCreatePointerBarrierReq,
++                       pad_to_int32(stuff->num_devices * sizeof(CARD16)));
+ 
+     swapl(&stuff->barrier);
+     swapl(&stuff->window);
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
index 9a7aa1ed9a..ac32bb25c2 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2021-3472.patch \
            file://0001-hw-xwayland-Makefile.am-fix-build-without-glx.patch \
            file://CVE-2021-4008.patch \
+           file://CVE-2021-4009.patch \
            "
 SRC_URI[sha256sum] = "977420c082450dc808de301ef56af4856d653eea71519a973c3490a780cb7c99"
 
-- 
2.33.1


