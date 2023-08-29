Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B76F4C83F14
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 11:06:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14758.1693307210863942978
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Aug 2023 04:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AVWJTnjc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7605aaace3=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37TB0uS7019005
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 04:06:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=Ih5aefSbt23ltatWKr4G8pS0e3fcdodJjRJXaOn1qDY=; b=
	AVWJTnjcEY7RCfjEv3nsk6L+unsgATthHRkGYx+P9IavVUPXKl4PJR8oXwiQSBV+
	IiidNV9u3zgb9CBw6Q3A+9mpyalHyR7/ebjgdj0kZV5aLXHXgIxlaQgKiXFk+Yu2
	HdUF6NNJ3JOV5vj9jd1Wa+MvzEIAHYGzt0Q/trTcPpGk8pEM57AGfDU1jb3B3/MI
	P7+XpJQ/jo1GL6r95AYFFXXE/pQYBbABM0NAkK92fBTTD4XcUetHr2LPMRBoBeMl
	Q9lFOGKoiuy3bGuzSxgf7Uq1DfU3de83wSOU8nryKqOJKr5yw+U6kSWABiHC5+1a
	HrDSlpmQUwAzawwfmd9iaQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sqcp1adu2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 04:06:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNHQn0xRzngbxDPMKDCVhSQpfTSgKNtEfGej4+93GjPCHYlTktCs1IFQWhi32f2FJBR1Wol7xpL0722+1wTXE7MrIsakp1Az64jeBlgZLDeNEY5J/c54ks2f784WSssCwvV6ti/Fyd7UT2eUT2En87qlSlIuMphN4i8we0M3Oes/yo78w1Ueqhc3zEzn8uRENzxNEiJ0pGm52ZrHmDlLCkxW2hzznEZZK/yZye2GdNoqjOmlq+FGM6TlOHrIzqq1oVkt8BxhE20yXj9FmYCLDNwmpBRl0SJdmjVKGiFKVqxFIPXaB/Bsuq2JmLrM6GVLn2AceOF95yjLWJ4tvhGI1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ih5aefSbt23ltatWKr4G8pS0e3fcdodJjRJXaOn1qDY=;
 b=Cjb43AbQwcJnqtI01fpCsaVpFTMMVbwbqrrGUbqumBIM4YVT4AsFtGqDHmv9F6WoHXLJ002T02H5nlztzhY08R4WwmWLBwmaVFRVhlol6V6qhZLLUUtZiRgqWnlZLH06GvmMLjwrUsWTtbWlIgTtboR16mSzNQ8k5vGY4FG/ZDNMcnbRh22KFZdGYhFM3XENEFumRVZuJl016mTcnYjDrIlFFCS3f87VXF++UyBdT85gbKcBNjt16QNpwLMlTv/OoYWgGeVTsThseCmg3yET2s2kYHA+7R0iltF075HCH9AtAOpnISdOamRRCRiSNtnTn4WFbQuZDVi+OTU5pNBC0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SA1PR11MB8522.namprd11.prod.outlook.com (2603:10b6:806:3b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Tue, 29 Aug
 2023 11:06:47 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306%2]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 11:06:47 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] dhcpcd: fix buffer overflow
