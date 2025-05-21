Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB49C54E65
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:10:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6836.1747818601137684185
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 02:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7236ba3e52=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L4U8WC023555
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 02:10:00 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfr92uq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 02:10:00 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54L9A0sJ020363
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 02:10:00 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfr92um-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 02:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JX/v35ruCEf3K8YpiLOFx/TbVq/ZKX51ymHe2QPhG6ymke6AxXPScvMvv/8hUB4PZCGtnQi+QM/FOFn3VmUiolwIkbVHoc6sAFMs2PR+c+sxOt2Hsu3zyeHx5LKvgqzbGhcJPcfXxH/QD0FNfEkXI9m8wTtgwV+NO0ptFnLgnCR4a5EPHhl/93pzfuja3l5naEDfpBKHffFkE9dUA1DlJh5j29Crn59ONCjWFeWQ59e0QzYMiVujp549lwAFZ65Ld7c0WU6UIAMOFMToSgz/hbUkbWaej9fkaFYZMBE3kkuI8ZfVzTNaSXgC3yxh1OvaHTH+LlRn81x7e+HkpZRvZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8suWAioWhksswb8KigGdfFZlt/tZI/M9+pFzO7zlAc=;
 b=Oo18rEipjSd+hQFo3WHQ/3AfeQBqgWptpdfsEbJrBMb2aPhLOOg69vCnxZNzhREcsrxCTgtlCP8pqPOp7vsn47V4DojVLnmTG77T3/6UHCgvLEx69i/8wH+v4eD2vmEPuxthsBfBh7RWpJErLIDI26plWwhsyYALlT35Ts4WD7BTsnL0AtQE6Cj8lc1TdFV3V5gvPOfNpsuEqmMOZlmAjY6I/J9+2BW1YPmE6COO0yNOrTVhmXE1/NuXNgPwSnIEGHmZwKxGtLzzaQ01lsH7rvF1+x1FCMLh/AIlzwyu/7EciD4i4yVPeXV5GxLuNqtYW1O34Hj0wqK++C3+rYWPgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 by CO1PR11MB4945.namprd11.prod.outlook.com (2603:10b6:303:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 21 May
 2025 09:09:55 +0000
Received: from CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::7cb0:dd30:85d3:8f69]) by CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::7cb0:dd30:85d3:8f69%4]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 09:09:55 +0000
From: sundeep.kokkonda@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, steve@sakoman.com
Subject: [kirkstone][PATCH] gcc: AArch64 - Fix strict-align cpymem/setmem
Date: Wed, 21 May 2025 02:09:16 -0700
Message-Id: <20250521090916.974418-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.35.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0018.namprd08.prod.outlook.com
 (2603:10b6:a03:100::31) To CH3PR11MB8443.namprd11.prod.outlook.com
 (2603:10b6:610:1bd::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8443:EE_|CO1PR11MB4945:EE_
X-MS-Office365-Filtering-Correlation-Id: f6385715-071f-4a12-6ba6-08dd98474097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fzjdTGuGYkiJnXpUdO8N+qW47hWP2UgMq82r6hrimSnEI6A8EHYbd1j5jILJ?=
 =?us-ascii?Q?yWiHQg1STygWiheHkUV+VCYPAj2ojRvIsWtXw0mjTHnNpj5DreDtt5BJRLhE?=
 =?us-ascii?Q?M+0uJw1jCdC0TxeWNQWdSDK+n8VAxfRN0Kl+L9lrSvXlBZZYvqTmCn5WP2Yh?=
 =?us-ascii?Q?GydRDADzzXrB2oMqLSkFaTNK5VnKG81DiG59ul0SM2PkDMI1AXxggbuzmnki?=
 =?us-ascii?Q?RAGEjlPQolrfRHFqHE2CoYFnorg6lW/vpMG240ukW3FcjBoCbaWpiwtHMftq?=
 =?us-ascii?Q?m19s+hyr32/+86iBUoTnSC2sAKG6H937LtR3mN4VEPaUsbrFSZ4KSe/qWRYJ?=
 =?us-ascii?Q?M/4SpREyJ/yrjwaEySv96kPh2G0Y/ecUzkPkjBZlhA7Kcc7sHhf086u7uy+R?=
 =?us-ascii?Q?euNU9Rmw+P9EuCaEAyl/0p8/4Lolvvz63JYp0zuBTOM3l3i7o7v3iB9jfM7L?=
 =?us-ascii?Q?7W9M48AdNAaBq+ftyIra20bPxk5pBf7j2bXH3SBkjy6w7JH8Y0I1yy0BJoO2?=
 =?us-ascii?Q?wDceUoaiGOpc9uG01J/3BPFBA+WQ5Jq8FoAIbd2X13sG+33feGtU9S0MZCs0?=
 =?us-ascii?Q?QByHTdZaj5u17F9N2210kjDCnMTxhnNbs7guQSuvdrML1Vu/WzFXlC1fW2I+?=
 =?us-ascii?Q?nc7RNh/I/wwraOBur3NPwWnzqM4Bfl+hPwvPThzK4ZTrGsLPA9/O43O6NSRw?=
 =?us-ascii?Q?IolaKMA8xVOFPYUHLExU9N2otq7kYMz0EYep9T0YYkqUBZ0wmiv7N56VVUv+?=
 =?us-ascii?Q?lxudH+QQOYLLaEMQiGxXaXZx7PGU6wdTR3NLWAICkyAkmL64c5/1fMGD8dMI?=
 =?us-ascii?Q?9FvnUafJyvE94YdORUUpCM0kpJjj6FsIS7BHLNZFQDXdxMbx9BfqdWNyzSYE?=
 =?us-ascii?Q?EWpAKN7v6fuu/X3hHqh2ShVUb+lE2o7Zb8xwpPVyMcv2sjkLe05Vnd34E52o?=
 =?us-ascii?Q?DuBv24Cz8YPG3cbk1qKdFVzxvjkJh3iA3sFgGSZDEDxRBIrLCrK05eu/rHZH?=
 =?us-ascii?Q?wa5/hVdyyqMF/9iZivxFX+0gbDjwLHgEIBELHuskAFRF3osDYWdsYptC3gPb?=
 =?us-ascii?Q?REP9A99U1JGLjlPGpVqxwfBWg5JUZkz/9b6+NsrWy9aw8QDuf+Lz0dx0BKFR?=
 =?us-ascii?Q?wQCPhF31eh//B1esVtiV63OV6rAeIANKjC5nujCn6rhd5RPlf6kSG28+B1rI?=
 =?us-ascii?Q?eYc5m9xup8wm11IiVYke5H3eH8bmPsFCSJHg1Qv7UB4BxxzQtbR/4AqXJiPV?=
 =?us-ascii?Q?jIo1HsJ5wEnhl4+qJ6ruAd/58vViCeM8XiS9Z3P6s5cv6Ului4E+0CrOhSsc?=
 =?us-ascii?Q?O5uPahsxB10tF73gEGOwXPATWo7cXuVrKLvgY55zaIMU4QDDnZLyMwk2e3u9?=
 =?us-ascii?Q?9nxOkAsi4E3mJhTCxRGgJN8sDR8MW6Xiferj26ArTUVSzb15ioKxxn9vKdiS?=
 =?us-ascii?Q?fA2HSbgdbMk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8443.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cOActUte3YOdRi0hHybWMlxYBkbBlyuuafUGrYmu8vDNoJW/oAly0lMryfmh?=
 =?us-ascii?Q?fqBsAcwn5ScYP2g7mJdmXigargWWZIIOdSPQNJlZG2Xy0TdQLzUN2k9rvogy?=
 =?us-ascii?Q?qiU7Lcv+7xbxBHGQaUPet/hCIH6MOpOBAPrFPfFT59vMQYUPGN4nppd4SWPP?=
 =?us-ascii?Q?4BDDo981462FoPqhS1DXdpyLTYtYIl+dXLWn8hMOJpavpzP/hvIKDcndRFoV?=
 =?us-ascii?Q?bRYflCY0ZIYLI0DcRGylSiUQbF76xluCmGpsQ8WxZaY20XHjdeLCHUOPllfh?=
 =?us-ascii?Q?SvOwClF66Zw8PjSB/9/Q4E869Uz54g2qn0EEVle0KFSKiDIYH/albNBHL23t?=
 =?us-ascii?Q?sVfv90lneZRnK5WdxT8T7AhG5GZ3KIyj3AdeOrBYG9BQeIGIjCz9L8Bjsyel?=
 =?us-ascii?Q?Up10tkgqpg2elOGtRqiEOeXfYlWinv6tD8ruMH6+MrB71mJens5F+xobj95H?=
 =?us-ascii?Q?BjjjK07EDXfpSt9wHdPt1DXJk9oadvxvraMnAa5lwvEAflDspZY4Z/DG31NI?=
 =?us-ascii?Q?mqLQsLhBEgy0CjG4uRWlaBA4r/rHtbnPgkZRlkdrfH7VDHh4CCRQFm1h4wCQ?=
 =?us-ascii?Q?U1vk1G2/Vy/APl4oHpAZgVVKJN8vn7EdMZ8qPaP41xzGmj/1CcUHv4VHSXor?=
 =?us-ascii?Q?X8RQPAPCJk1LKGB+MAy3Myi0WkWu7NVyBYfk2NtecGZ/TXoOYRNj6bbHK8qy?=
 =?us-ascii?Q?u0+VG/6Cz2Eu/TqmpGNXxomPgfFYUQ5Ds6caxve8DusBK/cVzrwXtuvmY4yV?=
 =?us-ascii?Q?IKGNTivpBNXCMmlxnOQA5rD9Brn5k+HrUcg8OsR4HqglfbgV4RRW5LyOn6QF?=
 =?us-ascii?Q?JeucuQESPIX9MWN1/myPJd36JFj8ri7ItURktDSSfWv3y4Ps7wIdy6NHNc6p?=
 =?us-ascii?Q?zD0fKL/gdBrgAkKdfGByK/Hmweo3SbQePkPKpkwwL92WXkC55k31DdmdD7yp?=
 =?us-ascii?Q?81bzj02YJ917xaDjloAStkP8vJLhjLjj7FfHaBZO+B1OMPQG92LngbRKjGGY?=
 =?us-ascii?Q?E0jY26leevcwGMLl8kC2Cawtkddop8oVByrVChprzLSvXg5Loj1pxN/OzZOd?=
 =?us-ascii?Q?d+Me/WqsH7pVI284Al5rfoEjCVOTfU5xerRqN5boYSwxgmEbdJW7qjUfZ+5n?=
 =?us-ascii?Q?gPd//MOJxW7Eou6YXY/6rpupZ+cLWUtjff6fsKDnh6sTEPTVbfANbHRAUWUm?=
 =?us-ascii?Q?pKhXdpaJ1SsENKtv2kVozXSA8N9yZZ5RwbwcNBiDrFeI37NO2bR+BaUUr3vQ?=
 =?us-ascii?Q?qb50zTN+WJVvVAMOkJZ08ZvSOBtBlDCK4B/1kcLOeZalfGKjZeo60lbuoMTu?=
 =?us-ascii?Q?BWeITs3U+JmUUuTJZFx1kKXsbIh41nOxiFm88AS1xiBLr8PCV5kdpm/X5wWx?=
 =?us-ascii?Q?g/Im2X6Z+eq6DxZ479tx3CeYdxqMr90NVwX3hUSZLlzrTqv9H9X90fFPIsMB?=
 =?us-ascii?Q?SbY1by6pOjlIjQvDTZJT4RyJlEdeTKTwxvBoFr/O4r0xzINcelsFMHl99PeY?=
 =?us-ascii?Q?saTFI+SBBhM6u4R0W0uLdmEq4xrEMqm2Vy67sBtqLFJIg5Teb91lkdx+GqUy?=
 =?us-ascii?Q?T9alc5KegU32qEYXWIPPGJb7mby4p1oDlo8ioLNXLKNSuVXiB5pSavjCND5D?=
 =?us-ascii?Q?VQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6385715-071f-4a12-6ba6-08dd98474097
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8443.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 09:09:55.1987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XV5WeqUpTXGcqdCXHC9jfGu04f5EtYuqAKwbI40Pgzx97ls4THKX9GQN0qpghdEcmbZIk4tSjcW1AFb8T0+m0pGuHqRuhhZnstSHLqISR2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4945
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA4OSBTYWx0ZWRfX+tm1+OkuVM0Y uGiCiPBmzUxZ6QbnYJ/tpnUitwH++HbLgHrzwZFz5uRj6JZeasnEwIQP9jzaMQmkpDSX4dujs45 M1Rac3ZkRnefEZtvq3adMIowyy3i4064T3y0lYO9DDLU+xiuqF5bRnfTf7xiAGOBt+JZ2jPxKge
 ef0lCTLTicm4GAky8OJ+bvjKAQRProDHzlayCtfpdcDYUW9ZUn7IplHclPgxsHPudqVzrCt1Qgc CrVjvLxahmB56oEAE77rW2+vtCQdo5hQoJx0GjhYZOQFIv9HXoB6x+rdHHae4PaWJyrNKL1Pg4p HCXcCXyYg7xBAxaYV5+ciQybks3dpcdE630G4HcF6EoJwaIvm8B3JV4te31poGgSYFliKotbgkd
 1Mg3yjl1xN39wzV7oWwDMHsbn9MMG42ZHGCwYw94lRfz/LtEbF0op5Ot3qbmLrpBveXs4xRU
X-Proofpoint-ORIG-GUID: PM4Puct48zcNgYMpZOfugWd2zcMBXOGx
X-Proofpoint-GUID: _XdhFS3Cg6gsaqP5smjsZMIICjlJ8cvl
X-Authority-Analysis: v=2.4 cv=TrPmhCXh c=1 sm=1 tr=0 ts=682d9868 cx=c_pps a=F+2k2gSOfOtDHduSTNWrfg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=L9uzE61KTqSsj0ZRaLQA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=832
 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1011 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505210089
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 09:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217009

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

The cpymemdi/setmemdi implementation doesn't fully support strict alignment.
Block the expansion if the alignment is less than 16 with STRICT_ALIGNMENT.
Clean up the condition when to use MOPS. (PR103100)

Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=b9d16d8361a9e3a82a2f21e759e760d235d43322]

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-11.5.inc        |  1 +
 ...rch64-fix-strict-align-cpymem-setmem.patch | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.5.inc b/meta/recipes-devtools/gcc/gcc-11.5.inc
