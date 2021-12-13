Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59835C433FE
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 04:17:35 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.7345.1639369051545710943
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 20:17:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=YsBiJCBX;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639369054; x=1670905054;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=OMXyvzwxUn9JrIkbgsH/DH713WEYROq5UPT9xWEHYso=;
  b=YsBiJCBX27FqwqZYQHIjaL6/b1t9tu1ocLmvkpCz/3slClO6F2fZ/yj+
   M3j1z2fUgx1wmx/G+0q4fUxU5xfHidPIJWnvrS0w2W4ZLN3eOLKJ3ncLN
   bOQMpeuG8lRg+rTEqgQ+75e41vzg4zhuiYVw5fUSg2pMAhciuxIyG4imU
   KSa/8M5BYWIBjeIAXYpB6pLczLActcNOLpg/GPj55I7buUs99jo7n1/JU
   HBBn3mGEDAJVcGJjADlbCpunNdX6YDMBdIxZ9XtRfYBi+GsArXQ5bMC8S
   ++Fu/tkVJqmBQkDmZn2L+9a2vyxPQa+OpCootMIa2kkaFkKEzi04UWX+r
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="238602209"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="238602209"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="517589262"
Received: from echan1-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.132.97])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:33 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 04/20] wic: support rootdev identified by partition
 label
Date: Mon, 13 Dec 2021 12:17:03 +0800
Message-Id: 
 <e10d5f31566285d66bbab29f5e2d9d8a79ee8e85.1639365111.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639365111.git.anuj.mittal@intel.com>
References: <cover.1639365111.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 04:17:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159594

From: "Schmidt, Adriaan" <adriaan.schmidt@siemens.com>

We already support specifying the rootfs by PARTUUID. This adds general
support for letting the kernel find the rootfs by PARTLABEL.

Signed-off-by: Adriaan Schmidt <adriaan.schmidt@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2fb247c5ecf057bb96649a3c0234794b4991c050)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index ea709e8c54..2c5d5efe0e 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -258,6 +258,8 @@ class DirectPlugin(ImagerPlugin):
             if part.mountpoint == "/":
                 if part.uuid:
                     return "PARTUUID=%s" % part.uuid
+                elif part.label:
+                    return "PARTLABEL=%s" % part.label
                 else:
                     suffix = 'p' if part.disk.startswith('mmcblk') else ''
                     return "/dev/%s%s%-d" % (part.disk, suffix, part.realnum)
-- 
2.33.1


