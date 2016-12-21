Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0ABAF7740B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 16:59:00 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id g23so27971281wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 08:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=4BcyPkahY4kk9NMgAXOF/+Wu+k/peQ+xyER5FTMqG3I=;
	b=lxkiahnmKoQp9cosHoZ1+tqP/E5ZVKzKMFjFCx5P038aS1wk6fSh+0moCeqA7CIf4w
	dyCgqxZJ+0sCGCV2TXhYaThaDG43QVpA7ymZO93SUTOfJa8No/LdV+pZBu3EIFmfOofa
	5rtvRZ7B8cEz2UaPYZKIpY18CVDLcJvgJ0NHQ/y1IM9n58FKPICu+bHyqbEJl+THZHeg
	tBK2VV55QxIMqsxHerhA1Y5TvBlCl8KsZxLiI2DId3vr6MxvZvB7mXz+CMJFlXL0SIDr
	7vSeEZn/EnTzgw/EGHomiVU8IR1daBzsiyQcaSStAbRHNHjMpKt+55/4hcX9YeOHGxaR
	JZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=4BcyPkahY4kk9NMgAXOF/+Wu+k/peQ+xyER5FTMqG3I=;
	b=XoGS10ddq0uIjMmmSk9Q/Cti8rdS/jTArK7pksL3WtjyzavlxIqENHnEty77knHtED
	QxNlHUKl5DRcdVhzAA1F3BS/+c1TFtz4N4b62B79PTjTKxtGMNrmv5h4nBci385HU3NT
	bxltax0QgZupu+zFcQsoWqpWqyf+I8l8x97+WVML8yLHmsrkSsc74lOcHjFLZLOuTEB+
	eT2lhkCmSVnAMr9iJbAPTb9PIFjYidPC9y3FoFLREv0cLQPu0FguWXaVRhq2GsjBy5VZ
	8AUdUdxLKmYC2fCU3rLgChjMg+BkT7s4Ax0sl95pOkdQMw/5b2U/qkFAPgVSCPAGEl5q
	yc2A==
X-Gm-Message-State: AIkVDXLzFPuPPgpaimMeH+Ev2LBlQL09RZzcpr+1AvkeqijUiT9mWYz5IMCLXoo1zZlpEkyO
X-Received: by 10.28.47.196 with SMTP id v187mr7658749wmv.75.1482339541424;
	Wed, 21 Dec 2016 08:59:01 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i10sm31503377wjd.15.2016.12.21.08.59.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Dec 2016 08:59:00 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2016 16:58:57 +0000
Message-Id: <1482339537-1549-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] populate_sdk: don't force target debug packages into SDK
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
X-List-Received-Date: Wed, 21 Dec 2016 16:59:01 -0000

TOOLCHAIN_TARGET_TASK doesn't need to explicitly list sdk-target-dbg because if
SDKIMAGE_FEATURES contains dbg-pkgs (as it does by default) then they'll all be
installed anyway.  This means that if the user removes dbg-pkgs from
SDKIMAGE_FEATURES then the SDK correctly doesn't have debug packages in.

[ YOCTO #9078 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/populate_sdk_base.bbclass | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 48bc395..8d117a9 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -34,10 +34,7 @@ SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
 
 TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host packagegroup-cross-canadian-${MACHINE}"
 TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
-TOOLCHAIN_TARGET_TASK ?= " \
-    ${@multilib_pkg_extend(d, 'packagegroup-core-standalone-sdk-target')} \
-    ${@multilib_pkg_extend(d, 'packagegroup-core-standalone-sdk-target-dbg')} \
-    "
+TOOLCHAIN_TARGET_TASK ?= "${@multilib_pkg_extend(d, 'packagegroup-core-standalone-sdk-target')}"
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 
-- 
2.8.1


