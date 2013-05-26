Return-Path: <net147@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id D79EA61A80
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 02:09:59 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rr4so5591885pbb.34
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2013 19:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=pYuwRjcKIqybIF6T7fwAfcy0LLkt6t+4i1lxd0s4D8o=;
	b=DW31x8+k1U7kzpLU88t+JYDILET06VuG5/R8ZfX6uSEyYAOtlhcXiv7kMxwY1WrFtq
	DAWKEo/U1EMvkhyy8cYZWs8mvWkV0RVl6RnkVcduZpBJAbvs3/hYycxVKpxzG9NpVXs1
	4U4t8Lvr41id/H3y6O3z1VOpUOBesbx1F/BWmOQTyJ7oMqITIGEU95i784tRqZVshiqT
	PTLTt2izU0hJ6dIl7t/usm+ewIbmqBcIOHic0qnzLneh4/p84qXmvs4EkslLEOwkvTIj
	WUnjGvG6SVlUOz7SyQWlh5PMcoFpHZFd3xarNUtPwPqBMrF5RPE6OJR3gU2kO/5Leisd
	WLYg==
X-Received: by 10.66.121.132 with SMTP id lk4mr24691234pab.1.1369534200896;
	Sat, 25 May 2013 19:10:00 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	tb7sm22519723pbc.14.2013.05.25.19.09.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 25 May 2013 19:09:59 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 May 2013 12:21:34 +1000
Message-Id: <1369534894-1465-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH v4] resolvconf: remove /var/volatile/run/resolvconf/interface from package
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
X-List-Received-Date: Sun, 26 May 2013 02:10:00 -0000

- Remove /etc/resolvconf/run/interface from package as it actually uses
/etc/resolvconf/run/interface
- Create /var/run/resolvconf/interface on startup using
populate-volatiles.sh and tmpfiles.d for systemd
- Create symbolic link from /etc/resolvconf/run to /var/run/resolvconf

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-connectivity/resolvconf/resolvconf_1.72.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.72.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.72.bb
index a96dbff..c41657a 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.72.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.72.bb
@@ -23,7 +23,17 @@ do_compile () {
 }
 
 do_install () {
-	install -d ${D}${sysconfdir} ${D}${base_sbindir} ${D}${localstatedir}/volatile/run/resolvconf/interface
+	install -d ${D}${sysconfdir}/default/volatiles
+	echo "d root root 0755 ${localstatedir}/run/${P}/interface none" \
+	     > ${D}${sysconfdir}/default/volatiles/99_resolvconf
+	if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/tmpfiles.d
+		echo "d /run/${P}/interface - - - -" \
+		     > ${D}${sysconfdir}/tmpfiles.d/resolvconf.conf
+	fi
+	install -d ${D}${sysconfdir}/${P}
+	ln -snf ${localstatedir}/run/${P} ${D}${sysconfdir}/${P}/run
+	install -d ${D}${sysconfdir} ${D}${base_sbindir}
 	install -d ${D}${mandir}/man8 ${D}${docdir}/${P}
 	cp -pPR etc/* ${D}${sysconfdir}/
 	chown -R root:root ${D}${sysconfdir}/
-- 
1.8.2.3


