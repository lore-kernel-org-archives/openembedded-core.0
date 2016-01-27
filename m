Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8C6177706E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 08:45:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0R8jW6t001505
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 27 Jan 2016 00:45:32 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jan 2016 00:45:31 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>
Date: Wed, 27 Jan 2016 03:45:17 -0500
Message-ID: <90e5a6fe8d1be38ccd5f3d0a50fd8be9471ed50f.1453882496.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453882496.git.hongxu.jia@windriver.com>
References: <cover.1453882496.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] base/bbclass: use target path as include dir in debugging info
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
X-List-Received-Date: Wed, 27 Jan 2016 08:45:32 -0000
Content-Type: text/plain

In debugging information, it uses target paths rather than
build ones as include dir.

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
 meta/classes/base.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e05552c..5c95cba 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -91,6 +91,11 @@ def debug_prefix_map(d):
         buildsrc = d.getVar("S", True)
         targetsrc = "/usr/src/%s" % d.getVar("BPN", True)
         opts += " -fdebug-prefix-map=%s=%s" % (buildsrc, targetsrc)
+
+        for var in ["STAGING_DIR_NATIVE", "STAGING_DIR_HOST"]:
+            buildinc = d.getVar(var, True)
+            opts += " -fdebug-prefix-map=%s=" % (buildinc)
+
         opts += " -gno-record-gcc-switches"
     return opts
 
-- 
1.9.1


