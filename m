Return-Path: <openembedded-devel@urbanec.net>
X-Greylist: delayed 326 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 10 Oct 2014 16:45:51 UTC
Received: from mail14.tpgi.com.au (mail14.tpgi.com.au [203.12.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5A1FB71844
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 16:45:50 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Sat, 11 Oct 2014 03:45:50 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail14.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id s9AGjmtI007285
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 03:45:50 +1100
Received: from beep.urbanec.net ([192.168.42.2])
	by gw.urbanec.net with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80.1) (envelope-from <openembedded-devel@urbanec.net>)
	id 1XcdK6-0003Vs-Rk for openembedded-core@lists.openembedded.org;
	Sat, 11 Oct 2014 03:45:46 +1100
Message-ID: <54380D3A.8060904@urbanec.net>
Date: Sat, 11 Oct 2014 03:45:46 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Better support for upgrading packages in opkg and update-rc.d.bbclass
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
X-List-Received-Date: Fri, 10 Oct 2014 16:46:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

init-ifupdown inherits default implementations of prerm, postrm, preinst
and postinst from update-rc.d.bbclass. Unfortunately these default
implementations don't deal with package upgrades as well as they could.

What ends up happening is that opkg starts downloading and unpacking
packages sequentially. As it downloads and unpacks each package, opkg
calls prerm, preinst and postrm hook scripts. Once all packages are
unpacked, the postinst script is finally called for all packages as part
of the "configure" stage.

In the case of init-ifupdown, the default prerm and preinst scripts stop
networking. Networking is not brought back up again until the init-ifupdown
postinst is called, but that only happens after all the packages have been
downloaded, unpacked and installed. This leaves a window where any package
that needs to be downloaded after init-ifupdown is encountered will fail.

This patch fixes the problem by enhancing opkg to also provide the "upgrade"
argument to prerm and postrm, to (partially) match what dpkg does. See
https://wiki.debian.org/MaintainerScripts for dpkg diagrams that clarify
the intended process. opkg lacks the full functionality of dpkg, but for
the purpose of this exercise, they are similar enough.

I have submitted a patch to the opkg-devel list to include the "upgrade"
argument in future version of opkg.

The second part of the solution is an update to the default implementations
of the pre- and post- scripts provided by update-rc.d.bbclass. The scripts
are now careful to remove the package init scripts using the old package
context and to delay the restart of a service until the configure stage,
called from the postinst script.

---
 meta/classes/update-rc.d.bbclass                   | 75 +++++++++++++---------
 .../opkg/upgrade-argument-for-pre_postrm.patch     | 30 +++++++++
 meta/recipes-devtools/opkg/opkg_0.2.2.bb           |  1 +
 3 files changed, 77 insertions(+), 29 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/upgrade-argument-for-pre_postrm.patch

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index bc1aa7d..c29457f 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -14,45 +14,62 @@ INITSCRIPT_PARAMS ?= "defaults"
  INIT_D_DIR = "${sysconfdir}/init.d"
 -updatercd_preinst() {
-if [ -z "$D" -a -f "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
-	${INIT_D_DIR}/${INITSCRIPT_NAME} stop
+# During an upgrade, the pre/postrm scripts from old package are called
+# and the pre/postinst scripts called are from the new package.
+# See https://wiki.debian.org/MaintainerScripts for dpkg diagrams.
+# opkg uses a subset, which lacks most of the error handling.
+
+# Old package context, step 1
+updatercd_prerm() {
+if [ "x$1" != "xupgrade" ] ; then
+  ${INIT_D_DIR}/${INITSCRIPT_NAME} stop
 fi
-if type update-rc.d >/dev/null 2>/dev/null; then
-	if [ -n "$D" ]; then
-		OPT="-f -r $D"
-	else
-		OPT="-f"
-	fi
-	update-rc.d $OPT ${INITSCRIPT_NAME} remove
+if [ -z "$D" ]; then
+  OPT=""
+else
+  OPT="-r $D"
 fi
-}
-
-updatercd_postinst() {
 if type update-rc.d >/dev/null 2>/dev/null; then
-	if [ -n "$D" ]; then
-		OPT="-r $D"
-	else
-		OPT="-s"
-	fi
-	update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
+  update-rc.d $OPT ${INITSCRIPT_NAME} remove
 fi
 }
 -updatercd_prerm() {
-if [ -z "$D" ]; then
-	${INIT_D_DIR}/${INITSCRIPT_NAME} stop
-fi
+# New package context, step 2
+updatercd_preinst() {
+case "$1" in
+  upgrade)
+    ;;
+  *)
+    ;;
+esac
 }
 +# Old package context, step 3
 updatercd_postrm() {
+case "$1" in
+  upgrade)
+    ;;
+  *)
+    ;;
+esac
+}
+
+# N.B. Step 4 runs after all packages have been through steps 1-3 and therefore we
+#      need to delay service restarts during upgrade until here. Otherwise we end
+#      up with situations, like networking going down in the middle of "opkg upgrade",
+#      thus resulting in failures to fetch further packages.
+
+# New package context, step 4
+updatercd_postinst() {
 if type update-rc.d >/dev/null 2>/dev/null; then
-	if [ -n "$D" ]; then
-		OPT="-r $D"
-	else
-		OPT=""
-	fi
-	update-rc.d $OPT ${INITSCRIPT_NAME} remove
+  if [ -n "$D" ]; then
+    OPT="-r $D"
+  else
+    # This will catch the upgrade case and result in a restart.
+    ${INIT_D_DIR}/${INITSCRIPT_NAME} stop
+    OPT="-s"
+  fi
+  update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
 fi
 }
 diff --git a/meta/recipes-devtools/opkg/opkg/upgrade-argument-for-pre_postrm.patch b/meta/recipes-devtools/opkg/opkg/upgrade-argument-for-pre_postrm.patch
