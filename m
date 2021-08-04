Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.6144.1628064615144290550
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 01:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1748ADb9010859
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Aug 2021 01:10:13 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 4 Aug 2021 01:10:13 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 4 Aug 2021 01:10:13 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] insane.bbclass: fix the file-rdeps QA message for the new override syntax
Date: Wed, 4 Aug 2021 01:10:13 -0700
Message-ID: <20210804081013.130502-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Instead of replacing '_<pkg>', we should be replacing ':<pkg>'.
Otherwise, when we meet a 'file-rdeps' QA error, the error message would be
like below.

  QA Issue: /usr/lib64/libatopology.so.2.0.0:libatopology contained in package libatopology ...

The ':libatopology' should not be in the error message.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index ee858f84b7..be5ec60146 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -822,7 +822,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
             if filerdepends:
                 for key in filerdepends:
                     error_msg = "%s contained in package %s requires %s, but no providers found in RDEPENDS:%s?" % \
-                            (filerdepends[key].replace("_%s" % pkg, "").replace("@underscore@", "_"), pkg, key, pkg)
+                            (filerdepends[key].replace(":%s" % pkg, "").replace("@underscore@", "_"), pkg, key, pkg)
                     package_qa_handle_error("file-rdeps", error_msg, d)
 package_qa_check_rdepends[vardepsexclude] = "OVERRIDES"
 
-- 
2.30.2

