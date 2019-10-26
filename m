Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 382E27FC07
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 06:50:26 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 11so4381543wmk.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5RQa0x9RzHAPN8HR4cFG/bciUq6YQfdLsPfWVuhIeRc=;
	b=hlH0nJ8B4PeWYDJgNHwP16czxZpglrGxNGwVAcIFGRh38ggslTC2OrMb+tT0CR2jKt
	c8a/LbswL/iZuoCaQqcm7VJnsjnGp5D5Ywka4ytoBHISJThMrS3ohnRwtH1TO2bLiM1W
	zWbqH3bNeevg9oeJg3KQNBuTbT/72MD/e42Q5tYNk2gSqbV9g68ghDCoNI937PwvBli7
	c6zBlh0iQbs469/VnsgNTy1MhoRHJ0HNkNCNOEbj/q0Yo1yDpRGdbpd9EOq97I7Tj2Vr
	SreXETe4S9P/D2Bhym35mhz1IJtYzcz69JjACuFkUg8YBxRVd4JpNvTw/1Ly+gq6ceiu
	FObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5RQa0x9RzHAPN8HR4cFG/bciUq6YQfdLsPfWVuhIeRc=;
	b=HlYU7t6IxLJO3bI1joLpZG+Hr0zZGBwXBun61QLWMF+rERpyGCF1e/A96LuygFdbmo
	zI1a+HJFTARd+b50e09vvr7oRMqp8RFspy0K1SQKMfvPdZx+BNrErIBjx2U+959ap/gc
	358NuK5GOzbEM7AwnymyIZ1tRNKLkyUwle7TbZUMyno7M1Zo0s/xhBAj0J1kK4r0ylXB
	juvNYcOeNPkgP47WOrZNI40p5M7sHZSzpGsxavrbhANCEHhrnJH6l2rdQQv3mwkOt7WL
	/+MnoozAYv8aFHXYrCRUDl/tC5rLZAbRBDrwQMPOZgs8b28/r9XuptT+xTigHLIi05nR
	MZIg==
X-Gm-Message-State: APjAAAVQ8bVA3kHA77HiyrVuYzhdV69NnwNl3f+O+DWjVNt48Mi3bSX2
	hBZHru/iK/XL3cdackZuUlDEwdkniiA=
X-Google-Smtp-Source: APXvYqyyOJ5Yua9MSjmAO7XPb5ZdB5Lghup9UhXgGDeV9K6CIMgkBLbOQp4sLnEc7HLOMpUZB0v5+Q==
X-Received: by 2002:a05:600c:2943:: with SMTP id
	n3mr6422746wmd.11.1572072626712; 
	Fri, 25 Oct 2019 23:50:26 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.controleur.wifipass.org ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v6sm4807911wru.72.2019.10.25.23.50.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 23:50:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:59 -0700
Message-Id: <c281898b27f9fe1555dffa94e74d3c05520ac51e.1572072422.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572072421.git.akuster808@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
Subject: [zeus 27/28] wic/engine: use 'linux-swap' for swap file system
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
X-List-Received-Date: Sat, 26 Oct 2019 06:50:27 -0000

From: Chee Yang Lee <chee.yang.lee@intel.com>

[YOCTO #13312]
see https://bugzilla.yoctoproject.org/show_bug.cgi?id=13312

wic/engine.Disk._get_part_image was looking at variable fstypes for
supported fstype which is 'swap' but image build with 'linux-swap'.
supported fstype should be 'linux-swap'.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7e6da22fe4faf841bcec02e55f376b4dae04d6a8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/wic/engine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 61939ad1..18776fa 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -541,7 +541,7 @@ def wic_write(args, native_sysroot):
     """
     Write image to a target device.
     """
-    disk = Disk(args.image, native_sysroot, ('fat', 'ext', 'swap'))
+    disk = Disk(args.image, native_sysroot, ('fat', 'ext', 'linux-swap'))
     disk.write(args.target, args.expand)
 
 def find_canned(scripts_path, file_name):
-- 
2.7.4


