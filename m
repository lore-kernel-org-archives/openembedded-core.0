Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F9AD5B161
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 06:40:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16104.1765867235535731196
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 22:40:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OuczQ7Xv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=444573d0be=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG0ethS3852986
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 06:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=vCUl8hloU
	xHDVYS2JrSzSzvihLzDG4XzRLGWTeFGm9I=; b=OuczQ7Xv+4egeyM5NK8I4mVuz
	rfHSQiFXWI+tNplLBR+vGhvrEU/H8eygOuN0L6Lm0g9A2IPEguOgOqJwWAYMatj5
	zTHvEmJUBYaPRiZ76TSahqPY7kginbtJBBsapPHL1pEjij8BgiYVOWGHcXfakZOG
	90+Jn4wHiSwGBUya2U+ay1jfOiwJiZLX6cd0HtBDKfoS6a9p5l80wj52GU9HMk15
	ipPo8baad1EhPGPVdhlLnGWNy7/6pNXD328pSRoXXy+24EBDGu6YtrF9fe43vwZ9
	uUm6X+cWDyiW45Zl5mvOahT8MUhy8hc7BAUNWHB+oBUA/8IEDYX+pGH3R0qvQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011020.outbound.protection.outlook.com [40.93.194.20])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b0y48ap9u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 06:40:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4WUB9kINl34GtSkWcjyBY7c/NxohhuNRxZxnNjRAHd29X2f+h9NYQhmc1t2ZEyF6P/CYBk/p5oYUzPcDFpdPHnVBgSPAshl0dATr7Ya1IbVtni3a8/ZyAuzDNjWrb6xezbtpJkgDXBbZjkwuvw1IksV8U4PvJXMgu+JxeL2bTFOJtUxSN+Za5AyGJ+1d0RJAkz1bpJJAR0QJZ3UxZDjG1KxN/lQZt4yjoSET9BrfpCF1PyUjNjcFP+bOm/z9lvJxeRWPt9GmepE0rWf5Wrul9lROV1wVHf7/iUq+C4USx2Uv/ROPn/atuciG2644Ltstatb/DEGIXMLF9JVekVqjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCUl8hloUxHDVYS2JrSzSzvihLzDG4XzRLGWTeFGm9I=;
 b=LWM07XN/Y28uzD/dqrXusx2RdwWZgrGVxmAfteIToQIZa0nxpcEBSjOXcWyDR1aR3oMOilbOGX8PD06EOIDQdeaXL35qjoxbygqxheTlbCnJXii6GZDLMUpznIpiYauVDy/Q0fpvacMJLnbTpbyjieyXO1R4nVpltP1gwJNvK9M/2bvFyPWbIZPD7zg544npkfRGkxAQJaD3C9ZBaS5Xh/f3ZrSCA/nQyxNZI9UMO8pbujU4uLnMuzPreetvW1lku6TSYLSlcWnnm9v8V76psrhmuJXznexLy+h/r5VrKoHOiMYwIQsoAjtHJcMuoryE1H9M7iVe0Hbwbl4U+yj7yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DM6PR11MB4676.namprd11.prod.outlook.com (2603:10b6:5:2a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 06:40:32 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 06:40:31 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Deepesh.Varatharajan@windriver.com, Sunilkumar.Dora@windriver.com
Subject: [PATCH] binutils: Fix CVE-2025-11494
Date: Mon, 15 Dec 2025 22:40:17 -0800
Message-ID: <20251216064017.1267401-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0004.namprd08.prod.outlook.com
 (2603:10b6:a03:100::17) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DM6PR11MB4676:EE_
X-MS-Office365-Filtering-Correlation-Id: 63bd2991-9c9c-4d1b-d473-08de3c6e0257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?p2a2bfltuStfMvQFlrB+BScrsCJ62eVhadw+1a212/2KixEGzXO0ucMn0gx6?=
 =?us-ascii?Q?F+1Vl1Y3gM28RwpsHsthHGeWKetNfn80+hs9PmnJS/EkvZqWvpzSuObaZstx?=
 =?us-ascii?Q?I93K6WzFdNZZ816ajYE8lP1PahZUXCP8kiV20TKTRF/mekqf24UYiBqPUuMu?=
 =?us-ascii?Q?bQ8NEv7mrI7P2RUSOOb3AWCNrdv7vJSKkeRpw44T6UGT4NU3nfm51IfaaIuT?=
 =?us-ascii?Q?lS4meAPlFLM7zdOr1IXrOARC6al8M+mCvjiXYJ4QtJ5lFrvTeip8Vp2eOiWY?=
 =?us-ascii?Q?g4iLw40jmf1uA39+xTXA9qDaLAI6QXvST209RDN/zILphnWpUWv/hmsHIUvY?=
 =?us-ascii?Q?2D/6clCh9rUcdXecXR7NAFO61yPXA6cm7kJp6ySGlqerY21ESZLU8O9xMZWS?=
 =?us-ascii?Q?6xpxazganb1WXNl8/h3vUUcAyUgtFE9YmtGPl0VNe+GH/eRhJyKB8WgXH7dg?=
 =?us-ascii?Q?yyPNcTUbQlzESj8XB2Oz83QDA62joT7o71+p1/earjMjfbRM8HxhS5tXOECA?=
 =?us-ascii?Q?MPNUtRgRPVRbjIcKKKhb46Z6EYAl2Y8dVuM1oQnQEFTkMAWuxlzvUOZD7eSF?=
 =?us-ascii?Q?/oMZaPxJAampx1grpz0tUEW0NWpEDshYlFo6zpmpYFTKUQTDQ3EV7TW5o1MY?=
 =?us-ascii?Q?cEA7ibu56FwclRCGVdTx8xQ1xx9DY7Vrvd4XD5zUjGOs8SbWVHuVQg/feamC?=
 =?us-ascii?Q?irF5QONbjcOt1g+IasUWumWMB0biu3IInygNUpKk3KhV3h4I5JGG9heBQhXN?=
 =?us-ascii?Q?NmD4DZgsCevVISOQW/LXZsfoD5igJqpHVET3ahXf2oNTaI+UY2OpQQq3Xgkm?=
 =?us-ascii?Q?D5dqJ33iVZYaayjjBndVPxGShQ2HWX8LcZej5WP5WFyRrWbT1zEjCGEEPTih?=
 =?us-ascii?Q?CM2QklyC5+UBkmnsCkzwtfm0zIK3u7+jR6kfj5h8WAQ9PcGfzsUrLiNedpFO?=
 =?us-ascii?Q?9NEQ7iXDj2xagxB1Y8D44EAAZEakllji3OCyuCi2+bstejbxnKzKB8vfrgaD?=
 =?us-ascii?Q?fo15AXvHYvpgG0Z1ZPwyH4ydhG0b0ISO2hmwAym4IWcoH1dEfg++YCw8radY?=
 =?us-ascii?Q?J2AR2mGRIDHtUxc0Dq1WwT8JQX2Z2kpQDow7F3oiCkdeii4p+dhT0xonwxNE?=
 =?us-ascii?Q?FjYkPjlHiO7d7NWDdE1GGQTnZymmH9yV7FUPh6hAYSBlxp10Wkxfev6SIueE?=
 =?us-ascii?Q?5W/cnbWTf5XjEih9FWaquosUAh0IZHcbYL/Q2R1pqEUT2XkD7TbL2RtyG504?=
 =?us-ascii?Q?Up/uEVjje9uYL55+5Cq12z8FJpZceWTc6akxDRltI38483jSCHdv4f7LJiOi?=
 =?us-ascii?Q?lP+TOAxBbJ3ZGbPmXKe0f+var1A7p1NfR1OOLDK3CS6jMDu+In7VZZEZQOIs?=
 =?us-ascii?Q?vdVFrJ8BzqSdrbpBk7GoZ4WBhr2eVfaOJSaCGxK7/38xGjAaYVtG3wJXS0v1?=
 =?us-ascii?Q?vxQ4xWo+8RbD0xxXZfPU1GZ3ImGSkUXOPi6AczWVLubc3LCvd+QLwg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FNqOI3hsQU1Xetnr4JVT5LPAEVkdDKXv3Hex0xlJ43uLub6v+O3kO+t6tnD/?=
 =?us-ascii?Q?yqWTMrGY0YvjXtD64p7sDUWLaKhi/b0SO7Zes2mTmV63mIAMvhA3p38D+Ztj?=
 =?us-ascii?Q?usUl6+dEMGsJNFa5pv+YDCKDbXhTsgajuFNl2Cg14ETmBV3D+M72utN7N+6k?=
 =?us-ascii?Q?wwWx4Xqk2Wne5NLlnc7rzAC6n/TWeH2TzhPinb1T9dmKOxoV6N5OzP8rR+h5?=
 =?us-ascii?Q?McgSg43UpAH/U7vkQaKs3tEkrqad4rMsst+1EMX6cczjqo1RJE26eYs3XZeN?=
 =?us-ascii?Q?fv3nUxefaRpYgeFJ8Sp8SRftTH6UgNDI2+1W9rcsh1Ekn40yiE/DrLI3pmdK?=
 =?us-ascii?Q?/2s5n41ltAVkR5doXU/uNSfGxciF39x8eA7nmhP0A7vd5mhIKhNxG5QO95Ks?=
 =?us-ascii?Q?UQ6xNZpT807RMXK/ZO0fVr3yKRiBsVnMteKQhyr5V/BhVrpIvHOnjZcghb/I?=
 =?us-ascii?Q?+BPNdSXkQApvpFJAOrQUmO5WPSPdw0fcV/DzJfYN8hQeZMEkt2gb5FK7hp9O?=
 =?us-ascii?Q?il9wZHePAL1QG5ZhgVwKLi6zZNyWboFvC/jjVtR74sNHxgTfm3C+MRcxtDIN?=
 =?us-ascii?Q?7L8saRzD+fZaLc1hhQ3/G6LQmmE0qsuTStP8WstITFnbx0i5BVI50y4tGSSQ?=
 =?us-ascii?Q?enM8kbYcSf0oE0M49BbS7gvkyOlOKgl7LQNseUOVHNoGVwvtAUJSB0CMCu7K?=
 =?us-ascii?Q?QQVAOEvUmIzFC0tWbOuEwlmGY/a2AI1lHyfhA249uhq3hNHxDVLZYHbuDlOR?=
 =?us-ascii?Q?B7L0nNVb47Dd6jG/+a9eYwf07vUlej1FktkbkpSZ2ZUvuYQBrEbZ/JXHtvJo?=
 =?us-ascii?Q?lq2syoqg0keHnjPCBS5tufHU9GJ/AornUIXazAoTk4YdDkIRJqjzfBgifTj9?=
 =?us-ascii?Q?ul59dnEZ2ZyB1oJZ45DMuHPVZeHPnZeX5ncxnwpbnvmmBJdRPtGuBsUuu8IT?=
 =?us-ascii?Q?JYEDNGPd19OTErekN5oVnO5621h5gS6qHj8aq78Sel102wC1JkmYscu2rSC2?=
 =?us-ascii?Q?JiwdqiSHQzjvzarkjNGo2dzByvaxS3vr+Pk5b05xsNf9LTxR4NJ5M3BHT/oI?=
 =?us-ascii?Q?7+HvGJF8+CoPB2winhwmsQDOgJ8t/zv9PBxgO6L+E1ad86FUnGk85GgnBvE3?=
 =?us-ascii?Q?9tpTZp4hueG+TkZB4gefNX1/6dbWyTwnuGRpFVGRBP94Vd4eBH41ZEGrY+GK?=
 =?us-ascii?Q?MNZj4uycXdL+MyArdleUfYjRyX8ZkLRQFHLeJwlp3fmy0FMARdouUfbbENm8?=
 =?us-ascii?Q?GigNlzxrcdVIRJDDFOaVJmDksDguQ/y9Ka/WpUTwIiSGL+P+Y9esq6khOCS0?=
 =?us-ascii?Q?a5CWDnImRx7aXgLW+hCw5Et5ZtY1LnT5BudVaN1sICT7YO1tg8I7NFOJFbly?=
 =?us-ascii?Q?gJuIfiuxt2bMQ5mno+I4KnqyZF2vggcdn9uI+aiEcnU4ow3pqVG2tdXR/duL?=
 =?us-ascii?Q?U/1V5PAit41gvwh4Yq64zvyJzwrDuwX48ZHF9e85qtMsHzNg5iMnVlRd5fbg?=
 =?us-ascii?Q?8Rt5qsHCzNdfhZKl8ehQ1MxhuG7/ba3CzSTfv1zyKD7KXfleuGGryLB+hh+2?=
 =?us-ascii?Q?cjR62K+qg9F2E1bpR6aGsZUMmRLplEyAjrZ9J8T0gw60wwOXlhh8hGvcbTor?=
 =?us-ascii?Q?7vTkeHtjisSEkIvo9p3TqlQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63bd2991-9c9c-4d1b-d473-08de3c6e0257
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 06:40:31.8108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JoUiIp7C1dkPYzHYpLXWYwxx0yOYLuM5kfUlXhBpyYFLDmX90NHJDjB0Hv2NXtXg3KloYYX8r0HIWQxAmmYpheU08AZ9lnQ+iINhsnHsw7Ss+OsxLlnoRDcUJnhuGC1j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4676
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA1MyBTYWx0ZWRfX7C2++MPyAJkg
 mJiuvfbH2qo9sTmSSZbISnxTYH8mr1Ybs0N3GW8UVvwHmCv1LtpHCVNM4zGVOxjYTHFV3LVWDYj
 BG/FM1SxCw+c6zso6pAeuDjJRYWwYhgB/p3nb1vrHWRYvW/tvVVdPvaK2p1sdcJ4yiMHR6SAKMB
 bu6zbx6gtJ2F3oltKZ3nS8K0RNw3eu/losbZ4V+p+MUGtZHY8oeREm3KphwqqRvF1sFttA8tZqQ
 yhS4dunISR8/aYzhj+8ZPlndPdbiDHfti0G+Oje9cRqEeFZmv7tyUUGN++AddgjaPzy7SRTvp9u
 q0wjTcEbNgOhFp69IVOnFCdXTtNyG91vxOk1UzL5MG4uVe5k/P7qebK7+ZBOCluVFWXylKEIaiF
 Bs4L+yvtGYYZ4vTYxfXLrHfloeOA6g==
X-Proofpoint-GUID: fMldGYSFXddmcg39_f_6I_zBJS_MWO3_
X-Proofpoint-ORIG-GUID: fMldGYSFXddmcg39_f_6I_zBJS_MWO3_
X-Authority-Analysis: v=2.4 cv=e5ILiKp/ c=1 sm=1 tr=0 ts=6940fee2 cx=c_pps
 a=ut66qxPycOxoCiL0Gbz/2w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=d8HPVgtQaXFDFom2_1MA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 06:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227758

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Since x86 .eh_frame section may reference _GLOBAL_OFFSET_TABLE_, keep
_GLOBAL_OFFSET_TABLE_ if there is dynamic section and the output
.eh_frame section is non-empty.

Backport a patch from upstream to fix CVE-2025-11494
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=b6ac5a8a5b82f0ae6a4642c8d7149b325f4cc60a]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../binutils/binutils-2.45.inc                |  3 +-
 .../binutils/0018-CVE-2025-11494.patch        | 43 +++++++++++++++++++
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-2025-11494.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 77c11b687e..9ad79b85d3 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -36,7 +36,7 @@ SRC_URI = "\
      file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
