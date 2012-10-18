Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TOygV-0002p9-0i
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 00:35:23 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TOyTd-0003j9-8j
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 00:22:05 +0200
Message-ID: <1350598767.4470.179.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Oct 2012 23:19:27 +0100
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: [PATCH] cpan-base: Add more debug paths to FILES
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
X-List-Received-Date: Thu, 18 Oct 2012 22:35:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We seem to be mostly installing modules into vendor_perl nowadays.
Make sure that the .debug data from there is captured appropriately.

Also, expand ${PERLLIBDIRS} at the point of assignment so we don't
call the python again and again.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/classes/cpan-base.bbclass |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cpan-base.bbclass b/meta/classes/cpan-base.bbclass
index 660c15f..cf697f1 100644
--- a/meta/classes/cpan-base.bbclass
+++ b/meta/classes/cpan-base.bbclass
@@ -39,8 +39,13 @@ def is_target(d):
         return "yes"
     return "no"
 
-PERLLIBDIRS = "${@perl_get_libdirs(d)}"
+PERLLIBDIRS := "${@perl_get_libdirs(d)}"
+PERLVERSION := "${@get_perl_version(d)}"
 
 FILES_${PN}-dbg += "${PERLLIBDIRS}/auto/*/.debug \
                     ${PERLLIBDIRS}/auto/*/*/.debug \
-                    ${PERLLIBDIRS}/auto/*/*/*/.debug"
+                    ${PERLLIBDIRS}/auto/*/*/*/.debug \
+		    ${PERLLIBDIRS}/vendor_perl/${PERLVERSION}/auto/*/.debug \
+		    ${PERLLIBDIRS}/vendor_perl/${PERLVERSION}/auto/*/*/.debug \
+		    ${PERLLIBDIRS}/vendor_perl/${PERLVERSION}/auto/*/*/*/.debug \
+		    "
-- 
1.7.9





