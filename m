Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 085D3D68BCF
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 02:28:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32058.1766024928535124591
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 18:28:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CHXKkv1d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44473d6ac5=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1UmY83828772
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 18:28:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ebddCwP1sJ6sHUN90M6K
	kfSzY18N7EiYnvmKN09iOh0=; b=CHXKkv1dw7nyJBdJWSZCvqIC5QuMLeVRjxe0
	7z1lTV4ZdbB1pd3yHp4ZBuayOkl0rtoajiA+W1+5lBxGRI0ZFB4ixzmTnEgE72Xi
	C4uWeRfInmdrIXNabEnylj+culgnnZsAPQ0GeRGhLxVHhsnWdhslpwRxVlaf8iDD
	tjS31w14G2vJQMW+Tka79kqpamt1/TcLs9lAqCyinGPfJjwC/jfp9w+Fy1fRnFH4
	YP9YfJbg5ZIlP/dKyqUs0zTB6nxPIDxqtCpAAFvSSRrayNzssC+Fr3avwCKzwqAq
	0SSdkz0RKyX5G7dwR/EL5/GSfFnWKdhlznhGjRircbDaib60aQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011069.outbound.protection.outlook.com [52.101.52.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0shcee-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 18:28:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKBwFTdOu1ocbW2/4vL6hf997ULYHkiVg2jcfqLEFL5YwJrD8CFqA8u81b25M18Myb6vxfP+EZbXWbbPadUd2qSdCEoGtuEA+2DY7rWAV3mbXnrloLVFrAM424O0GxnGRnR2tAhc3K+mAGZonecXW520eOzd/QNDKSceURNvv4es4W0BrEwKapvxnyzU/QngufvYg/2hCdQm+V4jOPrwYqMVstQ6inQ2iDUFYQVtfTf6yKbnDJPUChm3Tvy4lRATucnEZs3QYXaQl8PDUSwA2QZloLQRsJRWueVyx6zmD5wstAYX8cJ3t8NqYvLhLY8e34sP0aA4t8brted4PxG9UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ebddCwP1sJ6sHUN90M6KkfSzY18N7EiYnvmKN09iOh0=;
 b=cdiSmkk0Vl+fbgbfUlPGiqLc7yMbw8A1mVnudxrfoxAQTuuMY9zw3Pr09qWRoKKigutuY/Q25NlzXcvth+xD0WU4zrRi8h24IKUAqo27YD5rTgq76mMBiQZQSK/lR/Ze6vVsLM+5FEc4R1yrnb7mja2ymYQmWhjpyl6u6uimIuqd2QMiyxMw+d16C09HYclwAvfPjPkIL7l4ddB+W5fZba0Yu3tWxVZDn5hK2Nu2FNQPOCYB++GJCnI4y7rA3dCPY7Mt+9cxjlfha8zlEKC776qMPiHoRr/nWBouRtlkJr4Du7ve2Ot5sd23wpHvGUYUb121N52J6j0HLnvT7g4CzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA3PR11MB7413.namprd11.prod.outlook.com (2603:10b6:806:31a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Thu, 18 Dec
 2025 02:28:45 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 02:28:45 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] gnu-efi: upgrade 4.0.2 -> 4.0.4
Date: Thu, 18 Dec 2025 10:28:30 +0800
Message-Id: <20251218022831.3368366-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0036.jpnprd01.prod.outlook.com
 (2603:1096:405:1::24) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA3PR11MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: fd970f4a-147b-45ed-a231-08de3ddd2b43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Wehre/TG3d4idzciH/hwBs4NRYgqkZpLSChuk4xOuOWJ7nnrWfwH9g7Dv+Le?=
 =?us-ascii?Q?/Ik68ws8VkVAy54bmGxWB4qVi/dnNrX2K/nntZJJkfynCi4ur2ttYPm9RDKs?=
 =?us-ascii?Q?Sb38cbFq8dT9sJtnR9AYtbTrLgtDMX9q8+vEuDymZgWkkURl3EBCUZiL/eVN?=
 =?us-ascii?Q?FhhkrSU6k+CdoYEShboaemlEfbj1KGNdCvz+rGhZr0qS3ruT5uitc85DziDo?=
 =?us-ascii?Q?qBDx2Mps/QzpynueJkOZWL3xkzr8kbNgEBnb/Q7k80tG1bA1lyJF1XbjZ6hh?=
 =?us-ascii?Q?oR4YzcyXJhFDWqnhw2sOpxwcGBb/Mil1HYcAG8MqQUU46L+8tdpBaaUygVlS?=
 =?us-ascii?Q?NtOVCMjHO1u9hp77CBnPOQ7Zr6K8Ur0dNvNmkBcqxhI/y8OnZbwLTMSJNccp?=
 =?us-ascii?Q?dXgGLmW6IzeqiFpAfKv4v+5KXYlsRm7jaXmjK3QYuJprJbrm1T+mB7KLUFRR?=
 =?us-ascii?Q?aYPiaCx8QBk9Zc97LmHk3SQGjqhvgeGYsFsxe5v1GX2F+CmZrP/uTzzdrmiu?=
 =?us-ascii?Q?bMIeXVvwR8ZdAc/LtywzUOuykhymBTfDD5z8+vHy81D69g2ZLw/WeLo7IlR1?=
 =?us-ascii?Q?m5ucKknCeV2kZrrdJfsBvFlrX8zAHkwOPNTNip3XU5WKAWDcgM9+n7GGh6nY?=
 =?us-ascii?Q?baGZezqkhPKVp1WUSuMMSx914L9jEXGvneYNDiZvBEoy6s8yu7n5Qs7W23se?=
 =?us-ascii?Q?+7o54p4nMsgVgPd2V6H0GNUZUk4lE1HP1/GxqyL8cdfKuVQeoGyxrn3X9lir?=
 =?us-ascii?Q?CJ9cd7CrZ0lLriHZglOEJxn/sLl2OnMp7IijjW8RsdvX08+YNAQ/Zm8WPty5?=
 =?us-ascii?Q?PE+oAwraPsBGm7yi4EKpJUKM0p4jUUBUid3q6OrFvuzTZItT+DRhgZWsS/dz?=
 =?us-ascii?Q?Ise5dAmwWGtim6xr/RzWw3CAKa3Lzg23UjWQdbWonC1gLSiTBBynI6HRxfMc?=
 =?us-ascii?Q?hudS+OkWmQYTjajDsJmLwHznsmLA0MqhEw8nK113fspfq/Xk2pUUFYigyp6/?=
 =?us-ascii?Q?ithH1Q+O/5wK46jxYqKrajkQ7U90KZa/fIRM7ecsBju6b8z8uz8mwF6dW4X8?=
 =?us-ascii?Q?9oXwVPXIC5mppkBaJN2cbvYBlj/8L2h7+ZPaoC7sYHzlScfSHmzezI/vZVnK?=
 =?us-ascii?Q?pAsDlaBtnt8T3LNzUlcu71DbxAERLQbiZDUk1rtx53gJLYAVXa26yKpEk+ND?=
 =?us-ascii?Q?gzGIi5NfIrClPd53HcPfK8tAn13StW///zzhM/LqQV4qXR5XPvLahAmf8Yo1?=
 =?us-ascii?Q?9zp+8N933mQKpxKGiFY/zPQOt5Wb5l9vlk3jGk6NRJgDDd8dJJIsNswCUP8V?=
 =?us-ascii?Q?klXOxmuUSTyI1CG85xEqYz2tXItprq1AJ8XSvtiEwQo9Z0llEtagZED4pAzu?=
 =?us-ascii?Q?1a5e31BT39i31MgSHBjDcHMcUn2X9+2IHCBgd+A7Y8qwGwwbpf/w/fahfRy0?=
 =?us-ascii?Q?11lu1i86+Sx6TDGhQr8NDzEB32y+bJkDL5fA38ebU/O7WjpyKhr4qebYI9yx?=
 =?us-ascii?Q?h21SX5DNMwNqwpkhWsKF2cUI+UG3MPJLa7pksYj+7gldOU6DmXwuEiBF+w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mMiNEVBzERQfbl3/G8s8yO7tWMNO+MeBYr7eOiQ1cMuenP1fC4yUSxnScsBb?=
 =?us-ascii?Q?qKYDiBKGvcwoKFISrpeAOq10JkmUpq9MviPF/1aYN2w/ARFEsx8T+W+kEAuN?=
 =?us-ascii?Q?DMWy01MhJJxqkoq5Y8kV5Kg/YK7hRLWbWKS1A2wVzTJXJKoVfjwIOJ5Rca3L?=
 =?us-ascii?Q?2mf1qC/0Hho0fh7nJEN786INBVRgC1uqg7VaQ9Af+Bm5tFOnGjvQXK6bfVR1?=
 =?us-ascii?Q?xjnczD2waRZ2CwsLXhkxM2wx0CnRxUI2f0D70CWncSgzRlO+IpHLai0/tNq7?=
 =?us-ascii?Q?ZRgp8HmNq+qAUMfAB+lV4jr+yiUNhqe3s7nQSUi6+JxC5ZE4mtR9HddLxuqf?=
 =?us-ascii?Q?iy64GyVXNmia9GQoUx+Cj3HwcqMliuUlfDtMAhPH7/aUe6TzqbUjO8VIjWpg?=
 =?us-ascii?Q?MEGLbesD6RyMHgBVfwMOK2vE/xx1j5OpL2ko2EmYsjZ6YrxuXyERuDfQjYNS?=
 =?us-ascii?Q?IzGITdhq1zZKTzNhgKfZS1rPR4YUgY8Q0YN/HVRNBHP7BN6Bg6O/yP9ddrIP?=
 =?us-ascii?Q?4K+3s02nZEg/BWC8imCLxQsSKTUeTXDyD4wjzeM1hpGOnoqk9f+co+aD8IXp?=
 =?us-ascii?Q?ypRwSdrJytvADSa9vEZaipRTbUphP/VGX6Mka1bw48A9SwM2wQVFReoEBQNC?=
 =?us-ascii?Q?NzdyBIDfl5uMmd3s6+N19DpPoDS0NY7hNsEJM0mvkEwJ+81Hu0yZqZEhVO1I?=
 =?us-ascii?Q?OAPpRrV8CDX3pJZfyontzzR1f9QGCxQyEwzWhSfUojFiF/UULs9Qgj9Cujzr?=
 =?us-ascii?Q?fveRoDrmNaQfYIgRNVfNDW40Ed8/BFGPogg2/+tcZbq9BmNW4PRpriv4Irlg?=
 =?us-ascii?Q?/GnW3HmxF/SplJfudvEBDNnVu3mErqvKRrtsDLPfJUgtzXyMRvxIy/W4kT+N?=
 =?us-ascii?Q?KvqqKUEQ5BR8Bg09+W8YEApxhvdgT7vn3fILaT8Kr72u4A08aq4nkboKChdY?=
 =?us-ascii?Q?J9sFwk1aMwvT8BqJmJDTCRGjbdKCcXwJc+PgRL2Uz7BNyvVAKI+c+6v6/N2Y?=
 =?us-ascii?Q?bunUMPrFs9+LQXAoxiL99GpTEicBmY18s99k3XA0wdUHhPbgQhQoOdRmbz6b?=
 =?us-ascii?Q?NW/4EtI8UrWCPxZDvCXC/x6yZDsH4JzLEaz8/iymbc3mmaIWmYbcrseXOblS?=
 =?us-ascii?Q?TA0N8B6g9DEIzIhBgTD3q762D3UxdZKYw1MsYXHu1ni0lggTpcbG6ERFjv8q?=
 =?us-ascii?Q?YcLxolt99LFXsBGe5DA0KYi66NEHdLjF+4CW0uHwvauJ1t0+toEBXihT64v2?=
 =?us-ascii?Q?lcRcf/n3p8Ci6O0Zwt6AiEpLfh4AZUkqcoZ7zeAD1Yu9aicgt+gjaD6qCaE1?=
 =?us-ascii?Q?PPvj65x2Ui9RNNGaGVcKOrQb/M0yvIYizdFobOxuZshaVXcCRvuj/2Di0gSm?=
 =?us-ascii?Q?W/QZb0G1cIJIaWm5rsCzQ5DiJv1vw/3Ky8yHN0Ijxgb2OaljJPeUkGHD+Vn6?=
 =?us-ascii?Q?5ZP5gYsRg/NDyk9JWtLEA5llY0GXDbsdAvUDRLxYH5HaeWcKIta2zc5c42J8?=
 =?us-ascii?Q?kJRVWKSH1NEkSXVtPQaOS160sCzg0SHpwAwvRdwIvX0Lmd4AED3Ts8yy47kG?=
 =?us-ascii?Q?P8am+EclXeD4x3JH1l7N+NZlQOA12U+0O75SLPZJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd970f4a-147b-45ed-a231-08de3ddd2b43
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 02:28:45.7555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQNxfiQ6k1Y4Kp+qRqaBNmLQB1X38qqUMpdFBCO0Am8Lnx6YXCCvJDanzg/vmCMG8CkUYGlZZaxFPSFONKMLqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7413
X-Proofpoint-GUID: 0aumjpbRCOo6L4gkCn-SY8f7fsg1ClDX
X-Proofpoint-ORIG-GUID: 0aumjpbRCOo6L4gkCn-SY8f7fsg1ClDX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAxOCBTYWx0ZWRfX6+VI9iLzxp3H
 9Gtkizigt5oO5Wlaq13lhoPixG5OPze6dX/jjPCCOVdkOLv7kWeTiWDpwUuPVRcPYi735e/dCw8
 MI/jm3crxQsEA/Z4FEix0/8MCt47GKa1/CXeihES5QoM9XUFOX34BMG+OyiQHPB1JecLF9w6+Sb
 V4wps+DXucGY6qsKBN+XZ8mjtVkTukL9XRBCDxu/uzIa504PWlT8eAhky20Qi3gzy77jnDcsmnS
 9MmP5y1UqMsLGuSEbMkZDu9/Bm1UAjdyvSP0ww7dCsieogB9UySHdSECvOLiLUFlfJiwMYMfPTW
 eT0wioBJPLl1KKja7zdaXjiE95h7N5+gvwes9da5jDf7111VGBfLEmZB2p9i6C7UNdzbDfSRxqU
 pxgdOrbkzBqLlVIEnMW9RbHDyf6wrw==
X-Authority-Analysis: v=2.4 cv=PqeergM3 c=1 sm=1 tr=0 ts=694366df cx=c_pps
 a=KKuy1w1gR68tVOnyqteslA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=EXkz5tQMSriuWsmPsXgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 02:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228078

ChangeLog:
https://github.com/ncroxon/gnu-efi/releases/tag/4.0.3
https://github.com/ncroxon/gnu-efi/releases/tag/4.0.4

* Refresh local patch.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../gnu-efi/0001-Do-not-treat-warnings-as-errors.patch | 10 +++++-----
 .../gnu-efi/{gnu-efi_4.0.2.bb => gnu-efi_4.0.4.bb}     |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_4.0.2.bb => gnu-efi_4.0.4.bb} (98%)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Do-not-treat-warnings-as-errors.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Do-not-treat-warnings-as-errors.patch
