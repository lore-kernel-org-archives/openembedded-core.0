Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 237DCCD3447
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 05:31:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6876.1778304659725669332
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 22:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bBL7ZoOl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=95895a8adf=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 649508mO224342
	for <openembedded-core@lists.openembedded.org>; Sat, 9 May 2026 05:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Pp8iOQv0LADiY0YAfjJPCoPpYUwdU0ZKEDnDK+iBFjA=; b=
	bBL7ZoOlzKcZGW0v20sr3bsPjIrJVXStUrwC7TSVIW024mYzlYBEWWdC/eJUqUED
	9OsR2xGWcL/vHjVYS8Rb4zN1kBBViUl88scjVnnIznLuk+HGPDWjxqG54RMYv7kZ
	8k8g4MLmEYAmX8PqHQv2oiZKZHU4nyCmo5foDfLPQvib8h+Gga3Yrr/Rxl9YNji7
	P3YPMrAgK3h2L/JzBRRzrqZUzWRIIEpqzb1eXGnh7uigZ3lLFPqtCsk4fTcBOSB1
	YrNZTmbnPrxAVw+za3TTvZwhLwpFAnuRk3ls+J5OUx0bsCEyIQH2J3HevyELSaNT
	WkBIAp7+uyaX660UMiOdRA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011027.outbound.protection.outlook.com [52.101.52.27])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e1t5006fh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 09 May 2026 05:30:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWnHaJZE0B55l61U0QPI5xnY/wYtA/EBhNY+XmpJz04U4PsotwA06v2zH0pAOr4NNBWeCcdetkuXBUHDdCcv6p5F1aVERHT7LD2fcLDZnewAPWJ2ZPQk1OCuCqILprf562CBOKOrqn2OSxwr0D2NpYKXjVhcBPPsiSrtsfZN/WtkTYErLTFNBK3fKFnJ67moKRCKGayDzAzovFbZG+oJf3KqmR0ww0nBESpOqoyh4tmbGbbXkSkFXgI5WWlg5/S/PHEJbhUYqL7OEwYi5C6+5hEnebbCYHK0cXBqGIACag0jutOwL8ORkO86BzkQJYN7ygA24uvrUeUpIq0iVNx1gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pp8iOQv0LADiY0YAfjJPCoPpYUwdU0ZKEDnDK+iBFjA=;
 b=aa3UQ+1WYT6JWxvwO4nH5EZ7wisDOX5FgzKcyDecVgFDIoqAG8xzzVLzSj1RR3DldhkErrVk7bDtYgME6uX6mmXXojJ8scVOPp+wLvNgg3Ihs42yLGgDCNoKQ1Rh+WC71ixgtCZk4A67BrARZyMSaRmGpDLq5EL0ArxPbsKPR4gc1KTB6BZybZ370ox0J5vZuQK/eeXZCgC5dTDri0riK1queo/A8wx5W1Q8/ESdehKb74KurkSgD3ll2DdYIH9IsoBeW1n0jKSqoEOnxAHXi4N6eBsaQy+vMggR/a6wC/Kab3MCJ14eu1rjuVN2saDvMLaIrBUKfw8jp3DbgnOeWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB8657.namprd11.prod.outlook.com (2603:10b6:610:1ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Sat, 9 May
 2026 05:30:56 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9891.019; Sat, 9 May 2026
 05:30:56 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V3 4/6] systemd: inherit upstream-stable-release-point
