Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UUgbm-00054q-Hj for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 19:02:32 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1UUgKi-0007rk-63
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 18:44:44 +0200
Message-ID: <1366735483.5732.18.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Apr 2013 17:44:43 +0100
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Subject: [PATCH] eglibc: Add gettext-native to DEPENDS
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
X-List-Received-Date: Tue, 23 Apr 2013 17:02:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Otherwise you get:

| msgfmt -o be.mo be.po
| msgfmt -o bg.mo bg.po
| msgfmt -o ca.mo ca.po
| /bin/bash: msgfmt: command not found
| make[2]: *** [be.mo] Error 127
| make[2]: *** Waiting for unfinished jobs....
| /bin/bash: msgfmt: command not found
| make[2]: *** [ca.mo] Error 127
| /bin/bash: msgfmt: command not found
| make[2]: *** [bg.mo] Error 127

if msgfmt isn't available in the host environment.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-core/eglibc/eglibc.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 1e04197..38d8c44 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -33,7 +33,7 @@ siteconfig_do_siteconfig_gencache_prepend = " \
 "
 
 # nptl needs unwind support in gcc, which can't be built without glibc.
-DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial linux-libc-headers virtual/${TARGET_PREFIX}libc-initial"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial linux-libc-headers virtual/${TARGET_PREFIX}libc-initial gettext-native"
 # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this
 #RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
 PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
-- 
1.7.10.4





