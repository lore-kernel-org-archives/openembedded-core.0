Return-Path: <o.mandel@menlosystems.com>
X-Greylist: delayed 386 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 19 Oct 2018 15:28:54 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 80E56746D3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 15:28:54 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 42c8mN6p1Bz1r2sP;
	Fri, 19 Oct 2018 17:22:28 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 42c8mN6Yx2z1qvlQ;
	Fri, 19 Oct 2018 17:22:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id oGlvq-6y3WHQ; Fri, 19 Oct 2018 17:22:27 +0200 (CEST)
X-Auth-Info: /SPblj6IaxH0FwsVqx/12hsZGH0n5ZlNCKPqMX1qh6q3IYsS/30YjjuqTBaJ5kDj
Received: from menlobldserver.menlosystems.local
	(host-141-40-253-35.customer.izb-online.de [141.40.253.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 19 Oct 2018 17:22:27 +0200 (CEST)
From: Olaf Mandel <o.mandel@menlosystems.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Oct 2018 15:22:14 +0000
Message-Id: <20181019152214.1600-1-o.mandel@menlosystems.com>
X-Mailer: git-send-email 2.11.0
Cc: marex@denx.de, Olaf Mandel <o.mandel@menlosystems.com>
Subject: [PATCH] npm: change install directory to upstream default
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
X-List-Received-Date: Fri, 19 Oct 2018 15:28:54 -0000

The node binary searches for packages in a number of locations, the last
of which is $PREFIX/lib/node (here: /usr/lib/node) from the list of
GLOBAL_FOLDERS [1]. Change the installation directory for all packages
depending on npm.bbclass to that location. This removes the need to
define the NODE_PATH variable to the non-standard /usr/lib/node_modules
value.

While the Tips for Package Managers [2] discusses installing packages to
/usr/lib/node_modules/<name>/<version>, this has several drawbacks:

 * it does not work for the REPL as mentioned in the documentation
 * it also does not work for any code _not_ installed as a global
   package under /usr/lib/node_modules (e.g. /usr/share/foo.js will not
   find any packages below /usr/lib)
 * using the non-default location and then having to set NODE_PATH
   barely saves any time: there are only two file-system lookups (to the
   legacy $HOME/.node_modules and $HOME/.node_libraries) directories
   before the library would be found

And the suggestion was made in the context of deduping the node_modules
tree by installing all packages in a flat hierarchy and using symlinks
to the correct version of each dependency. This is not what OpenEmbedded
does, so none of those benefits (deduping, cleaner packages) are being
had by shifting the installation directory to /usr/lib/node_modules.

[1]: https://nodejs.org/api/modules.html#modules_loading_from_the_global_folders
[2]: https://nodejs.org/api/modules.html#modules_addenda_package_manager_tips

Signed-off-by: Olaf Mandel <o.mandel@menlosystems.com>
---
 meta/classes/npm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index c351ff0866..d5ff0c6d57 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -10,7 +10,7 @@ def node_pkgname(d):
 
 NPMPN ?= "${@node_pkgname(d)}"
 
-NPM_INSTALLDIR = "${D}${libdir}/node_modules/${NPMPN}"
+NPM_INSTALLDIR = "${D}${libdir}/node/${NPMPN}"
 
 # function maps arch names to npm arch names
 def npm_oe_arch_map(target_arch, d):
-- 
2.11.0


