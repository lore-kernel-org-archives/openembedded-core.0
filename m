Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A268B76DE1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 17:36:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0THa4x1014325
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Jan 2016 09:36:04 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 29 Jan 2016 09:36:03 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>
Date: Fri, 29 Jan 2016 12:35:54 -0500
Message-ID: <51387bed968918e5c45820eb32ee898485cc0544.1454088695.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1454088695.git.hongxu.jia@windriver.com>
References: <cover.1454088695.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] base/bbclass: use target path as compile dir in debugging info
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
X-List-Received-Date: Fri, 29 Jan 2016 17:36:05 -0000
Content-Type: text/plain

In debugging information, it uses target paths rather than
build ones as compile dir.
...
 -fdebug-prefix-map=old=new
   When compiling files in directory old, record debugging
   information describing them as in new instead.
...

Compile without this fix:
objdump -g git/test.o
...
 The Directory Table (offset 0x1b):
|  1     /buildarea/raid0/hjia/build-20160119-yocto-buildpath/tmp/sysroots/x86_64-linux/usr/lib/
i686-pokymllib32-linux.lib32-gcc-cross-initial-i686/gcc/i686-pokymllib32-linux/5.3.0/include
|  2     /buildarea/raid0/hjia/build-20160119-yocto-buildpath/tmp/sysroots/lib32-qemux86-64/usr/include/bits
|  3     /buildarea/raid0/hjia/build-20160119-yocto-buildpath/tmp/sysroots/lib32-qemux86-64/usr/include
...

Compile with this fix:
objdump -g git/test.o
...
 The Directory Table (offset 0x1b):
|  1     /usr/lib/i686-pokymllib32-linux.lib32-gcc-cross-initial-i686/gcc/i686-pokymllib32-linux/
5.3.0/include
|  2     /usr/include/bits
|  3     /usr/include
...

[YOCTO #7058]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/bitbake.conf | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e80ee18..bebaaf4 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -546,7 +546,14 @@ EXTRA_OEMAKE_prepend_task-install = "${PARALLEL_MAKEINST} "
 ##################################################################
 # Optimization flags.
 ##################################################################
-DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types"
+DEBUG_FLAGS ?= "-g \
+    -feliminate-unused-debug-types \
+    -fdebug-prefix-map=${B}=/usr/src/${BPN} \
+    -fdebug-prefix-map=${S}=/usr/src/${BPN} \
+    -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
+    -fdebug-prefix-map=${STAGING_DIR_HOST}= \
+"
+
 # Disabled until the option works properly -feliminate-dwarf2-dups
 FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
 DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
-- 
1.9.1


