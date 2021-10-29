Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D328C433FE
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 15:09:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6732.1635520181781213123
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 08:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=eZss+WRG;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=693691a099=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19TEPkYM003548
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Oct 2021 15:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=g+fbzP30g5/hFLYwFY4hcXsCMw4D99f3bWKaOjGh9MY=;
 b=eZss+WRG1RRE0JaJkBM6Asel1J1CMaOlXu73Vb7M7/Dyz3ByJjMKLmNfUK1stOGjrrGU
 4OX5jqSneb9VCE57EF3dwSd7lli/tDxxjQwKiRrG5EgAVOIucikINkKU0qndH5szxqLd
 kqNmYT7tG7azTbp8oy59VEeT4EbBj2dF+nB0kXoB52EZIgrqL0YfRaBvkSZOo/mC8KLE
 LUTMYKod8vAEuJ6vXI0xbI4rYu72EhCjYk0/eKMCOE32ddfMHqUauBqudtMrfn2uzEGx
 FnMumQIeb7yp6CSfaP7qhzcmltArGvyLYIyw1a83z/cJT+wVFnV9n+BA8iKAEfI/eJTQ QQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com with ESMTP id 3c0g1gg51k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 15:09:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaK/2qTLdkyJ7E50HVFtYGBquav6H0Lh9k2urBkweKeeyc6vS5gV3vlkdqvvNrcFjvzGstHxoiMI4zE+9ZL83uWGuQDn6mtXPkzMOYpHgL+ufdSOLqVjk8RJkUC1OaY5mo85dQNtJmPdq29w/XWR5fA7rcHdmT7oQFZVebrDF5/aGR7nZQAZLekyHRzQM51mq6eEmIugjRaTOXFzSgJdxjtLbu+7+oTD3kuQIQjolAr3/Wy0rIAT2RPV4fHJCJu/KjVZeF5zgRY8mW3jk2PqaVEWySlj8sfSWvknQV03pi/93ODjuL6FSlOzZexztB82imNiYOxlg0p6PtrBrprr3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+fbzP30g5/hFLYwFY4hcXsCMw4D99f3bWKaOjGh9MY=;
 b=auPQVE3Ivtd4dD5IBTQ+e9MMvX8zN8RUTZSdV46X1YYek4WpZQGmd0lkaD+MylD+ro8AjWexr7sOX5pyb16pXfVWoQELdPq1WxJEtGifybkBdM0RQ7eopLVWoVq1u93YQ1pFGio1KL0c0y/lChfSt5WLb0C0dzMQpVGYw6NeXXfuSqzz8iOV+7tIIt1GAFVm0LZvv2y5MuheIpozhHWc/NE1zTv5cmE19s9tkNMlwvJIP7BnlBf3p+SDuKhapTVlgzn69xJCdMhrMmk9SfKL7Oq05qEZN0UsCGFuCibBdrZ+iJMr60Ao+iaHscxEQYEu+psoUfb5YH4sz/L7lpO1/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3223.namprd11.prod.outlook.com (2603:10b6:a03:1b::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Fri, 29 Oct
 2021 15:09:38 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440%3]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 15:09:37 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][hardknott][PATCH] ghostscript: Fix CVE-2021-3781
Date: Fri, 29 Oct 2021 11:09:21 -0400
Message-Id: <20211029150921.19880-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT2PR01CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::22) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
Received: from yow-lpggp3.wrs.com (128.224.252.2) by
 YT2PR01CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::22) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Fri, 29 Oct 2021 15:09:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94cb065b-33a6-4e20-4c80-08d99aee1fcd