index 2909420933..eb99d82046 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Do-not-treat-warnings-as-errors.patch
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Do-not-treat-warnings-as-errors.patch
@@ -1,4 +1,4 @@
-From 2f70be61679933805e1d2fef4fefcaf041cbd8db Mon Sep 17 00:00:00 2001
+From 0298e10c334241ec503992db567d6850941c7737 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 16 May 2024 21:38:32 +0800
 Subject: [PATCH] Do not treat warnings as errors
@@ -15,15 +15,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Make.defaults b/Make.defaults
-index 777a638..bf98939 100755
+index cf7a88e..399e31c 100755
 --- a/Make.defaults
 +++ b/Make.defaults
-@@ -275,7 +275,7 @@ EFI_CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
+@@ -275,7 +275,7 @@ EFI_CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Wstrict-prototypes -Werror \
             -fno-strict-aliasing \
             -ffreestanding -fno-stack-protector
  else
--EFI_CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
-+EFI_CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra \
+-EFI_CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Wstrict-prototypes -Werror \
++EFI_CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Wstrict-prototypes \
             -fno-strict-aliasing \
             -ffreestanding -fno-stack-protector \
             $(if $(findstring 0,$(USING_CLANG)),-fno-merge-all-constants,)
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.2.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.4.bb
similarity index 98%
rename from meta/recipes-bsp/gnu-efi/gnu-efi_4.0.2.bb
rename to meta/recipes-bsp/gnu-efi/gnu-efi_4.0.4.bb
index 5ce5ceb884..0f493b8414 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.2.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.4.bb
@@ -18,7 +18,7 @@ COMPATIBLE_HOST:armv4 = 'null'
 SRC_URI = "git://github.com/ncroxon/gnu-efi;protocol=https;branch=master \
            file://0001-Do-not-treat-warnings-as-errors.patch \
            "
-SRCREV = "1fee8ab566ce91b9cbab9f2c85db96566d79063b"
+SRCREV = "37cd8f069bde6715eebdc5e38a8f15ee6de5edcf"
 
 # llvm-objcopy fails
 # arm-poky-linux-gnueabi-llvm-objcopy: error: 't8.so': section '.dynstr' cannot be removed because it is referenced by the section '.dynamic'
-- 
2.34.1


