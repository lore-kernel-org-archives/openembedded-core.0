Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB218F4180B
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 15:09:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16990.1773068939333333260
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 08:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XmOgh2lW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75289530f7=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6294YBoB2110175
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Mar 2026 08:08:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=/iLv52wdVzvLgS03eVTT
	dmHFRLp4aQ01qPCD7d+deX4=; b=XmOgh2lWzCyebtXB1mkZw9RKDzeyN8xm5H5I
	o45bEcvJBHb5obtri4E3uHHDCpt3518mHBVDUaacEOaIZA2jVSfneE+x2oYcgMXq
	RkBvBnn5/O3srqo8PxzVO/353ndofTs5N6aCalb2kJtM0qlaRxMoMivKqcJuadh1
	Js/aEXOQIUZ8Odj5rjtsi2Hr6+C1Gmv5gL588yGwYhIiU8A3ar/gJNuZ7t2d0fyM
	bvkCb6nocLSI70xQzNjCtLV+SYQJlFdrhc3gv6WQpCOrcQnFUlKQcwHJxgUn6JUa
	+5mAf5TigBOHLOsnj+W59Cf0v34FzH6/GZkZEJAaFs5ooo370A==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011047.outbound.protection.outlook.com [52.101.62.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crmdm1p2p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 08:08:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQf8O4d9dst3Ras0ZvedEO8f/H6w9jz8t+zLoaVXCxE0ZOS3PWzIE7G9xEayZ5gh7jmo5T2sltZ/pLvOz506PpTMGXDc932SXV3elrL8Hw8Rli5+TQP+j3WbcoKSPUiIN6chSaLWfygSY1Jgl5tBaokTQDa15KbEleJljD41NqllQhFj/+odVLC1TRwZpO8+a0zatJMALVztnJgzjqKRAwcfSvrMlbxYDoNrUozn00IX7UfXM89KHKq5y7kXppcE+l635B6XYQxeVp5vwkNQ1rbhtZS32ZzudeFFsjNWytECuff0ODh86oq8Sca6+6pabUT6gCquJAOFcHXK8Mk/PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iLv52wdVzvLgS03eVTTdmHFRLp4aQ01qPCD7d+deX4=;
 b=AC1isR5aCltnOQOsPOrLeePNGXGG1nuKHV+q3Wu0OmB4I/JfxcRhC41wqLZkq3VDtBLrnBeZUnwHPg1THFvKIffxaVeOwVsdqXFJAmi58+P73OCkHheTJegG9syJxDAQX+DaxGcZgbgGtHGoZzdPDZpaa4QeX/eeme7SBmg56MxBuBR/CxCVgGq5PoMwzSMKhph7n3idUWhgMJ1Mp4xDU16cqjP7E31I5ZiHHWkf597WQsNBqxO5DKZ5CYAmynO5OoICqAU7XzHiFuUIokmjxrgDmp6ZoWciiSoS0qA46DM77J8Jbvyg5sQI0j65MstgEulW1D70UvTFwnLTeofGdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MN2PR11MB4661.namprd11.prod.outlook.com (2603:10b6:208:26b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 15:08:55 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 15:08:54 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][PATCH v2] groff: upgrade 1.23.0 -> 1.24.0
Date: Mon,  9 Mar 2026 23:08:42 +0800
Message-ID: <20260309150842.3379241-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0046.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::18) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|MN2PR11MB4661:EE_
X-MS-Office365-Filtering-Correlation-Id: a8b7fbef-3f3d-4b50-918b-08de7dedc7b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	M0ppP0cpy6jHXp/l3wwLBKMuhTv0TvO5ypkolKCPnoAFMut96OEa7pAPMJl1A8/zeJe4i0BBwAaKSEDJWdWmkFtgIFkazmD0t0fYHWSjPBL33PvNkzol4rCiGXae8FqxLaU7LZ9eeVyPTdExrQR5bDHhzWLRXs94Ts+pJlFqDRPdnJRT0agfhJ82Er6hPzs/Vvz6mmmbX5f3ArD4FPONGEG5oedMfq6RGmQuG5U6R8R37HE2otGju+9C9roiK7ZYO0SFM+5MGMlk1O1skm3j+4PYqn4W9ix1cNMQdVzewQEnMZp+jm+w/7zyDIfUdA/NCs95qurg0+bhbIngP/H6htLpJ6iNh+eoM6Hi9AQc4FLfEXMXstFJCjS+GedNhzZo8zMy60SovDm9ieoPPL0Cbli1ylwY+og7Wr7D+kbPgNAmMV6YD+zL/0yP1zXCT1nhl59boPFoGvuwqYkIdfrcfdSNDLec/+IhWlwMTjtJSecpG12YLpP1xyWteteclwE6xUif4n0mkqP5cnFspPd6ScM6FRACi8s4dn8z/F+mwsvdKWZ8jnNo3GfwgnUn5ffhao6Aq9kY3JsLIcwvDr7R6iZs06ynWn51UUhd1njuJK65XILO6024mNImrKsPLz1HVxyJ1FY3iNAETERsW/kDeTq+xfe8U1Dy6TDgUSg+CYD7GOd9rlpeiUV81o8Og4n0r5YuL9RjEsUntgmM/zeoraMYnd3kdRv1mv5wY7I5l/s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?s5jyx/8N6K9GDRFI6PGD/p+LlEONiypJNlCVwGPpRpo5QWB8yJ9Z7iaIRWAA?=
 =?us-ascii?Q?9y/vhEp4FLzabXQzmFLpSKXDKf90Ht1+6pu/G1dXK8T+Tm1AJ+XqXNef2o9B?=
 =?us-ascii?Q?jEgpCKD6cuUhpt6sgJwdw8xD8i0wzudfq/PSJiXTd/i2z9M9QVkVIcWzfXab?=
 =?us-ascii?Q?xfOcMexBi+M1Jlz4PSdUwvL6OMdclPycKvxDR1YEpQ9i20egsHHqXKVBIt/w?=
 =?us-ascii?Q?R6yDiIceKx1vaGYmeM5J4dDXArXByVqHObUQbVuRjqsPmHDJy0EkI9uraEOF?=
 =?us-ascii?Q?sY8ykJlRzCcSdAGxyOSCRnsydBGGXu+Ny4PexT84xfu0Oa3kE5T5Z2i2I/fE?=
 =?us-ascii?Q?zHD961JEnB7eVp4/EWYjOohhoNEHiZLA6Gr/QAAgdDUheWc1opp6HpcWz5qf?=
 =?us-ascii?Q?yzpfZ9Pe8VEriejA3PgfmRGyRChaXu6LqqCm3R1TCzjGwZYgfBooD+c5Ptz3?=
 =?us-ascii?Q?11t82CC3CNOLCHXfzAY20sI3j7ovP05htOdRqPFEfv9a06js6qOYYRayNCzT?=
 =?us-ascii?Q?LoJ/nHRPPzpODmR71hk8azgf2fxJW+WxpoCAmDGJLdhLyC4gDAEedBlVDpXa?=
 =?us-ascii?Q?wNmo7I4JAKMYcho2gEiMoDvWw5Zhjnj8MEN0wdpCvvwxNYAyzTa8uHMunc4T?=
 =?us-ascii?Q?dS6YyyLOsm51BleKJWYCL2Dzq79F9nX3dg/wBptQ/IA66HTaNblo/13EoOrA?=
 =?us-ascii?Q?tpxSDoHkKFOTDgnoLo67cYfLI3FZ4+dem/pI52iUlbRT2DztNcf2M/St2dgU?=
 =?us-ascii?Q?VsYvhu+t3kFJtfEHPt+fKIVkxvGVHPnZD0e0QWUgIxlh0sJd4yR/uShJAKQZ?=
 =?us-ascii?Q?tbgUeIIT1SGZ84VwDUgFUKKNX6WehkObtMZ4Tfm5Z1WeRPJbpPrgDkTFCB3r?=
 =?us-ascii?Q?fjptFBHDW9uOlCdrSnC+7rGMMxvbakvEL6MNCF8x2JmVC6uZxDy49/K/+wZM?=
 =?us-ascii?Q?3eL9W7fkHVdvsWjVOkp5VEyM8m43EoSRJ2HP31CRGU3CZiaMSgNczZNKVLKA?=
 =?us-ascii?Q?nuYUNxzKyubPB/iUXyG1qyamDD/vbD5Vipz+AWjQdzx+gkPiXt7neg/PSk5P?=
 =?us-ascii?Q?pGwqzpCXe3Pfpb/PLHXSzMvi8PD/WpJcJfLN0PsBnGpPLrFEte1pDFOuIRTH?=
 =?us-ascii?Q?D2EllMEr9xqlUHHZmC8TR7MH1N9Rbk9nm2Rv0/gbQc00riZG3XBmRbIfwKgt?=
 =?us-ascii?Q?fGo55+C3I3H7nckv5A3hIxyrx5S6O7AC/Z6KpmGO/pYtoSEAzKMXh0ipdI8d?=
 =?us-ascii?Q?mzpsNedOkPJR8JZDgFvdsVPCOU283Y960hpXe/uiY/PStG9wLketoFS435Xk?=
 =?us-ascii?Q?fd1KjAFs/XEsrYPALH2i1A441GzhXAr5jEKBOpp8mEb6qJrBaUJ0s7d06I9y?=
 =?us-ascii?Q?H/OJNb4LPDWcB0OuIOWP8Pjah1e6c6qiTQbqebXjnsDgum0UGMHOPwShbpt8?=
 =?us-ascii?Q?w5l7ABUvclr3ECrkGwzmjCXmzqxKpgwg/8x5zrFYHE9Z7ufbdwXkGB2HlPb1?=
 =?us-ascii?Q?8Bknqt8e9MP9JnvZB8iG/PpWMRJ+1L71oYlLfPe7SpK1iG26gic0Y6NrSmU7?=
 =?us-ascii?Q?vQ+8SckV8dE32VKSIV1/YsVCc7qm9bIHXddwI203XL4FZ/GjFx6R7++M143W?=
 =?us-ascii?Q?vYY+6eBDc4npL0j+RbtU8uV/JoAgp0XXrtAlLxcVEwGXC3Q3wdQVRl4jDDCk?=
 =?us-ascii?Q?CmsCIr0zICV/tVDj4DAk6vrLpAcwRg9xTr7wtRWItagPGPbTpy3CVQMPkphe?=
 =?us-ascii?Q?mL1+X56re80rsGKsQhpOYDlvpNh8Nc4=3D?=
