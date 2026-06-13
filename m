Return-Path: <Kris.Gavvala@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3EDCD98D9
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 02:44:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.84909.1781318633637535022
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 19:43:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=g80yOAk8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0624a503c1=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D2eg3a2943793
	for <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 02:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=4qcQt9cMP8GklBiJEH/4
	1yAbv+cTPFVRyFcs5ola8n0=; b=g80yOAk8V+6vYk+RI09kM96LyDOBtcV8fzEh
	HpN/fS+xKFZAFE4yun3WzTVoeIsv127tq7pdloTbsLFa6IeX0kgPe7JFVXHYTrxC
	DM0NKKtQtbYbleW8CmWEY7eGC0EER9Y7Hx8rhMbDwaDjO3lk6YEwa26kFDyokq6V
	SIJuPr71gkdQ1qPgbnAcRFsaExqU86zD26h/4jO6eswXZpMv9PCkggye+HPJ7YJd
	UlMqRRBFVJStsaG4PIhWPvJTvX9ZVP8hE4HVXMF7saT/1LYnzLQlCDOjgo6jSt5Y
	pgUNEvLOuoDTm2uVZuH4bh6G2NRdeg7qX9sPYUdi0gW5uTVHVg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010030.outbound.protection.outlook.com [52.101.61.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4erx63r0kt-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 02:43:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWR5/m34LkOce8LBdwMRd+E4xVh/aJovnkAaFITI83uHNq3gbJezdyk/GatiWCCNHkSlfiF1htO1yj1ZRir9qLCCs/EgSNEMhQQI6tYUgpOu/e3R3s1LoyN+Od7kQFC6MsFMhtzLCwke+0pIvEKWQGkIWOpUcRbAR5hjN22hGXFxXVwjux71f2kn1S828Zhv1+meLKBuq78wdNzY8cj8MAAzomzYGW8UKpqxLgQv66sFNZ3cwuSTKtt+1ULENzV6x7AiflUcJrhUVlQNl4XnD6pbpHR7nNU5YEoivmtDM0nqdcifP88J5DRMYyKK1NRWJ+d4iEb1jetJ3CWYoMyjXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qcQt9cMP8GklBiJEH/41yAbv+cTPFVRyFcs5ola8n0=;
 b=aaqzSpYGy7GqU1KSWeEV0sdrj0Xm3v+zEGvxBq95m0j4TTc76F9SF1Uc1bnkHocjdGHWAq4D/e5eZ92+Iv494spNllkD8fTHre0OmwYGI9qvxDZtZfC78/A9+z98mmdzdNqKotyiSfCitR0xNRPgDdmdsdBl6VQiK/pVjifjfMVMeieb974ox0FAY52uhyF8g088m0fUwW95jAzWT0UCzUtWp65NSG4xoIkI5fh7FbhMRyB80uskCjGLiZ4s7CvdPZ0s2Gy3srbk1Us47WnNP7YZYX8656gZ5I1Y6gjc9gi40g3IOp8wCXuCo/4YxLUy36zmHUXOmTM01XCtFHgzhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) by
 DS4PPF7551E6552.namprd11.prod.outlook.com (2603:10b6:f:fc02::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Sat, 13 Jun
 2026 02:43:48 +0000
Received: from DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1]) by DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1%5]) with mapi id 15.21.0113.013; Sat, 13 Jun 2026
 02:43:48 +0000
