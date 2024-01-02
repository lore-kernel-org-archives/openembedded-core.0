Return-Path: <william.lyu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D62C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 16:40:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.33046.1704213635952667877
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 08:40:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qT7l4MAZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1731c301a2=william.lyu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 402GMJoZ006084
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jan 2024 16:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=bZ/tEdeZ5oXAqEA5aB
	KBOKiappCJWFvYzqZqfUSmcEM=; b=qT7l4MAZG8hz+lg3GX9+2l5NlZ+UN/qE+W
	0o4JwaIq7cIEzIBOPk++5vnHb+dcGohJC5TjTexqTRm81J5SBH7045KPElFgD2yA
	fEZfrn5sP3rBvaWhmtyCfeICEXJeVz3CGIUlkfgtqlZXtqSkYaaxo8/sxQF9psXR
	uCF7yz1RBxS/pLFWouI3xyaPof118WZGCOP8O34z8GW/Nwkz6wnAkvX0z30I7Vg6
	meHOfvSRVYR5CPCViBhCN39tVSu7sM13vBbz4lNxUMXygJ27DXIbEKWCVL+t9eqU
	8CZ5rRiYs8jl/F4LkmL9A8W7TwN0c+VhJdK9WyGyoZqJKY/gOMeg==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3va8dxb1dv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 16:40:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPVzV9PzrG1RcD4ybNotOwzdb5lxInsSW5hm2Tw7VIwz3Ihfl/wvQMka5IieDufvHW2oB7ycu2lnR1bzJ3zfusj6YeyXlwgOo9wAGj8Xl7VIg9KHMKp3cQcxupDRpeP+19mCQfUzWNG1V1bkWodJf1Rzr6mw1p7l37iLl09zSoOhXcCfqPt6Bnv9bkOXpYmQWZ8Bdp9IhLQCYISinAuDgmdbexoevl+lS6rDCvnZFu9onF0SNsw1GkGQa8PMuupuUrA858utC6GebqM/qdNhjKud0vO2ifuqgyfBby6dJ+jSEgBYgpJ+H3POlhEzt1EeuP0QvzCCZDofpx32MYu0iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZ/tEdeZ5oXAqEA5aBKBOKiappCJWFvYzqZqfUSmcEM=;
 b=m5OZQaEgifOwu3Gs56i5vdXPO+XebT0m8lBGUd+TgbhIqdssA/Fg9NesiYwl9NqP6KrfnlAfMpi/hE40bEbMF491gt3VBxGC2VYzFTGCAlt5lpBtEzBNqYCjORinM+YJLG1f6tThYk8kvffB3Wed1VUTOH2qDR64+kyYvrVX4Y4U/Cy2kPDwTKbRSamlgiSxtaRKdADbwNmqB3OGw5lgdpq5sHCPKt5M7jrqGLeWQWj18yl1lKBYBCUDwK+lUIrZhsRU9hlfb/TwmPtzzzHMvmPPktmjXRX23gLtYBqR//pnklVGP8JIF7hRJGXuvX7jNl8EJ5DLZrq+PywrPYBgUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY5PR11MB6342.namprd11.prod.outlook.com (2603:10b6:930:3d::20)
 by DM6PR11MB4660.namprd11.prod.outlook.com (2603:10b6:5:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Tue, 2 Jan
 2024 16:40:32 +0000
Received: from CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::dcd6:34af:90b7:15df]) by CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::dcd6:34af:90b7:15df%3]) with mapi id 15.20.7135.023; Tue, 2 Jan 2024
 16:40:32 +0000
