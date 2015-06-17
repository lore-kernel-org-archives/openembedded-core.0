Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3ADA575662
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 10:25:19 +0000 (UTC)
Received: by iebgx4 with SMTP id gx4so30590247ieb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 03:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VYww/ZJR69QhSEUsjjRXFedf4mK55ZdMxWMel83Q4H4=;
	b=ILak1ppNcN1epQ6Eu2AH1BHYx5rDtJQjWD9qmzuA37pkfroe6e1CQ75/m1a+Nu5ZOO
	fVzSITrvnnqfgzS0/j3zmLNv32gEklXt9DX7ZD0nNyVl8+YhcS6Oerg6HpUuZoMDuZCc
	e2M1c7XqHWHrUfXKxcPUKf0lu6D5o0cECy/Lyal4Q3ES59+Q0sMxllqP1e3dHztMVqIC
	Il9Q2BLj7V3AItchdlDsNwB2xbkS4aeAY/l2x/Ep9tRzgGIDK3D/GgHMwOSUCY3qdDNb
	lEovc/Ff0rlfR+6DFJwM5KD8AVltkDk3EvmA6+k2YZm+rODgtS+LgDKTrE1YILsV58rO
	s+3Q==
X-Gm-Message-State: ALoCoQlcyqNetIVSJ0HZ+AYkIRGr19w4vwkYFhSRQ6PpfBgAs39lEuWHsek4fgiKfAEj2DCIP+na
X-Received: by 10.107.167.73 with SMTP id q70mr6830113ioe.82.1434536720906;
	Wed, 17 Jun 2015 03:25:20 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8C53F.dip0.t-ipconnect.de.
	[93.232.197.63])
	by mx.google.com with ESMTPSA id 191sm2360582iof.18.2015.06.17.03.25.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 Jun 2015 03:25:19 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 12:25:14 +0200
Message-Id: <1434536714-22457-2-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434536714-22457-1-git-send-email-patrick.ohly@intel.com>
References: <1434536714-22457-1-git-send-email-patrick.ohly@intel.com>
Subject: [PATCH] insane.bbclass: add indirect-build-deps QA check
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
X-List-Received-Date: Wed, 17 Jun 2015 10:25:22 -0000

Indirect dependencies occur when a recipe does not declare a depency
on "foo" because it depends on "bar", which in turn depends on
"foo". This happens to work, but is fragile and should better be avoided
by listing "foo" explicitly, because:
* "bar" might not depend on "foo" in all configurations
* future changes to "bar" might remove the dependency on "bar"

The traditional "build-deps" QA check skips indirect dependencies
because they are listed in the task dependencies. Checking for
indirect dependencies remembers that instead of aborting the check and
then later tries to filter out false positives by looking at DEPENDS.

Some common packages which can be assumed to be present are covered by
INDIRECT_BUILD_DEPS_WHITELIST. That list needs to be reviewed and also
take into account the build configuration - glibc is listed there at
the moment, but might not actually be the configured base library.

However, there are at least two false positives left in the current code:
* aliases for recipes via PROVIDES
* unnecessarily linking against libs which are not really used

See the TODOs in the code.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/insane.bbclass | 52 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 45 insertions(+), 7 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 156ae5a..70f110c 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -29,7 +29,7 @@ QA_SANE = "True"
 WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             textrel already-stripped incompatible-license files-invalid \
             installed-vs-shipped compile-host-path install-host-path \
-            pn-overrides infodir build-deps file-rdeps \
+            pn-overrides infodir build-deps indirect-build-deps file-rdeps \
             unknown-configure-option \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
@@ -42,6 +42,8 @@ ALL_QA = "${WARN_QA} ${ERROR_QA}"
 
 UNKNOWN_CONFIGURE_WHITELIST ?= "--enable-nls --disable-nls --disable-silent-rules --disable-dependency-tracking --with-libtool-sysroot"
 
+INDIRECT_BUILD_DEPS_WHITELIST ?= "glibc"
+
 #
 # dictionary for elf headers
 #
