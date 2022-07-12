Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C62DC433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 14:43:40 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.68])
 by mx.groups.io with SMTP id smtpd.web08.10088.1657637010411584712
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 07:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=khDn/EDV;
 spf=pass (domain: kpit.com, ip: 40.107.239.68,
 mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUo4TvWpdElHQSuEsAy84mDno0pWdzIya5wcdb3/pgeKTkDdcaaepdafhKda+mIQN29OfOgBr0ckEeH0RSJlHlMT5DgJ1It2KQGks+yVbtUKwDouBPMP4G+lfe4/8IuLdACokwyyyBdTU+rbhuSzOcW7YwLEmg1btLbHjknHckJJ7w7bhHgKtn1dqGC5qsEDqpdCBvWyGSPSwnJpqj7cwijgmgARH9Ra46af5nXNfTFJB5OashR4F029hGyRy1jjDNOxHW6LI86SGbdnFGdbsib0OW/VuJvtZVE5SfPKKBfzCKN5sPYga8E5kstN9sL7S7j+MVmK+pX6CYuhQQLAEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JU331S8/tz/FPMxIqmrSCsmmh3aZszJA9jOhddfRkks=;
 b=JY/zfYsgI6+bL5/oMZVBWYuv848vgGlg8M3vgqTw10wAla6/iY+Gxb5NWMV2K48U8aGfqhSRHCQn56jsN7nUNsR3O4REiZ0CmTNMQf6Ox+gGlfhvq7rClL1PXMg9UbNh8zZ5SzgFZIZlZnDKv/SzSxoxLv3LXebR9j6/4ZY37Wt0qVNoD9TrXlugqO8FDthM4XZC7+Ay5c7XMJ8bGGeuXk2lBWbdvtwJdRSGtnBAKbMB7ysE+0i7XtyZF4bBeCCya44ugflMvG0KuIHBTRysoiPl1N5DrdK7ifl3lYyB+tQ5eY9zPK9aZ36vPVV2Ojl7AiOYwzaQmilX9bxTAGXZRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JU331S8/tz/FPMxIqmrSCsmmh3aZszJA9jOhddfRkks=;
 b=khDn/EDVJmuzZ7EBmWHGcCSSRJilo8xxkxw22s2j3AWn+fpkARtu5opmPN/3haHVmycxyX75gvBA4RWa7KeaZCAmN+03cRKRm58UGDyTLVtbm5VekKzH5ofzqqxFgNqkEEQDBZJvcTBWTZYLI2xc0XxtKgNVw6O/k55jMAN+m14=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
 by MAZPR01MB6767.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:51::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Tue, 12 Jul
 2022 14:43:21 +0000
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::57:e269:a77f:d5d9]) by PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::57:e269:a77f:d5d9%4]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 14:43:21 +0000
From: Akash Hadke <akash.hadke@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com
Subject: [poky][master][kirkstone][PATCH 1/2] cve-check.bbclass: Add anonymous
 function to get patched CVEs from recipe
