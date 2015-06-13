Return-Path: <mcrowe@brightsign.biz>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 13 Jun 2015 19:00:07 UTC
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id A4BFD759CE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jun 2015 19:00:07 +0000 (UTC)
Received: from [86.30.112.98] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 566019813; Sat, 13 Jun 2015 14:45:06 -0400
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign with esmtp (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1Z3qQP-0002Bj-EU; Sat, 13 Jun 2015 19:45:01 +0100
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1Z3qQP-0002vJ-2D; Sat, 13 Jun 2015 19:45:01 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Jun 2015 19:44:41 +0100
Message-Id: <1434221081-4286-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] pixbufcache: Ensure that jpeg-native is available for postinst if necessary
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 13 Jun 2015 19:00:11 -0000

pixbufcache_sstate_postinst expects to be able to call
gdk-pixbuf-query-loaders which may be linked against libjpeg.so.8 so we'd
better make sure jpeg-native is available in the sysroot.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/pixbufcache.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index 9e6ecc8..755a654 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -72,6 +72,7 @@ PIXBUFCACHE_SYSROOT_DEPS_class-native = "\
     glib-2.0-native:do_populate_sysroot_setscene libffi-native:do_populate_sysroot_setscene \
     libpng-native:do_populate_sysroot_setscene zlib-native:do_populate_sysroot_setscene \
     harfbuzz-native:do_populate_sysroot_setscene \
+    ${@bb.utils.contains('PACKAGECONFIG', 'jpeg', 'jpeg-native:do_populate_sysroot_setscene', '', d)} \
     "
 do_populate_sysroot_setscene[depends] += "${PIXBUFCACHE_SYSROOT_DEPS}"
 do_populate_sysroot[depends] += "${@d.getVar('PIXBUFCACHE_SYSROOT_DEPS', True).replace('_setscene','')}"
-- 
2.1.4


