Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QfH6M-000718-FC for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 21:52:38 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1QfH2d-0007TF-Dx
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 21:48:47 +0200
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 08 Jul 2011 20:48:39 +0100
Message-ID: <1310154519.18564.17.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: [PATCH] eglibc: avoid copying ${libdir} twice if it's the same as ${base_libdir}
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
X-List-Received-Date: Fri, 08 Jul 2011 19:52:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Otherwise the following "mv ${libdir}/gconv" fails because the destination
has already been created.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-core/eglibc/eglibc-package.inc |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 1c6626c..f29417f 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -91,9 +91,11 @@ inherit libc-common
 do_install_locale () {
 	dest=${D}/${includedir}/eglibc-locale-internal-${MULTIMACH_TARGET_SYS}
 	install -d ${dest}${base_libdir} ${dest}${bindir} ${dest}${libdir} ${dest}${datadir}
-	cp -fpPR ${D}${base_libdir}/* ${dest}${base_libdir}
+	if [ "${base_libdir}" != "${libdir}" ]; then
+		cp -fpPR ${D}${base_libdir}/* ${dest}${base_libdir}
+	fi
 	mv ${D}${bindir}/localedef ${dest}${bindir}
-        mv ${D}${libdir}/gconv ${dest}${libdir}
+	mv ${D}${libdir}/gconv ${dest}${libdir}
 	cp -fpPR ${D}${libdir}/* ${dest}${libdir}
         mv ${D}${datadir}/i18n ${dest}${datadir}
 	cp -fpPR ${D}${datadir}/* ${dest}${datadir}
-- 
1.7.4.1





