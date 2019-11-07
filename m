Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7B4967FA14
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 20:55:13 +0000 (UTC)
Received: by p910.zcs.saftware.de (Postfix, from userid 1000)
	id D98EFBE483A; Thu,  7 Nov 2019 21:49:50 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 21:49:42 +0100
Message-Id: <20191107204943.17467-2-obi@opendreambox.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191107204943.17467-1-obi@opendreambox.org>
References: <20191107204943.17467-1-obi@opendreambox.org>
Subject: [PATCH 2/3] package.bbclass: Always include ldconfig fragment
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
X-List-Received-Date: Thu, 07 Nov 2019 20:55:13 -0000

Now that ldconfig may get installed from a feed, use it when it's
available on the target.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/package.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index f955df1111..e0d6ff6701 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1731,8 +1731,6 @@ python package_do_shlibs() {
     else:
         snap_symlinks = False
 
-    use_ldconfig = bb.utils.contains('DISTRO_FEATURES', 'ldconfig', True, False, d)
-
     needed = {}
 
     shlib_provider = oe.package.read_shlib_providers(d)
@@ -1791,7 +1789,7 @@ python package_do_shlibs() {
                     if s[0] not in shlib_provider:
                         shlib_provider[s[0]] = {}
                     shlib_provider[s[0]][s[1]] = (pkg, pkgver)
-        if needs_ldconfig and use_ldconfig:
+        if needs_ldconfig:
             bb.debug(1, 'adding ldconfig call to postinst for %s' % pkg)
             postinst = d.getVar('pkg_postinst_%s' % pkg)
             if not postinst:
-- 
2.17.1


