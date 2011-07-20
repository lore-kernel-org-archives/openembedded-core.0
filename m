Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QjTkf-0006hE-00
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 12:11:37 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QjTgj-00037a-0H
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 12:07:33 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jul 2011 11:07:32 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311156453.30326.53.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] libgcc: correct mode on libgcc_s.so.1 to ensure it gets stripped
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
X-List-Received-Date: Wed, 20 Jul 2011 10:11:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If the library is installed without execute permission then package.bbclass
will not consider it for stripping.  This is particularly unfortunate because 
there seems to be a bug somewhere else which is causing all DSOs to end up with 
a NEEDED dependency on libgcc_s, even if they don't actually require it, and 
hence it is getting installed in all images (for uclibc on i586 at least).

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-devtools/gcc/libgcc_4.6.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/libgcc_4.6.bb b/meta/recipes-devtools/gcc/libgcc_4.6.bb
index e74be19..a53835f 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.6.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.6.bb
@@ -1,6 +1,6 @@
 require gcc-${PV}.inc
 
-PR = "r0"
+PR = "r1"
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
@@ -41,6 +41,7 @@ do_install () {
 	fi
 
 	chown -R root:root ${D}
+	chmod +x ${D}${base_libdir}/libgcc_s.so.*
 }
 
 do_package_write_ipk[depends] += "virtual/libc:do_package"
-- 
1.7.4.1





