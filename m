Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy71E-0004kU-Te
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:01:44 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1834570wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=dQ2DqQByOVQkEoxDIbR1kryDaYxt2Rv/W/ws1Gfl6HI=;
	b=loRKSfA9yeu+iVyoEpCFiX7RXiUv6Lm7XxZJNhjH3hr5vtkmhMdl9vlY0dadOoyc+O
	2O/GSejVgjw/Qis8txOk6JRup6rnBzAZgGQkb15MsYyHLn5n+6X3w0ob0ZoXIHgFR7NS
	n/HZ7ioIdYHRHnckykcGCFRemqK0KyadCJoDFpeYRN+VyAw1yQ1WcUXYd3QrYB9AUAYr
	s47HxcGrL2o4yqXOkJbh2bJrWWWHlFOGpAwDy3zyKfOyDos2fMt5uYLDES9yLWSrmpc3
	RnK/J224jn6zU//7TPJFOoIl7RdNnjaN+fD0qyBBeSRaylk0i2T6gfDGpBn6bcp8tLOe
	jXkA==
Received: by 10.216.138.13 with SMTP id z13mr4213831wei.65.1344196203332;
	Sun, 05 Aug 2012 12:50:03 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.50.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:50:02 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:43 +0200
Message-Id: <1344196136-7643-16-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQky2W+MVgFuiJ6D24XrxgQNefh5MBl0SR1WL8jCBU1I3lAbzaqyAVfYIeIOPvtYta8SoHgS
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 15/28] at: use ${base_sbindir} instead of /sbin for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 20:01:45 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-extended/at/at_3.1.13.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/at/at_3.1.13.bb b/meta/recipes-extended/at/at_3.1.13.bb
index 9af3569..ab20eb8 100644
--- a/meta/recipes-extended/at/at_3.1.13.bb
+++ b/meta/recipes-extended/at/at_3.1.13.bb
@@ -11,7 +11,7 @@ PAM_DEPS = "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
 
 RCONFLICTS_${PN} = "atd"
 RREPLACES_${PN} = "atd"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
     file://configure.patch \
@@ -51,8 +51,8 @@ do_install () {
 	install -d ${D}${sysconfdir}/rcS.d
 	install -m 0755    ${WORKDIR}/S99at		${D}${sysconfdir}/init.d/atd
 	ln -sf ../init.d/atd ${D}${sysconfdir}/rcS.d/S99at
-	cp -r ${D}/usr/doc/at ${D}${docdir}/
-	rm -rf ${D}/usr/doc
+	cp -r ${D}${prefix}/doc/at ${D}${docdir}/
+	rm -rf ${D}${prefix}/doc
 
 	for feature in ${DISTRO_FEATURES}; do
 		if [ "$feature" = "pam" ]; then
-- 
1.7.7.6



