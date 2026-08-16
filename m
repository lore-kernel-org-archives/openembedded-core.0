Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E40C5DF66
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 23:11:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19647.1786921890636510263
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 16:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Q7WiIIw4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=26887e2f0c=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GMA3wv1160221
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 23:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=35Qxh84yHI+1o9HDeg824GHThz4SBZwBX8hBqd49wyc=; b=
	Q7WiIIw4fQ74MmnviPS+8fC1eufe10exgvoevomijiEgTP5Yaad3qVU4gcF24RXg
	vyb63mZLazVtbmAFsVNcU+cQKP9SoarxmtxlpCzKUw3ABDtCSiMNFFY9LVFG773w
	Q9yhc+j/GBWCAW9q9+QWyXZSaNNDC0lWBc4/r0KS0cPNq3Wj9TmA+1sKw8wsqlIi
	o1ph49L3l8AL+J7i+45T1KSsDqR/Soyi2ELemf41SWPvV9xoQHzRhNVpO2tDO3Vw
	RbdW11GkNETBEBhVRIYFfLi/rmMBoXwNk5BkM1MNCSXyEugMQa97cpTdLQs6eOhW
	hq01Y5tuHlndMGkGQh6Uig==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023094.outbound.protection.outlook.com [40.107.201.94])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g2eeb9t4w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 16 Aug 2026 23:11:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+yCMfGNKQKL/eW7Wu4Hm4pca4D4P2owTa9ktikwyLbCPwyLzt8ZB05Zwk/Vww4MDL/iDd0ntKBBVCEKnsHkChVIL0gSsIzZTbXu678MGSlnv+zmNt5XTkDTcMg73IR/Bzm8D+UInhimj7+78kbEjgBz4XDNnLlI3+piVvRD0qEtK9HvD3WLEYXG+09TTRvIWHuV1rQ6mh5Np07BScdYk1LK/sgZyM+VAoUgbN/CFDQzxwrLkm1tW4Cd/Tqee6EzbQxrHF4Jm4cy2pSRM6YFxzsxKr0Q+Licu5dr4xtrKhVEpBeogTnD1aJq1BEUyFCbE6dxziJmL9XO2t2U1HpNtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35Qxh84yHI+1o9HDeg824GHThz4SBZwBX8hBqd49wyc=;
 b=v7oZ+OhclTvvS1enm5PhLR0ysWlcmpNjO538JjGwIPl0eWmDH8CPmNmwa51fLmdAMcXHjX5aGdBPOF78/q56FgGBVyB7FI2RiL411dAuFwoxQvHbyzz/cOsjcfdsdOmL0uOXyGXXSif1Bcuet22bUYsOtybWitpN6CebJLvT7gSGGWFVDrVAU009l7fpjThGEGxXd92yI/Vuz3CbFCS9X837Iwh6k/2ps6sZSUXkkFG2/OA/Fh4QkaFzLeYyiAEWC2bdQCcNlTI4cyPdPIJV8gZ36pqI9YWUnB/ICFFUhdznuBBYX+W1LO7WGvHGpoOf5TMuSGyJMBofBNmtUqA3tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by IA3PR11MB9158.namprd11.prod.outlook.com (2603:10b6:208:57d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Sun, 16 Aug
 2026 23:11:27 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0315.014; Sun, 16 Aug 2026
 23:11:27 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v15 08/12] rpm: Fix pkgconfig() Provides missing in cross-built RPMs
