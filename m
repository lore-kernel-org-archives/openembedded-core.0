Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ADC3160721
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 05:02:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6R529lO023330
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 22:02:09 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 26 Jul 2016 22:02:08 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2016 01:02:03 -0400
Message-ID: <63d457eb9aeb264ae65e31c1e78f8024609a38c3.1469595557.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1469595557.git.dengke.du@windriver.com>
References: <cover.1469595557.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] perf: enable man pages for 'help' functionality
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
X-List-Received-Date: Wed, 27 Jul 2016 05:02:19 -0000
Content-Type: text/plain

When using 'perf help <subcommand>', it can't find 'man' command and pages for
perf.
The perf man pages depends on the xmlto-native and asciidoc-native, so we just
need to add the two packages to the DEPENDS variable and add 'man'to
RDEPENDS_perf-doc.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 171d23f..1e84a22 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -30,6 +30,8 @@ DEPENDS = " \
     ${SCRIPTING_DEPENDS} \
     ${LIBUNWIND_DEPENDS} \
     bison flex xz \
+    xmlto-native \
+    asciidoc-native \
 "
 
 do_configure[depends] += "virtual/kernel:do_shared_workdir"
@@ -90,7 +92,6 @@ EXTRA_OEMAKE += "\
     'sharedir=${datadir}' \
     'sysconfdir=${sysconfdir}' \
     'perfexecdir=${libexecdir}/perf-core' \
-    \
     'ETC_PERFCONFIG=${@os.path.relpath(sysconfdir, prefix)}' \
     'sharedir=${@os.path.relpath(datadir, prefix)}' \
     'mandir=${@os.path.relpath(mandir, prefix)}' \
@@ -138,6 +139,13 @@ do_configure_prepend () {
                -e 's,\ .config-detected, $(OUTPUT)/config-detected,g' \
             ${S}/tools/perf/config/Makefile
     fi
+    # The man pages installation is "$(INSTALL) -d -m 755 $(DESTDIR)$(man1dir)"
+    # in ${S}/tools/perf/Documentation/Makefile, if the mandir set to '?=', it
+    # will use the relative path 'share/man', in the way it will resulting in
+    # incorrect installation for man pages.
+    if [ -e "${S}/tools/perf/Documentation/Makefile" ]; then
+	sed -i 's,^mandir?=,mandir:=,' ${S}/tools/perf/Documentation/Makefile
+    fi
     if [ -e "${S}/tools/perf/Makefile.perf" ]; then
         sed -i -e 's,\ .config-detected, $(OUTPUT)/config-detected,g' \
             ${S}/tools/perf/Makefile.perf
@@ -197,6 +205,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
 
 RDEPENDS_${PN} += "elfutils bash"
+RDEPENDS_${PN}-doc += "man"
 RDEPENDS_${PN}-archive =+ "bash"
 RDEPENDS_${PN}-python =+ "bash python python-modules"
 RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
-- 
2.8.1