From: Kris Gavvala <kris.gavvala@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 0/2] libcap: adding ptests
Date: Fri, 12 Jun 2026 19:43:33 -0700
Message-ID: <20260613024335.377418-1-kris.gavvala@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0358.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::33) To DS7PR11MB7783.namprd11.prod.outlook.com
 (2603:10b6:8:e1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7783:EE_|DS4PPF7551E6552:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b424452-8e32-4c0e-ab07-08dec8f59853
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|23010399003|56012099006|11063799006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	pD6MMw+bzfqFIy/l1+znOyvpHoDYTPN3YGeHZwnuPzTZel1Xu0eXzfHizwonOrQ+kSiVCVs++gffhT5HdllVmp8apSw2TRZG0jHOIuANyU/qGFZu+g31yyB1FmaQCG+eDjMexVZkwBkZOJO92yeE3yxRCwxoKFAc3o5xAlyA0EPx+ry0jrF1WJ2NmiXWxudGETVj+P1viITqSC+9imh9B9sAup3X0u0R7wjADnP178Rqk4yPYLMTsF75TLx4qSjmoGnemSFpfWbXUXHXdfk6P+OnEx/FWZB+mVvlYsxUay1Kujpn9UcXWRJKv7P+AwEfUxBix8iKUCq3kzKf64hD4buDXkcWOMlsvSverN8ByoaoR8YQ4SKHjVbdJ2ZM4n1G215/4OS5m2XAJeBq0qwnBfgT9/8Z7Zu9D47NsWc7GASNhIGclaptYM/Y98rhynCHkgGJ7IIt3L42KGwXmyEMubEND+zxiYOk3W1nPTqBDAJudo8rxW0yfnmmMuNlXyv9aQVyFGBfpcD8OM3bEfb9YjYlPxlEZdLEU/AWn6hBL+KX7J6btskCHLvqHo0Z8LE1RYFOkFZiqP320siXhW8EbOPtVYKzDnGzNIXz0ZKVnjCJDzgY1+s5PElOy/DdYB546HRXljckEq2zN3tsmunTMynaGBKKeju60/EIWXzucSrQlu/JgLaJTUQSXwlwm2ZbBDzbrD2k6qMaR2wHEXR2k2wAqGHfU40449QpegRkip0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB7783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?prdIjrD4cpfS2dbxkcMrWP87NPzDuG401BAv/RVrkm+Kkc0RYZf6QxEPvWxJ?=
 =?us-ascii?Q?jjA1ZcYjkG6iHixk72+S1GUGBCOPeRWxTOGh+9hyraEdeMolwVJkYvckeiEq?=
 =?us-ascii?Q?kQAGN+/tHpTAoWA4DKGJPsxiR+DcMtfW+ThpFgv3M6o6PlPHkjp/AOUYjBTM?=
 =?us-ascii?Q?T+BYFd0VJmg5xxs0AnmslkpUvH4d23XpV6cSn1PZY3OueOzi0NIOI6gCVoce?=
 =?us-ascii?Q?DD6INozv7zL60KuehgAO+k4/VujB9bEP48MZ05amrXUXmaCdWzwKzrXl7gcA?=
 =?us-ascii?Q?/txAsKDMshFJb61Ogw9nYgqurcKsa2MulJ14q/W33Dekg/NJ0gwuvOgcys0K?=
 =?us-ascii?Q?K31T9H6d//O1ZGaBJFXYGwc8xG20RZBfxS29Lqcxd/v9pcjsPU5z21ufffEz?=
 =?us-ascii?Q?vL9WOejcxBw0yT0T7iHiaJqrOGAPRKrla4bt2NuTZYpwKpLFJQTpi/+J3NlB?=
 =?us-ascii?Q?Ol/1ephjn+OHsjqbU3ypb2sSrdIDx+5nMC6w3X/CKtO4yB6PVd3D7ypV3Xvi?=
 =?us-ascii?Q?Qm6LnmyBBMXXwwQhcQKNB1m6bVCddri/4S4YaUdtfbkInrNl0MQ1Tp5s6S61?=
 =?us-ascii?Q?tKMNX8LHXSx0kDgli6k1mE7mAB2Km75AwF9LS7SkiD3lYOWDh1uzm022jDci?=
 =?us-ascii?Q?AAu6WfFzS9i1alNngvXQFAChNifL8r8guJsdYVm+xHC8c49gGKEuJh5hTcb9?=
 =?us-ascii?Q?yvd6H1topZg0gT5losAcqqSKYEbbcmUrCrvGgzW9ii+BhA1sS0Wo7r5N9HeH?=
 =?us-ascii?Q?lR9CpHUXic46+UnOBA0YuGiL7qjaix03z1vxcABVs8sRFMcF3wb9C598/sp/?=
 =?us-ascii?Q?5LUOcBRbU8iiXiVac5Bw/IXO/+lhCmzYErH5NsTyZDcE40Nlqblkp7HMWwDC?=
 =?us-ascii?Q?TZRDkgqk/M+o6BTmP5HvuqLOWk27VMAAybS8hHxf9tp+pWPyhJ1BgFSM7yTb?=
 =?us-ascii?Q?4XUjF9Gu6wcNAMBHq7qS6h8esLZKERusbVJtBgP1uljtvA/WX4jTWrfhwgfj?=
 =?us-ascii?Q?mF7aTqQ3aDTfJEUJPKQbPgpU9SYVP2c6UQavAdjUXV1qwo1mh44yTbarLvRp?=
 =?us-ascii?Q?lrgn/iRw++YJQvk85P+bfGw2o3JRH8ypPhCkCIrE9o0MEDg9wLoUZdFix/jv?=
 =?us-ascii?Q?7vYiJHwNYu89zZVgLOegUlX/4HqicDIl5BRpqmC+1oW866wHLzXc+WSHV4EM?=
 =?us-ascii?Q?9rTC/pBkycTZbQsRmwemt1mSdoZLJlviTOh3VdICc7MNvIWH8/swTdq4PR4v?=
 =?us-ascii?Q?nqdQIKBSlqwnslj0u+HBpjDw/wqj2NGv+N2JgeOKaoLnxPLRQNKybUDji3fa?=
 =?us-ascii?Q?YAW01YcLUjy46gXpwtlJ6OkV3OIH7ZCo9hG7rXjL+8BAr/G56CWcXJmTzR8a?=
 =?us-ascii?Q?4upxcG6/j0ux6pH+K27ZSmh3dgCCUZYIHZieXo29FZtOi8uTWHXyu+HrLzI/?=
 =?us-ascii?Q?K810IiEhiu8W+qJSw45sJwJjsP6/SgiDcCSkyOgOeFL/gdJwAFUZTmP6WjvS?=
 =?us-ascii?Q?6NQeGkIqt7jVJ4I/yudnCybXthe+WJBDOVqP9Z9sYAL/uMCe72WlpVUkXY1H?=
 =?us-ascii?Q?fQXNjCoVHjt8m9G8PbRfwDkh4qa+zKkbuSJDOEVThZVxEAuAs5n9rDx4CJ0e?=
 =?us-ascii?Q?+dT/uRhW7A0yA3J+N8ksipE53JteyKlRtCIUEe5kNxEKz9ArDJnQjkQEjLDS?=
 =?us-ascii?Q?falRkC74ZfLisBUFiNclq/jU51EVo9Pf5ByXCBfvgOpFc8FD7ifD9nRMiEnx?=
 =?us-ascii?Q?DIah80vIzMUq8GysUJYxCLojZD7TJmE=3D?=
X-Exchange-RoutingPolicyChecked: 
	LPPUNM4sY1gdA9/BTuo/k+ik4OI/kei5utjlCRb1u2j0ijK+z54lu2qcJauO0E5xhnX68Lo+siEY8mFhcEXexWgQdLgMVaybLbj8aILjbPf/2CeuuLu7tQ/DC4rZ5F9bU/xkbMtJWD/kfU2iZPdi1jKxJY5QpIBbzhqpXFE0c9mjo20Yu9TNcKvSEUWdZdn8pmBrt38BR9YjDUqXkeLILSKuwKZ8URnkvdgwV7oZ40dmLpOaYBT3Zw4+IjNRKZeWrHDcpuBgEaaKMDeJDz9PS6IsQzHbI45w3CKGlaYSMSMCI5X1HDzgozUp9Q+PkMJxQNmOiVd+dFghYhlqBJNeCA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b424452-8e32-4c0e-ab07-08dec8f59853
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2026 02:43:48.3383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZyXlD5rp0gYT11Cp/THg6Dqqo/NvB9mvdai2vFwTlvcXa5cs/0syapCVe05woQO4w4xP4lAf5rFptUNcErzEX48tyQSJdMAMP4Rlow2iFxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7551E6552
X-Authority-Analysis: v=2.4 cv=SvmgLvO0 c=1 sm=1 tr=0 ts=6a2cc3e8 cx=c_pps
 a=eGdyP8VkvOZnUY1FLHxo4w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=is2y_ViQX_xNschNCQ4A:9
X-Proofpoint-GUID: Dk9owfDysC1zi4elxbdG-GQpzzHU58VW
X-Proofpoint-ORIG-GUID: Dk9owfDysC1zi4elxbdG-GQpzzHU58VW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDAyNCBTYWx0ZWRfX+WqVGwHXdEoA
 QjICgBTnscPIeStG1g7oLt/+3Adzqh6TFKxaZV1NakN7I8bY1AOrecUmEMHZV/ZAHR/ebXzxRWr
 179Oni2isgp4oiVODaLCyuGa+OxTuYg+pnyUGDlq7MgV6rvlleEQRdD8iDXW4i23ir6Ju5DwZos
 llWsFkyIJsF87fFn+ufjgwICBLB/LZ41LfrnONNj4XLV4Kw14FA2oLmpQu7FTvuc18EcHNcp0Y3
 4hWfKXQns7j1Tojnytei1E0tWflwGYooJVQoKvj8/G8FhlyVabG+Wb/pPNkicSvdJk1laaFM4C2
 XIyGgmQlWKSLmsR8a97fNs+xuhsWFPxb0+QqTqWbYUmPa//U6zMjDSKCoc0Jo8ZYjtQkGuWQG2v
 TMZ3KWKwmclyMeaQXfLcjO0tO09VZE4jVjlG4MLQ/USSG78sjtcGLo7vKEJnj5SNj+XYztxWxqK
 XHVH6Et0Z2mj54/aLww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDAyNCBTYWx0ZWRfX431t9w/3lL7U
 IWNwC7Xkqa4/cSkk1WRKXi3fOpEfpwhTCaa5/cW94/rUUn2PdEuMq8+snwXmlfB2k1HJGmrJ2Ml
 A0q6gNJdAExOiaAAnB3ob2jawdu4YuJ/TsBtO6exqsMFAD28m+aC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606130024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 02:44:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238650

This patch series adds ptest support for the libcap package and
addresses a bug in one of the upstream tests.

The changes enable running a subset of the upstream libcap test suite
as ptests, and address a bug in libcap_psx_test related to
exit handling that causes the ptests to hang.

Kris Gavvala (2):
  libcap: add ptest support
  libcap: fix hang in libcap psx_test

 .../distro/include/ptest-packagelists.inc     |  1 +
 ...1-libcap-fix-hang-in-libcap_psx_test.patch | 47 +++++++++++++++++++
 meta/recipes-support/libcap/files/run-ptest   | 25 ++++++++++
 meta/recipes-support/libcap/libcap_2.78.bb    | 44 ++++++++++++++++-
 4 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libcap/files/0001-libcap-fix-hang-in-libcap_psx_test.patch
 create mode 100644 meta/recipes-support/libcap/files/run-ptest

-- 
2.49.0


