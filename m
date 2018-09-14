Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C2337799AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 08:39:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8E8dsNi005302
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 14 Sep 2018 01:39:54 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 14 Sep 2018 01:39:54 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Sep 2018 16:49:40 +0800
Message-ID: <2338c0944b1fb35ffd6a6f04fde1616f5753f0bb.1536913629.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1536913629.git.hongxu.jia@windriver.com>
References: <cover.1536913629.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] package.bbclass: improve auto debug package splitting order
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
X-List-Received-Date: Fri, 14 Sep 2018 08:39:55 -0000
Content-Type: text/plain

Since `da5ec06 package: Add auto package splitting
of .debug files' applied in oe-core, the first dbg
package will have all debug files automatically.

If there are several sub dbg packages, except the
first one, the others are empty.

Even though var-NOAUTOPACKAGEDEBUG is provided for manual
control, but many recipes (such as in oe) requires to
pick up a few debug files into sub dbg packages, and then
split the rest to ${PN}-dbg. If set NOAUTOPACKAGEDEBUG = "1",
they have to do the extra splitting manually.

So improve splitting order, if ${PN}-dbg exists, split
the unsplit debug file to ${PN}-dbg, if ${PN}-dbg does not
exist, still split them to first dbg package.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/package.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index d1e9138..cada46b 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1175,6 +1175,14 @@ python populate_packages () {
             if "/.debug/" in path or path.endswith("/.debug"):
                 debug.append(path)
 
+    pn_dbg = pn + "-dbg"
+    # If ${PN}-dbg does not exist, use first *-dbg to replace
+    if pn_dbg not in package_list:
+        for pkg in package_list:
+            if pkg.endswith("-dbg"):
+                pn_dbg = pkg
+                break
+
     for pkg in package_list:
         root = os.path.join(pkgdest, pkg)
         bb.utils.mkdirhier(root)
@@ -1188,7 +1196,7 @@ python populate_packages () {
         origfiles = filesvar.split()
         files, symlink_paths = files_from_filevars(origfiles)
 
-        if autodebug and pkg.endswith("-dbg"):
+        if autodebug and pn_dbg == pkg:
             files.extend(debug)
 
         for file in files:
-- 
2.7.4


