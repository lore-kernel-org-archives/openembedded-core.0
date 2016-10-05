Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id E5CFA71A6E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 15:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 35C5C181B4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 17:14:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id zEzlx4DDzsmm
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 17:14:21 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 981C0181BF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 17:14:21 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B19D1A0B4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 17:14:21 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7028E1A0B0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 17:14:21 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 17:14:21 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 649013DB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 17:14:21 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u95FELFZ019619
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Oct 2016 17:14:21 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u95FEL4n019618
	for openembedded-core@lists.openembedded.org;
	Wed, 5 Oct 2016 17:14:21 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Oct 2016 17:14:20 +0200
Message-Id: <d450db7568a4e608e012572d7df914c424d15858.1475680416.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1475680416.git.pkj@axis.com>
References: <cover.1475680416.git.pkj@axis.com>
In-Reply-To: <cover.1475680416.git.pkj@axis.com>
References: <cover.1475680416.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 2/2] package_manager.py: Allow multiple regexps in PACKAGE_EXCLUDE_COMPLEMENTARY
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
X-List-Received-Date: Wed, 05 Oct 2016 15:14:25 -0000

The PACKAGE_EXCLUDE_COMPLEMENTARY variable can currently only contain
one regular expression. This makes it hard to add to it from different
configuration files and recipes.

Allowing it to contain multiple, whitespace separated regular
expressions should be backwards compatible as it is assumed that
whitespace is not used in package names and thus is not used in any
existing instances of the variable.

After this change, the following three examples should be equivalent:

  PACKAGE_EXCLUDE_COMPLEMENTARY = "foo|bar"

  PACKAGE_EXCLUDE_COMPLEMENTARY = "foo bar"

  PACKAGE_EXCLUDE_COMPLEMENTARY = "foo"
  PACKAGE_EXCLUDE_COMPLEMENTARY += "bar"

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 5f86aff..3cee973 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -598,7 +598,7 @@ class PackageManager(object, metaclass=ABCMeta):
                globs]
         exclude = self.d.getVar('PACKAGE_EXCLUDE_COMPLEMENTARY', True)
         if exclude:
-            cmd.extend(['--exclude=' + exclude])
+            cmd.extend(['--exclude=' + '|'.join(exclude.split())])
         try:
             bb.note("Installing complementary packages ...")
             bb.note('Running %s' % cmd)
-- 
2.9.0


