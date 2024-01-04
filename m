Return-Path: <william.lyu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCBBC47073
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 18:32:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1467.1704393137749111279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 10:32:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZStVh5iJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1733e6062e=william.lyu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 404I1k1I022810
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Jan 2024 10:32:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=ioIZgJ6j2vx7OLAGjC
	fLex4BnvrlE3FxvhmWBkRnYrY=; b=ZStVh5iJZjfzjKLQFOXHdolFCi64Q0xbTY
	ay8uAg7JgCQ8hwXCFGwZ7OumcbeVv9ipmlS2J+ejNQmbMlh7YRzD4ZBCF09zTTHi
	kvEOirV03FVsn0SQelMfZNNJa6CPjBe4jLIHEd/tpzxkltgns8O3MD+cEsQKMRl3
	HOWEwcMImX8HC8Ku2PiKNzAuAz/2yRAMHoQG6m6bLBmWwgpTvMZwBhqO8xqBcaml
	HpBlBYknhTU3thhpbNVRuhA6i4CVnlWOK3YqpDTTfTrGlHHruh+ML8hSonUcd8bp
	UnhSXHPemTj4zxcrwr6yJdbHM1UQIe0yOd3b1RpiLHij/LlRfXkQ==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ve12a02qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 10:32:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8xJR1BxvMP6xf/S1Ybza9iSCe42Tj8HAXwTCX+gdwOPRGpHo4a86G5f2H2o8PrqnFc62v0yBOwZqVw8J0jgkoqWozRksLIbH492APjiZXqmwJAlaPejaw0Cadbfwgf2FzltGwK8oWPLjOsqnGSYQE7aGMYxEtne1PMHJ9Ml3S76ULbzVrIMBRyoISuSdKr/qPoBcKRRkFkAD8wCIlQeSs70EG/x7SqbkneK9h31syou4b2NcGaXxWJT0sastk+hPiBQ1LXmurYNRfgshMF9jp4zKF36Ur4OHWSE6vFJzjxR8yiEU2Sl23uTTI22VVIArX/x/ktLfoWddLLY7VOxng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ioIZgJ6j2vx7OLAGjCfLex4BnvrlE3FxvhmWBkRnYrY=;
 b=a5sq6JCtdYqe2pFdGKc2ViscnQUmunaEvyhkTYQ5Le0fVeuG0ctG750TYj92QOtYQNNvDAOAStlgEGYJrXIzytCg9ZPPOP/MSi/jgl1/n2xWu8pljfVizwj4eTPZOlHPwvI7Zbcn+NefCXm7Jpc3U1Ngl7WmWTHPx5F+u94olECfUNt7jLOYTv28IcHrbmFTbjdi7wgM83TqCsMEFf/QggK9YyoBvhYnXAS8BOd1tf0KIfJHR4bo4E3xWKKM7L4TBLfFS91bNtvONz8vOyx5VWxjRBunP9K0b57AB7i7ILjgIxbKJon5etg5rShD+3iUyKtuT5S6i+JdTXNTxLJF1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY5PR11MB6342.namprd11.prod.outlook.com (2603:10b6:930:3d::20)
 by MN2PR11MB4742.namprd11.prod.outlook.com (2603:10b6:208:26b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.14; Thu, 4 Jan
 2024 18:32:13 +0000
Received: from CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::dcd6:34af:90b7:15df]) by CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::dcd6:34af:90b7:15df%3]) with mapi id 15.20.7135.023; Thu, 4 Jan 2024
 18:32:13 +0000
