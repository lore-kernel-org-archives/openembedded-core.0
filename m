Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF3BE7E371
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 11:07:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9480.1775214440211920406
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 04:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HlbqOLG+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8553bf50dc=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6338CKoE4182407
	for <openembedded-core@lists.openembedded.org>; Fri, 3 Apr 2026 11:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ZZSnuh6S5Zo0n16msieO
	ohXnE2yC7lwrDkEBXz6qwUo=; b=HlbqOLG+ZVN1+5cPqEchspBIt0pgnoqEDoY4
	0tuf8Wzie5H4iX3wyuKdAXEnCTh93szbN5fFBMfWsqG1Inqdfy7aEgE8We/8nQAW
	eqnJJGMDu6edzZExah65UyQC5vNp3DAEH5O+zvsjeGNaxLuqNYwpzk6y7gbViMUl
	rygvJR+mMT4F3RnKYBFtmCA9Fdtd8N0Jc4Mme+yOL0vR09czmPZLYjJIFpSakeRT
	mtV1+MTTvaVA3uAZ/dz0QOQC04hRsBxiccUE3tBkPLCSKdSzPRwxnuHsCL+D3fnG
	z4Xksig+IyFMJBZuJnKPdnODlyEm0ze5wCXagXJhHOsXMbwsEQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010004.outbound.protection.outlook.com [52.101.85.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4da9u5r4gp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 11:07:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y19EzOY/icPo/jOJTc0kBE4niZxKe0mm7d3dEOBkEeI15j5Ul++pQc+ddH3IxjVNPfdaGDWWdSxj9XBlxc8tMAGtgbbLT57rRnJq1Y0rPaX4nS9p5Sed9BjRyXLDFJAaJbtHiaAHAV3hIQGsOb2kTVn5O3Qh4eF8x95/wdZ5tUBWdGln4SMXRZBWTDERmq6F0Bc9iEp/3l9t7UJcZICRVmb7zZ1DNuTCopoxPAJETIu5oD7NTZVgcsLAgbKGAjxXT9OlGVdgvHnyx6ux4UdbMlXgw4Fx7gK+qzilAF/vPmtSG6rXpt8nRLaRhoVlI055xGFWNbxC0pLIGhj5OOOzXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZSnuh6S5Zo0n16msieOohXnE2yC7lwrDkEBXz6qwUo=;
 b=N1/mdde6M5IPnsgzbLsHY+rK3Hl8ectvgefxr3hM5XfhB161M9lKz1q0OYZHDlrdVdBdRLRbKJv8fzZZT1WJSodZM5BYgo+VY46dFLqAFd922tY9oHI0vSvkzs9lyfmM8hVwBsfKgLUWr+WlWecVS6roF/raLaZcbP7g2TzUUfHwgRbKjRL1tfTbkwsQ7R883indYTVXWd2mbLvdJ18R5Xra/BhV+uTFkm+HnNAhxATUBTTRNc3etTzG33xfhJmqRHvyUmpvbD7eDohv0Of3G2XlR2er9tY7J15HtQ6VfWv4dW6HRME2fq9uzwRhGcBhpeL/gqsautx8ZnnyGIVwcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Fri, 3 Apr
 2026 11:07:14 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9769.017; Fri, 3 Apr 2026
 11:07:14 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][PATCH v3] groff: upgrade 1.23.0 -> 1.24.0
