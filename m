Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.36963.1614009640008517381
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:01:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: TM1MEPq9O2Evk1CgHcAuCzIT3C5disqMcHuhWX0mRzF7Oh/A9utGxuSfLUBIB+TfOpOR05zwob
 59K9nAXJg2dg==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="181049547"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="181049547"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:02 -0800
IronPort-SDR: glLJb9FeJ/VoC/tNxDbqopavAZW7hq6TBYzrf88jj1BxsIXMwqVgCz8a3eVxgbtd3PabO6MACY
 La9S1m/YCUaQ==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430301924"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:00 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 14/30] cwautomacros: Ensure version is set deterministically
Date: Tue, 23 Feb 2021 00:00:17 +0800
Message-Id: <c135012f85d8e1f4b50880b580514410caacbcf5.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The makefile injects the current date into the version file. Do this
deterministically with SOURCE_DATE_EPOCH.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 31f2ad739ea776a1e11b5cef5434df188007c7bf)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
index 65a99fc28d..02b016fdf1 100644
--- a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
+++ b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
@@ -13,7 +13,7 @@ do_configure() {
 }
 
 do_install() {
-	oe_runmake CWAUTOMACROSPREFIX=${D}${prefix} install
+	oe_runmake LABEL=`date -d @${SOURCE_DATE_EPOCH} +%Y%m%d` CWAUTOMACROSPREFIX=${D}${prefix} install
 
 	# cleanup buildpaths in autogen.sh
 	sed -i -e 's,${D},,g' ${D}${prefix}/share/cwautomacros/scripts/autogen.sh
-- 
2.29.2

