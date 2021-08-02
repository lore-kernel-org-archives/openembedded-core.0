Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.17098.1627890835237985778
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 00:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193002143"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193002143"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:37 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="478655296"
Received: from chewchoo-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.228.46])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:36 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 34/37] archiver.bbclass: fix do_ar_configured failure for kernel
Date: Mon,  2 Aug 2021 15:52:21 +0800
Message-Id: <7ff54f2b1842830d526295192a8de2d168835911.1627890114.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627890114.git.anuj.mittal@intel.com>
References: <cover.1627890114.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d7776a23cbea836ddb8ac5ec77012af2449ab875)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/archiver.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 900268971c..dd31dc0cd8 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -281,7 +281,10 @@ python do_ar_configured() {
         # ${STAGING_DATADIR}/aclocal/libtool.m4, so we can't re-run the
         # do_configure, we archive the already configured ${S} to
         # instead of.
-        elif pn != 'libtool-native':
+        # The kernel class functions require it to be on work-shared, we
+        # don't unpack, patch, configure again, just archive the already
+        # configured ${S}
+        elif not (pn == 'libtool-native' or is_work_shared(d)):
             def runTask(task):
                 prefuncs = d.getVarFlag(task, 'prefuncs') or ''
                 for func in prefuncs.split():
-- 
2.31.1

