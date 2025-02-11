Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B798C02198
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 02:00:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2295.1739239203787826321
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 18:00:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4137ca8e2b=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ANs3Fs006719
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 18:00:03 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44p7ns2c8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 18:00:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vFHabWRm36i3UwmoFUdrM3jRMOcoYX5P04wFy831xIa75sKsvnCXFCdcccAnpMegKmZldCaQQh5IAMByrZhgpi4glaltTAA2czf/XQYtXu+UL56mad+WZrmlWGZNvl3zW+GsK9la33dw13WeDOb+tIAtlW41TQJjq3V0mFPTQvnqQ0ZihSaltK2zi5wgRUipQZZDhDchr93x9PQW75gJxKHWqhy5morNuFImNnc0dppmcEO0QxC+Sdw8li3sIcQ6udhJgw2vbatMdq8aPX/cQqdEIJ09zkSDI2LbIGiVFRgqBZODVpvyONgSepf/zYeSSHNdi1Hz9ak4/naQH5GtXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgJ/t53ILiOMz4SnKwBqSg4Nhpxp+6OgeCnzRMlI/2M=;
 b=qiQgJ3n7H5cHxZKpmzTIbKDFIbWJnGpFSs3aiBszO4wqNK6QKI6Dn1sgU5oesN676jVXwe7kftMZoVgdovjUpce73rKJCPyelFiOT7lDsN1otIh4O7F4tMOi6GOufIrgLB26aWQgb3+m+fQlyGtpZ3YvVqBmFXHNJkhRT0mAgruvJ/QUxP20prsMUjCfwTiBa09XJGWQjzWx8I82tb5NPtJzsEh1jY1YP6dPka9yzBQlu+ynCOUFCDKW832a23/VSkONWygoOJ73+urPmoYdQ9B5P0taWs50nMUlnRWw8IgwknXhTaJPqMi3y5CT4FppgOXZwLrbgDqNomybdGzI6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by IA1PR11MB7247.namprd11.prod.outlook.com (2603:10b6:208:42d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 02:00:00 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 01:59:59 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] glibc: fix header file conflict in case of multilib
