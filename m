Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B46DC5DF79
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 23:11:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19642.1786921885870294606
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 16:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XxBKjIUM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=26887e2f0c=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GMj7dc1220160
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 23:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ChkSXHBN90OlHgTVmPukZEsj2cKzcbqwXqvI6ioPI3s=; b=
	XxBKjIUMy4jHUXbhpTtdWkEUICGx5PBRaAQDL10WEBR6pzASmZzRQ/Uwf7exMqip
	8l5Y5Ze1losIskOLdyeRlhBGkF5ZJF8d1qef0KwJ/UPBIWo3ic5SVq7vwsq60Q+t
	ZjSeXDj3R3IV7CGL8AVWRThP8Qtnu+zfy6KZlWxW8uv++sxVEi8BFzlskLLXc3SZ
	92D/dWcbMRzYG1ZxXlxEeqwRo7d2oPReOkNVTRrwS2wvPtCrddz6FewuIBb3jaqs
	f2zZhZkXpQrOfhPZoAeFdlSjC3R3RqRj2Y/MuiGmnX/0PKXtSRv85xwqckNvjZhM
	gdjHtNpV5j8U6bT27dJFLg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023135.outbound.protection.outlook.com [40.107.201.135])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g2eeb9t4s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 16 Aug 2026 23:11:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xeJ9CGJtu3cCSVl0E3w+l90rII/QeS+M+5M+1LstSWyCPHyyBoKyvy7mU8ohSxO7asfyxEwbdQAeolynnHnadSZoKgsmPwQIedrZvhPUvAu6jTF/KWkXkIVhhAwxlx3ltnSkwVSAbdTcReWMrlhEdYE+n4vQikuWCwH6/0upJInPm1t5rQ1AEEc37sC44RG7As9kK9fK0wqDiY/aztJUN6nVI8cYxtuvBV5XEn4vl7ClASC0JcBJfFoZszq3w0kPxdKTdjmD4aiKzAEQIa1UPVYSGvEOTKFYErfGduLnykmsnXgklbhEEAk6yotkdav2biURS/p2ulzqJcryQN1EJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ChkSXHBN90OlHgTVmPukZEsj2cKzcbqwXqvI6ioPI3s=;
 b=SG0j3xYaudAW7FeJe0mEyVfTZt43CFtyCptv5B/EyHEEE7hulANjCGIFtKwTjx2fiV5GK3a36ANVRzBwXgnQoOQCoPdGbq+S/pBUR6JFfPcJrvl3fTenKdrG1p4EzuTwgITSdDDgxV0v2ZoM7RzF4+ihmCRiOeC12i2bHfAhM1yCPJjqw/AIIHXarWuUol0Aatsx5ux1+mUI/NyvAFvKqKTNEBqjBs2frSmrMPkUvP/xfjjKatCpR4erigRgLAaAQO3MCpcm0YaPZWcz1lmo3pH9IL3pVIFOyt8sasV1QGnc4lLZdMEZiAQQsLTMDizq8QcsBFwYa+8MB8ihUaIIJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by IA3PR11MB9158.namprd11.prod.outlook.com (2603:10b6:208:57d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Sun, 16 Aug
 2026 23:11:22 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0315.014; Sun, 16 Aug 2026
 23:11:22 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v15 03/12] lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or musl
