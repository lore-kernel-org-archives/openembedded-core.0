Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.15133.1585930931466544680
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 09:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: paul.gortmaker@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 033GM78P027600
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 3 Apr 2020 09:22:07 -0700 (PDT)
Received: from sc2600cp.corp.ad.wrs.com (128.224.56.62) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Fri, 3 Apr 2020 09:22:07 -0700
From: "Paul Gortmaker" <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Paul Gortmaker <paul.gortmaker@windriver.com>,
        Ross Burton
	<ross.burton@intel.com>
Subject: [PATCH] sanity.bbclass: echo current SDK_VENDOR if it is invalid
Date: Fri, 3 Apr 2020 12:21:58 -0400
Message-ID: <20200403162158.15670-1-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

It can be frustrating if this sanity check triggers, but you
don't know why; you haven't explicitly set any SDK vars, or
similar.

At least echo out the offending value, so the end user has
a bit more information to go on.

Before:
  SDK_VENDOR should be of the form '-foosdk' with a single dash
After:
  SDK_VENDOR should be of the form '-foosdk' with a single dash; found '-overc-sdk'

Cc: Ross Burton <ross.burton@intel.com>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 88888e814a48..c823b49c03b0 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -823,7 +823,7 @@ def check_sanity_everybuild(status, d):
     # If SDK_VENDOR looks like "-my-sdk" then the triples are badly formed so fail early
     sdkvendor = d.getVar("SDK_VENDOR")
     if not (sdkvendor.startswith("-") and sdkvendor.count("-") == 1):
-        status.addresult("SDK_VENDOR should be of the form '-foosdk' with a single dash\n")
+        status.addresult("SDK_VENDOR should be of the form '-foosdk' with a single dash; found '%s'\n" % sdkvendor)
 
     check_supported_distro(d)
 
-- 
2.17.1

