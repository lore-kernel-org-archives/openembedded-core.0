Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 245F76CD4E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2013 22:41:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r99MfOkt007442 for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Oct 2013 23:41:24 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Bw7TXclfG_Ob
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2013 23:41:23 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r99MfKdZ007432
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Oct 2013 23:41:22 +0100
Message-ID: <1381358476.29912.49.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 09 Oct 2013 23:41:16 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] alsa-state: Rename init script
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
X-List-Received-Date: Wed, 09 Oct 2013 22:41:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Having a SRC_URI called ${PN} is asking for trouble. When extending FILESPATH,
alsa-state can be treated as a directory and copied over the contents of ${WORKDIR}
which is invariably not what the user wants.

Avoid this by renaming the SRC_URI to something else and only call
it alsa-state at install time.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
index a9cc04c..552fcfc 100644
--- a/meta/recipes-bsp/alsa-state/alsa-state.bb
+++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
@@ -15,7 +15,7 @@ PR = "r3"
 SRC_URI = "\
   file://asound.conf \
   file://asound.state \
-  file://alsa-state \
+  file://alsa-state-init \
 "
 
 inherit update-rc.d
@@ -24,9 +24,9 @@ INITSCRIPT_NAME = "alsa-state"
 INITSCRIPT_PARAMS = "start 39 S . stop 31 0 6 ."
 
 do_install() {
-    sed -i -e "s:#STATEDIR#:${localstatedir}/lib/alsa:g" ${WORKDIR}/alsa-state
+    sed -i -e "s:#STATEDIR#:${localstatedir}/lib/alsa:g" ${WORKDIR}/alsa-state-init
     install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/alsa-state ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/alsa-state-init ${D}${sysconfdir}/init.d/alsa-state
 
     install -d ${D}/${localstatedir}/lib/alsa
     install -m 0644 ${WORKDIR}/asound.conf ${D}${sysconfdir}
diff --git a/meta/recipes-bsp/alsa-state/alsa-state/alsa-state b/meta/recipes-bsp/alsa-state/alsa-state/alsa-state-init
index 9850791..9850791 100755
--- a/meta/recipes-bsp/alsa-state/alsa-state/alsa-state
+++ b/meta/recipes-bsp/alsa-state/alsa-state/alsa-state-init



