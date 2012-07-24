Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1StUBH-0004RU-8R
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 03:44:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6O1XUxH023379
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 18:33:30 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.163) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 23 Jul 2012 18:33:29 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jul 2012 09:33:29 +0800
Message-ID: <1343093609-11810-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH] insserv: define do_install_virtclass-native()
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
X-List-Received-Date: Tue, 24 Jul 2012 01:44:59 -0000
Content-Type: text/plain

From: Roy.Li <rongqing.li@windriver.com>

[YOCTO #2812]

Since files installation dirs are DESTDIR/etc/, DESTDIR/sbin etc
in Makefile, not DESTDIR/${sysconfdir}/, DESTDIR/${sbindir}/, for
the native package, a prefix can not be inserted which is needed
when do the next step of install and do_populate_sysroot.

Now we define do_install_virtclass-native in which DESTDIR is
${D}/${STAGING_DIR_NATIVE}

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-devtools/insserv/insserv_1.14.0.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/insserv/insserv_1.14.0.bb b/meta/recipes-devtools/insserv/insserv_1.14.0.bb
index b3ddec3..c424a15 100644
--- a/meta/recipes-devtools/insserv/insserv_1.14.0.bb
+++ b/meta/recipes-devtools/insserv/insserv_1.14.0.bb
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "ftp://ftp.suse.com/pub/projects/init/${BPN}-${PV}.tar.bz2 \
            file://makefile.patch \
@@ -21,4 +21,9 @@ do_install () {
 	install -m0644 ${WORKDIR}/insserv.conf ${D}${sysconfdir}/insserv.conf
 }
 
+do_install_virtclass-native () {
+    oe_runmake 'DESTDIR=${D}/${STAGING_DIR_NATIVE}' install
+    install -m0644 ${WORKDIR}/insserv.conf ${D}${sysconfdir}/insserv.conf
+}
+
 BBCLASSEXTEND = "native"
-- 
1.7.4.1



