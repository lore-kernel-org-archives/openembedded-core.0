Return-Path: <zhengjunling@huawei.com>
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
	by mail.openembedded.org (Postfix) with ESMTP id 71C146192E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2020 17:18:19 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 7650BA0766D780EB2B23
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 01:18:04 +0800 (CST)
Received: from HULK-Android.huawei.com (10.113.189.218) by
	DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server
	id 14.3.439.0; Tue, 3 Mar 2020 01:17:46 +0800
From: Junling Zheng <zhengjunling@huawei.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Mar 2020 01:17:44 +0800
Message-ID: <20200302171744.30713-2-zhengjunling@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200302171744.30713-1-zhengjunling@huawei.com>
References: <20200302171744.30713-1-zhengjunling@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.113.189.218]
X-CFilter-Loop: Reflected
Cc: wangnan0@huawei.com
Subject: [RESEND PATCH 2/2] arch-arm64.inc: Do not append aarch64 in MACHINEOVERRIDES
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
X-List-Received-Date: Mon, 02 Mar 2020 17:18:22 -0000
Content-Type: text/plain

Currently, for arch-arm64, poky will append the MACHINEOVERRIDES with
"aarch64:", which has the higher priority than TRANSLATED_TARGET_ARCH.
So, for aarch64 big endian, the variable '<foo>_aarch64' will override
not only '<foo>', but also '<foo>_aarch64-be', thus we will get an
incorrect variable.

Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
---
 meta/conf/machine/include/arm/arch-arm64.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
index 53f4566815..32294bd218 100644
--- a/meta/conf/machine/include/arm/arch-arm64.inc
+++ b/meta/conf/machine/include/arm/arch-arm64.inc
@@ -4,8 +4,6 @@ require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[aarch64] = "Enable instructions for aarch64"
 
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'aarch64:', '' ,d)}"
-
 # Little Endian base configs
 AVAILTUNES += "aarch64 aarch64_be"
 ARMPKGARCH_tune-aarch64 ?= "aarch64"
-- 
2.17.1