Date: Sun, 16 Aug 2026 16:11:00 -0700
Message-ID: <20260816231104.3871015-9-sumanth.gavini@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: c232f1cf-edaa-4633-b412-08defbebb2e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|23010399003|1800799024|376014|366016|38350700014|6133799003|10067099003|11063799006|5023799004|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	fV22j7gQMT8OsckTo7RThYlj8a+o8F3uAVus8Q2x/M+4BcDYJJ08rSlB/ib0iehGcdRhIwkOk4Z49z5vYkIqZfIZJgARs7bC+I1A5Il75xczHr1pAQtVCZlj3ycJEn8nNHKcuLxil72M5VXJweg3UkDNQqkSDsFpJjD8qeOtLTRsiNN/OTP+O7Gd7cvbNP2dme/fgbHugjdN7hm26014YkFdMsg2M2RNktZAGOG1p/obX68ViuMqDz8WzNP7nJ826LgJLdjk34RDUQiICnseSZzx95mOK/nbRqrv4ZMMlD9rTT4dEgFP5WMu6XVJR3uyWsh7mqvfWOoHe9Ll0Lf3OjpbcSgeYwcWBmdtCPavxWy5itZcO1GsNqcXV8lvsh/7dqOSFQzC5rzMqq51xiIP9demzllrvLA7ZYj392v5Doa5R//C9ksRCDa73JqPtgGoPY9GS3IRG0Ml5paHFBglznjUuYsM6JhX1TtdDH1Cf3ZakbbURt+hjgzwp37zh7+A1sySmMnhJJ6pzxvR4D7cnSvmE839GxcZyWOOjh4Tk0F5ZyJcz2UjO/ens9xGlu05hrULCMR4g5xn+/rWy8cBtrnObD6yrCzCpyK40JuWzMakIiN4lrBFudTg33uxPGlq6DrgW6C+lPIasYwoOsphK7KbMW+HbRj+09eqLR7+14P6xySVocDI4x7qgJNfija7aYyCe04mFuN7MvWY2hXx6M1oAXuBwwHXLN/fsE2iRlk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(1800799024)(376014)(366016)(38350700014)(6133799003)(10067099003)(11063799006)(5023799004)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3HFxYiUHoBvbtQXTLBX0KL4GbvlW6d9ctzgrd8zMjRICqdVYj+13OIZOwZm1?=
 =?us-ascii?Q?lX++8DPu9o2VEgnlL5zODnE7l5n5HeIxEt/O46ubsPlSy1L5fi8wPVuLsWQv?=
 =?us-ascii?Q?QazID6j14zoz0vEtiI0OkY2fxX46w6Ey+0nWHGcRtaP+wLPde5tIgq4YNRl/?=
 =?us-ascii?Q?ErmYOblSMUsSSf/46WcZZjQNgOVwpSPsinv+etla0zSrU42EsrrBpikOfJM4?=
 =?us-ascii?Q?A4hbTeSGst+w5QNOAeZbrObVHQsDL+6OyAn5sUaPTCCc7OajU9GFpqz7SRMS?=
 =?us-ascii?Q?weQRjniyWk4cbTt6Nw0vT+a6KvCsSxkS+KaUP/EiaGsGfRikuqpY4lgiWWWR?=
 =?us-ascii?Q?YJRGomPVMVCSJ244WroG2HHJUMxMjASVEHHK0qgjvvaGrk+XDZg19JH7tnq8?=
 =?us-ascii?Q?vw7c9QSNv/0gf9371ojrMYFcbEL4sF+jIDZDS/1f2cP7dD3dPLXeJ+8R5n0K?=
 =?us-ascii?Q?FzJZTeWjMtJsZczClrN0/l5dHK40HRA71JVFJO3cFTxB+1lGHrp7b/h/Gbbw?=
 =?us-ascii?Q?Td0N5niw1APV/uVtG696xQf/a0bdvCkw304EtYC+b3L3SwTwB6UlVaugmiSH?=
 =?us-ascii?Q?QXbUF9ZmIgmbmOb9OyNb9cpUb2uPTdB/Z1hFHb0G4yngkj363oo4ZwkRn/Ja?=
 =?us-ascii?Q?qev1zpj1HIhxzi3Am0MKmLIRp/W1tyTjbTxVbJa9SCRFr6odqFBNqah92bu9?=
 =?us-ascii?Q?Jkg7YpHJagzw4HebL54DqBOYoX3DA1RjW4sYmI77NtRt27XhUKzlvXayU8UL?=
 =?us-ascii?Q?qOGz7+Elyszz39Hws7zua9NBHdhI+dVTFY/a57bcX0HmI2RrC+v3P0yQjp2R?=
 =?us-ascii?Q?WCPbuLR01STQxXa3k2v4GnM0j0UULO3KOOxKKA6wMn0My0jxQtE53WYvopBD?=
 =?us-ascii?Q?a3qepqvubKHx+Lr/8glPJI3pZT3t2q6wbdeJCXbSgqtIGBoMabagNCyPmzek?=
 =?us-ascii?Q?yn7dV69QqEwIorpLVGpGriK3lwV2QzP5sMbBlvpVoP+EyWQYJUmEXxN+Ujcc?=
 =?us-ascii?Q?JR15Ebq4e+YoHk4tcFVNdDQBahKxl96BLevsHZZQ0sok2KMsgyZTal/YAsx3?=
 =?us-ascii?Q?0nJ/nUw5oTC8La5IW8jIXhBWjX87MdW7rClYG6gWAeTLkvvVyJMCzs/VZVIY?=
 =?us-ascii?Q?UKiYJfacR7AEQF1SQ7Vv6CTuh9zSeTJ2tvSOfjGBFwle7KFQM8LmqNmJhyw5?=
 =?us-ascii?Q?hLc09iFxbhkmWuhOtTM8Kf9o0a1bJxj47zVaAgrhVuV0Wh826T87MrNABRHo?=
 =?us-ascii?Q?Mvrz05aTQX0jfr0ryBWjD/YEYGR7C0p0BepQvaLEr7laNHLPuvc1kyD5Bbo4?=
 =?us-ascii?Q?mCB/guxaZXfyKvCAMmybq/Q3ooTRtWDrx+ndSMOsi+bajq6kolNDvo6h5syh?=
 =?us-ascii?Q?vyTxKhy6yZEm9gBLb+WwfvjKFoUMmFr1Zq389SWl/4+DBREFEcUCb5fRK7yH?=
 =?us-ascii?Q?P3x3XXoGNKbnpu8P8Ns8mm+k1J/MoBtyLiuM04sd0sCRIur7LXqGCUakXHya?=
 =?us-ascii?Q?CgDgY8lEhc2IeUIEzkMamvRjkTqvUE/xZpI8AJpgBlrMlWiSp70wtv0a0GQP?=
 =?us-ascii?Q?lnunBI8qE7QJgUCjaX+lTHYR6Bbu7WG378uFXPJmJs6m8XYP3Tt7WWzu2SCQ?=
 =?us-ascii?Q?LdmRj0ZqoRo8rqpWSsb5WraaZO+deVjEfuJB4vnanoXcLSvyMv3Lbe3ERs0D?=
 =?us-ascii?Q?tTbHwXIiDd6sRYhZuIxRGyo+pw7HJ0nEqTEOBI+t9JKOnKlefZSnzjJedI1r?=
 =?us-ascii?Q?QcwcO4rO2FS14MT4ZlEMOJXHntl249g=3D?=
