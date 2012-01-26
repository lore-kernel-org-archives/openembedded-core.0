Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RqSqq-0003n2-Nk
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 18:11:08 +0100
Received: by wibhq7 with SMTP id hq7so570639wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 09:03:20 -0800 (PST)
Received: by 10.180.104.4 with SMTP id ga4mr5724503wib.17.1327597400793;
	Thu, 26 Jan 2012 09:03:20 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id di5sm14535885wib.3.2012.01.26.09.03.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 09:03:19 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2012 18:03:14 +0100
Message-Id: <1327597394-31990-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] package bbclass: allow per package PRIVATE_LIBS
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
X-List-Received-Date: Thu, 26 Jan 2012 17:11:08 -0000

If a recipe packages multiple versions of shlib (e.g. powervr drivers) we only want the shlib code to pickup $PN, not $PN-foo subpackages.
This keeps backward compatibility with the global PRIVATE_LIBS usage if no per package PRIVATE_LIBS are set for a given package. In other words: this doesn't break the firefox recipe.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/package.bbclass |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 45447e3..22a76cf 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1246,7 +1246,8 @@ python package_do_shlibs() {
 				if not this_soname in sonames:
 					# if library is private (only used by package) then do not build shlib for it
 					if not private_libs or -1 == private_libs.find(this_soname):
-						sonames.append(this_soname)
+						if not private_libs_pkg or -1 == private_libs_pkg.find(this_soname):
+							sonames.append(this_soname)
 				if libdir_re.match(root):
 					needs_ldconfig = True
 				if snap_symlinks and (file != this_soname):
@@ -1328,6 +1329,8 @@ python package_do_shlibs() {
 	shlib_provider = {}
 	private_libs = d.getVar('PRIVATE_LIBS', True)
 	for pkg in packages.split():
+		if not private_libs:
+			private_libs_pkg = d.getVar('PRIVATE_LIBS_' + pkg, True)
 		needs_ldconfig = False
 		bb.debug(2, "calculating shlib provides for %s" % pkg)
 
-- 
1.7.2.5