X-Exchange-RoutingPolicyChecked: 
	aT5iZIdWj+F/Lr7uRiq3APiAoge388mdV6+HeGDDkUhXAXpUg2Ts1oybrTgen+fURx8bzHPJgUzpGDZqCwXxYhg/qXcddunQf0FLev1I8X2SLlkGqjke9TWUSlszgQJLtTGbnmM8pAvvMThgEXt5Vv0tV84TamPKwBG/fnW0zqZOngDz3tzKbF+awUZgAdBrinUerdMTF7asN9PEaYZcv555pnTzgdLyL8t9Gb+rKDC7B5NvOGeL1ZdA7IZZamrWz/UNsKt54tQYVKk3tA8SMwwXe226WLyHv2laejxneIyEcoO+mQIWEicUo2ljS6q7MzRcdMEYtE42tXhIe15yTA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b7fbef-3f3d-4b50-918b-08de7dedc7b5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 15:08:54.8910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XRycDtz3HZJKwbxpLi+qTuUqxBaz1/wkqilxIdNihjXQw+jngTVZAXJs+/DSRwImdyTMaZ+8JRNjoWoHWCZFaDZtQys6W1NJxsqLAYfCg64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4661
X-Proofpoint-ORIG-GUID: mgDZYRfxBqVXtmNfvvekGLR9ctDpmynR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEzNyBTYWx0ZWRfX8Qab/3CiYkTq
 uQ4U+nK4MNfbx4w6aCUssDjD9O2WNm7wUn5tToZMf/qALHdpqXqhvCNavX4/VT3P9goCKJ5XHFI
 YRfhWSDr4gzBSMF9t9cBp8eDsv8CnARZiWYnB8upv98HJ6SqsqP5PkFBOyLhNHNh+P0GEf4bMAk
 qIIC6cAsgj8HDffNect7k1SNx/LCNNwiMchZ5S4P2EcfgYQQTr2olsvUNkhGfW0C1/zWRy6CLWo
 YJfNcPXXWJj5VY1W+3VpagftIfyywiC6/f2mDwGflpCqrnx4eOUQtHqATs9ij6ssGPZwhMFodmC
 VUslhn9CT3iUGJISoxYcHD8XGI94e7c0UJAD2lCC1ENPefc/NmozQck/9H5areeHKXxxZ7/QBJX
 tF8sNla/VIb19JhYa9zHLY+E0PQvjpkriNzkFx9j/cnzSBGPzQjqsXpjbOulBx3LwnZGNZpxx2Y
 mAUh7Qpn78xuTNOJQEA==
