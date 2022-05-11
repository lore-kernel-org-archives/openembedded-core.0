Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D6E9C433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 14:37:18 +0000 (UTC)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.59])
 by mx.groups.io with SMTP id smtpd.web09.141.1652279834107446530
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 07:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=kRcnmvbM;
 spf=pass (domain: kpit.com, ip: 40.107.138.59,
 mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYTXkXbW3KviAO/gOnvUD+tQpZXW1vREIcOPM2RyISQXtTPywPsVxh/WSTG6k2n+MKhNtgZIkTM8mGRWD/l3SY1ESqCIBn3riNpLhxRn/Zvd6UkSH60sDaUL9/F16gOS9sS9zW9lSGHltv6rxvY3A8DwQsYusfoxCvPsTzrRTZjI/FF2vWIKMH9332oWkYy12VUsnrUeF2raXE9dCty5uviycVlgCt0LafZvFZH1WHkMEBzV2MbekgkJd01GM0v4XHJTnCO2LlrS4Cjqm77ApfcD8+GA603Ari3a7OMS1kRtD1VaMiSseBuE7T+gsJ6Elqhv221ModMSv8M/vN11JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NbA2KQHsG2qJrLmwOfLyi/JWZYBulV9VQ8dgJuIXPlI=;
 b=Ju/sUuZ5brm9d3JrF89YtBcr8OetVnrBua5m6M9mP7yn24ZobyJXH01+dJtMyEWKm6ndFCwCGQ9VbgGV01VPfo2JZB31saNlhQGYn61fRj99iqJ8mJfn6ZNo06LL+YM6lCms81ju90xwIve6CY5gNfLXRXeCOYdBtPMRIXL4JIqia7IbGEPCZD+VKpnhFDUMCHH0xJc80aUg7W3ZrmEyC7xl5Ex3n4TRWIWtkAgn9kkBCADbhcS/O/zR1qhXJbGKqpOaHrhRqtma6GtiBJPL5a9UbPIKGbMoeHRGIqN92T5RbWU1bIzC0HyCXa6Tn9CPSC+zxwpWPp8jJTQwyz+wKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbA2KQHsG2qJrLmwOfLyi/JWZYBulV9VQ8dgJuIXPlI=;
 b=kRcnmvbMYxLtNPBqXUl7BQeiXrokN5JwNgmxVL2VIgfIKU4gSP3PHQ956yHeHXADG3ZlIAO9o/CYnPWxqrFyS+v40YMeqTDzAndu/4oyLT4tP0ixkkzdit0tE6FjJ2JtExKtMXNtuEtkcWvBlXWTH4CjKMnWC6Hrk7DZCYIJ7s0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
 by MA1PR01MB2187.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:37::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Wed, 11 May
 2022 14:37:05 +0000
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8119:8287:2cf2:7125]) by PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8119:8287:2cf2:7125%6]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 14:37:05 +0000
From: Akash Hadke <akash.hadke@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com,
	Akash Hadke <hadkeakash4@gmail.com>
Subject: [poky][master][PATCH 2/3] cve-export.bbclass: Add a new class to get
 patched and ignored CVEs from the build
