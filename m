Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C5037705F1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 16:37:14 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6GGQUhp011074; Wed, 16 Jul 2014 17:26:34 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kV1y0T0oOcSq; Wed, 16 Jul 2014 17:26:34 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6GGQRT8011051
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 16 Jul 2014 17:26:29 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X7S2A-0004O6-SV; Wed, 16 Jul 2014 17:26:22 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 17:26:14 +0100
Message-Id: <3e1f4fcab5bcf6cef53be21b578df289690522dc.1405527926.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
References: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
References: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 15/19] fontcache: Fix build dependency errors
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
X-List-Received-Date: Wed, 16 Jul 2014 16:37:15 -0000

This addresses warnings like:

WARNING: QA Issue: liberation-fonts rdepends on fontconfig-utils but its not a build dependency? [build-deps]

since the dependencies were being added at package time and were not
visible to bitbake.

Also take the opportunity to convert to use PACKAGEFUNCS rather than
the horrible populate_packages_append.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/fontcache.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbclass
index afd3fd2..2bf1e4b 100644
--- a/meta/classes/fontcache.bbclass
+++ b/meta/classes/fontcache.bbclass
@@ -18,13 +18,16 @@ else
 fi
 }
 
-python populate_packages_append() {
+python () {
     font_pkgs = d.getVar('FONT_PACKAGES', True).split()
     deps = d.getVar("FONT_EXTRA_RDEPENDS", True)
 
     for pkg in font_pkgs:
         if deps: d.appendVar('RDEPENDS_' + pkg, ' '+deps)
+}
 
+python add_fontcache_postinsts() {
+    for pkg in d.getVar('FONT_PACKAGES', True).split():
         bb.note("adding fonts postinst and postrm scripts to %s" % pkg)
         postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
         if not postinst:
@@ -38,3 +41,5 @@ python populate_packages_append() {
         postrm += d.getVar('fontcache_common', True)
         d.setVar('pkg_postrm_%s' % pkg, postrm)
 }
+
+PACKAGEFUNCS += "add_fontcache_postinsts"
-- 
1.9.2


