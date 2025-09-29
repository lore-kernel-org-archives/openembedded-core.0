Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28BACAC5BB
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 02:57:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.45342.1759114652805058216
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Sep 2025 19:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HvtduLAQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2367bb7401=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58T2FsjG122477
	for <openembedded-core@lists.openembedded.org>; Sun, 28 Sep 2025 19:57:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=DRiDwxt5MbJRX739498f
	pfcyIu+WpaETmj1xW3jhRbY=; b=HvtduLAQOxwn4eEn0UCgC0K/B+mIcW1OdhjT
	VVk4sm5c0DdQe19rr+k1Fc4XDnUbRzqJ7nhuXx7vcoEfuzvCYTi5GTO7zol1ydx1
	Ldo2SoRepIBEeOMtcScTKdwoIa0dWZnYSXKdOxnno93+vQeP5YwaR1S8GBkoBYrt
	SXEUc9yny3zOLsCugPGR6JUM96vSijrL7lIzCV0bVfgazAlUes+JKGPE3ODxCSgi
	+Oo/t85xEj+uPmo3ed1UkaYMS2pzqioYDRRtnfTThKvbMbm8WJNIOUP6XFwxb1oI
	6HZy0Z0WLD90g7fWl7uLD2Kgo0W/QQ2w5FtztwGIr5qMr801Dw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013031.outbound.protection.outlook.com [40.107.201.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49eb6yha3p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 28 Sep 2025 19:57:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ycQhpLK2RYVUBDAUJYhHHrDvthS8vse6lidbYxUq1D1pdGErgVDOgUi1gNbh0DrbCJm0V8vkIZ4lfoE7a3dP/6hT4VgNNzelnMJ8mLUL7OjEq3umhLmVi9twV+26dC2GyobOLKq4qBnkDuPhARNUIMPxJAnCitCClPGN+rITRyD6KsEzUXWu8vEMDP/NTp/9D1J7mwJOPgdisv1eSPf++7fuR0o2VJU0+iZCCErrV1ezi2P+TPvMhhME1gOoSwubgXriNSSFpEwRTSgFBLsyOaSnA5XNhZYMwUTm4wUoYWqRZE+U38W8+9GTfa+dzYGXLXr5Nxz3RhFEK8NbTrYyXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRiDwxt5MbJRX739498fpfcyIu+WpaETmj1xW3jhRbY=;
 b=KLeujjXqU4Wa3jcCxZ1ah4vlWtlkEVlUs1HJjv3AwF5GwzLEe4DiR8lDGbJ0OrhJie8qhaEGXTj4ueYX/IPJR7Fq4nsCrIs4VytRkDs1rtcaKIGqSNCyT0Vv4AxatmNyYMeCoxFFak3asPQ99CT+gsV+EiJBWy4gTq9o+dlagv30PTU/3XpIOP4f+TrAhst/gNaagDrqIVPAAAVxh2B9sO0W+f2L9U1dQQfvA6HpxcUTv1v+fMBDdExSpn6JO+uGSu1Q8LOrYF+1K5Ca3f8QRM3gnBYFnJ9ZJ24M5SgGKCXlxBkqsX12zeoRDyAAjIodGtCbYrPgDk/ZP793yW8wiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DS0PR11MB6445.namprd11.prod.outlook.com (2603:10b6:8:c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Mon, 29 Sep
 2025 02:57:29 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 02:57:29 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] syslinux: clean old object and dependency files before do_install
Date: Mon, 29 Sep 2025 10:56:44 +0800
Message-Id: <20250929025644.2085080-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::18) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DS0PR11MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: dc14b91d-5879-4f5b-26e2-08ddff03dfcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QjkpH0j4FR5WSloePJHWarYhnhaDKDJFwCxSlUjGIXuP0Ro4aSs7NK3dtKQm?=
 =?us-ascii?Q?F9gUQ8yrh+zmz7CgNIE9kFWnAV25+tLv6RY69WFDvU6QxJ9xmvl/l/k+u63m?=
 =?us-ascii?Q?ST1CeByYPrRRAnhpUmoUWuNbJnzhYmnwoYrzFR0RRoyd/3I6loUIU3/rkJlu?=
 =?us-ascii?Q?jD0/4a8MScSYnalgqU3siwiObRv1zW06Mbqja+6bWztDezMdjfnjUcTP2CLF?=
 =?us-ascii?Q?VYRS4WSus1sb6yUv3RR04BUAEtERyWTKkQkctmULord2BVcDlQOgnPwf9nf+?=
 =?us-ascii?Q?IrS3raTLuIbKJdSON/lMd784YZHnXzolO4vjFYSctuTJSaFujtiuXY0lOQHU?=
 =?us-ascii?Q?VxxIbNAdT5HZPoXaoh1yZZPxXaHue10s4xdtvLxlt7sWyeWjb2Iin2fx0Wl5?=
 =?us-ascii?Q?1yfzzj8nIrt05Z137I7iSutIdNREI/1x7i3fE32dmyc0ceou8Y+OTjucOm0Y?=
 =?us-ascii?Q?8aIVeDXkLJuG+27FVQGoKDKmiVZ5iXSEea5wI+DRgtqh7G5Lg8B3gWOOUWXv?=
 =?us-ascii?Q?SgEfHytYiH0EDWhaf8DYdsQXh0mbIUU3GQ5iuBKUtmF3nMMX6Zf4JR/5j7oU?=
 =?us-ascii?Q?2Zx9jhqFO23//tc1iEBt4r0RXDS8MVBMx9m3Vg/EIzJhhG82w3+OZDaZjNTE?=
 =?us-ascii?Q?Lw8SFs972WLP52UJ6KWLPTW1BgN6cKeNAXB83p46SZP4StHD00AtJJckPdCU?=
 =?us-ascii?Q?GB/WBsnE40Bucxk+eEkKM3Nni3qP1KmWCl5KDAxRRlagdFSyNKfNmhjSdJqc?=
 =?us-ascii?Q?IdjINTm2h9ADB6Ld2rMNVH6EC4onDIfMWgBpyt5TgU/q7Gk9zNh/rfwkD+6Q?=
 =?us-ascii?Q?DvPMZpLPEewqYXR7zmphg2beRCp9TqDuRWfWEdvnC11RmtoFfrOywDOTNbSN?=
 =?us-ascii?Q?cVEi+clbMUIUbH35xHicQGd0RbcfFOspJx2ICXkzBBcNP17qOMuq3Yp5bz3j?=
 =?us-ascii?Q?tgYHlreKmpsHritaHU1FRIYMLCddnOYYeRBnAvKC8GmxHs1f2ZDv5ekLAGH5?=
 =?us-ascii?Q?2Q6u5XKMduQiym8OxDFnrHX7LhQj2wu3AlFQ2HR473ScpkT+gDsYHZD0ilBo?=
 =?us-ascii?Q?HgMiSoMYBbw53KhqT+2eaaK67tlctGePJKqMB4Xj1O+3JS2qLIIzmCcMpVHx?=
 =?us-ascii?Q?JItAAr0ZMjo/33zFlzsWoBlS8VVjPoQleJOnYgFDhAeC0s2iAexF3ibaPoeg?=
 =?us-ascii?Q?GY+N7e3w0pbBCFY52nEe8mdUpBO9VdL4p6fjH2FSaMXTmCVaQWIaC0w90VZJ?=
 =?us-ascii?Q?2hOzOWALtEGGSsu2cqFYDkb3FVOEJLv2dyA2zKRjxgFNmRB10iRWfEIVH1AJ?=
 =?us-ascii?Q?KVuGRivDr9mq6GfNYmKdBe4r70lGFzxKD9e/DPVVdWKi6g4rbWYkFbA+ip26?=
 =?us-ascii?Q?Xqv/hwnsiGliNEELE+edFZHI1QmGSSDFZE8PY+moWs28lApySuL+Avg3Cfw7?=
 =?us-ascii?Q?H4si523IwnHFE06P7CTHV5MDsn8G1lzjpyvRqeow63WIqaY+kA591qN6q+j4?=
 =?us-ascii?Q?JwiDu5kbxGJdsL1snVDjTM0UrjUZXndfnPju?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB8200.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1975pbPbMtvrVAbkxZZICdnbsmgnFw08F0UelvDtu6pFLMznAPR4iuHAsiVY?=
 =?us-ascii?Q?3tqrsQCeGzn64EtY5utLpNSKp1Ceu967fjzI3s1RrqqqwATVJ+YbrJGPwQxF?=
 =?us-ascii?Q?r1jP6i/cU7m8qveg+uic0cU+TLDM2733v5f9yVspNYpjCkuw3PSNyKQWEJlv?=
 =?us-ascii?Q?bkv86P+rYCTPkSnU0OveKLQ+FLRlmR5hQ0vdHlDP+XvzZEJvcg0mF+HyBg1F?=
 =?us-ascii?Q?BmZhafzMK5Uec0RR+8/bU9jjPShYWeiT6/tICh/INwLYGa//UeeHB5564hui?=
 =?us-ascii?Q?Vy5P/b8a2kRj5P8ArfDLKk7KR+N1kB2Fl1dhvFowRCPeO5mbieiWP97WC1Zk?=
 =?us-ascii?Q?nh/9l55/fy7ltL7iAs06nJ5ONCXjXbmeuDprl1rgmX5UqKN3ugRJoqBopY44?=
 =?us-ascii?Q?g/+s9LcVH8ayauszJ4VbzLvwM7K75IQ+iSrl7DvoF4UOUUu4PWffkMoAkht2?=
 =?us-ascii?Q?lYtOXjVj6+WqnJNpIel7296AMbd5q/paNTZ/hdl6ncmIk5Jadj3ZHyZw57fS?=
 =?us-ascii?Q?uBJT77U47D4Jpz0cIpwKzwHbNazbGPgW8DVPGP8YB5ssSr7VugwBzYP0CXIt?=
 =?us-ascii?Q?R9T/2cMzF9Q4MtW8H7P7uSs5SaBIBy3WbUXGeZOVU8MHAveYQm1x+NjL6AtX?=
 =?us-ascii?Q?EBbNoyu2AEv0a8poe7vCla1LYRvOBox5dtx5ODgKL2C0E1V1IFqhIkQ0oVuO?=
 =?us-ascii?Q?/ljbmNdvZJ22ivI0Yf8C5dDnn3tFdBv2uarkot34r39ubxPK6fRP9o6BRogW?=
 =?us-ascii?Q?NyKNGNiUCZhWUGfX+v+jD8CPJHUFUepfbzqg8oN3yYRQdUKDslWHDgOBZpI4?=
 =?us-ascii?Q?9HBTgBzdG6rt9XCbO/wpKq6qV6BJ07+k/rnOWx9vHCfJhC1j2JXMr/O4Es9L?=
 =?us-ascii?Q?eoieuBvskkya99WQzof8SxJkZtHxCItW5jYXnXJhWxa+3IqYj4jYgPI4+BEu?=
 =?us-ascii?Q?h+iBTcc290S/qmbWLnCdJJ0fgwxifSEc89xfU1Aht5IT6fcKi6xXtByQEtla?=
 =?us-ascii?Q?KADo9hPrkqf8fZgEPvpJI2KPRRprec3VrfnTZK2mosTI1AgKUr/+uxDFGP2h?=
 =?us-ascii?Q?8FmY6vvAs4+sYf6Q6OPPjJn+l6Op8mKaWrfJurrjQWL4QCdwBq8ct0TRFowu?=
 =?us-ascii?Q?RpkC0ewk6SjyPXFahNyI3oKOYE4ffGIDP6SPY3NLEPs5upxQ+vrACJ67RUxX?=
 =?us-ascii?Q?IXhu+l+aZp4J0uuoD/a6tV9TmZUAxRgVKp2ii/JTFkbN6sKBfSs1qoLYtZIg?=
 =?us-ascii?Q?irNn/Zdx4WJEqx/hyNAjB5Tg69HYMzposDvP4BSrP23B0Zc/AF6nc+HKsDjY?=
 =?us-ascii?Q?y+ac5J45s9X0B4zPc0veo/+jeuCCRMU0JsX8VneF/6P6gFdvWgu13ZDzPDCQ?=
 =?us-ascii?Q?mmrbSRLswrKs2EprgNt2Xadci3s2vg+DNxzoE3HQK60SsCYAPLsWWA9DC7zM?=
 =?us-ascii?Q?SPIc0MP2UNuwbTH6Lz3zuilPLLmY2WLCZvJ7uMrMopt7jWZvLbmjnMIb8pe/?=
 =?us-ascii?Q?I65NUminZ+hGIwetyex3V6ve3D0xHaV/O9nLK9vfIaqnw1gpjr97zE3fG7tA?=
 =?us-ascii?Q?y4u2Qix3kDupq4ha3BLBQksSvgm8nHfxsAMiacPxz2UiKt7Ss6cwvUa0vH8m?=
 =?us-ascii?Q?SQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc14b91d-5879-4f5b-26e2-08ddff03dfcb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 02:57:29.3687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EGk2L2DUuFixyAif3lQtHDWWXBlF6AmcXE7e668JR9zacnutDYv91X4lA2woGMd2spbldNBydgcPZtaNdzEY0/EnKja5c8fANGiMKvbeykU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6445
