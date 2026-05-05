Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91162CD342F
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 08:16:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34459.1777969010246699665
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 01:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XbQYbM9n;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9585136d0c=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6457jww82357677
	for <openembedded-core@lists.openembedded.org>; Tue, 5 May 2026 01:16:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=rKJHgrBBRf2i0dyJEP+dIsOPPIXYYNUkO3hdxsCogEk=; b=
	XbQYbM9ntKVRzJh4ykEj1ZqhVgAlxeI19VHjUgyQDS2T2YQPiQ44+d2jx/tYkZ2a
	ruE5jFR6OktTzlEjllndBjMAqGCRReF0IZSu5d1HpMNikL2dM/oKvTxxhQTjGxvb
	ZT2w/8RiFHL8Bj9q0ONRCSYoxNhMkRcdy/vczAJqqTX14hogpjksgwejGurcFZZe
	e6lSBSWoRMaAuHJv6Cg2EK+2KwbeCxn1B7PS65jkj7K+bFBEliW12Jhmuxeh3mLT
	VogztJHErOQj3yx73i04AD23CZDwwD4+H0JDGBHhfx2ibAhTnovCf0c/axdZhExD
	Ho+4e2Vgz6btjRH1aysBSQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011045.outbound.protection.outlook.com [52.101.52.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwchytwck-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 01:16:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8hb6XiCppm049ZbsIpsbmjnEemb8AZkPkSu0Vn3WsNKGq1U+9DyfP9WoA1As6MqUMeMJX2mfnu+CUnFA8GGqKD/6a3tsrrn3Z7MqPhEheogh8kOz6tfCUNfPB6wzzLa2gPi4Tj2HBppvkYkAWHGrPL9cx+0oj+JP3vCs0GGnSk2Ai8n3R2ByJwgqskujE6ergyynT3geww3pKvmizFbtm9L9bSvgS85pmIanddvCFPg6GwNxVmaadAXOp6gI3DozhVE4jalb4Z+1VRqVDyReIyc6n9qHk0VFnuLGW4oJLpshm0m8fgdPmMC0kmp0ixeucx/4StmCHX5i1bq3HrAVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKJHgrBBRf2i0dyJEP+dIsOPPIXYYNUkO3hdxsCogEk=;
 b=LYLIlyX5EAQyxqaEpfx03AkaoNJs8fc01VwiSQtM3GF7lWQ7cVn93ag1wRcSD7XIZIF9loAPOHvXekkhjqn4eI+k3CCwz+JCgSVRF+CJ+01SfTAzbrKWE+hQMdCOarQl7WbmqCFWC4KEwY31MctZYke2QoM+BRSswNCo7QIqXv9IAys4HZ/WMdycbKs84j9a2NUPXxtk4lzjXXh7lNu9+0rIllJg7cz8AhM+bTAnmU3VulT/bRkcNL0y2dB54y/MRliYmAY9u2SUVpKRhLtwaYMETnHM4CVxI8ilnvo1QdWOGbWfJ2C8xRsP1ssrV328JKeL5V5dykIph2oXC/2t3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by PH7PR11MB6698.namprd11.prod.outlook.com (2603:10b6:510:1ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 08:16:47 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 08:16:47 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com,
        mathieu.dubois-briand@bootlin.com
Subject: [PATCH 3/5 v5] clang: Set CLANG_ENABLE_TESTSUITE = "1"
Date: Tue,  5 May 2026 01:16:23 -0700
Message-ID: <20260505081625.849368-4-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260505081625.849368-1-Deepesh.Varatharajan@windriver.com>
References: <20260505081625.849368-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:254::22) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|PH7PR11MB6698:EE_
X-MS-Office365-Filtering-Correlation-Id: ce4c2339-e8d6-49d1-c592-08deaa7ea454
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	1BNq4J3svb7w8iAzia5hOUef1AGfnqZrV8iiO0+OKXnF123KGin6v9GQTIow3MabvXvtHzXsoSeKr+T/K0WIHL5YGWNGcTaPNdzcO4faM4AgstWo/d8HZcNzzB54fij5S9ctspS+KlSzF7qzDuZGWcxgL2XUhUcRvoH48Sawjj7RUe5zTswCrFu3ULPWznXuQRd08n+8Es5L+ARA2I+c28zuUVPQU8BG1vkcoNQM40NQewILnTsKQF+Y/49UF6xuPPdxua6hZm8upikLI56Wu0oTHXG1pX/PEKrXS5VUJ1Jyf+0AWV4BvPXySXEqkV/omBWU3ZGRkpUyxve1DZrke+AS/YmhZ3u8vYF4eLl6cO31uDK0k8GMSstoeKJssgDZPkF6manpqOj5bjQbG4JRSE0ZrIdTcO/VlEkuYCvJCksaFUimubHZwdeWlvdSiZ4NfM6M8N9kMwvJpotqjRYBgfPf6cypf7R24u7dXRrZqUkXaHYWY4+htXhpSpuHJUkeiE4aHINDlL89luwCGusx97HgiKSurX3sG0ftBvY+I3vbDp2U7mza3EsPtHOkcqu1KP0y5q3eVaLbeBnb2En4HjrswSlpeGGPvXfyQnbTwC5g31HRpobpZq4U3A3PeSRsrTE5eTpK5+9a6Y+YQlzhKtw2PiER2ZLjElTvPB9Na+lidQTO/bilzu8ZoiCNv6Ysqs17m3btXJkrtotzMkCDNamN/a5qmFRAdPyKoQcJZl+gTgVju+R/ezabn6D/+Ibf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Wm3T8OCDx0PoHwLVFWVHSRauWy389CSyfCzfrLivyqV5z3HggXILe3S4FD81?=
 =?us-ascii?Q?fsAEJHikwSpGaAhoYJsvGTdyiDaZHlEAv64sk6wu4yTu+YyqJ9mtSkzRD36f?=
 =?us-ascii?Q?KROcpUL0WDFQEV7ncpvl56KLZvrj3vlXI9pS0uq5fX5F2R1guEUFVEVJ5+k1?=
 =?us-ascii?Q?j8ytMWAxnivz6r5ybkfgfyVTPaMGv+lnCi/1tUGkFev/4bTLKHbuEjsaVZpN?=
 =?us-ascii?Q?UL8DoHF6kkVR6igr9Noc5sbWpMgzNIEbK1jHpvHZHy5wg3qwqiCk9NXe3nIi?=
 =?us-ascii?Q?ehufNxDjAIwu4j4m4Doj2TZtnXdjRm9jvp9xUg/oA/3+ovlZcvx+vRG1oNRE?=
 =?us-ascii?Q?FKGxSDTarqgL9WN4+RvRa9Y5all1oLhQYISkKSYMMh8Wz0w1Vvlz6blcLpxp?=
 =?us-ascii?Q?0JiNrNzPnvnnhKCOoR0WlPQLco3moU6LodiwJF6moTtdx1/VpZBDQWEcutqh?=
 =?us-ascii?Q?+baiwzvTTMWyytbSBZfFCi9EEKTEqomo5CPSqIaOYB3qYK2x0ZgI/uWWeyYU?=
 =?us-ascii?Q?Etob06XPXQsYPTPfaXXj89svRU3oURoclIIxJAU4FdXoHSlNQvVleZ298ZeE?=
 =?us-ascii?Q?MJcEhSuPXJPCJpTkX/caMDKtDxY90G/rEFP4xw3WZnZmydUTmOM2cxcEuoKx?=
 =?us-ascii?Q?iqCXL4WJz65AI8evflS3LzgnfzH4S5x3uQD8ynPxHSDG9oCelNKORZq0lDC7?=
 =?us-ascii?Q?k3NckttK+igg9m4ZfBzIpASLDaS8YTHpfdbWHIP1rpd9ihVW2Ls24u7nSeBC?=
 =?us-ascii?Q?Aqx5MrzEGkvuw1WEukvr28guXM9XVQcx/F5s79XfjAkLqHyeYs2hqIX7eeY4?=
 =?us-ascii?Q?O8jPczPUUhrEVFB/TUTbphACNN3te2CgbXPqLcJAYqnMgswYrvQxJizfkYA2?=
 =?us-ascii?Q?2bkXgLa6Dnl1E/8ONHe/AWwflZS+4Pc3Zw7IFUnMMidLwCAKr3rh8CIWCx6i?=
 =?us-ascii?Q?2vxXrdW30tlBq0jYOoOLoGcpb96FqoI/GMLqXld2fRGchSeA0GL/IPJja2RS?=
 =?us-ascii?Q?hRNWKtkKm5C7rautJw4Y0N/uheJ5hTe648ka+AO3HMYHTtseWIe5wmc/w004?=
 =?us-ascii?Q?+rjtvTIZV2tM3NyowR0u9Sn4kEPMeGwc/m1ctoGyuKx3sk/nQR0LoUv/83mU?=
 =?us-ascii?Q?Zb7kcsWSDaSno/gVE4zivLSxakv8YhI0ekVNWFTMWCRyEw7gZDXhRC5XGhPI?=
 =?us-ascii?Q?c5AgSmy8Pf0fu05WxHx2TVJ8uO4I4KNmeBub6WqDsBkg4F+C00wc09Yczslh?=
 =?us-ascii?Q?XO76zB6uR9HJsbQPoVWEJwetVo0wgDhXDA6YQJSjLA85mw3QKSBvbHcGQzng?=
 =?us-ascii?Q?fhglhTDVIzd+d//DFEECtkKWqNbda3MboOBqPtuHdOTr/66YnljQRYH9M7vr?=
 =?us-ascii?Q?b7EWbma2s4epyemUJP44unZiGUtg7IFgHGCmz+S23cWZEGszR9wifd43Z9+B?=
 =?us-ascii?Q?KL0SzD+CSuyWTdYq6ax17IEt2wZWBSPWg5+02bGSQQbBJ8w/yD5a47X+8t3m?=
 =?us-ascii?Q?CBF7aauKU+SiNprLSJM2qvAMM5EFyhy9Cuf1B0lkEl5rSH2xSJE0KujpteWw?=
 =?us-ascii?Q?D6KkImjMRuZislKQFUrrwPTaM4RHLikcMfQtj7hzFZIEaX4EJJjOD9ZS+Afv?=
 =?us-ascii?Q?a2TrBCHlP+CyiuzRvytjJch3iN8GokCG3rnVvzr9MoNxzm98g78uOKhQm2Ho?=
 =?us-ascii?Q?cRCpbTvzD9eNUbzD9WT39CVAWvad126s3/9666b5BI3dnlDUHbhmYih88zHD?=
 =?us-ascii?Q?UECSoUheYpiEt6yn36bITVinJuCyiFJtE5wmFmFMRMrpfqSA03h5?=
X-Exchange-RoutingPolicyChecked: 
	wEfg+urk+vYj3w3Z/A83W5JjyBv3/yFmGgYVtAEHIDeH7wpvKd9uM3fZsfThqtcUXWayNx/Y2hTbSZRs5fYN5/Fp5MZsSDe/lRPYu3BL/zuLCvM7t3207bverAU5jm6Oq36rliEK/9PfmHXO++6PQox0MifpqfltbnKnm5xlj4ZMPFQiNzdBvFgRUcnop0GmXeGjM3Q3puu9nxPZRYF1c2DqcAR65K3rFK1FqSMl/eLfgvsfLMxWJ+5OFDIQsA0i5X5EtlHcgZbkw3Hj9DLlh7cE9QL2aovla0Tp1sJ9jhrWY0NzfLa5C4PRyfHZKc41a3BDV7cMt0LS6qMYhDZMrg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4c2339-e8d6-49d1-c592-08deaa7ea454
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 08:16:43.4284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NARHj6Z6xFG6UYu3BGvfxWp7J9F1UNMW6mgo2rD3FVhjELG1kmxxPCxeyEAw5KhX7mPm0uT80deNINmwQ6u8nfsUzCHxwK83arym1vhqiA3G/6+tHW+IrJPCfR0N5Ez7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6698
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA3NiBTYWx0ZWRfX8k0OCsvHNbSZ
 yGMe5KL9bRI5pFrYx5rdwg6WPQw8/ve8ToRxKNDgnw9zkqzNZ8FCwvt/PEzzzwTGwOfsobkqM/d
 LfqruGjZ7N1pH7TnyyMB/VzyekPwK027VjSDl4Of9rhHPxFg3C424MU7DoDLKB4OtRaum94H26/
 CHEPMsgrF2JF1cFmj3KeDsLhUFt70tuB5gnmIGUElBMyO1kdaCPnWNmodb5ZUXvRWtmVgszwPtp
 rejwjU6Uxi+TeMLHpg3ubgrEZ53Gak8Ha1+hG2zhbmdvwMeEfx73v8Kr9ZMKkAwyKvP99m5QnMN
 FCPWvOOeZutJKkzNgTA78EnzXCxMDgwVAGIvswGBmGCkqOo6nXiDyKJjwmgQkS2AvcSFy235Tag
 d4hdE2Vscj62i1NsFuwtw2CAkcZtWEhaMWo0ix1Ydar+cf0HSfSxx/52syqCsr7WqpjxZoDjUrF
 s64kbMMu8lM42XOvLQA==
X-Proofpoint-ORIG-GUID: d0-UHSz-ufANEgNpFGenkqRIG5nKjCDA
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=69f9a771 cx=c_pps
 a=f/vGOH3Q9iIJglbWlzIglQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=4jQ6Kb6HCuUS0eZ473AA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: lkXZKFQH3tBqpZR5GKlxO13dpLyS9JtE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 08:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236469

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

While running testsuite set CLANG_ENABLE_TESTSUITE = "1"

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta-selftest/recipes-devtools/clang/clang_%.bbappend | 2 ++
 meta-selftest/recipes-devtools/clang/lld_%.bbappend   | 2 ++
 meta-selftest/recipes-devtools/clang/llvm_%.bbappend  | 2 ++
 3 files changed, 6 insertions(+)
 create mode 100644 meta-selftest/recipes-devtools/clang/clang_%.bbappend
 create mode 100644 meta-selftest/recipes-devtools/clang/lld_%.bbappend
 create mode 100644 meta-selftest/recipes-devtools/clang/llvm_%.bbappend

diff --git a/meta-selftest/recipes-devtools/clang/clang_%.bbappend b/meta-selftest/recipes-devtools/clang/clang_%.bbappend
new file mode 100644
index 0000000000..32c236b972
--- /dev/null
+++ b/meta-selftest/recipes-devtools/clang/clang_%.bbappend
@@ -0,0 +1,2 @@
+# Enable CLANG testsuite
+CLANG_ENABLE_TESTSUITE = "1"
diff --git a/meta-selftest/recipes-devtools/clang/lld_%.bbappend b/meta-selftest/recipes-devtools/clang/lld_%.bbappend
new file mode 100644
index 0000000000..32c236b972
--- /dev/null
+++ b/meta-selftest/recipes-devtools/clang/lld_%.bbappend
@@ -0,0 +1,2 @@
+# Enable CLANG testsuite
+CLANG_ENABLE_TESTSUITE = "1"
diff --git a/meta-selftest/recipes-devtools/clang/llvm_%.bbappend b/meta-selftest/recipes-devtools/clang/llvm_%.bbappend
new file mode 100644
index 0000000000..32c236b972
--- /dev/null
+++ b/meta-selftest/recipes-devtools/clang/llvm_%.bbappend
@@ -0,0 +1,2 @@
+# Enable CLANG testsuite
+CLANG_ENABLE_TESTSUITE = "1"
-- 
2.44.3


