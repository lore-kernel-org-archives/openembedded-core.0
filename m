Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC807C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 15:19:31 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.1720.1641395941760702382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 07:19:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=O0OOcqAN;
 spf=pass (domain: intel.com, ip: 192.55.52.88,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641395971; x=1672931971;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=nKGl3dG2ujihGZ5T0Z2bn2PNx+Ra6tpFTmms8gGbYDY=;
  b=O0OOcqANblQWF0tcnJ2tOnDpOpCx1n0a9hReVDR1d29WK5q77bwYv4tW
   zB8bhi1TeOkSJcC+PNmKWBzU0N82tDtVdznCbRmb+9NoYiSsIMmOnj72d
   AwXfnljwnYW/irmgG5yAwrGJGPYkPPp8kRVv9k7MammKZcq1u6xpyJUWt
   I8InOwxnd8IuFdd9btNDWHoZmLUWwzwIfv/UNLB9LJuUufIz8hrqSOrb8
   Nsn7zjxYjDRuzsrzF5mz4zcG8QWm/xQsNxA4PjcrjKm/JhmDBuTr+ibJa
   97g52azZw1mxvRSzIHE1F82hGT6y6m5kpAoFkx/WJxJ1SNr3u0MyMm7Mb
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="266742857"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="266742857"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="668128696"
Received: from hanwenlx-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.129.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:27 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 18/24] xserver-xorg: fix CVE-2021-4011
Date: Wed,  5 Jan 2022 23:18:38 +0800
Message-Id: 
 <5f300f2be6453947a37231ced56ca577c91d93b4.1641395036.git.anuj.mittal@intel.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/160203

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2021-4011 for xserver-xorg.

CVE: CVE-2021-4011

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../xserver-xorg/CVE-2021-4011.patch          | 40 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.10.bb      |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4011.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4011.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4011.patch
new file mode 100644
index 0000000000..c7eb03091d
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4011.patch
@@ -0,0 +1,40 @@
+Backport patch to fix CVE-2021-4011.
+
+CVE: CVE-2021-4011
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/e56f61c]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From e56f61c79fc3cee26d83cda0f84ae56d5979f768 Mon Sep 17 00:00:00 2001
+From: Povilas Kanapickas <povilas@radix.lt>
+Date: Tue, 14 Dec 2021 15:00:00 +0200
+Subject: [PATCH] record: Fix out of bounds access in SwapCreateRegister()
+
+ZDI-CAN-14952, CVE-2021-4011
+
+This vulnerability was discovered and the fix was suggested by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Povilas Kanapickas <povilas@radix.lt>
+---
+ record/record.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/record/record.c b/record/record.c
+index be154525d..e123867a7 100644
+--- a/record/record.c
++++ b/record/record.c
+@@ -2516,8 +2516,8 @@ SwapCreateRegister(ClientPtr client, xRecordRegisterClientsReq * stuff)
+         swapl(pClientID);
+     }
+     if (stuff->nRanges >
+-        client->req_len - bytes_to_int32(sz_xRecordRegisterClientsReq)
+-        - stuff->nClients)
++        (client->req_len - bytes_to_int32(sz_xRecordRegisterClientsReq)
++        - stuff->nClients) / bytes_to_int32(sz_xRecordRange))
+         return BadLength;
+     RecordSwapRanges((xRecordRange *) pClientID, stuff->nRanges);
+     return Success;
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
index 84b0acb42f..58f1eb328e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
@@ -12,6 +12,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2021-4008.patch \
            file://CVE-2021-4009.patch \
            file://CVE-2021-4010.patch \
+           file://CVE-2021-4011.patch \
            "
 SRC_URI[sha256sum] = "977420c082450dc808de301ef56af4856d653eea71519a973c3490a780cb7c99"
 
-- 
2.33.1


