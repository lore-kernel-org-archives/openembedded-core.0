Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.4956.1624438603155317300
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jun 2021 01:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=neutral (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: ito-yuichi@fujitsu.com)
IronPort-SDR: 2DOzxj3QHtxWU2KAYIobLedwttLUynH5Ik3cf5IKEqoY6CwRS6qGXEqp2HLstTK+va0fWXQtlZ
 /ipCcli0hxLn/n0XXocTeQKR4GuMup7PCJP6Y0yFtjS5anLwE7CJ0J4nVqlFGObtXpQTdn9Ihy
 9Fm/LufvFyY9bAawqR/VqU7RYAYHzAvs8Eg8UDGUue5Mc20I8Svm9sxqAUgNZAYNAbMPfKb60V
 QLOP4/cUSYMJ5mLY5Fnq/C3sYqXpj1Uq0daaH5ISQXyoy5PHlOT5q6vyDbjIlvnugiQzQQvrkm
 6q0=
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="22048508"
X-IronPort-AV: E=Sophos;i="5.83,293,1616425200"; 
   d="scan'208";a="22048508"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP; 23 Jun 2021 17:56:40 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9FD921FB303
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 17:56:39 +0900 (JST)
Received: from yto-om1.fujitsu.com (yto-om1.o.css.fujitsu.com [10.128.89.162])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C3A78B4E4F
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 17:56:38 +0900 (JST)
Received: from pumpkin.openstacklocal (pumpkin.fct.css.fujitsu.com [10.130.70.189])
	by yto-om1.fujitsu.com (Postfix) with ESMTP id AAF6140573307
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 17:56:38 +0900 (JST)
From: "ito-yuichi@fujitsu.com" <ito-yuichi@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cve-check: Add allowlist that is same function of whitelist.
Date: Wed, 23 Jun 2021 17:56:33 +0900
Message-Id: <20210623085633.3186982-1-ito-yuichi@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 8bit

The Linux team plan to removed references to racially-charged jargon from
their code for more neutral and inclusive language.
So replace use of "whitelist" with "allowlist" in cve-check.

First, we add CVE_CHECK_ALLOWLIST and it is considered patched as well as
CVE_CHECK_WHITELIST.
We plan to replace about other word later and eventualy, replace all
"whitelist" to "allowlist".

Signed-off-by: Yuichi Ito <ito-yuichi@fujitsu.com>
---
 meta/classes/cve-check.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 112ee3379d..5e3441a783 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -52,6 +52,7 @@ CVE_CHECK_PN_WHITELIST ?= ""
 # CVE_CHECK_WHITELIST = 'CVE-2014-2524 CVE-2018-1234'
 #
 CVE_CHECK_WHITELIST ?= ""
+CVE_CHECK_ALLOWLIST ?= ""
 
 # Layers to be excluded
 CVE_CHECK_LAYER_EXCLUDELIST ??= ""
@@ -238,7 +239,7 @@ def check_cves(d, patched_cves):
     old_cve_whitelist =  d.getVar("CVE_CHECK_CVE_WHITELIST")
     if old_cve_whitelist:
         bb.warn("CVE_CHECK_CVE_WHITELIST is deprecated, please use CVE_CHECK_WHITELIST.")
-    cve_whitelist = d.getVar("CVE_CHECK_WHITELIST").split()
+    cve_whitelist = d.getVar("CVE_CHECK_ALLOWLIST").split() + d.getVar("CVE_CHECK_WHITELIST").split()
 
     import sqlite3
     db_file = d.expand("file:${CVE_CHECK_DB_FILE}?mode=ro")
-- 
2.25.1

