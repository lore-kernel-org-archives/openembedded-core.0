Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CEA7771F25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 09:19:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9V9J6pi003349
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 02:19:06 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 31 Oct 2014 02:19:05 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Oct 2014 17:15:45 +0800
Message-ID: <47cb086159d6d6e02522e9d2905f8509395fd96b.1414746903.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1414746902.git.Chong.Lu@windriver.com>
References: <cover.1414746902.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] insane.bbclass: add condition for build-deps
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
X-List-Received-Date: Fri, 31 Oct 2014 09:19:10 -0000
Content-Type: text/plain

Add condition for build-deps, then we can use it in INSANE_SKIP.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/classes/insane.bbclass | 51 +++++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index c6dea22..0b45374 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -771,31 +771,32 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
         rdepends = bb.utils.explode_deps(localdata.getVar('RDEPENDS', True) or "")
 
         # Now do the sanity check!!!
-        for rdepend in rdepends:
-            if "-dbg" in rdepend and "debug-deps" not in skip:
-                error_msg = "%s rdepends on %s" % (pkg,rdepend)
-                sane = package_qa_handle_error("debug-deps", error_msg, d)
-            if (not "-dev" in pkg and not "-staticdev" in pkg) and rdepend.endswith("-dev") and "dev-deps" not in skip:
-                error_msg = "%s rdepends on %s" % (pkg, rdepend)
-                sane = package_qa_handle_error("dev-deps", error_msg, d)
-            if rdepend not in packages:
-                rdep_data = oe.packagedata.read_subpkgdata(rdepend, d)
-                if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
-                    continue
-                if not rdep_data or not 'PN' in rdep_data:
-                    pkgdata_dir = d.getVar("PKGDATA_DIR", True)
-                    try:
-                        possibles = os.listdir("%s/runtime-rprovides/%s/" % (pkgdata_dir, rdepend))
-                    except OSError:
-                        possibles = []
-                    for p in possibles:
-                        rdep_data = oe.packagedata.read_subpkgdata(p, d)
-                        if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
-                            break
-                if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
-                    continue
-                error_msg = "%s rdepends on %s, but it isn't a build dependency?" % (pkg, rdepend)
-                sane = package_qa_handle_error("build-deps", error_msg, d)
+        if "build-deps" not in skip:
+            for rdepend in rdepends:
+                if "-dbg" in rdepend and "debug-deps" not in skip:
+                    error_msg = "%s rdepends on %s" % (pkg,rdepend)
+                    sane = package_qa_handle_error("debug-deps", error_msg, d)
+                if (not "-dev" in pkg and not "-staticdev" in pkg) and rdepend.endswith("-dev") and "dev-deps" not in skip:
+                    error_msg = "%s rdepends on %s" % (pkg, rdepend)
+                    sane = package_qa_handle_error("dev-deps", error_msg, d)
+                if rdepend not in packages:
+                    rdep_data = oe.packagedata.read_subpkgdata(rdepend, d)
+                    if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
+                        continue
+                    if not rdep_data or not 'PN' in rdep_data:
+                        pkgdata_dir = d.getVar("PKGDATA_DIR", True)
+                        try:
+                            possibles = os.listdir("%s/runtime-rprovides/%s/" % (pkgdata_dir, rdepend))
+                        except OSError:
+                            possibles = []
+                        for p in possibles:
+                            rdep_data = oe.packagedata.read_subpkgdata(p, d)
+                            if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
+                                break
+                    if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
+                        continue
+                    error_msg = "%s rdepends on %s, but it isn't a build dependency?" % (pkg, rdepend)
+                    sane = package_qa_handle_error("build-deps", error_msg, d)
 
         if "file-rdeps" not in skip:
             ignored_file_rdeps = set(['/bin/sh', '/usr/bin/env', 'rtld(GNU_HASH)'])
-- 
1.9.1


