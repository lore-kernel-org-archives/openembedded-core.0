Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.29432.1618218515903981471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 02:08:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: zGeZWqqgMYxerC3mKj5H1yKbVf1UofS1vZ9FQAhwssi2asN/NmHEiKNd/elz7XXR3sjWOrK7Yc
 JA5C07xoK5Rw==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="255467918"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="255467918"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:47 -0700
IronPort-SDR: FH4eddFeGAprZv0GgTv3lT4r3pdNL4aVgbNdqU7tcKw9Th1LtR9TDqLLhPy2rx93TQ5QuxRbnB
 L5y+p4YHIkJQ==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="531809098"
Received: from pchuang-mobl3.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.174.143])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:46 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 09/18] devshell.bbclass: Exceptions displayed within devpyshell
Date: Mon, 12 Apr 2021 17:08:17 +0800
Message-Id: <6d3f740c2a6143d20760311cfdff268ad2e8dce4.1618210563.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1618210563.git.anuj.mittal@intel.com>
References: <cover.1618210563.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dorinda Bassey <dorindabassey@gmail.com>

If you type something into devpyshell, an exception should be triggered,
but that exception isn't printed out because it is not being flushed out
of the buffer. This patch fixes that issue.

[YOCTO #12156]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9f95e82a3b27bfd5177a855326dcad8a5bdf5b2d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/devshell.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index fdf7dc100f..76dd0b42ee 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -128,6 +128,7 @@ def devpyshell(d):
                     more = i.runsource(source, "<pyshell>")
                     if not more:
                         buf = []
+                    sys.stderr.flush()
                     prompt(more)
             except KeyboardInterrupt:
                 i.write("\nKeyboardInterrupt\n")
-- 
2.30.2

