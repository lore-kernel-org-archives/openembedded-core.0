Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.2077.1593651261154006625
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 17:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: X4kNEMciVzbGWE2quHpD84KDzcToQWvFLmjx6JpmnKiRJwU7k2EIC6jjr7D4WTCFAQ+q4z42cN
 X31Nf0+ls8Xw==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="231628786"
X-IronPort-AV: E=Sophos;i="5.75,302,1589266800"; 
   d="scan'208";a="231628786"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 17:54:23 -0700
IronPort-SDR: /2UGxmVTkPZZ9nIDlb82U3C+CaVpWkQu8S0A31zitNO/LvSGXuAPWnSp7CV8gZ7PLubf/3r6/o
 kJsv8cRMQ/2w==
X-IronPort-AV: E=Sophos;i="5.75,302,1589266800"; 
   d="scan'208";a="481801541"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.69.56])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 17:54:22 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 03/10] python3: un-break disabling the readline PACKAGECONFIG
Date: Thu,  2 Jul 2020 08:54:05 +0800
Message-Id: <4a4413aa521f35414d94f883a74aec3beb628a9a.1593474787.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1593474787.git.anuj.mittal@intel.com>
References: <cover.1593474787.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Previously the readline module would have been built regardless of
readline's presence in the sysroot, and the recipe would
fail at package_qa.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/python/python3_3.7.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.7.7.bb b/meta/recipes-devtools/python/python3_3.7.7.bb
index be67c81d7c..4d2578c817 100644
--- a/meta/recipes-devtools/python/python3_3.7.7.bb
+++ b/meta/recipes-devtools/python/python3_3.7.7.bb
@@ -107,6 +107,7 @@ do_configure_prepend () {
     cat > ${B}/Modules/Setup.local << EOF
 *disabled*
 ${@bb.utils.contains('PACKAGECONFIG', 'gdbm', '', '_gdbm _dbm', d)}
+${@bb.utils.contains('PACKAGECONFIG', 'readline', '', 'readline', d)}
 EOF
 }
 
-- 
2.25.4