From: William.Lyu@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] elfutils: Update license information
Date: Thu,  4 Jan 2024 10:30:45 -0800
Message-ID: <20240104183045.200852-1-William.Lyu@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0022.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::35) To CY5PR11MB6342.namprd11.prod.outlook.com
 (2603:10b6:930:3d::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6342:EE_|MN2PR11MB4742:EE_
X-MS-Office365-Filtering-Correlation-Id: ff7a3eff-f43b-42a2-b507-08dc0d537864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F66ZdCQDzZrKAQLES9g6qKhH7m3sSawi7O9K4bYWjMfkgvbFjU6P+VQ7B2iux5ac2ZrqegcDP09qva7io1g20WdIiarxQ+ZL5HjeApnne108Sspio7ELXK2Am+EQOR/JIwSNZBZr6D8AHmDMqkqfqFmYcoOBfexACcseLTkB92i9YRvRXYc7mczKGG4QqlNDk1i1Yxo2olmT6qjCCGaKDUBuM2XxZqQ9rcbStJD5tpqZQp4Ha+O8Eg59evuqs9EaPlditioEdX9nw2g66wv4ey6f+Ikk48jOKLmjtuJtBI6Ie/LchGRfD3FIBdvtDIi1S5XxNvcH9mV6AFteR4pfZARq2e8c5tl2++kcw9X5SNXnJ+Wt5InJi4dPsqP7GBBCAkSkraSaJcVUzdmEpjEGdGMsZEonrJ8C8zbGzf3V9pn+jLTH7KLRrpqt/6EmcMfgCyb7afRf8Cj4eK6xKMoyW2WWd/P9qClmQrIF3dUkjIcsysvLyMqQfZACkYDRxh75IpOwWnA7oMHgEFkFgaeXKBZw4nCyvjuf20rekjlXG8kAvhf+Pujh/RzPWZ79RrIaoqBlhkl+6E/aY3GyI2dF4n4sWD3SEYWyAZNWSyDg1Is=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6342.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39850400004)(136003)(396003)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(52116002)(36756003)(86362001)(38350700005)(6506007)(6486002)(478600001)(6666004)(966005)(66556008)(66946007)(6916009)(66476007)(9686003)(6512007)(26005)(1076003)(2616005)(5660300002)(15650500001)(2906002)(8676002)(316002)(8936002)(38100700002)(83380400001)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IrUT96ehmqWHBGKsAGexN2bWI+AEfhNQ3U/HcqVE7lF+FhGI+63z+QRXJJq+?=
 =?us-ascii?Q?RHypDCoSzBqEyNBVcMkPD/5BjqKdfRGvWvH0tel0yqWo5ggvjbaSwOlmtm2m?=
 =?us-ascii?Q?pCt8GxZTrVCWR7zpVrJa/3Dz9N34GWldjEyx27ZZyKeJl49xbGXo4/9VtEvm?=
 =?us-ascii?Q?w13t4R5wDWTLCYoWnOtI/14VieFw/pekNGv1GqtyqlTF3e2XVrLLtZP2PD3G?=
 =?us-ascii?Q?GGJexSRgCjSUYrMTrxHXNh5wHu5+gTYgig7wCiHHO6W/G5XuT5iMwJtZ89+8?=
 =?us-ascii?Q?jD5llxTzl6qGsNuaTlBaHN0t/e7Szmv94/MEYWhcWtn74fDO9ksOul7C6URT?=
 =?us-ascii?Q?mLnMSbVepNkSuvOslIUnSMKvv8XBY+GuvzicKuKviyI+RVHnv+2VPq+q84bK?=
 =?us-ascii?Q?YwYZ4p7vyRLU9Kv8om9LFBfrjAl7dLE5BCNRYJqY2frJaDaKuGmp2q0ZeY1O?=
 =?us-ascii?Q?wj30seLkHhoWvDCP8LR3I9t8Y+1Yz568I6AVlmQTf0jzPW8e0Ern/j4OkuRN?=
 =?us-ascii?Q?lCbIvzBWasi6mf+admxvh/XI26fbvX4+E1D8nxQdwWOMQ7+uoip5DyRX6CWp?=
 =?us-ascii?Q?Nmbxhz5vY2p9TiGCFdLA8iZtt9MzP4Kd4ITQk/g0wPAD6khlF4A0TYQtcpak?=
 =?us-ascii?Q?/9XF8zyMv5dQlUm+VY2OtqIKT8MSpTDw4Tb5bfI9II5GHne8GlaYCN4No75g?=
 =?us-ascii?Q?VrjWuNPTzK+xI7o3QrKVMTrkb/ymKzuDWSkZFLUaQkmURa9V2ANtNnQAEKWt?=
 =?us-ascii?Q?SklcXy6SxdFPoAzUY0QgG/YW65t5m+nQJZaM4a4K+H2HzkFUJDT0ngkKQqsY?=
 =?us-ascii?Q?lEgU5dnaeYJsFYGV64JCV7gCSUNfUqp7jYb5Hz2IBOM9sBKqaCemOTjG4o2W?=
 =?us-ascii?Q?1ImFCaIquiJN0pRJtLoQOW18EFXf6Z1u4AyfR3c2QGfEd+TclFZaekHb5oiz?=
 =?us-ascii?Q?l1M32uWpp8IT4aM/nJi3oN2IR+GKs5i2bwwu8iTYjjol3jU7AjuduDa1zw6W?=
 =?us-ascii?Q?MGOOedClY/o2yfTRbump/MFSxxFf/fFiWyuEkpTha8B7jmnkgnu5eQEj5xSb?=
 =?us-ascii?Q?8HiOdiY4Mu8w+Mcbljrw39qss8KoVhoGfUmLkgCheue69Cdrz0vHZoWpI+Ot?=
 =?us-ascii?Q?uJozwme4NI0fi50BwDT1abWR5g7+0uzZ+I3u1l04DisuYrTVb+a62e+An7dB?=
 =?us-ascii?Q?4xsauSVU4483rxFm1qOJTX9wj69mkHusxTahUXfWLKyTMlVmHEv6l+fBIE8s?=
 =?us-ascii?Q?GwEqmqvpgazNTOaqkVKpcx6I0IaFKYDiQdetSul/WL0xHqHCe/hMa9/K08gy?=
 =?us-ascii?Q?V0NWh+uwAtgKwkTXaS4rH3xx03e7jhWHb7cGL9yxDkHWtCbcH2Sy25NTvJeB?=
 =?us-ascii?Q?tYljfleGihT0wcuqVnocz7mIiAILh3XwSc/bUh49HjxKTn+tlBeSWfkPpnqN?=
 =?us-ascii?Q?drBpyyTc021xFlidECP2DFT0EnkbewiVvQGGhu4827meSnvcH1G3fbqm1TxS?=
 =?us-ascii?Q?eaTY89TU4tKsra2AwmuJB8+oN8FalJWG2mnESRhbxsBzAxP/fIpCu8XW88sd?=
 =?us-ascii?Q?TI+VV4Ra2vTBf/gvEDrRBfg3os6UNCsi2TG5yidY6eHcZMmxcgW8ji8wBP4R?=
 =?us-ascii?Q?Yg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff7a3eff-f43b-42a2-b507-08dc0d537864
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6342.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 18:32:13.3892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zft8YiRrRlhoNdOiKLRf3mMTviZU1b3xB9U1Q3tglddcLNMZ4jQTndJQP48YWoj9qbO5rHgPS+FPPnZUdvBWRIeY8HoA5E7yUtqcBY4gcZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4742
X-Proofpoint-GUID: dl_X7HhgLsmRbCFK06c8B-lrA7O2eE6v
X-Proofpoint-ORIG-GUID: dl_X7HhgLsmRbCFK06c8B-lrA7O2eE6v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 phishscore=0 impostorscore=0 suspectscore=0
 adultscore=0 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401040144
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 18:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193336

