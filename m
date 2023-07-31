Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2EE0C001DE
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 21:53:21 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.136])
 by mx.groups.io with SMTP id smtpd.web10.5461.1690840399742221537
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 14:53:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=JC8VzpD9;
 spf=pass (domain: ni.com, ip: 40.107.94.136, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/5gaCcJAG0FOjDUmCFNmtS0CW3aJacXeA86CIIfmkT6ppmNTcXYjLit5NAct2b7aJ1EbGsf9NNW9gCn/+xtsGNCwdqS1+tFsLSrKcq1OQG5vr5fepOsp5FT+ddOIiwHa4+ATi4mfMtwnncPUg5ovsM/JDEzLs5tIoqObRzeVS8oJBxN8lggH/XhF10IvEkuUOQNLfFnbh7BntOfMVxlatgZ8ZsJ2ltvfbyBFV8X1YDps2onuBaCwy/J/+nnK75NJiJPJT2f5M54GCmkpbcGw02V64zVaqTdC/eYR5nasYjMwfPQty9+J5AnxCbncUWcMcfpUj0cpJlOtfAg5PyO5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dFU89xHJzUm5YPHvzx7QZUMq7xmRtRhgdiUOFSeQFc=;
 b=Y1SnVBjt3h1/kByijHr6y1VhJdFvb0cAsGKnFcJA6FtZQG7cyFhVIMDpe4EH1W6BWkVxLsUpYNGsnSwZ9qRPLKae82eK9Kv3sY/l9kAO8z/Z9sEFR0VaVGOv0AO6vvk/fKDLSMu0kp+1QxbpYr/xGOHnV/xwlIKcrW29aGrpV5b/f0mapNxkkT9D/5+IbQpdrtXS3OfArf5D3HPsy4Z3CBE9WXQTf4wueCBG7+9iWt/Gx/vgpFGbGDxOgb/Gc2kYZs7rNyrLDzma3YnBCJeY3CE71X8fIFZOH0dmadTjghr8mwELTHNZqccv8dW6S2buTmqMyxHeSg3vrE6Z+voCxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dFU89xHJzUm5YPHvzx7QZUMq7xmRtRhgdiUOFSeQFc=;
 b=JC8VzpD9TiIuGbP5UAgn4uBkI4v2Jyc6Tya7642NrGPJbu1N1G6P9hyt2rIbLAmVYSwi+J8SZgDJpgZS9/24x2UqSHDMhKpY2LVYu86aruN9cXYc5QAbm9Kaa6yvhLMpe5Vq34vpWvy99Ww9Kx1S9XU8N4WKMuLkZOsR6bWa89I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by SJ2PR04MB8510.namprd04.prod.outlook.com (2603:10b6:a03:4fb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 21:53:16 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 21:53:15 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][RFC PATCH v2 0/6] Add new packagefeed recipe class. 
Date: Mon, 31 Jul 2023 16:42:57 -0500
Message-ID: <20230731215310.3949441-1-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SN6PR16CA0048.namprd16.prod.outlook.com
 (2603:10b6:805:ca::25) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|SJ2PR04MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: f8fbf349-bc83-413d-a292-08db92108b09
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6z0BUx4uSNYdcjsnIY4K/JTYUcLFVxrTfUDfaLQ5UhlZXr6JKBbl7JNE9UT+uwahX2nG9C4x1EcGpeDjlom8oanxGZ1P1iIoLMbOO80Yk0+3FLiPV9g5a5Yc5vQd75cdrrhwg4QuUHO2qhNKMiwJmyy6l1bNSPgtYPTNv3+kyytzpxvP0fblAIIYF15h7f0IZ1lVTCKfb9UhKaj6F3N8+Pm85l5CNV4bXHZdGb+rYZHstZzhdUtjRi5l2IUmkniDUfMBRvjHYelYPZXzDWMbki0ci1mj6g4NABtrJ3l9edZemOOo+tj7QEQ5ESwBbI8WVk8Q53+exde1yFXjW8RfqYQ1fPKuJA1FZzakAH9LZm0cwnNjHs3xC3W2i/HAuFKu65tWTCTrffTd9Eq3ZOTXgQ20BZDjBj11SyFBWQpEOCxK8WAZJDL+MYHUe9o8BCDD6FIUmM2synbAHWW3hQ4Ye+KNWBSDzGKDTfkT9mhcHYzguM4x6i/fA//8Hhvip9qWUkHtawqhB2fETvRJZp8g8ghaMM/G00Ev7bt4OUsrdTNycoq2ByqP+wEhZoNu752e
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(451199021)(44832011)(6512007)(6486002)(36756003)(4743002)(2616005)(26005)(1076003)(6506007)(83380400001)(186003)(66946007)(66556008)(41300700001)(38100700002)(66476007)(86362001)(316002)(5660300002)(8936002)(6916009)(8676002)(2906002)(6666004)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WlQnw36S2SZYAxAtG9uYSVosnLzFN+wvjgXQfuZ/NeKrpClTQW3He/j9+eij?=
 =?us-ascii?Q?gcqNXQqlIEuhGs3NTreowBo0ej16Jgsd+1WJJ4o5p9Y+5l0JAnji4O6fsOmm?=
 =?us-ascii?Q?LEbwmdpN3kAKQ9JvXFyrp7t5/vA9py0ZOE9HBXpujwciczr1lo70nIgyVdIR?=
 =?us-ascii?Q?bnb6Yo2Y4zE7/UTDPsIadBKiLCF4ZzH80v3cur6KPJ5eBUuSDuhjP2qMwWIo?=
 =?us-ascii?Q?XfAyuO5lvHvisLj/UVawd8e30137yw6Pg4/DnoXxhVV0c00UhWuCvf713LH3?=
 =?us-ascii?Q?tdekfB7xpthqztIEHB3HOXT4IN0OQCPw9t0oCuGZiIv3RXEEf/TxOS0cRh4D?=
 =?us-ascii?Q?GjScfkXUUkFKLrwCW8D7q309+GxYvz97q+LY6/ClZvZm1dRh7ym4GGq2c6kW?=
 =?us-ascii?Q?r402iebw+gfGLDstFW+OmmQO0vmqqjWCe+gf8xRevbFX3jFhoeXxvRBnoApF?=
 =?us-ascii?Q?2vHw+EyMWA082pQpeOqNoxlPxlBo78wiMYYRIIlFiOWWC2r1Epnx5kwy3vAR?=
 =?us-ascii?Q?sfZoSVcjbrhIwtsmK0mnF6IJkGFemxll4HJrbWKh6fPyKKxPSAKEPBpwuo5J?=
 =?us-ascii?Q?2Ryn51AngOj8iFE6JTxHHChx8uPMpmTb/COM6aTGd3WERO0yh+bowkAex7Wb?=
 =?us-ascii?Q?2L0EY7FbJ5pemQyWiNrEY2e9gKLyyySzgwxy/zhSsK+BP1vOyQdY7IKaPcQH?=
 =?us-ascii?Q?jVEDaQAtacT+x7RtbUZ7CwB43MA7vT/S6wqsbGI6+K2mJ55LgYzNpmt1qZSa?=
 =?us-ascii?Q?iZHSmmWrjcIkB0H2D8gSmIldahG16pKShmB6tPABpIVnQPHW+D6n5UA0DWyT?=
 =?us-ascii?Q?zY29VseTSHrq4/O2u2sXbOgjbEdhwbwzEWuE0m5/S5sbEoYybwjD3C2/h/TV?=
 =?us-ascii?Q?YRwLoGqghK64YknPg3uloGKjSVumEcpir2G9pJeC2WcgN+Sn8H2y1MihIiUe?=
 =?us-ascii?Q?2mVjP6Jfg5ZlBkIr2viYRNU/NZfqNCETycPYoYB0p1P0TLzjdBTlPf7LCMVt?=
 =?us-ascii?Q?3za+LuDn2h1EK4i76Wmc6CshNluv4cawdVxuyCIc360+PCocWfvvRIjflRN/?=
 =?us-ascii?Q?VsFreZBRJEex9tGCRmlO/mG4QmPLJpVsSgmh+owdbMDODqc3Ym/dYV3QxlnV?=
 =?us-ascii?Q?qrpCXVf2WH+1O3JEQhMsMUN+Zj0GZUbHKc3dbfAn6QDHWw1VodhsIKZFW8wK?=
 =?us-ascii?Q?90yZbRPietG+BzHYzTeV05UECbogr2XdVnEwKu/ROWbkB462ctjETgds1oiJ?=
 =?us-ascii?Q?r3OGuxTroyCQ5D9kGLulzw7N+URVXVAa8XJ4RxQtAwUWE6qFlaAqjEatdyac?=
 =?us-ascii?Q?cjmJ5hzg4Y4MqrfxxRpOTeIiToEzgTbepJenBOi807SV+58vqUeAmWHA0DMb?=
 =?us-ascii?Q?2JPolPDiy8NWYAIthJha+PNfVc1mJ9nQOG7dmZQa+hZ+q4SqAP4Ah6YumjDt?=
 =?us-ascii?Q?V87pw6H7mwULMq2Gd+tkjl5kHDTOs2/FU1ZbMIMpA/2QP77XmSETOHZLn8TB?=
 =?us-ascii?Q?zLKN0GeN3l1GqEkr5rE1KY+piQtWj65vbY+EY6By9jDgQKi56Y+CQgEwMxWU?=
 =?us-ascii?Q?j/b5X+dmHdgttMzoclUIZU1bwm4FdbKrNtsByOH4ApK5NSFPd0o5HHNyLpm0?=
 =?us-ascii?Q?Ww=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8fbf349-bc83-413d-a292-08db92108b09
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 21:53:15.4306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TFaj72eVK6nw318pR++1zSfGsTlk94C9W3iWO9dEjxiStdht5qW5u+P7w7Iz40ikh2nFN5IVS5fqHZnLUhu0rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR04MB8510
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 21:53:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185174

Currently, the only way to build a feed natively in OE is to build all
the desired packages and then manually run bitbake package-index. This
approach has a few drawbacks:
- The index creation methods ONLY work on the package deploy directory.
If there are packages that are not meant to be in the feed in the
deploy directory, they will be included in the package index. Also,
multiple feeds cannot be built in one command due to this limitation.
- If a package feed depends on another package feed being side-by-side
to it (that is, if packages in Feed A depend on packages in Feed B and
users of Feed B are required to use Feed A) a user would have to
manually remove duplicate packages from the deploy directory before
making Feed B's index.

To address this, this patch set creates a new packagefeed.bbclass
that enables the creation of feeds in a new deploy directory location
for feeds. The patch set updates existing logic in the package_manager
class that was previously used to create a temporary feed when building
a rootfs. That logic is then used to create a feed and exclude any
packages which might be included in any provided side-by-side feeds.=20

Note that currently the class does not make use of sstate. Since the
individual packages are cached, there did not seem to be anything to be
gained from the extra effort required to cache the feed. Caching the
whole feed was not space efficient, and reworking package index creation
to be compatible with caching didn't seem worth the effort given that
operation is fairly inexpensive.

I've tested this in oe-core by creating a few sample recipes and running
with each combination of the PACKAGE_CLASSES variable.

Regards,
Charlie Johnston



