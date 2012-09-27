Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1THCiX-0000tO-Tv
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 13:57:21 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1THCW8-0007su-6n
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 13:44:32 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2012 12:44:31 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348746272.32611.15.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] eglibc: Remove bogus PACKAGES_DYNAMIC setting
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
X-List-Received-Date: Thu, 27 Sep 2012 11:57:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

It transpires that eglibc has been setting PACKAGES_DYNAMIC = "libc6*" for
some time.  However, this is bogus for at least two reasons:

1. Bitbake interprets PACKAGES_DYNAMIC as a regex, not a glob, so this will
match against any package whose name starts "libc" plus zero or more sixes.
This is particularly toxic because the nativesdk variant picks up the same
value and will, consequently, start trying to build itself at the slightest
excuse.

2. eglibc doesn't actually build any packages named "libc6<anything>", other
than the ones that are named in PACKAGES anyway, so the dynamic provider
declaration is in any case useless.

Simply deleting the line is not sufficient since then we get the default
value from bitbake.conf which causes eglibc.bb to fight with eglibc-locale.bb.
So instead we must set it to the empty string for good results.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-core/eglibc/eglibc_2.16.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index 3a7ae50..b37922d 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -43,7 +43,8 @@ SRC_URI_append_virtclass-nativesdk = " file://ld-search-order.patch \
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
-PACKAGES_DYNAMIC = "libc6*"
+PACKAGES_DYNAMIC = ""
+
 RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
 PROVIDES_${PN}-dbg = "glibc-dbg"
 
-- 
1.7.10.4





