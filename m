Return-Path: <richard@rpsys.net>
X-Greylist: delayed 622 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 16 Jul 2014 16:36:55 UTC
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A3F3970588
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 16:36:55 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6GGQUhr011074; Wed, 16 Jul 2014 17:26:35 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Q0kEY-MNeBtO; Wed, 16 Jul 2014 17:26:35 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6GGQSJS011055
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 16 Jul 2014 17:26:29 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X7S2B-0004OP-65; Wed, 16 Jul 2014 17:26:23 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 17:26:18 +0100
Message-Id: <6277921e6514c3cde70b2b8cf0d747f197a97941.1405527926.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
References: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
References: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 19/19] python: Forcibly disable tk
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
X-List-Received-Date: Wed, 16 Jul 2014 16:37:03 -0000

Avoids the determinism problem shown with the warnings:

WARNING: QA Issue: python-tkinter rdepends on libx11 but its not a build dependency? [build-deps]
WARNING: QA Issue: python-tkinter rdepends on tcl-lib but its not a build dependency? [build-deps

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python/avoid_warning_about_tkinter.patch       | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch b/meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch
index 208c57c..bedc390 100644
--- a/meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch
+++ b/meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch
@@ -2,17 +2,22 @@ _tkinter module needs tk module along with tcl. tk is not yet integrated
 in yocto so we skip the check for this module.
 Avoid a warning by not adding this module to missing variable.
 
+Also simply disable the tk module since its not in DEPENDS.
+
 Upstream-Status: Inappropriate [distribution]
 
 Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
 
-Index: Python-2.7.2/setup.py
+Index: Python-2.7.3/setup.py
 ===================================================================
---- Python-2.7.2.orig/setup.py	2012-04-05 23:18:38.500136647 +0300
-+++ Python-2.7.2/setup.py	2012-04-05 23:19:35.888134969 +0300
-@@ -1634,8 +1634,10 @@
+--- Python-2.7.3.orig/setup.py	2014-07-07 13:45:15.056233820 +0000
++++ Python-2.7.3/setup.py	2014-07-16 16:06:37.145656284 +0000
+@@ -1639,10 +1639,12 @@
+         self.extensions.extend(exts)
+ 
          # Call the method for detecting whether _tkinter can be compiled
-         self.detect_tkinter(inc_dirs, lib_dirs)
+-        self.detect_tkinter(inc_dirs, lib_dirs)
++        #self.detect_tkinter(inc_dirs, lib_dirs)
  
 -        if '_tkinter' not in [e.name for e in self.extensions]:
 -            missing.append('_tkinter')
-- 
1.9.2


