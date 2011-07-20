Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QjdnC-0002lF-KW
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 22:54:55 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6KKolMg030522
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:50:47 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 13:50:45 -0700
Message-Id: <7add784e793424e835ea062df57713257e42481b.1311191810.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311191810.git.tom_rini@mentor.com>
References: <cover.1311191810.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311191810.git.tom_rini@mentor.com>
References: <cover.1311191810.git.tom_rini@mentor.com>
Subject: [PATCH v2 1/1] siteinfo.bbclass: Port over oe.dev logic for site files
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
X-List-Received-Date: Wed, 20 Jul 2011 20:54:55 -0000

In oe.dev we have a sets to pick out hostos/hostarch/etc site
files out of and include things like a common-linux site file.
This should also help out with adding multilib-specific site files
(ie x32).  In oe.dev we have an iterator but at Richard's request
we continue to return a list of files in siteinfo_get_files().

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/classes/siteinfo.bbclass |  203 ++++++++++++++++++++---------------------
 1 files changed, 98 insertions(+), 105 deletions(-)
 create mode 100644 meta/site/common-linux

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 78b7008..ff9fd0d 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -15,121 +15,114 @@
 # It is an error for the target not to exist.
 # If 'what' doesn't exist then an empty value is returned
 #
-def get_siteinfo_list(d):
-       target = bb.data.getVar('HOST_ARCH', d, 1) + "-" + bb.data.getVar('HOST_OS', d, 1)
+def siteinfo_data(d):
+    archinfo = {
+        "allarch": "endian-little bit-32", # bogus, but better than special-casing the checks below for allarch
+        "arm": "endian-little bit-32 arm-common",
+        "armeb": "endian-big bit-32 arm-common",
+        "avr32": "endian-big bit-32 avr32-common",
+        "bfin": "endian-little bit-32 bfin-common",
+        "i386": "endian-little bit-32 ix86-common",
+        "i486": "endian-little bit-32 ix86-common",
+        "i586": "endian-little bit-32 ix86-common",
+        "i686": "endian-little bit-32 ix86-common",
+        "ia64": "endian-little bit-64",
+        "microblaze": "endian-big bit-32 microblaze-common",
+        "microblazeel": "endian-little bit-32 microblaze-common",
+        "mips": "endian-big bit-32 mips-common",
+        "mips64": "endian-big bit-64 mips64-common",
+        "mips64el": "endian-little bit-64 mips64-common",
+        "mipsel": "endian-little bit-32 mips-common",
+        "powerpc": "endian-big bit-32 powerpc-common",
+        "nios2": "endian-little bit-32 nios2-common",
+        "powerpc64": "endian-big bit-64 powerpc-common powerpc64-linux",
+        "ppc": "endian-big bit-32 powerpc-common",
+        "ppc64": "endian-big bit-64 powerpc-common powerpc64-linux",
+        "sh3": "endian-little bit-32 sh-common",
+        "sh4": "endian-little bit-32 sh-common",
+        "sparc": "endian-big bit-32",
+        "viac3": "endian-little bit-32 ix86-common",
+        "x86_64": "endian-little bit-64",
+    }
+    osinfo = {
+        "darwin": "common-darwin",
+        "darwin9": "common-darwin",
+        "linux": "common-linux common-glibc",
+        "linux-gnueabi": "common-linux common-glibc",
+        "linux-gnuspe": "common-linux common-glibc",
+        "linux-uclibc": "common-linux common-uclibc",
+        "linux-uclibceabi": "common-linux common-uclibc",
+        "linux-uclibcspe": "common-linux common-uclibc",
+        "uclinux-uclibc": "common-uclibc",
+        "cygwin": "common-cygwin",
+        "mingw32": "common-mingw",
+    }
+    targetinfo = {
+        "arm-linux-gnueabi": "arm-linux",
+        "arm-linux-uclibceabi": "arm-linux-uclibc",
+        "armeb-linux-gnueabi": "armeb-linux",
+        "armeb-linux-uclibceabi": "armeb-linux-uclibc",
+        "powerpc-linux-gnuspe": "powerpc-linux",
+        "powerpc-linux-uclibcspe": "powerpc-linux-uclibc",
+    }
 