Date: Sun, 16 Aug 2026 16:10:55 -0700
Message-ID: <20260816231104.3871015-4-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
References: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|IA3PR11MB9158:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b188bf4-e7a1-4cad-e248-08defbebaff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|23010399003|1800799024|376014|366016|38350700014|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Vj19w7TguEqB/aEpNNTxi9DfJBx5qnTOb308Lxu0qdGTMl2IV0TPThEU4OyEQKmxq8E9DLwRkEt1Xz9sql0uO9DuXniHs/39ipyPeCfouDQIqRHkNlBGX9WIuMF1WBFd8SDl3mU3JHdrO1faKswqOFm3NmMWjmyFh9g1SCLKpGoZRzLnSZuH4lEV3qC4Fa0JAedQy1O68834VU/JWwZFDIEjcC365ifHEIvjaTozpd30NzsJAw68X4DN4QX5jeMFLIiq9nSQ4HzNwVqY0YsQ9kJC1djblAci490ofiBYJiyW1iKCswFXMTfMeAi5JaHSrAgU2CJK/PMUmIvsb2SUF550nrjOzybobfOha0vVikrsg95svhZBhLnMqbaT4V15KdSXW4b5PcIlQt7QFZ2QhehbZAzY73vbwe6swad5E4HdCrOMQiDSzBjkldCod3ODEm1YrwKU2jOBx0tWMeP0hHQxzzSS8P6VGjl9p15F46om+hsSK0WGq5iPaPR09p5o4X5Jyc522ae8qfFj4BUiKnrKA+c9EITsDXTypNgyg1PqdgBhU04yobOVwSK2b+iNpGLFyYlO0mXXhG8vXFs8utAiQdHu8TNABLjxVwUT9dFg7fbfawFEqJfMdUZs78MIMaJ2WAXYulXpP4tX7z1FOerUGEiE55sjzLWCfKRXS9VVwXkfSwquHCpaeUwbzQOvRfARQ8SH1brS7pHCysniLlO6pFZSUJj8Mr0pDzoFe3Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(1800799024)(376014)(366016)(38350700014)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xqE6KsI8gXk9fDc1jTioANCm2wpqLjaks9lZLbWTQiiJRUY81ry8lA+CGHQh?=
 =?us-ascii?Q?oRxm12QZ6A4AvURMomZMjh9I5ZoLo/2XSoK2Ebql0FU59NRyvYzgxTfww0Am?=
 =?us-ascii?Q?jFS82oZGECM0WckUljYRO5Q/ym5VpdCtBY4EAhJpP2KxQGbM1fV6m3Sw+tZr?=
 =?us-ascii?Q?/nLphJQ5cjQaurzamGO/GhMAY+BA4D6VRNrrmwSgBT7WQMcYqkrJM978hED6?=
 =?us-ascii?Q?tjSMFhs961ImyH3aSWiVhr0MTIAYdF67VqfacakjCpD0t5UZKn1nwzMmnFph?=
 =?us-ascii?Q?34Vf79b9pP8TUbeHyuBAAOnJAXMyVuWetQZFuExQC2wNtA74xmEVjHFaaarJ?=
 =?us-ascii?Q?r3Yb7BOgTLYPHBfkPLSU5bRJU4Ugo/CMum8Bpa6hAKxzPzRmgQ4Dql3gDN/o?=
 =?us-ascii?Q?Oxh3W3zrEb+U+FL4odT6lL3AZsxmGYLs2MhVIRV1gUAB4IY3wJ7vVzxQ4lcr?=
 =?us-ascii?Q?ucpEiTlXu9+lTphifiwTIHxj4b7Fqv20OTr5rl9BEjgEUF0vAZoAkhftYQXn?=
 =?us-ascii?Q?BGgqAYEh8dMLheOz+zRtmIxsiOsOdP1eLDzlPdh7PnUC9/3FpMnhy+zAjF6q?=
 =?us-ascii?Q?wXk0mHl+X9/6vwwijrdBtXBxQfrOZe22O7A/YrkE+9Qp/EeoBt8Vle8W3FAK?=
 =?us-ascii?Q?UxKtNo4HFwr4rbNQeNox5CsFX322UA+XYxxd03cuFsA6eJKORVKPHJMMOHth?=
 =?us-ascii?Q?eJ2dfhODzv94GXezNkEQ+G2fxtiXY+/jJ8luCnb1vZSuFGgfpjP4+saRIsGi?=
 =?us-ascii?Q?HStAVZ7NEmlOqiJz/TE8/nH8t8TSQsL/n0GERshE97Eu1A+5JqjN+JtnivqN?=
 =?us-ascii?Q?9NSBLEfLGxTZLMR58r7Zeenjb360/mULzPmatpOEGVYH6o47gm3Xtbal6hdw?=
 =?us-ascii?Q?pNloMZHy4FIHSElsIabc9KZ+lmyLahhDapJMzuLfbF9GypqLy+MxPJzFgCB0?=
 =?us-ascii?Q?X2KxnO3OWchHaZXbqdXCa2fYiO+pTOiaFREsbzh9qI7JNQJJJRaFfye2Y5Q5?=
 =?us-ascii?Q?7FXzPK8yNHM9yi7F+3FkWycW9d7PFVHKluF+hnE6qV4OLrtN2VR1SzbmtlC3?=
 =?us-ascii?Q?J1Y1V/Sj95Ddsu7MGIrRbFD01GdJMGBqOitBlb4nAmp+twznsdIpdsKztPwV?=
 =?us-ascii?Q?9kln9ZDELgNfpYv4O9HDwp3O86WJmRYJjh0T5xMymcSkmSG/Mx05qngTpFrO?=
 =?us-ascii?Q?Vs8Lhix7xcZU3hpeFdrrAo5rOIGyUCbPh8do2Rs/4eqRhhZFaeAbHKIaQclu?=
 =?us-ascii?Q?Y6m9Kz9nJgk6z2gN1RVhPayAkM+yuKPkgzhOgxRk11zWWbAkGUXoyvqXgctb?=
 =?us-ascii?Q?7nbWykDuYRPfUWnhtNSaDdM3es5pQj3AAaaAEamwkV2R+kLBPcHR7O7+4lAt?=
 =?us-ascii?Q?9gXE2F7UoVoomhSKoONq47qYZtJcwXcy001WKYr7Yg6LS+KF6RUaCyrFHCJV?=
 =?us-ascii?Q?E4A1Bo07OpBGzSLrDaHa17d7TvmBzrlsMaikL9XyFxHvCKowJ34WP1HJlFh3?=
 =?us-ascii?Q?E3lwhCxmekCe6HOcVBMpaJrPpUnYwcKcn/ig0Jw9HI6CBmoWFyYDWQBl1W3F?=
 =?us-ascii?Q?rLeaDpXm1oIktxz5SnX8LyKP/1i/wj4qKu7jGTTPLG+ErpVN4l5v5wGRNeai?=
 =?us-ascii?Q?X772+hYRM1hK6YVara6L2YVsR+I2BEMGYTfU0roc3PC+s7GduIBpCjTFscZo?=
 =?us-ascii?Q?JSpTLuJAQojYgVqodwIjesyBexP9ZjXtp5pGYx8XjjCrju4eVNevhyaweW+z?=
 =?us-ascii?Q?/ZWlls5pM5U6Tj53pc3I+gVuoof8XmY=3D?=
