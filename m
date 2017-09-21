Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 59B3E60685
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 17:46:17 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id q80so3294130ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 10:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=OZ16Ze64M20V4z32hgcyCzBGHnU7IH9BLEMifT+j2p8=;
	b=eHDNy8Jx/WyjLGzMCM67+jsZVukWIdXStTC7oKrU9ybdS/8qZ+C6SkiRyzVsTVfwrT
	EqMmOaKYePbkieH2X1AsoI/pGGymdPLCb07TxH13SLrnTdJJ9MoSe6inHUQCmuxh9K5i
	RuY/bf8X6NEOF1fgrWX4DcZlLVV5+Gdb0VqkprwMeP1/v3MJVLzdssjN2Pv+ztCVDs7s
	L147PH0h5XWsgUXo77xAurVu0gCCM+ZFM4B0fXc9unRpiea2cpcRxuPaeeGvFFdzlpMD
	C2cWFQPhB7DCPIe7cgvTZgsKg+4FmLKKpw3wikWqGUiai73NB6JYFu6uojkE4GCjNb4Z
	i1KA==
X-Gm-Message-State: AHPjjUhXEr+w8aC6qYtHbYZzMvtCRMvDTArJ+27MDw4dK9FkBRGKMX+G
	wHb7903p8MwBlL7fGWyQ63s0
X-Google-Smtp-Source: AOwi7QAtKIio9BRoSvM9DluJvWSJ41mrt/i3Vuhyxgag26JI1L0MCpMug+S69Z2OInm0Qf3izpQx8g==
X-Received: by 10.129.188.70 with SMTP id b6mr913733ywl.436.1506015978768;
	Thu, 21 Sep 2017 10:46:18 -0700 (PDT)
Received: from localhost.localdomain (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	n186sm704902ywn.12.2017.09.21.10.46.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Sep 2017 10:46:18 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 13:46:16 -0400
Message-Id: <1506015977-16858-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] wic: When using --use-uuid make sure that we update the fstab with PARTUUID
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
X-List-Received-Date: Thu, 21 Sep 2017 17:46:18 -0000

When we have been told to use the UUID we should also update the fstab
to make use of PARTUUID instead of hard-coding the device in question.
This will make the resulting image much more portable.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index a6abc3d09ef0..b0da54511b77 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -139,9 +139,12 @@ class DirectPlugin(ImagerPlugin):
                or part.mountpoint == "/":
                 continue
 
-            # mmc device partitions are named mmcblk0p1, mmcblk0p2..
-            prefix = 'p' if  part.disk.startswith('mmcblk') else ''
-            device_name = "/dev/%s%s%d" % (part.disk, prefix, part.realnum)
+            if part.use_uuid:
+                device_name = "PARTUUID=%s" % part.uuid
+            else:
+                # mmc device partitions are named mmcblk0p1, mmcblk0p2..
+                prefix = 'p' if  part.disk.startswith('mmcblk') else ''
+                device_name = "/dev/%s%s%d" % (part.disk, prefix, part.realnum)
 
             opts = part.fsopts if part.fsopts else "defaults"
             line = "\t".join([device_name, part.mountpoint, part.fstype,
-- 
1.9.1


