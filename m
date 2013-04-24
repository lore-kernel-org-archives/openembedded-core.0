Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UUyNn-0000sx-CS for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 14:01:14 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1UUy6h-00025Q-Ox
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 13:43:27 +0200
Message-ID: <1366803807.14512.26.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 12:43:27 +0100
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Subject: [PATCH] libxslt: Avoid regenerating manpage during "make install"
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
X-List-Received-Date: Wed, 24 Apr 2013 12:01:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The timestamps in libxslt-1.1.28.tar.gz (specifically) are rather hokey, making
the source files for the documentation appear newer than the generated output:

-rw-rw-r-- 500/500       16307 2012-11-21 07:22 libxslt-1.1.28/doc/xsltproc.xml
-rw-rw-r-- 500/500        7082 2012-09-12 07:24 libxslt-1.1.28/doc/xsltproc2.html
-rw-rw-r-- 500/500        9475 2012-09-04 15:26 libxslt-1.1.28/doc/xsltproc.html
-rw-rw-r-- 500/500        8256 2012-11-21 06:03 libxslt-1.1.28/doc/xsltproc.1

This causes make to decide that xsltproc.1 needs to be regenerated during the
installation process.  However, this requires a native xsltproc binary which
may not be available, leading to errors like:

| make[2]: /usr/bin/xsltproc: Command not found
| make[2]: [xsltproc.1] Error 127 (ignored)

Adding DEPENDS_class-target = "libxslt-native", or installing xsltproc in the
host environment, fixes the above but the documentation still doesn't build:

| I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
| warning: failed to load external entity "http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl"
| error
| xsltParseStylesheetFile : cannot parse http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
| compilation error: file ./xsltproc.xml line 10 element refentry
| xsltParseStylesheetProcess : document is not a stylesheet

And in any case, requiring libxslt-native would increase build time for no
real benefit.  So, let's just adjust the timestamp on the shipped copy of
xsltproc.1 to make it appear newer than the source files.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-support/libxslt/libxslt_1.1.28.bb |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.28.bb b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
index 3f89e78..887f290 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.28.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
@@ -21,6 +22,10 @@ inherit autotools pkgconfig binconfig lib_package
 # We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header
 do_configure_prepend () {
 	sed -i -e 's/ansidecl.h//' ${S}/configure.in
+
+	# The timestamps in the 1.1.28 tarball are messed up causing this file to
+	# appear out of date.  Touch it so that we don't try to regenerate it.
+	touch ${S}/doc/xsltproc.1
 }
 
 EXTRA_OECONF = "--without-python --without-debug --without-mem-debug --without-crypto"
-- 
1.7.10.4





