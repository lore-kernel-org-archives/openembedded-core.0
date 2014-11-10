Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-10.prod.phx3.secureserver.net
	(p3plsmtpa07-10.prod.phx3.secureserver.net [173.201.192.239])
	by mail.openembedded.org (Postfix) with ESMTP id DA4CA70621
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 21:13:28 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-10.prod.phx3.secureserver.net with 
	id DxDM1p00G0BVjqb01xDVxp; Mon, 10 Nov 2014 14:13:29 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Nov 2014 15:13:11 -0600
Message-Id: <e5a7f5c82e278c1c74b67947b85e79820fd892e0.1415647839.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <cover.1415647839.git.pab@pabigot.com>
References: <cover.1415647839.git.pab@pabigot.com>
In-Reply-To: <cover.1415647839.git.pab@pabigot.com>
References: <cover.1415647839.git.pab@pabigot.com>
Subject: [RFC 14/14] bluez5: add a package for tools left in the build area
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
X-List-Received-Date: Mon, 10 Nov 2014 21:13:29 -0000

In bluez4 gatttool was provided as a command-line interface to the
Generic Attribute Profile.  In bluez5 this tool is still built but is no
longer installed.  It is still necessary for those wishing to use GATT
since the programmatic API is not yet mature.  A variety of other useful
tools are treated similarly by bluez5.

Make these tools available in the bluez5-noinst-tools package, in a way
that allows control over which tools are packaged, with the default
being all that are provided in a particular release of bluez.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc     | 26 +++++++++++++-
 meta/recipes-connectivity/bluez5/bluez5_5.25.bb | 47 +++++++++++++++++++++++++
 2 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 97c8cf9..7022343 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -33,6 +33,15 @@ EXTRA_OECONF = "\
   --enable-library \
 "
 
+# bluez5 builds a large number of useful utilities but does not
+# install them.  Specify which ones we want put into ${PN}-noinst-tools.
+NOINST_TOOLS_READLINE ??= ""
+NOINST_TOOLS_EXPERIMENTAL ??= ""
+NOINST_TOOLS = " \
+    ${NOINST_TOOLS_READLINE} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'experimental', '${NOINST_TOOLS_EXPERIMENTAL}', '', d)} \
+"
+
 do_install_append() {
 	install -d ${D}${sysconfdir}/bluetooth/
 	if [ -f ${S}/profiles/audio/audio.conf ]; then
@@ -46,10 +55,15 @@ do_install_append() {
 	fi
 	# at_console doesn't really work with the current state of OE, so punch some more holes so people can actually use BT
 	install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/system.d/
+
+	# Install desired tools that upstream leaves in build area
+        for f in ${NOINST_TOOLS} ; do
+	    install -m 755 ${B}/$f ${D}/${bindir}
+	done
 }
 
 ALLOW_EMPTY_libasound-module-bluez = "1"
-PACKAGES =+ "libasound-module-bluez ${PN}-testtools ${PN}-obex"
+PACKAGES =+ "libasound-module-bluez ${PN}-testtools ${PN}-obex ${PN}-noinst-tools"
 
 FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
 FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${nonarch_base_libdir}/udev/ ${systemd_unitdir}/ ${datadir}/dbus-1"
@@ -66,6 +80,16 @@ SYSTEMD_SERVICE_${PN}-obex = "obex.service"
 
 FILES_${PN}-testtools = "${libdir}/bluez/test/*"
 
+def get_noinst_tools_paths (d, bb, tools):
+    s = list()
+    bindir = d.getVar("bindir", True)
+    for bdp in tools.split():
+        f = os.path.basename(bdp)
+        s.append("%s/%s" % (bindir, f))
+    return "\n".join(s)
+
+FILES_${PN}-noinst-tools = "${@get_noinst_tools_paths(d, bb, d.getVar('NOINST_TOOLS', True))}"
+
 FILES_${PN}-dbg += "\
   ${libdir}/${BPN}/bluetooth/.debug \
   ${libdir}/bluetooth/plugins/.debug \
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.25.bb b/meta/recipes-connectivity/bluez5/bluez5_5.25.bb
index 8cb32ec..7d06b16 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.25.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.25.bb
@@ -1,3 +1,50 @@
 require bluez5.inc
 SRC_URI[md5sum] = "41bd0c915abde255622150ce6dcae67b"
 SRC_URI[sha256sum] = "5ca62f3f45e2638a0f7a81658d6c8813ee01487436ae8e53e9fe395e23d1fd30"
+
+# noinst programs in Makefile.tools that are conditional on READLINE
+# support
+NOINST_TOOLS_READLINE ?= " \
+    attrib/gatttool \
+    tools/obex-client-tool \
+    tools/obex-server-tool \
+    tools/bluetooth-player \
+    tools/obexctl \
+"
+
+# noinst programs in Makefile.tools that are conditional on EXPERIMENTAL
+# support
+NOINST_TOOLS_EXPERIMENTAL ?= " \
+    emulator/btvirt \
+    emulator/b1ee \
+    emulator/hfp \
+    tools/3dsp \
+    tools/mgmt-tester \
+    tools/gap-tester \
+    tools/l2cap-tester \
+    tools/sco-tester \
+    tools/smp-tester \
+    tools/hci-tester \
+    tools/rfcomm-tester \
+    tools/bdaddr \
+    tools/avinfo \
+    tools/avtest \
+    tools/scotest \
+    tools/amptest \
+    tools/hwdb \
+    tools/hcieventmask \
+    tools/hcisecfilter \
+    tools/btmgmt \
+    tools/btinfo \
+    tools/btattach \
+    tools/btsnoop \
+    tools/btproxy \
+    tools/btiotest \
+    tools/cltest \
+    tools/seq2bseq \
+    tools/hex2hcd \
+    tools/ibeacon \
+    tools/btgatt-client \
+    tools/gatt-service \
+    profiles/iap/iapd \
+"
-- 
1.8.5.5