new file mode 100644
index 0000000..5bea82a
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/upgrade-argument-for-pre_postrm.patch
@@ -0,0 +1,30 @@
+From: Peter Urbanec
+Subject: [opkg] Use "upgrade" argument in prerm and postrm scripts
+
+Current implementation of opkg makes it difficult to distinguish between
+package removal or upgrade in prerm and postrm scripts. The following patch
+will make it easier and is close(r) to what dpkg does.
+
+diff --git a/libopkg/opkg_remove.c b/libopkg/opkg_remove.c
+index 07401b2..52454f8 100644
+--- a/libopkg/opkg_remove.c
++++ b/libopkg/opkg_remove.c
+@@ -292,7 +292,7 @@ opkg_remove_pkg(pkg_t *pkg, int from_upgrade)
+      pkg->state_want = SW_DEINSTALL;
+      opkg_state_changed++;
+ +-     if (pkg_run_script(pkg, "prerm", "remove") != 0) {
++     if (pkg_run_script(pkg, "prerm", from_upgrade ? "upgrade" : "remove") != 0) {
+          if (!conf->force_remove) {
+              opkg_msg(ERROR, "not removing package \"%s\", "
+                              "prerm script failed\n", pkg->name);
+@@ -310,7 +310,7 @@ opkg_remove_pkg(pkg_t *pkg, int from_upgrade)
+        feel free to fix this. */
+      remove_data_files_and_list(pkg);
+
+-     err = pkg_run_script(pkg, "postrm", "remove");
++     err = pkg_run_script(pkg, "postrm", from_upgrade ? "upgrade" : "remove");
+
+      remove_maintainer_scripts(pkg);
+      pkg->state_status = SS_NOT_INSTALLED;
+ diff --git a/meta/recipes-devtools/opkg/opkg_0.2.2.bb b/meta/recipes-devtools/opkg/opkg_0.2.2.bb
index 3dd7489..9c0045e 100644
--- a/meta/recipes-devtools/opkg/opkg_0.2.2.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.2.2.bb
@@ -4,6 +4,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://no-install-recommends.patch \
            file://add-exclude.patch \
            file://opkg-configure.service \
+           file://upgrade-argument-for-pre_postrm.patch \
 "
  S = "${WORKDIR}/${BPN}-${PV}"
-- 
2.1.2