index f17ec9da5c..1e8371b2bd 100644
--- a/meta/recipes-devtools/gcc/gcc-11.5.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.5.inc
@@ -60,6 +60,7 @@ SRC_URI = "\
            file://0029-Fix-install-path-of-linux64.h.patch \
            file://0030-rust-recursion-limit.patch \
            file://0031-gcc-sanitizers-fix.patch \
+           file://0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch \
            file://0001-CVE-2021-42574.patch \
            file://0002-CVE-2021-42574.patch \
            file://0003-CVE-2021-42574.patch \
diff --git a/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch b/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch
new file mode 100644
index 0000000000..4c2d827799
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch
@@ -0,0 +1,45 @@
+gcc: AArch64 - Fix strict-align cpymem/setmem
+
+The cpymemdi/setmemdi implementation doesn't fully support strict alignment.
+Block the expansion if the alignment is less than 16 with STRICT_ALIGNMENT.
+Clean up the condition when to use MOPS.
+
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=b9d16d8361a9e3a82a2f21e759e760d235d43322]
+
+Signed-off-by: Wilco Dijkstra <wilco.dijkstra@arm.com>
+Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
+---
+--- a/gcc/config/aarch64/aarch64.c	2025-05-08 20:40:10.969865898 -0700
++++ b/gcc/config/aarch64/aarch64.c	2025-05-13 23:11:07.006796627 -0700
+@@ -23621,14 +23621,15 @@
+   int mode_bits;
+   rtx dst = operands[0];
+   rtx src = operands[1];
++  unsigned align = UINTVAL (operands[3]);
+   rtx base;
+   machine_mode cur_mode = BLKmode;
+ 
+   /* Only expand fixed-size copies.  */
+-  if (!CONST_INT_P (operands[2]))
++  if (!CONST_INT_P (operands[2]) || (STRICT_ALIGNMENT && align < 16))
+     return false;
+ 
+-  unsigned HOST_WIDE_INT size = INTVAL (operands[2]);
++  unsigned HOST_WIDE_INT size = UINTVAL (operands[2]);
+ 
+   /* Inline up to 256 bytes when optimizing for speed.  */
+   unsigned HOST_WIDE_INT max_copy_size = 256;
+@@ -23750,11 +23751,12 @@
+   unsigned HOST_WIDE_INT len;
+   rtx dst = operands[0];
+   rtx val = operands[2], src;
++  unsigned align = UINTVAL (operands[3]);
+   rtx base;
+   machine_mode cur_mode = BLKmode, next_mode;
+ 
+   /* We can't do anything smart if the amount to copy is not constant.  */
+-  if (!CONST_INT_P (operands[1]))
++  if (!CONST_INT_P (operands[1]) || (STRICT_ALIGNMENT && align < 16))
+     return false;
+ 
+   bool speed_p = !optimize_function_for_size_p (cfun);
-- 
2.35.5