Date: Fri,  3 Apr 2026 19:06:58 +0800
Message-ID: <20260403110658.2831196-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0205.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c3::12) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CH3PR11MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c14a874-5061-47ec-a791-08de917128ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|13003099007|18002099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info: 
	YrgQTVHfgCd/IwCMKaRdOX9LdF3UzojwdjMsNQp1ox3gUAn122BGkhixy1O8fcbw9Gp9u1wDXe75eL47hXGHD580fEKXYlFj6yoU7Cjc9qIIQ1RCPMfupJLCeyQvcQsqFDLVK2OoNlLLrxHsKafPKgUspiSDdTI4njMi/vCoouvw53dyslyq0PRRwb9gAGedkLVo/Eq9tVQr1XoWssN2babBjjN2fdEuBZu5hXOT9Kto611MMP0NYkkMz5odIorsoLqgsuktgbyZ9RRLWYZZMtzs1M0Fe+wSSzk6W9PiIv+/ZLA59kqEOyDXY2Vi9YcqJeAteeYAyDbJZrQsPg/e+H6aSIDSh4GRoxz08GZy7e8/yNt3tr1l0pds+ZAvgIDZSWfq6zgehwWuTCFH1Rf+hWFvKrhPOYyBLZo6Fz7A7MhuM1lQDZ64TaZgaW+e+Cm3+DMLJyS3w09S9fCEg4WlhCJzgklvWcD9KFsyP5bLTJQvDlavHei7CvAxvaT1D37JMZbEYpbdQzptZS1I1shXHVqVzbNzoK11cqG24d0TjWY4M44dm1c9NHOWGVaaXI6lahNR327d31d9LxJGcF3u/5XQ8IGCt+pPpZs/9TTFLp2YOsr+InDj50t5CGEmBTaThQ3gP4bjO+Jw6Us9WuWv7TXKZcaahy3u/+lwC3C1masVnT6v9l0Tq87h2lnRDGRx2n0GVVPOPYniinSgHzVYGkWXHYWJf7ABRpMzcS8elr0/Ujnf8Y2Kow3JdGvr4EDF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(13003099007)(18002099003)(38350700014)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kqnvDKuiV6ltzT/5T9L2G13YTmyPLAhMB+QVNJDnkCThRudIu6ML8AN4UpDS?=
 =?us-ascii?Q?25AbZQEuThYjiduVYyHBDZBtKCALn65MgwOrwzSs70x+YOCBFU/n90de5x34?=
 =?us-ascii?Q?tiD7+hwmNich/v5UHKAxiLRDVYuHFcxqMf1V5GsTYR1Kqt26GPRFovxBP+Jt?=
 =?us-ascii?Q?O+OORcBVIJuOCtkIuQzNj7+WhvsGY2dl1RYgQN6ZoWvbz6vRQ+PFxxc//7GF?=
 =?us-ascii?Q?Lmw1+bS1K/dZPy4RXVkcuUFf/yfHadNotuTVsaUr3nif6UQ9yBMwr2fpITit?=
 =?us-ascii?Q?P3h+gZgkjCJrY2FxkObkCpajyjjX1hqXQnvZmS5H2A0ta+vxTKpp2m1KtR+b?=
 =?us-ascii?Q?+W+//8Rax51Hj1dMKnagdESY237HEE1srZI1MpF4zoqaMtOQzy0p0Jp2tLgk?=
 =?us-ascii?Q?S8qHyF7nDc3qM+gufxgxgZWNNUtjIVG/Cf3nPt52ZFc1kGEalgjfd5SJS9t+?=
 =?us-ascii?Q?Su7tInCDT4ngPtcLmtsD0YZ/oK1HRAsrcE5MQVvfMoJFwslVfDRy23JHaujC?=
 =?us-ascii?Q?mEpGn0456JK7U96/BDK1p90U6nlF99YTPpfzAam9kBFExoq4pb3ZZkFZ7LbY?=
 =?us-ascii?Q?EofpbkCnq9d+tmmVIzh+Vx/J+SguCvNSI7BZTh1kJAmQc583pJmJ/Q0vDoBj?=
 =?us-ascii?Q?FzY+ePfvdwXM6712ETx5+WQfywePgAXCZrwvpyJfIGKjPsB9GVauxvz170zN?=
 =?us-ascii?Q?JzGwrjHfO32DDA0H24R0wvMSChmbyr1vVf0YpvdJE3LXnM53rd5TLYXcOffV?=
 =?us-ascii?Q?wrt6Ru97FL7cuy4tW6sRemCiEJrax9vzEsCo5UWrBBIhaILTgXS8ZQBl1P1e?=
 =?us-ascii?Q?rGUwTclW1h6S2QC53DMNlU00VGqvr1QS3TBA2u5h6wWa9n1D3Uh3dbenc+eq?=
 =?us-ascii?Q?/GJKpFO/ZvGGiKG7HwsBJ3UUhqUBIedWLFm2TROSW+onJ7NUHDSthHXjgIuM?=
 =?us-ascii?Q?vOHXLu0AgOFd0pfKde7ZNkLhDM7q0u4ZwN38vV2FEIs7oL3E7PTZN6uf6bTF?=
 =?us-ascii?Q?38xiJhEHMy3om5g5zgHAlNL/3nA+ObPS2RruJIuXxi7hvCDsrvmMU21nNeDq?=
 =?us-ascii?Q?DrQ53DUWq2aFhRABfwCdZnUUdf4MnyuAe112ZRhWGhh5AEwufoLyN9wnOLJH?=
 =?us-ascii?Q?nL3XkFrKfPqvQ01vJKvCfq4CSTD2uyBST7shZ0kYnF3l7FavLaxDljjiUXB3?=
 =?us-ascii?Q?Nmo9R8U4GPZO5VWkJ/a7Dp2LSYqp5RLHHE3c68tCU+En9wQisi99CN2qNNcD?=
 =?us-ascii?Q?rC2I1tfpFcZQoosQvBoFBlDTnI/4nfki3V+toKSto5A3nw1TvDMScX5x77e5?=
 =?us-ascii?Q?sRkEI/C6UEf9sfSK94D12qbkPHmbqVKWGJAam69vdtybDG4eUrU9y6Xk+MxV?=
 =?us-ascii?Q?rv4HQ2bVSXhaGqu4At7+TF5eTqJL5ky5R9VgOtO6CIJngR2VCsr/BCuxz2jy?=
 =?us-ascii?Q?bHXdny1nxuJo51wCnI573mG7sAYxe/R5H/SXCNjdVHVpVLJYAwVgKcc73C3f?=
 =?us-ascii?Q?2Ymr/PsBoNuJNPqvIAwxBoel5UVBwAUd0p2VAUm7kEHMosmsFYitydu8nrzN?=
 =?us-ascii?Q?qgQOyb0dqhnAiqYvQMAgCYuYfonqiI+fIA/Qn4sXAXgA2OF6zQg0+rAyVN7I?=
 =?us-ascii?Q?rbx1Hu8uomW34Ndgcd0RmyG+/xjcTAls3rujpzZoNS36O6eGHdhOQxHBKNnS?=
 =?us-ascii?Q?npEznrW25a/VPc9n8SzeIDh1npB1i2CTTTmLw0qX/CRKa5JtJbZiQYqV+rGo?=
 =?us-ascii?Q?vlD1tUYpCYtEGFkPUBb7R69iwRKPW50=3D?=
