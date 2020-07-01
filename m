Received: from smtp1.axis.com (smtp1.axis.com [])
 by mx.groups.io with SMTP id smtpd.web11.17126.1593593197065006014
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 01:46:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=EPwl7CMX;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1343; q=dns/txt; s=axis-central1;
  t=1593593199; x=1625129199;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uBW07nXevP5wzrvfbc5pSUvHSYjXwrFCcz8C5X9zz6M=;
  b=EPwl7CMXRRwK8LPbLcW8rwTWlE1GZjQjFnHZHGPVrKesUeMRTBvneNmN
   Iwp1WP7EPl1IPVj6ab8JrIQX2aWfg3X3UrPAPSA0jKPPRkcTXbTeAfX4f
   GmH85xFpSkP2vjXMSYLzbtvV3zx0pFMtIWp+csu0zkvFLNY6bwyGZGUzn
   w6/MqVYGy1QOkppOZ7eamAnwanYq4sOYHsJSHfRhZbAgM3Bq7gL9+Jgot
   Y0zkzDQIJLeE2vTLhlM/rsU27EPxpB2WR1y6VFE+R2RrKLO4UxMsHtrg2
   DtX6iJ64DmV+NjarSAupNBA47VK9LVz5CklHqgFkxjWkNfLvlX4d8Qa/T
   w==;
IronPort-SDR: saVUHK3+PCTH2ZfdFFi8NJcPaI61cwdCUms7YBs6xINsUFIcz1NLWkj5j3F5jMBE9JvqcWNdhv
 ELFUx4MVQbxUoqlv9c9ks+A89lBw7iikWcRsPU2s7vIITL/6Qk4IFgNfOgMRwNY/cbT1l5nvn/
 XB+nqOMAYmKVk239C1Y9t/hfe2Ff9JhUxK9wW7DM+ukkozAoL0yeVzbeXHSqsGXi+1Qd2K+atX
 P9mHeP9DI0D+qU1Xn1sLCSVJw2N6PB0HFe2EoaaKoB/VEuv6PERd1BXNp57tp33zFh8tk5JDCu
 S1Y=
X-IronPort-AV: E=Sophos;i="5.75,299,1589234400"; 
   d="scan'208";a="10379498"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, Fredrik Gustafsson <fredrigu@axis.com>
Subject: [PATCH v3] nopackages.bbclass: Get tasks from variable
Date: Wed, 1 Jul 2020 10:46:34 +0200
Message-ID: <20200701084634.11428-2-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200701084634.11428-1-fredrigu@axis.com>
References: <20200701084634.11428-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Get tasks from a variable instead of having them hardcoded. This will
enable other layers to add tasks that should be deleted when nopackages
is used.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/classes/nopackages.bbclass | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/meta/classes/nopackages.bbclass b/meta/classes/nopackages.bbclass
index 559f5078bd..4c9fe510c5 100644
--- a/meta/classes/nopackages.bbclass
+++ b/meta/classes/nopackages.bbclass
@@ -1,12 +1,7 @@
-deltask do_package
-deltask do_package_write_rpm
-deltask do_package_write_ipk
-deltask do_package_write_deb
-deltask do_package_qa
-deltask do_packagedata
-deltask do_package_setscene
-deltask do_package_write_rpm_setscene
-deltask do_package_write_ipk_setscene
-deltask do_package_write_deb_setscene
-deltask do_package_qa_setscene
-deltask do_packagedata_setscene
+NO_PACKAGES_DELTASKS += "do_package do_package_write_rpm do_package_write_ipk do_package_write_deb do_package_qa do_packagedata do_package_setscene do_package_write_rpm_setscene do_package_write_ipk_setscene do_package_write_deb_setscene do_package_qa_setscene do_packagedata_setscene"
+
+python () {
+    list = d.getVar("NO_PACKAGES_DELTASKS").split()
+    for task in list:
+        bb.build.deltask(task, d)
+}
-- 
2.20.1

