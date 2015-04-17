Return-Path: <zhengjunling@huawei.com>
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [119.145.14.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9D5EF73D24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Apr 2015 08:53:26 +0000 (UTC)
Received: from 172.24.2.119 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CJX64359; Fri, 17 Apr 2015 16:53:24 +0800 (CST)
Received: from Patch-Test.huawei (10.107.197.245) by
	szxeml432-hub.china.huawei.com (10.82.67.209) with Microsoft SMTP
	Server id 14.3.158.1; Fri, 17 Apr 2015 16:53:21 +0800
From: Junling Zheng <zhengjunling@huawei.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Apr 2015 08:50:08 +0000
Message-ID: <1429260608-3505-1-git-send-email-zhengjunling@huawei.com>
X-Mailer: git-send-email 1.8.3.4
MIME-Version: 1.0
X-Originating-IP: [10.107.197.245]
X-CFilter-Loop: Reflected
Subject: [PATCH] gmp: remove referencing paths from the build host
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
X-List-Received-Date: Fri, 17 Apr 2015 08:53:30 -0000
Content-Type: text/plain

Currently ${D}${includedir}/gmp.h references the path of build host
incorrectly, remove it.

Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
---
 meta/recipes-support/gmp/gmp.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
index 558ee06..a80b356 100644
--- a/meta/recipes-support/gmp/gmp.inc
+++ b/meta/recipes-support/gmp/gmp.inc
@@ -26,4 +26,8 @@ EXTRA_OECONF += " --enable-cxx=detect"
 PACKAGES =+ "libgmpxx"
 FILES_libgmpxx = "${libdir}/libgmpxx${SOLIBS}"
 
+do_install_append_class-target() {
+	sed -i "s+--sysroot=${STAGING_DIR_HOST}++g" ${D}${includedir}/gmp.h
+}
+
 SSTATE_SCAN_FILES += "gmp.h"
-- 
1.9.1


