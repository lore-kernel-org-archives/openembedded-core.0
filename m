Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4b3-0006h6-W3
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:50 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:33:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96633046"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:33:08 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:29 -0800
Message-Id: <b6e5729a3b25e175bdc088856ebe5b9d07c40fed.1326786990.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 44/62] alsa-state: move state files to localstatedir
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
X-List-Received-Date: Tue, 17 Jan 2012 08:44:37 -0000

From: Joshua Lock <josh@linux.intel.com>

alsactl creates the state files in /var/lib/alsa by default so switch
alsa-state to use files in that location.

Further, update the alsa-state init script to have the location of the
state files sed'ed into the script at do_install time (so as to remove
hard coding of directory paths).

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-bsp/alsa-state/alsa-state.bb         |    8 +++++---
 meta/recipes-bsp/alsa-state/alsa-state/alsa-state |    6 +++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
index ecfa975..bc17b25 100644
--- a/meta/recipes-bsp/alsa-state/alsa-state.bb
+++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
@@ -26,11 +26,13 @@ INITSCRIPT_NAME = "alsa-state"
 INITSCRIPT_PARAMS = "start 39 S . stop 31 0 6 ."
 
 do_install() {
+    sed -i -e "s:#STATEDIR#:${localstatedir}/lib/alsa:g" ${WORKDIR}/alsa-state
     install -d ${D}${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/alsa-state ${D}${sysconfdir}/init.d
 
+    install -d ${D}/${localstatedir}/lib/alsa
     install -m 0644 ${WORKDIR}/asound.conf ${D}${sysconfdir}
-    install -m 0644 ${WORKDIR}/*.state ${D}${sysconfdir}
+    install -m 0644 ${WORKDIR}/*.state ${D}${localstatedir}/lib/alsa
 }
 
 PACKAGES += "alsa-states"
@@ -40,14 +42,14 @@ RRECOMMENDS_alsa-state = "alsa-states"
 FILES_${PN} = "${sysconfdir}/init.d ${sysconfdir}/asound.conf"
 CONFFILES_${PN} = "${sysconfdir}/asound.conf"
 
-FILES_alsa-states = "${sysconfdir}/*.state"
+FILES_alsa-states = "${localstatedir}/lib/alsa/*.state"
 
 pkg_postinst_${PN}() {
 	if test -z "$D"
 	then
 		if test -x /usr/sbin/alsactl
 		then
-			/usr/sbin/alsactl -f ${sysconfdir}/asound.state restore
+			/usr/sbin/alsactl -f ${localstatedir}/lib/alsa/asound.state restore
 		fi
 		# INITSCRIPT_PARAMS changed, so remove the old and
 		# install the new setting.
diff --git a/meta/recipes-bsp/alsa-state/alsa-state/alsa-state b/meta/recipes-bsp/alsa-state/alsa-state/alsa-state
index 84cdf03..9850791 100755
--- a/meta/recipes-bsp/alsa-state/alsa-state/alsa-state
+++ b/meta/recipes-bsp/alsa-state/alsa-state/alsa-state
@@ -9,9 +9,9 @@
 
 asound_restore(){
 	echo "ALSA: Restoring mixer settings..."
-	if test -x /usr/sbin/alsactl -a -e /etc/asound.state
+	if test -x /usr/sbin/alsactl -a -e #STATEDIR#/asound.state
 	then
-		/usr/sbin/alsactl -f /etc/asound.state restore &
+		/usr/sbin/alsactl -f #STATEDIR#/asound.state restore &
 	fi
 }
 
@@ -19,7 +19,7 @@ asound_store(){
 	echo "ALSA: Storing mixer settings..."
 	if test -x /usr/sbin/alsactl
 	then
-		/usr/sbin/alsactl -f /etc/asound.state store
+		/usr/sbin/alsactl -f #STATEDIR#/asound.state store
 	fi
 }
 
-- 
1.7.6.5



