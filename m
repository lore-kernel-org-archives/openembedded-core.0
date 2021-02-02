Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.48460.1612244058134667125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 21:34:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: BW5rHxdQNL1s+vnAs71dXLTN/oM0Z8ze6/mUbjVZIKK9HyZl4Vqon8MH28UkgCloJsZq2jj2nh
 kUu62qEpORJQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="180876896"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="180876896"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:25 -0800
IronPort-SDR: s0tg/0zrK5ukpRea5qKIzF+MK5+jC6H+49B+Vb3K+Jav/2xn5NpqOUycF6BtJYe47YMy3o89ic
 WOV13at3CiNA==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="370360925"
Received: from ajayap1x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.184.137])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:24 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 10/25] sanity: Verify that user isn't building in PSEUDO_IGNORE_PATHS
Date: Tue,  2 Feb 2021 13:33:53 +0800
Message-Id: <35f3e08c52e163e4496c0222896c49888ad5c960.1612243805.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612243805.git.anuj.mittal@intel.com>
References: <cover.1612243805.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dorinda <dorindabassey@gmail.com>

If a user builds in a path in PSEUDO_IGNORE_PATHS, random failures
are generated. Hence this patch adds a sanity check in sanity.bbclass
to ensure that a user isn't building in PSEUDO_IGNORE_PATHS.

[YOCTO #14179]

(From OE-Core rev: 7a681525e904914e938de25df5cc64209097d15d)

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bfeeaf9ff148a61868e0c882b7455dc02ca8ed76)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/sanity.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 3262d08fbf..0e7ad45c94 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -703,6 +703,13 @@ def check_sanity_version_change(status, d):
     if (tmpdirmode & stat.S_ISUID):
         status.addresult("TMPDIR is setuid, please don't build in a setuid directory")
 
+    # Check that a user isn't building in a path in PSEUDO_IGNORE_PATHS
+    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS', expand=True).split(",")
+    workdir = d.getVar('WORKDIR', expand=True)
+    for i in pseudoignorepaths:
+        if i and workdir.startswith(i):
+            status.addresult("You are building in a path included in PSEUDO_IGNORE_PATHS " + str(i) + " please locate the build outside this path.\n")
+
     # Some third-party software apparently relies on chmod etc. being suid root (!!)
     import stat
     suid_check_bins = "chown chmod mknod".split()
-- 
2.29.2

