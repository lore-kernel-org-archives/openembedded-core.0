Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy70v-0004kh-1z
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:01:25 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1441018wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=P1pQ1h36rJbFg/6ISdMDObCOhu7xMeiz3dX2cZB5g4E=;
	b=Fa7jwTVSugfQJFClGxMT1FRpMYuTnLAN7g6RqpfGHdINPclBaTTkmBND4h4szGpPaX
	6EECwvQV4V/ot3znE/HwCggRCRGWRxYUH1ZUe8/yE4hqpwKNXxUv0AI98JDIsQl5iLWO
	uJn33AxSLEbEIe9D6suOjo1SboNJxJx6IYNAysWLLkdOFF+FrLh+ZwjBKKIWkFhDrY7/
	VHB0rS0DFuc54YH11/ivjzOfwj5bn8UVDFATmhUc6baHILU9HB1TG+6tDlncP2q1874P
	enA5DXWpsZ1M96A5TLtDRYe1tnSD2hN0DNYEEXqYfUP3ksIGYi1uKNbXyUk4CaM4nVCq
	/nbw==
Received: by 10.216.139.145 with SMTP id c17mr4208079wej.175.1344196183378;
	Sun, 05 Aug 2012 12:49:43 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.49.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:49:42 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:34 +0200
Message-Id: <1344196136-7643-7-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQms4z7DgeBNXHBdlcILgu3zihqSnAxFxXcD8keZ2rN/kRA1K3WRbOtGmfOKXpgar/ohDgum
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 06/28] cronie: use variables instead of hardcoded paths
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
X-List-Received-Date: Sun, 05 Aug 2012 20:01:25 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-extended/cronie/cronie_1.4.8.bb |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/cronie/cronie_1.4.8.bb b/meta/recipes-extended/cronie/cronie_1.4.8.bb
index 2d25627..ce59437 100644
--- a/meta/recipes-extended/cronie/cronie_1.4.8.bb
+++ b/meta/recipes-extended/cronie/cronie_1.4.8.bb
@@ -18,7 +18,7 @@ DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)}"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
            file://crond.init \
@@ -61,14 +61,14 @@ do_install_append () {
 	# below setting is necessary to allow normal user using crontab
 
 	# setgid for crontab binary
-	chown root:crontab ${D}/usr/bin/crontab
-	chmod 2755 ${D}/usr/bin/crontab
+	chown root:crontab ${D}${bindir}/crontab
+	chmod 2755 ${D}${bindir}/crontab
 
 	# allow 'crontab' group write to /var/spool/cron
-	chown root:crontab ${D}/var/spool/cron
-	chmod 770 ${D}/var/spool/cron
+	chown root:crontab ${D}${localstatedir}/spool/cron
+	chmod 770 ${D}${localstatedir}/spool/cron
 
-	chmod 600 ${D}/etc/crontab
+	chmod 600 ${D}${sysconfdir}/crontab
 }
 
 FILES_${PN} += "${sysconfdir}/cron*"
-- 
1.7.7.6