X-Exchange-RoutingPolicyChecked: 
	XlC/Ysul66t5Blfbc+7AAvbs/8tMD8El4UHJcw5jSwFNxsCda1irWb77GBZ8wt1zccuRmnUc9mqOOX19fwgtHI6S8YbaFDuVcna6IAh+Wn6HIJfrg2hQlLbffoFb2ksHxt9/ikRQr64RKYmkrB77nN3pwT2vUeiwcoHXydGrRDrTymjXJoadmO0Vx9n/8NRWQWArP95n9I8fImE7H1zuHZowxJiGKiDyz+tEmXsQf5NICclCr10Gl18WCfWm/m/Vxnkx0/JpJwWIoue/uV/6C/LRZccokz6JZ4URQUKi8XJqNWaynssIJZJ7WvD3tx3DZCO9VHKQzRUr8D9YTxPEDw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c14a874-5061-47ec-a791-08de917128ee
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 11:07:14.0415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 070LIfKmgde2Nct0p7TZtsTYQk403VhUS3I7MsjlIZs8MuuX4tYMOGZewQrl7VrhSz8JtM+utfUntMQmMpMVIRmsrEohHk0dhEgfjNMshAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8414
X-Authority-Analysis: v=2.4 cv=duPWylg4 c=1 sm=1 tr=0 ts=69cf9f67 cx=c_pps
 a=GX94MXth5n4ySrE0IhOemQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=7CQSdrXTAAAA:8 a=Yq39SXclXL4aOdItdWUA:9
 a=LTcXKtJou2uO7xa4:21 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: vQp5d8MPmVJascav8ZTfz7MO9_QfxdLZ
X-Proofpoint-GUID: vQp5d8MPmVJascav8ZTfz7MO9_QfxdLZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA5OSBTYWx0ZWRfXzc2P/nWv05Ih
 fSiZN0rMRFcMpVBt/rVipJlrGk3T/aQfcvfGc/tnCO/8s4atYKufqBbkxNwY/cc97EiSC5HOUb1
 a+aDGYwUZZvRvzFdQpDG4wQcv1NLzhPsPsqmsvFFiMD4/ey1nRN4G5w43JVhSfDcC5EbeZKUC7L
 ak0rYM1chZ25JWZ03NU99MU9KQ4tQAvAYMaO4ZkLpLVFqvmShTap3NWJTqVJwDVLHrdDijanruD
 GjfxlirxsWLODZspqy410cgCFJqLTEuN6d2ZhSzwtGQgZipVW4ZuObEwkyW6JHFj0FAKNriG4i6
 Lf3wEFBhIS9XnF+kjxLG+EjmLnMlFBy22Q5612p4FCjwogWXJZQbyRo7d2aFCrBxY3zstraZ8B8
 r/ZXwCRXvdlWks+o96maVevtG+KQqZ5N8MDdulFZS45ujNiFRK6EAMDbVvl6IaNU15Oeu7wBA5r
 Zzk7+oHOyK+t3oM1Vnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 11:07:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234579

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Upgrade to latest revision of 1.24.0.
- Drop patches included in this release.
- Add patch to fix test-groff not found in cross-compilation.
- Add patch to use SOURCE_DATE_EPOCH in gropdf for reproducible PDF generation.
- COPYING, LICENSES: Refresh GPLv3 text.

