Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TSrLc-0006sp-Rh
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 16:33:53 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TSr8W-0000nd-Ni
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 16:20:21 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Oct 2012 15:20:19 +0000
X-Mailer: Evolution 3.0.2- 
Message-ID: <1351524020.13864.17.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] openssl: Use ${CFLAGS} not ${FULL_OPTIMIZATION}
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
X-List-Received-Date: Mon, 29 Oct 2012 15:33:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The latter variable is only applicable for target builds and could
result in passing incompatible options (and/or failing to pass
required options) to ${BUILD_CC} for a virtclass-native build.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-connectivity/openssl/openssl.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 089b9a4..1b2be93 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -19,7 +19,7 @@ S = "${WORKDIR}/openssl-${PV}"
 
 AR_append = " r"
 CFLAG = "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)} \
-	-DTERMIO ${FULL_OPTIMIZATION} -Wall"
+	-DTERMIO ${CFLAGS} -Wall"
 
 # Avoid binaries being marked as requiring an executable stack (which causes 
 # issues with SELinux on the host)
-- 
1.7.10.4





