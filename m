Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1AF3FF8864
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 06:16:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5395.1777443358232594918
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 23:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TRjnHq7N;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9579970def=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T4hm0H3687161
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 23:15:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=N0WQHBfjI3wTXJZKHR09GjMgV6dUx5bG62EQAPN72Fc=; b=TRjnHq7NbPxi
	xKptRfeCgxANRkop0gKW2qHNs/BwFdvWzzpHXFSn/HueYmG/WgdD4yHjz9znHd+P
	pOKlgNQYlHyc52j4DN2Q0F/6+Ny/Lxqt1H80UCdrxBTDKOr2z5AC9/Pf2pPCntJ5
	eJFRYbs83/qV7SahqKu7Bsos6eLxqBtdPymX1IslLGPTJqrISD+y7CLXGAtZilej
	XRcNAcNmgkLxuUIygz3Uu1dCprezFElQWtRnskPnuVrWWDMfDOVA2SFyHr5GBxg2
	IhVmY6aJUVhrF3H02/EsfTs3stYfmMh//PqV5M8ZrsFrPX4bH+dDbEWM09V+FYVt
	9Rgj6RQwsA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010017.outbound.protection.outlook.com [52.101.85.17])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4drrw2vaqr-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 23:15:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZIFnMlT1PIEyDY7WW/f9XL57UxJlfy6ZoDqM0OzsCbqvPpSUuHIQlENjlcNAxagPdviQykEhIZQ9oU2fuhJjgAncAi2Az2Ffdii+PSAsYpnHTWrlGHPWzCYn0BpAMVb58dGih6BPE7bIjmgfy8DaPOBx19zfPFWC0x/iuG/Tt9kWDzA72GChEJTU8KY+WjTQmmcyHsphHrmEQsTYsy4do7Gz190ddsLkPzhE4ZOUlySaCgwEZdFfMaHAS3vUT/XxXDrDVjwB+gm9ffqsWJnvKHdl1atxRRbFjvT70x6IGhJf9XzlrbDJeCtXTy6raSWNUF3EXNf+Tq4rRY8eqqoiwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0WQHBfjI3wTXJZKHR09GjMgV6dUx5bG62EQAPN72Fc=;
 b=OuLQoDzoj9M7WtJBFLDVT0yHfJqvstd6z7JxX7t6KE1/pObTPeFUOiV/8u8nyh+GM0biYH0uKElNhBVR205RhvX/jk1UNNJsQhrB9lKTdoE21ManmPwN/GPruRqkC8+8o+sWTLahdxAKwl144qBcgJDh00wwomn61wlVpZzRoiVO0Vw12XdZjcQNgzaFuRDEUq7tGz1NgODSpCG+zlNL+6+CzlenybMJGwV4hLo25Hn0vgmj89CQ1PDWswZPPFI9DZmLO+Uu9M6zhNUq3QvdGTRV4SXc8JxKdOV8CjF9sJS+cNY2HDhB5Is345d2cHNPyL/7w3GTFiJFo1bZUy61Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by LV8PR11MB8535.namprd11.prod.outlook.com (2603:10b6:408:1ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Wed, 29 Apr
 2026 06:15:52 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 06:15:52 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 3/4] libsoup-2.4: fix CVE-2025-14523