Date: Mon, 10 Feb 2025 17:59:49 -0800
Message-Id: <20250211015949.1197510-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0046.namprd17.prod.outlook.com
 (2603:10b6:a03:167::23) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|IA1PR11MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: 051ba1e1-a25e-4bd2-5b2e-08dd4a3fca81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?W9IrcVQVDU63Y5WIKM6hjTeT72/30jKezBMdybiKJ9+ZsNOwQWOCHp8h8G6V?=
 =?us-ascii?Q?yuNwB2ewinSLlibztB7yS5McNiTYqP07m8t+B5orOfthZixZ6/2rHHS2ai+S?=
 =?us-ascii?Q?zo1aq5zzFv9KSdP+tGAD9sgoFu9zQSj3EdEd+t0GGrzGyWM6PdMoJ/5G9Ig1?=
 =?us-ascii?Q?69kvlijm36BzFRJRMQ3xiQjzo8ebyx++mmhI7pYKH38zKPsv5Cu9nAK4+lre?=
 =?us-ascii?Q?t+eo4ks1cpeVt7AxHNS/R6Fn0M1IJJWrvlBmpuZXs+TmLajxDPjBxbg+KMxn?=
 =?us-ascii?Q?ZXqL+jLJF5h2iRgnyJVlMwo4tMb2pp72Jzt8Hxx682n1Bqb6MHNMduD6TZBP?=
 =?us-ascii?Q?bziATGY+VT7dnyKK0NLiVjGco2L0uXEnystfilXysUJf2sJ8KmF5ribiS+OT?=
 =?us-ascii?Q?XSIp44dWJGLPV92SsEQjfcDmqTtB8qrl2ZuyKUJhaP71Ynxm4Aka60MhXCBA?=
 =?us-ascii?Q?FB30WlS8ynoVvrTIljeoGzF/EV5OXZsHGyGC+GV4JNy0Q3azukxvdjyJJcFU?=
 =?us-ascii?Q?XdomeqdJwVIYQBWqfSnUM0t6G6e7FbMnFyBLEShGU8AXlST/piN1WLETUVkc?=
 =?us-ascii?Q?iDw2cVpyarXoCqYZoC8xIiTN/2hzwTmbDWQJGhbB7ukJ3pFd6Ch5p93bKiwi?=
 =?us-ascii?Q?OlC3fSnfpxV6+m4Zf9Y/zspTcaCSOw6Im3StON4QkcqFMdte8k1z/J457I6w?=
 =?us-ascii?Q?qhXT+NmLfz7e7zzh2FzNqXBCPyy1DlueYqfv6ANlUHNEpz6mbHSV9KADW4kx?=
 =?us-ascii?Q?JQgc5zlqpTREDABpqZ79swaj5WQRc8FInesAncqtpbtW4JLOj1cCCgDZx4t6?=
 =?us-ascii?Q?DB9A9aWjeegOUxYseU+omDt9MMSaOu5dp2Bt7IReRCnvmkkUoWyHVL9aECkS?=
 =?us-ascii?Q?lCgcNNAwJ4SBpWzJ8qLElDbkmxiBxKAdgRbEP+PWPTFy9+3lJ2fzkrnRAITo?=
 =?us-ascii?Q?O/WZJZgB8a6bmUbYCjPz3VNjRmDs0t+fmJMw2s5ix77c17edI6f8rgVK6o4k?=
 =?us-ascii?Q?2eB+t4dcWokwHIof+3OE6P2BTC45BaMVmJwOxY+8Q80jqjvEbiRjcvzANLxq?=
 =?us-ascii?Q?SWRG3Z33avjpdcNNGsVHLNNfAlRc1aucE5qIdJVKnUzJJ2VUek4HXreLSp3d?=
 =?us-ascii?Q?81C9xYrokn98PHs3lHu2O0Rr5i3E49a6hJggkR9emdBjcfQ3J+EMdVdd+5B5?=
 =?us-ascii?Q?oNZgWGd2jiHWqbWuWq76JIvSdlXMcJg9LePbe6DuEZau53pR65Gx1FyYRHFL?=
 =?us-ascii?Q?+iJyLpvMiIZSFbcBUEm8MAfgtHtC4LkiiqIQ3R92EQeWBXHrHrpL15iSitRd?=
 =?us-ascii?Q?fkFG6ZrDbr4Gs3XBdANDZRdH4pvX08zuUnrKRVveFxR5fApFOK/oauyZCqvV?=
 =?us-ascii?Q?vcCmJpEAuPrtxVJb2TRqwI5htE1Nd5hxU6cSrFTkFzp5hod+XTCM/61uTljv?=
 =?us-ascii?Q?XwOkuElsJq4eXmgBOPmShWJyDrksFC3y?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8jo7Scoh4I53EVj4kekOvC415tTJIZ1pRPRVWQErw4nktSm38O7Yt3r+LsrN?=
 =?us-ascii?Q?RpKbzW6yf03n9vM0yWuPReBn/lxKEN3ygnZUyQGQq6wzRcqoODsksoi0KKLi?=
 =?us-ascii?Q?1oD9N21wrfE3rgNQ/vkaDil6lE/ieHJ6om+LZ+liWb0jEnQx2XZ+i6kIOeAk?=
 =?us-ascii?Q?PpvtY70c5OdOjqWSK0sP/03sUB5hzoAW/1hoTPDNhdgmTCpysOqyyievhV/+?=
 =?us-ascii?Q?vHjZ8EpQJSV9ET4O65seCJfNBKhnn30QeKbhmsa+E3a2jAzivJ7vTnpiKGGc?=
 =?us-ascii?Q?T0nBtTkz+8qGnxyYGglXxmQQcTd77yXNm6H4ab+2ZbrIzhR8o/UjirJiGTYy?=
 =?us-ascii?Q?ToSiUWCAKHSuk9ubuo38LmckdhOYcgr6+WHPxPm0fi4KLbVtf3yjCeEBq/Ox?=
 =?us-ascii?Q?AGcTgm5orDVMymH3NgUR8GfHClAPAk/hCrMJi4MBvUm35eso1VKdzhOR8meM?=
 =?us-ascii?Q?Jp3G5ChKoWIBRNqjUgFLEDuIXJaT8PJSMZw8TsV/Et+AtrrAibx5J4Urfsm+?=
 =?us-ascii?Q?DqdAq1ltITkswlTQEhw5cMllC+Mz1ojgnvIiD8HFOwIVGReHz5gkgQh6qK3H?=
 =?us-ascii?Q?IjKV0ZvckZuYzFqu4YSmimA3U0GAz+dvAhMv4dOTbNzkm9ts8HWs8A95A+2m?=
 =?us-ascii?Q?i/uf/laV1gkjIFx46TQJDzHhIdqluZex7R02HKCuO7jEVVBBgI2NMBF9ngOn?=
 =?us-ascii?Q?r7w+fjNSQ/0CvbbvTlpPqPeL4qqJoOx7NTqvTN07xfREOD3PESGPFL/5xHYS?=
 =?us-ascii?Q?sb3C0FerE+8FT/e+a9+FQb1Emnji1sB6j0p74NBnj+VBY4shGC6oE/GRlQ88?=
 =?us-ascii?Q?h1INIVmBZRatqC/NSsV/cvVQUiBCnrYhGKCj6KB2YxB7Q/t5yDMrJ1CEPjTj?=
 =?us-ascii?Q?ugksi5vgNXLHkJ0hfGRelmbCk5/n8D1jXGOz+HDtnoQ7LCzGoa3xwwqPwHCv?=
 =?us-ascii?Q?PziGePgNl/aqTdrmM2PgJb76HvvmZimPThGzkZ57NLWiWCFjnd2/CDKFDJ0l?=
 =?us-ascii?Q?v60C+5kV69hb0xO937VzRCCoK2BL8R2d8KfRrdkIKnBlu5Wjm3O1tRJn1wCZ?=
 =?us-ascii?Q?uiGIa+bmWKGJqJqWGMY8prdmTYMUDJptRW+AfO25FbNCP7wQGYDF7MZEFwll?=
 =?us-ascii?Q?rjnJ/fPGd/7k6WBGK51BtV+n+FFZQ8PF217gQL6KKP0odwkLliHpS/V5mwJc?=
 =?us-ascii?Q?Z1rCCX5yB5XpW6axDzQETTspsGPLfYdk+tCP5V6Nd5ywMhVHfZPEZGQc0GED?=
 =?us-ascii?Q?A7kueVBCIF+7XlNIXidXduLjRgpCaOuONwgnvazyu7DdvVa2Q1/QJZVl8y0n?=
 =?us-ascii?Q?inDTy4pJI1HsQ6HgW4hzMTpxAJrf12P6ubVahbKKq0V/kq5JRPtnwvQhWduD?=
 =?us-ascii?Q?g+4nK/t252+nRGHd84Q9E/zs8VyQIZ0L1o+dx2hac1kXvdpGb5qBlFMMwiwG?=
 =?us-ascii?Q?5dTInZ4OxGFEXqgLuGI2sr9tamryvmv+sM1Ql4W/ZI+Mm19kUjK4cvzN7Y40?=
 =?us-ascii?Q?oN4VHfIjzLoY3vCvokAf6Uri73D8TpqTK1hSbw9IHNQqDB/ksAplYzOq9h7f?=
 =?us-ascii?Q?eN0g+8jCXe8UF+QCQBqXMffKJ6rmP0YGOtztdXgog6rZFTaaSMG2zFc12+z3?=
 =?us-ascii?Q?SA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 051ba1e1-a25e-4bd2-5b2e-08dd4a3fca81
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 01:59:59.8268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrD4LwcYwfMle5+oFEA/7gTHKVbFSZSXDZzDnfK6j+UpDjI6HUg/9s92NELs2obanYPvxUibC5QoOH3WaTDdHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7247
X-Proofpoint-GUID: hQeomJ4ODM-O278kEi2xCZwr7dk2co11
X-Proofpoint-ORIG-GUID: hQeomJ4ODM-O278kEi2xCZwr7dk2co11
X-Authority-Analysis: v=2.4 cv=ULwnHDfy c=1 sm=1 tr=0 ts=67aaaf23 cx=c_pps a=7lEIVCGJCL/qymYIH7Lzhw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=BUnYEMDkf738sqtPpc0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_01,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502110010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 02:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211123