-       targetinfo = {\
-               "allarch-linux":           "",\
-               "armeb-linux":             "endian-big bit-32 common-glibc arm-common",\
-               "armeb-linux-gnueabi":     "endian-big bit-32 common-glibc arm-common armeb-linux",\
-               "armeb-linux-uclibc":      "endian-big bit-32 common-uclibc arm-common",\
-               "armeb-linux-uclibceabi": "endian-big bit-32 common-uclibc arm-common armeb-linux-uclibc",\
-               "arm-darwin":              "endian-little bit-32 common-darwin",\
-               "arm-darwin8":              "endian-little bit-32 common-darwin",\
-               "arm-linux":               "endian-little bit-32 common-glibc arm-common",\
-               "arm-linux-gnueabi":       "endian-little bit-32 common-glibc arm-common arm-linux",\
-               "arm-linux-uclibc":        "endian-little bit-32 common-uclibc arm-common",\
-               "arm-linux-uclibceabi": "endian-little bit-32 common-uclibc arm-common arm-linux-uclibc",\
-               "avr32-linux":             "endian-big bit-32 common-glibc avr32-common",\ 
-               "avr32-linux-uclibc":      "endian-big bit-32 common-uclibc avr32-common",\
-               "bfin-uclinux-uclibc":       "endian-little bit-32 common-uclibc bfin-common",\
-               "i386-linux":              "endian-little bit-32 common-glibc ix86-common",\
-               "i486-linux":              "endian-little bit-32 common-glibc ix86-common",\
-               "i586-linux":              "endian-little bit-32 common-glibc ix86-common",\
-               "i686-linux":              "endian-little bit-32 common-glibc ix86-common",\
-               "i386-linux-uclibc":       "endian-little bit-32 common-uclibc ix86-common",\
-               "i486-linux-uclibc":       "endian-little bit-32 common-uclibc ix86-common",\
-               "i586-linux-uclibc":       "endian-little bit-32 common-uclibc ix86-common",\
-               "i686-linux-uclibc":       "endian-little bit-32 common-uclibc ix86-common",\
-               "microblaze-linux-gnu":    "endian-big bit-32 common-glibc microblaze-common",\
-               "microblazeel-linux-gnu":  "endian-little bit-32 common-glibc microblaze-common",\
-               "mipsel-linux":            "endian-little bit-32 common-glibc mips-common",\
-               "mipsel-linux-uclibc":     "endian-little bit-32 common-uclibc mips-common",\
-               "mips-linux":              "endian-big bit-32 common-glibc mips-common",\
-               "mips-linux-uclibc":       "endian-big bit-32 common-uclibc mips-common",\
-               "powerpc-darwin":          "endian-big bit-32 common-darwin",\
-               "ppc-linux":               "endian-big bit-32 common-glibc powerpc-common",\ 
-	       "powerpc-linux":           "endian-big bit-32 common-glibc powerpc-common",\
-               "powerpc-linux-gnuspe":    "endian-big bit-32 common-glibc powerpc-common",\
-               "powerpc-linux-uclibc":    "endian-big bit-32 common-uclibc powerpc-common",\
-               "sh3-linux":               "endian-little bit-32 common-glibc sh-common",\
-               "sh4-linux":               "endian-little bit-32 common-glibc sh-common",\
-               "sh4-linux-uclibc":        "endian-little bit-32 common-uclibc sh-common",\
-               "sparc-linux":             "endian-big bit-32 common-glibc",\
-               "x86_64-linux":            "endian-little bit-64 common-glibc",\
-               "x86_64-linux-uclibc":     "endian-little bit-64 common-uclibc"}
-       if target in targetinfo:
-               info = targetinfo[target].split()
-               info.append(target)
-               info.append("common")
-               return info
-       else:
-               bb.error("Information not available for target '%s'" % target)
+    hostarch = d.getVar("HOST_ARCH", True)
+    hostos = d.getVar("HOST_OS", True)
+    target = "%s-%s" % (hostarch, hostos)
 
+    sitedata = []
+    if hostarch in archinfo:
+        sitedata.extend(archinfo[hostarch].split())
+    if hostos in osinfo:
+        sitedata.extend(osinfo[hostos].split())
+    if target in targetinfo:
+        sitedata.extend(targetinfo[target].split())
+    sitedata.append(target)
+    sitedata.append("common")
 