Date: Sat,  9 May 2026 13:30:31 +0800
Message-Id: <20260509053033.1565462-4-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260509053033.1565462-1-Qi.Chen@windriver.com>
References: <20260509053033.1565462-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0281.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: e93ae8d2-cd8a-4f9c-dc19-08dead8c2502
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|56012099003|18002099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	+4xYkAQ3PcP/k2x7f3V4uKCOatGEgxKtHO5n4cn0Pn9/Yl9OWGpZwKXjx4xy2ALNpWYAqCHRknFFfyoqBU2in9RBEjGRY2i1+SiVESWiK800TgwzL7qTXzSGppSFF4Q02R4VO+B1i6jdgMw2S4gvTQsUUXncfMA/KVbfvloAQZJNCZylpr5dxB28wWnnbkV9rG5FvHpZcq598b4leLDv884ef291mkXH2ohpvBsj05I6M9xTAusWZfMF0xRnwAe67YyOOu7JqO0DX4E5B4ukZJRlnMhHp6+3Gtl1B0u3pXQ+Gqw4K9kZT7oQ1QNh9p/WAxo7LZM2gpWci4Mw1xcJdQ5Gw82Mk39Eaf+OVR/76MtxP8Gm9vu55xkffoOahN0FMn+mteIZTbaMboYDq0XGj3CteZLQCeWpCSZ2LfKa3Te40vG8CwEntPkkwHOrAwv9jkJ4PyTnWlTt3AVA8iRTvwgRfw3IklvJ/OlIAwOA5Ka/Qp/Pb9loriCapIshPRX2N3yeuHF9Jjw9VAWokqXS7ygSq4nPGLGeloyLNfJVLVIPEocfRzrk6vP7FU69lnt2X4+EkZrmIbiVfGYoqjQ5WG3P5Dz1ycGJymYwykS3PkSqCPslyAy0wop+aS2Il19e1yWNR02Fp7KS0v9Zo6y6321Xu0ueYfnDlMaK5AFZ3QejRJFJGT38QgZFqclh1mpKZD8pY9d1L2as8yb7Y1nmnk5TEW6zqB2GCuZWYosWpsuSbdTOsovOo0nABFoRxBlq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(56012099003)(18002099003)(22082099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UTGGY/BQtExGfzzBRpo6tpw6iWdg9JDURMUneMxqDwjg2ATbcdQ7z3gu3UPB?=
 =?us-ascii?Q?+VEw3nmPDCKlGPNda1LqRV5+nFxCaN8OIpKHa6C0R/TX+UvhSyHuvPtVBVXv?=
 =?us-ascii?Q?uktGhIPco+pxKLRmgNOUwoyuTOx7PMTVkl6IPwOB61hPw65v7XUilgING920?=
 =?us-ascii?Q?S+CeSo/R5a0O4zL8FKxKRxKp01PevypyO2SYlIZekk+Brd9LNL1I7dPqrknN?=
 =?us-ascii?Q?PihD92ZykpZ4kfxxUK7RbtAPBJZBwsDFlcyd3ODmZtO0rLQKkvJeQ2nTW3Lz?=
 =?us-ascii?Q?80NOTqUJHxNH3q9ozuMwi1+zih+/fmWUE+TUCRuYfqrZLBJL5pm2UzbjTyn3?=
 =?us-ascii?Q?fQi4zgMt+MdF371nclqPiVnw2w1acl8FSMLxWpEEUHYIImywWpdMs6eNvrm8?=
 =?us-ascii?Q?xpea56YPVmGEk5yOn1myXQlK3tiMGZ+SsfKnBLjLinAGiJV+cHcS+5DmXK2l?=
 =?us-ascii?Q?PH85dg+jMpoNzIevgluFVEOLMBf5GlupKO90RZsFzwug43HKqHLdy6NlZ0e/?=
 =?us-ascii?Q?IWxMupVuxcMNfsCPOPQGXk657ElL6hifFMmSasTEUoX2KKdyEa4M+wBSw3ke?=
 =?us-ascii?Q?Htu9w0cTYmSNvGc6PqRGbLMyvyVRt/uhCe0VlXorQytVu5459++8HzNFaT/x?=
 =?us-ascii?Q?QByvq46FCzp4YRZ4NsSuzL2z96yR8hD0MeqOV4w53EryOYxaZ5ZVX0bfJ5Yq?=
 =?us-ascii?Q?go9LxPPhrNCBxtxhKZFZ1MCjuxV+ePvSpa3kxt9Xoks5alxZmbuO5OohbbrM?=
 =?us-ascii?Q?nkYAKm72OyRoIsPywtRMDZ+Lbssgz3SFptdttAZ1Ok6NIVSgwt6pjf4GVYws?=
 =?us-ascii?Q?vl4t8bU4v4rm1b7901EO5yLoiq0E5zBoc/JVIuAMspEIRvrMrXEiwdgyvjN+?=
 =?us-ascii?Q?Q0WG1TcZzS/6Z16vtuQok1ZvtDD1ofIEW67IGr93IJsxriHMVC4s3G92J9uz?=
 =?us-ascii?Q?Cv2ZUMHCusctZ7KkTnlxFrpYpanBtSaDK+zojswBqTRdYvjqfb4RWrSBT5pZ?=
 =?us-ascii?Q?DVSbs7/+5wDLSnAA7q0j4Aet0byB/seoVwYS8V3HZ2Pet7FS/0LTRCEgjVKS?=
 =?us-ascii?Q?TjDdozDgGANN7TAtC+AYMbuBkwZ9oxqi2044ZuP8xSuX3pJ2odHtROiT7IMQ?=
 =?us-ascii?Q?/E8Fn1+cwyJ8+v45WzjkvMsQDOJQe0qEEm/P2TbTI9uBQQ4boF0cBsmBNFxb?=
 =?us-ascii?Q?84epZ2K9Sd49Q9u8xmxXceMxRCtgJNxJQix5E9jrS0yUJL2O210MzcHrCvmR?=
 =?us-ascii?Q?LoXnTdCrkbgumBUaPVn2k/kqRfkCMC0FZVGbGb/FaaoY3fX5z/mPBfKkbmRW?=
 =?us-ascii?Q?6AUNNkf17Rb4qGXDtPhc8VEPTmBS0FmrT3n+zyHC+LImzcYkOXyTduVsoQi9?=
 =?us-ascii?Q?/qxPXYdi1E1oWP+aOtRN8ohLiO32fdOBWZUA/CGch6f6d/HtWTUnbde+sNP+?=
 =?us-ascii?Q?L7FWXUzvqkuhBUaFlM0Kzlm6Hxzwm5/Zgy6Hjs2A2CsNYjiPrXnSwG3Fjt6K?=
 =?us-ascii?Q?PshpU/W/Qi0VWMjRqMC+8Svh4fG6l5PMLXPbzpuHl97eBNumF1pCVTeNb33d?=
 =?us-ascii?Q?F4oHVYDSYyvRGneb4ymXIXILInKEutUYzOPbuj/PtkJ4O0e+dU3p8Oj7UiiS?=
 =?us-ascii?Q?D9ZYCW7DkorKR/IOlDtSgkMBdxwYfRYoIFYdSumFf3q2H00xQHNKabsuPMYW?=
 =?us-ascii?Q?x6C/w74A1RPGJKtw+2w5bZa5DRfOhkxafT/DceRV5NsQZ/s30sWtKMs5jcCi?=
 =?us-ascii?Q?mDf51S8qlw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	t1h5YMvnbGec4bvoF/b6Pt3hmti3yrdBagimPs8V+OVDCOJtKQww4xdobGORvvsq8Sqzig3RNgsT0VVs6utQhmU3AEoiLOQ1STs5o6AHtO4ki3f4RU1vjUZHYGBXIOjAKzu1xdrYUSNPzp/Po6SR+IqrKw0cC52neC8hA5LJ6VvLEG3RQV0WMoVCScMmCIIuurV2N6nN7a6gX8+9c6nSn2eGWIIATqGdbJCOf7OsnwzYfrkkG3uHcDaOqKIWGYDcBQ3pQnWDPmZ3Gk7CwcJCe/vyMuWkVK+qsz0qCN/LScM+r69MXtJ1EyyjqrTwcnBrBnTxEGc7jPwmrI42sCe7kA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e93ae8d2-cd8a-4f9c-dc19-08dead8c2502
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 05:30:56.3792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /R5awH90cn04g5uSbztwtezTooVj8Azn+MA/SkgvJEpL6pSOEo8NuPuP4BwvsAjTT56cQXqnGLSQr9coRtggmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8657
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: hX6bK6pRh9NPs4qPAp81gg2MuBQQX_lo
X-Authority-Analysis: v=2.4 cv=C9fZDwP+ c=1 sm=1 tr=0 ts=69fec692 cx=c_pps
 a=uKk6FyUS+xKIvFCPM6xM7A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=TIlOCVwuG6zFfn-mFGAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: xHe2zpPxN65yUORf-WBg9KsLkgRf_YWD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDA1NCBTYWx0ZWRfXxXi26PpEnF7w
 gba/e87by9BGeRcXskdsqBnBieF+WzadMDNCLZFpq7mgi1er7j5IhGHI5Z5JzGhwPwT6xScB7Gj
 90JRIsYFncI80MqsdbiX2kbbi/BzRJi4MUFgjQEC9c1vbzI02nvSDm2O+OBvYRycgCPwxMD6nn3
 EtmdKOPdhU2kQSLIzTVDZXowtXgb3QXeA2Ct/Ih41GmieTscrs2aYQmAIey5HBFox8vcSzQ1VB4
 4mKLeKIPQI5tzPHPxiGGRXR5YYzEFawuwTMnygurqqlspowMm+TB/WcVBQZilANdXgPMPXLsQma
 Y7nvAFyX9hPTrT7GjUEkKWI6f1rqeWd6ZovQoAhNXWlpFdN2kADeyOnAqarYGOUn3PorrkU0XtW
 Bi0/fZRr6aC0zsE4ZC+dCfoVksyoXF+oxTi0ceujC9oQ6GWkI9sVUTaZ56r+eEWuFd6h5CR9YFI
 nn0e9uC+HTRtZJqoB5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 May 2026 05:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236757

From: Chen Qi <Qi.Chen@windriver.com>

The last version part bump for vte is a stable upgrade.

* Evidence

  Its repo[1] has remote branches like:
    origin/v256-stable
    origin/v257-stable
    origin/v258-stable
    origin/v259-stable
    origin/v260-stable

[1] https://github.com/systemd/systemd.git

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index f107c4c5da..6b3989058b 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -19,6 +19,8 @@ SRCREV = "b3d8fc43e9cb531d958c17ef2cd93b374bc14e8a"
 SRCBRANCH = "v259-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV}"
 
+inherit upstream-stable-release-point
+
 CVE_PRODUCT = "systemd"
 
 CVE_STATUS[CVE-2019-3815] = "not-applicable-platform: only applied to RHEL"
-- 
2.34.1


