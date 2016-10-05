Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 799EA71A4D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 15:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1C3C7181DC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 17:30:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id IxjAF8t3u7wm
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 17:30:51 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 33A0B181D6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 17:30:51 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 22BA91A0B8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 17:30:51 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 178E21A0B4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 17:30:51 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 17:30:51 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 0C3AE50F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 17:30:51 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u95FUpsl026019
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Oct 2016 17:30:51 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u95FUpep026018
	for openembedded-core@lists.openembedded.org;
	Wed, 5 Oct 2016 17:30:51 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Oct 2016 17:30:45 +0200
Message-Id: <2f1bff9e5381611a6374d689a06214c35a1e03f3.1475681404.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1475681404.git.pkj@axis.com>
References: <cover.1475681404.git.pkj@axis.com>
In-Reply-To: <cover.1475681404.git.pkj@axis.com>
References: <cover.1475681404.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCHv2 1/4] package_manager.py: Allow a leading - in PACKAGE_EXCLUDE_COMPLEMENTARY
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
X-List-Received-Date: Wed, 05 Oct 2016 15:30:53 -0000

This allows a regular expression specified in
PACKAGE_EXCLUDE_COMPLEMENTARY to have a leading dash. Without this,
the dash was treated by oe-pkgdata-util as the beginning of a command
line argument. E.g., if PACKAGE_EXCLUDE_COMPLEMENTARY = "-foo$", it
resulted in an error like:

  ERROR: <imagename>-1.0-r0 do_populate_sdk: Could not compute
  complementary packages list. Command '<topdir>/scripts/oe-pkgdata-util -p
  <builddir>/tmp/sysroots/<machine>/pkgdata glob
  <workdir>/installed_pkgs.txt *-dev *-dbg -x -foo$' returned 2:
  ERROR: argument -x/--exclude: expected one argument
  usage: oe-pkgdata-util glob [-h] [-x EXCLUDE] pkglistfile glob [glob ...]

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 434b898..5f86aff 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -598,7 +598,7 @@ class PackageManager(object, metaclass=ABCMeta):
                globs]
         exclude = self.d.getVar('PACKAGE_EXCLUDE_COMPLEMENTARY', True)
         if exclude:
-            cmd.extend(['-x', exclude])
+            cmd.extend(['--exclude=' + exclude])
         try:
             bb.note("Installing complementary packages ...")
             bb.note('Running %s' % cmd)
-- 
2.9.0


