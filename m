Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.921.1619398436071444216
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: lMp1g30+BpBM1z8nGSD3dI8sIzMkYfiHm9yGhDLjdDNQigvmFrQqmjp5rwzr370oY5PnFKDtgr
 bJps/D9iNz4A==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="196323420"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="196323420"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:53:59 -0700
IronPort-SDR: /n7mzEu+RWevzwFQBnrfGYHExVkS/9HDacXTynp95szxBMCgXrPyy2DB7Zt7332d4R/OBDFTmI
 52/ashwLKFwA==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067220"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:53:58 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 03/64] oeqa/selftest: Ensure packages classes are set correctly for maintainers test
Date: Mon, 26 Apr 2021 08:52:34 +0800
Message-Id: <9fdfeba3ec11b6b547e033b65ca13f4f5061d770.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The dnf packages aren't parsed if rpm isn't in PACKAGE_CLASSES which means
the aintainers test failes for OE-Core (where ipk is the default) but not
for poky (where the default is rpm).

Ensure PACKAGE_CLASSES is set so it works in all cases.

[YOCTO #14277]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 842b11107363357ed933cfcf619f1cf23f0d841e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/distrodata.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index fbc0c2a98d..0ad6e1ef91 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -99,7 +99,7 @@ The following recipes do not have a DESCRIPTION. Please add an entry for DESCRIP
                      return True
             return False
 
-        feature = 'require conf/distro/include/maintainers.inc\nLICENSE_FLAGS_WHITELIST += " commercial"\nPARSE_ALL_RECIPES = "1"\n'
+        feature = 'require conf/distro/include/maintainers.inc\nLICENSE_FLAGS_WHITELIST += " commercial"\nPARSE_ALL_RECIPES = "1"\nPACKAGE_CLASSES = "package_ipk package_deb package_rpm"\n'
         self.write_config(feature)
 
         with bb.tinfoil.Tinfoil() as tinfoil:
-- 
2.30.2

