Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5772A719BA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 23:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NNOhlq001322; Mon, 23 Jan 2017 23:24:43 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gGvvxymj2sDi; Mon, 23 Jan 2017 23:24:42 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NNObcW001317
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Jan 2017 23:24:38 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cVnyX-000397-1m; Mon, 23 Jan 2017 23:24:37 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 23:24:35 +0000
Message-Id: <1485213875-12052-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] gobject-introspection: Fix sysroot postinst scripting error
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
X-List-Received-Date: Mon, 23 Jan 2017 23:24:45 -0000

Clearly the echo into ld.so.conf doesn't make sense and there was a cut and paste
error when writing this code. As long as the directory existed, the builds worked
so it created a race. Fix it as people hit build failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-gnome/gobject-introspection/gobject-introspection_1.50.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.50.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.50.0.bb
index 15c8c00..509fc5f 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.50.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.50.0.bb
@@ -171,7 +171,7 @@ gi_ldsoconf_sysroot_preprocess () {
 	mkdir -p ${SYSROOT_DESTDIR}${bindir}
 	dest=${SYSROOT_DESTDIR}${bindir}/postinst-ldsoconf-${PN}
 	echo "#!/bin/sh" > $dest
-	echo "echo mkdir -p ${STAGING_DIR_TARGET}${sysconfdir} > ${STAGING_DIR_TARGET}${sysconfdir}/ld.so.conf" >> $dest
+	echo "mkdir -p ${STAGING_DIR_TARGET}${sysconfdir}" >> $dest
 	echo "echo ${base_libdir} >> ${STAGING_DIR_TARGET}${sysconfdir}/ld.so.conf" >> $dest
 	echo "echo ${libdir} >> ${STAGING_DIR_TARGET}${sysconfdir}/ld.so.conf" >> $dest
 	chmod 755 $dest
-- 
2.7.4


