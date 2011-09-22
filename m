Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R6mrc-0007Dj-C6
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 19:15:08 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8MH9mc3007370
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 10:09:48 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 22 Sep 2011 10:09:47 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2011 12:12:09 -0500
Message-ID: <aeb0b32b617dee13a5656591dc9d5a38a04d1c88.1316711477.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1316711477.git.mark.hatle@windriver.com>
References: <cover.1316711477.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/2] cups: Fix recipe to use the correct cups directories
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
X-List-Received-Date: Thu, 22 Sep 2011 17:15:08 -0000
Content-Type: text/plain

${libdir} is not used, instead they use a common ${exec_prefix}/lib
directory structure for helpers, filters, renderers, etc.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/cups/cups14.inc    |   20 ++++++++++++++------
 meta/recipes-extended/cups/cups_1.4.6.bb |    2 +-
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/cups/cups14.inc b/meta/recipes-extended/cups/cups14.inc
index e64f239..48f493d 100644
--- a/meta/recipes-extended/cups/cups14.inc
+++ b/meta/recipes-extended/cups/cups14.inc
@@ -64,16 +64,24 @@ python do_package_append() {
 
 PACKAGES =+ "${PN}-lib ${PN}-libimage"
 
+FILES_${PN} += "${exec_prefix}/lib/cups/backend \
+		${exec_prefix}/lib/cups/cgi-bin \
+		${exec_prefix}/lib/cups/filter \
+		${exec_prefix}/lib/cups/monitor \
+		${exec_prefix}/lib/cups/notifier \
+		${exec_prefix}/lib/cups/daemon \
+	       "
+
 FILES_${PN}-lib = "${libdir}/libcups.so.*"
 
 FILES_${PN}-libimage = "${libdir}/libcupsimage.so.*"
 
-FILES_${PN}-dbg += "${libdir}/cups/backend/.debug \
-                    ${libdir}/cups/cgi-bin/.debug \
-                    ${libdir}/cups/filter/.debug \
-                    ${libdir}/cups/monitor/.debug \
-                    ${libdir}/cups/notifier/.debug \
-                    ${libdir}/cups/daemon/.debug \
+FILES_${PN}-dbg += "${exec_prefix}/lib/cups/backend/.debug \
+                    ${exec_prefix}/lib/cups/cgi-bin/.debug \
+                    ${exec_prefix}/lib/cups/filter/.debug \
+                    ${exec_prefix}/lib/cups/monitor/.debug \
+                    ${exec_prefix}/lib/cups/notifier/.debug \
+                    ${exec_prefix}/lib/cups/daemon/.debug \
                    "
 
 #package the html for the webgui inside the main packages (~1MB uncompressed)
diff --git a/meta/recipes-extended/cups/cups_1.4.6.bb b/meta/recipes-extended/cups/cups_1.4.6.bb
index fd20dcc..0dc2d4a 100644
--- a/meta/recipes-extended/cups/cups_1.4.6.bb
+++ b/meta/recipes-extended/cups/cups_1.4.6.bb
@@ -1,6 +1,6 @@
 require cups14.inc
 
-PR = "r1"
+PR = "r2"
 DEPENDS += "libusb \
        ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-- 
1.7.3.4