@@ -763,6 +765,8 @@ def package_qa_walk(path, warnfuncs, errorfuncs, skip, package, d):
 
     return len(errors) == 0
 
+
+
 def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
     # Don't do this check for kernel/module recipes, there aren't too many debug/development
     # packages and you can get false positives e.g. on kernel-module-lirc-dev
@@ -779,18 +783,37 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
         rdepends = bb.utils.explode_deps(localdata.getVar('RDEPENDS', True) or "")
 
         # Now do the sanity check!!!
-        if "build-deps" not in skip:
+        skip_indirect = "indirect-build-deps" in skip
+        skip_direct = "build-deps" in skip
+        if not skip_direct and not skip_indirect:
+            indirect_whitelist = [] if skip_indirect else set((d.getVar('INDIRECT_BUILD_DEPS_WHITELIST', True) or '').split())
             for rdepend in rdepends:
+                bb.note("DO PACKAGE QA: rdepend %s pkg %s" % (rdepend, pkg))
+
                 if "-dbg" in rdepend and "debug-deps" not in skip:
                     error_msg = "%s rdepends on %s" % (pkg,rdepend)
                     sane = package_qa_handle_error("debug-deps", error_msg, d)
                 if (not "-dev" in pkg and not "-staticdev" in pkg) and rdepend.endswith("-dev") and "dev-deps" not in skip:
                     error_msg = "%s rdepends on %s" % (pkg, rdepend)
                     sane = package_qa_handle_error("dev-deps", error_msg, d)
-                if rdepend not in packages:
+                internaldep = rdepend in packages
+                if not internaldep and not skip_indirect:
+                    # Might be a name provided by some of the packages (example:
+                    # libpam RPROVIDES libpam-suffix, which libpam-runtime RDEPENDS on).
+                    # If we do not check for this, the rdepend will treated like
+                    # an invalid indirect dependency although this is okay.
+                    if rdepend in (d.getVar("PROVIDES", True) or "").split():
+                        internaldep = True
+                    else:
+                        for internalpkg in packages:
+                            if rdepend in (d.getVar("RPROVIDES_%s" % internalpkg, True) or "").split():
+                               internaldep = True
+                               break
+                if not internaldep:
                     rdep_data = oe.packagedata.read_subpkgdata(rdepend, d)
+                    indirect = False
                     if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
-                        continue
+                        indirect = True
                     if not rdep_data or not 'PN' in rdep_data:
                         pkgdata_dir = d.getVar("PKGDATA_DIR", True)
                         try:
@@ -802,9 +825,24 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                             if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
                                 break
                     if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
-                        continue
-                    error_msg = "%s rdepends on %s, but it isn't a build dependency?" % (pkg, rdepend)
-                    sane = package_qa_handle_error("build-deps", error_msg, d)
+                        indirect = True
+                    if indirect:
+                        if skip_indirect or rdepend in indirect_whitelist:
+                            continue
+                        # Need to avoid false positives when the potential indirect dependency is
+                        # in fact listed as a direct dependency. Also need to handle aliases here.
+                        depends = set((d.getVar('DEPENDS', True) or '').split())
+                        if rdepend in depends:
+                            continue
+                        # TODO: check PROVIDES of the rdepend recipe to see whether that is
+                        # listed in DEPENDS.
+                        error_msg = "%s rdepends on %s, but it only an indirect build dependency?" % (pkg, rdepend)
+                        sane = package_qa_handle_error("indirect-build-deps", error_msg, d)
+                    else:
+                        if skip_direct:
+                            continue
+                        error_msg = "%s rdepends on %s, but it isn't a build dependency?" % (pkg, rdepend)
+                        sane = package_qa_handle_error("build-deps", error_msg, d)
 
         if "file-rdeps" not in skip:
             ignored_file_rdeps = set(['/bin/sh', '/usr/bin/env', 'rtld(GNU_HASH)'])
-- 
2.1.4


