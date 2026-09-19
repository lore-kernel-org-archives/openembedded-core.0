Return-Path: <daniel.dragomir@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F2EC982CC
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 11:13:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10586.1789816430569467586
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Sep 2026 04:13:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hqkCBsQc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3722d36381=daniel.dragomir@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68JBBpb0095441
	for <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 11:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=RGxS+rgup4lieOZcmYXr
	ddzdFpTe8Qs8Y+dxQYT7VpE=; b=hqkCBsQcctSjyhhRTeYT228kj4w3x2jwzgZF
	sI+6P6rqSBX3wovJIMQwrh8NKJYdNc0VzdRxqdk2Fa1Z42bFFWI9g/8cysMvkllH
	3LhamaoJZFuI/hrregBySQLubzR7es0xWvIXJXpgafXostURD1n8/y5SxJHRih5B
	D+rHqGRZ/qX65cBVSJuqjFWw2Q0HwuiiDLrfJpq4cQKwjUXnHIbHS4zJ8X73xFN+
	djXBpNMKBGPMC7EqroS/6NaKvFQWkNgPhxY2Rx6nOjD5JFBJzEvYt5j+aCRUw6+T
	c0wxPO2G9MlGci0cHPXreu+lLuAekBCnqCH8koTjTWNPS92K1g==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022113.outbound.protection.outlook.com [52.101.43.113])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gshc7gau4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 11:13:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPiKysCC/U9usi5LljaPdIYsIOPeZlEcQfVu7wzKGy4tl04n7jwWYxTvbM06ax//HE5BhpZwolDh+PYbiyu8STDjya3gdHkIgaZoWfh1RMkySiNbKYlKURaI84YcaYj3MPdMIiKrypammv919rdIjMdc8sLRKhm95l0dsE77MRPsJ+qmQz5wBe0hNofrkA6DPOfYB1IpiTufDpDx/U1UXke0JqMAjz7Z84wnvCMB+O/PHyWFLwWnxwS7XZK/Ibb9BJe3YLzt5ernIcZ1zxA6K577MOyKakP05hhxiV5SV2aN0mVVgpnVMssvKXPEVQHTWKCrpl6i9NjcALijE0nC4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGxS+rgup4lieOZcmYXrddzdFpTe8Qs8Y+dxQYT7VpE=;
 b=cx9jAhy0m76wg0MrrWrAqcr+OeJNEMtZhwPWuW3Wl1wiTvUmWtgKhZTQRQCG0w4hxtd9jMQX9if+AfAqZ2PR1kN7SeYAWYoszmAAdZc8Ssh/J7iKRhHvsZ4x+eaVOrRbRusNxpdmIaKGMxd/iQUAl2gyoC2OicmjotE5XJGpUWqRpx8iZQKZTBVTpxxRt/SWU3U5qFH7zSzSzqa4FzCAJPXQtonNZFToZNf8R2TE5gnkjXfNx532BfXjyBV49UNO/eGHIZf0kOkyl44HXNUJyQVil7UpWPZ4h1tefTfyFsbIRESjQ/tN5Z+31ZPQ4aM68jYJ+QOcN1RvKwXhebLq+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN7PR11MB628000.namprd11.prod.outlook.com
 (2603:10b6:208:5f2::11) by IA0PR11MB7401.namprd11.prod.outlook.com
 (2603:10b6:208:433::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.15; Sat, 19 Sep
 2026 11:13:45 +0000
Received: from MN7PR11MB628000.namprd11.prod.outlook.com
 ([fe80::9c22:d06c:c830:3a83]) by MN7PR11MB628000.namprd11.prod.outlook.com
 ([fe80::9c22:d06c:c830:3a83%3]) with mapi id 15.21.0428.011; Sat, 19 Sep 2026
 11:13:45 +0000
From: Daniel Dragomir <daniel.dragomir@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] toolchain-scripts: fix kernel host tool builds broken in the SDK
Date: Sat, 19 Sep 2026 14:13:24 +0300
Message-Id: <20260919111324.66848-1-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR06CA0108.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::37) To MN7PR11MB628000.namprd11.prod.outlook.com
 (2603:10b6:208:5f2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN7PR11MB628000:EE_|IA0PR11MB7401:EE_
X-MS-Office365-Filtering-Correlation-Id: 5787663d-c30a-4888-8a4b-08df163f124a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|23010399003|376014|366016|10067099003|11063799006|56012099006|6133799003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	OkG/zRu2G0hiG3/efoi0hXMiO2Y5Sv8nu9T3QSZu5d5VhdxcwQVPP/QOS5VzBki74gazsu1sfZEpf0BZZTSmEjRJV4hKzvue1nMgjMBKpTBEAfvq4e0d82Noa8EnqIlolhWRzYi/vvidFvgBMFr7hp3aOm6yQyj8eSfwWRf4Ayf2SGdmMWNRbV6KXAdAs741wnvTY9VLH2v+jefoTEjMm4Fv9cTix5/FhprQzwODpSOX1cdJ9DOK+WYyxRWPpZZPI7RuPYdfAGd7dDyUAJg9H4mquf1a4YeKMSxiZb4Cv/h22OcFkOz8yi7G6IwjWDMOeEALiVO8waEc4Zjfm7PuR8apI5ThLr2n2d93TEXJLmZNFzj4Zo4CuiNpS3/KiGpPvvy0en36iH0tu68ZNN8XjOsOVxLkiRXEIgcOFG1UBRWdviwkKI86IuGL6X5EOjDlMKF0gOtR04aad5iJznBzAH2zRCzjAM4Y1VBb+8rxPjpzwmtK6sL4aNQf6oD2Xc2MLF4tEQY2qOzxXquLvA2h4CR1WZs22TlBDNB23kcRwIMnHFxF5nU8IcONgtrKd2G6iEBDpuHNNsVhOHsVqRXks0Z37eVmEOFtt//vbh2PftW1SkgVPe2bJflNdag22Y0r9eLbl9eH1626COvL7emf3b30TG8tjSs7A2fYxTUpGQ3XYOfDymgXUa8810n0zl8wjviCgiC8qcO4zdgFO3smqXdxMHv0U3cyu19bM7ey/jU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN7PR11MB628000.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(23010399003)(376014)(366016)(10067099003)(11063799006)(56012099006)(6133799003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6G8/ZIAg8Tab091FC2Se3RJcrldWnosm8gUlUBEDBSlsFi6CE/4O8J+4bXf0?=
 =?us-ascii?Q?spZ1w6Xnfnphii5Fn8FRRvDU5fyibNZ5zhQo9CUWm8pIPWFtwm7V7h7TGrAj?=
 =?us-ascii?Q?sPV/6rXqwNzIhWIDcpne8Aw5PGl7gY2gfj3IFsOlg0Up80vieGX7QxDi8z03?=
 =?us-ascii?Q?pWj0zmIycQl9RgELSGTDDujRO96kxE+Xl9s0iXLO6YT7+bOiNSacWOmpT6SB?=
 =?us-ascii?Q?LtRC87ViRmMy+aqJIYVYRx7p8boXQGBFOCRfEWPF40jqBMAwUiQVv77NI06t?=
 =?us-ascii?Q?/1uxZnId6xm/JqW2tAMo8aomAkN4vImr0+rHac8ZkILcGpwhzy5o3apU0CRJ?=
 =?us-ascii?Q?Mmt4+tQ0l4phKnxjRQTDkpetjBRCVWf7QZpHKH/Q/IlZwiyLtLTBW2lNxzZC?=
 =?us-ascii?Q?qTtUpa4gYKDeztw+e/1t2ix2gEOV6pFdtbyVo5/DDFaCLhIa5586kPftk+md?=
 =?us-ascii?Q?xKNq+YABnAu7UiDWzwM+x/LbkEZIwLgaPBYlwXkfQ6cyJ76L1YWdW+kpUFLQ?=
 =?us-ascii?Q?/Q7xGLOEGxYd3FUiZuPJLPLFEnfn8RektO5GwvkqbQa6rVRHiYf+BFLQ5jH4?=
 =?us-ascii?Q?QeIDMg2T3h19on37z27d71oEBqpBxLwhdVsCi+iMPKCE50WpEA1pliC6pXjP?=
 =?us-ascii?Q?G43hC2eVAPMh7H2ftgD533KJ2FOblBmwHeXWMth1h97UioPbJ46D80WuxoiL?=
 =?us-ascii?Q?Sjz0TIT44yQun/yTFyqEvuot1+xIYP+e4UL62BsPTVoWGy0XPuPwYswJYEsh?=
 =?us-ascii?Q?QgQVEXYskdlxEbLCUXuuNyui2Ojju/wcYn8D4NHg0YsQpw27vYhDk0knKaAz?=
 =?us-ascii?Q?gUBRz4upiXVT5CPC9qIMPlFwhzG3UU8jiiHZRnO/GDuxL42ZBs/hh73kXiTg?=
 =?us-ascii?Q?xTod/BYXreHSApa6NrD6tStZNeSRV/J/5sREDpc2eGKvkANcYo8bJrjyOk9H?=
 =?us-ascii?Q?3HBWjk7udZcfIAHV17xpHNqCn3goY6bbOo5KLclvN4ISfJK8qkrYq9V45DMD?=
 =?us-ascii?Q?gDt0CqN7s2L0kg/vNPBNCrr5ElXD2s3FrLKar2G9kogylRLVwoNP9L18G4xD?=
 =?us-ascii?Q?ZbfZhocRI0p/ReYWbGqxARJgaGLTaOzwa2odc3pF3asJlzxgpjNg44Fq7gzg?=
 =?us-ascii?Q?CG1M9uROjYBYRs4Tj/EmO/seyq/a3REEOkn2dBBfo0SHyupi3zZ1wrf6Kto0?=
 =?us-ascii?Q?YkMXFvkjLZEi2mtiTncJGr8X8Hc+gY2/ZWxapu+av5R3CNBGycu7NOossxu7?=
 =?us-ascii?Q?aKJl+XNF1pRzYyvFj64mdn6iKt8BUC5W/y9smb779I6zYRk9RYHTwyJqVIF5?=
 =?us-ascii?Q?wRb0OLJYIN1EvPwjAn1KZoDzl5iXHbEm6sqSu9jH8LwRLxIdVAg6WPxKvNVU?=
 =?us-ascii?Q?VD1QQDziVwRmT9XSwukJi55urmCbD57D0Q91jADurBarU420ZhpZ/Ifrt360?=
 =?us-ascii?Q?p2SuRAeVaTH6IPq7EmurBws3muaVzW0vhovyYWb/s5R+AzRafadt4jwy3vT5?=
 =?us-ascii?Q?GVj764hr4FYCLJXOLYU71FfkBYFOYCIxbAtSlz5nLEeTYYRm4hXbn54iLS1q?=
 =?us-ascii?Q?BBK1zULJ84jdY2kTAC5sLt93uPY7amXO0gP1HJLSyOCtetdafE1IkR49YdKd?=
 =?us-ascii?Q?ccvVNdDd/lK3JKDr7vYaiH0y1vvUJW+K1UG16iuFBJ0gATUBxd/mMstjbZ2e?=
 =?us-ascii?Q?xhunnX18paz8AfRPXVYEbH3EmlhaafR5orCfgEGSHr701AtrHWmOtdRplWQH?=
 =?us-ascii?Q?LyIUI3u86veCA1SV7HUBp7Itv2yIjm4=3D?=
X-Exchange-RoutingPolicyChecked: 
	xnpVcIzumyENgsfitQeQfZLdDPoyIbi1xgBDQsGYPmp7PQ/Yu9gL4owAHa27v5GH4YHbbM0fC0WcI31PQA1/wCX1XLUlL7y28H/WqZlL7lE+d9IKEqYayhvrc35rTNGEiRm72sEnwpsoYYneIzu8AYlYp+aExdGQms5igDGwqoBUbtFDzyuU1F99fxlOmltQXBqBjgSumqZ6khw4Eep//2I05ulzePUu5atQQQniMob032svXKj8zs0KzMq899cOY1qic57P/kUjKTIEo9MC15T/zRJklVjvdfFT8Ko7tWoRPtujPfGz7hw3UCBCRjUfzawhM9BGzbrN+eEbVque9w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5787663d-c30a-4888-8a4b-08df163f124a
X-MS-Exchange-CrossTenant-AuthSource: MN7PR11MB628000.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 11:13:45.7161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CwKtiz31a1NXV+oW8Qx+fSbFvLnDMEYjwJXtLJstFnUg86f8swUxF37ulT4UG43NQ9OP+wDOBiwDFbIDUPaCd3Pwpp7a2hfTzoDQFz9Zqa8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7401
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDE2MiBTYWx0ZWRfX/0yG7hgF4D7t
 68aD5cus/H/38cPWcfu9KSdc3UW91bIqRY/WQjE8xFW34Khl4goEM2xo1IKCSHsFG1cf430J2P3
 DvGQem0WO4wpHoDab9RWPfvG8IVGi03mvxQgpxb52+XzdJqOMeVad68XhL76HJiFdzR04s8oZaw
 kdeHZAudrfUzXUSIPqM7ZTEIdlv7Z6qh1Qk/jUCbsBJGFUyu2kI1kc9G24Uh+eO4LZiW3gz9iDY
 KQlp8vdH6esniXRXZGvs/Kxyl7UZXo/d4TVWa1SFzlStHKxYFYInGiFRewGG/OtT39UQEqy4Fin
 tehDl0WIIPxevKuX83XwbEBQl0GdZFvu8ACDtTHc2QS2L+JLUY1FAzuJ2xzHruJbnVrqVZ0tM9J
 ILDAF4LckVGLJNG90AxNglbvJhOYxmuOG5q54hIall3S5UP4zsfyQo0rErOX2tf3z9U9/EJs7+J
 Z4UXBC+A8NP8NnUP3yg==
X-Proofpoint-GUID: Mj_Ixf7pwFJEzLI9UrgKGqEJ5epPjlG2
X-Proofpoint-ORIG-GUID: Mj_Ixf7pwFJEzLI9UrgKGqEJ5epPjlG2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDE2MiBTYWx0ZWRfX4e6HqhvGC4CK
 D6NbhlbQhfmdxC2vpTCiR4MVShkVbp7q68H06haXs6Y/BR19wXio8aoGlaHLDspJEi3bGZL6AK9
 8/OAjXO43m3Ro8ndIWIXYmK2SacTgcTpDrmByPSTplk3JkDIo6oc
X-Authority-Analysis: v=2.4 cv=feM4WEQF c=1 sm=1 tr=0 ts=6aae6e6d cx=c_pps
 a=6opEo9M2fWe+N/0KKLrvTA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=MEhKQXDtAAOrrqDgL1YA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609190162
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 11:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246234

Building an out-of-tree kernel module with an SDK fails while the kernel is
compiling its own host tools:

  $ cd $SDKTARGETSYSROOT/usr/lib/modules/*/build
  $ make modules_prepare
  ...
  /usr/include/sys/cdefs.h:486: error: "__attribute_const__" redefined
  /usr/include/stdlib.h:219: error: redundant redeclaration of 'strtol'

objtool and the other tools under tools/ ask pkg-config where libelf is, via
HOSTPKG_CONFIG. They are host programs, but the SDK environment sets
PKG_CONFIG_SYSROOT_DIR and PKG_CONFIG_PATH so that pkg-config answers for the
target, and that answer now contains -I/usr/include. Passing /usr/include
explicitly with -I makes the compiler treat those headers as ordinary headers
rather than system headers, so the warnings inside them stop being suppressed
and -Werror turns them into errors.

Ordinary applications built with the SDK are affected too, less visibly: they
pick up a redundant -I$SDKTARGETSYSROOT/usr/include and
-L$SDKTARGETSYSROOT/usr/lib that they never used to get.

Neither the kernel nor the SDK layout changed. What changed is which
pkg-config implementation the SDK ships. pkg-config dropped system
directories such as /usr/include from its answer on its own. pkgconf only
drops them if they are listed in PKG_CONFIG_SYSTEM_INCLUDE_PATH and
PKG_CONFIG_SYSTEM_LIBRARY_PATH, and it compares those lists against paths
that already have the sysroot prepended. So the lists have to hold
sysroot-prefixed paths, and the SDK environment never set them at all.

a3320989ca ("class/pkgconfig: use pkgconf instead of pkgconfig") already
sysroot-prefixed both variables for the build environment, in
pkgconfig.bbclass. Do the same for the SDK environment.

Checked with pkgconf 2.5.1 on a .pc file inside a sysroot, with
PKG_CONFIG_SYSROOT_DIR set:

  before: -I$S/usr/include -I$S/usr/include/bsd-1.0 -L$S/usr/lib -lbsd
  after:  -I$S/usr/include/bsd-1.0 -lbsd

which is what pkg-config used to return for the same input.

The native sysroot directories are listed as well. Setting either variable
replaces pkgconf's built-in list instead of adding to it, and for
nativesdk-pkgconf that built-in list is what currently keeps nativesdk .pc
files from leaking their own -I and -L into host tool builds.

toolchain_create_tree_env_script() is left alone: it already passes an unset
$libdir and $prefix to its own PKG_CONFIG_PATH line, so it needs a separate
look.

Assisted-by: kiro:claude-opus-5
Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index 8c062ef0e7..3c1ceb32bf 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -63,6 +63,8 @@ toolchain_create_sdk_env_script () {
 	echo "export PATH=$sdkpathnative$bindir:$sdkpathnative$sbindir:$sdkpathnative$base_bindir:$sdkpathnative$base_sbindir:$sdkpathnative$bindir/../${HOST_SYS}/bin:$sdkpathnative$bindir/${TARGET_SYS}"$EXTRAPATH':"$PATH"' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >> $script
 	echo 'export PKG_CONFIG_PATH=$SDKTARGETSYSROOT'"$libdir"'/pkgconfig:$SDKTARGETSYSROOT'"$prefix"'/share/pkgconfig' >> $script
+	echo 'export PKG_CONFIG_SYSTEM_INCLUDE_PATH=$SDKTARGETSYSROOT'"$prefix"'/include:'"$sdkpathnative${includedir_nativesdk}" >> $script
+	echo 'export PKG_CONFIG_SYSTEM_LIBRARY_PATH=$SDKTARGETSYSROOT'"$libdir"':$SDKTARGETSYSROOT/${baselib}:'"$sdkpathnative${libdir_nativesdk}" >> $script
 	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
 	echo "export OECORE_NATIVE_SYSROOT=\"$sdkpathnative\"" >> $script
 	echo 'export OECORE_TARGET_SYSROOT="$SDKTARGETSYSROOT"' >> $script
-- 
2.25.1


