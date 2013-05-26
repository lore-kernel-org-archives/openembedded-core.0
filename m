Return-Path: <net147@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3CA34608F7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 07:27:37 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id jt11so5707719pbb.38
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 00:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/VQ5ot/KnftIS9RhZ7nPmPDPHmiVz38YTDMV3s5jMAI=;
	b=VcMGLbO/AbUGXvXj+QgCU1WScEyF8yuK8LS30Rb6qAwKWLfUaELlQxem1Iqha32rh4
	+n/RnWV+Vt+LOAsfHECW2afMy9BYyNpodOD/i/GgjyX4BYvcmuCEkv5LXpOfeYkC2Ure
	rZfo1qg+599bLMZGEKEv88uG5S77lGi4MSfftGwS5JaZ5EQndhck5WAw+MbzSzik0zi+
	Zes0CM7NKpKTXxzSOmqRvOOMMwyJzjynvadyIUdjKex0km/q+D2yNFK2TuXV7oKK+t3u
	BUPzJhGej+6y9EAsLNgfqOzspRxnQCsQWgFLp1p1HgE9lSSEYyilyLRTfbKxPwAQpv5J
	5S6A==
X-Received: by 10.68.177.33 with SMTP id cn1mr24572985pbc.189.1369553258036;
	Sun, 26 May 2013 00:27:38 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	gp10sm22329652pbc.18.2013.05.26.00.27.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 26 May 2013 00:27:36 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 May 2013 17:40:58 +1000
Message-Id: <1369554058-11484-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH v5] resolvconf: remove /var/volatile/run/resolvconf/interface from package
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
X-List-Received-Date: Sun, 26 May 2013 07:27:37 -0000

- Remove /etc/resolvconf/run/interface from package as it actually uses
/etc/resolvconf/run/interface
- Create /var/run/resolvconf/interface on startup using
populate-volatiles.sh and tmpfiles.d for systemd
- Create symbolic link from /etc/resolvconf/run to /var/run/resolvconf

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../resolvconf/resolvconf_1.72.bb                  | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.72.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.72.bb
index a96dbff..4fe70f5 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.72.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.72.bb
@@ -23,7 +23,17 @@ do_compile () {
 }
 
 do_install () {
-	install -d ${D}${sysconfdir} ${D}${base_sbindir} ${D}${localstatedir}/volatile/run/resolvconf/interface
+	install -d ${D}${sysconfdir}/default/volatiles
+	echo "d root root 0755 ${localstatedir}/run/${BPN}/interface none" \
+	     > ${D}${sysconfdir}/default/volatiles/99_resolvconf
+	if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/tmpfiles.d
+		echo "d /run/${BPN}/interface - - - -" \
+		     > ${D}${sysconfdir}/tmpfiles.d/resolvconf.conf
+	fi
+	install -d ${D}${sysconfdir}/${BPN}
+	ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
+	install -d ${D}${sysconfdir} ${D}${base_sbindir}
 	install -d ${D}${mandir}/man8 ${D}${docdir}/${P}
 	cp -pPR etc/* ${D}${sysconfdir}/
 	chown -R root:root ${D}${sysconfdir}/
@@ -31,3 +41,13 @@ do_install () {
 	install -m 0644 README ${D}${docdir}/${P}/
 	install -m 0644 man/resolvconf.8 ${D}${mandir}/man8/
 }
+
+pkg_postinst_${PN} () {
+	if [ -z "$D" ]; then
+		if command -v systemd-tmpfiles >/dev/null; then
+			systemd-tmpfiles --create
+		elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
+			${sysconfdir}/init.d/populate-volatile.sh update
+		fi
+	fi
+}
-- 
1.8.2.3


