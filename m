Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UVNwV-0007Vw-DZ for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 17:18:40 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1UVNfN-0004Ib-Ui
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 17:00:58 +0200
Message-ID: <1366902057.14512.94.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Apr 2013 16:00:57 +0100
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Subject: [PATCH] libpcre: Make readline dependency conditional on PACKAGECONFIG[pcretest-readline]
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
X-List-Received-Date: Thu, 25 Apr 2013 15:18:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The only place in pcre that requires readline is pcretest, and even there it's
optional.  This allows the dependency to be removed unless specifically requested.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-support/libpcre/libpcre_8.32.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libpcre/libpcre_8.32.bb b/meta/recipes-support/libpcre/libpcre_8.32.bb
index 4d17741..a2a8d80 100644
--- a/meta/recipes-support/libpcre/libpcre_8.32.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.32.bb
@@ -20,7 +20,9 @@ S = "${WORKDIR}/pcre-${PV}"
 FILESPATH .= ":${@base_set_filespath([bb.which(BBPATH, 'recipes-support/libpcre/files', direction=True)], d)}"
 
 PROVIDES += "pcre"
-DEPENDS += "bzip2 zlib readline"
+DEPENDS += "bzip2 zlib"
+
+PACKAGECONFIG[pcretest-readline] = "--enable-pcretest-libreadline,--disable-pcretest-libreadline,readline,"
 
 inherit autotools binconfig
 
-- 
1.7.10.4





