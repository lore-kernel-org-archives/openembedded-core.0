Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26BFC5AD55
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 04:53:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23016.1786337589065399176
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 21:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=THvt9135;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=26826cd257=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A2dsii582257
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 04:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ChkSXHBN90OlHgTVmPukZEsj2cKzcbqwXqvI6ioPI3s=; b=
	THvt9135kjP9VXukmz9wqWIVUR4hxa+ZnXFAP486FUclGp5917/4R7Ca0Kk5dsiq
	9deQ37Anlug1Mb5HHU8TqfnN+Yg6LCcjzmnA67VyPjlgl+gNFHOKKm0QgFOMwGKi
	5Y6f6DfvLKB8aTxZU3ySc2DThfeQocYT0sKREbfvy3MBkccU40AKdFmPmkuoSA5w
	knUAEmQOiJ52pav/Up5BPlW9lAjWll1/1i+GWgwEwsPyBO4PSNK155jnc8Nk2kPz
	kEYUSynMQanp6wP6KsLn70veGxxulVqdHd84P432G8LRXG2ZQu/v2c2w9WYczVoR
	ceNagihUgCie+wF+I2hq/A==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012032.outbound.protection.outlook.com [40.107.209.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fwue81s4j-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 04:53:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMIWBAwvFkcyD/r5ONleX9opHJXZ5JxnJ+91h65RZ614m4sVUTkYvBWL/wQeKTi5CHi3c+IjXtZJRxvAiMEb6oiCGmvqcz+hsyhnGflIuPQpeBq8z+MNFmoJOb2MLdTYZkUXujtxQiAX4RQOE1BNeN70MIjSROjoilapQW0y1ETlzyk8l3JGUvjfm8+rBnaEn9dICfyZJJjKF2ZXucvSDu5ABaMBCgyXzGs9xS9aKToHzwebdL4KZ5jC3Umw6K7TLga+HjvVlZ/2okBeIrX0DwRaAdXH8+URseVcFdII1aBhPw0yLDyVj29BXGrMSlkvof96gFr6QnX7FM9sN2Wz0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ChkSXHBN90OlHgTVmPukZEsj2cKzcbqwXqvI6ioPI3s=;
 b=m7tN7GOISgZy910621k253BkLrSxf3z98YXGFJ6xd8u1Skfy6+8uvlM6obLlKu4HPgfth9crpJcjFAT2cjsCx0Gw//T34FQQ/jcEvT+2rqGQ5yuK0AyMDu9heioftFAirL76g1VIWhDX3aq+X2+cazbYcFCu6MA7b9bGIfK/JE9scqwdRJIV9eQeMCLUcaAV6tjjQDf3Ny7TNz2s2COwSvLUASR9fYLArgjLr3HfzBBh3y0WR5FR5wrySkKOVtgVYFTKbR8f8uQ91QDUzrFqgiIImph1JBU9J7u59plUznSpXE4qxTbFTjcgxhs20qhind7kAVqQDrhgQaEkORE+/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by PH7PR11MB7595.namprd11.prod.outlook.com (2603:10b6:510:27a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 04:53:05 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Mon, 10 Aug 2026
 04:53:05 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v13 03/10] lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or musl
