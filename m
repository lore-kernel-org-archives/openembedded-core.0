Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rqp8D-0000wv-L2
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 17:58:33 +0100
Received: by wibhq7 with SMTP id hq7so1428048wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 08:50:44 -0800 (PST)
Received: by 10.180.104.4 with SMTP id ga4mr12920574wib.17.1327683044751;
	Fri, 27 Jan 2012 08:50:44 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id cb8sm13045542wib.0.2012.01.27.08.50.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 08:50:43 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2012 17:50:40 +0100
Message-Id: <1327683040-23382-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH v2] package bbclass: allow per package PRIVATE_LIBS
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
X-List-Received-Date: Fri, 27 Jan 2012 16:58:33 -0000

If a recipe packages multiple versions of shlib (e.g. powervr drivers) we only want the shlib code to pickup $PN, not $PN-foo subpackages.
This keeps backward compatibility with the global PRIVATE_LIBS usage if no per package PRIVATE_LIBS are set for a given package. In other words: this doesn't break the firefox recipe.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/package.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 45447e3..0322a05 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1326,8 +1326,8 @@ python package_do_shlibs() {
 
 	needed = {}
 	shlib_provider = {}
-	private_libs = d.getVar('PRIVATE_LIBS', True)
 	for pkg in packages.split():
+		private_libs = d.getVar('PRIVATE_LIBS_' + pkg, True) or d.getVar('PRIVATE_LIBS', True)
 		needs_ldconfig = False
 		bb.debug(2, "calculating shlib provides for %s" % pkg)
 
-- 
1.7.2.5



