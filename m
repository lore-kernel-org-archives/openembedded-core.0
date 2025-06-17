Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E95C71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 10:09:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15141.1750154980545481681
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 03:09:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8263d137de=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H3t1EO005586
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4790282v7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:39 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55HA9TuO011721
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:39 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2084.outbound.protection.outlook.com [40.107.96.84])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4790282v7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 10:09:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJ5AMjM9C+kHVSSKJyWRKCOzZFrifVeIyl3hqVkJyCXCXlXJer9If0bqpS8DFzElq3ciPwSlzdr5RMwhBHYJgzUIPlKwGV2BLPeog6rO7CkoSfFS1Wkp7HsIidnuBeQSdtOiGh02cjhB9riI3XhlG6zYzzypdwqQ5ddlNQiPzq/8GObPmL/V1Ch6ypHG6mTB31BXTLtsmt6oFhcmMo6/IlCJNlyEI85Q9rwGp1JXHmUdtwgNVHwgpIVYRxrhUvqXTwwiB99SuoNX2Hkt0ZzQdCxD5/pWsXk0ytVgkSYzweLS71aYSM1DXPHLxOzxwd08DNADFm4p0rT4QKBVIqklBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRGy5BLbWzfSNap+3dtLjsH2PZ5RXxwnuSh+2mN9ZnU=;
 b=ukhGTYeC9BFYWmkkwR//3A0G+66VCWVnL856QvFWCOwwoS33WksL7pTnjLw+ttsHNfGYDc3opds7wr+WiHyzUv2ID6WL8EHTQTQQl7CkP3po0TgS7LJboj5Fw0gZQ23f2EuCT2InNMwsCI6Ln91rRSF/i2Bk3aBtK26QNe3TYFgIwKLe+1T/AL3amp7KP8jJTRl9H71T56LBQEGIDxudsciSDxSWfi6GmlaRek+MH4vqZIfitOUbKhCb3Gdtyw9VH1F4LJTeOp0op9QvDuxuFEpM1t86v2ib21BtZe8AP1Z7v7n8RIozMYvcD6L2oMKTI4nirYzHdrrveHPWk8hJLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 SJ0PR11MB4880.namprd11.prod.outlook.com (2603:10b6:a03:2af::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 10:09:37 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 10:09:36 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        skandigraun@gmail.com, steve@sakoman.com
