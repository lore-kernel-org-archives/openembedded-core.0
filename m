Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.45])
 by mx.groups.io with SMTP id smtpd.web12.4737.1610768964399833033
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 19:49:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Zw4cCGn4;
 spf=pass (domain: windriver.com, ip: 40.107.223.45, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=laucJaXCB7DbSE/ZalGu+2mgy3M/k8B/beNbTU9HLe8Pb0lVdFn6ZA6hQ0U8IyZnEaRMEZTEhDYK9rGAiyL3u3Mln2HRWpK9RLfJVQZgXKFhulW6/i0HrJtHQlhHaEmIC5oxeHH2SZ8QU4ipsEll3IStrre5YN6RyVI9E7/QP9uzzoL5uTlnIZmD6t6vQkJeNF2VIvsPKmyqsyAQ8BB6P0KPWlOMJ749OcxINaQkLtpz5Svbkeh+AVOiHXV5YwBwJADgI7ytV8+WnAcYil1ReoI9SsAAfXGsSHJ80k9xyWMKVW8rNEOPRbivPJ9rL3ND7wvg20++/kYDkvF3ibv4bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rm8jM1AaF8kfc5Pf6xO0a1Bi2nNByJpBnM8nt518Bfc=;
 b=jg1CavgUqXvLUJv79uQ+VIvpPw8Fwo/3RuWXZDRzieoV2v83PSvEnIj61Is13YiaJN5TnX8MhyYHex6Rfcf2mXPXIVD7ay1PvdE0boHZsHfSTxmjJXp85x7lP1J2YSPeIWpnjNvsoIRZE2X/KHOxSBqIYfyeAj5VobE8ynIlYs9g7BEX+8YU+1sxy1TQ9wAvUqGy4Q34qKBs8vZZLrJDLbFC7+iUR8EJMlAKA455y+hgba/tlqmYBZJd4Bhc0pYyToYQWOWIyP4/cEfpJ7lIRo19J3WvMrs7W19AcPRV4Kr2JZoidtRQB+jyvzBflYb4EGVKy8uZzeNqZcM13KfcpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rm8jM1AaF8kfc5Pf6xO0a1Bi2nNByJpBnM8nt518Bfc=;
 b=Zw4cCGn48DoPpd0OZbbHO0EAgXAnGXfbaxw7pJcAAhtE9vxskhm2Zd8N+m5hoQhzFeRSecHLlOLYPolEvyIOW3Tuqdb7jLyw5zUPIXEZe+FzaU29iXLYwoi5mG+9T3f8y/CJpa/8ZS+8T003IqoFbLS1MM+usZyM9M2YfpRcalA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4380.namprd11.prod.outlook.com (2603:10b6:5:14e::20)
 by DM5PR11MB2012.namprd11.prod.outlook.com (2603:10b6:3:10::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 03:49:23 +0000
Received: from DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a816:b4fb:846e:9417]) by DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a816:b4fb:846e:9417%6]) with mapi id 15.20.3763.012; Sat, 16 Jan 2021
 03:49:23 +0000
