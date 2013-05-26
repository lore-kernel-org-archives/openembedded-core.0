Return-Path: <net147@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 063CD61A80
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 01:44:00 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id q11so5414171pdj.38
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2013 18:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=6rzBRUiBh5AAVQujzxIgkL+Deh7uuqZma14Umq5ca5A=;
	b=Gc0+KXPVQGRyPsdcxFDrAZCmlbRbKz9Yd8yig2Y2dE+PepAfpaRcp5tbhvDTdOr/+h
	c5ZjOfIgOpGRoCjNtXXNgn8NSzjp3a3YB9zA+XZBRR3qITJlux3OzweVjpL1w6LZzTq+
	8gkKOEcjeJug2d59BapBzyIf/JC7aYcvfo9XLJ3Co7rAdslvFuiQlsFvp/j0d0V/9cBA
	HA2UmielvJ5Se0rNEXnNLVSbNNkJELkoJHN7d9EkaURdrsTx52lpdsMl+ZcfgOsZmo2n
	K8CxNL4WW9HViJ02SfctcaoC79I9+pa6z9rvOcMvUGQ4uvLGhbjRlFaUq9VEaz5OPbh7
	PXJQ==
X-Received: by 10.66.2.199 with SMTP id 7mr24213949paw.176.1369532640934;
	Sat, 25 May 2013 18:44:00 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	qi1sm24053237pac.21.2013.05.25.18.43.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 25 May 2013 18:43:59 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 May 2013 11:57:17 +1000
Message-Id: <1369533437-328-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH v3] resolvconf: remove /var/volatile/run/resolvconf/interface from package
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
X-List-Received-Date: Sun, 26 May 2013 01:44:00 -0000

- Remove /etc/resolvconf/run/interface from package as it actually uses
/etc/resolvconf/run/interface
- Create /var/run/resolvconf/interface on startup using
populate-volatiles.sh and tmpfiles.d for systemd
- Create symbolic link from /etc/resolvconf/run to /var/run/resolvconf

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-connectivity/resolvconf/resolvconf_1.72.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.72.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.72.bb
index a96dbff..fc12215 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.72.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.72.bb
@@ -23,7 +23,16 @@ do_compile () {
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
+	ln -snf ${localstatedir}/run/${P} ${D}${sysconfdir}/${P}/run
+	install -d ${D}${sysconfdir} ${D}${base_sbindir}
 	install -d ${D}${mandir}/man8 ${D}${docdir}/${P}
 	cp -pPR etc/* ${D}${sysconfdir}/
 	chown -R root:root ${D}${sysconfdir}/
-- 
1.8.2.3