Date: Wed, 29 Apr 2026 14:15:32 +0800
Message-Id: <20260429061533.858115-3-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260429061533.858115-1-changqing.li@windriver.com>
References: <20260429061533.858115-1-changqing.li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:196::13) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|LV8PR11MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: aaf2f8ad-8a8e-40cb-7ac1-08dea5b6c3fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	UmVsjyC64YYP/l75n9rJWDNTaJipBw+B8GsKRV+1MNgRiIJLzQ14l3uK3mivEaJmN3kd1R1vusmxY1YI5X04hcTOYul7cXQaanbJiaZM/N90N3jRnQDX2UHlXkq/wS7+LFMdlLmpxQ3eOn6LGh8tlE1b8ENt8b4cUrCio9O2qFHyuoj/kcOvdzitDrAwNJBLnmrP15f/umjYRWfN9FVQwA0eZYK9fwh0vFWtdIsSM4/0ECsVBy1/l5mmZ94g61DU65BHD/wSe1Z7zwLPjJB/rD+aL+sjiB96bJga7WAHrvvNKYPE+63ck/k/WgRZ0jrxWs4EnDrTg++2516LZJ+2DzmKUytU25OLnpgvctqOBb6L/Cyg1gBe0/aTWWe3vCDPRJcYpXOjgDnf6TKFfqItwUQzFIMi1InJYLxse7w6Yn01eJ53njonzGukCZZr57IrbU1IinROB9ZTUhMoIWkpnS30M4yjmhNoITmlTk1QEGufMtgKNX/bQl4F5oFwFFymnTL4HH+3NMQSFxRMOFJF0VXwts7DLKauuAGXgb2D3b5axgf3YGDr91rN+X3q9lr1T1AlfpFh4ltIrD0m63btEu+HXoF9LiHZgryDO6SjOrXEUp+6JXs3h0WRUHzW6Aw5puHnQj00aENipGqjXudO0YuzU6ylOok6tTXK+yC7UdY4bt2QIYoPRL+fAuKVL3RbQAocTp53i0mfhiaoU91/sKkWeVlTByCgLRDe9w6eKk2lOpRL4M3OqE73ljcyBWlv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iwxy/i2Bw1mmmhfFRhtqyuemvsmmou5k36ZkANFB4jDZ7ok+J97mcRWOMFtD?=
 =?us-ascii?Q?1rnkyTI4IbuLa/QLIMgzunJoMQkfIBGfQx7u6av3G//s5MOOq8nchhUy1s6t?=
 =?us-ascii?Q?RVZnzcH/ZC0xIQhYWshwLM2npGa9TB5RjOaNKIDUS+XNs9Yo6Od95e8KDiwO?=
 =?us-ascii?Q?rit8HcLJRsIldLN+JaEBizivJbYn96Q7RgBAZxVmE4d3TS8/QKtBqITfjGaB?=
 =?us-ascii?Q?SmXxH2r7OaE4H2O1PlHHWyxzQ5NYnfcLeNqEksXJL7B93aCaf3nkuo5Vzhft?=
 =?us-ascii?Q?EQhkTmmbYL27nMxMk4XLScEBKd+ujv8JoMbZrkFks4snwsUmfeDQvlcs1qaE?=
 =?us-ascii?Q?v82UVl68QOUMdbwCdUI7v9b1kxT2tvbhxE6f83bX77EN6fuzY09kAMSt0MGH?=
 =?us-ascii?Q?jxvRlGI0TbQIJ4oQvpJ6X7XdGHfNUQ0nDYD4Eu85H9kjnmQsGmBDVhRgjJ6r?=
 =?us-ascii?Q?sael/xwTspmFiqcY2rwzPPIeTgW908KMlk9uxAjTjlyo8sOi/hzh2gUVi0Fa?=
 =?us-ascii?Q?KxpbzZ2v6XksWty5F1/vqhHke0piOmpkiy2haz/BWfNlOMvUsFNYdNPy/cgp?=
 =?us-ascii?Q?OzKa9XufUHdpDGM6UcwparolS/v7Kx8cmJ+r6yL6wwHevKWGMx4PZg3yJ3Ek?=
 =?us-ascii?Q?peJtL9WyWRZGI2ilfOZt5DyLNWA9Gv2+G6qpc2PxH4HzMjgjjPgqA9FH54pM?=
 =?us-ascii?Q?d+Fi+L1TSkyqKaFBHMFdRcinLLwjM5r5Tj+TuJRBpN4LNqO/mUnbSCjuDbfP?=
 =?us-ascii?Q?A138XsUvjnT6PjNwXPMfc2SjR1QdbQ8B9kaYdwfMh3n7cGTCfVGg8BdZxxK8?=
 =?us-ascii?Q?cRiNAlusfgrSY0LFfogYPUfif7/i4JLKnR9jDmUb+mW3qlfLegq5w/S8lAJz?=
 =?us-ascii?Q?F7L2tJrX5X7qwLi4dCeFA3wYIr9LsYnjpVmHCLt+di0PwGURIRBtCBQZBhB6?=
 =?us-ascii?Q?uotmEpgHBw9T7UQ9+GV7I1wVc8/U8goSe7HvZ9ijRJ0P/aokbE2cPBhp9KZp?=
 =?us-ascii?Q?YAe7vkJ5o1syBC3KNzMe7fy2RaSNJYC/uO8nn4uf6G9YpZ6rTIPmSfHiryq2?=
 =?us-ascii?Q?z/8RPu1cdGUk1PovwYRwU5kpFCT4uXaOJdX3VtGxTMolmw4z4smhDv/8GLwH?=
 =?us-ascii?Q?S98JkeQ8VXUWCVQhrtIQE2/IeOV6T5eUyq4hV0EjGpesXRveZJatYe1ktv9y?=
 =?us-ascii?Q?ow5Rp4ZCNpwyMbDfW3XE4F7dyhQFKtawSgL7yyF2xoY6hIrfISq0v67p8zVR?=
 =?us-ascii?Q?xVBGhCTyiehOTSTV148E8pCdVvnV/tF6F9FRSrcPvaL844nEwRAPVSJkphsc?=
 =?us-ascii?Q?GZo8CNXsF+muT2dSeAvtIo0L64J4Q48/Z67xjwoqvbZonn4XQGBqpIKH426T?=
 =?us-ascii?Q?6HhKTRlk/9bR6F62jODXcAwAVHCi5R6mq/2c/ib/fGk9KeUOdzWC/6l04Cyz?=
 =?us-ascii?Q?612jA93veIY0R4MuLgZYDsRpHrspq31cwlmocyvMiEAJ+2Nq4cg2er4g3gx8?=
 =?us-ascii?Q?J7UksHEoxNPhlzBC9CVB6O/Vydl1VrEI3d8pjXetM3AfN9ultzvRU1i4GhGX?=
 =?us-ascii?Q?ltoFJq7uU4yNezG5JilUZqA8rfMkd0CSMLWBNSatkUGUAJUdCb91f/nz2LpP?=
 =?us-ascii?Q?muh4A6lIsjznF9FR6jhsMpIHPBE+ytQt29c3OYtwMFoOhQhaheEYAeg9GcPa?=
 =?us-ascii?Q?3zqmWw0hyBsYfPaoB4IXuGNpnsAK3/nDM5M9509UTVwa5fgFq3U+HRiu/ju7?=
 =?us-ascii?Q?lawZ3SPtdpGz93LomSd5PParmg0vkQ0=3D?=
