Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6C2A17E8A3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 16:02:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5EG2gKi026137
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 09:02:43 -0700 (PDT)
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 14 Jun 2019 09:02:30 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Jun 2019 12:02:26 -0400
Message-ID: <20190614160229.6144-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [PATCH 1/4] util-linux: add setpriv utility
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
X-List-Received-Date: Fri, 14 Jun 2019 16:02:42 -0000
Content-Type: text/plain

Enable the setpriv utility for targets only. It will be used in
the run-ptest script for bash and perhaps other packages where
the ptest code is expected to run as a user.

setpriv uses libcap-ng which doesn't build natively so disable
it for native* builds. Also, busybox has a setpriv implementation
so ensure that setpriv adheres to the alternatives scheme.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index df1d1224dd..2d8991095c 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=972a134f1e14b2b060e365df2fab0099
 
 #gtk-doc is not enabled as it requires xmlto which requires util-linux
 inherit autotools gettext manpages pkgconfig systemd update-alternatives python3-dir bash-completion ptest
-DEPENDS = "zlib ncurses virtual/crypt"
+DEPENDS = "libcap-ng ncurses virtual/crypt zlib"
 
 MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz \
@@ -102,6 +102,10 @@ EXTRA_OECONF = "\
     --libdir='${UTIL_LINUX_LIBDIR}' \
 "
 
+EXTRA_OECONF_append_class-target = " --enable-setpriv"
+EXTRA_OECONF_append_class-native = " --without-cap-ng --disable-setpriv"
+EXTRA_OECONF_append_class-nativesdk = " --without-cap-ng --disable-setpriv"
+
 PACKAGECONFIG_class-target ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 # inherit manpages requires this to be present, however util-linux does not have 
 # configuration options, and installs manpages always
@@ -109,8 +113,6 @@ PACKAGECONFIG[manpages] = ""
 PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, libpam,"
 # Respect the systemd feature for uuidd
 PACKAGECONFIG[systemd] = "--with-systemd --with-systemdsystemunitdir=${systemd_system_unitdir}, --without-systemd --without-systemdsystemunitdir,systemd"
-# Build setpriv requires libcap-ng
-PACKAGECONFIG[libcap-ng] = "--enable-setpriv,--disable-setpriv,libcap-ng,"
 # Build python bindings for libmount
 PACKAGECONFIG[pylibmount] = "--with-python=3 --enable-pylibmount,--without-python --disable-pylibmount,python3"
 # Readline support
@@ -248,6 +250,7 @@ ALTERNATIVE_LINK_NAME[readprofile] = "${sbindir}/readprofile"
 ALTERNATIVE_LINK_NAME[renice] = "${bindir}/renice"
 ALTERNATIVE_LINK_NAME[rev] = "${bindir}/rev"
 ALTERNATIVE_LINK_NAME[rfkill] = "${sbindir}/rfkill"
+ALTERNATIVE_LINK_NAME[setpriv] = "${bindir}/setpriv"
 ALTERNATIVE_LINK_NAME[setsid] = "${bindir}/setsid"
 ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
 ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
@@ -260,7 +263,10 @@ ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
 ALTERNATIVE_LINK_NAME[utmpdump] = "${bindir}/utmpdump"
 ALTERNATIVE_LINK_NAME[wall] = "${bindir}/wall"
 
-ALTERNATIVE_${PN}-doc = "blkid.8 eject.1 findfs.8 fsck.8 kill.1 last.1 lastb.1 libblkid.3 logger.1 mesg.1 mountpoint.1 nologin.8 rfkill.8 sulogin.8 utmpdump.1 uuid.3 wall.1"
+ALTERNATIVE_${PN}-doc = "\
+blkid.8 eject.1 findfs.8 fsck.8 kill.1 last.1 lastb.1 libblkid.3 logger.1 mesg.1 \
+mountpoint.1 nologin.8 rfkill.8 setpriv.1 sulogin.8 utmpdump.1 uuid.3 wall.1\
+"
 ALTERNATIVE_${PN}-doc += "${@bb.utils.contains('PACKAGECONFIG', 'pam', 'su.1', '', d)}"
 
 ALTERNATIVE_LINK_NAME[blkid.8] = "${mandir}/man8/blkid.8"
@@ -276,6 +282,7 @@ ALTERNATIVE_LINK_NAME[mesg.1] = "${mandir}/man1/mesg.1"
 ALTERNATIVE_LINK_NAME[mountpoint.1] = "${mandir}/man1/mountpoint.1"
 ALTERNATIVE_LINK_NAME[nologin.8] = "${mandir}/man8/nologin.8"
 ALTERNATIVE_LINK_NAME[rfkill.8] = "${mandir}/man8/rfkill.8"
+ALTERNATIVE_LINK_NAME[setpriv.1] = "${mandir}/man1/setpriv.1"
 ALTERNATIVE_LINK_NAME[su.1] = "${mandir}/man1/su.1"
 ALTERNATIVE_LINK_NAME[sulogin.8] = "${mandir}/man8/sulogin.8"
 ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
-- 
2.17.0


