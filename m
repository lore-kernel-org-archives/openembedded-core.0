Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QRRVb-0002uv-1X for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 18:09:32 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QRRSZ-0000nj-Pv
	for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 18:06:23 +0200
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Organization: Phil Blundell Consulting Ltd
Date: Tue, 31 May 2011 17:06:22 +0100
Message-ID: <1306857982.2529.13.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] binconfig: improve handling of empty prefixes
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
X-List-Received-Date: Tue, 31 May 2011 16:09:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This is a backport of 952e5e2b7a5c1deefc939594d40b81a71fb16a54 from oe master.

Without this the script mangling goes very wrong if ${prefix}="".  There
isn't really any way to fix this in the completely general case, but
this patch does work with the two cases I tested (freetype and
gpg-error) which were unusable previously.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/binconfig.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/binconfig.bbclass b/meta/classes/binconfig.bbclass
index 8e22d2d..3deb541 100644
--- a/meta/classes/binconfig.bbclass
+++ b/meta/classes/binconfig.bbclass
@@ -6,8 +6,8 @@ def get_binconfig_mangle(d):
 		s += " -e 's:=%s${libdir}:=\\1OELIBDIR:;'" % optional_quote
 		s += " -e 's:=%s${includedir}:=\\1OEINCDIR:;'" % optional_quote
 		s += " -e 's:=%s${datadir}:=\\1OEDATADIR:'" % optional_quote
-		s += " -e 's:=%s${prefix}:=\\1OEPREFIX:'" % optional_quote
-		s += " -e 's:=%s${exec_prefix}:=\\1OEEXECPREFIX:'" % optional_quote
+		s += " -e 's:=%s${prefix}/:=\\1OEPREFIX/:'" % optional_quote
+		s += " -e 's:=%s${exec_prefix}/:=\\1OEEXECPREFIX/:'" % optional_quote
 		s += " -e 's:-L${libdir}:-LOELIBDIR:;'"
 		s += " -e 's:-I${includedir}:-IOEINCDIR:;'"
 		s += " -e 's:OELIBDIR:${STAGING_LIBDIR}:;'"
-- 
1.7.1





