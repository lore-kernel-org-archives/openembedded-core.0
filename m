Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web12.7767.1614918149829465790
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Ug2q6FEZPc6MQMnXhkY1ImYC/2bm/X/iplmZyayFEfEw0bO/JGwMkaO0oPxLmdkBaTwZyhYPmb
 iwAyoeV3/o4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671036"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671036"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:28 -0800
IronPort-SDR: ZXGV2GeTM2QUdBuIMWD6TCcV9o6WN3bbHEBCxXChe/fVk27xU2F/WtTuZfkpx5VPfYQ1lTsfjK
 tM6qRpklly3w==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128872"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:27 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 22/52] systemd: Fix importd requirements comment
Date: Fri,  5 Mar 2021 12:20:58 +0800
Message-Id: <2b3f0e7d08b29095ffb883e317a56f53e602cd26.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vivien Didelot <vdidelot@pbsc.com>

The comment above the importd config states curl, which does not
exist in PACKAGECONFIG. Adding it results in the following error
(and then misleading compilation failures):

    WARNING: systemd-1_244.5-r0 do_configure: QA Issue: systemd: invalid PACKAGECONFIG: curl [invalid-packageconfig]

Support for curl is currently enabled through journal-upload:

    PACKAGECONFIG[journal-upload] = "-Dlibcurl=true,-Dlibcurl=false,curl"

While it might be more appropriate to deprecate "journal-upload"
in favor of a "curl" PACKAGECONFIG entry, simply fix the importd
comment for now by stating upload-journal instead of curl.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e6a0bced605da58ff43ff06ea6a1d67e84c98d91)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/systemd/systemd_246.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_246.9.bb b/meta/recipes-core/systemd/systemd_246.9.bb
index daee795cc2..6524b8216a 100644
--- a/meta/recipes-core/systemd/systemd_246.9.bb
+++ b/meta/recipes-core/systemd/systemd_246.9.bb
@@ -135,7 +135,7 @@ PACKAGECONFIG[hibernate] = "-Dhibernate=true,-Dhibernate=false"
 PACKAGECONFIG[hostnamed] = "-Dhostnamed=true,-Dhostnamed=false"
 PACKAGECONFIG[idn] = "-Didn=true,-Didn=false"
 PACKAGECONFIG[ima] = "-Dima=true,-Dima=false"
-# importd requires curl/xz/zlib/bzip2/gcrypt
+# importd requires journal-upload/xz/zlib/bzip2/gcrypt
 PACKAGECONFIG[importd] = "-Dimportd=true,-Dimportd=false"
 # Update NAT firewall rules
 PACKAGECONFIG[iptc] = "-Dlibiptc=true,-Dlibiptc=false,iptables"
-- 
2.29.2

