Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 80B287724B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 08:34:44 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l65so4311218wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 01:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=n2EcVmad6f4Lz1dfd3aN/7+E+A37ryzDga21qlb8YzM=;
	b=RyS+VAv+DK6FfR+ynUF72UnzO469P3H+KQYG2NcIp2kLZpwge5PUgY3QI64kUyRKTD
	S5Sy0av+tXr6Bv4TeFzUo/2/qLzaP46SgV2iHQ7J07mksBloPqXVPUVOa4js+J664Sek
	TPPKtYYfBISO3awHXjzOtaUk4H7eRbQSInRVOlmayyTVJ0CNs+eN2mTZ7ntacBshknYh
	zaV5aMWwZO/F4UTgR/0MOYWDBdDrMXbAFwBpvCyJJlGoMee9IqG44E2HzvasPDyVTZB8
	HWzrgb/PlIQQRKu3tpvYez50r6XG8bOJp3b9I3ehHeShYwCCZ2JK018sPJJEBWCbFD/q
	A3fQ==
X-Gm-Message-State: AE9vXwP315YiCEGVyjOVoi8TjS9QnKyWcVTv+gZmyUJRs94D//tIMxIbW+k7T+Ik93RlMQ==
X-Received: by 10.194.103.74 with SMTP id fu10mr2220506wjb.14.1473064484414;
	Mon, 05 Sep 2016 01:34:44 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	wr2sm26403697wjb.12.2016.09.05.01.34.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Sep 2016 01:34:43 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Sep 2016 09:34:42 +0100
Message-Id: <20160905083442.27787-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH] image.bbclass: do not check size of the debugfs image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Sep 2016 08:34:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The debugfs is supposed to be used in addition to the
normal image for debugging purposes, it doesn't make
sense to artificially limit its maximum size.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/classes/image.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 07bd2d6..cb7d06d 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -538,6 +538,12 @@ def get_rootfs_size(d):
     base_size += rootfs_alignment - 1
     base_size -= base_size % rootfs_alignment
 
+    # Do not check image size of the debugfs image. This is not supposed
+    # to be deployed, etc. so it doesn't make sense to limit the size
+    # of the debug.
+    if (d.getVar('IMAGE_BUILDING_DEBUGFS', True) or "") == "true":
+        return base_size
+
     # Check the rootfs size against IMAGE_ROOTFS_MAXSIZE (if set)
     if rootfs_maxsize:
         rootfs_maxsize_int = int(rootfs_maxsize)
-- 
2.9.3


