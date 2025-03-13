Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B004AC282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 05:27:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7983.1741843672730847212
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 22:27:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5167d08450=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D1wwDN000593
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 05:27:51 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0ga1jjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 05:27:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u45RVBdu4U+EwtRs8pOwacaIfNYYFVkWs2WPqT+prKD6Mc5vxa/dWSKWbt331tuM4wwDGoSl1mdSZLzpM3OYs7E23/VxbFf5RkScZTVY7loRQGF3QQtEeR4/8f/HkkqffJKQXJgKLdZkxAWFoI8Z6nWl+044KUtC9wB2NwhQYBAHmmlPhz5I0Rnd4i79JtxlwnEudkwBupBLDbOwutaTYzafYMSdXcf6q7/zUUcys3Sz8fjhfolA9Q5uimqDzSr/RXxFCSWhyzkRzAMZToqzaz6ooGR/3YGaBfhj0FhcYw5NVQx1zheWVwBiNExHshzMXLm4o59GTRIh1ftDzm05BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xhucag69QTO3DQwOf57jOdArsC1ZKmqtxsjefeJmpc=;
 b=LhW/HOR6BYVBljvdMu7rEG4Fz6NgR4q1p1OsuM6PHU5n+SHDWf10oY2BcUI6kP2K4eSvjIYapPfIw7vXZwuC42bjLnWr9UiZvPs8apxVdoxXABoB1sG5DSvC/LvutfaMA4yGxeq+NvuqF7aPfMm2Bv7ItOc6zBddqCK+ceIBn+OUPkAC5fbTa+MCm+Xea/DVPkQcwmAErBfrdKS+VMsxMdFlC6dLfEKRqP5jm3RtcG5heGvZmqD1Gu9wdROWiRX5GBwo/SkdlZDcv7owvH5KEInGYX88LvqgsSnu8ztUP2X0AePdpxu2h3w7VxAOW6Z4AfukSxLvrDQqDgU5GIJUoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5605.namprd11.prod.outlook.com (2603:10b6:8:26::11) by
 CY5PR11MB6113.namprd11.prod.outlook.com (2603:10b6:930:2e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.27; Thu, 13 Mar 2025 05:27:48 +0000
Received: from DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a]) by DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a%3]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 05:27:48 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] systemd: check SERIAL_CONSOLES for serial-getty-generator PACKAGECONFIG
Date: Wed, 12 Mar 2025 22:27:29 -0700
Message-Id: <20250313052729.1809525-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0082.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::23) To DM8PR11MB5605.namprd11.prod.outlook.com
 (2603:10b6:8:26::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5605:EE_|CY5PR11MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: 125c3847-a676-4714-f46c-08dd61efca88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?S8Emo9sO4xbWYvHnUbbNI7gV4QjQOKB3gdaJcQmPPRXEAn1goC/5GDXHvzDA?=
 =?us-ascii?Q?CWIuhACXrn1WjYaMQhmDIQpIpBREOHiJZTXCwjtq4W4Jm4Po/U/NDcV6PwB3?=
 =?us-ascii?Q?BQq8mDcTDMpc65P8NBbU+6Qg5azg9HYHXKx+uUT1audBXyAt9cDzCBIyUZtF?=
 =?us-ascii?Q?8N+ZNQ7fpUXHKVul5T0RiTlJkp03ltWW1LDqxeKaovCZ3cHkxsoOe3Dmt4nI?=
 =?us-ascii?Q?38rm1z89ZepjAVWgYRNB0vvA7Gd4Xf2aa8INdMY2RTG307+7c0gGXxwJTQy/?=
 =?us-ascii?Q?JEb5tK/yNNa/TS4uEvz7Lt/npjB4NDINuAeZh3AjkBLhg2iDoZcQrIKslTmM?=
 =?us-ascii?Q?E1bXiEvbghAY8OL0hrm9tOC0tYhxFEaRXx5y2oGFtj9a2pGszUBNViFdqWE8?=
 =?us-ascii?Q?lliPT6IRmS1dT+FKDoXKJGbY94EvTZcBoQlogkTjF6Q21VVX82tmah18lnRx?=
 =?us-ascii?Q?0KAMTQBQIPzdpPg3DbAIrt+H3ZZri8k9wKtei0LSafy8aucWUKKEUlWFdSYh?=
 =?us-ascii?Q?KsWJmg0r23Quo9uiTjNH96Wm3aHdMcOCqQh/Xh5swLuW2G29lm90kbs1P10W?=
 =?us-ascii?Q?PhkY59D1FLVHcFQMwWY902qXC2w5HN7dI+YJ6U8wW/fR+CpnNqAr9Jd33L/n?=
 =?us-ascii?Q?oZIEd10uZgzGsvI+Y5H6a6rQZTDOwEv42wBpr8/WpTDix5eLyttD3J/ZdGVM?=
 =?us-ascii?Q?+zKf4+94Rouv221dCFsrqzHLKW/3nop1VbXrzgWkIBUe5l9WyEiL5ppvsbOM?=
 =?us-ascii?Q?BQvGqGXTo9cRw+aVrwVvJVCwKQlLuGgxRFxFx+P01G9FZGBTD9jvOTgkLdq1?=
 =?us-ascii?Q?ZnD5/ltavV8o01Oey3+1lIkTcS7LSgxS6Et6Whe0TXfsG8eyhNRGDQkSgs09?=
 =?us-ascii?Q?7AYnHop8NmwZn8S59h+EDO6J78Y5OuI6Nuz/8J0wWDV8ZKb10l/U6qYWypx8?=
 =?us-ascii?Q?3VxxQlNu1FcT8JNADwe1k6mIgM7/FY9VvZh3UykL7vh/o7V/beI26ttP5eA2?=
 =?us-ascii?Q?HXDFMlBTcj1Nl4+a7E/8nklSYELFgmr3N1f7QibKhzNlDRACcToSKSt9G+Mj?=
 =?us-ascii?Q?jt5Dd9ctqRFwjGFdkwz0jleuV3EjfukEYsPgeFQGS5WXzqWRFAedUAROzYEM?=
 =?us-ascii?Q?jFwtwYuKlqAoinm5HP3yDX5B4wxBHmC5VHTmFoen+4t8+leRVeIGt6Eqq1kL?=
 =?us-ascii?Q?GzXEU1gHRxF6UQpmLGKJZk1TNrqVTAqKndVFW6eQtmQ2TK8qGXSHuIx6GDoS?=
 =?us-ascii?Q?lgN7stACvBWq0jC4pC05d+eOnNfT78BFGmz/Q4GRz5mQuE1Uozh/KMpV2W7w?=
 =?us-ascii?Q?wxJzSDamhRrQ0TSky98vM2Agjrjt/MrQihbJzzagpQoOb48lUAg5HCzakIWh?=
 =?us-ascii?Q?UDYID7Y1GsP6SDs3PolxLUdRLnXP1U36S3wY/pmbD1HXDfV1lpD94EPKC83L?=
 =?us-ascii?Q?XvpHael66SR28/dzbi77Rr3jNdvqtnAA?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5605.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zBfOSF+78+ZBudK/Q9FNO7/pWMI01Rrv9Ff1mpTTj8Ly5nuIk9dB80nPewV9?=
 =?us-ascii?Q?IgR4Nw/PsZ5gAH82I6E6Kkxqd3rZDubG8MiPXtyiPIm5PecuHkFJPr4qCFQS?=
 =?us-ascii?Q?3tYwzh4BfV63t13ndrQL3DRMm5gYyVxL0L/sESasNKiOKW0XO8iVs6I5PsTF?=
 =?us-ascii?Q?jDjzSaGM6/KgzcN1cfF6LkmmCrlbZSY1igKKgU1WR5E6ZUe1ZEx5o/2S22zh?=
 =?us-ascii?Q?vYpWYO+JSQ2M/HiUNa3SCrZOc4yZaYTl+FjRux/A8SShTUycqJnjlGSHVsbx?=
 =?us-ascii?Q?cjRvKh+JXq/vQ25DwKjwgqm9894uuY9azwTuQZ5B9LEAEjkF5Orz4tQE6JhQ?=
 =?us-ascii?Q?oijZRpvtxW6h4NkeELE99n8B0EsxNv2gDCA0xm+asLm+QfJWcnKJ5cP/wS1s?=
 =?us-ascii?Q?dqAz4qtX9ffEQH7/mePgHYF2E9mEGEIBAu/v2ri3Q/Z2VbhiRuue8yNpFQlD?=
 =?us-ascii?Q?G/wuVP+8Ej56QbG2qwP0sv3JR4oePsdSM/Dp+ShiLiEnx3OeKU1ehyCoHVDI?=
 =?us-ascii?Q?mnoyP+j34fSkyW1StDdi8j5eDwbFbgCzj1eA0dTC/ZSJc0b8nLhpZwIrqwHV?=
 =?us-ascii?Q?1cblZcBNQQ4mD2SY0VPIN9i7E7CtbSmdVXiSM2z1mmOIrB+skp+oJLld8nR+?=
 =?us-ascii?Q?luzuBvLPSdmGm2n0igcO7ZDK/pDZV/iKxdDSyWcllumxO3KginjeYicFTAGy?=
 =?us-ascii?Q?pvlMUfAN+aspRgLlJiVLytv1EQU2J6XzSRnnt769Tm195cu2SDqZxV965fPj?=
 =?us-ascii?Q?im8bWm42CfQ2q2aJB1AX5ENYSfLzsmfnvwl1Cwn5zEyIbhRdr6EVyAc3TGQa?=
 =?us-ascii?Q?nzTk/rVQTrB7HLO1dby6BPFbYKDFkR1qPsBElSF9lyWHt/vI2LEhbJAQ2sVn?=
 =?us-ascii?Q?M9JalabP7TdqR0aM6vmjEG8Ii/twcRlFgCzPxHmaGyo/3gxKTNIef5dBY0SL?=
 =?us-ascii?Q?yX6wOnhRQTwwh9kX0ma0yqy5nI/ZISk3QKr84B7aVK5WKRSS+Oq6eaqTcfGS?=
 =?us-ascii?Q?KfdbPlIM6KHNV68skto6dW0VWLIHjDwQvMjk2B+CugnUKP/vyufg5VNQt1p4?=
 =?us-ascii?Q?2IPVrxYxCfhDn0PINPzbyoxUugslnvwAPXykAjLBhQ+87k5bwPPr3ei/T48K?=
 =?us-ascii?Q?sVENDw1A1d4xUFIeH3HVuIFDjwCTu26MiPRzGnftxJANZtaq1qy0LcIiS3CL?=
 =?us-ascii?Q?D+r5BVUya+YdHqVp8BoewBwwcos+zou/m2e1oTxFUrNmW7ffkkk3pIviIN0v?=
 =?us-ascii?Q?JWaRYsflKuRfIxLF9/Mh0+upo7o61d2aiCVLXFqL+bTOud/q2udybcJsq0gL?=
 =?us-ascii?Q?gbetnNH/KJLOgY1P58rDTX8BiILQaKLbROrWrA2H5CgQlx1hEUvCDE9lfVku?=
 =?us-ascii?Q?56T2/dE3rAK6V7lYRZ3Tvhh3GuAcXDTZ0n7kxq7lybIuhQTs5omM0IV08QCv?=
 =?us-ascii?Q?xmvf15yjG8plIOL5FtM3t4SLWQGnu+2/oTXKT+xAq3CzXsLhB52i2Nw04MHI?=
 =?us-ascii?Q?xbCTzl/ujjIQPOm4ylT9cglvft0cQL+OU3VmM06Cc/dhN5qTLNqvs956cgC7?=
 =?us-ascii?Q?EUT5qbZR42ILOv4Z9fHcEcd9DfMKhyUBdB2u7K4L?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 125c3847-a676-4714-f46c-08dd61efca88
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 05:27:48.1844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZUwsCZ4FT7aOxiintGcwLYHn8tl9JSOT54ONeYVZ7zL/8bCccIGPi1WM2eIivbGYvXatwMjnAweXz//NR7oRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6113
X-Proofpoint-GUID: r2v__n7VgWidIuVOrH0LjHnVt2_QL4Z6
X-Proofpoint-ORIG-GUID: r2v__n7VgWidIuVOrH0LjHnVt2_QL4Z6
X-Authority-Analysis: v=2.4 cv=ZrXtK87G c=1 sm=1 tr=0 ts=67d26cd7 cx=c_pps a=Odf1NfffwWNqZHMsEJ1rEg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=t7CeM3EgAAAA:8 a=jKnnR-rwtCBSfVxs_woA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxlogscore=847 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503130041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 05:27:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212734

From: Chen Qi <Qi.Chen@windriver.com>

If SERIAL_CONSOLES is empty, then systemd-serialgetty recipe does basically
nothing, and making systemd RDEPENDS on it does not help.

So a better default behavior is that if SERIAL_CONSOLES is empty, then
we put serial-getty-generator in PACKAGECONFIG which let systemd to
generate corresponding service instances.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_257.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_257.3.bb b/meta/recipes-core/systemd/systemd_257.3.bb
index 64fb8fe69a..f1f6055637 100644
--- a/meta/recipes-core/systemd/systemd_257.3.bb
+++ b/meta/recipes-core/systemd/systemd_257.3.bb
@@ -92,6 +92,7 @@ PACKAGECONFIG ??= " \
     quotacheck \
     randomseed \
     resolved \
+    ${@'' if d.getVar('SERIAL_CONSOLES') else 'serial-getty-generator'} \
     set-time-epoch \
     sysusers \
     timedated \
-- 
2.25.1