Date: Wed, 11 May 2022 16:36:12 +0200
Message-Id: <20220511143613.25002-2-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220511143613.25002-1-akash.hadke@kpit.com>
References: <20220511143613.25002-1-akash.hadke@kpit.com>
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0073.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::14) To PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:89::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbee99bc-af30-4c38-1eb9-08da335bb833
X-MS-TrafficTypeDiagnostic: MA1PR01MB2187:EE_
X-Microsoft-Antispam-PRVS: 
	<MA1PR01MB2187B3E6F66096E5AAFE1B578EC89@MA1PR01MB2187.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	X6gF7eEpNZEm++ukyudU1Z74Weu+TzcR/Y53XGS5BvfQheeH7TBHObA4DKS5GjvJYQ4NcAy4EpC6qyEqa+bbKoVjrOUV7a3YD/Dr9x3uD8keVcnyTuahDjTDdcchy/E2HFzuYTeeIega8ANgCN+3sJDMLB54iBtMOzqR8tzYhstkq4V45m73lEVzjYlB8HYxiU19HaVd9sMjBGkobDaAcLs/TZ4Kf/TSilpiNX9sWoRGSLrYcKd22J7xdxMZKpXgYw3iOojYtBobAqrLM7V5pPvJ26LBY+SD/2OiiQ5Of6X9fJUB16YRW8wclUc3gAjYJ4m9uzFyg7sik8j71zBAGpUW5o8panarJNbdzI3bXtKE/Cn1piOz0NXmjLkOXe8nM3ak9gFEzwKZwHg+OlVq1FRvq6RZrsSLJJDQsinZjihYAttPLim05Wrj9ld9OSA/45H+nwr6OgKfripyEpaWHlwtEn6/5TaicvyEsoLWOVune3hMTzLpa3+HvrPiU9jhq6hyzrzQzCYqKM1vlCPUnEZlbV6PMEEjeZjmdH52t7H71t59Cy56QkwT/FGNW1fZ4UR0aaVxjTeOqH0TsLXTgbqXK/Nw2sV8Bc2KgLoDcpsEtr4UrHOja36EXyV6W94q3bITRrUPVwLL+6a3bDVLMX0+DgdH0oiC75vORXqv27pwysFY/3ECdTDLQesEdrfzCOwuLYUpGv6B+0vOEDyxSg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(38100700002)(2616005)(6512007)(4326008)(36756003)(6916009)(8676002)(186003)(1076003)(316002)(66556008)(66476007)(66946007)(6666004)(508600001)(86362001)(6506007)(5660300002)(2906002)(8936002)(6486002)(38350700002)(52116002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oWpUTz8+mxqkBPCN/nnsrILaX/Nbkc8JX+oCGbJnNy3jaoVR95yw4C+7n/XH?=
 =?us-ascii?Q?ocpKY836RKJ9Dx4hXy7YMtjONOLMafDIZsJ6E4cQcV5LK1Tu+1cEtS7Xc0Ra?=
 =?us-ascii?Q?mE7P2WnOSSpMsonfjYGg4PZrHxIYiOlp1eLgKRXjYrJyTSPNH5xNPip0aLpW?=
 =?us-ascii?Q?I2nIw+q9kAKIqpnHYaHtP8e36bB9dHfaKArq8lJtsBHiEOud9vhQNCmnBLvY?=
 =?us-ascii?Q?7uVSBHd9ufbcN+Bk3qNDUmkbnn2LhT30UEohVwrSLtpXGoGDU1HcJXREq63s?=
 =?us-ascii?Q?H8O7z7LzY4adpR2qEr1pTlGYcw2U92CjchAkmlf5l2i9P36LNGfeBq55OhtW?=
 =?us-ascii?Q?2Z7t1IcIAlUncm/Eqxr70ugfgoZEv1i29cflo4hc1NDuflVhOrAjqwyzNUi9?=
 =?us-ascii?Q?u5FJ6kL6uf7MEAmoAZJjHlREhOsW9TXkQ0LiFVhDqo89d/AulZKaJ7wlYT/K?=
 =?us-ascii?Q?47w7UfeezqCgEEyXObX39lsmeLTH0MpFghX9OrI1fhsozssv4WW7yYiZKWPB?=
 =?us-ascii?Q?Y19Kf8wVxfB/cU7/yCxEsN/BVnxwXmdFnFk8o16RHmF5W26WzK4FyJ40s+7F?=
 =?us-ascii?Q?yCjg0vm8efhOBZLNcmVqA1Idmok+UToPx/VWBFWEcTRxBx0bZm7r2mqsnCsm?=
 =?us-ascii?Q?C+4QaTeVZKtEK9gg7/kO9dMzMbP6+Y0a534vJOFsWBVoM3GPbu+UEr0t9bn+?=
 =?us-ascii?Q?d6cUMTofvzGOUyYbNiY69XMZMCIt9KIai7zqCZS+QBRI/MMtTYHnWfyoKFzh?=
 =?us-ascii?Q?OzgwpL5xKTCTVBVUFhIahD0ZVuLjftkFlTFoYE1iuEFr8vwch7T5ymRic8sn?=
 =?us-ascii?Q?4w0bFfCP9l+12nUUNfAWbEyu98enWkzBm+tDPZIBchfW2FRLU67FfDY2oZ09?=
 =?us-ascii?Q?/wP/PQxFecfQSIctU8LMVXNY7dEtRZjPqgfgm8nEodoitOp+Pnp8P+GxAKFj?=
 =?us-ascii?Q?+FVncDYIeXp1b/MGKxbAu4cJccNYCocxMtSx1tfbkAelDfUtRvqO+Yv+MxD9?=
 =?us-ascii?Q?0qAE8z3Bpd/uI+4GPxY9p/o1OU6jDwHb83tdls/VQiX2q/GKLAV+chcVYjfd?=
 =?us-ascii?Q?+hHrsh1Xw7aOpAV2t9OqKcvqqcGdKHMSxBUU9N14LW/hc1ajwEusVmvCCbaV?=
 =?us-ascii?Q?Zp+fy3izpC7+AY0h6xFIFBvVIwfGbxJdVblgKYSsy/0qczMG3UptEFE95Rys?=
 =?us-ascii?Q?7cULEzVCpp9mtDyBgF/p3qB3HURHAGdi3ss/twXWCGHdZ6HYAfhGLdVe8K+Q?=
 =?us-ascii?Q?pUJwPGoSOa6zuC7qeU8f8doCto491sBSoHa/Ig7nNUDr2ilVxYpchKvqMaH2?=
 =?us-ascii?Q?GV6nIdSq6ybA1AydEiTxeyZrNPaLlz4KrcBMVfMgDyLWYAvcTFVQLAt6XJBh?=
 =?us-ascii?Q?lFEs6beROzA6IUUEjOMx5F4bcPJl/0ISsrZiHBXN8ZTLbpsLar75WUlXi0Y+?=
 =?us-ascii?Q?zUqr/0a1znDznL/otlobCAM+yySwp2MSZYMOI4qc5z3J+R0s9XcZppQPOXgb?=
 =?us-ascii?Q?efmaWIU672DmOsmYPkPIXUit8STNvwnrEYnSRw18tGZYA3T50RbuFA5728AS?=
 =?us-ascii?Q?Sng2WBNW+ljIYbv2a9ItRmoX5lxcy8pK0PaigOT18ljs+V+xam6PAeoBEkbj?=
 =?us-ascii?Q?81CWph+tc97dgm6RLkGl0RpdyfNqapwyfaRACdIZr3THfavSGDvnkBuGeUxl?=
 =?us-ascii?Q?BtoWUo2V44UOL+ztTOeYnIDTen1kTioSQs+WLTkacmAu0CiHBuDwqGk/eeaJ?=
 =?us-ascii?Q?8FY29jgV8g=3D=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fbee99bc-af30-4c38-1eb9-08da335bb833
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 14:37:05.4556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 F0HsNjFOP73z5aBHqxHwX4Xgkv2qNzuQ/1eNjA7cBXDSMsZ7J2Z8cy+RsFUVUTI1vXMqvKJ8KxMgByxGsN0GPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB2187
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 14:37:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165502

This class executes an anonymous function which sets the
below variables
  CVE_IGNORED = CVEs that are ignored in recipes
  CVE_PATCHED = CVEs that are fixed by applying patches

It does not consider CVEs that are ignored in
poky/meta/conf/distro/include/cve-extra-exclusions.inc
and only provide CVEs that are ignored in the recipe.

Default values are set for CVE_PRODUCT and CVE_VERSION
to BPN and PV respectively.

Considered setting these values so that anyone can get
below information about the CVE from the build.
  CVE_PRODUCT
  CVE_VERSION
  CVE_IGNORED
  CVE_PATCHED

Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
---
 meta/classes/cve-export.bbclass | 37 +++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta/classes/cve-export.bbclass

diff --git a/meta/classes/cve-export.bbclass b/meta/classes/cve-export.bbclass
new file mode 100644
index 0000000000..5ed5760970
--- /dev/null
+++ b/meta/classes/cve-export.bbclass
@@ -0,0 +1,37 @@
+# This class is used to get patched and ignored CVEs from the build
+#
+# To use this class inherit it in the local.conf file.
+#
+# It executes an anonymous function which sets below variables
+#
+# CVE_IGNORED = CVEs those are ignored in recipes
+# CVE_PATCHED = CVEs those are fixed by applying patches
+#
+# It does not consider all the CVEs that are ignored in
+# poky/meta/conf/distro/include/cve-extra-exclusions.inc
+# and only provide CVEs that are ignored in the recipe.
+#
+# The product name sets default to BPN and version sets default to
+# PV but it can be overriden per recipe, to get the value of
+# product and version use d.getVar()
+
+CVE_PRODUCT ??= "${BPN}"
+CVE_VERSION ??= "${PV}"
+CVE_CHECK_IGNORE ?= ""
+
+python __anonymous () {
+    import re
+    from oe.cve_check import get_patched_cves
+    from oe.cve_check import get_ignored_cves
+
+    # Check if cve-extra-exclusions.inc file is included or not
+    if re.search('cve-extra-exclusions.inc', d.getVar('BBINCLUDED')):
+        paths = d.getVar('PATH').split(':')
+        cves = d.getVar('CVE_CHECK_IGNORE').split()
+        ignored_cves = get_ignored_cves(paths, cves)
+    else:
+        ignored_cves = " ".join(d.getVar('CVE_CHECK_IGNORE'))
+
+    d.setVar('CVE_IGNORED', ignored_cves)
+    d.setVar('CVE_PATCHED', " ".join(get_patched_cves(d)))
+}
-- 
2.17.1


