Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D6E5D70D44
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 11:08:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7FB8AK4006491
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 04:08:10 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 15 Aug 2014 04:08:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Aug 2014 04:08:10 -0700
Message-ID: <56a48d85ff4607f8998498d981edd2b0c749c83b.1408100754.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408100754.git.liezhi.yang@windriver.com>
References: <cover.1408100754.git.liezhi.yang@windriver.com>
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
X-List-Received-Date: Fri, 15 Aug 2014 11:08:12 -0000
Content-Type: text/plain

The ipk or deb can't depend on file such as "/bin/bash" or
"/usr/bin/perl", so it knows nothing about the pkg depends bash or perl,
thus there would be dependencies problems when we run "apt-get
install/remove <pkg>" on the target, this check can help us find the
issues and then fix them manually.

* Benefits:
  - Help to fix file rdepends issues for ipk and deb
  - Help to fix abnormal rdepends.
  - Help to check whether the rdepends is OK or not after build each
    recipe (don't have to install to the image), for example, a recipe may
    generate 10 binary packages, only a part of them will be installed to
    the image by default, we can know whether the rdepends are OK or
    not for the ones which are installed, but can't know the ones which
    are not installed, this patch can help check all the 10 binary
    packages' rdepends.

* Basic designs:
  - Get all the rdeps on the chain (e.g., A -> B -> C)

  - Get the pkg's FILERDEPENDS by oe.packagedata.read_subpkgdata()
    and save to set filerdepends.

  - Get each rdeps' FILERPROVIDES, RPROVIDES and FILES_INFO(the file
    list), and save to set rdep_rprovides.

  - Do the set "filerdepends -= rdep_rprovides" and QA issue if
    filerdepends is not null.

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass |   72 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 3dd2e7f..c6dea22 100644
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
@@ -797,6 +797,76 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                 error_msg = "%s rdepends on %s, but it isn't a build dependency?" % (pkg, rdepend)
                 sane = package_qa_handle_error("build-deps", error_msg, d)
 
+        if "file-rdeps" not in skip:
+            ignored_file_rdeps = set(['/bin/sh', '/usr/bin/env', 'rtld(GNU_HASH)'])
+            if bb.data.inherits_class('nativesdk', d):
+                ignored_file_rdeps |= set(['/bin/bash', '/usr/bin/perl'])
+            # For Saving the FILERDEPENDS
+            filerdepends = set()
+            rdep_data = oe.packagedata.read_subpkgdata(pkg, d)
+            for key in rdep_data:
+                if key.startswith("FILERDEPENDS_"):
+                    for subkey in rdep_data[key].split():
+                        filerdepends.add(subkey)
+            filerdepends -= ignored_file_rdeps
+
+            if filerdepends:
+                next = rdepends
+                done = rdepends[:]
+                # Find all the rdepends on the dependency chain
+                while next:
+                    new = []
+                    for rdep in next:
+                        rdep_data = oe.packagedata.read_subpkgdata(rdep, d)
+                        sub_rdeps = rdep_data.get("RDEPENDS_" + rdep)
+                        if not sub_rdeps:
+                            continue
+                        for sub_rdep in sub_rdeps.split():
+                            if sub_rdep in done:
+                                continue
+                            if not sub_rdep.startswith('(') and \
+                                    oe.packagedata.has_subpkgdata(sub_rdep, d):
+                                # It's a new rdep
+                                done.append(sub_rdep)
+                                new.append(sub_rdep)
+                    next = new
+
+                # Add the rprovides of itself
+                if pkg not in done:
+                    done.insert(0, pkg)
+
+                # The python is not a package, but python-core provides it, so
+                # skip checking /usr/bin/python if python is in the rdeps, in
+                # case there is a RDEPENDS_pkg = "python" in the recipe.
+                for py in [ d.getVar('MLPREFIX', True) + "python", "python" ]:
+                    if py in done:
+                        filerdepends.discard("/usr/bin/python")
+                        done.remove(py)
+                for rdep in done:
+                    # For Saving the FILERPROVIDES, RPROVIDES and FILES_INFO
+                    rdep_rprovides = set()
+                    rdep_data = oe.packagedata.read_subpkgdata(rdep, d)
+                    for key in rdep_data:
+                        if key.startswith("FILERPROVIDES_") or key.startswith("RPROVIDES_"):
+                            for subkey in rdep_data[key].split():
+                                rdep_rprovides.add(subkey)
+                        # Add the files list to the rprovides
+                        if key == "FILES_INFO":
+                            # Use eval() to make it as a dict
+                            for subkey in eval(rdep_data[key]):
+                                rdep_rprovides.add(subkey)
+                    filerdepends -= rdep_rprovides
+                    if not filerdepends:
+                        # Break if all the file rdepends are met
+                        break
+                    else:
+                        # Clear it for the next loop
+                        rdep_rprovides.clear()
+            if filerdepends:
+                error_msg = "%s requires %s, but no providers in its RDEPENDS" % \
+                            (pkg, ', '.join(str(e) for e in filerdepends))
+                sane = package_qa_handle_error("file-rdeps", error_msg, d)
+
     return sane
 
 def package_qa_check_deps(pkg, pkgdest, skip, d):
-- 
1.7.9.5


