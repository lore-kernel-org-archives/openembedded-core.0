Return-Path: <net147@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1774860897
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 03:49:26 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id md12so2393939pbc.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 20:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=pVQu2pj+UQLD85h7D0Z43Ltg4OqMWRQb4jq2hlTOpK8=;
	b=vSRUn7R4pxLY+qyi75y9dXDDsGrtaoCu1SuXqmN0DlIp9DsrI9YDcw5Y3nqDgmRtbu
	z3cmUJ6pXe/kXk/KAFTsj7Qqspy4lvcr7Q9cKp0VYLlCTBfZQuDrkT5W8RIR01q7Z/S/
	iPHlw5jbuCsbhQjIIzlT+xQxIiwthKm2Jporjth1gc+z3xIYZtiyh9f3XLOgJ0J4PdIG
	lC2s15R8oiItvcyKnCKxjmKFaKJxPU8aB6NRsWfocemw2hMHvH8F+8pJ5iyaiNEYBhAb
	QjBS5tsF7KkM3RFR1YgHie0q6+6VZvtsCNAgW+KtZ/BH0whjESU0Grd2PtDuSvD6ynKS
	P/Yw==
X-Received: by 10.68.171.36 with SMTP id ar4mr10610967pbc.195.1369280967519;
	Wed, 22 May 2013 20:49:27 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id do4sm9893140pbc.8.2013.05.22.20.49.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 May 2013 20:49:26 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2013 14:02:14 +1000
Message-Id: <1369281734-7989-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH] dbus: remove /var/run from package as it is created on startup
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
X-List-Received-Date: Thu, 23 May 2013 03:49:26 -0000

/var/run is a tmpfs that is created on startup.
For sysvinit, /var/run/dbus is created by populate-volatiles.sh.
For systemd, /var/run/dbus is created implicitly by dbus.socket when
creating a listen stream socket at /var/run/dbus/system_bus_socket.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/dbus/dbus.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 2be5bda..8055824 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -101,9 +101,9 @@ do_install() {
 	     > ${D}${sysconfdir}/default/volatiles/99_dbus
 
 
-	mkdir -p ${D}${localstatedir}/run/dbus ${D}${localstatedir}/lib/dbus
+	mkdir -p ${D}${localstatedir}/lib/dbus
 
-	chown messagebus:messagebus ${D}${localstatedir}/run/dbus ${D}${localstatedir}/lib/dbus
+	chown messagebus:messagebus ${D}${localstatedir}/lib/dbus
 
 	chown root:messagebus ${D}${libexecdir}/dbus-daemon-launch-helper
 	chmod 4755 ${D}${libexecdir}/dbus-daemon-launch-helper
@@ -113,6 +113,9 @@ do_install() {
 
 	# Remove empty testexec directory as we don't build tests
 	rm -rf ${D}${libdir}/dbus-1.0/test
+
+	# Remove /var/run as it is created on startup
+	rm -rf ${D}${localstatedir}/run
 }
 
 do_install_class-native() {
-- 
1.8.2.3