-	 file://0001-aarch64-constify-BTI-and-GCS-report-functions.patch \
+     file://0001-aarch64-constify-BTI-and-GCS-report-functions.patch \
      file://0015-CVE-2025-11081.patch \
      file://0016-CVE-2025-11082.patch \
      file://0017-CVE-2025-11083.patch \
@@ -44,4 +44,5 @@ SRC_URI = "\
      file://CVE-2025-11412.patch \
      file://CVE-2025-11413.patch \
      file://CVE-2025-11495.patch \
+     file://0018-CVE-2025-11494.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-11494.patch b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-11494.patch
new file mode 100644
index 0000000000..dc4b413658
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-11494.patch
@@ -0,0 +1,43 @@
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Tue, 30 Sep 2025 08:13:56 +0800
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=b6ac5a8a5b82f0ae6a4642c8d7149b325f4cc60a]
+CVE: CVE-2025-11494
+
+Since x86 .eh_frame section may reference _GLOBAL_OFFSET_TABLE_, keep
+_GLOBAL_OFFSET_TABLE_ if there is dynamic section and the output
+.eh_frame section is non-empty.
+
+	PR ld/33499
+	* elfxx-x86.c (_bfd_x86_elf_late_size_sections): Keep
+	_GLOBAL_OFFSET_TABLE_ if there is dynamic section and the
+	output .eh_frame section is non-empty.
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index c054f7cd..ddc15945 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -2447,6 +2447,8 @@ _bfd_x86_elf_late_size_sections (bfd *output_bfd,
+ 
+   if (htab->elf.sgotplt)
+     {
++      asection *eh_frame;
++
+       /* Don't allocate .got.plt section if there are no GOT nor PLT
+ 	 entries and there is no reference to _GLOBAL_OFFSET_TABLE_.  */
+       if ((htab->elf.hgot == NULL
+@@ -2459,7 +2461,11 @@ _bfd_x86_elf_late_size_sections (bfd *output_bfd,
+ 	  && (htab->elf.iplt == NULL
+ 	      || htab->elf.iplt->size == 0)
+ 	  && (htab->elf.igotplt == NULL
+-	      || htab->elf.igotplt->size == 0))
++             || htab->elf.igotplt->size == 0)
++         && (!htab->elf.dynamic_sections_created
++             || (eh_frame = bfd_get_section_by_name (output_bfd,
++                                                     ".eh_frame")) == NULL
++             || eh_frame->rawsize == 0))
+ 	{
+ 	  htab->elf.sgotplt->size = 0;
+ 	  /* Solaris requires to keep _GLOBAL_OFFSET_TABLE_ even if it
-- 
2.49.0