Subject: [kirkstone][PATCH V3 4/8] glibc: nptl Remove unnecessary quadruple check in pthread_cond_wait
Date: Tue, 17 Jun 2025 03:08:51 -0700
Message-ID: <20250617100855.2696492-5-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617100855.2696492-1-sunilkumar.dora@windriver.com>
References: <20250617100855.2696492-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:a03:255::35) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|SJ0PR11MB4880:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c245926-8058-411b-c928-08ddad871082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?laiBRGQAg+kweHOAzbUBs2lx2qQaxghWKrAACqjDQ8S/SsahFD+cfT1is3lq?=
 =?us-ascii?Q?o5TUpcKQTRg50FTzp1qyEThCYx8F2rKMaEZu8YhWyif8aZSIQqaZc/yQvNTH?=
 =?us-ascii?Q?KUbYHPKiwFr0+fwhgN1XNAolX9ruo28z1nr5wMfp1EgniuYDi3mbt6I/zBor?=
 =?us-ascii?Q?racVbqklrE+nGWasnrTefwqrCn3LVmhQxSeqL7fphXShvF38/lWc+REy9yFS?=
 =?us-ascii?Q?hORWVbAbRZz5dy0VdBJ8TPHvXh4vtDM0E748EFgWniB2GiIa2wmt2Ep0Ddeq?=
 =?us-ascii?Q?WRlixXoTRr7p/tUhbDETw+atdyLXm6PfODn8jNzihThKM9UBvul0iccj+b4a?=
 =?us-ascii?Q?0vrmmJwheKNqkoPC2RL1U9N59P7fxBxRPEOnMlTMLwHS7+lJFNEvVx6QYt+e?=
 =?us-ascii?Q?sxUlwz2xTRCeZD7XkX5Z25qdnzIZ5nNvFX+QjOHWUswbw5vpDLk8cAnoNe2t?=
 =?us-ascii?Q?2UQQo2q1Bvo3dPHGp8g2knRlxyuiN0zaXaHTXVNBczUZ77Zb4huBP3c2rF3B?=
 =?us-ascii?Q?Mez07ISW2Qq34SYCKJfSNK2+gK2qaY8FavE0OVjvsoBJm/FjJskdbeHJaoDj?=
 =?us-ascii?Q?lR6mSh+ZLO7DxkKCvJBEn7tSdJcJInyAiIYG7tQJ+iCmJy9CPdPkvaA8poVD?=
 =?us-ascii?Q?BQXNMRdqkzwSWzG9h8kaoENW6xYs5Vl2W3PdjvNgIhjA1K9BgGASy7EwFQgF?=
 =?us-ascii?Q?mhBF8d69Cs0hYbhTNxJx/SNmoPwSuVtL1vx0zNyt6rkve7spFUF+QzCH0Oll?=
 =?us-ascii?Q?oXJdH+LXIdJuhhY7i5Lqkdv0XeTClaQLPAariFPFr9nlakv01NyjUQzofOwz?=
 =?us-ascii?Q?I85dUdtMAljKqn7pwwmSEA5iTP9angsS/w6xeq1NecpUXDkWdyVwPN8kKFU0?=
 =?us-ascii?Q?floFX3u+7ccb6lHfd9Crl6Ob7h5c01zMF5azv6uDq+zQ450IdwGWV1ox5Uya?=
 =?us-ascii?Q?6ClLaYzGqAKW3vBsPNMcS3hb5v2RJpwTDrhcKAJjW7GfrtpEG7kUMdipEVkU?=
 =?us-ascii?Q?ozFv5e/uGvtsJ7yy+tNYbP+KSPfhcZWHN7MxEBxMF0YRBHoty0gjwuG2cGSc?=
 =?us-ascii?Q?bhvle3qXi3Y0oL4QeihtG3ozNp2KrNyuu61zsa5mjTauOjoFoZ7s8RVwkkoQ?=
 =?us-ascii?Q?if1EfGBkVD/liMzqilJRJW2mAZ5lRT/egiKp1IcyWvNVT9eSm5PLe5SzMK6N?=
 =?us-ascii?Q?Sb+XyP/rnZAZIV7gsnZtbiMljEVkDh+rD8QXJZVPedG90RlQquVAEGJ1fcY0?=
 =?us-ascii?Q?XHFlaBqG27FvbiOfFtyRNg0iFbV8fLnCdrijiX73JNZV3fDeawXq9N9xuF63?=
 =?us-ascii?Q?xKdOq9+t27aQ2vzkKILedOhGwLS+4oD7WbjEHr/l+qIodT6yBKXgr7cSuh13?=
 =?us-ascii?Q?uvmPJ6/IwrrKJ6zAZ9uWn+9zogeYkHn0PV5DGfUqRS8QNMQZGGzRe6Nn0YjN?=
 =?us-ascii?Q?7Qt9AAcvXi/rlIERi1zuiJf1zZGnRZf6?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WHsRW+8ftOdyLguc4UVsVefw2MylD70Rcxehg6odo0kCG1DOO9uOLWfgPirC?=
 =?us-ascii?Q?pK+OeJxXZ/fNIj81qWnvycI2tsTFLM9ARDp/WdrhQHV+5T+MtURQOV9orIiJ?=
 =?us-ascii?Q?cvixyNPDKdRW96D4dnM9La9Soku8ItAH/VDAdeBhZzGLeApU5tu3hHqDyYFk?=
 =?us-ascii?Q?RY7OVRbfVS2gtxTxtYr4Ay6plIfcvdFxlpJ0TYOZj3PfeBPGS02rV/MuPdUE?=
 =?us-ascii?Q?YAXOJrwoOpcy9CMFgsXcdpN8I5Afh/z+UxlrhOytN7GXncHk9b5HGJyEpKIU?=
 =?us-ascii?Q?l2+mKkW5eq/AKUTvUzDQc7EN3zIusHoQwONbGkHzmUTQFFz2nJqtZPd0obG8?=
 =?us-ascii?Q?TmgAwZaq1U2+jevElLOj0OAJ9xXAHF1ioTNqorqHqShJu52SEh+Ar7ybR9Cy?=
 =?us-ascii?Q?NSoY7QyAxqvrHCX7mi3Um1QqK3/SjypiJrUnSH6ELyCBSYlbw7S08+s1ptyB?=
 =?us-ascii?Q?uHSaVdqQNw4hHBm/bvy37AZhFPY/rqc7wnezlf4Wk+iVhTFumXEqeaC6ZQ8e?=
 =?us-ascii?Q?sYxT+qDEhJBOOoANmqMjP/ZXUf+o4GgGiNGlpuD/Dfq2LUsu1Pbmm8BMX9bs?=
 =?us-ascii?Q?F92MGirYhmBWUrZ6k7P53fwAw0NrzXaWuv+Ipog4aPTLxEw01koBv0s5fd/+?=
 =?us-ascii?Q?Bvf6XGM4Euer3UbD5lufrSyF7xnBPCJBN8s+vbZbXZNiw/Aid3DywWcwhdLt?=
 =?us-ascii?Q?9DgF7K2aP+aVGVbBuOjexYpNuW7CwxDt0ZL6e2V49HGph1UzAi7FAfyACAA1?=
 =?us-ascii?Q?Y7wIx9tt91oN7fpczEYZxd1+vEJOZgj3RsplIM0l991YgNdtJWpxK/dp+NRj?=
 =?us-ascii?Q?C/oRq5PBFnuHCYpO/SoTVwsxnfju5G8iV/RmaumlPFeActFEyk2m7MdRps/V?=
 =?us-ascii?Q?ezP6cwL18IQkzFjCNMLlEeVlHw4pIthUkwW32oRo7AwDsRZLSgQBmsFwIiei?=
 =?us-ascii?Q?SQIBkU3hXTOHVpQC0NEfytaGZACGhAbaZzF/Y77rkEiMr06Afpieo30sjj6I?=
 =?us-ascii?Q?9qpcl+gZ2KPLlQT7E/LJdrvgo26oU+7h1oHzKE3BypyKz4/ELXst4+WWaD36?=
 =?us-ascii?Q?Rgax5oGQ5oF0R+W0fGNPcwNr7sQuo3g+EHOe1bjDxDEGy07ElfZzzzf6hguc?=
 =?us-ascii?Q?ckBvegnHRQfFxY4wf4mh8xDRLoCNvBuhatQEoQ3uiYmPTcBkPZivrQr/5BD8?=
 =?us-ascii?Q?FjVPX3JjWWxdomcIkNOr2JzM809UR1wo4d0IUzDnOjadFe/bPvAD750O8PiC?=
 =?us-ascii?Q?KdtIRHS/2LE+bfq6hMQxneI6vKomaQqW0nBzB95apLWaiSUSNU0TowYpGVEs?=
 =?us-ascii?Q?jx21xZfOFj71im97+wZOEbVFG3jgUWd2c17je0DACYcdSfVdS+mpXMvJDejh?=
 =?us-ascii?Q?Xtf5iz+Vsax1ZSYrZqnyxpKUH9fDalY9+y4+SJzTklNiqHfsZyEpEjHYWd70?=
 =?us-ascii?Q?929VvHC13Lqf56VI9e75wUe+kL4BD3iuH6sP/v2xkzaHFZUJOGAZPooWSxtC?=
 =?us-ascii?Q?Q7jusc0UkeX+T428oUa4OEtohOVf1BsiWUS2CnbR0vD0hRfFcAKwqzwy7y0y?=
 =?us-ascii?Q?aDtjmS9duLLUyePfQAGaF1V+PH31LSxiOQ0AJzGoUH8TRg+XMNGt5/JkJP7i?=
 =?us-ascii?Q?Tw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c245926-8058-411b-c928-08ddad871082
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 10:09:36.7058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: genNSTRwejklyZdLBD5L90Bbk3jcb3KwmGydpuAERfcZOVpigYpgu1rFma6EYL9Gk47A7peQSwzIWANKp5dPaRMGSeVVy3Ba54rcdz2FV/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4880
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA4MiBTYWx0ZWRfXyryX9wHqBFdL rNCQMTw3bYNzwtjzwsw9znmCxKdc19nmzpydBoUlJCgakAe8RdPeZaMjfr181H29KRCVCREd00R nadb0r0gWgX6BU1+DeK2jAKcLo9ROQqFYUycTr/CinZx9TUM6PZ1obCi7iHyMMiZVVtkCuLVN04
 lRPXlRVE9t17OvScMDSuOoSyqkHm3/GhUN70Eak/4RDib5lZfr515+1g/Hw9yKiR6EibiVWJigf 95iXjvXI0tgNamM/sCzowAUo3ueHI0AfxDZ7x0CD0acUCL0HLZH8NfWlvD9x6Izsx9qblZSwi2Q I6j5PdMiW3NYkur+Zd03z4NhlehExKlbtRpjPms4XgC+zDahsd4skbDtTgULPTjZTywIK4Ik8jE
 N/M8BPkDZgItz5mNKPH6RmNcW4VbhShYENuAu2Vc8o9idEBrlGwWRESqAwajKt6eBx/1ef71
