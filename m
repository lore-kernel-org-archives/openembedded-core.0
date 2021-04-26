Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.972.1619398464930781840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 0m8e0K9QO1l1TG2znxypBOrx5I39KPAbqN0SMnL2lbyMDo6mwBJ9Fsd/4S1cJHJGvYVZQ7zHpx
 UTRZ192hrMOA==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818193"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818193"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:37 -0700
IronPort-SDR: KPgDL+++A+Q4J5xkBc9d/3+G6B+pcfVmA5bwO2NsOXrbQJB67ckusSDurUtIqSGa5tHzWfp7tA
 2nSnkokrlkTA==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067410"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:36 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 31/64] sanity: Add error check for '%' in build path
Date: Mon, 26 Apr 2021 08:53:02 +0800
Message-Id: <000c12eeca6f6145ba9203c91ec1e67e4b5d8b6f.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

It has been reported that '%' characters in build paths break with python
exceptions, probably due to confusion with python string escaping. Whilst it
is probably fixable, showing the user a human readable error is better given
it doesn't work.

[YOCTO #14282]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 31a3cf78452270131a657be45e76569515cff7ef)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/sanity.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 894f0e3107..14ffac0bf2 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -887,6 +887,8 @@ def check_sanity_everybuild(status, d):
         status.addresult("Error, you have an invalid character (+) in your COREBASE directory path. Please move the installation to a directory which doesn't include any + characters.")
     if oeroot.find('@') != -1:
         status.addresult("Error, you have an invalid character (@) in your COREBASE directory path. Please move the installation to a directory which doesn't include any @ characters.")
+    if oeroot.find('%') != -1:
+        status.addresult("Error, you have an invalid character (%) in your COREBASE directory path which causes problems with python string formatting. Please move the installation to a directory which doesn't include any % characters.") 
     if oeroot.find(' ') != -1:
         status.addresult("Error, you have a space in your COREBASE directory path. Please move the installation to a directory which doesn't include a space since autotools doesn't support this.")
 
-- 
2.30.2

