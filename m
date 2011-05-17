Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QMJXi-0002Wa-5P for openembedded-core@lists.linuxtogo.org;
	Tue, 17 May 2011 14:38:30 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QMJUw-0004Z4-Vz
	for openembedded-core@lists.linuxtogo.org;
	Tue, 17 May 2011 14:35:39 +0200
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.linuxtogo.org
Organization: Phil Blundell Consulting Ltd
Date: Tue, 17 May 2011 13:35:37 +0100
Message-ID: <1305635737.2429.198.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] openssl: backport fix for empty prefix from oe master
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
X-List-Received-Date: Tue, 17 May 2011 12:38:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This fixes a build failure when ${prefix}="".

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-connectivity/openssl/openssl.inc |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index fe168c3..f1ac718 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -89,7 +89,11 @@ do_configure () {
 	esac
 	# inject machine-specific flags
 	sed -i -e "s|^\(\"$target\",\s*\"[^:]\+\):\([^:]\+\)|\1:${CFLAG}|g" Configure
-	perl ./Configure shared --prefix=${prefix} --openssldir=${libdir}/ssl $target
+        useprefix=${prefix}
+        if [ "x$useprefix" = "x" ]; then
+                useprefix=/
+        fi        
+	perl ./Configure ${EXTRA_OECONF} shared --prefix=$useprefix --openssldir=${libdir}/ssl $target
 }
 
 do_compile () {
-- 
1.7.1





