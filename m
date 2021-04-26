Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.3123.1619415959561459793
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 22:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: PertIaQuEH/vUlNWXWTNh9j/pWoxgZWPuXt9bWxT4eEJV2FMbmJF8WY4Ewgw4raZRJS4pDZ7I6
 MhlkYJxavYBA==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="281613584"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="281613584"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 22:46:06 -0700
IronPort-SDR: ctIzhpk5mfa3ShaT612t7ppSHv4cJVlZnC+ziLnNT7lz/hbPXeVZgPdyB8LdNncmsYoRhTs3cI
 yVcbfh3NMQlQ==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="385670727"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 22:46:05 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 8/8] sanity: Further improve directory sanity tests
Date: Mon, 26 Apr 2021 13:45:46 +0800
Message-Id: <8b0aef3f504d650c3208f11b62a7926aa90967f1.1619409036.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619409036.git.anuj.mittal@intel.com>
References: <cover.1619409036.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add tests to ensure COREBASE/TMPDIR doon't contain ".." as this causes
hard to understand build failures.

Also rework the code to test TMPDIR and COREBASE for all the patterns
since they may be set differently and one may contain problematic
characters.

[YOCTO #14111]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f22a6e46d003aba516a9a0cc7f94eae678d846b7)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/sanity.bbclass | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index c450b37bf0..03a9792f68 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -882,15 +882,18 @@ def check_sanity_everybuild(status, d):
         except:
             pass
 
-    oeroot = d.getVar('COREBASE')
-    if oeroot.find('+') != -1:
-        status.addresult("Error, you have an invalid character (+) in your COREBASE directory path. Please move the installation to a directory which doesn't include any + characters.")
-    if oeroot.find('@') != -1:
-        status.addresult("Error, you have an invalid character (@) in your COREBASE directory path. Please move the installation to a directory which doesn't include any @ characters.")
-    if oeroot.find('%') != -1:
-        status.addresult("Error, you have an invalid character (%) in your COREBASE directory path which causes problems with python string formatting. Please move the installation to a directory which doesn't include any % characters.") 
-    if oeroot.find(' ') != -1:
-        status.addresult("Error, you have a space in your COREBASE directory path. Please move the installation to a directory which doesn't include a space since autotools doesn't support this.")
+    for checkdir in ['COREBASE', 'TMPDIR']:
+        val = d.getVar(checkdir)
+        if val.find('..') != -1:
+            status.addresult("Error, you have '..' in your %s directory path. Please ensure the variable contains an absolute path as this can break some recipe builds in obtuse ways." % checkdir)
+        if val.find('+') != -1:
+            status.addresult("Error, you have an invalid character (+) in your %s directory path. Please move the installation to a directory which doesn't include any + characters." % checkdir)
+        if val.find('@') != -1:
+            status.addresult("Error, you have an invalid character (@) in your %s directory path. Please move the installation to a directory which doesn't include any @ characters." % checkdir)
+        if val.find(' ') != -1:
+            status.addresult("Error, you have a space in your %s directory path. Please move the installation to a directory which doesn't include a space since autotools doesn't support this." % checkdir)
+        if val.find('%') != -1:
+            status.addresult("Error, you have an invalid character (%) in your %s directory path which causes problems with python string formatting. Please move the installation to a directory which doesn't include any % characters." % checkdir)
 
     # Check the format of MIRRORS, PREMIRRORS and SSTATE_MIRRORS
     import re
-- 
2.30.2

