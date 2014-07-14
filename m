Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B2C48703E0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 19:07:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6EJ7IlF002309
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 12:07:18 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 14 Jul 2014 12:07:17 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Jul 2014 14:12:29 -0500
Message-ID: <6c0f987e41f866f61c54d626f2248111122e831d.1405365020.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1405365020.git.peter.seebach@windriver.com>
References: <cover.1405365020.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pseudo_1.6.0.bb: uprev to pseudo 1.6
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
X-List-Received-Date: Mon, 14 Jul 2014 19:07:19 -0000
Content-Type: text/plain

This uprevs pseudo to 1.6. This merges in all of the existing
fixes, and also adds partial support for extended attributes,
including storing arbitrary extended attributes in the database,
and also interpreting the posix permissions ACLs as chmod
requests.

The extended attribute support means we need xattr.h, the simplest
way to be sure of this is to build attr before pseudo, which doesn't
take long.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/recipes-devtools/pseudo/pseudo.inc      |    6 +-----
 meta/recipes-devtools/pseudo/pseudo_1.5.1.bb |    4 ++++
 meta/recipes-devtools/pseudo/pseudo_1.6.0.bb |   10 ++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb   |    4 ++--
 4 files changed, 17 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.6.0.bb

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 42738ab..11a8514 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -7,11 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/pseudo"
 LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
 SECTION = "base"
 LICENSE = "LGPL2.1"
-DEPENDS = "sqlite3"
-
-SRC_URI_append_class-nativesdk = " file://symver.patch"
-
-SRC_URI_append_class-native = " file://symver.patch"
+DEPENDS = "sqlite3 attr"
 
 FILES_${PN} = "${prefix}/lib/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/pseudo ${prefix}/var/pseudo"
 FILES_${PN}-dbg += "${prefix}/lib/pseudo/lib*/.debug"
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
index 47291fd..8d562ec 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
@@ -10,6 +10,10 @@ SRC_URI = " \
     file://pseudo-fchmodat-permissions.patch \
 "
 
+SRC_URI_append_class-nativesdk = " file://symver.patch"
+
+SRC_URI_append_class-native = " file://symver.patch"
+
 SRC_URI[md5sum] = "5ec67c7bff5fe68c56de500859c19172"
 SRC_URI[sha256sum] = "3b896f592f4d568569bd02323fad2d6b8c398e16ca36ee5a8947d2ff6c1d3d52"
 
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.6.0.bb b/meta/recipes-devtools/pseudo/pseudo_1.6.0.bb
new file mode 100644
index 0000000..e92c4d7
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/pseudo_1.6.0.bb
@@ -0,0 +1,10 @@
+require pseudo.inc
+
+SRC_URI = " \
+    http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
+"
+
+SRC_URI[md5sum] = "78c3f8aa8efe8cf15a2b21261174e3b6"
+SRC_URI[sha256sum] = "e24f526443b31c3292ec5ba04950d230b5388e8983c7e192e9e489c007f3dba3"
+
+PSEUDO_EXTRA_OPTS ?= "--enable-force-async"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 66fc85f..ef258fa 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,7 +1,7 @@
 require pseudo.inc
 
-SRCREV = "b9eb2b5633b5a23efe72c950494728d93c2b5823"
-PV = "1.5.1+git${SRCPV}"
+SRCREV = "512b84fb539c970464a93107995edf0e775d13fa"
+PV = "1.6.0+git${SRCPV}"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.1


