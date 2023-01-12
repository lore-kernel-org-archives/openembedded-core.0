Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44261C54EBD
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 13:28:28 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.53])
 by mx.groups.io with SMTP id smtpd.web11.54949.1673530103667630546
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jan 2023 05:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=dTnFGVpY;
 spf=pass (domain: vaisala.com, ip: 40.107.6.53, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDK+wo49yANomhDx9r/wWneDtjf2EYPzm3qBxpH7Ayy992BJuXDUfD8qQCGlrLLKELCAnpCDCDT8V2YtAOzPcMcv5XR29gKkdYViQh4I80PJ0oQ8TM5/h67vJG3Qm/93NQraWJ16ci2LQVR+8hIl0HRBdRiEbB+SiQXB18imUqA934XzRvy59x2sGvd/E8+Od4CiQzppTH7tyTJRCENIXFJpEJfWDVxtw+fZdPraFGvI56oP3fz0MKTPNtotN3JRbd42nbIj82cvl4VJ6DsEUj9QuGq8BF7Oig2jawrEheQY44RBA5kKcwWMW73PFbnUIjQO7+pNW9H4zVpXjDBC+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=maD5+525oDupSO48P8F0dydd1TUYfowERt+eLln0aOQ=;
 b=cN5L3RVR4+dSRpcGFgtVCdaTiAY6SAbtKynPk716XXbw3ZERgmOSjaKCM8U/SQCx4iv7UmzYkdrv1twVFEqO9jr1/BM7WaNGWm0jSywwo4bY5YTV1dAjPDlHM8PANK0X7N7Cnps+9zp5ORzN/CHrUk8kVAc3P121xx7Xdt+FFAyrC4U4SrO7IbKhz9ZarqyyKnv6mB9Wi1xM2Gfbyx4lYMT888zxNHttFFvIcPJQ0gU6qy2LwimU0HT/cJ/TeRV/fGLAbdK85AsK+bPQEEHh2zS8aM0Ey3VzpjvD6bNIsGXXrzrjVtk7naRNULmcS0EjgRiAXipUsLg4DTeS9LJ8Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maD5+525oDupSO48P8F0dydd1TUYfowERt+eLln0aOQ=;
 b=dTnFGVpY3QonCUQADQiT52RhTghywxkm3JsDSPLX8ciGZ/ID3D38cX0huFB9Pcs9ORCoB+o8wdxKZY1XvPgj2UlGTnLwNaR5bkdFy9udiPYNsh7KcDz+9BHLMWS6A/+Wclfw01xJx2m6R38y7RNZUHfEbh6H0amFfMEkACOPqfL9rkimOX0VtLgwdWHISDHUX1BiO+I4mKKz+Ejm26zfKG/rqLNZtLKTSD6go2yfV6YVXDnAS6yQHzNVrvTQm/GsLk1VZy4hU7/fTdXnSx+9oeZvyrP/sFGvyuPH0jPt9YJVKce3hmGu83nnhaisk3dxjH5u1ZZB7ylk3YRfHQIHGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com (2603:10a6:102:2b3::22)
 by AM0PR06MB6436.eurprd06.prod.outlook.com (2603:10a6:208:19e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Thu, 12 Jan
 2023 13:28:21 +0000
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::84db:cb07:a449:725c]) by PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::84db:cb07:a449:725c%5]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 13:28:20 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH] systemd: Consider PACKAGECONFIG in RRECOMMENDS
Date: Thu, 12 Jan 2023 13:28:01 +0000
Message-ID: <20230112132801.611743-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF000000D8.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:2:0:1f) To PAXPR06MB8579.eurprd06.prod.outlook.com
 (2603:10a6:102:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR06MB8579:EE_|AM0PR06MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d337a1f-b2b7-4c85-6d4f-08daf4a0df74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZWVY8F0yo9AjvUazPnDL3AKrHXIhqrIXJ/UXVq7R7bz3t9uKIGs2AuS1xzhLNrH0fOb9Gvby/PUt9RBe1LsRpDbfQcwWsmrIx5GKI3SejRDmfLkljoogsDIr0R4MWh1iGt/9RODFfYNxL8YBaSVhOYZwrbwiL9JjA7Amn0Mt97IrOn/F8M3xCv9CNZ0m5lQngQmRTyJWLVFoBjRnxoSmbUtkJcqcJ40TrSBLzwoS1+xz+jnJJ1ieZx4srNLdzvp39v1MDccGvbnMRDkNz+rY+ixm1WYTb6iGe5CGAHU6f+pjaw0BEnpyZf3XrI4E9QsqKBWVgqrTv7tZqPhW4kxn6iFI1sIZiMxPmSjrIm10BhugG+Bpj17aqR4PkI/SA6jFBYHjrBqJdpnPSaj7etYxKPLeMWmd7UgV1k1bJzjHcCz7Tv62dinXeY55/qdTwcR0Uxt6b4bUBgFHWmcY4NZqhsWiALqc1W96Ehm2KKUcUEx/Jhjdkw2MbLZMHRqLt6sPj35/CG7tqh9Fd8gObvLzMqHai41dfEVWHr+LXaEopdbw2kqcCdB6jnQbKfByzCtU9c71zQg7K08E5jTLQVs7Nswbz6+lYDMVG42DRCQPugeBrAVFe6EW92DpNnFiZdQvhGVouSaJTU4cN0FDkmkJzNcIlptSh1WaCBXZkkz/qXbL5vhUMkA73lzZzbxke4GNtzJdoBo7tG4gjFW/NQOtHQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB8579.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199015)(6486002)(8936002)(26005)(186003)(44832011)(5660300002)(2616005)(38350700002)(54906003)(38100700002)(8676002)(4326008)(316002)(6916009)(1076003)(66556008)(66476007)(41300700001)(6512007)(478600001)(66946007)(52116002)(36756003)(86362001)(2906002)(83380400001)(6506007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4v6YOsSswhKqtAAhgGoDaZPXG5B5/JQ9a2sUqO4ZW7gC2oj8wsOqfmhYoYAB?=
 =?us-ascii?Q?5mapLWzjNnqtr2pPt8hn98fMqSNh9yD3F7GaF8JkZwDJuwUtPqapsS/McqAQ?=
 =?us-ascii?Q?HQKOsEdxhjA1EyD7NzBkrXfFJ2nYEabz4kVr/Gx+Zkdx+LQbpGfdqWZMC+GC?=
 =?us-ascii?Q?0WNwwBs/Lag1xeW1PlxK8Wf994XH2rUK0pQQOCrVYwYelIJQy+bHQGVdyS3e?=
 =?us-ascii?Q?C4Ougp12rZsrcTj3zRjPRdOBip6nhshUGPIhLywhO84ZpcV6KT9EZhS5WF6H?=
 =?us-ascii?Q?Jxm8M4X+gRcG0wGf/AFov2jdHNJLTP0DlCxOmmi94cKsZ5tbuUbcpyUw6WcN?=
 =?us-ascii?Q?/Z5FFo3nMXLqtf86cdcHQJvyu62QQVyTfHroUWALuLE0qv8vTGsEg1qxMXdd?=
 =?us-ascii?Q?p02/wB18lB9LQBqBLk2Dyu+0XM7oL9Om+ykLGvYGtHSm+8cirwzdL004BdVp?=
 =?us-ascii?Q?LY303fkga2EkfTtd2+ZNJK6xXUhEzvmozrx/d/5apoPTUqHyzcgEGXsZnPu9?=
 =?us-ascii?Q?KbsUiaHQjez2gFM5wg6cUPJflVvYzI748F+IbgGTRWhaRIpd0VKBIvFTenYQ?=
 =?us-ascii?Q?pl60J+ZXX6OCx8+/H/TJAUc/zWOju0lCl8swz8aHHJmk6W/uTNqyPG9R0tDl?=
 =?us-ascii?Q?75zLzZQfwT+7CgPGHprAZ3+bFPS3V30FRTKMNKn9ZlgnZm72urqCgw5QwUJc?=
 =?us-ascii?Q?/J0rbN7/00mltI39/j9tgKNdaXgV7CgGS2VbwYbpjVsE2ay1h+8po+SsnLBL?=
 =?us-ascii?Q?Jr6A/grwbAwbITliFFg5BEipcI5ObpIwW4+Vtw3eu9vtJ528UjomhZ+XZELu?=
 =?us-ascii?Q?M32Kv834IbhqGzuq5ZoNGO/T0DfxNXo2iw/uI60/tk7Ff+7jNA3Za8wNhCAn?=
 =?us-ascii?Q?z4HTfiGoE7ryGmvoBb8WPbdY4c77beTZfCCmgK0AM6slashJL79aFQ36Sa3b?=
 =?us-ascii?Q?KQPgLANjx2F7p/tv0swyAgk0olb6FNLVXhTecRRuKyMcr14R6Z6rJy7W7aiz?=
 =?us-ascii?Q?wQGnPhiF7+nluBDCHspi1e3a7jKU1lnztKJevIMWN5h6xoJpwpAmdPAWeH9A?=
 =?us-ascii?Q?Sl2ZcaIcl6WMKCYzVFSaY2E1s3uTpvXVyisMiwGa5yjI3ZoYRH8UQowpsgum?=
 =?us-ascii?Q?LEEHkyAGoht1D1rC3NmmIIHOi6O87/SDbvZH16GxMzGPErQrklaJOr9/b3oY?=
 =?us-ascii?Q?2KZ5EtCkvs6ulfMECpuItmu8k6xM3rmt1chsLhI1+SCM8yenXUoSwzQG7dUz?=
 =?us-ascii?Q?pPYS2lOVE3ojhhN74BrV+EMa6XEFamTWgw8iF76TddS41bS+x8b4yjK7BGas?=
 =?us-ascii?Q?FCQGpworpIv6hA7dlqiUcY7I8Byxqx7IO3Xr4bwJ/61Hh2K5yhYaLkErSE9h?=
 =?us-ascii?Q?hEVXeQE0RF8D9rCgzuUxIB2EHIlJFzkows8LH31wc6jw2ux57MO3v6JaMRZw?=
 =?us-ascii?Q?/3mP+AKzGCHy+LSp8742sv8KTsZMJqzR0nRvMvDqxzUBb04MWhPKJeruoADT?=
 =?us-ascii?Q?U4VOaKYrfXrrtWH1GlZtqWVVtZltFgI5pNHE+KvhM3QUnB1Jx4ARvrYASq2Z?=
 =?us-ascii?Q?lvwi6eQSgDcAlrk5Qy7fiBM49F+WMxUDrczrD0GuRx7OjgF1TYe1BhujRH1Y?=
 =?us-ascii?Q?uA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d337a1f-b2b7-4c85-6d4f-08daf4a0df74
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8579.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 13:28:20.8659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8KAP6uCH3g7bHRs/5ox171C20OT8wgN7K71Vc9EuPOnvKADOGWLTMbNF/9hcVHvOOde7YAKa6TlK/FM8Yu7T9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB6436
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 13:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175796

Since RRECOMMENDS declaration implictly induces building the recipes
that provide the runtime recommended packages, conditionalize adding
such values according to associated PACKAGECONFIG settings in order
to avoid redundant building.

(From OE-Core rev: a1989add927f7805378fe4d5afbde780b747ba77)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/systemd/systemd_244.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-core=
/systemd/systemd_244.5.bb
index 77ef2bc42f..2bca1fbc82 100644
--- a/meta/recipes-core/systemd/systemd_244.5.bb
+++ b/meta/recipes-core/systemd/systemd_244.5.bb
@@ -404,9 +404,9 @@ FILES_${PN}-binfmt =3D "${sysconfdir}/binfmt.d/ \
                       ${rootlibexecdir}/systemd/systemd-binfmt \
                       ${systemd_unitdir}/system/proc-sys-fs-binfmt_misc.* =
\
                       ${systemd_unitdir}/system/systemd-binfmt.service"
-RRECOMMENDS_${PN}-binfmt =3D "kernel-module-binfmt-misc"
+RRECOMMENDS_${PN}-binfmt =3D "${@bb.utils.contains('PACKAGECONFIG', 'binfm=
t', 'kernel-module-binfmt-misc', '', d)}"
=20
-RRECOMMENDS_${PN}-vconsole-setup =3D "kbd kbd-consolefonts kbd-keymaps"
+RRECOMMENDS_${PN}-vconsole-setup =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'vconsole', 'kbd kbd-consolefonts kbd-keymaps', '', d)}"
=20
=20
 FILES_${PN}-journal-gatewayd =3D "${rootlibexecdir}/systemd/systemd-journa=
l-gatewayd \
--=20
2.35.1


