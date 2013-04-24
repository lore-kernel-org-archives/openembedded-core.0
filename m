Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UV30m-0005iP-90 for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 18:57:44 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1UV2jg-0002gL-Cv
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 18:40:00 +0200
Message-ID: <1366821599.14512.59.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 17:39:59 +0100
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Subject: [PATCH] eglibc: Avoid "installed but not shipped" warning for ld.so.conf
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
X-List-Received-Date: Wed, 24 Apr 2013 16:57:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If USE_LDCONFIG is not set then we won't ship ld.so.conf.  However,
eglibc still installs it which leads to a QA warning.  Prevent that by
removing the file (and the subsequently-empty directory /etc) in this
situation.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-core/eglibc/eglibc-package.inc |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 88a00a4..f144273 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -84,6 +84,16 @@ do_install_append () {
 	if [ -e "${D}${infodir}/dir" ]; then
 		rm -f ${D}${infodir}/dir
 	fi
+
+	if [ "${USE_LDCONFIG}" != "1" ]; then
+		# We won't ship this file (see FILES above) so let's not install it
+		rm -f ${D}${sysconfdir}/ld.so.conf
+		# This directory will be empty now so remove it too.
+		# But check whether it exists first, since it won't for eglibc-initial.
+		if [ -d ${D}${sysconfdir} ]; then
+			rmdir ${D}${sysconfdir}
+		fi
+	fi
 }
 
 do_install_locale () {
-- 
1.7.10.4





