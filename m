Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A59065CC9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Aug 2014 09:06:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7196nLb006461
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Aug 2014 02:06:49 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 1 Aug 2014 02:06:49 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Aug 2014 17:03:37 +0800
Message-ID: <c762a9f3e17b70b51950ea1e81da677a19335288.1406883469.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1406883469.git.Chong.Lu@windriver.com>
References: <cover.1406883469.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3][V2] oelint.bbclass: add patch checking
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
X-List-Received-Date: Fri, 01 Aug 2014 09:06:52 -0000
Content-Type: text/plain

Check that all patches have Signed-off-by and Upstream-Status.

[YOCTO #5427]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/classes/oelint.bbclass | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/meta/classes/oelint.bbclass b/meta/classes/oelint.bbclass
index d14e378..07a7ed9 100644
--- a/meta/classes/oelint.bbclass
+++ b/meta/classes/oelint.bbclass
@@ -29,4 +29,39 @@ python do_lint() {
         bb.warn("%s: SECTION is not set" % pkgname)
     elif not section.islower():
         bb.warn("%s: SECTION should only use lower case" % pkgname)
+
+
+    ##############################
+    # Check that all patches have Signed-off-by and Upstream-Status
+    #
+    srcuri = d.getVar("SRC_URI").split()
+    fpaths = (d.getVar('FILESPATH', True) or '').split(':')
+
+    def findPatch(patchname):
+        for dir in fpaths:
+            patchpath = dir + patchname
+            if os.path.exists(patchpath):
+                 return patchpath
+
+    def findKey(path, key):
+        ret = True
+        f = file('%s' % path, mode = 'r')
+        line = f.readline()
+        while line:
+            if line.find(key) != -1:
+                ret = False
+            line = f.readline()
+        f.close()
+        return ret
+
+    length = len("file://")
+    for item in srcuri:
+        if item.startswith("file://"):
+            item = item[length:]
+            if item.endswith(".patch") or item.endswith(".diff"):
+                path = findPatch(item)
+                if findKey(path, "Signed-off-by"):
+                    bb.warn("%s: %s doesn't have Signed-off-by" % (pkgname, item))
+                if findKey(path, "Upstream-Status"):
+                    bb.warn("%s: %s doesn't have Upstream-Status" % (pkgname, item))
 }
-- 
1.9.1


