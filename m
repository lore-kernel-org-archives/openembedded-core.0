Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93CE9C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 18:14:48 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.84])
 by mx.groups.io with SMTP id smtpd.web09.1008.1646072087160293171
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 10:14:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com
 header.s=selector2 header.b=Ywu8GfFW;
 spf=pass (domain: nxp.com, ip: 40.107.20.84, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/T6R6rDZp/UNpHyMCGZdcrKt7CpHOa8K9IJ/VbStrZgbwVQMZ8QCCvUxFk2osHgrFWNT/zG0hy20AUwRCKNi0zVs5OfkdmiIWjFtb/iLkmMjhvmagSHiZBwq+a9fLWDklT/OMPdbm3CASjZMu2GN+jhTFTDph3CAbPaM1bXeP9GahkwhhhFq5dlR1o7QrgkkOFSeyBnaLkF6bc/QbzdpSfMncr9zjKL47c1pg6Vp/Cp5x86/2fyiipjpf6fi0x8VFY9AEY5xJRMwVrMQ6cZ5ZJ/Tmj7fxOvEoMiL353/jDwaUea14HnPlcX8KhrgREadryWhk2jerRFO91val5gLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDgJ7BUCkxefWz04Otx/gKAhGyGR4bHfhkPCEch1sO0=;
 b=ZytkH2r1seRIkjvpuoKB45eBKnSilKBfmYvYTbhFjn/dZrP4toIEosX0HvS4p5MTXvgUP9iDAVlO+QixpHt6VgUgGWUPqzQNc5BM/8WeUakKSFZRVwEDnIzQ0pU4wlOJrA5ttrIUgxrBWFtSph+KMSnV+WPo1cySrC2smFersw1h6ix076TyvbxJwXn5RcUU3RKcIcQzrjMFcJXuB/Aq5uHhXyXrZM97U4m7s88neVZ/Pcl6+YUB2NTwWgHpzwgg2SshhPEiqflaAGUxH9ovi4xiIIdX2WsicKsnIT8GEOkxvyk8FuVf9VlqxNMJWrxEH6C7NPtnHJ1mIZMFFNjVfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDgJ7BUCkxefWz04Otx/gKAhGyGR4bHfhkPCEch1sO0=;
 b=Ywu8GfFWHTumDrizxdOj2DeiHLBkXEGd7TTlOyK4ppUVWp/pjKuI1tLVR1MqS0gD5tlq1+7xbl1lAqsi+nDo3y0MFdHI3TIGobXGxTToqLzhJik22PFdBwdfKlOqfQMDEqZhTJGVpgR3HnCp/bKFS6OkrWnwzUXK86+Oz/K1rDo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV1PR04MB9053.eurprd04.prod.outlook.com (2603:10a6:150:1c::8)
 by AM6PR04MB4344.eurprd04.prod.outlook.com (2603:10a6:209:3f::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 18:14:43 +0000
Received: from GV1PR04MB9053.eurprd04.prod.outlook.com
 ([fe80::3405:802:f8a:2ab8]) by GV1PR04MB9053.eurprd04.prod.outlook.com
 ([fe80::3405:802:f8a:2ab8%4]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 18:14:42 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [meta-python][PATCH] python3-pybind11: Override pip install variables
Date: Mon, 28 Feb 2022 12:14:13 -0600
Message-ID: <20220228181413.2943079-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SN7PR18CA0010.namprd18.prod.outlook.com
 (2603:10b6:806:f3::9) To GV1PR04MB9053.eurprd04.prod.outlook.com
 (2603:10a6:150:1c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47391c16-d003-4a55-76d3-08d9fae6310a
X-MS-TrafficTypeDiagnostic: AM6PR04MB4344:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR04MB4344F506EF83307AD28E1483E2019@AM6PR04MB4344.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	72F2a0GMj6zw82L/6aGh7RyYP/REAHWf8pt0zooX2IpTGoD/IFhhVx2j+3+jD7yZN1sjvnlO31PicxATY6hGNF6OifgKsVHMwATDBiA+XY81k6gy/vC79IKe6EaWgqXsFDI30G1G/5TOQjDm31lyN6T+eqQLkX03ed+meOhezBoRhHDlCa798XJZc8gqwWGmb7aFXK5B1KHQW6qSEDRFB11XoKdH2HjVNPtPX1z+StRsMgrr1+L6D0EX1hkOC031LBFwXSNnpPHUFLsTlqTp3vXffpGv6yFTxW4YQhz5gVZQHLNTmNYnJT3qzWdjLAmHFYbhY5A1KgEsq2bDp8awmQHdFo0cTOLNM40Dt7vKaTr77nGGn0LwLeFLlwrV9oQlEDJNa0kEPOJuhZOw8lxE8tpuOfHbIzYLRNGY6sCpYpBePCG9BHnWxSp7CPcoN/OMCQTfOZ+7J+tGaJGHqe58gFwIlnKcTbf5CxTdo4fz5FJBRkUjcZy4iCttrYwx+5Qiia5F9Ar5f4q/8CVmI88YYXMPmfj5iJ896lFTdfk+hCQGdtrL6RgZwbbc+QdnhucpHsLatE04Bz/LaJ6aAFEwNX9oaMMd+scrIdK9ArP2iKTRQPhPZ3kPIZEH9xzoD2o01KlukFAmKCfRisMQxGnvcWtYPoQ6oSdNpZu5EADa8NXtJEd5WeLDsFn+wsN1vNl6BKBiDC4xGxekNIiVmRS7Tw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(26005)(86362001)(1076003)(186003)(52116002)(2616005)(6506007)(44832011)(4744005)(8936002)(8676002)(6666004)(6512007)(4326008)(66556008)(66946007)(66476007)(5660300002)(316002)(6916009)(508600001)(36756003)(6486002)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OLKIHr4GI5+I+ZKkgk/QOioeMEiFUaS8XBB20CPW9pgyK5zGoAnCoCxf4oz7?=
 =?us-ascii?Q?C3byGbdKbhmgDbpvTIMOl5jd50MiKQe2v07QQjonZ8xQ/IanLvz/DFR99S4W?=
 =?us-ascii?Q?bmmwHHAUXTo+DyZwyhb0uLbqB32G4vCgguW7WEFhqGoj/mAUbMsxyO7RJGYr?=
 =?us-ascii?Q?hbgtxJEnjVfXr6RtGRw4kaMo9LqTGgmMCkYDu5c0Xqd3V8LHVJddF79RIPOc?=
 =?us-ascii?Q?5KRuTv7Xm2ypj487I/awvIF37ALzBB5kXCBMEeRvIDE0BaJe3dheL6jvdaMo?=
 =?us-ascii?Q?q91yZy/QRM2pQsENc/fmXUx0soTUz0zI8rQM99Sbl2ZOwSfF3CMvzby6K5sQ?=
 =?us-ascii?Q?SEa6TzE589AFqy1+mWlpSb3eRHPiyEPyxEqgHG9Ujd7ZA2arrOzkD0bceae3?=
 =?us-ascii?Q?pYlzAqqtRxu8QdhTyHT/CFxBBkGg6H/6vpIPfvgIomK1pcpKeCNHcW8h0C66?=
 =?us-ascii?Q?aq2e1qq0IpBV0TW0NPqmbvslobfi/Rn74Br0TMgSmRjuQvC4YkntGRANWDPy?=
 =?us-ascii?Q?pllArz/JhOy07V8GDXcLI+QOxKn+Y1b3TQegRk7nN0wtiuASdC+Nw2KpTIVW?=
 =?us-ascii?Q?x8noaOwKdm6VLFS0gOhF/MHWfjbWmWs+tUkFOfF2iP7UJi6Wb8azxic6g6qy?=
 =?us-ascii?Q?0TJVlcDnUh7CxlV2tEqlRtv5O8U5+3Yu6BpOgq34CBPvwNsvQu96dDEPuZhE?=
 =?us-ascii?Q?XZV28755L6TzsBaNh84QRvLXjnFQ0oQXqR0qMvyDBCZhW/4Ll6q5VJkqwUbT?=
 =?us-ascii?Q?ggS6DDmpiQ28cHCrCW+fsiuhk6dUEW32OM5xDF3eh3gAqiLBbKh+fL4lrATS?=
 =?us-ascii?Q?tbdLdr4LmcYY9Lgb/kFu46NaRhdjOWBW3uhryrGExfMHQk8iI1gJd57dDd0P?=
 =?us-ascii?Q?Tep7uSoFxMRUUWAaHDfrvVL0g0R8VMcphoqGuJ6q3uFj2kVkthCRWM7z6gig?=
 =?us-ascii?Q?1/ltsEWkXwIXOAP/qN4/HJHQDsLi4Oz27n6QrYvD3ZYHIpXZMWCtJBw9NmQI?=
 =?us-ascii?Q?SvN6rqLTtrQk1mf2DG9hnc5SUgR/ypuI7d1HCCbzJdn88BuCblMKoP5vPHRt?=
 =?us-ascii?Q?zGtDUwiA/t04+Iu9xykU/VcYcsf+L7/ov6EPRRM6vv+AqAWl7fAgJ8QIYMH0?=
 =?us-ascii?Q?DJ3oQyM63ZTv+MvREAW0BalnuBebf4bbf7dVsYN/zF/GJd1Sui8Zra7LTR/y?=
 =?us-ascii?Q?aNV7uuLJmommM496RZpQUMn+4PamPumAEhvvIKeLXWQESUspWujPuC2bsQPD?=
 =?us-ascii?Q?FphBlHGQR898CxnopeDtwRGhRGxtYiQq3BhWqY+eyTli/0+AKyn8H3XiEMTp?=
 =?us-ascii?Q?lb+TIVwZLdzMwjngz3g2hKDSdRRxNkBsnN8uCwp/DgDCVhLkhRFRub0U3IcP?=
 =?us-ascii?Q?Uu9pmh7I9eLN4wvB8ULYLC9HPF9obuO8veJCf/0iOr8AKfLDYXeFj6hpaXdC?=
 =?us-ascii?Q?EfpYhUreO9/JABx8G6hZLg3okGjLz8dbF1p5njs9fpPrJwGG5GHcpB7CwSvq?=
 =?us-ascii?Q?a+XjEuQBUwPWM3VK+IjGSDk7ByUe6DoE60tqmZCWYj+IpgW9eoIonsLqcQyk?=
 =?us-ascii?Q?WlHn03i7usC3bqCJk6nhLSOgWXAYeuOnTMaoKil8iuGH9lKpE97lPuFPUNx+?=
 =?us-ascii?Q?IsVE88tUqTrsooxK6BitN/E=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 47391c16-d003-4a55-76d3-08d9fae6310a
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 18:14:42.5264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NETPJ05C+QUlm0X65tUvWJ4b4LYQTH7GGhb9EI9S+/kZEh5l3YZG5bSVnQo2jmDRY0ZudCMUvYPIm9lKgCPFNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4344
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 18:14:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162513

Fix the pip install variables since the default values don't work
here.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb =
b/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
index dfacb41f1..4d94e2033 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
@@ -19,6 +19,9 @@ EXTRA_OECMAKE =3D  "-DPYBIND11_TEST=3DOFF"
=20
 inherit cmake setuptools3 python3native
=20
+PIP_INSTALL_DIST_PATH =3D "${S}/dist"
+PIP_INSTALL_PACKAGE =3D "pybind11"
+
 do_configure() {
 	cmake_do_configure
 }
--=20
2.25.1