X-Exchange-RoutingPolicyChecked: 
	TOGW5xMpQvnawojFW2PIMSutwpVKVcf6a4i5Ffso0mxMn3pagysOOM8uvH6MVHxhCwHLrjRLTo5tJe1AqLLe6BlOUGC+mR3V2PBQoggY1PwDe0c7s4uwHrFJW6gp3VgMiST+FYZR3xDRnc0jDJx8DKNPXeXnuBWaYPG+q4s6WKY4cihwOXIaic+1kXyqXR0IPiZVowkN6Ebv2Zl1KSI2DLXQaoFRImYo56K/y7NtNfN+Yg2PzDmTkPfHtMExhxRKM4IJwXoJ9vKAz6xV37HG6BxceEKLTVckpGqk5AjDJcRI6K1kasmuN/xgeTgnzjJFKa0CwYC1ouLM41tjtLhuSw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b188bf4-e7a1-4cad-e248-08defbebaff3
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2026 23:11:22.2527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FILd96ugmYHLjBrpIdKlZdKgD7asjGclEEkb9T41iOBbTOOx5umQugr7XfWwiqMMr3xhqk2WApjUxSyHio1m04PcffKmNfhYRRAOZMBLKQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9158
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: lBvgOMGk4fXC4DbbJiz6u39TN5FGg2FZ
X-Authority-Analysis: v=2.4 cv=DLy/JSNb c=1 sm=1 tr=0 ts=6a82439c cx=c_pps
 a=TbD1l2oU6eC219p4blkGNg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=YcdC0ctDMGJcGoIPl8kA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDE4OCBTYWx0ZWRfX3y0G0JoqOCns
 C6fA32TzNgZA6zynRT8uq460Cqy+zw49EFAMZRHXjNIpZCzCKN1QsEG2trzVTlYpv4dIqGLCb2Y
 7tkWTYvUZMPt/1vl+VKCPZi8isOy89h57ac1unnd5VRIuC00vmAOo+liTAQbcEaF6WmX85Dkr+H
 GKyVKBJ7PqD7QTB2BCSNgteTp9BOFVuNwLY8cvYJC50HFxAih1UAqxC90SkIHrmJU9F/YBTr4aF
 3URUI8YuT8+tUGL4UAQ6bySUDoG7/24wrUpaFOAnPLKkgMiS5BiVnNR4EwLAMnFRrhLmjfaVmsw
 dwEnawxLNqb3Bz0V5vno/a3oAJIZXBJV/nJStxdP7ClH9htlDm1UYYhIfFRtuvv6dwtcoDikPx9
 iZfFpr2zwcU5vdidU/wL7CznAOfskq9M81Em8fctOs7qABqjlsApgu1qQcYWngwp/Q9/fac21cH
 1gNUhiMCesp7palu5Sw==
