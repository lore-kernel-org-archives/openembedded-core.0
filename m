Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RMKpQ-0001np-W2
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 15:33:09 +0100
Received: by wyh5 with SMTP id 5so2530589wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2011 07:26:59 -0700 (PDT)
Received: by 10.216.82.145 with SMTP id o17mr4326528wee.78.1320416818790;
	Fri, 04 Nov 2011 07:26:58 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id
	ei16sm16245854wbb.21.2011.11.04.07.26.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Nov 2011 07:26:58 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2011 15:26:53 +0100
Message-Id: <1320416813-22888-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] lighttpd 1.4.29: rename index.html to avoid clashes with DL_DIR
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
X-List-Received-Date: Fri, 04 Nov 2011 14:33:09 -0000

As Martin Jansa pointed out before, bitbake will silently peek in DL_DIR before FILESPATH and use files from there if found.

The failure mode for lighttpd involves a 404 redirect placing index.html into DL_DIR, which will end up in the lighttpd packages. In my specific case iproute2 hit the linuxfoundation 404 redirect so lighttpd.ipk now serves the linuxfoundation frontpage :)

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-extended/lighttpd/files/index.html    |    1 -
 .../lighttpd/files/index.html.lighttpd             |    1 +
 meta/recipes-extended/lighttpd/lighttpd_1.4.29.bb  |    6 +++---
 3 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-extended/lighttpd/files/index.html
 create mode 100644 meta/recipes-extended/lighttpd/files/index.html.lighttpd

diff --git a/meta/recipes-extended/lighttpd/files/index.html b/meta/recipes-extended/lighttpd/files/index.html
deleted file mode 100644
index cd25bf1..0000000
--- a/meta/recipes-extended/lighttpd/files/index.html
+++ /dev/null
@@ -1 +0,0 @@
-<html><body><h1>It works!</h1></body></html>
\ No newline at end of file
diff --git a/meta/recipes-extended/lighttpd/files/index.html.lighttpd b/meta/recipes-extended/lighttpd/files/index.html.lighttpd
new file mode 100644
index 0000000..cd25bf1
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/files/index.html.lighttpd
@@ -0,0 +1 @@
+<html><body><h1>It works!</h1></body></html>
\ No newline at end of file
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.29.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.29.bb
index c1d5f81..9fdb5f6 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.29.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.29.bb
@@ -16,10 +16,10 @@ RDEPENDS_${PN} += " \
                lighttpd-module-staticfile \
 "
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.bz2 \
-        file://index.html \
+        file://index.html.lighttpd \
         file://lighttpd.conf \
         file://lighttpd \
 "
@@ -48,7 +48,7 @@ do_install_append() {
     install -d ${D}${sysconfdir}/init.d ${D}/www/logs ${D}/www/pages/dav ${D}/www/var
     install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
-    install -m 0644 ${WORKDIR}/index.html ${D}/www/pages/
+    install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html
 }
 
 FILES_${PN} += "${sysconfdir} /www"
-- 
1.7.2.5