From: Chen Qi <Qi.Chen@windriver.com>

When enabling multilib for qemuarm64, populate_sdk would fail with
the following error:

  Error: Transaction test error: file /usr/include/bits/indirect-return.h
  conflicts between installs of lib32-libc6-dev-2.41 and libc6-dev-2.41+

The problem could be reproduced by adding the following lines in
local.conf and then run 'bitbake core-image-minimal -c populate_sdk':

  MACHINE ?= "qemuarm64"
  require conf/multilib.conf
  MULTILIBS ?= "multilib:lib32"
  DEFAULTTUNE:virtclass-multilib-lib32 ?= "armv7athf-neon"

Use oe_multilib_header to handle bits/indrect-return.h to fix this
issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index bba9449d34..21f2200d19 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -88,7 +88,7 @@ do_install() {
 		rmdir --ignore-fail-on-non-empty ${D}${libexecdir}
 	fi
 
-	oe_multilib_header bits/syscall.h bits/long-double.h bits/floatn.h bits/endianness.h bits/struct_rwlock.h bits/math-vector.h
+	oe_multilib_header bits/syscall.h bits/long-double.h bits/floatn.h bits/endianness.h bits/struct_rwlock.h bits/math-vector.h bits/indirect-return.h
 
 	if [ -f ${D}${bindir}/mtrace ]; then
 		sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' -e '2s,exec.*perl,exec ${USRBINPATH}/env perl,' ${D}${bindir}/mtrace
-- 
2.25.1


