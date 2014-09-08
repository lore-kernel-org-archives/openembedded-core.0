Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 461D9712EC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:58:55 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id u57so2188036wes.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:58:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=4iBhGhbHdZncg6kJb6yeSj+UbZox4jyCjLkJPS1ZuEc=;
	b=K0ZU8wckJtl0XB7SR0IxiDksG6ZGY1gfcBJCJYGRROQ9V+/RRXhG4Yw9Gyako0i69j
	Db/6G+5z4ukq4JJWYe1S11woAeJrs4oeqz24RL4+i+d0aGM7IewgWPqQ7Cg2SWbHgrty
	cMCPHArphxtz8VZCoK/eHgFC6B/kuUEgcVzge7GGXVZ+t1RZ/yDtcX/WEMYtCxX87MmR
	Cd88IVreVoDDE6VTSElqshOODnjYAsMvtTUEScrBVLr5JfnHuhLwV89oMfSAv7nzk80R
	A7GsvzpcEJbX1eHN739XYUIfhG2HqwjG1eDS9C/0dhvcNimXy8hiLxp8g4SGf1j5tmdn
	uEKw==
X-Gm-Message-State: ALoCoQm+IWERXLCyd0ht6Fx8BemGVsJdcH8AFuQ6pXin9Z9UMf1vEFZBLn2BB0H//9xCA5D33O6T
X-Received: by 10.180.19.233 with SMTP id i9mr2439064wie.17.1410177536666;
	Mon, 08 Sep 2014 04:58:56 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.58.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:58:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:21 +0100
Message-Id: <26ec8cb462e60c7426b4d8faa86f1bf2b04905d3.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
Subject: [PATCH 03/27] insane.bbclass: add QA check: file-rdeps
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
X-List-Received-Date: Mon, 08 Sep 2014 11:58:57 -0000

From: Robert Yang <liezhi.yang@windriver.com>

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
  - Get all the RDEPENDS on the chain.

  - Get the pkg's FILERPROVIDES from oe.packagedata.read_subpkgdata()
    and save to set filerdepends.

  - Get each RPDEPENDS' FILERPROVIDES, RPROVIDES and FILERPROVIDESFLIST,
    and save to set rdep_rprovides.

  - Do the set "filerdepends -= rdep_rprovides" and QA issue if
    filerdepends is not null.

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
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
1.7.10.4


