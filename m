Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 74B8E731F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 12:33:14 +0000 (UTC)
Received: from comp_016_pc_buildenv.localdomain (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 809181A73BE;
	Wed, 10 Feb 2016 13:33:14 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org,
	Enrico Jorns <ejo@pengutronix.de>, Roy Li <rongqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Christopher Larson <chris_larson@mentor.com>,
	Ross Burton <ross.burton@intel.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>,
	Randy MacLeod <randy.macleod@windriver.com>, Tanu Kaskinen <tanuk@iki.fi>
Date: Wed, 10 Feb 2016 13:32:53 +0100
Message-Id: <1455107576-8931-5-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455107576-8931-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1455107576-8931-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v2 4/7] systemd: extend PACKAGECONFIG flags
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
X-List-Received-Date: Wed, 10 Feb 2016 12:33:15 -0000

We currently ship a rather full-blown setup of system. Very few
configuration knobs are actually exposed through PACKAGECONFIG
flags. This patch adds new PACKAGECONFIG flags for some finer tuning of
systemd's functionality. The default setting attempts to preserve all of
the features that were previously auto-enabled.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
---
 meta/recipes-core/systemd/systemd_228.bb | 64 ++++++++++++++++++++++++++++----
 1 file changed, 57 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_228.bb b/meta/recipes-core/systemd/systemd_228.bb
index 9d7851e0f285f6c24458e16e0c493c8481236bf6..97fc9f4c1333e246f79bc53f61439f5e4cf78352 100644
--- a/meta/recipes-core/systemd/systemd_228.bb
+++ b/meta/recipes-core/systemd/systemd_228.bb
@@ -64,6 +64,28 @@ PACKAGECONFIG ??= "compat xz ldconfig \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
+                   ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'efi', '', d)} \
+                   sysusers \
+                   binfmt \
+                   randomseed \
+                   machined \
+                   backlight \
+                   quotacheck \
+                   bootchart \
+                   hostnamed \
+                   myhostname \
+                   hibernate \
+                   timedated \
+                   timesyncd \
+                   localed \
+                   kdbus \
+                   ima \
+                   smack \
+                   logind \
+                   firstboot \
+                   utmp \
+                   polkit \
                   "
 PACKAGECONFIG[journal-upload] = "--enable-libcurl,--disable-libcurl,curl"
 # Sign the journal for anti-tampering
@@ -76,6 +98,30 @@ PACKAGECONFIG[microhttpd] = "--enable-microhttpd,--disable-microhttpd,libmicroht
 PACKAGECONFIG[elfutils] = "--enable-elfutils,--disable-elfutils,elfutils"
 PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"
 PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"
+PACKAGECONFIG[machined] = "--enable-machined,--disable-machined"
+PACKAGECONFIG[backlight] = "--enable-backlight,--disable-backlight"
+PACKAGECONFIG[quotacheck] = "--enable-quotacheck,--disable-quotacheck"
+PACKAGECONFIG[bootchart] = "--enable-bootchart,--disable-bootchart"
+PACKAGECONFIG[hostnamed] = "--enable-hostnamed,--disable-hostnamed"
+PACKAGECONFIG[myhostname] = "--enable-myhostname,--disable-myhostname"
+PACKAGECONFIG[rfkill] = "--enable-rfkill,--disable-rfkill"
+PACKAGECONFIG[hibernate] = "--enable-hibernate,--disable-hibernate"
+PACKAGECONFIG[timedated] = "--enable-timedated,--disable-timedated"
+PACKAGECONFIG[timesyncd] = "--enable-timesyncd,--disable-timesyncd"
+PACKAGECONFIG[localed] = "--enable-localed,--disable-localed"
+PACKAGECONFIG[efi] = "--enable-efi,--disable-efi"
+PACKAGECONFIG[kdbus] = "--enable-kdbus,--disable-kdbus"
+PACKAGECONFIG[ima] = "--enable-ima,--disable-ima"
+PACKAGECONFIG[smack] = "--enable-smack,--disable-smack"
+# libseccomp is found in meta-security
+PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
+PACKAGECONFIG[logind] = "--enable-logind,--disable-logind"
+PACKAGECONFIG[sysusers] = "--enable-sysusers,--disable-sysusers"
+PACKAGECONFIG[firstboot] = "--enable-firstboot,--disable-firstboot"
+PACKAGECONFIG[randomseed] = "--enable-randomseed,--disable-randomseed"
+PACKAGECONFIG[binfmt] = "--enable-binfmt,--disable-binfmt"
+PACKAGECONFIG[utmp] = "--enable-utmp,--disable-utmp"
+PACKAGECONFIG[polkit] = "--enable-polkit,--disable-polkit"
 # importd requires curl/xz/zlib/bzip2/gcrypt
 PACKAGECONFIG[importd] = "--enable-importd,--disable-importd"
 PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
@@ -186,17 +232,20 @@ do_install() {
         # Delete journal README, as log can be symlinked inside volatile.
         rm -f ${D}/${localstatedir}/log/README
 
-	# Create symlinks for systemd-update-utmp-runlevel.service
 	install -d ${D}${systemd_unitdir}/system/graphical.target.wants
 	install -d ${D}${systemd_unitdir}/system/multi-user.target.wants
 	install -d ${D}${systemd_unitdir}/system/poweroff.target.wants
 	install -d ${D}${systemd_unitdir}/system/reboot.target.wants
 	install -d ${D}${systemd_unitdir}/system/rescue.target.wants
-	ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/graphical.target.wants/systemd-update-utmp-runlevel.service
-	ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/multi-user.target.wants/systemd-update-utmp-runlevel.service
-	ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/poweroff.target.wants/systemd-update-utmp-runlevel.service
-	ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/reboot.target.wants/systemd-update-utmp-runlevel.service
-	ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/rescue.target.wants/systemd-update-utmp-runlevel.service
+
+	# Create symlinks for systemd-update-utmp-runlevel.service
+	if ${@bb.utils.contains('PACKAGECONFIG', 'utmp', 'true', 'false', d)}; then
+		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/graphical.target.wants/systemd-update-utmp-runlevel.service
+		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/multi-user.target.wants/systemd-update-utmp-runlevel.service
+		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/poweroff.target.wants/systemd-update-utmp-runlevel.service
+		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/reboot.target.wants/systemd-update-utmp-runlevel.service
+		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/rescue.target.wants/systemd-update-utmp-runlevel.service
+	fi
 
 	# Enable journal to forward message to syslog daemon
 	sed -i -e 's/.*ForwardToSyslog.*/ForwardToSyslog=yes/' ${D}${sysconfdir}/systemd/journald.conf
@@ -254,7 +303,8 @@ SYSTEMD_PACKAGES = "${PN}-binfmt"
 SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
 
 USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} += "--system systemd-journal-gateway; --system systemd-timesync"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '--system systemd-journal-gateway;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--system systemd-timesync;', '', d)}"
 GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
 
 FILES_${PN}-analyze = "${bindir}/systemd-analyze"
-- 
2.5.0


