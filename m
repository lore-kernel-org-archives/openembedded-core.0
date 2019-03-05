Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
	[209.85.166.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5C5636BDDC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 02:45:20 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id p17so5750420iol.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 18:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fupWNOYEKytZwN7n2R591DSCuu2RxyL6YHCp1eybM9o=;
	b=YcAk+ueUByQVPK1AGn97gt20mebVbF2kokuYhhQdqrGOxB7iaLXHt+qbJD3wZrc3qW
	gjYVEDgeslWx5wb3cmK1buGm/2/PhUvnBQlzgflwo1r50wZWRWmNriBVKEEA4/Vxxckr
	PySSYzZjx+dhnPSSZAQO29unHe1CmpqIOo/pXYy3ewNjgduTmaoh/ZdhLSI/ejH7B9QF
	HZDpu59D90TxDR93XB+cOWWnDbepv4yrW1KlyBjCyy9F8DH3n1xF9ddo9f8ibsS1a7Ac
	rjEN/Mi0TJ1bZGgs/buAiULIetL22pAxXpXp+4LQEFET3zWywhTs4K4tsx4+f3g6QiSN
	TOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fupWNOYEKytZwN7n2R591DSCuu2RxyL6YHCp1eybM9o=;
	b=h4IlF7GaDi+WQVNvJ8ZRmDFMFyayzfq/8dGpChu7B+a7FaC/vR31LGTvVmKGAFLUDi
	3yoAaodPHL2X/tTCZ41L7+umLcKcd/DM159Hh0Ll3P/rEo7WoQt1imQ0vpQAgTpzL9St
	YWlTt076vJBmcxJeb+loOBFHxsfNYeh5q2iPq1iLM2ZURSDsKrSJWCrhRH34xdp8CUIo
	h63rNv8lUV8+qowWie/P2rKP6dJBFys3nEuCWuCddrJHrNqDg55sPCPH6/LDLITKxHYx
	VQAUTKB9+/wteCPaeGqLgZUWvyBNoivDky/Cv//WgGpKMx5od729Tlis13lydHx2qiHP
	xvKQ==
X-Gm-Message-State: APjAAAUl0YFdk1T/4Xef9itSBv7Ewa00fAvUk1z0eLpMenDTqc7kMtc8
	lhstwGgxo/IsSO1ZY0PLGfEy0ppo
X-Google-Smtp-Source: APXvYqw4lEOfnUX7ZRHKA+MPMhXhEYlgu26au46gKlTHuQC+jhTGk0RhLkn98sj1z4xbAVuFaTNeyg==
X-Received: by 2002:a6b:39d6:: with SMTP id
	g205mr11635533ioa.286.1551753920904; 
	Mon, 04 Mar 2019 18:45:20 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	u197sm4219621itb.9.2019.03.04.18.45.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Mar 2019 18:45:19 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 20:45:14 -0600
Message-Id: <20190305024514.14753-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] Add source package to ${PACKAGES}
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
X-List-Received-Date: Tue, 05 Mar 2019 02:45:20 -0000
Content-Transfer-Encoding: 8bit

Permanently adds the -src source package to ${PACKAGES} instead of
relying on creating it dynamically at packaging time. The source package
is now defined in bitbake.conf, just like -dev and -dbg packages.

For compatibility, the -src package is still added dynamically if it was
missing, since some recipes have a tendency to completely override
PACKAGES and do so without manually adding back the -src package.

This allows RDEPENDS on the -src packages, which wasn't previously
possible.