Date: Tue, 29 Aug 2023 19:06:35 +0800
Message-Id: <20230829110635.1705607-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230829110635.1705607-1-yi.zhao@windriver.com>
References: <20230829110635.1705607-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:404:42::18) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SA1PR11MB8522:EE_
X-MS-Office365-Filtering-Correlation-Id: c725a119-08af-40c0-c001-08dba880098e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lY6PAxHtPAo7gCsOBPesUFaQOHAoeZ9vxZD8P38auuET2ltYGfa9E+iXOMIRl0xFbJq1F8KcSqwzR0SpntF98R/ep5qvx/QsbwWAMXWUp94D4NiooJJuavMQ17zRFW90tJMKFUHS6D0sbUfszXN6WZFUiyzTpwSjAm0XqRhPyVG2G+FlKOhgZEZIrI17+NJ8sv4z6djRmXNsbJO8lL4i4usGHrdpEtsV/JSDwy3lCRmLWGWudY7GfR5D10MNMZMqGoOIzZHuOTt8OJLp4lz/bI1MaazURYiGJYiu60l/R2JpOEVcFT9j99JD1pdmCkUQt/r/2wxIQ+fCflkXwTvd/dY4+y1NOw7AxcYrRwqo1apU+yokOx0L3tjJksgTTRMob/AVYUC6csGzD89a4CyEIZskKWd31kS8YO/8s9OGpiId/ct9EZMJJ5d0HGXxUhHA3Vn0g9zg+g0/x9iRiumiuCQHgJbGN9SE0Hkm87hBCAMHC3GsGa4EEw7AZMYKHiCRZ/ot18XUnNaRfyX3AD/ztdOZXfDs8W1i6gLg4vQHbSLXn6NHXW5eDP4vQswGZtKd4zPtu/7vikl2g+/On4UL/H6s1KXE/+cfuAaqJv13RGU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(346002)(366004)(136003)(396003)(451199024)(186009)(1800799009)(66946007)(1076003)(316002)(66556008)(6916009)(66476007)(5660300002)(41300700001)(38100700002)(44832011)(38350700002)(8936002)(8676002)(26005)(2906002)(2616005)(83380400001)(6486002)(86362001)(478600001)(6512007)(52116002)(6506007)(36756003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?upsJJBunZQdn/AtfkfNhD0QvOa/GKRQecpJjKhJRpjX2S07MkGlA+cwGAMqv?=
 =?us-ascii?Q?m4L9ltXNb7XLVH9DLipcJcZfJn86xON2oHi0dyQjS+Sw0G1vz9p0aP07KNnc?=
 =?us-ascii?Q?2VUfqF9l1tvPa+sgmKCS10CAJUkFL1pdX2BnvkMy8ZsAB8EGS+HaGb1aw8Mq?=
 =?us-ascii?Q?0WfvOg7oS5M9BpJxcHTEVk+PDy43JOdkRRzwxt63shojswGTtrA3qFrxkQf0?=
 =?us-ascii?Q?LRo1MauBG2uKQDAjH2hW1gjadVHekVHzhWukvZaayOsjz3XVNhJ2Jp4AZLhN?=
 =?us-ascii?Q?2PhkU3S9GRbGTSvk1OeMjJHNqJ4SfcU0z9MQ93iRskqizH809385goUCQlD+?=
 =?us-ascii?Q?osg57yR1J8cDThhJZTJYQgjfzprFqvejsppV73JUFBPiXdRHyl9UQarFWUlK?=
 =?us-ascii?Q?WTvEcH+2h1Z7IS02fDewvej25pKSpsHJYEMwoeGpBgqpJrtI9QRYF2OUuzBK?=
 =?us-ascii?Q?U2X8efJKVaWcoMQGX+AUE+ul8I8LBwwbYHb60HXh8l4bjzlEtZOumunArOZj?=
 =?us-ascii?Q?YDJspzNSRtcxYwdk1K1grghVFn2Kvufc4MCzES/aaJXQ8IT6W19BObpo947V?=
 =?us-ascii?Q?m45A03NAbat/8/m1102J8nryvaBr+kSQdvQ4oKga437B0A5eTFnYTLDvqdrJ?=
 =?us-ascii?Q?nLf713h2yWW0hxu/gJondbzZUR6sTUbdTso6px6LJU7JHvu89HOQz5S4hiiI?=
 =?us-ascii?Q?f+Np/GDRIPRFjy0edyZhVLPeBdxI+CQ0C7OGC7TFj6bNzzvnGDf8UykeoMe1?=
 =?us-ascii?Q?rqMbpxy1lVMkKkVNY194Oby1LYkdNLCPhHDfIucsRPessnCWOmqmVJmzxMcT?=
 =?us-ascii?Q?+Mvcp4fuTUR5jm8vZ1+t6W9qXqvHOpFU+X2mONaH+Id3zZmBzYbo3tMDjQ76?=
 =?us-ascii?Q?t7n0MqOpI4/u8IpJwQI4zR2T4DVbrrWb9dY6E4TMyXkZC9en3tm4LaR7pnCw?=
 =?us-ascii?Q?KONfQl8+qauDJqfK4zaq71KN0CjxwZ+nt/a5n2uKtCbjwsxlPQ/78f6HybA+?=
 =?us-ascii?Q?ZcNNUHz4Zth5dAKAtkI1VXUqCjGQm0Z1srWN/LG4DvVl+pZqIN8fiGLCjw1Q?=
 =?us-ascii?Q?4NAYTyGe/6QcOzQOx9YwaME009MBnySwYtB8Vnh6fwK9mqP0PQJs8WaovWPo?=
 =?us-ascii?Q?qm3cbVoiVatk4Hq85yFsjTGwKaU6u8IDeDSAsXCZuD4L4d7f/fFfOJRiSu3T?=
 =?us-ascii?Q?TdT5BJzs85QZgPyZyW7ZnwjqJVYZ41GrvaG13ivKiJuQlWdseoMOoI18/PY3?=
 =?us-ascii?Q?HiWrZuLaoSwAtHj+d1rXbY9q9nVNXa8MpKV+QoiG1E4P0d0VNnBolj5o0ONP?=
 =?us-ascii?Q?x39KnOhlJ9TjhoGgcNUEbl8xJBBwnBDlkBeaS0Y63B9wQUqInWjAUMhBKF+g?=
 =?us-ascii?Q?xWagBY//YB+IJOC4yqTQbeoSEsv4I+lilLYjzON7oVRjUILclsRYT2NJTMdm?=
 =?us-ascii?Q?kktzmp7gz8Z3V7+6+kgSXq3eBK+KBMshIgblsRmseFltnWVSvMEABf6oUwYS?=
 =?us-ascii?Q?QwThxyjh83LYvnIpDKmfE/qhGfPQGcJxh6EJ8RklI+of/di8+zMo5mGYcbVI?=
 =?us-ascii?Q?EJFZ3V0UaFSpwTQoTP0d4pxxoc5+YZUigYD4WU9N?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c725a119-08af-40c0-c001-08dba880098e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 11:06:47.4279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B2lUuhvUo3/L4V5La82b25zVdsSeLM20NBPxxhiQPNZ52k8F/QM8JFtXWD3gJmCLBPnVLZ9vc7h5SeyUx0bPnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8522
X-Proofpoint-ORIG-GUID: 6MeqW3RtaEgeuB7dkpPMOrpLFv5OinyZ
X-Proofpoint-GUID: 6MeqW3RtaEgeuB7dkpPMOrpLFv5OinyZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_07,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxlogscore=975 phishscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308290096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 11:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186854

Backport a patch to fix buffer overflow for strlcpy:

$ dhcpcd enp0s3
dhcpcd-10.0.2 starting
*** buffer overflow detected ***: terminated
dhcpcd_fork_cb: truncated read 0 (expected 4)

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../dhcpcd/dhcpcd_10.0.2.bb                   |  1 +
 ...x-strlcpy-overflow-in-psp_ifname-239.patch | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-privsep-fix-strlcpy-overflow-in-psp_ifname-239.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.2.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.2.bb
index 9dccc93713..0966edd1b8 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.2.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.2.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://dhcpcd.service \
            file://dhcpcd@.service \
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
+           file://0001-privsep-fix-strlcpy-overflow-in-psp_ifname-239.patch \
            "
 
 SRCREV = "d2fbde99cf2d0072016af9dfe6a77032a5a9fc30"
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-privsep-fix-strlcpy-overflow-in-psp_ifname-239.patch b/meta/recipes-connectivity/dhcpcd/files/0001-privsep-fix-strlcpy-overflow-in-psp_ifname-239.patch
new file mode 100644
index 0000000000..d4fb1737a6
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-privsep-fix-strlcpy-overflow-in-psp_ifname-239.patch
@@ -0,0 +1,33 @@
+From 1bd8fc7d4b34f752a32709d277a897e5ad202d97 Mon Sep 17 00:00:00 2001
+From: Tobias Heider <tobhe@users.noreply.github.com>
+Date: Tue, 15 Aug 2023 18:06:48 +0200
+Subject: [PATCH] privsep: fix strlcpy overflow in psp_ifname (#239)
+
+When running our Ubuntu tests with libc6 and strlcpy overflow checks
+enabled we found that the wrong size is passed to strlcpy resulting
+in a crash because of an overflow.
+
+Upstream-Status: Backport
+[https://github.com/NetworkConfiguration/dhcpcd/commit/1bd8fc7d4b34f752a32709d277a897e5ad202d97]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/privsep.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/privsep.c b/src/privsep.c
+index b11c0351..cfe54742 100644
+--- a/src/privsep.c
++++ b/src/privsep.c
+@@ -1200,7 +1200,7 @@ ps_newprocess(struct dhcpcd_ctx *ctx, struct ps_id *psid)
+ #endif
+ 
+ 	if (!(ctx->options & DHCPCD_MANAGER))
+-		strlcpy(psp->psp_ifname, ctx->ifv[0], sizeof(psp->psp_name));
++		strlcpy(psp->psp_ifname, ctx->ifv[0], sizeof(psp->psp_ifname));
+ 	TAILQ_INSERT_TAIL(&ctx->ps_processes, psp, next);
+ 	return psp;
+ }
+-- 
+2.25.1
+
-- 
2.25.1


