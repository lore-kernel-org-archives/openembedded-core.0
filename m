Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TGoNb-0001VV-J0
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 11:58:07 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TGoBD-0006L9-K7
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 11:45:19 +0200
From: Phil Blundell <philb@gnu.org>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Sep 2012 10:45:18 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348652719.31293.90.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] gcc-configure-cross: factor out --enable-threads argument into ${GCCTHREADS}
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
X-List-Received-Date: Wed, 26 Sep 2012 09:58:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This allows BSPs for architectures with no thread support to set (for
example) "GCCTHREADS=no" without having to override all the other configure
parameters.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 908ad3e..504bfaa 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -26,12 +26,13 @@ EXTRA_OECONF_INITIAL ?= ""
 EXTRA_OECONF_INTERMEDIATE ?= ""
 
 GCCMULTILIB = "--disable-multilib"
+GCCTHREADS = "posix"
 
 EXTRA_OECONF = "${@['--enable-clocale=generic', ''][d.getVar('USE_NLS', True) != 'no']} \
                 --with-gnu-ld \
                 --enable-shared \
                 --enable-languages=${LANGUAGES} \
-                --enable-threads=posix \
+                --enable-threads=${GCCTHREADS} \
                 ${GCCMULTILIB} \
                 --enable-c99 \
                 --enable-long-long \
-- 
1.7.10.4





