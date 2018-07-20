Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E760871985
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 02:07:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42456972"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jul 2018 10:07:38 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id E137A4B625E9;
	Fri, 20 Jul 2018 10:07:38 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Fri, 20 Jul 2018 10:07:39 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <1529965666-49307-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: E137A4B625E9.AC733
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v2] cross-canadian/libgcc: fix aarch64's multilib SDK
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
Date: Fri, 20 Jul 2018 02:07:39 -0000
X-Original-Date: Mon, 25 Jun 2018 15:27:46 -0700
X-List-Received-Date: Fri, 20 Jul 2018 02:07:39 -0000
Content-Type: text/plain

The arm toolchain has a "-gnueabi" suffix, but aarch64 doesn't,
this makes multilib sdk doesn't work, there will be error as following:

.../usr/libexec/armeb-poky-linux-gux-linux-gnueabi/7.3.0/real-ld: cannot find crtbeginS.o: No such file or directo
.../usr/libexec/armeb-poky-linux-gux-linux-gnueabi/7.3.0/real-ld: cannot find -lgcc
.../usr/libexec/armeb-poky-linux-gux-linux-gnueabi/7.3.0/real-ld: cannot find -lgcc
collect2: error: ld returned 1 exit status

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta/recipes-devtools/gcc/libgcc-common.inc | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index 848a476..a49fc98 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -145,11 +145,22 @@ fakeroot python do_extra_symlinks() {
     if bb.data.inherits_class('nativesdk', d):
         return
 
-    targetsys = d.getVar('BASETARGET_SYS')
+    base_targetsys = d.getVar('BASETARGET_SYS')
+    targetsys = d.getVar('TARGET_SYS')
+
+    if base_targetsys != targetsys:
+        dest = d.getVar('D') + d.getVar('libdir') + '/' + base_targetsys
+        dest_list = [dest]
+        # For multilib like aarch64 + arm, need 2 symlinks:
+        # 1) BASETARGET_SYS as usual
+        # 2) BASETARGET_SYS + "-gnueabi" for multilib
+        libce = d.getVar('LIBCEXTENSION')
+        abie = d.getVar('ABIEXTENSION')
+        if abie and libce and targetsys.endswith(libce + abie):
+            dest_list.append(dest + libce + abie)
+        src = targetsys
+        for dir in dest_list:
+            if not os.path.lexists(dir) and os.path.lexists(d.getVar('D', True) + d.getVar('libdir', True)):
+                os.symlink(src, dir)
 
-    if targetsys != d.getVar('TARGET_SYS'):
-        dest = d.getVar('D') + d.getVar('libdir') + '/' + targetsys
-        src = d.getVar('TARGET_SYS')
-        if not os.path.lexists(dest) and os.path.lexists(d.getVar('D') + d.getVar('libdir')):
-            os.symlink(src, dest)
 }
-- 
2.7.4




