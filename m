Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 30D13617B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 14:09:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7BE9VPN019447
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 07:09:31 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 11 Aug 2014 07:09:30 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Aug 2014 07:09:30 -0700
Message-ID: <cb2d7bb810ded71a9440337d2a46097d45e6c0cf.1407766043.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1407766043.git.liezhi.yang@windriver.com>
References: <cover.1407766043.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] insane.bbclass: add QA check: file-rdeps
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
X-List-Received-Date: Mon, 11 Aug 2014 14:09:30 -0000
Content-Type: text/plain

The ipk or deb can't depend on file such as "/bin/bash" or
"/usr/bin/perl", so it knows nothing about the pkg depends bash or perl,
thus there would be dependencies problems when we run "apt-get
install/remove <pkg>" on the target, this check can help us find the
issues and then fix them manually.

* Basic designs:
  - Get the pkg's FILERPROVIDES from oe.packagedata.read_subpkgdata()
    and save to set filerdepends.

  - Get the each RPDEPENDS' FILERPROVIDES, RPROVIDES and
    FILERPROVIDESFLIST, and save to set rdep_rprovides.

  - Do the set "filerdepends -= rdep_rprovides" and QA Issue if
    filerdepends is not null.

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass |   37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 3dd2e7f..f2e9626 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -29,7 +29,7 @@ QA_SANE = "True"
 WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             textrel already-stripped incompatible-license files-invalid \
             installed-vs-shipped compile-host-path install-host-path \
-            pn-overrides infodir build-deps \
+            pn-overrides infodir build-deps file-rdeps \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -797,6 +797,41 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                 error_msg = "%s rdepends on %s, but it isn't a build dependency?" % (pkg, rdepend)
                 sane = package_qa_handle_error("build-deps", error_msg, d)
 
+        if "file-rdeps" not in skip:
+            ignored_file_rdeps = set(['/bin/sh', '/usr/bin/env'])
+            # For Saving the FILERDEPENDS
+            filerdepends = set()
+            rdep_data = oe.packagedata.read_subpkgdata(pkg, d)
+            for key in rdep_data:
+                if key.startswith("FILERDEPENDS_"):
+                    for subkey in rdep_data[key].split():
+                        filerdepends.add(subkey)
+            filerdepends -= ignored_file_rdeps
+            if filerdepends:
+                # Check the rprovides of itself
+                if pkg not in rdepends:
+                    rdepends.insert(0, pkg)
+                for rdepend in rdepends:
+                    # For Saving the FILERPROVIDES and RPROVIDES
+                    rdep_rprovides = set()
+                    rdep_data = oe.packagedata.read_subpkgdata(rdepend, d)
+                    for key in rdep_data:
+                        if key.startswith("FILERPROVIDES_") or key.startswith("RPROVIDES_") \
+                                or key.startswith("FILERPROVIDESFLIST_"):
+                            for subkey in rdep_data[key].split():
+                                rdep_rprovides.add(subkey)
+                    filerdepends -= rdep_rprovides
+                    if not filerdepends:
+                            # Break if all the file rdepends are met.
+                            break
+                    else:
+                            # Clear it for the next loop
+                            rdep_rprovides.clear()
+            if filerdepends:
+                error_msg = "%s requires %s, but no providers in its RDEPENDS" % \
+                            (pkg, ', '.join(str(e) for e in filerdepends))
+                sane = package_qa_handle_error("file-rdeps", error_msg, d)
+
     return sane
 
 def package_qa_check_deps(pkg, pkgdest, skip, d):
-- 
1.7.9.5


