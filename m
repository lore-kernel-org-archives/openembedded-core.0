Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715C9C43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 02:42:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.1707.1655174565150669709
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 19:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=dDIlxK3L;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=3164603221=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25E2e6Yj017820
	for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 19:42:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=aJyg9PiAt5Fb+s8A8W4u7DXXA3yHT7euhcI/Tysr+rk=;
 b=dDIlxK3LV8E3izK87BU6Cd955p5Z5QNpJL3YwLpJzSo9CNJrsuTzWHvaiXW90Riw6YKL
 8daMSBmkgmi2iyFixgVOCDE+y8uNN+b16MkrJdE+chkYq9uxkSsdNXvI5IJpYJRYyOWG
 mlEdYSaLhOcP42usKrYYHHj34i6MsM5uzbqinHdpnmT0DxAn88/Ri1s+Dp9Z4dkL6Tm2
 bKvSwRYELmdlJuHhx711McDBGJKTRs8IfebaB98ZLH3IYwhd6KdvgGH2DsweUJ0VJCyU
 Tf41t4EYTtxDfBTyPkZYHmpmtmes0k18XmLCUh2F/j1XWFrQv6fVg1VI4P49HYNKBQ+U 0Q==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmtjkht7y-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 19:42:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIIA3GEITeVfi1thtrJyG4LcPzpXPuB5wEEoAxvDi4EZguxBGloEcwh2rybqUdeqjDiIlSycW63ylQvQdTGRyZMFAILZYkeyIDXj6eHFXG/tyK/A0WYVL1YbjGXCubX0QTK2CbdVKrpllHbTmOhixSiTqNdge2mDUYG3bZ54fRvKjT80SqlWtkN7ejGEsS8bf5+aYLQR6ppo+eyStQT47eLpVK0+VHEcZnKESiA9MvzAV/4sh2AVPWWJ1MPPXf7gWsxUDICf+zcsOiLBGVAm6qdAJ1V8AwHMggxqhOVh6cpBIJkdNHjMYXxrn5sbAb2h0WLLx6fJg4dRD95lDkD7lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJyg9PiAt5Fb+s8A8W4u7DXXA3yHT7euhcI/Tysr+rk=;
 b=JPYaaRqX6FvpWpKEYCsbg17cJVfvUUHGCoy2/SSf3gF/pVYkmLj5I+m10024cs1I8R9rqsSZeyJBbXvmkm72EnZ2AKDkHkGV7dzi9+kG6tAELVhvgj+qC6yApDx3DwlBOMvw2ypmTkm3FvLGF828uJ930vYsleJn30ywCh345c3X4ZRjsPVPRwHCSou69lpMXGMyNI5+law1aB6nx/if/fniowZ2SyVVDpVhd+OlRxkAXiKeplfNOAdFrO2Dy0Bprn020c4EtUQosGqXKfU+UVahS6jL9Qjv7a6uO/XEpyWscOduyxmrz8ACPAB6mllq3KFaSf/IQytIdt10O0Ih9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6)
 by DS7PR11MB6102.namprd11.prod.outlook.com (2603:10b6:8:85::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Tue, 14 Jun
 2022 02:42:43 +0000
Received: from SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::a8e3:9407:2650:5a17]) by SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::a8e3:9407:2650:5a17%5]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 02:42:43 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] git: fix override syntax in RDEPENDS
Date: Tue, 14 Jun 2022 10:42:29 +0800
Message-Id: <20220614024229.806185-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614024229.806185-1-yi.zhao@windriver.com>
References: <20220614024229.806185-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13)
 To SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14ab6840-5adf-4b97-3a76-08da4daf8e9d
