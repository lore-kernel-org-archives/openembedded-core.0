Return-Path: <jurobystricky@hotmail.com>
Received: from BLU004-OMC4S33.hotmail.com (blu004-omc4s33.hotmail.com
	[65.55.111.172])
	by mail.openembedded.org (Postfix) with ESMTP id CA3CD72723
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 01:00:51 +0000 (UTC)
Received: from BLU436-SMTP213 ([65.55.111.135]) by BLU004-OMC4S33.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.22751);
	Wed, 17 Dec 2014 17:00:52 -0800
X-TMN: [9HHRFqkUrJA50IpifyPWQU+lqD6PnBXu]
X-Originating-Email: [jurobystricky@hotmail.com]
Message-ID: <BLU436-SMTP213FED8F1600FDB1927D4CDBB6A0@phx.gbl>
From: Juro Bystricky <jurobystricky@hotmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Dec 2014 17:00:27 -0800
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 18 Dec 2014 01:00:50.0056 (UTC)
	FILETIME=[108B5880:01D01A5E]
MIME-Version: 1.0
Subject: [PATCH] glibc-testing: explicitly specify system headers location for g++
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
X-List-Received-Date: Thu, 18 Dec 2014 01:00:53 -0000
Content-Type: text/plain

The following glibc test programs fail to build when compiled using g++:
  /elf/tst-unique3cc
  /elf/tst-unique4cc
  /elf/tst-unique3lib.cc
  /elf/tst-unique3lib2.cc

The build fails because g++ system include files were not found. g++ is
invoked with -nostdinc option, so location of system include files must
be specified explicitly. glibc configure attempts to determine the
location, but this often fails for a number of reasons.

This patch tries to determine the location of g++ system include headers
just before running the glibc test suite. It queries configparms for
sysroot and the g++ compiler being used for building the test programs.
Then it queries g++ for version and machine information and based on this
information it assumes include headers in corresponding locations.

The header locations are assumed to be:
    <sysroot>/usr/include/c++/<version>
    <sysroot>/usr/include/c++/<version>/<machine>

The header locations are subsequently written out to configparms.

[YOCTO #7081]

Signed-off-by: Juro Bystricky <jurobystricky@hotmail.com>
---
 meta/recipes-core/glibc/glibc-testing.inc | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-testing.inc b/meta/recipes-core/glibc/glibc-testing.inc
index ec16fe1..204c926 100644
--- a/meta/recipes-core/glibc/glibc-testing.inc
+++ b/meta/recipes-core/glibc/glibc-testing.inc
@@ -68,6 +68,25 @@ fi
 
 	fgrep tcbootstrap ${B}/config.make > ${B}/configparms
 	sed -i -e "s/\-tcbootstrap//g" ${B}/configparms
+
+# g++ uses flag -nostdinc, so the locations of system include headers must be explicitly specified.
+# If the locations are not already specified in config.make, then we provide the following locations:
+#    <sysroot>/usr/include/c++/<g++ version>
+#    <sysroot>/usr/include/c++/<g++ version>/<machine>
+
+cxxincludes=\`cat ${B}/config.make | gawk '\$1 == "c++-sysincludes"' | gawk -F"=" '{print \$2}' | sed "s/[ \t]\?//g"\`
+
+if [ -z "\$cxxincludes" ]; then
+  sysroot=\`cat ${B}/configparms | sed -n "/CXX/p" | sed -e "s/^.*--sysroot=//"\`
+  cxx=\`cat ${B}/configparms | gawk '\$1 ~ /^CXX/' | gawk -F"=" '{print \$2}' | gawk '{print \$1}'\`
+  cxxmachine=\`\$cxx -dumpmachine\`
+  cxxversion=\`\$cxx -dumpversion\`
+  if [ -d "\$sysroot/usr/include/c++/\$cxxversion" ] && [ -d "\$sysroot/usr/include/c++/\$cxxversion/\$cxxmachine" ]; then
+    # if the folders exist, pass the new value of c++-sysincludes via configparms
+    echo "c++-sysincludes = -isystem \$sysroot/usr/include/c++/\$cxxversion -isystem \$sysroot/usr/include/c++/\$cxxversion/\$cxxmachine" >> ${B}/configparms
+  fi
+fi
+
 wrapper="${S}/scripts/cross-test-ssh.sh \$target"
 localedef="${STAGING_BINDIR_NATIVE}/cross-localedef --little-endian --uint32-align=4"
 make tests-clean
-- 
1.9.1