X-Proofpoint-ORIG-GUID: SdQK39kASxAJX0d21pYYSmjWxKlakJOe
X-Authority-Analysis: v=2.4 cv=cYHfb3DM c=1 sm=1 tr=0 ts=68d9f59b cx=c_pps
 a=nW9vh20j/mJxMPy+qbWKBA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=McLmhcULq_OhQfsdZ_0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDAyNiBTYWx0ZWRfX+csQ+jGqUFvi
 KIZOtm+/03xSDhVYSrtpeMp7JNj0lBxt8I2sC74CqtYgl32J2Lij/6N+G1YrelBN645FS/z6qIY
 FX1dWsLhI04H8qEyRveuyg6F1lvSgK2zOexiiH7pHsDIsji39mE1wfOVPlKSmVFtWfFdl4UMxL5
 AuUQBJQV3wdU7r3JdSWBAhZyi6I90pDnaNIFMXOoNoK4fyKerjaUllOlxVMdF+EClAHOA5hyVWk
 dXglZQ6lwvahPqyBfcsxzJbpa+k8f+7D7xRe/D5FvpylBZX6TiWaKuKeWQqMaG86IASeVg2p/5C
 cpNCE8Ag26nz15sPaPv39R8VBovH5tBCLTGzCtkRt3UD6FAMQa9tDwXngYVJIyd9MowvHXIAt4c
 uKMVDKcJw6FXHX+sXmJB6qAsbSVNHg==
X-Proofpoint-GUID: SdQK39kASxAJX0d21pYYSmjWxKlakJOe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_01,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2509290026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 02:57:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224110

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Remove all previous .o and .d files from OBJ directories before
running do_install. This prevents stale build artifacts from
interfering with the installation of new binaries and modules,
especially after GCC upgrades that can invalidate existing dependency
files, such as:

make[4]: *** No rule to make target
'/build/tmp-glibc/work/corei7-64-wrs-linux/syslinux/6.04-pre2-r1/recipe-sysroot-native/
usr/lib/x86_64-wrs-linux/gcc/x86_64-wrs-linux/12.4.0/include/stdarg.h',
needed by 'zlib/adler32.o'.  Stop.

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index 449a75ebf8ab..59f1e936eff9 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -96,11 +96,6 @@ do_install() {
 #
 # Tasks for target which ship the precompiled bootloader and installer
 #
-do_configure:class-target() {
-	# No need to do anything as we're mostly shipping the precompiled binaries
-	:
-}
-
 do_compile:class-target() {
 	# No need to do anything as we're mostly shipping the precompiled binaries
 	:
-- 
2.34.1


