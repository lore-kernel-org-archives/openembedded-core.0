Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TSu3v-0005vg-K9
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 19:27:47 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TStqp-0000ra-IS
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 19:14:15 +0100
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Oct 2012 18:14:14 +0000
X-Mailer: Evolution 3.0.2- 
Message-ID: <1351534455.13864.25.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] autotools: Attempt to clean build directory when rerunning configure
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
X-List-Received-Date: Mon, 29 Oct 2012 18:27:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Existing logic in autotools_preconfigure() will clean the build directory
before rerunning configure in the case where ${S} != ${B}.  It is, however,
desirable to make at least some attempt to clean the build artifacts for
in-tree builds since many packages lack the appropriate dependency rules
to force a recompile if (for example) CFLAGS has changed.  Making distclean
would be better but is not practical because many packages don't support it
properly.  Even "make clean" is not universally available, so we ignore any
failure from that command and just carry on regardless.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/autotools.bbclass |   13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index b97d74b..6539df9 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -93,10 +93,15 @@ CONFIGURESTAMPFILE = "${WORKDIR}/configure.sstate"
 
 autotools_preconfigure() {
 	if [ -n "${CONFIGURESTAMPFILE}" -a -e "${CONFIGURESTAMPFILE}" ]; then
-		if [ "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" -a "${S}" != "${B}" ]; then
-			echo "Previously configured separate build directory detected, cleaning ${B}"
-			rm -rf ${B}
-			mkdir ${B}
+		if [ "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" ]; then
+			if [ "${S}" != "${B}" ]; then
+				echo "Previously configured separate build directory detected, cleaning ${B}"
+				rm -rf ${B}
+				mkdir ${B}
+			else
+				echo "Previously configured source directory detected, cleaning ${S}"
+				( oe_runmake clean ) || true
+			fi
 		fi
 	fi
 }
-- 
1.7.10.4





