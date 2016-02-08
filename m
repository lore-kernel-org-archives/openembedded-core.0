Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id B3AF4734B8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 10:10:03 +0000 (UTC)
Received: from comp_016_pc_buildenv.localdomain (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 797563FD357;
	Mon,  8 Feb 2016 11:10:03 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org,
	Enrico Jorns <ejo@pengutronix.de>, Roy Li <rongqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Christopher Larson <chris_larson@mentor.com>,
	Ross Burton <ross.burton@intel.com>
Date: Mon,  8 Feb 2016 11:09:41 +0100
Message-Id: <1454926183-22439-5-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1454926183-22439-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1454926183-22439-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 4/6] systemd: use sysusers for setting up required users/groups
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
X-List-Received-Date: Mon, 08 Feb 2016 10:10:06 -0000

Use sysusers functionality of systemd allows setting up necessary user
accounts during startup. This functionality is already partially used
for journald and networkd (as we ship the default systemd.conf). The
patch removes useradd class in favor of the native systemd mechanism.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
---
 meta/recipes-core/systemd/systemd_228.bb | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_228.bb b/meta/recipes-core/systemd/systemd_228.bb
index f4cab27ba590901230f30229d54636d019f541d6..74abe39761bfb22eb9ed442b26c0233394503453 100644
--- a/meta/recipes-core/systemd/systemd_228.bb
+++ b/meta/recipes-core/systemd/systemd_228.bb
@@ -22,7 +22,7 @@ DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl rea
 
 SECTION = "base/shell"
 
-inherit useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext
+inherit pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext
 
 SRCREV = "dd050decb6ad131ebdeabb71c4f9ecb4733269c0"
 
@@ -244,6 +244,14 @@ do_install() {
 		echo 'f /run/resolv.conf 0644 root root' >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
 	fi
 	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
+	if ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', 'true', 'false', d)}; then
+		echo 'u systemd-journal-gateway - -' >> ${D}${libdir}/sysusers.d/systemd.conf
+	fi
+
+	if ${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', 'true', 'false', d)}; then
+		echo 'u systemd-timesync - -' >> ${D}${libdir}/sysusers.d/systemd.conf
+	fi
+	echo 'g lock - -' >> ${D}${libdir}/sysusers.d/systemd.conf
 }
 
 do_install_ptest () {
@@ -285,10 +293,6 @@ PACKAGES =+ "\
 SYSTEMD_PACKAGES = "${PN}-binfmt"
 SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
 
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} += "--system systemd-journal-gateway; --system systemd-timesync"
-GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
-
 FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 
 FILES_${PN}-initramfs = "/init"
-- 
2.5.0


