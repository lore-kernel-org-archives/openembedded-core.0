Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UXslB-0008Bi-Kw for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 14:37:19 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1UXsTt-0000Sa-On
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 14:19:25 +0200
Message-ID: <1367497165.14512.247.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 02 May 2013 13:19:25 +0100
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Subject: [PATCH] gcc-runtime: Avoid error when trying to remove nonexistent directories
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 May 2013 12:37:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If we didn't build libgomp then we won't have installed anything into
${infodir} or ${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude.  Check
whether those directories exist before trying to remove them, else we
will lose.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-devtools/gcc/gcc-configure-runtime.inc |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
index a9f77d9..977a98a 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
@@ -43,8 +43,12 @@ do_install () {
 		oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/$d/ install
 	done
 	rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/dir
-	rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude
-	rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
+	if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude ]; then
+		rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude
+	fi
+	if [ -d ${D}${infodir} ]; then
+		rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
+	fi
 	chown -R root:root ${D}
 }
 
-- 
1.7.10.4