-#
-# Define which site files to use. We check for several site files and
-# use each one that is found, based on the list returned by get_siteinfo_list()
-#
-# Search for the files in the following directories:
-# 1) ${BBPATH}/site (in reverse) - app specific, then site wide
-# 2) ${FILE_DIRNAME}/site-${PV}         - app version specific
-#
-def siteinfo_get_files(d):
-       sitefiles = ""
+    bb.debug(1, "SITE files %s" % sitedata);
+    return sitedata
 
-       # Determine which site files to look for
-       sites = get_siteinfo_list(d)
+python () {
+    sitedata = set(siteinfo_data(d))
+    if "endian-little" in sitedata:
+        d.setVar("SITEINFO_ENDIANESS", "le")
+    elif "endian-big" in sitedata:
+        d.setVar("SITEINFO_ENDIANESS", "be")
+    else:
+        bb.error("Unable to determine endianness for architecture '%s'" %
+                 d.getVar("HOST_ARCH", True))
+        bb.fatal("Please add your architecture to siteinfo.bbclass")
 
-       # Check along bbpath for site files and append in reverse order so
-       # the application specific sites files are last and system site
-       # files first.
-       path_bb = bb.data.getVar('BBPATH', d, 1)
-       for p in (path_bb or "").split(':'):
-               tmp = ""
-               for i in sites:
-                       fname = os.path.join(p, 'site', i)
-                       if os.path.exists(fname):
-                               tmp += fname + " "
-               sitefiles = tmp + sitefiles;
+    if "bit-32" in sitedata:
+        d.setVar("SITEINFO_BITS", "32")
+    elif "bit-64" in sitedata:
+        d.setVar("SITEINFO_BITS", "64")
+    else:
+        bb.error("Unable to determine bit size for architecture '%s'" %
+                 d.getVar("HOST_ARCH", True))
+        bb.fatal("Please add your architecture to siteinfo.bbclass")
+}
 
-       # Now check for the applications version specific site files
-       path_pkgv = os.path.join(bb.data.getVar('FILE_DIRNAME', d, 1), "site-" + bb.data.getVar('PV', d, 1))
-       for i in sites:
-               fname = os.path.join(path_pkgv, i)
-               if os.path.exists(fname):
-                       sitefiles += fname + " "
-
-       # Now check for siteconfig cache files
-       path_siteconfig = bb.data.getVar('SITECONFIG_SYSROOTCACHE', d, 1)
-       if os.path.isdir(path_siteconfig):
-               for i in os.listdir(path_siteconfig):
-                       fname = os.path.join(path_siteconfig, i)
-                       sitefiles += fname + " "
-
-       bb.debug(1, "SITE files " + sitefiles);
-       return sitefiles
+def siteinfo_get_files(d):
+    sitedata = siteinfo_data(d)
+    sitefiles = ""
+    for path in d.getVar("BBPATH", True).split(":"):
+        for element in sitedata:
+            filename = os.path.join(path, "site", element)
+            if os.path.exists(filename):
+                sitefiles += filename + " "
 
-def siteinfo_get_endianess(d):
-       info = get_siteinfo_list(d)
-       if 'endian-little' in info:
-              return "le"
-       elif 'endian-big' in info:
-              return "be"
-       bb.error("Site info could not determine endianess for target")
+    # Now check for siteconfig cache files
+    path_siteconfig = bb.data.getVar('SITECONFIG_SYSROOTCACHE', d, 1)
+    if os.path.isdir(path_siteconfig):
+        for i in os.listdir(path_siteconfig):
+            filename = os.path.join(path_siteconfig, i)
+            sitefiles += filename + " "
 
-def siteinfo_get_bits(d):
-       info = get_siteinfo_list(d)
-       if 'bit-32' in info:
-              return "32"
-       elif 'bit-64' in info:
-              return "64"
-       bb.error("Site info could not determine bit size for target")
+    return sitefiles
 
 #
 # Make some information available via variables
 #
-SITEINFO_ENDIANESS  = "${@siteinfo_get_endianess(d)}"
-SITEINFO_BITS       = "${@siteinfo_get_bits(d)}"
 SITECONFIG_SYSROOTCACHE = "${STAGING_DATADIR}/${TARGET_SYS}_config_site.d"
-
diff --git a/meta/site/common-linux b/meta/site/common-linux
new file mode 100644
index 0000000..e69de29
-- 
1.7.0.4



