Received: from mga17.intel.com (mga17.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4074.1620808565759951992
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 01:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: SJeO6aASD2wDowfQyTLXWKyifBqiSL/ixOeFhQcUv0fCmhzoe+Ne9yGIJdAuOdsSM1IcWVTxm0
 TiBvPIHY0Ekw==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="179917773"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="179917773"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:02 -0700
IronPort-SDR: TrUMJQM+RZYNTL5AYhOJKJICjD/S/LW1FtTYOU16wQJE7KXqYstTW7ux89YZlAdHsVEvBVKI47
 JEhPp2Cd3AZQ==
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="430645717"
Received: from tmustofa-mobl1.amr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.122])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:01 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 01/15] sanity.bbclass: mention CONNECTIVITY_CHECK_URIS in network failure message
Date: Wed, 12 May 2021 16:35:33 +0800
Message-Id: <f54eaf65ff549a98ff98157d6b3aa48f9adc9ca5.1620808329.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620808329.git.anuj.mittal@intel.com>
References: <cover.1620808329.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This expands the error message when a network failure is detected.
It happens that some ISPs or networks block the default example.com
domain. Therefore, instead of disabling network access, it
lets the user know how to modify the test URL.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 62c94bb925543c1e1c5af3c751913d9f06d9597d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/sanity.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 14ffac0bf2..a2ac4eeb80 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -392,9 +392,12 @@ def check_connectivity(d):
             msg = data.getVar('CONNECTIVITY_CHECK_MSG') or ""
             if len(msg) == 0:
                 msg = "%s.\n" % err
-                msg += "    Please ensure your host's network is configured correctly,\n"
-                msg += "    or set BB_NO_NETWORK = \"1\" to disable network access if\n"
-                msg += "    all required sources are on local disk.\n"
+                msg += "    Please ensure your host's network is configured correctly.\n"
+                msg += "    If your ISP or network is blocking the above URL,\n"
+                msg += "    try with another domain name, for example by setting:\n"
+                msg += "    CONNECTIVITY_CHECK_URIS = \"https://www.yoctoproject.org/\""
+                msg += "    You could also set BB_NO_NETWORK = \"1\" to disable network\n"
+                msg += "    access if all required sources are on local disk.\n"
             retval = msg
 
     return retval
-- 
2.31.1