Date: Sun,  9 Aug 2026 21:52:43 -0700
Message-ID: <20260810045250.3903576-4-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260810045250.3903576-1-sumanth.gavini@windriver.com>
References: <20260810045250.3903576-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|PH7PR11MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: 611b399e-e01e-4f0a-d7c6-08def69b43db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|23010399003|18002099003|22082099003|38350700014|6133799003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	/jnOy9xT8tbW7aI2PqSD/dx0CmhbAhkJeLawVeQdabqz0f003RKeMDqtypJw33ZitGe5L4n63LQvUGfHxZYgHHTrSDwEAsYYAb9lzKK4P1VTJeJ/0qgIOGpYQKKxnm9a9C+R2qaj1T33NT2jax6IuImLuF3/u+SR+/FoAM9d2C2/xZ9QCeBeFJ0pJ4XMnnh/JXEwylwwfD82toeQwrJH8GFtmAm/8xXRkXA2HhXQVkNvo2IwquVvs26mYJ2XXCmcsuTqjetsA8cFDdwCpfGsOVG8nCJatC4x8U7hTVUVxxXzAQZjjXRznXSHbXXUuLyNoCdahL8Z6Up/fwrbJRLWFscabfbl/BGyM5qjH9koa/vi0xlbaNywQesJ6A72+rnabAaNf4zKPour08SYL2ncBuDZx19cTOwYpqozcb6bD/SaECHjXhAMNyl3YE78mHjqwt3QzfxFICdl8lQkVzLQLjP8jrrUL+CxsdK02c3MKLV1mfxNnRm6LzZPHugVxalKxiTnaRJ8JP3POD/CSOJDaAIN0C+zcvl4N0LU+GlBX/JronELDpYsBj+K386JoITHIB0b8owP3JBuPBK50ROfiIAsbZM+jv4ouvN0RUzTZojR5T/9CxviOl+fb0x1jAca9yQqWe2vokkBkFYabvFYYn/SpzT41Lz/wY+xqJxBI/5kevzxhX307bJVnuwg7Jr9iPJ+NimRSf7kV+hM/AesJMsUXnsZU8S+xU1A3wzJfLc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(23010399003)(18002099003)(22082099003)(38350700014)(6133799003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GJkzmD+L2no6b18FnGXdZpIdfXwuqf0GMLCU+alo3yZXLkSgSi2rtzWwjeAw?=
 =?us-ascii?Q?9/slKjh297aGGpLiJJx0DE17Nnl5HUYF12xOhhSsAjJfcmgXs+7WpLGh4V1D?=
 =?us-ascii?Q?i5k7xf6Y+diBKmFvFE2tGFpF1/bjPuATR4IatDqUi5zXFuuDsDo6I/Jg4CCQ?=
 =?us-ascii?Q?J07Y5w/UDl0y4ctckYfvjclraLi1cFeqEpfxPIUAK3WvdcmDuQeb1i9EgqcM?=
 =?us-ascii?Q?GxxPI8vUOrGZKlAuJx2r5NUZ4+5AzLc13tVolgD16Zv6b0zAv8S9HsF0u94H?=
 =?us-ascii?Q?E3qjd5S4Mjw2AcWSbOtplgaOmNg0O6fW3MNrdsEmHL42S9whn30Vu0Wxu0Ss?=
 =?us-ascii?Q?dpzM8lyCswgtD5L1bw0hfk+5AIF2ApGIQH7XeveP/Q20pdlpEP65hwRVxhHr?=
 =?us-ascii?Q?eSQPr8hP2uXWKok9B314C06IM95FcqSLnuJpJ44QbftyPjQDzjxu+SY6ebHo?=
 =?us-ascii?Q?W0LLCAU40ea1NswcWuNmJXy67zlshJL/FnwcBcUjEEaciAdFDhxOimHgBnRj?=
 =?us-ascii?Q?fEA+4gy6E9ZxjiTbxRfUYB1nQXzn8aorzB5xOMzNxyh1qArVjF75VFM7cwgs?=
 =?us-ascii?Q?3s81m+YEAx1q0rYJRKMskDPQKp5/lePmkVoox0km9995j9XL/7jOkzD7Ihy1?=
 =?us-ascii?Q?1ERxwPYPRzYF64MukdlgugE0RJdY0MEuH5sMtB+/hoqImblIBg09zagWXySP?=
 =?us-ascii?Q?/paVqSeJbxiIlGb+Iylm2oqg7+HYf9p6ftZIijylGxSZfbbEDKV6nIu8LrBh?=
 =?us-ascii?Q?ygIohhKmg8FlCWGCp3P+WCv5xBsZNRPFDxiiq+L+dA4ykb4ZQkUfbyVUIUV9?=
 =?us-ascii?Q?KjV9eUzLAOcEkiXJqnQib0pX4vVJV8fIQJ9wyXzHuI+OJUJC1f7jMYUmCERd?=
 =?us-ascii?Q?7cwbhfARm3a0RxZkOEnh2At7suk/UfcPRC4LWQcvEVeEmaAF/BmHqxuZ2/F9?=
 =?us-ascii?Q?dZlwNGK2ggczsY6OlxtlWuXAE6dXOguJSxBOK1IZx070mNNMg0vFbq0P762d?=
 =?us-ascii?Q?XlV3FL1SZXwNn1fa9HgsBnOkf8YGkxTJFPVi8pglSu+m04j8eHqUNZw0X/Jm?=
 =?us-ascii?Q?Uml5DWyaYioYp9yp7C9MMvpkHgogsydtRK1OoXrPGip5+KtgMzOYqMnvaCK9?=
 =?us-ascii?Q?8oTuL2t0Iqj+JDd8F31Ro9BYovPEivDkBkzMscS7SHscMCKxFlXlwpUS1Td3?=
 =?us-ascii?Q?Ir9WgV/il178eyINvN7y4tW+6X4y+jaVc+nsI4Ari0hpcYh012KPRAAqui1U?=
 =?us-ascii?Q?CeUWrjm3k8XJQUo+prxg/x8W0zRgGQMk0W3Yi3t04qN3pIplLUVX/qxQnkAT?=
 =?us-ascii?Q?in3imP6Mgk8x55d01XMKH9mxaKl8fBAiZVeJg7C4zR7HDbwguSkNmkpZfDIt?=
 =?us-ascii?Q?Ivjc5Oe0u3COHsEp1SRjo5yr8D22R/Oxa8VaYv8jG7HqIY0wXkhjvsDqO7xG?=
 =?us-ascii?Q?JbZglVRarUIbxXYVUyF56LJNPKwDhmzuYg6OH79doHNSdKpBLi7EklTj/zAY?=
 =?us-ascii?Q?Q8+CgtFWgT3ZqzMqyKUSLKCpxNXVLk8kQ1ujVugVIGqdaRfbe0RCuuM4UCsM?=
 =?us-ascii?Q?RiJfc2ht6N0yyIuGI2C6aMjXtLOKp1KQ2DoUnuzuxg69YdIRlW/F0sem35me?=
 =?us-ascii?Q?en6gImLYwPutvsgkVXRGQVwZflM2/+HWXxbKYsgLJmXAnH4aazqZjXmS1j5s?=
 =?us-ascii?Q?pfakcr88N4k0Xw6yiyMqf5SoZ/jfcEslsIfO8BvVzQTVt671xyqfvPyGzcXo?=
 =?us-ascii?Q?t4cJZhO75Ggye4zUW8Jsy7onH0ZjcMc=3D?=
X-Exchange-RoutingPolicyChecked: 
	gF3FapjsKuPNZ6fSOp++XcctVZcmhLF5XOIZQ3nb5XodFifIN/dRAfPcvQ1U1yzVvPj/pbX8a8qVsXve3g4CJPlWBkQ65yT+s8pEYSfO8v7wBsxycsJ4pQ5CMmXbRetN8J/SRczP+DizjFrCrV29CA/zhGWf323Nu9EzAwNYlQN30ypDhWm0qsibmFbHa4C5L8SQMT9+X898cLGSw3/ryb5y7e84eGYscQs95NSiPDbcS8hPFcxtedPG0EfezoJWexlUX+S7jRApjcjORMATdziEJaYVSJpLKAeGjODHwjdOYufjVuYK7/aDKEq1fQTH2X57WsJ8g3lC1you/6qViQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 611b399e-e01e-4f0a-d7c6-08def69b43db
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 04:53:05.3737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3Z5GjiM5fKVD1L6kmtNde6E2KHvJ1UhRq+gVjP3gjMDg3m2J1XcaCNSslr3NuDTV0I9OckvEjw4KdE5GZkasVheiqWdsZOCzp3HahBIoJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7595
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=A6tc+aWG c=1 sm=1 tr=0 ts=6a795933 cx=c_pps
 a=Eb813/LJkoRL1pr8t+D1ZA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=YcdC0ctDMGJcGoIPl8kA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAzOCBTYWx0ZWRfX4ojmJAOtb4tx
 LMDEyxtBf7wVmPi4CHiVqYWDmZld1xdWVMT7+KeSafKcI+ZoP35hZwOd7HYZ5J0t4ZiX0xnKYw6
 8rjjddcy12I/KANQKRj5GDCXPtdzkK4LXzhlG1JndVg38TKCdskd
X-Proofpoint-GUID: cVMG11R-6WjetqqWpJRktfTguTHF-FBb
X-Proofpoint-ORIG-GUID: 7-arIgZkL3GQlcpozXYmFNIgtBYTgtx6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAzOCBTYWx0ZWRfX8qw8cWmTL5zu
 XsZSbyH62y95W8gU7vfX/lxCYFkdE5fKx8zsIFOqK+QQaCgjUa4MDMYPV9kGF4gfxtPUe5wHUIc
 JMT+SuX4FBA1+blEfefz36e1PYuiGLUzZrYqhoXxoTq0WKDrqnZKwy7sN3QObzXmIJnF2FwPhVI
 0DWDjt1nVQW3EWE2Huu0M+ygOu+ipuJquG213pINGjmuPO9WQlk0R/BzBKH3Fmn7m/lxdvv0qB+
 UxksuM6vYC5fs+W1B6HBolhbeEfqWi7cD0UOkZ40kAkBCqCT8g9/VOElCKfuJTBG3AST4zUztM7
 2BZlCcvfwPGIl67SkOHyn4jUq5QkutDeWNHXF248vy/TqOVl5VWwYh4hAhccb+QHjPTU47vThoi
 DyiPjD4dxWh8fokPwcYkiQzg6T4TKk7RKnlVFiIlyWG4Ikpd3frI8gsOUsuFdUgmNbujrLCA2w1
 FM6TjOf0XyN1Fax8lgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 04:53:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243095

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

