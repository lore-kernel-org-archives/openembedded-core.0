Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7839.1614918154051973024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:23:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: PF8sSQvfo1iC/aKwvHx01+xrmwpfrgfYafNcu5IKmrM5k1y2UgFA9mc1jQ/SvspmtggAfYPBGd
 5tdyfIHKheRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671250"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671250"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:23:02 -0800
IronPort-SDR: 571LBDKtVRB/uXWbC36VER9QGR828PoWaHuvdkpKY1fdckBcvFWhMIatj7LnlLOoYeGYDlx1GT
 ZZdzqlOmVt4Q==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408129171"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:23:01 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 47/52] parted: Fix reproducibility issue
Date: Fri,  5 Mar 2021 12:21:23 +0800
Message-Id: <5ea0289e250cdd95bd8e5ac522b4991a48529569.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We don't use tbe BUILDINFO line of host information in the Makefile
so remove it for reproducibility.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a9742595fa90d4977fdd8129a4fe4932ddb96a18)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/parted/parted_3.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/parted/parted_3.3.bb b/meta/recipes-extended/parted/parted_3.3.bb
index ce40c04ad4..915ab05b65 100644
--- a/meta/recipes-extended/parted/parted_3.3.bb
+++ b/meta/recipes-extended/parted/parted_3.3.bb
@@ -42,6 +42,7 @@ do_install_ptest() {
 	sed -i "s|^abs_srcdir =.*|abs_srcdir = \.|g" $t/tests/Makefile
 	sed -i "s|^abs_top_srcdir =.*|abs_top_srcdir = \.\.|g" $t/tests/Makefile
 	sed -i "s|^Makefile:.*|Makefile:|g" $t/tests/Makefile
+	sed -i "/^BUILDINFO.*$/d" $t/tests/Makefile
 	for i in print-align print-max print-flags dup-clobber duplicate fs-resize; \
 	  do cp ${B}/tests/.libs/$i $t/tests/; \
 	done
-- 
2.29.2

