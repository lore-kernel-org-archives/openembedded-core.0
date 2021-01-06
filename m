Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.55])
 by mx.groups.io with SMTP id smtpd.web10.5329.1609922983895404234
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 00:49:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TKiM9iOt;
 spf=pass (domain: windriver.com, ip: 40.107.220.55, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3uV60gQ5M1A+pyvUWWHgxpz7jrIAWeGQVOvMlhyo1JTdzpUzBlahWGUxsEafGAYqtWn0fEKFeBJTF0E6K+gKj3VqIAaI4a9+rSkfo2ppvgx5Xeq3XoXNK0KcrHjUW6vi8HmhZ6itDsQJwyFnLin7skhXruXgrdqJGeMtMX08oTQ+xLeeUjNSSDVODKnw5j/iaO2nBj1Z3J4d2N9EiD2JbXRHDZTCT6yxJ8dE3CYvF4ElcZqqDGLkLAE8iGIxLgUmGLDJPJVRLt95I0M7UuR6LYh+WZ3mddaj/sE3zICs0frINuSKukwPcLJ/DLz6T/C1kRTuuWsmFRrQppm058UNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmuPXHc31uEqPmQR/u/ERiWUiuYm5XcBSKeBDkgvzpQ=;
 b=I6vPft4g3SdeeQR08bs+l/jndQ2fKtmRZ7A32lwu4uE1XyrINFwl29DdvzgQsnekQnsNho51LH9B4zjdtP0Mjre3kNoYwp8b7viOycbWF/R/I+Jc/CLo8nxW2Ljfr2FoJF6DnkAM8M9h+6xmCDELq7A6H6ZkrsQwV1gesejl4PqcSIE5USUHvY1j8u0el/MyDA3EMe8KUel8LeoljA8mHEH10uzPde+4JbYjl4rC8kODoWxkPi9xhdN/EHnlTUd40LhduuuvZtYQgAg13zGIlJ+qf9vJnmZuP60kvKiJx3VyQ+SepwydAbiosxX1g8YubkxAChPQJ8IS+XHh3EWCLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmuPXHc31uEqPmQR/u/ERiWUiuYm5XcBSKeBDkgvzpQ=;
 b=TKiM9iOtHroW0SjYAATRnCgWGIdbu5wddjhz5pXBUBdejvVMnfpRIAetYkzr8QswOLvxDNy3Bj0GISTxylYH7BwrYHPL8Gs9XSKSN73LZT28FK+6x2WKlPdMqPHBd3SGHySKh68F4JJ1j/bnWE6qCOyZoysugjiCCPDqELWvAIQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB2765.namprd11.prod.outlook.com (2603:10b6:805:5f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Wed, 6 Jan
 2021 08:49:42 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3832:57b1:4d51:5781]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3832:57b1:4d51:5781%7]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 08:49:42 +0000
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libpam: support usrmerge
Date: Wed,  6 Jan 2021 16:49:27 +0800
Message-Id: <20210106084927.30657-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2P15301CA0004.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::14) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2P15301CA0004.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.0 via Frontend Transport; Wed, 6 Jan 2021 08:49:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b09f98f7-6583-4e55-b382-08d8b22002af
X-MS-TrafficTypeDiagnostic: SN6PR11MB2765:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2765FAC5A5FB3CC953A4D47B82D00@SN6PR11MB2765.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:155;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7yzxrMk4wphVlOkj/5CKkR3LQbPWxEg9O6N5vbVKpAmerLwYJT2hn5I4DT9kOAPYKpHqEwvuvOz6rrZ/cv5/tUo5TPdrxHKF0c7y0nf5bRB9E+t3qHbD/hTVWbcRBOhLDPLICg3CoOBd9iu9NGIKouKcT+hHZqlxJSN9NTaJL/4/j3hgC8KAr5taR3a3ad9OT9v/zRkZjyCOFgqEDlXFOaK+ePR/7Dj/DYmfg5mp9ek758qDH9QtWFGLIg3J+MdA5KeBQFV4oHqb1RPG0tyQ5nGkMRPG6WiG454Vbfjmp/mGc6hguyEbs7PmNb1kJ30WHgh8LRcDQbk7+i2cNmIhCV/OwwJ6N9PQE09jHpPqpzPuxBs84kYiUMaQrgbLUixaZIcOqiA/54gMEtHo789K7xUZvKmZvRc4YtEheXdPnJE5h8zVG9dMJwj4qNxVXVmaeAsjBBpAnC6/sv1N48DAew==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(366004)(39840400004)(26005)(66556008)(52116002)(44832011)(86362001)(478600001)(6916009)(6666004)(6512007)(5660300002)(66946007)(66476007)(16526019)(2616005)(956004)(83380400001)(6506007)(8676002)(8936002)(186003)(1076003)(316002)(2906002)(36756003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?+E619Q7GqK/kyatP1RwPybCLjiPKSubnr3ofiWH0/a+Hns1KW5GuQbxf2qL/?=
 =?us-ascii?Q?nvqRdppx9G/XAiFscr9pmZ+h5iwEbsiEHyY8svuVON0HG6wQJWiDBnS1MorJ?=
 =?us-ascii?Q?7LeXcoQYApps0GLVxaFFVaX8zw92STvCsiCe2DW3BkDidlQvMwovmCbdDT0U?=
 =?us-ascii?Q?gh5ribzjsdrQoBdDUXmDpvh2UnzJPqZRURZu/K7lggxBS/rqF+3poJZuv/UE?=
 =?us-ascii?Q?rKVCHwBO17HvKpdCNsXdonFeWEzkEVDkmkGzet/gXq1G8xlyMGx9n788Je9S?=
 =?us-ascii?Q?s4TLSA6x0N/qXsBuSi+WMeO8rYMGYwLnrdkjvq8SWhD6RUhaS+tPOJGTmaq2?=
 =?us-ascii?Q?Vxq7UCy7VAq0vGX6Wmm8Mw/b41EcE7ntYp24wUxYpf99CyLKpHl9CViDK2kE?=
 =?us-ascii?Q?pQ7O5HJQvFwgtbFqy9UzHHD6xAsbNoEs1fvKJMqtnEKQJF3e/Y2Xe8mSs63Z?=
 =?us-ascii?Q?U1wEpI+Uk0E63nLQh8rru8cPKmsCKIiOdYW1YPTl1xy3cZR2yf4UEiZw7noP?=
 =?us-ascii?Q?SoFmRxMyMpdgz2okQDdSdaUq29ij9C93I3OZMx9OYrz5nCAnEjVWpCTw9Q6M?=
 =?us-ascii?Q?nGySuNKkS64ihJCJ6FhrePbI/FsKUCJW9YbYKijurYcYO4c6NIFHaWUaGq6/?=
 =?us-ascii?Q?UiwfplXkvFcdZ3sYKf5ZNrDRwKx9FhJptZNdo8NfB32NiR1m+bM1DrGvTpF5?=
 =?us-ascii?Q?c91s+WTkxGcFnBeYjz/379EshrczA/WBu/nl3/FJXr1uPLB+LKqrs4GKE5/k?=
 =?us-ascii?Q?qqCSthFDmncfGQKplzwfs8gKLkf50JsjLMFcwPsAKUr7pxsv0h9KDh1BeckE?=
 =?us-ascii?Q?3i8nucv/5R8wzOzW4aiZQXE5sF37d6vaW/XWLrWRogNNdZRnqpw64OOaItqh?=
 =?us-ascii?Q?b0oUm5brglZJLko8SHkPAAhl4ae2UqB6tqLEPOdhGlPlA0F5LzQj20hEM4R0?=
 =?us-ascii?Q?ctIhaSoi+9bfld2//WpHMAsXssQUMmrTmmV9Zw4yOwsJld6SGPBeQasp2jMh?=
 =?us-ascii?Q?k/r2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 08:49:42.5712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: b09f98f7-6583-4e55-b382-08d8b22002af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5y3PGjwfg5x/QsPtkxs9l79w4ERGELG2Z6lGcEz0cGqxks6VwTyD8hE9UOkvL5MUOHYDssex+kab68togW18e88wEfMQloIliM4tMtnCCCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2765
Content-Type: text/plain

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-Makefile.am-support-usrmage.patch    | 28 +++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.5.1.bb     |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/0001-Makefile.am-support-usrmage.patch

diff --git a/meta/recipes-extended/pam/libpam/0001-Makefile.am-support-usrmage.patch b/meta/recipes-extended/pam/libpam/0001-Makefile.am-support-usrmage.patch
new file mode 100644
index 0000000000..5c6bc92705
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/0001-Makefile.am-support-usrmage.patch
@@ -0,0 +1,28 @@
+From c09e012590c1ec2d3b622b64f1bfc10a2286c9ea Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 6 Jan 2021 12:08:20 +0800
+Subject: [PATCH] Makefile.am: support usrmage
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ modules/pam_namespace/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/pam_namespace/Makefile.am b/modules/pam_namespace/Makefile.am
+index ddd5fc0..a1f1bec 100644
+--- a/modules/pam_namespace/Makefile.am
++++ b/modules/pam_namespace/Makefile.am
+@@ -18,7 +18,7 @@ TESTS = $(dist_check_SCRIPTS)
+ securelibdir = $(SECUREDIR)
+ secureconfdir = $(SCONFIGDIR)
+ namespaceddir = $(SCONFIGDIR)/namespace.d
+-servicedir = /lib/systemd/system
++servicedir = $(systemd_system_unitdir)
+ 
+ AM_CFLAGS = -I$(top_srcdir)/libpam/include -I$(top_srcdir)/libpamc/include \
+         -DSECURECONF_DIR=\"$(SCONFIGDIR)/\" $(WARN_CFLAGS)
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/pam/libpam_1.5.1.bb b/meta/recipes-extended/pam/libpam_1.5.1.bb
index 486c9d8aad..8c008a9701 100644
--- a/meta/recipes-extended/pam/libpam_1.5.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://github.com/linux-pam/linux-pam/releases/download/v${PV}/Linux
            file://pam.d/other \
            file://libpam-xtests.patch \
            file://0001-modules-pam_namespace-Makefile.am-correctly-install-.patch \
+           file://0001-Makefile.am-support-usrmage.patch \
            "
 
 SRC_URI[sha256sum] = "201d40730b1135b1b3cdea09f2c28ac634d73181ccd0172ceddee3649c5792fc"
-- 
2.17.1