From: "hongxu" <hongxu.jia@windriver.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Subject: [PATCH V2] deb: do not insert feed uris if apt not installed
Date: Sat, 16 Jan 2021 11:49:11 +0800
Message-Id: <20210116034911.31032-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <32c70df536b241c06742c5e75a4aaab8f02f9d88.camel@linuxfoundation.org>
References: <32c70df536b241c06742c5e75a4aaab8f02f9d88.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0024.apcprd03.prod.outlook.com
 (2603:1096:202::34) To DM6PR11MB4380.namprd11.prod.outlook.com
 (2603:10b6:5:14e::20)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HK2PR0302CA0024.apcprd03.prod.outlook.com (2603:1096:202::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.7 via Frontend Transport; Sat, 16 Jan 2021 03:49:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 924982fd-7921-4eef-873a-08d8b9d1b64b
X-MS-TrafficTypeDiagnostic: DM5PR11MB2012:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB2012FD7FCC35A09C6075D58B94A60@DM5PR11MB2012.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jkz/lWC3txPevwUiu/vkigZyDavC71f0N1aUrITBy6V+upz4riJvdFc5H0Sgutc3UvsuBwZlyi+upy0YqP19qIsbNq8NQyNHI89dR04pEhfknHBfaGFO7n1XgqX4odyttSYNHGKRxLqvu5aOZ0yaILVvmMeJvIeJ53UEi9SojJGB83uCvKB4eu9L9bA1DMv38MkyDO1xNKYY9t7K/4SlwONZdlw9XO9V9NxMdu+JwkuarfXZdav1C+u/uh9Xw3LcAO4xLxm8M/9URlQUBjWdoSPcPCxgmT8J/qrFtWcHF+Zzz435CTczliaHMQjCxphSsqWjLBEvN2Uuexgc/KAJ7ZDl629PsGZvcIBvhx1ETFSUw5d0Oxaqg3lr7BBSnzqqdMLC4OsVkmDAQecOtfObGw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4380.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(136003)(376002)(396003)(346002)(83380400001)(16526019)(8676002)(52116002)(5660300002)(36756003)(66946007)(186003)(6506007)(6666004)(956004)(44832011)(26005)(2906002)(2616005)(1076003)(66476007)(6512007)(8936002)(316002)(478600001)(6486002)(86362001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?9bjOvO/d2RFVOexiQkEu/bK77bSjGut6SHlGiLEcK29Bz2f4PorpKxehDo4F?=
 =?us-ascii?Q?CAj2dpmFWyu0iEksRGMUxeijgprXHUrZnTeQFEvKjE/y0qbKzbTYWg1nwtKD?=
 =?us-ascii?Q?8uJ+8VHv+aYt4XGDguHWCOHVqTZd1W9gnh4LPZJCSPrk447N/JQxNqxkBnVG?=
 =?us-ascii?Q?o3XGMNAQkwil3UrL7aZS/SHXV7BFVeCN2lAzM3IEIK3c9tTyPxAhEMcQ2jIh?=
 =?us-ascii?Q?ToGeHurSpjR+NB2eprG/zkkSgffj46DheiV7d3B+ax+/SID9gOIKKwvfyipL?=
 =?us-ascii?Q?YS9DcEj7A+BPaV6Yr8NKO4F0xSng93ME6UXRhF/nW/xIYSKs6lTRzzp/QiJc?=
 =?us-ascii?Q?SRlSAU49n7GZVb4IxIRdiZGGcm8/XL+okKcZ3SFLPJ7j9vRJ4FzYJKCGHmKg?=
 =?us-ascii?Q?7bNDVw0lCBZvwjZOSzP8uNLrWGb3dP/RSwjyKIUxy4LL894l3CG3NiUKmHBo?=
 =?us-ascii?Q?HdlHXI+Guw4rLjml5zDn5b9fGtDZKMZx6RZ2SYpDYMc6mXgBqmsYbuWD7vPN?=
 =?us-ascii?Q?OHGrMD63pVyHgHiCTY2ICh/lWhjIsUqCGti8fjhRuFqnu85pANwqOwOdZoBn?=
 =?us-ascii?Q?ctFcSZ95u6ncUpuJHYrgIAdxBOe8QIZMJlbHuxU/ooGRKOhrq/aiL+tM1hHy?=
 =?us-ascii?Q?wOpPry0tMARXv52f6aju3Kd7vuSb4XvGaR1t9kqPnbdduImMTXSGl5TnEi46?=
 =?us-ascii?Q?Y2of1xOKiJK0MxFNc8M00FWSJIDK1s3vfUz3Ega7XhSeog8K0agwnPCyIELH?=
 =?us-ascii?Q?fHdgSnIZhNbBaer2rEci72K4HBV4MsU64DShCvofzYdotlLAO3W9SJ3Im50N?=
 =?us-ascii?Q?OUgi8bDZO6RxjNoqb6bHmwvj7CLBEixCcdBjyGdxNP51PgsnGYgZvwc4KIgc?=
 =?us-ascii?Q?XemCxNtebxMIFsd+nevh+vHPBnIX0DN1mbUOW6+jOosAcrQVrBDR7rLmuk4r?=
 =?us-ascii?Q?PJgRUDcO3PiokGu8UMtU3PGSjOzotQY5w2+y5xcrxD0FY822bVSTtOZqmhUu?=
 =?us-ascii?Q?KNMD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 924982fd-7921-4eef-873a-08d8b9d1b64b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4380.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 03:49:23.2540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZhBEKetdCzrMOeZVRb0DWrXmR1uD6bYCMfx39qZL5L/CjbTPg+5sp6TAEOKQhHi3G58IE4A3Lgb1I/gY2Q5I37rfqX1laF64PFhJkSGfnLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB2012
Content-Type: text/plain

- The dir /etc/apt was created in package apt, if package apt was not
installed, there is no need to insert package feed. Otherwise, it
will fail with no such dir

- Output the result of apt install

- Explicitly trust the deb package repository from build
This could avoid apt install warning:
...
WARNING: The following packages cannot be authenticated!
...

- Also trust the inserted deb package repository from PACKAGE_FEED_URIS

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/package_manager/deb/__init__.py | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
index 10ad707c23..7fdfdaa4fa 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -287,7 +287,8 @@ class DpkgPM(OpkgDpkgPM):
 
         try:
             bb.note("Installing the following packages: %s" % ' '.join(pkgs))
-            subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
+            output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
+            bb.note(output.decode("utf-8"))
         except subprocess.CalledProcessError as e:
             (bb.fatal, bb.warn)[attempt_only]("Unable to install packages. "
                                               "Command '%s' returned %d:\n%s" %
@@ -343,8 +344,12 @@ class DpkgPM(OpkgDpkgPM):
         if feed_uris == "":
             return
 
+
         sources_conf = os.path.join("%s/etc/apt/sources.list"
                                     % self.target_rootfs)
+        if not os.path.exists(os.path.dirname(sources_conf)):
+            return
+
         arch_list = []
 
         if feed_archs is None:
@@ -362,11 +367,11 @@ class DpkgPM(OpkgDpkgPM):
                 if arch_list:
                     for arch in arch_list:
                         bb.note('Adding dpkg channel at (%s)' % uri)
-                        sources_file.write("deb %s/%s ./\n" %
+                        sources_file.write("deb [trusted=yes] %s/%s ./\n" %
                                            (uri, arch))
                 else:
                     bb.note('Adding dpkg channel at (%s)' % uri)
-                    sources_file.write("deb %s ./\n" % uri)
+                    sources_file.write("deb [trusted=yes] %s ./\n" % uri)
 
     def _create_configs(self, archs, base_archs):
         base_archs = re.sub(r"_", r"-", base_archs)
@@ -406,7 +411,7 @@ class DpkgPM(OpkgDpkgPM):
 
         with open(os.path.join(self.apt_conf_dir, "sources.list"), "w+") as sources_file:
             for arch in arch_list:
-                sources_file.write("deb file:%s/ ./\n" %
+                sources_file.write("deb [trusted=yes] file:%s/ ./\n" %
                                    os.path.join(self.deploy_dir, arch))
 
         base_arch_list = base_archs.split()
-- 
2.18.2

