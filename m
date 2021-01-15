Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.82])
 by mx.groups.io with SMTP id smtpd.web09.1864.1610703956187643177
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 01:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=FnRtMwuE;
 spf=pass (domain: windriver.com, ip: 40.107.237.82, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NrqZ+9y8Smm38V1P8Exfc2Apzdtvku0pJRlsj23wa90NgS3vXWGtzLPMUIAno6EWEn/ktdSVhj+w8YbsMcKEl9FSoypFP1kjbZ6WwkS+rt0yFBjYeYzv6h4oH2c22IG1w5LIHr/9EJ+7Zx1G1pr5S5pgz0cn95f8/maKTCNleQ11+mtMMPHwWP/mtI1Xn1Sl7IuUXrRJafZneaYmcdggXtYYk5Btps/rh+iqzGooFlbAXLTl2f6L+6EwO18g72lNJ0Vc+IzjJSv4GtrFlanV538uQ1PoV8VFZHOqy4/QLQegMoyzSmxNbOmarTVU2Kf9n9xvsHqaVTypNjzKX4ilkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=870vl/wLrQIl/5vHrjRZSoGkunBQxIHA6tSDHbcsveM=;
 b=DzCz3/7yyppEjAqO0nfWbT3ekrd3EeLfuJUbRu8EKBOshHsLe1RbLzaXQUysdDIYt/8dE3gAf06Fa6vVnpDvD9gDdqzp9AuB7ivAZcsbd9vL/1tRypC1nrDtyHSJhnR/q+wHmkI/Zxo/wZo7JUKQLGXJ9toghvhNxnVGjm7w5ZMKAHmdfwVnv9uP8+S7n8lHj/nS8bXBA6xMXbDiDhreY63/BZXIQKq53K9AGlgfRSEWkc9dF1YG0EOUcVhqePHapNyXuoHkjF3+HxE2F4ENH3GUqnD4xvyyFTiFpoNqVlANNkFo/DXbiHYW8d+BeoYKj51dhqTGnCaPnLdCPhmmjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=870vl/wLrQIl/5vHrjRZSoGkunBQxIHA6tSDHbcsveM=;
 b=FnRtMwuEDlLvKZHr5xOSYP97OluMp6JWzp3N5mq8DZ+Zg9IeeS8Avke9ZlA3rygjzB9o/yuGpskiwU6A1eVfR+6Pk4PftYw5tOGynN8hmy6zDP8vdHBvhAu3n6jyL25aSZF89ctHGsLGs2kdYqO/cBgMpUx+nXX3b5RKZBSYWOA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4369.namprd11.prod.outlook.com (2603:10b6:a03:1cb::25)
 by SJ0PR11MB5040.namprd11.prod.outlook.com (2603:10b6:a03:2d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Fri, 15 Jan
 2021 09:45:55 +0000
Received: from BY5PR11MB4369.namprd11.prod.outlook.com
 ([fe80::2d75:bcae:f805:57db]) by BY5PR11MB4369.namprd11.prod.outlook.com
 ([fe80::2d75:bcae:f805:57db%3]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 09:45:55 +0000
From: "hongxu" <hongxu.jia@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] deb: do not insert feed uris if apt not installed
Date: Fri, 15 Jan 2021 17:45:36 +0800
Message-Id: <20210115094536.18651-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20210115094536.18651-1-hongxu.jia@windriver.com>
References: <20210115094536.18651-1-hongxu.jia@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0012.apcprd03.prod.outlook.com
 (2603:1096:203:c8::17) To BY5PR11MB4369.namprd11.prod.outlook.com
 (2603:10b6:a03:1cb::25)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HKAPR03CA0012.apcprd03.prod.outlook.com (2603:1096:203:c8::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.7 via Frontend Transport; Fri, 15 Jan 2021 09:45:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74c46d93-dfff-4e10-16c9-08d8b93a5948
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5040:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB504041D65EC781D8C05112B294A70@SJ0PR11MB5040.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ei19Z1gO/FuAqPpXyCrH+9CmSabTKC7R5Z1ik+fdF6Lregq14OvC8sKfoCetvhkjzxehWVphxm1SdopETq84FQ+OGfkl2EZ1OgmELbd+b7H2JG3oOFLTivrk/tPwMF7KR22paurUtpA5hpSkwFc9Ly2s9wdOgjAmDVjFiKDMlZ+aX2HJEIUWHCJwftPoSSLoxhFcTcGkZ6KgWueyGoPlko3RU1rflh0t3VKEtG+Ta11IgNxfv2b/x6joCZvirfJvPS2yb9ihS1a0EDcjlZIxTXQz2JLgtnqg1UZ6oYSC2UKIbZy71T+k0O2LYvwfcyt9sSEPOp/7byGt4EEps2ull8puuiKcAhE339LEa+X/LJcadat69orxt1lTdDQM6g7AV4V+58HQ9Ew/BR2xGvny2g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4369.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(366004)(39850400004)(136003)(6512007)(66946007)(36756003)(316002)(956004)(66476007)(66556008)(6486002)(478600001)(186003)(86362001)(8936002)(2616005)(44832011)(83380400001)(6506007)(16526019)(8676002)(5660300002)(26005)(2906002)(1076003)(6916009)(6666004)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?B2QuwAeGz5io9ZXLuaNNwWNoxYKs2/SOwchdwPXtsX38UV2c3xsVYpgqeGnx?=
 =?us-ascii?Q?hUzRomvlGomZ0BeRAtLY824gQSDNVn29qkahokOSwJVSA7nwwGPfjB9bJmqO?=
 =?us-ascii?Q?mnAHf1xZ1exnIZS1lUsIjn2HvbR2DWz42MV0/2JJganl9aNHY8Ahw4FwWjKw?=
 =?us-ascii?Q?UnOUQJGsOAhZuoZA6ThCctGyGTb3APkc0Yqv89MnlcvDLc6QpQqBaGOTtD8u?=
 =?us-ascii?Q?8SAyJ0BfLRvLIFRQuxB7Fgx8mAawgvSNJD/PJf/MQetfWz4l9KXcxGlfYT4y?=
 =?us-ascii?Q?zHwQXx+eEYgI29d2sJMCOSELpNsy641Z/qPaVrEtWlKVXsW6lzRghVr/DGej?=
 =?us-ascii?Q?G1/vIpI4wvOz7FXeWXhW+g7c6W3zL3cmEWDk/xl88EgCf0gA4pesSXHHfGjS?=
 =?us-ascii?Q?M+ge+fG7Ytm3HUv/HJBnLeUCqqjK650OrQwdQE24sslJVI+QEdYFKMa72PBN?=
 =?us-ascii?Q?LINaCF0MM1/fdL1VlHAZP8LKFlvorB9HR0Nw27QowUw6nRFnbN2qMjTZliFF?=
 =?us-ascii?Q?9y3wfQ7fDL64WEo3mHXLJqH9tqDc7805+kiY9f0GTz/1HSJ9Bm1m025+6cc0?=
 =?us-ascii?Q?mAI/JPkddEa6VulL4d+BTrKQYQ/dS4VhjBli2tSAw8TSePE9ogiYKViHqgZM?=
 =?us-ascii?Q?UDtVqPiprRbnItLAAyeGxE5nGGBM0kWeaw5BWrfcUqf8QAcoAwPB4UPFvo9u?=
 =?us-ascii?Q?lNyzy3HNMFbBsCwsRuYSD/JWT67dcOLpMaBFT632FIjIRjS0l1I+LpntMKo5?=
 =?us-ascii?Q?mq57+ofu0aMa+JpEZTahG+8CDUZF2IuxgLYUtSvz4bqZOC8o6lEKhOdIgrKh?=
 =?us-ascii?Q?pStH1/BtVt3X1mYpcI7EjBN+25LU3cIq1dn/QMXpUoS+f17SGk5QbSe3IsQy?=
 =?us-ascii?Q?/ZLxpsqCEe92GCb4W84eY8yFBtrxSh+X06BFaTNfEbGHtLyFB+v4Z1fMd4z7?=
 =?us-ascii?Q?Z7GHymAqX6VBBonddQfCmS1CwJWNcYMnx6MyhhG+bQD6cBL80jPDo5QQpavW?=
 =?us-ascii?Q?SLnP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c46d93-dfff-4e10-16c9-08d8b93a5948
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4369.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 09:45:55.1531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rkuZBgm6bBQ9IKkzL9L48rE9WMzCR609JDSpsOufsHLs5/RvzA9hKaqKoC9FRIaFEzoW6dNa3eqm5GtkvsxmTluCuOgtQzCnQ4Lkmex62Fc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5040
Content-Type: text/plain

- The dir /etc/apt was created in package apt, if package apt was not
  installed, there is no need to insert package feed. Otherwise, it
  will fail with no such dir

- Output the result of apt install

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/package_manager/deb/__init__.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
index 10ad707c23..1e2278d6a4 100644
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
-- 
2.18.2

