Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BDAFC590D
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 08:20:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65872.1772093995451568824
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 00:19:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6517c16aa4=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q7vD2Y371874
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 00:19:55 -0800
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012038.outbound.protection.outlook.com [40.107.200.38])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cjdyjr700-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 00:19:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uD/3DjBMAjt1MKgTfesayvyRCmRl7mvBM4ENvDhWbKTgTrS+qd0FEF+cx5NFsb9AQFHqkKoy6lvDIk/mdOMV0jTA2dArjzA5ayXC29JXmcWT/LV6lKljzSzdNr0HvlhQhiDp7KYxPuT3XgmYbsO5BPHXbxf1tJjiKp/G81iso3WBcAi6hU918p9hy0tfRHoz+1u9XPkXAjA0+JdZ1+ReIf3GvMTzlBowQF+YktXkUe+GVnJGosH9WTrWi1rSWekHzbm0q2IXfXIfz9acgTStME1SY8cwGOKFSFhNz8O7azCVyBAFDHPKErP4eGL+MuRJvdao5CDmyG+cmAxWvzSPiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LGwbRr8zAoWuhXbmSLVPyEspvuuvhuGRJnSB7zxqrs=;
 b=rCDQquH1HHAb93LS5rf116i3UjuQabhY5LuYfWjBRy4frzCbcW+hfrTK3rL6eq8XfTVvx9l9QnlIkqMQulOevGbp+XrzWF9lIXFYVgG20z+LEd7tBg11uWt73n+XxUzWuIxEUxwUIJ9wYdkuHZpaWbduyXMeVZZnr/3BACfClb9bowVssDtEhvB6UfrNrmiNnadsGTkVYVcGyWVXJqubwuRLPUVp7QNbRhZ9FUgH8mlYBtBOZqCa9ARzRG/cPZZmpDgvOxllNsltgrTWQ97XFTkJ/2Bqz2fBz9I9PH0BkG+3LYCOAFeWWFvkGK4uBobabg0dAnOD5g+OibkaYbP2Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from DS4PPF641CF4859.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::26) by DS0PR11MB8052.namprd11.prod.outlook.com
 (2603:10b6:8:122::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Thu, 26 Feb
 2026 08:19:52 +0000
Received: from DS4PPF641CF4859.namprd11.prod.outlook.com
 ([fe80::4fd7:cce3:ed40:ad73]) by DS4PPF641CF4859.namprd11.prod.outlook.com
 ([fe80::4fd7:cce3:ed40:ad73%8]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 08:19:52 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org, arindam.nath@amd.com
Subject: [OE-core][PATCH] grub: update search parameter
Date: Thu, 26 Feb 2026 16:19:37 +0800
Message-Id: <20260226081937.671793-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.39.4
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0063.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::12) To DS4PPF641CF4859.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF641CF4859:EE_|DS0PR11MB8052:EE_
X-MS-Office365-Filtering-Correlation-Id: 85282b9b-4499-4a33-c388-08de750fd08f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	Wdj0Pt6uXP1/c3UMyRjBR7JMI1tlovF6TLKpchhLLSLb696UO2iis/R2K50K7TU4OJQiP9c+il8qCxGwCgz3krO2qP3VTtCDLhNUPije0sZGaA+ToLgmJSTbQN8phi1ITqvtmJs7+dmoJ7CFRCTHJOJXGvP+Pugjv8i8Zw+mzd+HjKUmRxAXzh1+Nzp0nXxzSjqZ9dp0wFC2GaBq1xw+XoV4Ex0zcr5SSFr4xQVPoN1IAl8uZv4JX9I6hNv1LF9dmCrKZ6M0CPimvNYcqiO50HUvOkbYWm9ltYpcxHKQ2esBwqe6kLWflgDGxbSB9XG7vkwIv6ncWHsBGsucLZ4L1wTHGv751y5pvMkMuHjFG2TtN/T+8M+mkdJ1sW0aqcJZdfhpkTnYsR5l1H1dAuF9EmfmW4NGLsaJZgP4Eg0fmpdwoFvGqjnzbtynvSMWmp8B31mgFoIKp2lo3pGkwYqdv+SnCSBiTpvRqqHQAEJya71Z9lUh5mHG0GlEoMmZHeXMSdon+XctGA691fGnx4O1D9mI2sIOQWEy0HDn59hX3ZUagep1V9ugKrwpYjKovt9tu64w5ftnntkbmKdy2E1YEhmtPj/U/yptojjNVPeKncwGSJlYNB5xfQLsYsdA7lShVBwtbPBpPj6caAkJKdrsfxNik0XzJM0pOXQo1H/U24kQGRmlKIPgOQkBLr0Xe2syCnNPdtKfE6kyvaMcTIjopcCkXTLDAAbDWS3herZWZW+2Z8pGVX9h/RF49SyRpnYoDy4sgTFBAwTady8FK47ipd+ZyQw/WpZb3/CNAnej3X4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF641CF4859.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Bk3ET8DkgEAQOmCQEcOodR9/aWr6YadBQN6DnPJzVEyBxCtyRGUtaNgdx04q?=
 =?us-ascii?Q?qZlOgsM2tf0jwGe/vf1+S5TU8EMqq8yZSpbUz71Uyi9A/xtSnjKEzngQl/lu?=
 =?us-ascii?Q?ox+A1YwrHi9AuFtgeg6G190NxfMQ62hvIOKI3iejn/JhdjYSKkQDtu6IbCzQ?=
 =?us-ascii?Q?8+wbNzxk6zAo/T2sf+xxbXbc0mLTIfbrQCRxC+XD/2MjsApB5t5UjMe7pIt1?=
 =?us-ascii?Q?yh7r5mVa+53y0NHwsgou4akXyUNtWoneRu93UhxQQZ77UmiaUHkTOPQZFcmq?=
 =?us-ascii?Q?+oEvBSOZw02CKUKLVpI9XjqG3IMzYqRWDKxZLPjEWpGsJFX23yWtNhZthIUu?=
 =?us-ascii?Q?kFiJA1xZLnUGoUP59u3uo/Uc01diE2FJYAgv6JXh2Pmw0r6uXwVMZH+SCE5q?=
 =?us-ascii?Q?wmJO0G6xGgwf3760+fuOGyYiZRsNgHAi1GRO/IEzTWcuPsRYMgSgKKEEGlxg?=
 =?us-ascii?Q?XvEF4PT5bTXL2IDVb+4ydj9nXcrdq6q2JxQIksQlEappjFzNo7qMik9IqpkD?=
 =?us-ascii?Q?yocqVup44jAjdjh5chXxZ0nfZ3u3GC1DLY/iqoK5og7i2qV66DaV3PzLgXCI?=
 =?us-ascii?Q?rKkRGeNykH+ngbbh0xep0VJfdZ4Smc7jlwWfv7xE7cgef904VJ/MrUTozbQs?=
 =?us-ascii?Q?XlG5kPtpr4NobcORszlCFc2uRzgkQ43nHJx0oeHR+6Tz2XTNL8OGy+x93iRx?=
 =?us-ascii?Q?xXPKcC2On/wCkE8vl5mgHDJqJAnmKA9B8MjkKiGD8zf4EvaoPRDhlxLlioRR?=
 =?us-ascii?Q?jZtvSANcgLdwm11JEWds3zGRnPTMRiRXq60QowJrYyazbmCigiYrI1dXaH6X?=
 =?us-ascii?Q?h53bSnCT0lHnf7BAeqLsLZA5Tuk+9nhqsDc/KRGvXE/NXewfdU0gD90sf14F?=
 =?us-ascii?Q?AY1lipMnyakXhJat+h9dxmf37p5NjfU397Ek9KeuR3KrDj2zX8UzOdk9yEP0?=
 =?us-ascii?Q?8CYLUwf1z8wRoUT0VoAtnfoE4HQikROC44ThuI8jzUVUOJQ3vbrQBlYSjzVb?=
 =?us-ascii?Q?i6jCiTKNFPaRK/+Usbgt0KMS2lVoGnsbHQdKo4ofKC2619FG5UpTLL6In7of?=
 =?us-ascii?Q?HyrwAyVZZmawerxBeuJAE/3CO39ln9udYOoEODZIc0BNFL147sRJ+9cR0PkZ?=
 =?us-ascii?Q?AC+bpimVkIA0qkFX04gtsDZZTihYgIwuPjLSU5NXgDVv+KQ3KXUl1/nDzo3r?=
 =?us-ascii?Q?DrEdoImR9i9R6CbuVXpPpGgYL0/qygP6vp3z/5gXPZuIfLDRxmayTtSyz654?=
 =?us-ascii?Q?3k7v5WDeck6oKfBB3qSjfKyYfHBjMmrhrOoknNByOjKChA7e8KsCvZjcNeNc?=
 =?us-ascii?Q?gwqNjn9Z5DMFZyoOjvXRs1AaY975QcO6P2JKUsibZYgDm2blC9HjOMYju5Li?=
 =?us-ascii?Q?PVPxRDGf6n5ZGf7kp8ETdEehPM2AXxLV6bA/+xiJPwcLb2XnjLtsU3IQtZV9?=
 =?us-ascii?Q?m1Ai77P/ZPV2OQ8AWaX0c35tywyEDaE3J7UDoywuZeXIMP7AYExIvhrmCUTw?=
 =?us-ascii?Q?eiWQ4FiAVRkzShmOhg9lpoIC/C1UgCsE//JjmYFF8p1nGEuktRlJ0lWFyYIJ?=
 =?us-ascii?Q?2Ba9+wm7+TXyKP6jDYniBQ/OBPchWuqdoYfpPT3+G9FwNp5hVcVoj9DdAk7g?=
 =?us-ascii?Q?FPMDfBvfdJY0c4zqvUBLY7HHtgn9l8AcVv2Pg+SRzwpzux72B+HxcbuazdnN?=
 =?us-ascii?Q?BOXWngxLA0hTc7AMH75H+84AQX7ZamH30NcwLG6GMbjAr4ecSIdkpudUuvKq?=
 =?us-ascii?Q?hDynV/yYPL+DlULhuYlmsjHdvSmTSRY=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85282b9b-4499-4a33-c388-08de750fd08f
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF641CF4859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 08:19:52.0056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJ1BRxEL1cmIYF1vh9SwS+iTRlEh03U9jPg3zwlr/Xe6QffSpImizEs+YcTqvbtZwXyCOXfrypJGCltwmvVZqAT6WVI+2oH8M+bW7NgKqBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8052
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA3MyBTYWx0ZWRfX45H7kY8iMGhf
 +WHGXesGafbSKWBruvpcA0rkGcFnU9cdftMZUm3vwCapGHSeeJzdCGlLnO7BISkeHz+Ejcz8lLc
 y8xNG/RUnsEvej2YQpkRR+CMiP/QIlkeTO6Qky4gTFXY926/qnuKo+VM5afjYooEh1LolISjpQZ
 a9T6YJ5hfqN3CxXYcCQwOklkMZx4TjCC7FWdpXQ1KrsHSjH8rwwhu4/yrp3HTU+6P2edUFROBbf
 yu/+WswtlTyibr+wUQ9v28cfApB0wHQraoiDCJ3YFczr6uR1/M9m1MmhEr0AxK2DVSCjs94nowO
 ol1C06b3F7iAQg3XJK2QMxitNKQTggBwcCOfoAcrL6uP0GnwP7wvPR3u0rIkrXbvVZAVOAlUf3v
 DoL4/Rsy7WZqiKgfBPi1imTgVHImrdu7V/ZtiYJlHI+WYl1MX8aIQGMRwTsPGmPW3IbnMDZ1A9g
 fR9k88hGSI0LBp7zz3A==
X-Authority-Analysis: v=2.4 cv=Cv2ys34D c=1 sm=1 tr=0 ts=69a0022a cx=c_pps
 a=xHz2x/H0+t1Z4EfVAX8SiQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=bP8yuihqUULSQ3ZdrO8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: GMyYpzLvqTJs17ThyyloaEmg9wzM_tz3
X-Proofpoint-GUID: 9HmwzDMBRBYre1MkipEKkd3hV4vem09u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 08:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231993

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Grub would report an error message in boot stage as below:

   "error: no such device: ((hd0,gpt1)/EFI/BOOT)/EFI/BOOT/grub.cfg"

Consequently, the root variable is not set, and the intended protection
against cross-device configuration loading (the purpose of the original 2014 commit)
is lost.

The most robust fix is to use the --hint parameter.
This separates the search target from the device hint, avoiding
fragile string concatenation and supporting both prefixed and
non-prefixed $cmdpath formats.

Fixes: 5ce73b6055ac ("grub: add cmdpath to grub configuration file")
Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta/recipes-bsp/grub/files/cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/files/cfg b/meta/recipes-bsp/grub/files/cfg
index 8ca53d24d7..8fe1a8d0c7 100644
--- a/meta/recipes-bsp/grub/files/cfg
+++ b/meta/recipes-bsp/grub/files/cfg
@@ -1,2 +1,2 @@
-search.file ($cmdpath)/EFI/BOOT/grub.cfg root
+search --file --set=root --hint-efi=$cmdpath /EFI/BOOT/grub.cfg
 set prefix=($root)/EFI/BOOT
-- 
2.39.4