X-MS-TrafficTypeDiagnostic: BYAPR11MB3223:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3223EE860F7E127E4E29EFCC9F879@BYAPR11MB3223.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MlGDMkqMk8VlwLoLHr0UaHtwB9X2pLOtR3PAglF6W2jiZzep8V9KqxdToP6C+twGr6SPQM/eF2EEq5kZIERd0kGNJC2965K4yhTSqtAjNYyhoGxukVDjDfW6gI7+Oi9wBIYIGLuPlJgHpzGOYMPkmFtOhXnEFyETzo0TbibTpw1wG/NLco+9SdbHPHBpDhz1105E3U2o1mMrd5EUinLcXJMRWtwDQ11OUTobLcLiNVgHyOhUMSQyVjOQ+3Z91qoHJncz4/Ek2T94HQ5HYI7BrYxGpW3J6a7ndRgAYu3iGus74Fg1p8voZJuNWuFbPvO0PhXaoaitXUX6kFcgxnOSkqFQFEJbZyoVvHS3LNK6WuDrNk5Fi8hJzcyuu4Z1i4p1ECrdE2TubnPLTR23ZPSFnbH9b26hXJe7EKkAt5ylGJGuWRzHVZPONaLrvhjTZWifMiFnFHrnawwCbEk0OrAlg4/cETQ4I11g4IABFNpaeusoScGz+4t1/32M8rO6rEYhZiuE/WEWg6ntZ1FwuqyJEt0DTEVLHvdFv1S696Rma/kvIpWnHSGac7NXC3xoKlntL5HX3BpUwiGZwc2m0VXlHpd9FxoSDf8EqVHajM3SGkuY4lYk95SpfdvBt+DRITjfNWVp2O9TF9wPpmPrJ2Cq8ZiErMiOqypiQCyUNcghKDAOkZnU4C8LEPOCR1nrqD+aWO2osXMpr+eNnDMlxBpzM7gSbvn9FJrAvBs56z/SR9uB5IALFz7dg1LQqRJORBRrTUoZoMVUUYqHzl7euKd98fXj0PeC/4H42TWwcFRrU+s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(26005)(5660300002)(2616005)(38350700002)(38100700002)(86362001)(6512007)(1076003)(6666004)(8936002)(508600001)(316002)(186003)(66946007)(66556008)(66476007)(6916009)(6506007)(52116002)(44832011)(6486002)(83380400001)(36756003)(8676002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l5it1EWsx7E1YUkMKK3rmDByY6JX0vrVXq4xJsNtqBx2dmAWAS0RGBmTjuq+?=
 =?us-ascii?Q?syTAm6cAqMfIS3HXG4X0zA6AIK4KiuunjSLDcOVOANSuy6KVh49t7wQu+vsp?=
 =?us-ascii?Q?yPR/NwliRPfXvprvV309d1Naex0NIc7SBfLU4lq5oYswm99fPEeDIz48It/x?=
 =?us-ascii?Q?M+tFkc4iSgmz6/a+BcjFkWhOoCUBuDpzJrPOaS0esWG7ObjE1Dtqk3WkdBtR?=
 =?us-ascii?Q?IBHImi6UVdqyxe0QXHltSIv6npZ3+9sFiyerSQUMyxe6YItrHmuFkx3IwCEm?=
 =?us-ascii?Q?1czrHV0/0Y9PhTfbBbH8WVvA0+BuMUqTbQwf4MW74oPi2z4e4oqvj2clHCEM?=
 =?us-ascii?Q?QwCFMoDjccWPgVsedECqUe+tc5WEDq3TktOqTlo1fFCtUv6+WalNlQO3+6To?=
 =?us-ascii?Q?ss/ohInE9VOOWr5EB+K9zmPWnX/p5ukm+YtgE9XGFykAdTowuObplqdgA/US?=
 =?us-ascii?Q?vMQ0zk0MKD1e1BpOtgsd37Nbdx7KWOnqNxfpIzw80UdPAqXn//6a4RSNBYyz?=
 =?us-ascii?Q?tCHl0hLqwI077fdk4jMXBzx2c9C8Wwm1YdmnXETcajwNECPa322885U8sC3s?=
 =?us-ascii?Q?ITrmFgju+qpS+CMQaZKTY42ZeYxEefRw26SR8wjThpY4Up8LaiQGsGDShpbk?=
 =?us-ascii?Q?mLlCYF0W7ENp7c+NwAv7BMz7RX7hgMcJNyB+GfcNRc8WaXQ7g4LKaIqn1WEx?=
 =?us-ascii?Q?EtxRSiNwd7wzyjV7XkVlXoVJLV13AkZNdNq2e7aRzg3EhzEuTr6NT/jY7cNh?=
 =?us-ascii?Q?ZJp3vAdWPyii+7xqg265QdeV/1N9+7G0pWg8DcUMTcGRI/SsV8w02b8LaSHD?=
 =?us-ascii?Q?kz9fU51wu1+96M0YFcQArwpVhuqyPBmQn10DZApWhs9K6HqhWWqGBgh+qmpQ?=
 =?us-ascii?Q?dUWZJOGhMKvCwu0wXQfetMrX0g0Bfs+YI8ALSfDTiMD6EbUw8MVvU9k9+G1c?=
 =?us-ascii?Q?UeRCTYujFuTfbpbhR0eoKES6fNqBviyuFS0cd/J3sPsbhawlOrv8JbrmM7bV?=
 =?us-ascii?Q?Qdsw60oamO34Ot0zyUaB1lQtvZfyIeu3LL9Q3mcPGz9sluqQ88xFFalEZNeC?=
 =?us-ascii?Q?IQE49hRbsR8/+45HXDHuMS7nKpkI+nN/jKGmZiWEPcxzLBm85MPPyh0Up/Z9?=
 =?us-ascii?Q?wMWOgV/KjFliVv7S4Bj6cn3fv6rLcthahIJffzevRwcCRZPQQS38PaIsilE8?=
 =?us-ascii?Q?n9/PJ+Pa+uIgIpGxXQl6sqjJXvL09MGfPeN6ExRFx2avaBrvTuD6WB1f7cAU?=
 =?us-ascii?Q?iDnIsaQ/zNWBEGtUWnGF4TqHLSC4nA2rpNRagHOVW9PXjw2GWBumOoRY67EF?=
 =?us-ascii?Q?mGBwoexmj1WshFipET2oZIjhiG2Dn1LtVopzuROUKo92byiZOf72KftdpM4Z?=
 =?us-ascii?Q?Wa8eJwfy3Xd1B3dgmIVEt1LbIluybgULqVdf47Eddexm+C2iUgycKH4bCSrB?=
 =?us-ascii?Q?jI1/aQg9cxNo4GXsy+Po14i5IgJ9rcRDazEvD1IC9VcO6aLXDLWEKsi7DQaw?=
 =?us-ascii?Q?QJPVSF1P+OdDnPIZUQGklNroyH+bId3hRhl2mLz3Wl3LR5+YeJCd/csUeJP0?=
 =?us-ascii?Q?FUwrcCApuBuEXsyVlqT6SQXEZSp2gZ1KpDdGWaVrzFpz51khXy4lKmuN2uMg?=
 =?us-ascii?Q?kO/+XYEEg0X639r8tWd6OzBDN4MkPBgVKANBjXxd88irx7qQFu/nac6iVjaw?=
 =?us-ascii?Q?08CQZw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 94cb065b-33a6-4e20-4c80-08d99aee1fcd
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 15:09:37.7886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VgbsxXGbKchvEIQAYzE5spQmuB3UxwusLh5pKewcn+ym958j6pvruWuaejSFhE1uGmVyCiRa/9bElcFCUmt6oFyi4Tgpi+P1rQbl8hUKw/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3223
X-Proofpoint-ORIG-GUID: NGjt5DGEqOx3Xl2H3aTU_cPgWdhsaClx
X-Proofpoint-GUID: NGjt5DGEqOx3Xl2H3aTU_cPgWdhsaClx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-29_03,2021-10-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0
 clxscore=1011 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2110290087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Oct 2021 15:09:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157624

Backport a patch file from upstream, since doing an uprev of the recipe
to the version with the fix (9.55) would introduce functional changes.

CVE: CVE-2021-3781

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...de-device-specifier-strings-in-acces.patch | 238 ++++++++++++++++++
 .../ghostscript/ghostscript_9.53.3.bb         |   1 +
 2 files changed, 239 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-Bug-704342-Include-device-specifier-strings-in-acces.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-704342-Include-device-specifier-strings-in-acces.patch b/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-704342-Include-device-specifier-strings-in-acces.patch
new file mode 100644
index 0000000000..44bdfbba35
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-704342-Include-device-specifier-strings-in-acces.patch
@@ -0,0 +1,238 @@
+From a9bd3dec9fde03327a4a2c69dad1036bf9632e20 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Tue, 7 Sep 2021 20:36:12 +0100
+Subject: [PATCH] Bug 704342: Include device specifier strings in access
+ validation
+
+for the "%pipe%", %handle%" and %printer% io devices.
+
+We previously validated only the part after the "%pipe%" Postscript device
+specifier, but this proved insufficient.
+
+This rebuilds the original file name string, and validates it complete. The
+slight complication for "%pipe%" is it can be reached implicitly using
+"|" so we have to check both prefixes.
+
+Addresses CVE-2021-3781
+
+CVE: CVE-2021-3781
+
+Upstream-Status: Backport (http://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=a9bd3dec9fde03327a4a2c69dad1036bf9632e20)
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+---
+ base/gdevpipe.c | 22 +++++++++++++++-
+ base/gp_mshdl.c | 11 +++++++-
+ base/gp_msprn.c | 10 ++++++-
+ base/gp_os2pr.c | 13 +++++++++-
+ base/gslibctx.c | 69 ++++++++++---------------------------------------
+ 5 files changed, 65 insertions(+), 60 deletions(-)
+
+diff --git a/base/gdevpipe.c b/base/gdevpipe.c
+index 96d71f5d8..5bdc485be 100644
+--- a/base/gdevpipe.c
++++ b/base/gdevpipe.c
+@@ -72,8 +72,28 @@ pipe_fopen(gx_io_device * iodev, const char *fname, const char *access,
+ #else
+     gs_lib_ctx_t *ctx = mem->gs_lib_ctx;
+     gs_fs_list_t *fs = ctx->core->fs;
++    /* The pipe device can be reached in two ways, explicltly with %pipe%
++       or implicitly with "|", so we have to check for both
++     */
++    char f[gp_file_name_sizeof];
++    const char *pipestr = "|";
++    const size_t pipestrlen = strlen(pipestr);
++    const size_t preflen = strlen(iodev->dname);
++    const size_t nlen = strlen(fname);
++    int code1;
++
++    if (preflen + nlen >= gp_file_name_sizeof)
++        return_error(gs_error_invalidaccess);
++
++    memcpy(f, iodev->dname, preflen);
++    memcpy(f + preflen, fname, nlen + 1);
++
++    code1 = gp_validate_path(mem, f, access);
++
++    memcpy(f, pipestr, pipestrlen);
++    memcpy(f + pipestrlen, fname, nlen + 1);
+ 
+-    if (gp_validate_path(mem, fname, access) != 0)
++    if (code1 != 0 && gp_validate_path(mem, f, access) != 0 )
+         return gs_error_invalidfileaccess;
+ 
+     /*
+diff --git a/base/gp_mshdl.c b/base/gp_mshdl.c
+index 2b964ed74..8d87ceadc 100644
+--- a/base/gp_mshdl.c
++++ b/base/gp_mshdl.c
+@@ -95,8 +95,17 @@ mswin_handle_fopen(gx_io_device * iodev, const char *fname, const char *access,
+     long hfile;	/* Correct for Win32, may be wrong for Win64 */
+     gs_lib_ctx_t *ctx = mem->gs_lib_ctx;
+     gs_fs_list_t *fs = ctx->core->fs;
++    char f[gp_file_name_sizeof];
++    const size_t preflen = strlen(iodev->dname);
++    const size_t nlen = strlen(fname);
+ 
+-    if (gp_validate_path(mem, fname, access) != 0)
++    if (preflen + nlen >= gp_file_name_sizeof)
++        return_error(gs_error_invalidaccess);
++
++    memcpy(f, iodev->dname, preflen);
++    memcpy(f + preflen, fname, nlen + 1);
++
++    if (gp_validate_path(mem, f, access) != 0)
+         return gs_error_invalidfileaccess;
+ 
+     /* First we try the open_handle method. */
+diff --git a/base/gp_msprn.c b/base/gp_msprn.c
+index ed4827968..746a974f7 100644
+--- a/base/gp_msprn.c
++++ b/base/gp_msprn.c
+@@ -168,8 +168,16 @@ mswin_printer_fopen(gx_io_device * iodev, const char *fname, const char *access,
+     uintptr_t *ptid = &((tid_t *)(iodev->state))->tid;
+     gs_lib_ctx_t *ctx = mem->gs_lib_ctx;
+     gs_fs_list_t *fs = ctx->core->fs;
++    const size_t preflen = strlen(iodev->dname);
++    const size_t nlen = strlen(fname);
+ 
+-    if (gp_validate_path(mem, fname, access) != 0)
++    if (preflen + nlen >= gp_file_name_sizeof)
++        return_error(gs_error_invalidaccess);
++
++    memcpy(pname, iodev->dname, preflen);
++    memcpy(pname + preflen, fname, nlen + 1);
++
++    if (gp_validate_path(mem, pname, access) != 0)
+         return gs_error_invalidfileaccess;
+ 
+     /* First we try the open_printer method. */
+diff --git a/base/gp_os2pr.c b/base/gp_os2pr.c
+index f852c71fc..ba54cde66 100644
+--- a/base/gp_os2pr.c
++++ b/base/gp_os2pr.c
+@@ -107,9 +107,20 @@ os2_printer_fopen(gx_io_device * iodev, const char *fname, const char *access,
+            FILE ** pfile, char *rfname, uint rnamelen)
+ {
+     os2_printer_t *pr = (os2_printer_t *)iodev->state;
+-    char driver_name[256];
++    char driver_name[gp_file_name_sizeof];
+     gs_lib_ctx_t *ctx = mem->gs_lib_ctx;
+     gs_fs_list_t *fs = ctx->core->fs;
++    const size_t preflen = strlen(iodev->dname);
++    const int size_t = strlen(fname);
++
++    if (preflen + nlen >= gp_file_name_sizeof)
++        return_error(gs_error_invalidaccess);
++
++    memcpy(driver_name, iodev->dname, preflen);
++    memcpy(driver_name + preflen, fname, nlen + 1);
++
++    if (gp_validate_path(mem, driver_name, access) != 0)
++        return gs_error_invalidfileaccess;
+ 
+     /* First we try the open_printer method. */
+     /* Note that the loop condition here ensures we don't
+diff --git a/base/gslibctx.c b/base/gslibctx.c
+index 6dfed6cd5..318039fad 100644
+--- a/base/gslibctx.c
++++ b/base/gslibctx.c
+@@ -655,82 +655,39 @@ rewrite_percent_specifiers(char *s)
+ int
+ gs_add_outputfile_control_path(gs_memory_t *mem, const char *fname)
+ {
+-    char *fp, f[gp_file_name_sizeof];
+-    const int pipe = 124; /* ASCII code for '|' */
+-    const int len = strlen(fname);
+-    int i, code;
++    char f[gp_file_name_sizeof];
++    int code;
+ 
+     /* Be sure the string copy will fit */
+-    if (len >= gp_file_name_sizeof)
++    if (strlen(fname) >= gp_file_name_sizeof)
+         return gs_error_rangecheck;
+     strcpy(f, fname);
+-    fp = f;
+     /* Try to rewrite any %d (or similar) in the string */
+     rewrite_percent_specifiers(f);
+-    for (i = 0; i < len; i++) {
+-        if (f[i] == pipe) {
+-           fp = &f[i + 1];
+-           /* Because we potentially have to check file permissions at two levels
+-              for the output file (gx_device_open_output_file and the low level
+-              fopen API, if we're using a pipe, we have to add both the full string,
+-              (including the '|', and just the command to which we pipe - since at
+-              the pipe_fopen(), the leading '|' has been stripped.
+-            */
+-           code = gs_add_control_path(mem, gs_permit_file_writing, f);
+-           if (code < 0)
+-               return code;
+-           code = gs_add_control_path(mem, gs_permit_file_control, f);
+-           if (code < 0)
+-               return code;
+-           break;
+-        }
+-        if (!IS_WHITESPACE(f[i]))
+-            break;
+-    }
+-    code = gs_add_control_path(mem, gs_permit_file_control, fp);
++
++    code = gs_add_control_path(mem, gs_permit_file_control, f);
+     if (code < 0)
+         return code;
+-    return gs_add_control_path(mem, gs_permit_file_writing, fp);
++    return gs_add_control_path(mem, gs_permit_file_writing, f);
+ }
+ 
+ int
+ gs_remove_outputfile_control_path(gs_memory_t *mem, const char *fname)
+ {
+-    char *fp, f[gp_file_name_sizeof];
+-    const int pipe = 124; /* ASCII code for '|' */
+-    const int len = strlen(fname);
+-    int i, code;
++    char f[gp_file_name_sizeof];
++    int code;
+ 
+     /* Be sure the string copy will fit */
+-    if (len >= gp_file_name_sizeof)
++    if (strlen(fname) >= gp_file_name_sizeof)
+         return gs_error_rangecheck;
+     strcpy(f, fname);
+-    fp = f;
+     /* Try to rewrite any %d (or similar) in the string */
+-    for (i = 0; i < len; i++) {
+-        if (f[i] == pipe) {
+-           fp = &f[i + 1];
+-           /* Because we potentially have to check file permissions at two levels
+-              for the output file (gx_device_open_output_file and the low level
+-              fopen API, if we're using a pipe, we have to add both the full string,
+-              (including the '|', and just the command to which we pipe - since at
+-              the pipe_fopen(), the leading '|' has been stripped.
+-            */
+-           code = gs_remove_control_path(mem, gs_permit_file_writing, f);
+-           if (code < 0)
+-               return code;
+-           code = gs_remove_control_path(mem, gs_permit_file_control, f);
+-           if (code < 0)
+-               return code;
+-           break;
+-        }
+-        if (!IS_WHITESPACE(f[i]))
+-            break;
+-    }
+-    code = gs_remove_control_path(mem, gs_permit_file_control, fp);
++    rewrite_percent_specifiers(f);
++
++    code = gs_remove_control_path(mem, gs_permit_file_control, f);
+     if (code < 0)
+         return code;
+-    return gs_remove_control_path(mem, gs_permit_file_writing, fp);
++    return gs_remove_control_path(mem, gs_permit_file_writing, f);
+ }
+ 
+ int
+-- 
+2.33.0
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb b/meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb
index 35826c2549..216822478f 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb
@@ -33,6 +33,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://do-not-check-local-libpng-source.patch \
                 file://avoid-host-contamination.patch \
                 file://mkdir-p.patch \
+                file://0001-Bug-704342-Include-device-specifier-strings-in-acces.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.33.0