X-Exchange-RoutingPolicyChecked: 
	YSqNQIi1mOO0wABRVQPQK6braHwoP7t5FlqvU4ETZ1AXU44GMnDjue6O9LM11o4QPYdcO7KOefVD09LThH7YYPegc+DpluAB+AXOxG+yqu/tZLB/0SLRirKZq7FRPRyDunrNjJ9BeAvCFKYuQYrOwyfTjNhDq3ERgOC9h9OwCzLkVVxak4PcyUpxhiIM0CYErYtKgOLB/GfKsFIdx2j5oW1AUCBt5BUAMizxSgc1QZHCfA1XN2BSQ3f7EVi1MgEPfj3u6TYyAN5J7BfeoUIqCJ0GnFjd+D0nkO+9UgMQGDszQZmJmGaIyvxvgfy5l1Nmx1+b40AAnSF4GR+YOlhJ6Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c232f1cf-edaa-4633-b412-08defbebb2e9
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2026 23:11:27.2213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ei5Z2yG4FAWs4JVkbTsH77Y9rpqlAnCPL1+Be3qKRpz2/avBb3BbfhhLj8l53+z2Xt1rltBXsfz+Prt3YQv/zqqhRAx9mDchzyp87XoFAjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9158
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 1XkFPuYOC-24Hj5ElzHshGNZcVeWEcF2
X-Authority-Analysis: v=2.4 cv=DLy/JSNb c=1 sm=1 tr=0 ts=6a8243a1 cx=c_pps
 a=8Q3VSxVeqSVE8Qz93TfAXw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=ojM18H5VpAenaKTG1r8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDE4OCBTYWx0ZWRfX1Grzh5++R6c0
 qJV4E/YFvEwLDfmGSGDLsuH4J4gAqAkk4T4LFPCoQZl/Bk5gKqRlDrefJH2E/4/5EJnHOkdNCbx
 MBi0xMO1kC7xDR1vQ/8+T46lYvoPESRRvdwS4hbVMFibMZ62HEPk1huclG4DVvjQP6ww4WSL/Bx
 aBcvPNGJ5sDHQ6TQikqECPkhZ2DMti9ItrK7G26FOEflbJprjT65jWgAEzokyVYh7PZMKRMsCNU
 pn6BkSbl8AO8EpIK9CnQ2lcij810oFjajNyngqgv3MxROQNfuZHjH3hMALtQBQ9tIlwk2k3XOiH
 ZSi7HZyOsx1rOO+a8pW2hynnRaa8+Ro+PrzC205k6ZeEvvwK91kKkcJjuW4Ef0PpEZLJcd7546u
 YimWFVyop8HzZ4cWS1LV6CVDl1fBbBADcQCj6ikw7Zasuvd/Cl8BuK6FK6C4c6JQKKQJqmhB0xC
 hPlMwww7JeBqbPF9nWg==
X-Proofpoint-ORIG-GUID: M40cz7it68Z-CaohsJ9f62_AOC1meGtD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDE4OCBTYWx0ZWRfX32gKVy3v4r9O
 hYuGwjWT2raGmwj0ZznN/bJvTd5KLybAxx0cW8kLCH0Gn/EtgvBS08bHwlsA3nn99jMTOPshCl3
 PwxyeLiUFdlxUPL25POaRGzlY+eAtxF7aXmKHOntjhw6tgQZnVX1
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
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 23:11:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243574

