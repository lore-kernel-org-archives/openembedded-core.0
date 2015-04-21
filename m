Return-Path: <bevenson@melinkcorp.com>
Received: from cdptpa-oedge-vip.email.rr.com
	(cdptpa-outbound-snat.email.rr.com [107.14.166.229])
	by mail.openembedded.org (Postfix) with ESMTP id 9B7AD6E268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 21:18:55 +0000 (UTC)
Received: from [98.100.91.242] ([98.100.91.242:47011]
	helo=evenson-fedora-vm.melinkcorp.local)
	by cdptpa-oedge02 (envelope-from <bevenson@melinkcorp.com>)
	(ecelerity 3.5.0.35861 r(Momo-dev:tip)) with ESMTP
	id 7C/81-19184-0CEB6355; Tue, 21 Apr 2015 21:18:56 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2015 17:18:46 -0400
Message-Id: <1429651126-6851-2-git-send-email-bevenson@melinkcorp.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1429651126-6851-1-git-send-email-bevenson@melinkcorp.com>
References: <1429651126-6851-1-git-send-email-bevenson@melinkcorp.com>
X-RR-Connecting-IP: 107.14.168.130:25
X-Cloudmark-Score: 0
Subject: [PATCHv3] util-linux: Add lastb to alternatives
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
X-List-Received-Date: Tue, 21 Apr 2015 21:18:55 -0000

util-linux creates lastb as a symlink to last during the build.
Just as other applications may provide last, other applications
may provide lastb.  Add alternatives designations for lastb to
avoid installation conflicts with other applications.

Both last and lastb are can be exist in other packages.
Add lastb to the list of alternatives for util-linux.

Add last as a PACKAGECONFIG option and optionally build last
if requested.  Only generate the last and lastb alternative links
if last is enabled in the configuration.

Signed-off-by: Bryan Evenson <bevenson@melinkcorp.com>

Conflicts:
	meta/recipes-core/util-linux/util-linux.inc
---
 meta/recipes-core/util-linux/util-linux.inc | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 80065e3..ada64fc 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -39,7 +39,7 @@ PACKAGES_DYNAMIC = "^util-linux-lib.*"
 
 SHARED_EXTRA_OECONF = "--disable-use-tty-group \
                        --disable-makeinstall-chown \
-                       --enable-kill --enable-last --enable-mesg --enable-partx \
+                       --enable-kill --enable-mesg --enable-partx \
                        --enable-raw --enable-reset --disable-login \
                        --disable-vipw --disable-newgrp --disable-chfn-chsh \
                        --enable-write --enable-mount \
@@ -49,7 +49,8 @@ SHARED_EXTRA_OECONF = "--disable-use-tty-group \
 
 EXTRA_OECONF = "${SHARED_EXTRA_OECONF} --libdir=${base_libdir}"
 
-PACKAGECONFIG_class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG_class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                               last"
 PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, libpam,"
 
 # Respect the systemd feature for uuidd
@@ -61,6 +62,8 @@ PACKAGECONFIG[libcap-ng] = "--enable-setpriv,--disable-setpriv,libcap-ng,"
 # Build python bindings for libmount
 PACKAGECONFIG[pylibmount] = "--with-python --enable-pylibmount,--without-python --disable-pylibmount,python"
 
+PACKAGECONFIG[last] = "--enable-last,,"
+
 FILES_${PN}-bash-completion += "${datadir}/bash-completion"
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
@@ -174,7 +177,7 @@ do_install_append_class-native () {
 ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root switch_root"
-ALTERNATIVE_${PN} += "mkfs.minix hexdump last logger mesg renice wall"
+ALTERNATIVE_${PN} += "mkfs.minix hexdump logger mesg renice wall"
 ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject"
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
@@ -187,10 +190,8 @@ ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
 ALTERNATIVE_LINK_NAME[mkfs.minix] = "${base_sbindir}/mkfs.minix"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
 
-ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 lastb.1 mesg.1 wall.1 nologin.8 sulogin.8 utmpdump.1 reset.1"
+ALTERNATIVE_${PN}-doc = "mountpoint.1 mesg.1 wall.1 nologin.8 sulogin.8 utmpdump.1 reset.1"
 
-ALTERNATIVE_LINK_NAME[last.1] = "${mandir}/man1/last.1"
-ALTERNATIVE_LINK_NAME[lastb.1] = "${mandir}/man1/lastb.1"
 ALTERNATIVE_LINK_NAME[mesg.1] = "${mandir}/man1/mesg.1"
 ALTERNATIVE_LINK_NAME[mountpoint.1] = "${mandir}/man1/mountpoint.1"
 ALTERNATIVE_LINK_NAME[nologin.8] = "${mandir}/man8/nologin.8"
@@ -252,6 +253,15 @@ python do_package_prepend () {
         alt_name = "su"
         d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, '%s/%s' % (d.getVar('base_bindir', True), alt_name))
         d.appendVar('ALTERNATIVE_%s' % (d.getVar('PN', True)), ' ' + alt_name)
+    if '--enable-last' in d.getVar('EXTRA_OECONF', True).split():
+        alt_name_last = "last"
+        alt_name_lastb = "lastb"
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name_last, '%s/%s' % (d.getVar('bindir', True), alt_name_last))
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name_lastb, '%s/%s' % (d.getVar('bindir', True), alt_name_lastb))
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', '%s.1' % alt_name_last, '%s/man1/%s.1' % (d.getVar('mandir', True), alt_name_last))
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', '%s.1' % alt_name_lastb, '%s/man1/%s.1' % (d.getVar('mandir', True), alt_name_lastb))
+        d.appendVar('ALTERNATIVE_%s' % (d.getVar('PN', True)), ' ' + alt_name_last + ' ' + alt_name_lastb)
+        d.appendVar('ALTERNATIVE_%s-doc' % (d.getVar('PN', True)), ' ' + alt_name_last + ' ' + alt_name_lastb)
 }
 
 python populate_packages_prepend() {
-- 
2.1.0


