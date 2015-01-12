Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 398307284C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 23:35:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0CNZnqk000175
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 15:35:49 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 12 Jan 2015 15:35:49 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Jan 2015 15:35:46 -0800
Message-ID: <f6e07a8b76f87644cadce3718cd504db8b5ec153.1421105154.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421105154.git.liezhi.yang@windriver.com>
References: <cover.1421105154.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] portmap: remove obsolete lines
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
X-List-Received-Date: Mon, 12 Jan 2015 23:35:56 -0000
Content-Type: text/plain

* The SRC_URI and S in portmap.inc was for portmap 5, but we don't have
  it any more.
* Remove DEPENDS = "virtual/fakeroot-native" and fakeroot before
  do_install.
* Remove sbindir = "/sbin" and use "${base_sbindir}" in FILES.
* Move patches from dir portmap-6.0 to portmap.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/portmap/portmap.inc      |   19 +------------------
 .../destdir-no-strip.patch                         |    0
 .../{portmap-6.0 => portmap}/tcpd-config.patch     |    0
 meta/recipes-connectivity/portmap/portmap_6.0.bb   |    2 +-
 4 files changed, 2 insertions(+), 19 deletions(-)
 rename meta/recipes-connectivity/portmap/{portmap-6.0 => portmap}/destdir-no-strip.patch (100%)
 rename meta/recipes-connectivity/portmap/{portmap-6.0 => portmap}/tcpd-config.patch (100%)

diff --git a/meta/recipes-connectivity/portmap/portmap.inc b/meta/recipes-connectivity/portmap/portmap.inc
index f5f7fde..338af33 100644
--- a/meta/recipes-connectivity/portmap/portmap.inc
+++ b/meta/recipes-connectivity/portmap/portmap.inc
@@ -4,14 +4,6 @@ SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://portmap.c;beginline=2;endline=31;md5=51ff67e66ec84b2009b017b1f94afbf4 \
                     file://from_local.c;beginline=9;endline=35;md5=1bec938a2268b8b423c58801ace3adc1"
-DEPENDS = "virtual/fakeroot-native"
-
-SRC_URI = "${DEBIAN_MIRROR}/main/p/portmap/portmap_5.orig.tar.gz \
-	${DEBIAN_MIRROR}/main/p/portmap/portmap_${PV}.diff.gz \
-	file://portmap.init \
-	file://make.patch;apply=yes"
-
-S = "${WORKDIR}/portmap_5beta"
 
 INITSCRIPT_NAME = "portmap"
 INITSCRIPT_PARAMS = "start 10 2 3 4 5 . stop 32 0 1 6 ."
@@ -20,15 +12,6 @@ inherit update-rc.d systemd
 
 SYSTEMD_SERVICE_${PN} = "portmap.service"
 
-sbindir = "/sbin"
-
-fakeroot do_install() {
-	install -d ${D}${sysconfdir}/init.d
-	install -d ${D}${base_sbindir}
-	install -m 0755 ${WORKDIR}/portmap.init ${D}${sysconfdir}/init.d/portmap
-	oe_runmake 'docdir=${docdir}/portmap' 'DESTDIR=${D}' install
-}
-
 PACKAGES =+ "portmap-utils"
-FILES_portmap-utils = "/sbin/pmap_set /sbin/pmap_dump"
+FILES_portmap-utils = "${base_sbindir}/pmap_set ${base_sbindir}/pmap_dump"
 FILES_${PN}-doc += "${docdir}"
diff --git a/meta/recipes-connectivity/portmap/portmap-6.0/destdir-no-strip.patch b/meta/recipes-connectivity/portmap/portmap/destdir-no-strip.patch
similarity index 100%
rename from meta/recipes-connectivity/portmap/portmap-6.0/destdir-no-strip.patch
rename to meta/recipes-connectivity/portmap/portmap/destdir-no-strip.patch
diff --git a/meta/recipes-connectivity/portmap/portmap-6.0/tcpd-config.patch b/meta/recipes-connectivity/portmap/portmap/tcpd-config.patch
similarity index 100%
rename from meta/recipes-connectivity/portmap/portmap-6.0/tcpd-config.patch
rename to meta/recipes-connectivity/portmap/portmap/tcpd-config.patch
diff --git a/meta/recipes-connectivity/portmap/portmap_6.0.bb b/meta/recipes-connectivity/portmap/portmap_6.0.bb
index 8b65a03..e727fe3 100644
--- a/meta/recipes-connectivity/portmap/portmap_6.0.bb
+++ b/meta/recipes-connectivity/portmap/portmap_6.0.bb
@@ -20,7 +20,7 @@ CPPFLAGS += "-DFACILITY=LOG_DAEMON -DENABLE_DNS -DHOSTS_ACCESS"
 CFLAGS += "-Wall -Wstrict-prototypes -fPIC"
 EXTRA_OEMAKE += "'NO_TCP_WRAPPER=${@bb.utils.contains('PACKAGECONFIG', 'tcp-wrappers', '', '1', d)}'"
 
-fakeroot do_install() {
+do_install() {
     install -d ${D}${mandir}/man8/ ${D}${base_sbindir} ${D}${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/portmap.init ${D}${sysconfdir}/init.d/portmap
     oe_runmake install DESTDIR=${D}
-- 
1.7.9.5


