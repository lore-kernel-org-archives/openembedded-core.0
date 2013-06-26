Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id BA46D6AE53
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 17:19:02 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id e49so7445673eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 10:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=YslO7NVfiZ30wcY7WjQCyv8j+sAQhAVnvY1IfT2XR4k=;
	b=HJRt4i5q6bD39GhDWjQ7NZCZetJywLLZGpyibAc6/0oy50CK5bzuw9P3/wizaFwWjX
	m+QlcebMiMLrzFTEniql1ReoXK6P+Mw1GCPwFzR5EPUf8W01DJPihT4zynTnyyiSDngb
	kC0pKnkcmppR97mvLUgJW0LL+HT9fQqbx4tGYFg/49aSoZf/Rvvv0gAW2biQ+5AN7GL6
	yYLfpbsWUp7Le/DQomZphluGf3fdtu88MbtqWWOHjCsV9CtuMeA4jG+jGnnvTElI6a5/
	B8S4PrxicFSHOFnCXObZ3JWVqgcG77nn3rNI9twLoi1E93A++i0JZ0NHF4s0wPWXY8XY
	bH+Q==
X-Received: by 10.14.8.197 with SMTP id 45mr5055695eer.66.1372267143295;
	Wed, 26 Jun 2013 10:19:03 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p49sm44136952eeu.2.2013.06.26.10.19.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 26 Jun 2013 10:19:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2013 19:19:32 +0200
Message-Id: <1372267173-2787-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH] boost: Limit PARALLEL_MAKE by -j 64
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
X-List-Received-Date: Wed, 26 Jun 2013 17:19:03 -0000

* greater paralelism isn't supported by bjam and causes segfault or ignoring -j
* PARALLEL_MAKE was enabled for boost in
  http://git.openembedded.org/openembedded-core/commit/?id=9b9cfc1dfe5e3b8f89b7a8508537166d0f23935e

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/boost/boost.inc | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index a1c35c7..87bac23 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -102,8 +102,22 @@ BJAM_TOOLS   = "-sTOOLS=gcc \
 		'--layout=system' \
 		"
 
-#use PARALLEL_MAKE to speed up the build
-BJAM_OPTS    = '${PARALLEL_MAKE} \
+# use PARALLEL_MAKE to speed up the build, but limit it by -j 64, greater paralelism causes bjam to segfault or to ignore -j
+# https://svn.boost.org/trac/boost/ticket/7634
+def get_boost_parallel_make(bb, d):
+    pm = d.getVar('PARALLEL_MAKE', True)
+    if pm:
+        # people are usually using "-jN" or "-j N", but let it work with something else appended to it
+        import re
+        pm_prefix = re.search("\D+", pm)
+        pm_val = re.search("\d+", pm)
+        if pm_prefix is None or pm_val is None:
+            bb.error("Unable to analyse format of PARALLEL_MAKE variable: %s" % pm)
+        pm_nval = min(64, int(pm_val.group(0)))
+        return pm_prefix.group(0) + str(pm_nval) + pm[pm_val.end():]
+
+BOOST_PARALLEL_MAKE = "${@get_boost_parallel_make(bb, d)}"
+BJAM_OPTS    = '${BOOST_PARALLEL_MAKE} \
 		${BJAM_TOOLS} \
 		-sBOOST_BUILD_USER_CONFIG=${S}/tools/build/v2/user-config.jam \
 		--builddir=${S}/${TARGET_SYS} \
-- 
1.8.2.1