X-Proofpoint-GUID: 5gUJUmPqBidxOGjqBbC9W59TCjZbRABJ
X-Authority-Analysis: v=2.4 cv=ar2yCTZV c=1 sm=1 tr=0 ts=68513ee3 cx=c_pps a=jAfG9cKiLM3L2FwKH/RKGg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=NpP8qUlCxzQSevXvkUwA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: FxA65OjYnEm27BhFa2iKz6bP0rFifR8e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506170082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218873

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847

Upstream-Status: Backport
[https://sourceware.org/git/?p=glibc.git;a=commit;h=4f7b051f8ee3feff1b53b27a906f245afaa9cee1]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-4.patch          | 117 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-4.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-4.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-4.patch
new file mode 100644
index 0000000000..f8674d62ae
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-4.patch
@@ -0,0 +1,117 @@
+From 16b9af737c77b153fca4f36cbdbe94f7416c0b42 Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Mon, 16 Jun 2025 23:38:40 -0700
+Subject: [PATCH] nptl: Remove unnecessary quadruple check in pthread_cond_wait
+
+pthread_cond_wait was checking whether it was in a closed group no less than
+four times. Checking once is enough. Here are the four checks:
+
+1. While spin-waiting. This was dead code: maxspin is set to 0 and has been
+   for years.
+2. Before deciding to go to sleep, and before incrementing grefs: I kept this
+3. After incrementing grefs. There is no reason to think that the group would
+   close while we do an atomic increment. Obviously it could close at any
+   point, but that doesn't mean we have to recheck after every step. This
+   check was equally good as check 2, except it has to do more work.
+4. When we find ourselves in a group that has a signal. We only get here after
+   we check that we're not in a closed group. There is no need to check again.
+   The check would only have helped in cases where the compare_exchange in the
+   next line would also have failed. Relying on the compare_exchange is fine.
+
+Removing the duplicate checks clarifies the code.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+
+Upstream-Status: Backport
+[https://sourceware.org/git/?p=glibc.git;a=commit;h=4f7b051f8ee3feff1b53b27a906f245afaa9cee1]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_wait.c | 49 ----------------------------------------
+ 1 file changed, 49 deletions(-)
+
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index cee1968756..47e834cade 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -366,7 +366,6 @@ static __always_inline int
+ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+     clockid_t clockid, const struct __timespec64 *abstime)
+ {
+-  const int maxspin = 0;
+   int err;
+   int result = 0;
+ 
+@@ -425,33 +424,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+ 	  unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 
+-	  /* Spin-wait first.
+-	     Note that spinning first without checking whether a timeout
+-	     passed might lead to what looks like a spurious wake-up even
+-	     though we should return ETIMEDOUT (e.g., if the caller provides
+-	     an absolute timeout that is clearly in the past).  However,
+-	     (1) spurious wake-ups are allowed, (2) it seems unlikely that a
+-	     user will (ab)use pthread_cond_wait as a check for whether a
+-	     point in time is in the past, and (3) spinning first without
+-	     having to compare against the current time seems to be the right
+-	     choice from a performance perspective for most use cases.  */
+-	  unsigned int spin = maxspin;
+-	  while (spin > 0 && ((int)(signals - lowseq) < 2))
+-	    {
+-	      /* Check that we are not spinning on a group that's already
+-		 closed.  */
+-	      if (seq < (g1_start >> 1))
+-		break;
+-
+-	      /* TODO Back off.  */
+-
+-	      /* Reload signals.  See above for MO.  */
+-	      signals = atomic_load_acquire (cond->__data.__g_signals + g);
+-	      g1_start = __condvar_load_g1_start_relaxed (cond);
+-	      lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+-	      spin--;
+-	    }
+-
+ 	  if (seq < (g1_start >> 1))
+ 	    {
+ 	      /* If the group is closed already,
+@@ -482,24 +454,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	     an atomic read-modify-write operation and thus extend the release
+ 	     sequence.  */
+ 	  atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
+-	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
+-	  g1_start = __condvar_load_g1_start_relaxed (cond);
+-	  lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+-
+-	  if (seq < (g1_start >> 1))
+-	    {
+-	      /* group is closed already, so don't block */
+-	      __condvar_dec_grefs (cond, g, private);
+-	      goto done;
+-	    }
+-
+-	  if ((int)(signals - lowseq) >= 2)
+-	    {
+-	      /* a signal showed up or G1/G2 switched after we grabbed the
+-	         refcount */
+-	      __condvar_dec_grefs (cond, g, private);
+-	      break;
+-	    }
+ 
+ 	  // Now block.
+ 	  struct _pthread_cleanup_buffer buffer;
+@@ -533,9 +487,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	  /* Reload signals.  See above for MO.  */
+ 	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
+ 	}
+-
+-       if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
+-	 goto done;
+     }
+   /* Try to grab a signal.  See above for MO.  (if we do another loop
+      iteration we need to see the correct value of g1_start)  */
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index d9073b6d64..9aab1466f6 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -64,6 +64,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-PR25847-1.patch \
            file://0026-PR25847-2.patch \
            file://0026-PR25847-3.patch \
+           file://0026-PR25847-4.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