Date: Tue, 12 Jul 2022 16:42:45 +0200
Message-Id: <20220712144246.8942-1-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: AM6P191CA0045.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::22) To PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:89::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35a41ced-d311-43be-be27-08da6414ddbb
X-MS-TrafficTypeDiagnostic: MAZPR01MB6767:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	56NFPTS73uwSu7KeKttFyHthh11WxWHMJi3z6m6t9n10LRZGtNCLWW+70RNwhONZxpR/dqwM573rUuw8gdfsgsar8p4S2jpAif5yoaxAKQ80r0Gcl5cin3JvtdC/r6E6KDirqjJeNWRd750jLMCSQiHAaNoDNTB+wTPQmRrmuiTngCy+esF+DCNas0MIiueJI3P5Nc6of9Pddd8B5Mx594ke9gNVctYckJBCDOJ4+N3PmGWQhuiuU0fKDPNm/rNnFc7K0O5KA930T6UWt1RXQxuvkt75fd/7IJ4seGK1wRFnnCQOGc3GvyhldoEqxkT1z/tpKU9BE0ocv8BGUBGWyVWuL1PwGJf11+vdd42b3uKsksoKuJkw2puhfMRlwx30zh95SpxB5bZRvRkyYXg9oNoxxt3VWcoJNhI6yXhUO7VvzV1z895mB2eXBZ3Uj9/k4U87NiU3PYFifUSxI2qOeyi04VKoI3PoBFrJLvMXlCIV9qD61sdcw3Vu6H8whI5hF6A88gFg/7X3dB3+LQNQp0cPdM6EHfPs5fHszPavH5vDy8LI4GUX1PO8TWAd3rI7EQDGsf41DXmVMWXgidZYbNKoASRzMfQrj3cod7W7H7a3CRXK3cnzs2+g5GVgXX509oXGI7wz8Qh56ozm1XLpHacUJDozvMD3QhZldQynVxJXYU2+YKf2XbdTn3hYYy8tX+cUW6Hgh3dm78wO+AplMBzMCC9+VLsHkRvDnUZk3zM8BWZH/Dd1P+5nU8ngUhqnv6ERY95YUEtG/6dTkKwkkzmMHWTggnteQg7B39jC8O9vY7cVM4mq25/6m7LDTvil
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(186003)(2616005)(6506007)(107886003)(6512007)(66556008)(38350700002)(38100700002)(1076003)(52116002)(26005)(86362001)(2906002)(6486002)(66476007)(6666004)(478600001)(66946007)(8936002)(41300700001)(5660300002)(316002)(44832011)(6916009)(8676002)(4326008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ks02c5iefFZHlY84ovKJB6H90adgmPJPFMIUlPVxhFPl5Qkw35OkQOBloCR4?=
 =?us-ascii?Q?HjPbxVWBDwCIZWRWzcE/o3Gmm9osdIrjLBjqBazJkWkrijTf5/DxgoomwnN3?=
 =?us-ascii?Q?vwR6vdQtiCwem9JLfxcpELeeJ/dwZ2SLQXrZ0cVdTx+7/pZdnzyF7z+PPOIQ?=
 =?us-ascii?Q?G13C+YBx9zY9uOyyZaBYoIuCDwNX6g099kasUIeJ8zmddLltB+CU3EQfB7OX?=
 =?us-ascii?Q?y0YZxQfTQHGuesWNdgOIXTTy6EulZpODVo23Wl0hNM+ykiEY53bCzGhWblsy?=
 =?us-ascii?Q?Ych8ifbcLRUwCrLq6nHefwIKRo3OPSr9VlC5CPHcYIakS+wg+7U8JGG2dLeM?=
 =?us-ascii?Q?AqGix46S1hxTabutJiNa3yGH3taePmSTIVeuoHegu69WQ7IzQik4HXl9R9Np?=
 =?us-ascii?Q?wAVEJfH300zn+1c+NcZuxJhERKr1/Ozq6u6sDoViSinYrpU6XOXIpXhl82EM?=
 =?us-ascii?Q?8O/5Iw0CQQW9sRV/1WXA/CWDCwDTbUzsBSN7PpvvJ6rpROnp5VwhNS/tlawr?=
 =?us-ascii?Q?fjoGRSik0p52s2fuXjB6r2A78HgV42MOMIsF526q/dk76EqiJLuJkB3m97ld?=
 =?us-ascii?Q?IDI5rh51c92T/qGKHwCP4DGLOzc7N8ZwHfN3M0zs7AE1n5A7e60G7PMfAmSf?=
 =?us-ascii?Q?Hqo4KRFGb5HwA24sMjFFsK+fojgrjJW30QRrod1TzRV7MZRKUhY78fSQ0lu7?=
 =?us-ascii?Q?qGIKxKXZBDf3R7CEeOGYvBuwJTdR9jgXsZEfdmG+5gWSJh049084B83vBZF3?=
 =?us-ascii?Q?mXc+ZjZb2Qsh5aPy8xy4Sq2A5KxYP8z+3EiZ7tR97KY1K+4ECtMvBn3HkkKI?=
 =?us-ascii?Q?Y5g54j4ARYnZTtYWon8Jr44qliLjWg1q//GNrRDsaib8D5A306uGBQVgBF3w?=
 =?us-ascii?Q?GZ8AgvDVMXR2s9Qxwuv3IKn1shruzwWJ/An+wxF3ex8hbbisvVTF+MXmwT+4?=
 =?us-ascii?Q?zgcVuigXlZQzv60l1rzDuoM0mIKZtYFKzJvoqTjdiuEFNqlrbaBZjdJpwW5k?=
 =?us-ascii?Q?w6aWlDUKMEVljSOFIV/GA//ZIUqoPGRgW+qvvrCoiYfJT4AFpGUJ05yK+izk?=
 =?us-ascii?Q?b5GILAtWTfpp2lLOPxZn+cWvvqvLu3O32fbQ6mOnuU/i3fip1lvitu2mlFp/?=
 =?us-ascii?Q?uXb54ME9PjYk/0smN0tLKwp2S5Lr1yTqDtnOoyV8fhoamUSgXv/s7YGtWaaK?=
 =?us-ascii?Q?egDN86KGhWhPJUVz2Qr4q8dQRZ5L8sYkRu6WqViUYlha2XdXouXYXkaR13TJ?=
 =?us-ascii?Q?77EMwkcwzf7Eq7AjnaT5ijdhMtDe/G0WY+Xei1KJefi9FHkdleKXzZd6ksrY?=
 =?us-ascii?Q?itBldm0AZ6LVBs48oEPUXIa2oecyfqnbT3KlgaoxcmMigKYNycYls6ZLKk2U?=
 =?us-ascii?Q?65ex9/CPoS83dm+PkNbEXbFUynvBXvQgTCnZfipYlk2CZ0HguForfNQ19ac2?=
 =?us-ascii?Q?7ErD20LBJ2QUlABoTEJ890uqBrsnfWTusVz+tgBUurnPUfi969IhcCUNXFdk?=
 =?us-ascii?Q?9OgvUG4h2gkff/0WL+8U+qjOfuXt0s3xJufZtEdiTmleaHdFcpDLSc+VLT5s?=
 =?us-ascii?Q?a/d7OEwQGcYryzsS2baOtfCaqoUWLRgBm3BecKSs?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 35a41ced-d311-43be-be27-08da6414ddbb
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 14:43:21.2600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xOmqz/2OpSO0rJuv47BP03lL2cKUUUi5k9V8RPofWtYtZpcT38Dg/udDCAS+PZ/jEan/8Mbm/WMi641Bi1Ucmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB6767
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 14:43:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167931

Add an anonymous function to get patched CVEs from the recipe
and set the value to 'CVE_PATCHED' variable
This variable later can be used to do CVE data processing
outside of bitbake

Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
---
 meta/classes/cve-check.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index da7f93371c..2f1a3ec706 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -82,6 +82,14 @@ CVE_CHECK_LAYER_INCLUDELIST ??= ""
 # set to "alphabetical" for version using single alphabetical character as increment release
 CVE_VERSION_SUFFIX ??= ""
 
+# Patched CVEs from recipe will be assigned to this variable
+CVE_PATCHED ??= ""
+
+python() {
+    from oe.cve_check import get_patched_cves
+    d.setVar('CVE_PATCHED', " ".join(get_patched_cves(d)))
+}
+
 def generate_json_report(d, out_path, link_path):
     if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
         import json
-- 
2.17.1