From: William.Lyu@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] elfutils: Correct LICENSE line in the recipe
Date: Tue,  2 Jan 2024 08:40:23 -0800
Message-ID: <20240102164023.3392969-1-William.Lyu@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0160.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::15) To CY5PR11MB6342.namprd11.prod.outlook.com
 (2603:10b6:930:3d::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6342:EE_|DM6PR11MB4660:EE_
X-MS-Office365-Filtering-Correlation-Id: acda79ae-d802-4802-f917-08dc0bb189a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6mT7S4fLUpUHtzWyt6gFJhmTcKzua9vMEyoAECpEcj2kumo4NiknKgq2tn+2wgo76Wfy27Fuw6yiux/Z2td4yRGgGMKOoEly2wmBk4NY7QvpXaInAEQZPrXf2Y9NTSP80hIBArSEjv25I6YDyWdg5ZRdCM9kYuBrNrUOVfsprY4MteUVc6DPBIYZCfIb5gaq/dfZNaYax24rY/86dThGwZTECii07WuVw3ButUS1dSkdmpQWsqMfMLOkR0FrZCRdVMAcGLTcG59NhkChpz3PE1oXfqLfWyWpnfxT38vEcbr7FKfP1jEjOMY5GmeZTwwXqDebWiOXddifZdQ9+DoF1gab9qnaCaRF64113DUQKbdYRRNstWR+rBJpQfbbL/iV64CPagMSipSA6ouU8q+4B1RYyG8pneOzF8kXjxlJkanp5+NY71J6qPWt9L2+ThM7B45XP5ChWTXmTTm/dmq5Yn60GJr+O/6tVkfxZw4yqMqtzcH2eJTL/4XNdGgqF5+NB+ykPgfuV3TxHN+iZyLweY01qphEGo72FsGaIugW4fo6YrncvQ2hw97oilk/Mb0q4sOJ3R9zk7+8KcuHYhbEVO3JAvikICaUhg94Lru7I4E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6342.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(376002)(396003)(39840400004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(52116002)(83380400001)(2616005)(1076003)(26005)(6506007)(86362001)(38350700005)(38100700002)(36756003)(6666004)(5660300002)(9686003)(6512007)(8936002)(66946007)(66476007)(6916009)(316002)(66556008)(966005)(8676002)(478600001)(2906002)(41300700001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i2XHs7Iixvuj4s0MVhqm5R+41OPyNtV5S9oN71CSq5Sz/35DNqHr78vbCofh?=
 =?us-ascii?Q?2spRxCgwtoqNsxz7d54aXBPviEzzXDevRoQTBzI4zuH+TPa5IGd3oq0n17EW?=
 =?us-ascii?Q?Kzrqgo6ltLySLZUdtIf43mHgrj5LDpPCZNPRHhFT4yBCQH6U3MqsoBdfm375?=
 =?us-ascii?Q?KhHQxrObSAna3GIv8cjjCDfC7hVeOzV6X3M6X4sLQImDL1mJYNtdEgaDYrS9?=
 =?us-ascii?Q?E1G+6XNiWzJPH4mqwp2BCJd3rX5zCchsHni5Pr9oWmwwlnx3s6gbvmqIX+uN?=
 =?us-ascii?Q?Pki/jq0xEd1nRzlHPukOn7axhLEVlIxaS3++EM8hYW3va7O4U1YmsdKCNXNn?=
 =?us-ascii?Q?4gGxAdUynkP9EGv/gCUJGnvZHhODRMwAJ6F5YCjtde6tOdYeyEeem3OZ2GTv?=
 =?us-ascii?Q?RsP7vqJLCLEW4+mL3xW2EXlhrHsz6Bq5bNs+gAjbDcdxCu622ep+FK+p0IdI?=
 =?us-ascii?Q?9OopTFbIqWP69CflE//UROXOTMLebZQpqO+5afRd8ZCf0vvHEWYhiCiuBD9K?=
 =?us-ascii?Q?hRh17IZm8w9VFWPGT+5MvcubS0WtUpFbHd/OLO5+1eqi4mSt1iZk8xLay8f9?=
 =?us-ascii?Q?K5yZ10+jJWJsgt5LtGf9PWPL5wbTjpjMp87bv81kq61VhMkKjlvo45XM2ixU?=
 =?us-ascii?Q?IncBVaPRWllA+X3NCoeT3tcNHnpCv0ltkQQGIDKvhrU8JR07jJM5UgBpHvRQ?=
 =?us-ascii?Q?qQ17IAwtM8IEoas3H7iO2FwNulZoi67Lpvwyt6eJ5qiKTkLGaCDdTq2qiR5/?=
 =?us-ascii?Q?YGVqx/q30H4TZpuno2qvZtCuCNG1hhFJMVwU56RK09P1fHOEh2trtC5K4sg0?=
 =?us-ascii?Q?R20HPIt6s8orsQoP980WD1jE9IomTwO3bhlkecWL+dGcErEo4lDqdTZC9AL6?=
 =?us-ascii?Q?8KH9jThupqfMgc+tApm4R7tzFSccBfrM+6quym/Q3ES6WdFR8PjINMG9px1V?=
 =?us-ascii?Q?60a4HtkHUmGPCaGnl42NVn2u2I/1g/rS1L/728MS5xEWp3TzVErnPmykPFO2?=
 =?us-ascii?Q?ZCpCYdHs5YnA2SfcIV1DUGIGQskib7af2RVu7SbrpoDwS2L1hxhXy1A6q7J7?=
 =?us-ascii?Q?tq9vT3ZJcBdAAAl4pKIu8xZB9LnCGSCUDknJAFMXWCnEub99jQqjlCKjWFND?=
 =?us-ascii?Q?JeqTeq/CUVzE2ElQYK1jFNPIMjiBX7XeVKxXrJHD9WeA90IcDkfQ+Y8KcC0z?=
 =?us-ascii?Q?CwvEFMA2dSzNZoCJ0uGvh5AHuMk/bnhSkP0LTbbgHn1imjZe6ixIGRvRhFMb?=
 =?us-ascii?Q?k3R3SV/qefh8o3BjYuIdsGtIKZrLXfEaFkBtXjIDcZ6hl0srPYLzqajPyJxt?=
 =?us-ascii?Q?aQtthbZnPB/2u23bc69Vu9/p8wrwplLnEAw3/+TewvMIO9WNNNVfFk9/CDnW?=
 =?us-ascii?Q?hlKkOBwkLmc/2SQ1eQROL8lqmZW+nV683twlI9jDrasUIAtysh6H6O+H9jVm?=
 =?us-ascii?Q?h2ntM+TnsPiv2/1Z1tp5xRECVUQbuSF8Z153B5Pr5vAKKzURwzZHwe0uhwcc?=
 =?us-ascii?Q?46QGRc4yLOxd0ibldZekbKIRdbSuh+ySp0g02UhsY618Yp+AGb97NsTruAAQ?=
 =?us-ascii?Q?apI3nGwjP+9ZcLreoGyCQnetLH+o8aUGVVKia2IlOL9Yi6Wz3gL5WPU/z1MG?=
 =?us-ascii?Q?IQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acda79ae-d802-4802-f917-08dc0bb189a3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6342.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 16:40:32.6906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYy3NQj5kJA/MDojhD2tdizqLJsLt/7zxnGeerGqpfE7vBLHyKtB9BwTWGsg+wEbHzjwta3UDCMGct05Qo+BPG6bYd9JrFNG4hgJI73Kdq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4660
X-Proofpoint-GUID: HL1RABfL7VB0UskMNwWobupi8D2cch93
X-Proofpoint-ORIG-GUID: HL1RABfL7VB0UskMNwWobupi8D2cch93
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 clxscore=1011 mlxlogscore=999 priorityscore=1501 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401020125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 16:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193244

From: William Lyu <William.Lyu@windriver.com>

Correct the LICENSE line in the recipe to match the license information
as described in the upstream website [1]:

"License. The libraries and backends are dual GPLv2+/LGPLv3+. The
utilities are GPLv3+."

[1] https://sourceware.org/elfutils

Signed-off-by: William Lyu <William.Lyu@windriver.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.189.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.189.bb b/meta/recipes-devtools/elfutils/elfutils_0.189.bb
index 220f747cb9..1bf1c366ae 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.189.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.189.bb
@@ -2,7 +2,7 @@ SUMMARY = "Utilities and libraries for handling compiled object files"
 HOMEPAGE = "https://sourceware.org/elfutils"
 DESCRIPTION = "elfutils is a collection of utilities and libraries to read, create and modify ELF binary files, find and handle DWARF debug data, symbols, thread state and stacktraces for processes and core files on GNU/Linux."
 SECTION = "base"
-LICENSE = "GPL-2.0-only & GPL-2.0-or-later & LGPL-3.0-or-later & GPL-3.0-or-later"
+LICENSE = "( GPL-2.0-or-later | LGPL-3.0-or-later ) & GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://debuginfod/debuginfod-client.c;endline=28;md5=f0a7c3170776866ee94e8f9225a6ad79 \
                     "
-- 
2.43.0