Release Note:[https://lists.gnu.org/r/groff/2026-02/msg00149.html]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
Changes in v3:
 - Add EXTRANATIVEPATH:class-target += "perl-native".
   gropdf uses "/usr/bin/env perl" which resolves to host perl via hosttools.
   Different host distros have different perl/zlib, causing non-reproducible
   PDF output via Compress::Zlib. Add perl-native to PATH so gropdf uses
   perl-native instead.

 ...d-Fix-Savannah-64681-webpage.ps-deps.patch | 51 ------------
 ...1-build-meintro_fr.ps-depends-on-tbl.patch | 31 -------
 ...tbl.am-Fix-race-issues-for-parallel-.patch | 31 -------
 ...getopt-Fix-type-signature-for-getenv.patch | 27 ------
 ...groff-not-found-in-cross-compilation.patch | 82 +++++++++++++++++++
 ...E_DATE_EPOCH-for-reproducible-builds.patch | 39 +++++++++
 ...l-Fix-Savannah-66316-missing-grn-dep.patch | 38 ---------
 ...groff-not-search-fonts-on-build-host.patch | 10 ++-
 .../{groff_1.23.0.bb => groff_1.24.0.bb}      | 13 ++-
 9 files changed, 133 insertions(+), 189 deletions(-)
 delete mode 100644 meta/recipes-extended/groff/files/0001-build-Fix-Savannah-64681-webpage.ps-deps.patch
 delete mode 100644 meta/recipes-extended/groff/files/0001-build-meintro_fr.ps-depends-on-tbl.patch
 delete mode 100644 meta/recipes-extended/groff/files/0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch
 delete mode 100644 meta/recipes-extended/groff/files/0001-getopt-Fix-type-signature-for-getenv.patch
 create mode 100644 meta/recipes-extended/groff/files/0001-groff-fix-test-groff-not-found-in-cross-compilation.patch
 create mode 100644 meta/recipes-extended/groff/files/0001-gropdf-use-SOURCE_DATE_EPOCH-for-reproducible-builds.patch
 delete mode 100644 meta/recipes-extended/groff/files/0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch
 rename meta/recipes-extended/groff/{groff_1.23.0.bb => groff_1.24.0.bb} (82%)

diff --git a/meta/recipes-extended/groff/files/0001-build-Fix-Savannah-64681-webpage.ps-deps.patch b/meta/recipes-extended/groff/files/0001-build-Fix-Savannah-64681-webpage.ps-deps.patch
deleted file mode 100644
index eae5dc9998..0000000000
--- a/meta/recipes-extended/groff/files/0001-build-Fix-Savannah-64681-webpage.ps-deps.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From c75965053124149381ada3c394da74be078076cf Mon Sep 17 00:00:00 2001
-From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
-Date: Sat, 16 Sep 2023 16:28:00 -0500
-Subject: [PATCH] [build]: Fix Savannah #64681 (webpage.ps deps).
-
-* doc/doc.am (doc/webpage.ps, doc/webpage.html): Update and parallelize
-  target dependencies.  Resolve race by requiring "grn" and "soelim" to
-  be built first.  Also add dependency on `$(TMAC_PACKAGE_MS)`.
-
-Fixes <https://savannah.gnu.org/bugs/?64681>.  Thanks to Alexander
-Kanavin for the report.
-
-ANNOUNCE: Acknowledge Alexander.
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- doc/doc.am | 12 ++++++++----
- 1 file changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/doc/doc.am b/doc/doc.am
-index cddc51907..d3c9ab6b7 100644
---- a/doc/doc.am
-+++ b/doc/doc.am
-@@ -346,6 +346,9 @@ doc/pic.ps: $(doc_srcdir)/pic.ms eqn pic tbl
- 	$(GROFF_V)$(MKDIR_P) `dirname $@` \
- 	&& $(DOC_GROFF) -pet -Tps -ms $(doc_srcdir)/pic.ms >$@
- 
-+# groff(1)'s `-I` implies `-g` and `-s`, so we must depend on grn and
-+# soelim even though the document doesn't require them.
-+doc/webpage.ps: grn soelim
- doc/webpage.ps: $(DOC_GNU_EPS) tmac/www.tmac tbl
- doc/webpage.ps: $(doc_srcdir)/webpage.ms
- 	$(GROFF_V)$(MKDIR_P) `dirname $@` \
-@@ -365,11 +368,12 @@ doc/pic.html: $(doc_srcdir)/pic.ms
- 	&& $(DOC_GROFF) -pet -P-Ipic -P-Dimg -P-jpic -Thtml -ms \
- 	  $(doc_srcdir)/pic.ms > pic.html
- 
--doc/webpage.html: tbl
--doc/webpage.html: tmac/www.tmac
--doc/webpage.html: $(DOC_GNU_EPS)
-+# groff(1)'s `-I` implies `-g` and `-s`, so we must depend on grn and
-+# soelim even though the document doesn't require them.
-+doc/webpage.html: grn soelim
-+doc/webpage.html: $(DOC_GNU_EPS) tmac/www.tmac tbl
- doc/webpage.html: $(doc_srcdir)/groff.css
--doc/webpage.html: $(doc_srcdir)/webpage.ms
-+doc/webpage.html: $(doc_srcdir)/webpage.ms $(TMAC_PACKAGE_MS)
- 	$(GROFF_V)$(MKDIR_P) $(doc_builddir) \
- 	&& cd $(doc_builddir) \
- 	&& $(DOC_GROFF) -t -I $(doc_srcdir) -P-jwebpage -P-nrb \
diff --git a/meta/recipes-extended/groff/files/0001-build-meintro_fr.ps-depends-on-tbl.patch b/meta/recipes-extended/groff/files/0001-build-meintro_fr.ps-depends-on-tbl.patch
deleted file mode 100644
index 3e81b86ac8..0000000000
--- a/meta/recipes-extended/groff/files/0001-build-meintro_fr.ps-depends-on-tbl.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From f21e9f13beb57a1e0666edf9693d7c83f2189897 Mon Sep 17 00:00:00 2001
-From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
-Date: Fri, 22 Sep 2023 01:27:57 -0500
-Subject: [PATCH] [build]: meintro_fr.ps depends on tbl.
-
-* doc/doc.am (doc/meintro_fr.ps): Depend on tbl, resolving race in
-  sufficiently parallelized builds.  Overlooked in commit 92349ae223,
-  2022-05-30.
-
-Fixes <https://savannah.gnu.org/bugs/?64695>.  Thanks to Alexander
-Kanavin for the report.
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- doc/doc.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/doc/doc.am b/doc/doc.am
-index d3c9ab6b7..0f95c7774 100644
---- a/doc/doc.am
-+++ b/doc/doc.am
-@@ -334,7 +334,7 @@ SUFFIXES += .me.in .me
- 
- # Use '-K utf8', not '-k', in case 'configure' didn't find uchardet.
- # The French translation uses tbl; its English counterpart does not.
--doc/meintro_fr.ps: doc/meintro_fr.me preconv
-+doc/meintro_fr.ps: doc/meintro_fr.me preconv tbl
- 	$(GROFF_V)$(MKDIR_P) `dirname $@` \
- 	&& $(DOC_GROFF) -K utf8 -t -Tps -me -mfr $< >$@
- 
diff --git a/meta/recipes-extended/groff/files/0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch b/meta/recipes-extended/groff/files/0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch
deleted file mode 100644
index de4a55bbab..0000000000
--- a/meta/recipes-extended/groff/files/0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 771686c042d5f494550d0399f36e00b1ca557b2d Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Mon, 11 Nov 2024 14:12:51 +0000
-Subject: [PATCH] contrib/hdtbl/hdtbl.am: Fix race issues for parallel build
-
-Fixed race issues for parallel build:
-groff: error: couldn't exec soelim: Permission
-
-And:
-groff: error: couldn't exec grn: Permission denied
-
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/groff/2024-11/msg00097.html]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- contrib/hdtbl/hdtbl.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/contrib/hdtbl/hdtbl.am b/contrib/hdtbl/hdtbl.am
-index 9384fac..70f7bc9 100644
---- a/contrib/hdtbl/hdtbl.am
-+++ b/contrib/hdtbl/hdtbl.am
-@@ -119,7 +119,7 @@ SUFFIXES += .roff .in .ps
- 	       -e "s|[@]EGREP[@]|$(EGREP)|" $< >$@
- 
- $(HDTBLPROCESSEDEXAMPLEFILES): $(DOC_GNU_EPS) groff troff eqn pic tbl \
--  grops grn font/devps/stamp contrib/hdtbl/examples/common.roff
-+  grops grn soelim font/devps/stamp contrib/hdtbl/examples/common.roff
- 
- uninstall_groffdirs: uninstall-hdtbl-hook
- uninstall-hdtbl-hook:
diff --git a/meta/recipes-extended/groff/files/0001-getopt-Fix-type-signature-for-getenv.patch b/meta/recipes-extended/groff/files/0001-getopt-Fix-type-signature-for-getenv.patch
deleted file mode 100644
index c69a2b4f67..0000000000
--- a/meta/recipes-extended/groff/files/0001-getopt-Fix-type-signature-for-getenv.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From b68b3c6157c531bdcf5812fd93aadff9c18de6bd Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 22 Mar 2025 14:41:23 -0700
-Subject: [PATCH] getopt: Fix type signature for getenv()
-
-This fixes build on musl with GCC 15
-
-Upstream-Status: Inappropriate [Next version is use getopt.c from gnulib]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/libs/libgroff/getopt.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libs/libgroff/getopt.c b/src/libs/libgroff/getopt.c
-index 6efa529..ce39115 100644
---- a/src/libs/libgroff/getopt.c
-+++ b/src/libs/libgroff/getopt.c
-@@ -122,7 +122,7 @@ static struct _getopt_data getopt_data;
-    whose names are inconsistent.  */
- 
- #ifndef getenv
--extern char *getenv ();
-+extern char *getenv (const char *);
- #endif
- 
- #endif /* not __GNU_LIBRARY__ */
diff --git a/meta/recipes-extended/groff/files/0001-groff-fix-test-groff-not-found-in-cross-compilation.patch b/meta/recipes-extended/groff/files/0001-groff-fix-test-groff-not-found-in-cross-compilation.patch
new file mode 100644
index 0000000000..e9214519e7
--- /dev/null
+++ b/meta/recipes-extended/groff/files/0001-groff-fix-test-groff-not-found-in-cross-compilation.patch
@@ -0,0 +1,82 @@
+From c0f835a59d7b33452f280c8a73c3214e0a3a3d9f Mon Sep 17 00:00:00 2001
+From: Zhang Peng <peng.zhang1.cn@windriver.com>
+Date: Fri, 6 Mar 2026 05:18:33 +0000
+Subject: [PATCH] groff: fix test-groff not found in cross-compilation
+
+In groff 1.24.0, pdfmom uses GROFF_COMMAND=test-groff to invoke the
+build-tree groff wrapper during document generation. This fails in
+cross-compilation because:
+
+1. GROFF_COMMAND=test-groff is a relative name not in PATH.
+2. test-groff overrides GROFF_BIN_PATH to $builddir and then runs
+   $builddir/groff, which is a target binary.
+
+Fix by:
+- Using $(abs_top_builddir)/test-groff in .am files.
+- When the caller provides a GROFF_BIN_PATH with a usable groff
+  (cross-compilation with groff-native), keep it instead of
+  overriding to $builddir.
+- Run $GROFF_BIN_PATH/groff instead of $builddir/groff so the
+  correct (native or build-tree) binary is always used.
+
+Upstream-Status: Inappropriate [yocto specific]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ contrib/mom/mom.am | 2 +-
+ doc/doc.am         | 2 +-
+ test-groff.in      | 8 ++++++--
+ 3 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/contrib/mom/mom.am b/contrib/mom/mom.am
+index b99e869..120d3ee 100644
+--- a/contrib/mom/mom.am
++++ b/contrib/mom/mom.am
+@@ -24,7 +24,7 @@ mom_srcdir = $(top_srcdir)/contrib/mom
+ #
+ # Use '-K utf8', not '-k', in case 'configure' didn't find uchardet.
+ MOMPDFMOM = \
+-  GROFF_COMMAND=test-groff \
++  GROFF_COMMAND=$(abs_top_builddir)/test-groff \
+   GROFF_COMMAND_PREFIX= \
+   GROFF_BIN_PATH="$(GROFF_BIN_PATH)" \
+   $(PDFMOMBIN) $(FFLAG) $(MFLAG) -M$(mom_srcdir) -K utf8 -p -e -t \
+diff --git a/doc/doc.am b/doc/doc.am
+index 6cf9db5..906a989 100644
+--- a/doc/doc.am
++++ b/doc/doc.am
+@@ -54,7 +54,7 @@ groffmanpagesoption = -P-e
+ endif
+ 
+ DOC_PDFMOM = \
+-  GROFF_COMMAND=test-groff \
++  GROFF_COMMAND=$(abs_top_builddir)/test-groff \
+   GROFF_COMMAND_PREFIX= \
+   GROFF_BIN_PATH="$(GROFF_BIN_PATH)" \
+   $(PDFMOMBIN) $(MFLAG) $(FFLAG) -ww -b $(pdfmomoption) --roff
+diff --git a/test-groff.in b/test-groff.in
+index a65898a..9c6a8b6 100644
+--- a/test-groff.in
++++ b/test-groff.in
+@@ -23,7 +23,11 @@ SEP='@PATH_SEPARATOR@'
+ builddir=@abs_top_builddir@
+ srcdir=@abs_top_srcdir@
+ 
+-GROFF_BIN_PATH=$builddir
++# Keep caller's GROFF_BIN_PATH if it contains a usable groff (e.g.
++# groff-native during cross-compilation); otherwise use builddir.
++if [ -z "$GROFF_BIN_PATH" ] || [ ! -x "$GROFF_BIN_PATH/groff" ]; then
++    GROFF_BIN_PATH=$builddir
++fi
+ 
+ XENVIRONMENT=$srcdir/src/devices/xditview/GXditview.ad
+ export XENVIRONMENT
+@@ -52,4 +56,4 @@ $SEP$builddir/contrib/sboxes\
+ export GROFF_COMMAND_PREFIX
+ export GROFF_BIN_PATH GROFF_FONT_PATH GROFF_TMAC_PATH
+ 
+-exec $builddir/groff "$@"
++exec $GROFF_BIN_PATH/groff "$@"
+-- 
+2.51.2
+
diff --git a/meta/recipes-extended/groff/files/0001-gropdf-use-SOURCE_DATE_EPOCH-for-reproducible-builds.patch b/meta/recipes-extended/groff/files/0001-gropdf-use-SOURCE_DATE_EPOCH-for-reproducible-builds.patch
new file mode 100644
index 0000000000..8ab3668edc
--- /dev/null
+++ b/meta/recipes-extended/groff/files/0001-gropdf-use-SOURCE_DATE_EPOCH-for-reproducible-builds.patch
@@ -0,0 +1,39 @@
+From f28f0c4d8dfdfb1c173d21df6ffbe35448fada9f Mon Sep 17 00:00:00 2001
+From: Zhang Peng <peng.zhang1.cn@windriver.com>
+Date: Mon, 9 Mar 2026 20:10:00 +0800
+Subject: [PATCH] gropdf: use SOURCE_DATE_EPOCH for reproducible builds
+
+gropdf uses rand() to generate random font subset tags in SubTag().
+Without a deterministic seed, each build produces different PDF output.
+
+Initialize srand() with SOURCE_DATE_EPOCH when available to ensure
+reproducible builds.
+
+Upstream-Status: Submitted [https://savannah.gnu.org/bugs/?68136]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/devices/gropdf/gropdf.pl | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/devices/gropdf/gropdf.pl b/src/devices/gropdf/gropdf.pl
+index f519a53..3a79b4c 100644
+--- a/src/devices/gropdf/gropdf.pl
++++ b/src/devices/gropdf/gropdf.pl
+@@ -30,6 +30,13 @@ use POSIX qw(mktime);
+ use File::Spec;
+ use File::Path;
+ 
++# Initialize random seed for reproducible builds.
++if (defined($ENV{SOURCE_DATE_EPOCH})) {
++    srand($ENV{SOURCE_DATE_EPOCH});
++} else {
++    srand();
++}
++
+ use constant
+ {
+     WIDTH    => 0,
+-- 
+2.50.0
+
diff --git a/meta/recipes-extended/groff/files/0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch b/meta/recipes-extended/groff/files/0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch
deleted file mode 100644
index d9455af2ac..0000000000
--- a/meta/recipes-extended/groff/files/0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 12169aa269341753d491a69e9adb86c58dca039a Mon Sep 17 00:00:00 2001
-From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
-Date: Thu, 10 Oct 2024 18:17:08 -0500
-Subject: [PATCH] [hdtbl]: Fix Savannah #66316 (missing `grn` dep).
-
-* hdtbl.am (HDTBLPROCESSEDEXAMPLEFILES): Declare dependency on `grn`;
-  because `-I` flags are used, it is dragged in even though not
-  explicitly needed.  Resolves race against `grn`'s availability in the
-  build tree.
-
-Fixes <https://savannah.gnu.org/bugs/?66316>.  Thanks to Ross Burton for
-the report.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- contrib/hdtbl/ChangeLog | 10 ++++++++++
- contrib/hdtbl/hdtbl.am  |  3 +--
- 2 files changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/contrib/hdtbl/hdtbl.am b/contrib/hdtbl/hdtbl.am
-index b6c334c18..3c37174f2 100644
---- a/contrib/hdtbl/hdtbl.am
-+++ b/contrib/hdtbl/hdtbl.am
-@@ -119,9 +119,8 @@ SUFFIXES += .roff .in .ps
- 	&& sed -e "s|[@]fontdir[@]|$(fontdir)|" \
- 	       -e "s|[@]EGREP[@]|$(EGREP)|" $< >$@
- 
--
- $(HDTBLPROCESSEDEXAMPLEFILES): $(DOC_GNU_EPS) groff troff eqn pic tbl \
--  grops font/devps/stamp contrib/hdtbl/examples/common.roff
-+  grops grn font/devps/stamp contrib/hdtbl/examples/common.roff
- 
- uninstall_groffdirs: uninstall-hdtbl-hook
- uninstall-hdtbl-hook:
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/groff/files/groff-not-search-fonts-on-build-host.patch b/meta/recipes-extended/groff/files/groff-not-search-fonts-on-build-host.patch
index 23992576f9..111dbd385e 100644
--- a/meta/recipes-extended/groff/files/groff-not-search-fonts-on-build-host.patch
+++ b/meta/recipes-extended/groff/files/groff-not-search-fonts-on-build-host.patch
@@ -11,6 +11,9 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
 Rebase to 1.22.4
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
+Rebase to 1.24.0
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+
 ---
  font/devpdf/Foundry.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -19,16 +22,16 @@ diff --git a/font/devpdf/Foundry.in b/font/devpdf/Foundry.in
 index e5aba65..5441734 100644
 --- a/font/devpdf/Foundry.in
 +++ b/font/devpdf/Foundry.in
-@@ -20,7 +20,7 @@
+@@ -23,7 +23,7 @@
  
  #=======================================================================
  #Foundry|Name|Search path
--foundry||@urwfontsdir@:(gs):/usr/share/fonts/type1/gsfonts:/usr/share/fonts/default/Type1:/usr/share/fonts/default/Type1/adobestd35:/usr/share/fonts/type1/urw-base35:/opt/local/share/fonts/urw-fonts:/usr/local/share/fonts/ghostscript
+-foundry||@urwfontsdir@:(gs):/usr/share/fonts/type1/urw-base35/:/usr/share/fonts/urw-base35:/opt/local/share/fonts/urw-fonts/:/usr/local/share/fonts/ghostscript/:/usr/share/fonts/type1/gsfonts/:/usr/share/fonts/type1/:/usr/share/fonts/default/Type1/adobestd35/:/usr/share/fonts/default/Type1/:/usr/share/ghostscript/Resource/Font
 +foundry||(gs)
  
  # Enable the font description files for grops (generated from Adobe
  # foundry font files) to be used with gropdf.  afmtodit must not be
-@@ -72,7 +72,7 @@ EURO|N||||*../devps/freeeuro.pfa
+@@ -79,7 +79,7 @@ EURO|N||||*../devps/freeeuro.pfa
  # URW fonts are typically shipped with Ghostscript, but can be replaced.
  
  #Foundry|Name|Search path
@@ -36,4 +39,3 @@ index e5aba65..5441734 100644
 +foundry|U|(gs)
  
  # Define flags for afmtodit.
- 
diff --git a/meta/recipes-extended/groff/groff_1.23.0.bb b/meta/recipes-extended/groff/groff_1.24.0.bb
similarity index 82%
rename from meta/recipes-extended/groff/groff_1.23.0.bb
rename to meta/recipes-extended/groff/groff_1.24.0.bb
index 0c2ef61758..dbc8cdf6d0 100644
--- a/meta/recipes-extended/groff/groff_1.23.0.bb
+++ b/meta/recipes-extended/groff/groff_1.24.0.bb
@@ -5,19 +5,16 @@ SECTION = "base"
 HOMEPAGE = "http://www.gnu.org/software/groff/"
 LICENSE = "GPL-3.0-only"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
            file://groff-not-search-fonts-on-build-host.patch \
            file://0001-Make-manpages-mulitlib-identical.patch \
-           file://0001-build-Fix-Savannah-64681-webpage.ps-deps.patch \
-           file://0001-build-meintro_fr.ps-depends-on-tbl.patch \
-           file://0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch \
-           file://0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch \
-           file://0001-getopt-Fix-type-signature-for-getenv.patch \
+           file://0001-groff-fix-test-groff-not-found-in-cross-compilation.patch \
+           file://0001-gropdf-use-SOURCE_DATE_EPOCH-for-reproducible-builds.patch \
            "
 
-SRC_URI[sha256sum] = "6b9757f592b7518b4902eb6af7e54570bdccba37a871fddb2d30ae3863511c13"
+SRC_URI[sha256sum] = "e79bbcd8ff3ed0200e7ac55d3962a15e118c1229990213025f2fc8b264727570"
 
 DEPENDS = "bison-native groff-native"
 RDEPENDS:${PN} += "perl sed"
@@ -31,6 +28,8 @@ EXTRA_OEMAKE:class-target = "GROFFBIN=groff GROFF_BIN_PATH=${STAGING_BINDIR_NATI
 
 CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl' ac_cv_path_BASH_PROG='no' PAGE=A4"
 
+EXTRANATIVEPATH:class-target += "perl-native"
+
 # Delete these generated files since we depend on bison-native
 # and regenerate them. Do it deterministically (always).
 do_configure:prepend() {
-- 
2.50.0


