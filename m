Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E0CC43327
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 08:11:22 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40162.1782893471307107311
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 01:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=0S/DT6GV;
 spf=pass (domain: est.tech, ip: 52.101.65.68, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJ+pYPqsZ13St5k2XhnRx+JFzNTV0ssjMpwxIwE/mntZxOA/qVcRPbqARUK1LSYUfVd2UK7zWPOoDbZCvpJC081nDrFScNsqT+4CguMhgRnwJjKLiEDMkXVWNR+mLKXtR92A/e5c44FRTW/1WTMqJpLpbtym8/aNWhxlktNA+xBMrogMnEDM1k1tDEdcUEN6W7KGHPhgCh6BlHvuoZAoIzOClo6Fyqk8dJtF2ljwfU3AX+rwi80JVWzGk8IpaHuomC8LFJGRlpZ9kvOjTHGmuQ8zL+MBP2E4aSIgJ9atmZjuS5sjMKFJ+cJ1QGoN1zkeyi6O6EVFLet4gxDQxN9K2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIru6ZLyj+1cLrwTWef/ckgPl6V+XGLT597L6NvgqWw=;
 b=LH6IYh7tj9X81hz777QfBdzIH0DgKfZUC0neQz1a8zfeoCJwege67FrEBzQX3Ad53+zXVnQybAHoGW19U7xy0AN73jjdLqFf+NSyrjPqffF6uJ7BhOF7WEVuormroRK9yhB8hm/DJwjWfGTN6hD0Dly4qY69oPsEVJUcdtHK6tty+/P3tlFamAuOyf/G1xq2KnJkVR775rfMzIWoA0nc9hPN3BpjsdM52WHVYjZNu5wnBTQHBjUXdFj48yiZmwYTgtyPGHLqr77Z8g1Rkul8rOYWASA44EJVODrQL81mFEEM0kI1mwIBfkdj1jW03DC8GLzP9C5Cp1PPjRopwIe1yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIru6ZLyj+1cLrwTWef/ckgPl6V+XGLT597L6NvgqWw=;
 b=0S/DT6GVvv8B3C97ans6FJr9yY1CEPhif3tXBeXUui7/w59iT+++mrcgqFMR/ZsXHbNNbYdHtzo/jVi7r86DMgAUaCquWIkpAXpD6zp/j6t7tgyauA/VDdJLBKFy9RNa1o3d7T10hP8EkriicRh5mGRhYqBaCf5b6Hj5YSPjlcEguif8122w4NRdDY3Vkh4G2aESlMpJM4i19VSEQAELQNr5C77KLTQNfJvyNFYkZ3oOWSRVWlaNoSp+YW6evEHIXl4S6skFM3WbhMgZkezUPGWEnpWEG12cmbTig9dc76CpasqrV3OIgKoIgylftLqGyvGzEM9aD59MB18ktdfrSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by AM7PPF017739B07.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::684) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Wed, 1 Jul 2026
 08:11:07 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 08:11:07 +0000
