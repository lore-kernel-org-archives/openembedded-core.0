Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FACDC00528
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 21:40:44 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.106])
 by mx.groups.io with SMTP id smtpd.web10.527.1691012435636307470
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 14:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=MLTctJYd;
 spf=pass (domain: ni.com, ip: 40.107.237.106, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwlMlVDXakPs7XozpnSeHKTIsG8B04SO5mTLhaqks8DGC58Q4TH9PYtlsTpUGsFaOPkyscodEeKvcYLXpunR+xWhDtEOBdwua9pYxe23hsnKMBtD2LoqshFiA+Y0/YlfWL+ZFjwWq21YtS8/Rm9meQuv5xKk+BN7+qNCpAtQ/hl3NjCM6/MrZj7Me/MEekvnabl11dQOrRmDOz5Ipy+sImdAGpiO5KmfQ24y2/YBWdhLo4AB9MvoMLGB3OkMamoGKCTvczh0qYB1EMOsbKqLVWPKYgpOTMgwlAZfOsTnZKDwKHvvApWMIy05bHKFthXIwH7ztrdv0J0GnRW03g9eMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Kp+fq0/KdyM+6Bzw8+nRrcuALQR4wNpZXWmgT/k5tA=;
 b=WPLu/wLPVnjCJWxiAQDg/4hiA/VRPtH7sD0OzRQGxDiXU+CtuPcj25SSMs5qHvLtHuthEnl3apiFri+Brq5Z3sEk+hK+Kkt0T3Biw8QQAz/TLuJ06jmlCDKHMumUQ8aVyDX8Ernk0TX/vbXW/wZJ1Lemgmt0Tdf9sXjACFo3zEOJVpfUDv81pb3DG8/GtZJ+eHg2zgMji52v3gwfactRCVf3TnTl2eg1mk53AGFQVH3KbxDU7vTMd5evqRgLgFHpqtfYla530GzOKvISDC/TfOdf2IbbpePeQwRXtk3buZD6ep1+jF7OfLOZo/CRPcMkqiGIyY1YpZ5fhSsBNpWLKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Kp+fq0/KdyM+6Bzw8+nRrcuALQR4wNpZXWmgT/k5tA=;
 b=MLTctJYdjVXhvO7gqJgan17sVAckd/wBge8M0vWrS2q3QBRywn6yDYDxiCcafvqGtvQuwnJvc6zWMwJriFqJHG+mLS52zm/vWbNHW3uLAGtbrpLaZfYOG3CnD9HZnAO84EZyq9WI2tJtq1EKjTdcm2osK1u9xH/mAVW0ggVybno=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by SJ0PR04MB7294.namprd04.prod.outlook.com (2603:10b6:a03:294::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19; Wed, 2 Aug
 2023 21:40:32 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 21:40:32 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 0/6] Add new packagefeed recipe class.  
Date: Wed,  2 Aug 2023 16:35:04 -0500
Message-ID: <20230802214019.1068795-1-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0060.namprd03.prod.outlook.com
 (2603:10b6:5:3b5::35) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|SJ0PR04MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: 1778b67b-f19e-4a24-be85-08db93a118e8
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NgW93mHo2MSNb8jYYOkYtkT1wPjUduHa6TOMpsoFxs4McqAASt1254GTiEtiROIRKnkni8KJ2VEfZj1usqtr9GvRLtbuxPTwWR7pWbMMFaJWGgjWdwuph+5hlAIXLSWvzoU8UPZZUv9xTOf0c+uyWQHpQCIMakCmLqJBTz3WF3VGuz3YX/t2SU/4efMjHomFNkIo5Cr7jLU5/8ZyDkK15kObIwR7d/oLRp0mUmqTGxYdgNlr1YEd7ZzD2rafMJCNvk43sSsEfUz6WeTxECyKLoOfPfKbwIKf8ilLKUqPZP0TtwQYrLSTjkTJb/+fiW8Q00oy6KgzOKk5eGBk+8jjJppjNJ0+3wk4OnpMA486dMOjhp3jgIPHwBa4rCjwCWiPCffziFH9EaFGHeQcR5VYIOvk+2Ik4nc484dzSGRQ47VcX+DDLUcbu5lvhDDwQuZHbCPYBmmKuTJUK3+DI0Usa+G9uXGXvOohD6V4UGIkhNCO3Gjjwfh7StV4ilBRO1KlpyNTUXnlajQx6TlGBNwCVFVxLKGeEhiUQkG/IpBb5zkVL8yXOAPM4xDrDfZ6sBK3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199021)(8676002)(5660300002)(83380400001)(2616005)(41300700001)(38100700002)(316002)(186003)(8936002)(1076003)(6506007)(26005)(6916009)(66946007)(86362001)(66556008)(66476007)(6512007)(2906002)(6666004)(6486002)(36756003)(478600001)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IiirmEIUQJYi/jk5Rw0bi4DNyOLbtrB9dr/VMOk3TbYndI2PsDg3eALV/s4Q?=
 =?us-ascii?Q?+5VjzH6gW5QTg276jz29L+FzizsT1ZQS6wwp1l0F/zjBOOt1ta2lfrsyHAXJ?=
 =?us-ascii?Q?6EwpICB7xO8OY8vUwtzgY56tTKwCmlg5y2iT46kQNFzKW5vjmnYL/2vq4Mck?=
 =?us-ascii?Q?MyhA4xO7lQ/RNPurd3+n3a6lgRfr5tONndeIoO0kXBeYiScTkm9P8BGbg0qw?=
 =?us-ascii?Q?U/QPN6jLbdNKIbgqkmand+EL+RcGkOWhqkuK/74IuBnjuLIFEVwdwHnjHLNZ?=
 =?us-ascii?Q?DHJZA2pnPTvNOi6ZGkhkbpMmQux7tAk43A0rUi8CGfDy+tmAdRBiVgX9BAJj?=
 =?us-ascii?Q?S2GmZhc8zqMX22Ch+sWqHfthA2YyLH1RBZntEHVMyLwbMQL9+EnOpuriRRko?=
 =?us-ascii?Q?2Zv9EfCkfVGfoTfkql+hNi43BFmCdBlY+RcPWN6sE8w8igNxo7VPdHTIE9lT?=
 =?us-ascii?Q?nIugKwI6PyPqbD7ZARfyG1aXE99TVQSeEjucO1Quvlz7hO31cLONyvbPiASe?=
 =?us-ascii?Q?XrNrTlRlnicGru2YRjSANmgGWL3vPwNV7T462V4KNBU0u5PlWuVW/u8a6gzU?=
 =?us-ascii?Q?JLqR2FKGPc/EuNuTR/Bw0FUE2mwuhxxFkosY0vqSUVpLdY03mJKGXNEeuMiq?=
 =?us-ascii?Q?qlUt850KOCihtOkDXevc6jiCAKYe27CM6tNUCsMntxOVF7vzRZYfGqSjokau?=
 =?us-ascii?Q?SAqlFPgdoVCHd6ECpQJu5rTqfBR9HClR/iCvUeBn4DKHRA17Xcd+85OxzEQ6?=
 =?us-ascii?Q?/WzCQ26xWXYONkWGrF6WVsdcdZKdjBiJl0tINdxJ8uAOBSAGVMBVVVTnfJWS?=
 =?us-ascii?Q?vnTnAalnQzkBUG0wRRS4z56BTMV/gYvE9U2YPXwq0VVDQS5e4ESlMBp4xGyj?=
 =?us-ascii?Q?dxFzA1QMBcn+rpKNYq/ZdXCXe79MwJ/bbDsrUqfqrZwDfngHapzcPjO7Y8pn?=
 =?us-ascii?Q?UVlEmey9uKBQfs9pCOWZLyPvfGG6XxvnN76qDH52pWy7ZkaULB7O34eKI3hF?=
 =?us-ascii?Q?MwwpUSNE9j33vDUbEXSNUupqC5p7bhXb9MheL+nhD5VLDPVjYioXBYrEfatN?=
 =?us-ascii?Q?YdHH27Oo5vN0Slj0zHYSpfG4PQ8v5J4BivqWI539dPAHysXEVOjmPTM+jjU8?=
 =?us-ascii?Q?3WFJseXTz6Gsjc9801f6ZZfOfvJCPm2+eow2jf6CvY8+YzQYPnroGRUTCfuf?=
 =?us-ascii?Q?poQgSwOFMNIg6uPqfhtlabgKhevXDpz5ljj5NtybmOle58dJ3Igckj0vCJsd?=
 =?us-ascii?Q?Uifj6yv1QIf4ijXuflK4UrC/hPLX8FZn0hi3V4Maro2Ox0znuJ90y3TpAOy3?=
 =?us-ascii?Q?IPckN46/9wJvc+AW9R/ADWGy+zv/WJupxlxJn5ql1+JqM/TrhzM+5990ORM1?=
 =?us-ascii?Q?cM1TdkOjPARidfPqDLoeGpQtZBH/1jX1jMqtiRxIM22mSrnF51hzJj/Ja73j?=
 =?us-ascii?Q?/BqJoLeGHDlHrr0yXb9q0YLWgXLG2PGjssxtFZ0WSPb8ARgTEMWoIRH4e1Jc?=
 =?us-ascii?Q?TZQ2E4pknVr4sOSZXmRcXRincWb+N2lmITFbadVU9B3ywhUbakSSBhMa0SCH?=
 =?us-ascii?Q?QPfo0VKrDO3oJ1nWgqz4WhD0nYxza8Gr9CbFjwqScIBaJPM4VVq7SOJuCn3L?=
 =?us-ascii?Q?YQ=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1778b67b-f19e-4a24-be85-08db93a118e8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 21:40:32.1484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MyVFARFiZgq/NxdLR2bCMf+YunODRafa59Y2ScS7niVfL4htlIQI8pqFuOQ5IHA0LsACbNolc5G2Rsf6y7+mZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7294
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 21:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185434

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

To address this, this patch set creates a new packagefeed.bbclass that
enables the creation of feeds in a new deploy directory location for
feeds. The patch set updates existing logic in the package_manager
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

Changes since RFC v2:=20
- maps used to look up configurations for each package class have been
updated to use nested dicts to clarify what each item is.
- DEPLOY_DIR_FEED_<pkg type> definitions now include the ${PN} in the
paths instead of relying on adding it in the bbclass.

Regards,
Charlie Johnston





