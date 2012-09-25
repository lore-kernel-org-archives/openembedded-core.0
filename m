Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TGcz8-00051B-PJ
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 23:48:06 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TGcmk-0005pH-Po
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 23:35:19 +0200
Message-ID: <1348608781.1335.9.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Sep 2012 22:33:01 +0100
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: [PATCH] cpan_build: Unify directory layout for native and target builds
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
X-List-Received-Date: Tue, 25 Sep 2012 21:48:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There seems to be no benefit in having them be different and this
appears to cause a certain amount of confusion about paths for
the native modules.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
previously posted as RFC, no comments so reposting as an actual patch

 meta/classes/cpan_build.bbclass |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/classes/cpan_build.bbclass
b/meta/classes/cpan_build.bbclass
index 36ffc56..0809602 100644
--- a/meta/classes/cpan_build.bbclass
+++ b/meta/classes/cpan_build.bbclass
@@ -23,8 +23,9 @@ cpan_build_do_configure () {
 	if [ ${@is_target(d)} == "yes" ]; then
 		# build for target
 		. ${STAGING_LIBDIR}/perl/config.sh
+	fi
 
-			perl Build.PL --installdirs vendor \
+	perl Build.PL --installdirs vendor \
 				--destdir ${D} \
 				--install_path lib="${datadir}/perl" \
 				--install_path arch="${libdir}/perl" \
@@ -32,10 +33,6 @@ cpan_build_do_configure () {
 				--install_path bin=${bindir} \
 				--install_path bindoc=${mandir}/man1 \
 				--install_path libdoc=${mandir}/man3
-	else
-		# build for host
-		perl Build.PL --installdirs site --destdir ${D}
-	fi
 }
 
 cpan_build_do_compile () {
-- 
1.7.9





