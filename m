Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 85A2E77D12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 20:21:58 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id z39so9895800wrb.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 13:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=wXl0dRT5xkmefWofyC89EmSDc1wnRmFJwv/8CsNfQO4=;
	b=XqL4DOrJ57bm24CJIwq1xH02eI0UhmNX86s0YBcX2xj3mnw+JZNed2rKsDvOcj+eXZ
	LyO4LKzPUa/8Vy4F4Ttwjnl1SXaSWbBu4CNoYeOUk78ngygj7v2h+RzvYP2hJNzGDY2N
	2h0uWmFGXnHio1Q9hzKACjxyJrh16dMxAq0vrEVr+K97mzV00xX3AU7+LIbP/za83fDR
	a+kTqAAokL2pA+UgIRoZkeBNHEeMyF9ojKYfxGsO1WmapgFr31mH5Lyy7zVikcDO8tBO
	VBQsglbMivXKR6uh2LtOkxvm19uvHhtbe/ACDFiXAetnQjHYeFmUrfCnWycxmbXlTJeF
	rHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=wXl0dRT5xkmefWofyC89EmSDc1wnRmFJwv/8CsNfQO4=;
	b=bSyUswqH7ZUuGohW99GGjxdwYMhE3MT5C+nrXbCKZornx/hC6416Lj+lbNvcy2XOPC
	EGNABwu4Wf9FHoGQi/DEjUB6xTOylpnBwFvCJi+7Y0W2aGcr+7IkXtompHoOIp7tdm0Q
	vDja28HQABrXBzGwj3cqsWyXerIkoM5qbExBoR1sFtQQAYCWAJuWKVZ3rMdqxK3uv6H3
	NYgZy3HCfJVdE2xR4tGd0HXOeUsJOtSc/ErHN6VDEUn2ER5Q5IZuHqOEy0w/yf8ts3sw
	HfOOVuO3YG/MqQC9suSAZyv8FElCYcG+QUgJaBP81UwXBaNIC8cxK8YAcW2ZV7Xc/FH5
	T38Q==
X-Gm-Message-State: AHPjjUjVoFdDSBAsxSKywp8PWnywE6exvpyL83RtqA1ZCT6RMNBkoaGa
	QkOS2Z5TUBPhPWOnHF/ye65zTyh4
X-Google-Smtp-Source: AOwi7QBK3QFxWaO7jO7IkCgdInhc7Nv3P9HOSXurwub6CkoVHV8Fi4agH4nB6fk6zvvbnMZDX8ZO4A==
X-Received: by 10.223.155.194 with SMTP id e2mr8053008wrc.49.1506370919252;
	Mon, 25 Sep 2017 13:21:59 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id v5sm301488wmb.0.2017.09.25.13.21.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Sep 2017 13:21:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Sep 2017 21:21:55 +0100
Message-Id: <20170925202155.22798-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] core-image-sato-sdk-ptest: reduce size
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
X-List-Received-Date: Mon, 25 Sep 2017 20:21:59 -0000

This image is very large and is skirting the maximum size of hddimg images (4GB,
as they're embedded inside FAT partitions).  Making the image 10MB bigger can be
enough to cause the build to fail.  This image is also used by QA so currently
we need to keep it working.

The default values for expanding an image to give it usable space are quite
generous, (3GB rootfs * 1.3 gives 1GB of empty space), so change the overhead
multiplier to 1.0x and explicitly request just 0.5GB of empty space in the
images.

This should give us a bit more breathing room until we can either remove hddimg
from the default build, or make this image dramatically smaller.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
index 93e5a4eb6d5..531571ee877 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
@@ -4,3 +4,8 @@ DESCRIPTION += "Also includes ptest packages."
 
 IMAGE_FEATURES += "ptest-pkgs"
 
+# This image is sufficiently large (~3GB) that it can't actually fit in a live
+# image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
+# box) and explicitly add just 500MB.
+IMAGE_OVERHEAD_FACTOR = "1.0"
+IMAGE_ROOTFS_EXTRA_SPACE = "524288"
-- 
2.11.0