[YOCTO #13203]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/package.bbclass | 28 +++++++++++++++-------------
 meta/conf/bitbake.conf       | 12 +++++++++++-
 2 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 749c7d9ea14..4c0a8595363 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1128,7 +1128,7 @@ python populate_packages () {
     workdir = d.getVar('WORKDIR')
     outdir = d.getVar('DEPLOY_DIR')
     dvar = d.getVar('PKGD')
-    packages = d.getVar('PACKAGES')
+    packages = d.getVar('PACKAGES').split()
     pn = d.getVar('PN')
 
     bb.utils.mkdirhier(outdir)
@@ -1138,32 +1138,34 @@ python populate_packages () {
 
     split_source_package = (d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') == 'debug-with-srcpkg')
 
-    # If debug-with-srcpkg mode is enabled then the src package is added
-    # into the package list and the source directory as its main content
+    # If debug-with-srcpkg mode is enabled then add the source package if it
+    # doesn't exist and add the source file contents to the source package.
     if split_source_package:
         src_package_name = ('%s-src' % d.getVar('PN'))
-        packages += (' ' + src_package_name)
+        if not src_package_name in packages:
+            packages.append(src_package_name)
         d.setVar('FILES_%s' % src_package_name, '/usr/src/debug')
 
     # Sanity check PACKAGES for duplicates
     # Sanity should be moved to sanity.bbclass once we have the infrastructure
     package_dict = {}
 
-    for i, pkg in enumerate(packages.split()):
+    for i, pkg in enumerate(packages):
         if pkg in package_dict:
             msg = "%s is listed in PACKAGES multiple times, this leads to packaging errors." % pkg
             package_qa_handle_error("packages-list", msg, d)
-        # If debug-with-srcpkg mode is enabled then the src package will have
-        # priority over dbg package when assigning the files.
-        # This allows src package to include source files and remove them from dbg.
-        elif split_source_package and pkg.endswith("-src"):
+        # Ensure the source package gets the chance to pick up the source files
+        # before the debug package by ordering it first in PACKAGES. Whether it
+        # actually picks up any source files is controlled by
+        # PACKAGE_DEBUG_SPLIT_STYLE.
+        elif pkg.endswith("-src"):
             package_dict[pkg] = (10, i)
         elif autodebug and pkg.endswith("-dbg"):
             package_dict[pkg] = (30, i)
         else:
             package_dict[pkg] = (50, i)
-    package_list = sorted(package_dict.keys(), key=package_dict.get)
-    d.setVar('PACKAGES', ' '.join(package_list))
+    packages = sorted(package_dict.keys(), key=package_dict.get)
+    d.setVar('PACKAGES', ' '.join(packages))
     pkgdest = d.getVar('PKGDEST')
 
     seen = []
@@ -1181,7 +1183,7 @@ python populate_packages () {
             if "/.debug/" in path or path.endswith("/.debug"):
                 debug.append(path)
 
-    for pkg in package_list:
+    for pkg in packages:
         root = os.path.join(pkgdest, pkg)
         bb.utils.mkdirhier(root)
 
@@ -1252,7 +1254,7 @@ python populate_packages () {
 
     # Handle LICENSE_EXCLUSION
     package_list = []
-    for pkg in packages.split():
+    for pkg in packages:
         if d.getVar('LICENSE_EXCLUSION-' + pkg):
             msg = "%s has an incompatible license. Excluding from packaging." % pkg
             package_qa_handle_error("incompatible-license", msg, d)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f1540a0acf7..5a4c4bbde94 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -237,6 +237,10 @@ DESCRIPTION ?= "${SUMMARY}."
 #SUMMARY_${PN} ?= "${SUMMARY}"
 #DESCRIPTION_${PN} ?= "${DESCRIPTION}"
 
+SUMMARY_${PN}-src ?= "${SUMMARY} - Source files"
+DESCRIPTION_${PN}-src ?= "${DESCRIPTION}  \
+This package contains sources for debugging purposes."
+
 SUMMARY_${PN}-dbg ?= "${SUMMARY} - Debugging files"
 DESCRIPTION_${PN}-dbg ?= "${DESCRIPTION}  \
 This package contains ELF symbols and related sources for debugging purposes."
@@ -285,7 +289,7 @@ SOLIBSDEV_darwin = ".dylibbroken"
 PACKAGE_DEBUG_SPLIT_STYLE ?= "debug-with-srcpkg"
 
 PACKAGE_BEFORE_PN ?= ""
-PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
+PACKAGES = "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
 PACKAGES_DYNAMIC = "^${PN}-locale-.*"
 FILES = ""
 
@@ -324,6 +328,12 @@ FILES_${PN}-dbg = "/usr/lib/debug /usr/src/debug"
 SECTION_${PN}-dbg = "devel"
 ALLOW_EMPTY_${PN}-dbg = "1"
 
+# The files list for source packages are dynamically set based on
+# PACKAGE_DEBUG_SPLIT_STYLE
+FILES_${PN}-src = ""
+SECTION_${PN}-src = "devel"
+ALLOW_EMPTY_${PN}-src = "1"
+
 FILES_${PN}-locale = "${datadir}/locale"
 
 # File manifest
-- 
2.20.1


