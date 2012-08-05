Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy70l-0004kh-F9
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:01:15 +0200
Received: by weyr6 with SMTP id r6so1441018wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=J089jkPkhS8qW2VT70HnCz56Km9BbSzZBTynfXqwclM=;
	b=RFDaK+BecRmqZTep0I3xG8g5azssOkgpTcxPUcLVcwgEe9jdjClUOdX0qmWBHQwjLg
	Shh0QiTLAFRj/N3oCfOEE6sNRDnpiITngJH25qZM4S+uwpcMvVIvSfodaIhTg/OSoCD8
	V2+Zims5pCULhEeuk4ls8vt4Y4yOvduu1LEV5gz9KhgubTuAEVk6LUccdYBDn6fFQ7Yn
	eBGgRo3/MstUgZEffpDpZWsjsV76UausZGMzSoFNoFckl+eoaaile2pfibUMQ+LzdRyU
	YNiMP8LxINnw9JzzM+etrfqim1c5T2foO34hRQct19NGqrexiRQSt9sFUMBDwei18HtZ
	86sg==
Received: by 10.180.74.33 with SMTP id q1mr12421231wiv.4.1344196171752;
	Sun, 05 Aug 2012 12:49:31 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.49.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:49:31 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:29 +0200
Message-Id: <1344196136-7643-2-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQnYfjbm1NJvM+GqQdjaXFq/evteN7m89l+LZY/8Rsn9hTLhxHsTUGc4I6Cj+koojnf8DhK7
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 01/28] xinetd: use ${sbindir} and ${sysconfdir} instead of /usr/sbin and /etc
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
X-List-Received-Date: Sun, 05 Aug 2012 20:01:15 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index a142143..2139e74 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8ad8615198542444f84d28a6cf226dd8"
 
 DEPENDS = ""
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.xinetd.org/xinetd-${PV}.tar.gz \
       file://xinetd.init \
@@ -38,15 +38,15 @@ do_install() {
 	# Same here, the Makefile does some really stupid things,
 	# but since we only want two files why not override
 	# do_install from autotools and doing it ourselfs?
-	install -d "${D}/usr/sbin"
-	install -d "${D}/etc/init.d"
-	install -d "${D}/etc/xinetd.d"
-	install -d "${D}/etc/default"
-	install -m 644 "${WORKDIR}/xinetd.conf" "${D}/etc"
-	install -m 755 "${WORKDIR}/xinetd.init" "${D}/etc/init.d/xinetd"
-	install -m 644 "${WORKDIR}/xinetd.default" "${D}/etc/default/xinetd"
-	install -m 755 "${S}/xinetd/xinetd" "${D}/usr/sbin"
-	install -m 755 "${S}/xinetd/itox" "${D}/usr/sbin"
+	install -d "${D}${sbindir}"
+	install -d "${D}${sysconfdir}/init.d"
+	install -d "${D}${sysconfdir}/xinetd.d"
+	install -d "${D}${sysconfdir}/default"
+	install -m 644 "${WORKDIR}/xinetd.conf" "${D}${sysconfdir}"
+	install -m 755 "${WORKDIR}/xinetd.init" "${D}${sysconfdir}/init.d/xinetd"
+	install -m 644 "${WORKDIR}/xinetd.default" "${D}${sysconfdir}/default/xinetd"
+	install -m 755 "${S}/xinetd/xinetd" "${D}${sbindir}"
+	install -m 755 "${S}/xinetd/itox" "${D}${sbindir}"
 }
 
 CONFFILES_${PN} = "${sysconfdir}/xinetd.conf"
-- 
1.7.7.6



