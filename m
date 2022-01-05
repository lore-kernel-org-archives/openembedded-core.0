Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFA3C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 15:19:24 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.1720.1641395941760702382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 07:19:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=OOEdlAmC;
 spf=pass (domain: intel.com, ip: 192.55.52.88,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641395964; x=1672931964;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=3Hngvv0DAQgLv0LDcXjNzRGlR6BZCVBfhHWl2WUxPkE=;
  b=OOEdlAmCAiktdItEGN6w23zjLyMwtYmWmz4Qlta7FgWcbRL+2bB8c9EV
   wYeS8yEhqhCENMkNLnHNSaZHEgF/WNAStaWovRZXGhPoxstmo7np3TNX5
   2O3VEoy5e356DD7fsOZQ6OXFSm4OAHBZhsPrJatlXMM5XBYJFlD461OXJ
   YY9DBDBK0Z1YQuXu53IckIrEY36ocsiyHb1U0zDpbmJHFntGRoBt7MsNK
   O5aaNCcgKd4dtl1IGykMmnE4oMfM/mrSccGJjggw/NU4HGicRJPcAiAu+
   0i8txEcwJrKRt8S9uoiCAcsBSCV6OzwMt9J/fs0xZFchgq5U3bBaZIo2z
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="266742838"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="266742838"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="668128679"
Received: from hanwenlx-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.129.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:22 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 15/24] xserver-xorg: fix CVE-2021-4008
Date: Wed,  5 Jan 2022 23:18:35 +0800
Message-Id: 
 <e975b1741209e298c3b6a5b101c93e1c17dbced6.1641395036.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1641395036.git.anuj.mittal@intel.com>
References: <cover.1641395036.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 15:19:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160200

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2021-4008 for xserver-xorg.

CVE: CVE-2021-4008

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../xserver-xorg/CVE-2021-4008.patch          | 59 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.10.bb      |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4008.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4008.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4008.patch
new file mode 100644
index 0000000000..3277be0185
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4008.patch
@@ -0,0 +1,59 @@
+Backport patch to fix CVE-2021-4008.
+
+CVE: CVE-2021-4008
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/ebce7e2]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From ebce7e2d80e7c80e1dda60f2f0bc886f1106ba60 Mon Sep 17 00:00:00 2001
+From: Povilas Kanapickas <povilas@radix.lt>
+Date: Tue, 14 Dec 2021 15:00:03 +0200
+Subject: [PATCH] render: Fix out of bounds access in
+ SProcRenderCompositeGlyphs()
+
+ZDI-CAN-14192, CVE-2021-4008
+
+This vulnerability was discovered and the fix was suggested by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Povilas Kanapickas <povilas@radix.lt>
+---
+ render/render.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/render/render.c b/render/render.c
+index c376090ca..456f156d4 100644
+--- a/render/render.c
++++ b/render/render.c
+@@ -2309,6 +2309,9 @@ SProcRenderCompositeGlyphs(ClientPtr client)
+ 
+         i = elt->len;
+         if (i == 0xff) {
++            if (buffer + 4 > end) {
++                return BadLength;
++            }
+             swapl((int *) buffer);
+             buffer += 4;
+         }
+@@ -2319,12 +2322,18 @@ SProcRenderCompositeGlyphs(ClientPtr client)
+                 buffer += i;
+                 break;
+             case 2:
++                if (buffer + i * 2 > end) {
++                    return BadLength;
++                }
+                 while (i--) {
+                     swaps((short *) buffer);
+                     buffer += 2;
+                 }
+                 break;
+             case 4:
++                if (buffer + i * 4 > end) {
++                    return BadLength;
++                }
+                 while (i--) {
+                     swapl((int *) buffer);
+                     buffer += 4;
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
index e0551fa999..9a7aa1ed9a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch \
            file://CVE-2021-3472.patch \
            file://0001-hw-xwayland-Makefile.am-fix-build-without-glx.patch \
+           file://CVE-2021-4008.patch \
            "
 SRC_URI[sha256sum] = "977420c082450dc808de301ef56af4856d653eea71519a973c3490a780cb7c99"
 
-- 
2.33.1