From: William Lyu <William.Lyu@windriver.com>

Update license information for overall package, package libraries, and
package utilities in the recipe to match the license information as
described on the upstream website [1]:

"License. The libraries and backends are dual GPLv2+/LGPLv3+. The
utilities are GPLv3+."

[1] https://sourceware.org/elfutils

Signed-off-by: William Lyu <William.Lyu@windriver.com>
---
 .../elfutils/elfutils_0.189.bb                | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.189.bb b/meta/recipes-devtools/elfutils/elfutils_0.189.bb
index 220f747cb9..e9b432e4e9 100644
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
@@ -109,19 +109,18 @@ EXTRA_OEMAKE:class-nativesdk = ""
 
 BBCLASSEXTEND = "native nativesdk"
 
-# Package utilities separately
+# Package utilities and libraries are listed separately
 PACKAGES =+ "${PN}-binutils libelf libasm libdw libdebuginfod"
 
-# Shared libraries are licensed GPL-2.0-only or GPL-3.0-or-later, binaries
-# GPL-3.0-or-later. According to NEWS file:
-# "The license is now GPLv2/LGPLv3+ for the libraries and GPLv3+ for stand-alone
-# programs. There is now also a formal CONTRIBUTING document describing how to
-# submit patches."
+# According to the upstream website https://sourceware.org/elfutils, the latest
+# license policy is as follows:
+# "License. The libraries and backends are dual GPLv2+/LGPLv3+. The utilities
+# are GPLv3+."
 LICENSE:${PN}-binutils = "GPL-3.0-or-later"
 LICENSE:${PN} = "GPL-3.0-or-later"
-LICENSE:libelf = "GPL-2.0-only | LGPL-3.0-or-later"
-LICENSE:libasm = "GPL-2.0-only | LGPL-3.0-or-later"
-LICENSE:libdw = "GPL-2.0-only | LGPL-3.0-or-later"
+LICENSE:libelf = "GPL-2.0-or-later | LGPL-3.0-or-later"
+LICENSE:libasm = "GPL-2.0-or-later | LGPL-3.0-or-later"
+LICENSE:libdw = "GPL-2.0-or-later | LGPL-3.0-or-later"
 LICENSE:libdebuginfod = "GPL-2.0-or-later | LGPL-3.0-or-later"
 
 FILES:${PN}-binutils = "\
-- 
2.43.0