From: Roland Kovacs <roland.kovacs@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2 0/1] fix CVE-2026-57062
Date: Wed,  1 Jul 2026 10:11:04 +0200
Message-ID: <20260701081105.68569-1-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0640.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::21) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|AM7PPF017739B07:EE_
X-MS-Office365-Filtering-Correlation-Id: 0420f2ad-1d03-4509-5d90-08ded7484db2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	cpU9JYRx73HJFL/ag0s8fMyhirNCJz9e6e5C1eTTVY7Ze0V+1bIgrc8DgEFIvb5PBWi7NHCpOl6FqtNybTmfFQJm1d1vvGxYdvmSUR7j3M9uP4brWmQ5KqEVZlSqHNDmebP31jqQrQsJW3a0XHigxdWbfdqnVh9Uq7pIro2chd9TtU+qR5FLD+9DNZNiQHktBY/mJXYRmG0msUYwYlezSzqQYnlHvSMc/UJY7W6mlVeHGiVRWNHWi3WkRhPmb1l/G0EsxAdL964Ma37pLrQFwIWz00urkAZfdaPQDWnF42tVFddTGG0seigwEjj0b84VIlBxZ30ycfc9vJ4bEqf69bo4YkwDZNAp958Hc9+Gyr+hUpStCkI6eNsb6PcwBiSTA2sBTtTb8FUAfGlceR5e+NhuQ+mH1u8/7EtK948d1FQ5rwgRe7XcWVZOl97n2o6lC1El8x8uO3HVNEML/M0HWNOZBSbOOIvoqtsBHZV0G5GQ872MmKGgepzG6OgM8T31O6F7+7l//1FiswKNetHi7zuVyWIVTFOz1NDtLwwTTnhgoqdv94+9mmh6Eu+imylSTePpKBBEBPPfak+ska+VBKoV/f9fLG+lejl/liLWn9M5LniQas/GdiMe7nEDfUAW0u7kzz2DsSp3g3QLcOuNbpABmxte6CSropB1a12UNjU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dyVjxVGc6S1jNV+DdP1Ow7K89MZtWc1eHFK88DEsNSDqxSxsoPmvjT6XKTg6?=
 =?us-ascii?Q?o+JArZKFQgLu/7fkVHOjpv6I6lNxZ4lr9sv7+wBtR9oZrqgsd6JPa0kAKCHB?=
 =?us-ascii?Q?SWVEdRT+QhqQRO7jOfkC510PPClgS3am3ynYmpE7S34AfXE0f+0LMZWd4kPA?=
 =?us-ascii?Q?9yW81cRmLabqqSn1Adwd5m4RJwxDWtOg0wxIQIsuOccwFUzKtxtL553h2FIe?=
 =?us-ascii?Q?LNXEUEYePrsrFldUeAlVTJk55Q45ApGiWSt14n+vKgElyjwKaDFIRgJpq2tl?=
 =?us-ascii?Q?FqRscY6Y2TnDayolWuEouR7MquNBZgGanIlTNW0x9D1z5n+HF5H6fkbsfMXN?=
 =?us-ascii?Q?GJJrs/gtNfDdIcGLn8JJ6bfGWn63HdBaVq6NwQEITWpKMt+WFNUQFm4LRHLX?=
 =?us-ascii?Q?t3sW5cNU7I48STfuqNB7L15dX+XozvBtGbM/TaCdeVwPhFV9FimIGAltZMvQ?=
 =?us-ascii?Q?Q+iEYLwYSnoHfAwLPVMuc/L7j4VpYqDGfLBHBxIyq+gTLbX/F20hUeEYQC3R?=
 =?us-ascii?Q?fzDKDuSp5QX30O4dp7xVyJ+IkRQCfD29zqHUqMXoh/DwBOLup0XO4CzJyYgw?=
 =?us-ascii?Q?DRKrE0y6FDPP4bncrnMZFUw5+wlMNR8GLAw+RJnnmWn+WvTz3l8GT4KIy3y7?=
 =?us-ascii?Q?Xfw2pFbRkV2w7vMF16bUdKgtrF3h1c9bhoEHumANa9HVzgK3mc2GT25W2joh?=
 =?us-ascii?Q?peyxrB+BRqExoc4p7BIs4F67HWnOw+iAQ2KnFHZ+Z6k4Eqgq1Epmv9d5eagh?=
 =?us-ascii?Q?3DSYyJfWtRR8uefaQ7NIY+LfntULu9NFmJU8XCrXAVr4wKh6XEbxJnxveNiN?=
 =?us-ascii?Q?WcDJ2Of5LWF3aoWTV/WDESroy//ISAEQNVYY3FJclEu4kLP8rhT8hQOaF8By?=
 =?us-ascii?Q?OJXSDFxw9VHhs+6V8o92jvtB7EmgQqhMBz/m1J00lmfr4izlco/soJkY1OMA?=
 =?us-ascii?Q?LNVqGINQJolQ4lGoNNhxMJSrEty1RPloj/y3Q1oHbCEKBZ5o0FoD0gGs63Kp?=
 =?us-ascii?Q?YzcFA2KWLlctqIbKYY3QG8S1O3+svu2et0yEmrzzo13wq9+sy7359GGwky2A?=
 =?us-ascii?Q?+iUqdP0RTB4WSEdtQRd7smgSVbssQwY0iND4l5YhPkOozxzQoENRbb13dVVn?=
 =?us-ascii?Q?lKS7tCVB0zvkZjHzvBgRE4KVfVDCHIKrPnpfE595rR074eHG9KAoFIWQQqEp?=
 =?us-ascii?Q?Mog5BkG/gKFpxHH5AaE7rf3kSQ1dLwgke1DKrplFto39o1AXX6IqFUCwsxlN?=
 =?us-ascii?Q?id5ksKRJeCtYr/9u64DV0qIq429UoroRObLc5MB1JEvQGPAlyYzJOPjUnwfY?=
 =?us-ascii?Q?vtn+XvaZPKdb6bQiUnM9F3NG7vuLBxOIMqUtu1e1sFO4cgL0vjWQesOb8quP?=
 =?us-ascii?Q?2S9YLS3RGrE2EyZ7qYYLkyVWv5FmnPpvySTYfBbZfWTezLkn0XNNlm03pZB+?=
 =?us-ascii?Q?BM6MfvVfpMDh514CR7cNAN/g1XqlCFx9fNY9Ata3SO+7CS0GFgvSDvXBfOFf?=
 =?us-ascii?Q?StUtW3IMyGZEsW5NIbqcQUiyBxQEKQLrVXhoX7SBaPsJfkiQ+FEDJobiSL6q?=
 =?us-ascii?Q?MXDb18nKsiEnj22Am6ihE/cTi3sE4tuCqwpRGRSeXhcEK5gzx7s3IMlSJ4ap?=
 =?us-ascii?Q?+h5V5J19qd7QDJ979WDx+cq/BdhdUytwXVbsc92qbTW8s4fQfa8nj89FbkI+?=
 =?us-ascii?Q?jyASt3KzaII0eGW6m0DwA8y+l5tNYBfiAlmi5J8tEqg8C3My7q3wxrv7T4kb?=
 =?us-ascii?Q?guWqu2k/tA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0420f2ad-1d03-4509-5d90-08ded7484db2
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 08:11:07.5949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnc8r8CJ6D0igHqBLwdbNsjh2mQlBrHKoRuJCLBD85aJfsEdiKtbRMrY3Tr4tR70+yiS9ia6L4F5vESdIfjKTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPF017739B07
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 08:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239953

Changes compared to v1:
  - remove gnupg version update patch
  - apply CVE patch on top of gnupg-2.5.17

Thus, the following patch is obsolete from the v1 series:
  https://lists.openembedded.org/g/openembedded-core/message/239892

Roland Kovacs (1):
  gnupg: fix CVE-2026-57062

 .../gnupg/gnupg/CVE-2026-57062.patch          | 43 +++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.5.17.bb    |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch

--=20
2.34.1


