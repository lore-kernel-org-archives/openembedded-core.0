Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SFCoR-0005q2-5W
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 01:06:55 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Apr 2012 15:57:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="125036681"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2012 15:57:43 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2012 15:57:42 -0700
Message-Id: <850225ff923b1666bcfd119031eca717a76043f9.1333493785.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <3c9f0f3047f80b6290ea2ceb4fcecdb7b286c1d5.1333493785.git.nitin.a.kamble@intel.com>
References: <3c9f0f3047f80b6290ea2ceb4fcecdb7b286c1d5.1333493785.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1333493785.git.nitin.a.kamble@intel.com>
References: <cover.1333493785.git.nitin.a.kamble@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] eglibc packaging: locale packaging configuration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2012 23:06:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The PACKAGE_NO_GCONV var manipulations ware happening in the
eglibc-options.inc file, and the eglibc-locale recipe do not
see it. Moving that into the libc-package.bbclass which is
common to eglibc & eglibc-locale recipes.

This fixes bug: [YOCTO #2089]

This avoids this error for poky-tiny
NOTE: package eglibc-locale-2.13-r19: task do_populate_sysroot: Started
ERROR: Error executing a python function in
/opt/poky.git/meta/recipes-core/eglibc/eglibc-locale_2.13.bb:
OSError: [Errno 2] No such file or directory:
'/home/rchatre/concordia/dev/ccd-distro-work/tmp/work/core2-poky-linux/eglibc-locale-2.13-r19/package/usr/lib/gconv'

ERROR: The stack trace of python calls that resulted in this exception/failure
was:
ERROR:   File "package_do_split_gconvs", line 264, in <module>
ERROR:·
ERROR:   File "package_do_split_gconvs", line 45, in package_do_split_gconvs
ERROR:·
ERROR:   File "package.bbclass", line 30, in do_split_packages
ERROR:·
ERROR: The code that was being executed was:
ERROR:      0260:»------»-------bb.note("generation of binary locales disabled.
this may break i18n!")
ERROR:      0261:
ERROR:      0262:
ERROR:      0263:
ERROR:  *** 0264:package_do_split_gconvs(d)
ERROR:      0265:
ERROR: (file: 'package_do_split_gconvs', lineno: 264, function: <module>)
ERROR:      0041:»------»-------»-------d.setVar('RPROVIDES_%s' % pkg,
pkg.replace(bpn, 'glibc'))
ERROR:      0042:
ERROR:      0043:»------do_split_packages(d, gconv_libdir,
file_regex='^(.*)\.so$', output_pattern=bpn+'-gconv-%s', \
ERROR:      0044:»------»-------description='gconv module for character set
%s', hook=calc_gconv_deps, \
ERROR:  *** 0045:»------»-------extra_depends=bpn+'-gconv')
ERROR:      0046:
ERROR:      0047:»------def calc_charmap_deps(fn, pkg, file_regex,
output_pattern, group):
ERROR:      0048:»------»-------deps = []
ERROR:      0049:»------»-------f = open(fn, "r")
ERROR: (file: 'package_do_split_gconvs', lineno: 45, function:
package_do_split_gconvs)
ERROR: Function failed: package_do_split_gconvs
ERROR: Logfile of failure stored in:
/home/rchatre/concordia/dev/ccd-distro-work/tmp/work/core2-poky-linux/eglibc-locale-2.13-r19/temp/log.do_package.31042
NOTE: package eglibc-locale-2.13-r19: task do_package: Failed
ERROR: Task 552 (/opt/poky.git/meta/recipes-core/eglibc/eglibc-locale_2.13.bb,
do_package) failed with exit code '1'

Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/classes/libc-package.bbclass           |    8 ++++++++
 meta/recipes-core/eglibc/eglibc-options.inc |    6 ------
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 957243d..7cde770 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -35,6 +35,14 @@ python __anonymous () {
                 d.setVar("DEPENDS", depends)
                 d.setVar("GLIBC_INTERNAL_USE_BINARY_LOCALE", "compile")
                 break
+
+    distro_features = (d.getVar('DISTRO_FEATURES', True) or '').split()
+
+    # try to fix disable charsets/locales/locale-code compile fail
+    if 'libc-charsets' in distro_features and 'libc-locales' in distro_features and 'libc-locale-code' in distro_features:
+        d.setVar('PACKAGE_NO_GCONV', '0')
+    else:
+        d.setVar('PACKAGE_NO_GCONV', '1')
 }
 
 OVERRIDES_append = ":${TARGET_ARCH}-${TARGET_OS}"
diff --git a/meta/recipes-core/eglibc/eglibc-options.inc b/meta/recipes-core/eglibc/eglibc-options.inc
index baf4f4b..bd90ee7 100644
--- a/meta/recipes-core/eglibc/eglibc-options.inc
+++ b/meta/recipes-core/eglibc/eglibc-options.inc
@@ -126,10 +126,4 @@ def features_to_eglibc_settings(d):
         eglibc_cfg('libc-posix-regexp-glibc',      distro_features, 'OPTION_POSIX_REGEXP_GLIBC', cnf)
         eglibc_cfg('libc-posix-wchar-io',      distro_features, 'OPTION_POSIX_WIDE_CHAR_DEVICE_IO', cnf)
 
-        # try to fix disable charsets/locales/locale-code compile fail
-        if 'libc-charsets' in distro_features and 'libc-locales' in distro_features and 'libc-locale-code' in distro_features:
-            d.setVar('PACKAGE_NO_GCONV', '0')
-        else:
-            d.setVar('PACKAGE_NO_GCONV', '1')
-
         return "\n".join(cnf)
-- 
1.7.7.6



