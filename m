Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 495BD65D58
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 15:37:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s99Fbgmk010982
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Oct 2014 08:37:42 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 9 Oct 2014 08:37:42 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Oct 2014 08:37:41 -0700
Message-ID: <d21ab39b5479742ca2faba70c48649d7e4983af5.1412869032.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1412869032.git.liezhi.yang@windriver.com>
References: <cover.1412869032.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] avahi-ui: fix for building systemd with multilib
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
X-List-Received-Date: Thu, 09 Oct 2014 15:37:44 -0000
Content-Type: text/plain

Fixed:
MACHINE = "qemux86-64"
VIRTUAL-RUNTIME_init_manager = " systemd "
DISTRO_FEATURES_append = " systemd"
DISTRO_FEATURES_BACKFILL_CONSIDERED += " sysvinit "

require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

$ bitbake avahi avahi-ui
ERROR: QA Issue: avahi-ui: Files/directories were installed but not shipped
  /lib
  /lib/systemd
  /lib/systemd/system
  /lib/systemd/system/avahi-daemon.socket
  /lib/systemd/system/avahi-dnsconfd.service
  /lib/systemd/system/avahi-daemon.service [installed-vs-shipped]
ERROR: The recipe avahi-ui is trying to install files into a sharedarea when those files already exist. Those files and their manifestlocation are:
   /path/to/sysroots/qemux86-64/lib/systemd/system/avahi-daemon.socket
 Matched in manifest-qemux86-64-avahi.populate_sysroot
 /path/to/sysroots/qemux86-64/lib/systemd/system/avahi-dnsconfd.service
 Matched in manifest-qemux86-64-avahi.populate_sysroot
 /path/to/sysroots/qemux86-64/lib/systemd/system/avahi-daemon.service
 Matched in manifest-qemux86-64-avahi.populate_sysroot
Please verify which recipe should provide theabove files.

And remove the duplicated line:
rm ${D}${base_libdir} -rf

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
index 070530e..eea4d70 100644
--- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
@@ -45,7 +45,11 @@ RDEPENDS_python-avahi = "python-core python-dbus"
 do_install_append () {
 	rm ${D}${sysconfdir} -rf
 	rm ${D}${base_libdir} -rf
-	rm ${D}${base_libdir} -rf
+	rm ${D}${systemd_unitdir} -rf
+	# The ${systemd_unitdir} is /lib/systemd, so we need rmdir /lib,
+	# but not ${base_libdir} here. And the /lib may not exist
+	# whithout systemd.
+	[ ! -d ${D}/lib ] || rmdir ${D}/lib --ignore-fail-on-non-empty
 	rm ${D}${bindir}/avahi-b*
 	rm ${D}${bindir}/avahi-p*
 	rm ${D}${bindir}/avahi-r*
-- 
1.7.9.5