X-Proofpoint-ORIG-GUID: 5cBlT4tRuC42lnGVSBAl7AVZ4NrEwdLD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDE4OCBTYWx0ZWRfX+tC2VHa6OdVR
 Tvhl8ZvEIEqpcnsWOfwgS6BTfCgQDmNgS7uhHjxrD7cJFwEgCvHRFoI+JfCpiSXQo2aYeGruaOc
 /aCv7+bS+xVdDXv/NNW83Fr0w5q3bP2gG3O4zLwxQpC9nlRjwunD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608160188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 23:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243569

Fixed:
$ bitbake core-image-full-cmdline:do_testimage
%post(busybox-1.38.0-r0.x86_64_v3): execv(/bin/sh) pid 679
error: failed to exec scriptlet interpreter /bin/sh: No such file or directory

It is because busybox and libc6 depends on each other, busybox' elf files
depends on libc6, and libc6's postin depends on busybox' /bin/sh, the do_rootfs
works well is because dnf-native has set RPM_NO_CHROOT_FOR_SCRIPTS=1, but it
would be failed without it.

In rpm 4.20.1, it let the installed files' Requires win, so it installed
busybox firstly, but in rpm 6.0.1, it let the postin's Requires win since
postin would run immediately after the files are installed, this does make
sense, so it installed busybox (which provides /bin/sh required by libc6'
postin) firstly, then we got the errors. I couldn't find which commit made this
change because a lot of files and functions are refactored during 4.20.1 and
6.0.0 (not .1), I also tried bisect, but failed because a lot of do_patch or
do_configure/do_compile failures for each build.

For libc6's the postin is:

  #!/bin/sh
  if [ x"$D" = "x" ]; then
      if [ -x /sbin/ldconfig ]; then /sbin/ldconfig ; fi
  fi

This doesn't make sense for libc6 since there is no /bin/sh or ldconfig when
libc6 is not ready yet, so just not add ldconfig_postinst_fragment for glibc
to fix the problem.

And also remove the workarounds in oeqa/runtime/cases/dnf.py, they are not
needed any more since the loop dependency is fixed.

Similar to musl.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package.py                    | 3 ++-
 meta/recipes-core/glibc/glibc-package.inc | 5 +++++
 meta/recipes-core/musl/musl_git.bb        | 4 ++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index d047e41a78..8ccd89a190 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1853,7 +1853,8 @@ def process_shlibs(pkgfiles, d):
                     if s[0] not in shlib_provider:
                         shlib_provider[s[0]] = {}
                     shlib_provider[s[0]][s[1]] = (pkg, pkgver)
-        if needs_ldconfig:
+        if needs_ldconfig and \
+                not bb.utils.to_boolean(d.getVar('SKIP_LDCONFIG_POSTINST_FRAGMENT:%s' % pkg)):
             bb.debug(1, 'adding ldconfig call to postinst for %s' % pkg)
             postinst = d.getVar('pkg_postinst:%s' % pkg)
             if not postinst:
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 3d721d8f69..bea841b047 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -298,6 +298,11 @@ pkg_postinst:nscd () {
 		fi
 	fi
 }
+
+# Avoid loop dependencies between /bin/sh and libc.so.6
+SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} = "1"
+do_package[vardeps] += "SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN}"
+
 CONFFILES:nscd = "${sysconfdir}/nscd.conf"
 
 SYSTEMD_PACKAGES = "nscd"
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 3aec643c40..057113bf16 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -80,4 +80,8 @@ LEAD_SONAME = "libc.so"
 INSANE_SKIP:${PN}-dev = "staticdev"
 INSANE_SKIP:${PN} = "libdir"
 
+# Avoid loop dependencies between /bin/sh and libc.so
+SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} = "1"
+do_package[vardeps] += "SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN}"
+
 UPSTREAM_CHECK_COMMITS = "1"