X-Proofpoint-GUID: mgDZYRfxBqVXtmNfvvekGLR9ctDpmynR
X-Authority-Analysis: v=2.4 cv=QppTHFyd c=1 sm=1 tr=0 ts=69aee28a cx=c_pps
 a=U8qasQFE1QqC7dgCSsktzg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=7CQSdrXTAAAA:8 a=zmIOn2vZ0BdP5SPm4PAA:9
 a=LTcXKtJou2uO7xa4:21 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090137
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 15:09:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232727

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Upgrade to latest revision of 1.24.0.
- Drop patches included in this release.
- Add patch to fix test-groff not found in cross-compilation.
- Add patch to use SOURCE_DATE_EPOCH in gropdf for reproducible PDF generation.
- COPYING, LICENSES: Refresh GPLv3 text.

Release Note:[https://lists.gnu.org/r/groff/2026-02/msg00149.html]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...d-Fix-Savannah-64681-webpage.ps-deps.patch | 51 ------------
 ...1-build-meintro_fr.ps-depends-on-tbl.patch | 31 -------
 ...tbl.am-Fix-race-issues-for-parallel-.patch | 31 -------
 ...getopt-Fix-type-signature-for-getenv.patch | 27 ------
 ...groff-not-found-in-cross-compilation.patch | 82 +++++++++++++++++++
 ...E_DATE_EPOCH-for-reproducible-builds.patch | 39 +++++++++
 ...l-Fix-Savannah-66316-missing-grn-dep.patch | 38 ---------
 ...groff-not-search-fonts-on-build-host.patch | 10 ++-
 .../{groff_1.23.0.bb => groff_1.24.0.bb}      | 11 +--
 9 files changed, 131 insertions(+), 189 deletions(-)
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
index 0c2ef61758..102cf9029d 100644
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
-- 
2.50.0


