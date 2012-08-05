Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy71R-0004kh-L4
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:01:58 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1441018wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=Rn6OQRKk2umICyGeKgHVUO6dqHkmTgLtMpxEq2C3qdI=;
	b=cA1KnJq53+Ae5BOgNcmiZ0buk31wAmy+dymzO2aD4ALYirlaF7bKM34ZYwtonTRNn9
	mjV5qMeFzSpUOl5VUiCvQesBzPIQMfaY/ygBwtId8zEerstIGnylQGRQnk5cs3vTSuVT
	4TZiDObfIotpw0+27y/zgz2L5e22V4+M2+RT4NCz6zTm4/4VzgD0AfEZkaMp/g2OGvA/
	7m23lzTsgA0KBZ8llr+/yNt4HW/t37KSjJPRFIuaBIXIJKLozbXMX1qzCQG1GHfQffK/
	PU6Upt7brWUM0O+dCFCw/ir0VJj6Jdd+1mNfYw3udYC7p64mxeMhLdVxB2ja8H7+Zktr
	gXdQ==
Received: by 10.216.255.146 with SMTP id j18mr4161510wes.163.1344196216255;
	Sun, 05 Aug 2012 12:50:16 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.50.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:50:15 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:47 +0200
Message-Id: <1344196136-7643-20-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQkIt8gaCqMD2QrIMwb7D11v+ztlqOaFr+VsjpKKykBQ80AE+BFW6b833Epz2Uuex+a5kHpo
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 19/28] libpam: use ${localstatedir} and ${sysconfdir} instead of /var and /etc
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
X-List-Received-Date: Sun, 05 Aug 2012 20:01:58 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-extended/pam/libpam_1.1.5.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.5.bb b/meta/recipes-extended/pam/libpam_1.1.5.bb
index dd75d42..c035aaf 100644
--- a/meta/recipes-extended/pam/libpam_1.1.5.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.5.bb
@@ -9,7 +9,7 @@ SECTION = "base"
 LICENSE = "GPLv2+ | BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ca0395de9a86191a078b8b79302e3083"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "https://fedorahosted.org/releases/l/i/linux-pam/Linux-PAM-${PV}.tar.bz2 \
            file://99_pam \
@@ -79,9 +79,9 @@ do_install() {
 	autotools_do_install
 
 	# don't install /var/run when populating rootfs. Do it through volatile
-	rm -rf ${D}/var
+	rm -rf ${D}${localstatedir}
 	install -d ${D}${sysconfdir}/default/volatiles
-	install -m 0644 ${WORKDIR}/99_pam ${D}/etc/default/volatiles
+	install -m 0644 ${WORKDIR}/99_pam ${D}${sysconfdir}/default/volatiles
 
 	install -d ${D}${sysconfdir}/pam.d/     
 	install -m 0644 ${WORKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
-- 
1.7.7.6



