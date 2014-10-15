Return-Path: <openembedded-devel@urbanec.net>
Received: from mail16.tpgi.com.au (mail16.tpgi.com.au [203.12.160.231])
	by mail.openembedded.org (Postfix) with ESMTP id BE21971906
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 11:49:56 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Wed, 15 Oct 2014 22:49:57 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail16.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id s9FBnttN008811
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 22:49:57 +1100
Received: from beep.urbanec.net ([192.168.42.2])
	by gw.urbanec.net with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80.1) (envelope-from <openembedded-devel@urbanec.net>)
	id 1XeN5V-0006HK-On for openembedded-core@lists.openembedded.org;
	Wed, 15 Oct 2014 22:49:53 +1100
Message-ID: <543E5F61.2090500@urbanec.net>
Date: Wed, 15 Oct 2014 22:49:53 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: OE Core <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] update-rc.d.bbclass: Better handling of package upgrades.
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
X-List-Received-Date: Wed, 15 Oct 2014 11:49:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

update-rc.d.bbclass provides default implementations of prerm, postrm,
preinst and postinst. Unfortunately these default implementations don't
deal with package upgrades as well as they could.

For example, if "opkg upgrade" contains init-ifupdown, in the list of
packages to upgrade, the default prerm and preinst scripts will stop
networking while all the packages are being downloaded, unpacked and
installed. Networking is not brought back up again until the postinst
script from the new init-ifupdown package is called. That only happens
after all the packages have been downloaded, unpacked and installed.
This leaves a window where any package that needs to be downloaded after
init-ifupdown was encountered will fail because networking is down.

This patch fixes the problem by delaying the restart of the old service
during an upgrade until postinst. In the case of a package removal, the
service will still be stopped in prerm.

Signed-off-by: Peter Urbanec <openembedded-devel@urbanec.net>
---
 meta/classes/update-rc.d.bbclass | 73 ++++++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 29 deletions(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index bc1aa7d..fcb82fe 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -14,45 +14,60 @@ INITSCRIPT_PARAMS ?= "defaults"
  INIT_D_DIR = "${sysconfdir}/init.d"
 -updatercd_preinst() {
-if [ -z "$D" -a -f "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
-	${INIT_D_DIR}/${INITSCRIPT_NAME} stop
+# pre/postrm scripts come from old package, pre/postinst scripts come from
+# new package. See https://wiki.debian.org/MaintainerScripts for dpkg
+# diagrams. opkg uses a subset, which lacks most of the error handling.
+
+# Old package, step 1
+updatercd_prerm() {
+if [ -z "$D" ]; then
+  if [ "$1" != "upgrade" ] ; then
+    ${INIT_D_DIR}/${INITSCRIPT_NAME} stop
+  fi
+  OPT="-f"
+else
+  OPT="-f -r $D"
 fi
 if type update-rc.d >/dev/null 2>/dev/null; then
-	if [ -n "$D" ]; then
-		OPT="-f -r $D"
-	else
-		OPT="-f"
-	fi
-	update-rc.d $OPT ${INITSCRIPT_NAME} remove
+  update-rc.d $OPT ${INITSCRIPT_NAME} remove
 fi
 }
 -updatercd_postinst() {
-if type update-rc.d >/dev/null 2>/dev/null; then
-	if [ -n "$D" ]; then
-		OPT="-r $D"
-	else
-		OPT="-s"
-	fi
-	update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
-fi
+# New package, step 2
+updatercd_preinst() {
+case "$1" in
+  upgrade)
+    ;;
+  *)
+    ;;
+esac
 }
 -updatercd_prerm() {
-if [ -z "$D" ]; then
-	${INIT_D_DIR}/${INITSCRIPT_NAME} stop
-fi
+# Old package, step 3
+updatercd_postrm() {
+case "$1" in
+  upgrade)
+    ;;
+  *)
+    ;;
+esac
 }
 -updatercd_postrm() {
+# New package, step 4
+# This step runs after all packages have been through steps 1-3. We need to
+# delay service restarts during upgrade until here, otherwise we could end
+# up in situations, like networking going down in the middle of "opkg upgrade",
+# thus resulting in failures to fetch further packages.
+updatercd_postinst() {
+if [ -z "$D" ]; then
+  # This will catch the upgrade case and result in a restart.
+  ${INIT_D_DIR}/${INITSCRIPT_NAME} stop
+  OPT="-s"
+else
+  OPT="-r $D"
+fi
 if type update-rc.d >/dev/null 2>/dev/null; then
-	if [ -n "$D" ]; then
-		OPT="-r $D"
-	else
-		OPT=""
-	fi
-	update-rc.d $OPT ${INITSCRIPT_NAME} remove
+  update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
 fi
 }
 -- 2.1.2


