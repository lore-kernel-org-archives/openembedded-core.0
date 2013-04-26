Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UVhDI-0007V5-8A for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 13:53:18 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1UVgw9-000644-Ep
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 13:35:33 +0200
Message-ID: <1366976132.14512.100.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Apr 2013 12:35:32 +0100
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Subject: [PATCH] pango: Avoid build failure if no modules were installed
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
X-List-Received-Date: Fri, 26 Apr 2013 11:53:19 -0000
X-List-Received-Date: Fri, 26 Apr 2013 11:53:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If pango is configured --with-included-modules then the modules
directory may not exist.  This leads to python traceback spew and
a build failure when trying to run do_split_packages().

Fix this by passing recursive=True to do_split_packages(), which has
the side-effect of making it ignore nonexistent directories.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-graphics/pango/pango.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index f622903..0051bd2 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -72,8 +72,8 @@ python populate_packages_prepend () {
     prologue = d.getVar("postinst_prologue", True)
 
     modules_root = d.expand('${libdir}/pango/${LIBV}/modules')
-
-    do_split_packages(d, modules_root, '^pango-(.*)\.so$', 'pango-module-%s', 'Pango module %s', prologue + '${bindir}/${MLPREFIX}pango-querymodules > /etc/pango/${MLPREFIX}pango.modules')
+    
+    do_split_packages(d, modules_root, '^pango-(.*)\.so$', 'pango-module-%s', 'Pango module %s', prologue + '${bindir}/${MLPREFIX}pango-querymodules > /etc/pango/${MLPREFIX}pango.modules', recursive=True)
 }
 
 FILES_${PN} = "${sysconfdir}/pango/* ${bindir}/* ${libdir}/libpango*${SOLIBS}"
-- 
1.7.10.4





