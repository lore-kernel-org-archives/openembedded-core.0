Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UVNWm-0004sC-35 for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 16:52:13 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1UVNFe-0004CL-Sh
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 16:34:22 +0200
Message-ID: <1366900461.14512.92.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2013 15:34:21 +0100
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Subject: [PATCH] glib: Add --disable-man to configure arguments
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
X-List-Received-Date: Thu, 25 Apr 2013 14:52:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Without this, glib will probe for the existence of xsltproc and use that
to decide whether or not it wants to generate manpages.  This has two
consequences, neither of them good:

a) the result of the build will vary depending on whether xsltproc
happens to be installed in either the native sysroot or the host
environment; and

b) if xsltproc does happen to be installed but docbook-xsl isn't, the
build will fail with "I/O error" messages.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-core/glib-2.0/glib.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 42c34c3..d5fa0a3 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -25,7 +25,7 @@ inherit autotools gettext gtk-doc pkgconfig ptest
 
 S = "${WORKDIR}/glib-${PV}"
 
-CORECONF = "--disable-dtrace --disable-fam --disable-libelf --disable-systemtap"
+CORECONF = "--disable-dtrace --disable-fam --disable-libelf --disable-systemtap --disable-man"
 
 PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-modular-tests', '--disable-modular-tests', d)}"
 EXTRA_OECONF = "--enable-included-printf=no ${CORECONF} ${PTEST_CONF}"
-- 
1.7.10.4