* Added 0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch
  - rpm 6's internal dependency generator runs pkgconfigdeps.sh during
    rpmbuild, but OE's cross-build environment exports PKG_CONFIG_SYSROOT_DIR
    which causes pkg-config --print-provides to silently fail on .pc files
    in the package buildroot.

    Unset cross-compilation PKG_CONFIG_* variables in pkgconfigdeps.sh so
    that pkgconfig() Provides/Requires are correctly generated.

    Without this fix, do_rootfs fails with errors like:
    nothing provides pkgconfig(ogg) needed by flac-dev

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 ...Unset-cross-compilation-PKG_CONFIG-v.patch | 71 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_6.0.2.bb        |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch

diff --git a/meta/recipes-devtools/rpm/files/0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch b/meta/recipes-devtools/rpm/files/0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch
new file mode 100644
index 0000000000..eccf708872
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch
@@ -0,0 +1,71 @@
+From a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0 Mon Sep 17 00:00:00 2001
+From: Sumanth Gavini <sumanth.gavini@windriver.com>
+Date: Tue, 04 Aug 2026 23:30:00 -0700
+Subject: [PATCH] pkgconfigdeps.sh: Unset cross-compilation PKG_CONFIG variables
+
+In OpenEmbedded/Yocto cross-compilation environments, several
+PKG_CONFIG_* environment variables are set to point pkg-config at the
+target sysroot for recipe builds:
+
+  PKG_CONFIG_SYSROOT_DIR=".../recipe-sysroot"
+  PKG_CONFIG_LIBDIR=".../recipe-sysroot/usr/lib/pkgconfig:..."
+  PKG_CONFIG_SYSTEM_INCLUDE_PATH=".../recipe-sysroot/usr/include"
+  PKG_CONFIG_SYSTEM_LIBRARY_PATH=".../recipe-sysroot/lib:..."
+
+These variables persist into the do_package_write_rpm task environment.
+When rpmbuild's internal dependency generator invokes pkgconfigdeps.sh,
+the script calls pkg-config --print-provides and --print-requires on .pc
+files located in the package buildroot directory (e.g.,
+.../package/usr/lib/pkgconfig/ogg.pc).
+
+With PKG_CONFIG_SYSROOT_DIR set, pkg-config fails silently (exit 1, no
+output) when querying these .pc files because it attempts to validate
+paths with the sysroot prefix prepended, which doesn't match the
+buildroot location. This causes all pkgconfig(...) Provides and Requires
+to be missing from the generated RPMs.
+
+The result is do_rootfs failures like:
+  nothing provides pkgconfig(ogg) needed by flac-dev
+  nothing provides pkgconfig(libxml-2.0) needed by libcomps-dev
+  nothing provides pkgconfig(ncurses) needed by libreadline-dev
+
+Fix this by unsetting the cross-compilation PKG_CONFIG variables at the
+top of pkgconfigdeps.sh. The script already sets PKG_CONFIG_PATH
+explicitly to the directory containing the .pc file being scanned, so
+these external variables are not needed and only cause interference.
+
+This was not an issue with rpm 4.x because OE-core disabled the
+internal dependency generator entirely via:
+  --define '_use_internal_dependency_generator 0'
+  --define '__find_provides %{nil}'
+  --define '__find_requires %{nil}'
+
+rpm 6 no longer supports disabling the internal dependency generator
+for v6 format packages, making pkgconfigdeps.sh active for the first
+time in the OE cross-build environment.
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ scripts/pkgconfigdeps.sh | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/scripts/pkgconfigdeps.sh b/scripts/pkgconfigdeps.sh
+index 1cab58169..f9a3b7c21 100755
+--- a/scripts/pkgconfigdeps.sh
++++ b/scripts/pkgconfigdeps.sh
+@@ -1,5 +1,14 @@
+ #!/bin/bash
+ 
++# Clear cross-compilation PKG_CONFIG variables that interfere with querying
++# .pc files directly from the package buildroot. In cross-build environments
++# (e.g., OpenEmbedded/Yocto), these variables point at the target sysroot and
++# cause pkg-config to fail when processing buildroot-relative .pc files.
++unset PKG_CONFIG_SYSROOT_DIR
++unset PKG_CONFIG_LIBDIR
++unset PKG_CONFIG_SYSTEM_INCLUDE_PATH
++unset PKG_CONFIG_SYSTEM_LIBRARY_PATH
++
+ pkgconfig=/usr/bin/pkg-config
+ test -x $pkgconfig || {
+     cat > /dev/null
diff --git a/meta/recipes-devtools/rpm/rpm_6.0.2.bb b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
index e8977aa31a..c0255941ea 100644
--- a/meta/recipes-devtools/rpm/rpm_6.0.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
@@ -39,6 +39,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-6.0.x;protoco
            file://0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch \
            file://0001-tools-elfdeps.cc-Remove-format-module.patch \
            file://0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch \
+           file://0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch \
            "
 
 PE = "1"