X-MS-TrafficTypeDiagnostic: DS7PR11MB6102:EE_
X-Microsoft-Antispam-PRVS: 
	<DS7PR11MB6102879520AAFBF6CA3FADC8F9AA9@DS7PR11MB6102.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	v0lZzyW/0FXNXZINGiBhGTyRCGMiUBIl8YpguTReDQBOQOEUWuX35rer0PZwvCKNfkeTUB8l1e7FrUMcuqyAQFpqfsz8wIFr7cN+eOFpXH7e+qzrLEyGnGhXCdec//ZyNReb+EYuhN2jxmbl14JXDotyXSz4Gzk8X7/xP6v6hApfrhdYJc/jK1jgShciM5s/GHkwEHGQrzRWgwpdQQg9XZZ8QBr+ZOYRz0uzNQPGRg8vOg/9GyzG91e3iHz970qlRnHUL9nzL4jmPO7OUkVAFhuj1jH7/TkG5t8meGtfsVpMLGyqYwPgPC1jWVeMW9hcpnqlxTipYnx61jueeDGZYaVWew+i4e0SOBAcRDIQoSk6ZDbwgBJPV/fdFR0ZLMGtV/j1RQiNeWznz0il84W/iU1KDnDa7nQWalLwESnna7PQSZnYn0X2SByFJEkhd+CxqcADrS5lPzqOc/KuXMsS5hmdccz9Wb7S/YlnZgMWedMgJK6kleUtbzdoo2xFluYnEk//NwwBfJ/UZEkuhkfU4L3H7VFgm0aoKbmS8kZYfcdM4PohttE00EMGRnOESqTb72/9nNS9TMBmULfqPOYq5sOKZypQa+E0GkBkNND3TlD8nt6uHqxqWBLbevdg8gOaXBrBmZAEpBC0hxOr0zDdSXrrZNBOOB7K6IW5zQ6OHexwE8JvX+NGMW3iUDlg/t5w0z1gBB9kYJMCmWO5QGf8eA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4875.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(2906002)(26005)(83380400001)(66476007)(6666004)(6512007)(38350700002)(6916009)(2616005)(86362001)(8936002)(44832011)(186003)(66946007)(316002)(52116002)(36756003)(508600001)(38100700002)(66556008)(5660300002)(4744005)(1076003)(6486002)(8676002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nWZfRnbZPwwbWuk6srVCGhGSDagg0Lf9HAN6ZEYOTXjY0btdtxEDwVwO3ny8?=
 =?us-ascii?Q?GRP5GCj3hjkWIC7jihcZIHBGsDjri5b8m1m3hMzKj5eA+9khcHkIzWzgzI4a?=
 =?us-ascii?Q?eOk4I38q3DlsvhxkXmPceeIa2Qj1n26y39KoVs36V/UgP36ZGcbZs+Nto8q1?=
 =?us-ascii?Q?vKbzxTAW+0d2RsH3yYlmtteGoWIkKfrQI9Qb8tCoRHj9UAwa1x+ixLJ3nF7g?=
 =?us-ascii?Q?Sy1q+Hg8VKBkIEmvV4/kAr8KudcErp/yjqCbkXyFU1WgLNdD37OuAt1cIPsq?=
 =?us-ascii?Q?gdjo/44GSbE2ZXCnS6gMO/UMlKcQ0Y83kttn9+z3yp9azqqP0Huln+BWN4rK?=
 =?us-ascii?Q?7wAZw0b3Ap3pPQFTQGgxEj8JiPMpmOlDqXsNjprfvX9CKm0QgbJ/kPFbo+SI?=
 =?us-ascii?Q?nyw1oXTBVKyWq6qiYX/qOEPZ9OJ2EE406aRnY0Oq9dYq1Y1O7xVnhh9GOwFS?=
 =?us-ascii?Q?UL+GjuXtdOGq8lc5rG3PYqJb5VuNowDbA4b9rZ3n296QXSKTbyMg4oMCF1sD?=
 =?us-ascii?Q?Qg48s/PYGN/ZN/JhnFP7SJeGcrHtFa9YMyjyPc2Kj7bnP4hRitYmhC1ZRT69?=
 =?us-ascii?Q?me7OhB4r9e0cLvpHYaBbbcsaVqQHjv/bwEpXOfw63RAb7K4X4dQjWZU2fN8t?=
 =?us-ascii?Q?VeazBhWp0PesC3pdoXQm6eY7UA1Br8eEo9qId40xXbOZ2EMoA5muk/OMzAdl?=
 =?us-ascii?Q?ypCOzAUKMec86hlStAxThE5wTeZC6SpGBhFCX2zeGhkYBqDH10B5O5epDU7F?=
 =?us-ascii?Q?0vJioJHfC6/fPZuG81GT261IENVNg8vpK8qHyDDuCDtYsh/SWAX5d9z6SLwU?=
 =?us-ascii?Q?D+D5LJ6wehW1oLGELZ+0Vst2KGFWcq6cS5cQXo43CTZNu7kpXauvfVSqrcny?=
 =?us-ascii?Q?RY+Ze3uc6Rojc4ggL9u5xHmL31M6/4LOsVHq+/coqeZIByonYoGq5NI98qFq?=
 =?us-ascii?Q?FV9ZDX7cD1Xa67jbDrzGrChqNpXqWkzoTq2UQVtQJAp3hN8pf6Rys2bph4Sw?=
 =?us-ascii?Q?l1COcKRYg+F5GiP2TUG5m0TlzSc68B/2nsHFJ88RwzyWnkE/5hj1wF5CLm6a?=
 =?us-ascii?Q?vyUbGWhE0M5gUaSDKXmztAz4AqLeSW23xRgjVl/EGOHPNKMBlrgUE8MU8+iu?=
 =?us-ascii?Q?PUR+z3Qz2ImWq6ATm2BhKCMMkp85YzgkXvP11r+vYTDOUFD+jyDPDEdQ+2fs?=
 =?us-ascii?Q?af1XgI4WFiYFzTxVHlUZ7cDlKa0ucdG5GlvihMQ4V9V/CfTAO7ejVikbgdad?=
 =?us-ascii?Q?xT6JMF67VEYTAJyMFjx2ad7LrILzjAGZtevz2V9YXld3kgdxs158U0mAnVyU?=
 =?us-ascii?Q?J1Tbfo4FUFrizMX1VzTbLK1bwWhxUmAD1B0qcxpMCRFmMgdJfBMmtsOQYT5K?=
 =?us-ascii?Q?hv5ckY0CRDORF3Nys+tbVgeTF+oL1ClQatnuw11FETtIpUWw2aGreUlYPhJ4?=
 =?us-ascii?Q?u1Qq43DO3Ha3du1poGOLC2pp9hy+ptYNllFD7s18Own1j5VD1oXyrI6svJ9J?=
 =?us-ascii?Q?/pQfdHlX7GjsnN6OX03nwtGN5xJbOj4bdPm08hMmz8aFb4ZcNaNVwhZWIGGu?=
 =?us-ascii?Q?9WsjLKQoOUwLPQ9XzWElqeCDMpbxRA8fvBoCPgo82h3qC/B7t3IMNZOOnkYl?=
 =?us-ascii?Q?aRBOsNlslmGcpqFpfOiOkLOwOeD9+T9nfBKKeJ3BoaQp0+uvYU92cS4nDfM3?=
 =?us-ascii?Q?5vO4pU+1jHewXLGdZAQw5sWV1mWMlgEQ+YGTUu9QPUBUSBT4YlgYL8XRIHZq?=
 =?us-ascii?Q?A39NqrOizA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 14ab6840-5adf-4b97-3a76-08da4daf8e9d
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4875.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 02:42:43.6745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7G2XtCPTqhlYkr5VsoVeguteWyzo19S8GpGW9j5VZm6i2sY+8yKiABTHCtNuPHlD1jZjUPWtNvIQB1DRXrp1lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6102
X-Proofpoint-GUID: d7kct1oD-P9wOfy2eBCM7DbBBQPijZUt
X-Proofpoint-ORIG-GUID: d7kct1oD-P9wOfy2eBCM7DbBBQPijZUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_01,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 mlxlogscore=506 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 adultscore=0 mlxscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206140009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 02:42:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166874

RDEPENDS_${PN}-tk -> RDEPENDS:${PN}-tk

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-devtools/git/git_2.36.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/git/git_2.36.1.bb b/meta/recipes-devtools/git/git_2.36.1.bb
index 2c53616642..07e416282b 100644
--- a/meta/recipes-devtools/git/git_2.36.1.bb
+++ b/meta/recipes-devtools/git/git_2.36.1.bb
@@ -147,7 +147,7 @@ RDEPENDS:${PN}-perltools = "${PN} perl perl-module-file-path findutils"
 
 # git-tk package with gitk and git-gui
 PACKAGES =+ "${PN}-tk"
-#RDEPENDS_${PN}-tk = "${PN} tk tcl"
+#RDEPENDS:${PN}-tk = "${PN} tk tcl"
 #EXTRA_OEMAKE = "TCL_PATH=${STAGING_BINDIR_CROSS}/tclsh"
 FILES:${PN}-tk = " \
     ${bindir}/gitk \
-- 
2.25.1


