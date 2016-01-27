Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B9769755F8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 08:45:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0R8jYIb006182
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 27 Jan 2016 00:45:34 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jan 2016 00:45:33 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>
Date: Wed, 27 Jan 2016 03:45:18 -0500
Message-ID: <6f45896d800e01859793bc0e1b990833f4a118ae.1453882496.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453882496.git.hongxu.jia@windriver.com>
References: <cover.1453882496.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] base/bbclass: fix missing to replace build dir in debugging info
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
X-List-Received-Date: Wed, 27 Jan 2016 08:45:35 -0000
Content-Type: text/plain

Previously, it missed to replace build dir(${B}).

Compile without this fix:
objdump -g packages-split/lib32-glibc-staticdev/usr/lib/librpcsvc.a
...
 The Directory Table (offset 0x1b):
|  1     /buildarea/raid0/hjia/build-20160119-yocto-buildpath/tmp/work/core2-32-pokymllib32-linux/
lib32-glibc/2.22-r0/build-i686-pokymllib32-linux/sunrpc
|  15    /buildarea/raid0/hjia/build-20160119-yocto-buildpath/tmp/work/core2-32-pokymllib32-linux/
lib32-glibc/2.22-r0/build-i686-pokymllib32-linux/sunrpc/rpcsvc
...

Compile with this fix:
objdump -g packages-split/lib32-glibc-staticdev/usr/lib/librpcsvc.a
...
 The Directory Table (offset 0x1b):
  1     /usr/src/glibc/sunrpc
  15    /usr/src/glibc/sunrpc/rpcsvc
...

[YOCTO #7058]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/base.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 5c95cba..afa7dd8 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -88,9 +88,12 @@ THISDIR = "${@os.path.dirname(d.getVar('FILE', True))}"
 def debug_prefix_map(d):
     opts = ""
     if "-g" in (d.getVar("SELECTED_OPTIMIZATION", True) or "").split():
-        buildsrc = d.getVar("S", True)
         targetsrc = "/usr/src/%s" % d.getVar("BPN", True)
-        opts += " -fdebug-prefix-map=%s=%s" % (buildsrc, targetsrc)
+        for var in ["S", "B"]:
+            buildsrc = d.getVar(var, True)
+            opt = " -fdebug-prefix-map=%s=%s" % (buildsrc, targetsrc)
+            if opt not in opts:
+                opts += opt
 
         for var in ["STAGING_DIR_NATIVE", "STAGING_DIR_HOST"]:
             buildinc = d.getVar(var, True)
-- 
1.9.1


