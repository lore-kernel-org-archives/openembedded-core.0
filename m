Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QSSd0-00068m-Ke for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 13:33:22 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QSSZw-0003a3-5U
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 13:30:12 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 03 Jun 2011 12:30:11 +0100
Message-ID: <1307100611.2529.256.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] gcc-package-cross: also install the symlinks in libexec with target prefix
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
X-List-Received-Date: Fri, 03 Jun 2011 11:33:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

... since this is where collect2 seems to look for them.  This seems like
it is really a bug in collect2, but installing the symlinks is an easy
workaround.  Without this you get "could not find ld" errors when using -flto.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-devtools/gcc/gcc-package-cross.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-package-cross.inc b/meta/recipes-devtools/gcc/gcc-package-cross.inc
index 04c8101..b51336b 100644
--- a/meta/recipes-devtools/gcc/gcc-package-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-cross.inc
@@ -20,6 +20,7 @@ do_install () {
 	install -d $dest
 	for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
 		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
+		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t ${dest}${TARGET_PREFIX}$t
 	done
 
 	# Remove things we don't need but keep share/java
-- 
1.7.2.5





