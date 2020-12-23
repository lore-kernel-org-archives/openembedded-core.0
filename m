Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.10233.1608736733177759099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: rZ49F2O6xaQanwgyecEWOWHtFi2Ar8zZ3zqOX3JLYsmjI6AN26XPQD/XNBakBh4byXXNQlrij7
 O+OMRJBjcPsw==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155235981"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155235981"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:00 -0800
IronPort-SDR: kBUnCVJgPQf4gjhP/dAUYYsh9zz9dMZBS5lgyyUq22aifSEBK3w0cacZYbfm7ABsRv6L9N/W/E
 yxic8ze6P/kw==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027503"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:18:59 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 06/35] cups: whitelist CVE-2018-6553
Date: Wed, 23 Dec 2020 23:18:16 +0800
Message-Id: <2b611ac04446b722c1b11d49cf90667b99e735ba.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Steve Sakoman <steve@sakoman.com>

This an Ububtu specific issue:

The CUPS AppArmor profile incorrectly confined the dnssd backend
due to use of hard links. A local attacker could possibly use this
issue to escape confinement. This flaw affects versions prior to
2.2.7-1ubuntu2.1 in Ubuntu 18.04 LTS, prior to 2.2.4-7ubuntu3.1
in Ubuntu 17.10, prior to 2.1.3-4ubuntu0.5 in Ubuntu 16.04 LTS,
 and prior to 1.7.2-0ubuntu1.10 in Ubuntu 14.04 LTS

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 22e89983a8f83a369d83bc67e4f3492bc50db648)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/cups/cups.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 87870e4aba..df8d4d284a 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -20,6 +20,9 @@ SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.t
 UPSTREAM_CHECK_URI = "https://github.com/apple/cups/releases"
 UPSTREAM_CHECK_REGEX = "cups-(?P<pver>\d+\.\d+(\.\d+)?)-source.tar"
 
+# This is an Ubuntu only issue.
+CVE_CHECK_WHITELIST += "CVE-2018-6553"
+
 LEAD_SONAME = "libcupsdriver.so"
 
 CLEANBROKEN = "1"
-- 
2.29.2