X-Exchange-RoutingPolicyChecked: 
	gVUICJF5l5aQYN3Y6x/lKeLPvm8u9SljPVOTGT2xCVUMBbvGfdL7OGFSraF1zKqxKpoVNOOc307/0zHq7rrvpyrI9e1NUodhqqAvNDYNg/J0jVAKUXjT/DFw4ramPnqv/vC6zVqh3rx+1HihJLc4NutIlw4eNMQ/X6Tm1Ul4CR9CRsg4aA5ccZdhhzhirCSjfD+7wSkAkOQQeTGII171lf+Ihu1w0Kl9HolYLZ8c3ht2KG4rla9DKeKMUapCkxz5WfiRcX6SqVCf1IIP952jmOzhmdePmxw8qS3crP6akE/znNVLKg2Ae0mEJBunyeXOcdATYKX//4XVsAMzvuSmgg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf2f8ad-8a8e-40cb-7ac1-08dea5b6c3fa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 06:15:52.5060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vjw9C4lLyp7E9q+HARQchiQPWtGRyLn4XsIH9LCMiVZlFkDxA989MoJOxZqevXR0XCVfbu+XicsSvjEoILlmB30zTi0EAXmpuagOxs3Lo0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8535
X-Proofpoint-GUID: sKCB01h-BmGdO1apoesmFMaG9gcpGpYe
X-Proofpoint-ORIG-GUID: sKCB01h-BmGdO1apoesmFMaG9gcpGpYe
X-Authority-Analysis: v=2.4 cv=Pu+jqQM3 c=1 sm=1 tr=0 ts=69f1a21d cx=c_pps
 a=+9lCAQqCkh6G/pz+5LnHJg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=GHR8O2WEAAAA:20
 a=t7CeM3EgAAAA:8 a=DBMtn-1xItkKiCCeOT4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA1OCBTYWx0ZWRfXwVREmiIcl1jq
 DXhpJmNoNoe697lr8W6+HbNxol1OmlBrYwXyAOjz0KvMourYPqkwSUKonDlhkYQoJ9cvdQYYuDB
 vtbU5Sg8rcj5WFSeJ2Ak6jfEhIq5wXdcfQ6KhJ06bmLmzNFTaRH2k5e6J36cRjvbhAvw+ydRBn3
 IBbdXZUpDu7kDnXbhaykYgPB+R6DKGWZrbZpo08IiCNZZ/8sn6xsLBh8dmoLz7YnNc1qNWRXWgE
 MN8aXqjkBYgGyDzfyq/hkbodUiZ1VEEC601gXv8pxXBZWRLM8vjZbRzCmJJ2oWZrITWhtSiYUfH
 Q6EykDA9YJ5WJmTAtouAlZ57NEaY0kuLaC3/nyDitEILqPQhBir3vLXQ7FFrFM0YbdWwZ4Wbolk
 2EiWYcoq8kX/nIoZDFh+OU7eyX6fuDl0l/q+jmYVvejH8J6Ki011E647jYbswjGmjqtTPRShoIA
 jAtz1z62gcH5VGi6z0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 06:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236079

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/work_items/472

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-14523.patch  | 52 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
new file mode 100644
index 0000000000..0f1d751aeb
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
@@ -0,0 +1,52 @@
+From d6028a6e6a8417b7fb6c89f6c10fb94781435ee6 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 4 Feb 2026 15:08:50 +0800
+Subject: [PATCH] Reject duplicate Host headers (for libsoup 2)
+
+This is a simplified version of my patch for libsoup 3:
+
+!491
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libsoup/-/commit/d3db5a6f8f03e1f0133754872877c92c0284c472]
+CVE: CVE-2025-14523
+
+This patch is a MR for branch 2-74, but not merged yet, maybe it will
+not be merged.
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-headers.c         | 3 +++
+ libsoup/soup-message-headers.c | 3 +++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index ea2f986..6cd3dad 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -138,6 +138,9 @@ soup_headers_parse (const char *str, int len, SoupMessageHeaders *dest)
+ 		for (p = strchr (value, '\r'); p; p = strchr (p, '\r'))
+ 			*p = ' ';
+ 
++		if (g_ascii_strcasecmp (name, "Host") == 0 && soup_message_headers_get_one (dest, "Host"))
++			goto done;
++
+ 		soup_message_headers_append (dest, name, value);
+         }
+ 	success = TRUE;
+diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
+index f612bff..bb20bbb 100644
+--- a/libsoup/soup-message-headers.c
++++ b/libsoup/soup-message-headers.c
+@@ -220,6 +220,9 @@ soup_message_headers_append (SoupMessageHeaders *hdrs,
+ 	}
+ #endif
+ 
++	if (g_ascii_strcasecmp (name, "Host") == 0 && soup_message_headers_get_one (hdrs, "Host"))
++		return;
++
+ 	header.name = intern_header_name (name, &setter);
+ 	header.value = g_strdup (value);
+ 	g_array_append_val (hdrs->array, header);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 7e00cd678a..253a389e21 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -41,6 +41,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-4476.patch \
            file://CVE-2025-2784.patch \
            file://CVE-2025-4945.patch \
+           file://CVE-2025-14523.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.34.1


