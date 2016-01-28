Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D99ED771E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 14:47:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0SElo4b014840
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 28 Jan 2016 06:47:51 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 28 Jan 2016 06:47:50 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>
Date: Thu, 28 Jan 2016 09:47:43 -0500
Message-ID: <8b4ea44c29088280a8b7625ee4fedd7a5d3b158a.1453991989.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453991989.git.hongxu.jia@windriver.com>
References: <cover.1453991989.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] base/bbclass: use target path as compile dir in debugging info
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
X-List-Received-Date: Thu, 28 Jan 2016 14:47:54 -0000
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
 meta/classes/base.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 5fc9271..3a43661 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -85,6 +85,24 @@ FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${BP}", "${FILE_DIRNAME}/${
 # in the context of the location its used (:=)
 THISDIR = "${@os.path.dirname(d.getVar('FILE', True))}"
 
+def debug_prefix_map(d):
+    opts = ""
+    if "-g" in (d.getVar("SELECTED_OPTIMIZATION", True) or "").split():
+        targetsrc = "/usr/src/%s" % d.getVar("BPN", True)
+        for var in ["S", "B"]:
+            buildsrc = d.getVar(var, True)
+            opt = " -fdebug-prefix-map=%s=%s" % (buildsrc, targetsrc)
+            if opt not in opts:
+                opts += opt
+
+        for var in ["STAGING_DIR_NATIVE", "STAGING_DIR_HOST"]:
+            buildinc = d.getVar(var, True)
+            opts += " -fdebug-prefix-map=%s=" % (buildinc)
+
+    return opts
+
+TARGET_CFLAGS += "${@debug_prefix_map(d)}"
+
 def extra_path_elements(d):
     path = ""
     elements = (d.getVar('EXTRANATIVEPATH', True) or "").split()
-- 
1.9.1


