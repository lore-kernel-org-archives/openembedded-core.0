Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.10166.1589536648312842934
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 02:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: liezhi.yang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04F9uuOf008220
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 02:57:17 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Fri, 15 May 2020
 02:57:07 -0700
From: "Robert Yang" <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] archiver.bbclass: Add ENABLE_COPYLEFT_FILTER to enable/disable copyleft_filter.bbclass
Date: Fri, 15 May 2020 02:56:45 -0700
Message-ID: <38eda2606c19cf817d09b35f1eb49d50170a52ae.1589536566.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1589536566.git.liezhi.yang@windriver.com>
References: <cover.1589536566.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Set it to 0 can make it archive all the used sources during the build, nothing
will be filtered out, this is useful when we want to archive all the sources.

This equals to:
COPYLEFT_LICENSE_INCLUDE = "*"
COPYLEFT_LICENSE_EXCLUDE = ""

But there are a lot of settings in copyleft_filter.bbclass, so it may not work
when its default settings are changed, add the var ENABLE_COPYLEFT_FILTER will
make it more reliable.

The default value is 1, has no impact by default.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/archiver.bbclass | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 48b4913a9f..f4e3478cd0 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -44,6 +44,9 @@
 COPYLEFT_RECIPE_TYPES ?= 'target native nativesdk cross crosssdk cross-canadian'
 inherit copyleft_filter
 
+# Set this to 0 will archive all used sources in the build
+ENABLE_COPYLEFT_FILTER ?= "1"
+
 ARCHIVER_MODE[srpm] ?= "0"
 ARCHIVER_MODE[src] ?= "patched"
 ARCHIVER_MODE[diff] ?= "0"
@@ -81,13 +84,13 @@ python () {
                 pn = p
                 break
 
-    included, reason = copyleft_should_include(d)
-    if not included:
-        bb.debug(1, 'archiver: %s is excluded: %s' % (pn, reason))
-        return
-    else:
-        bb.debug(1, 'archiver: %s is included: %s' % (pn, reason))
-
+    if oe.types.boolean(d.getVar('ENABLE_COPYLEFT_FILTER')):
+        included, reason = copyleft_should_include(d)
+        if not included:
+            bb.debug(1, 'archiver: %s is excluded: %s' % (pn, reason))
+            return
+        else:
+            bb.debug(1, 'archiver: %s is included: %s' % (pn, reason))
 
     # glibc-locale: do_fetch, do_unpack and do_patch tasks have been deleted,
     # so avoid archiving source here.
-- 
2.21.0

