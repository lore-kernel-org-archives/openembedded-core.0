Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D410F013F6
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:24:28 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46540.1773653056889463891
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 02:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=hFMYfdhi;
 spf=pass (domain: prevas.dk, ip: 52.101.70.61, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rrvgCrt1CbpsOrfqWdqA1M4awSBEbwxw+TKPQUyFucNRFnuvV4h3jtd/VBZvQs27AI85cqcSYNc8iAVEY+WWqAacx0V+Z0egS2agKTo23HsS9+QdoQFVLKJbtr4x9qTg94QrZH3KNL+I9wddqjxsmQI0jTNKZmdqxmd+RQWEFVU2ZDQOWZYrHpqygDe2CuuKqfO9Vjl6ulahMsE9bZ5VAy63r/5JMeD8cnpzI1GarIy5Y92MEkASdyttAutB9c+9R+112NTzNDTUfSdLpV8kgxrsCAonDC6DxZD+GFSpUopxabD/sgk0yCM6t69jnYfYEXcF+g0glLLrqi+g/CdqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMth0F7PoBz+6YeAn/ZGDrSZDwE1pYYw3sIK8Oocp5o=;
 b=SELQDqAiin0wRmm/elaw4Fl0s8KDQ1uT0uaJrblRwN2QRpR6JDDCd032MqIqaF+5uf/CPboVYRa591o3PvGcr5eBLjdHsNICoEIDiYw8ZR7uRc1dExCAZRPdIya/w5/q1KdqXmVi3UYTLuqk1tf6oE0IE9JyMK8+HaqIc4PguVoXUAi46GSAPDxSveWBulFpQ4OyujeoICD3HjOn6ASdkO/VtYzfShnHmjvgb19Pj3YFZ9QxDuuxkxlYQT1kNYjNWLaeQATQ3TUboGnolnC/ujB0ejuZX6v+Wy3jwr5rvumsFeDZhzoIxeeCGlJDbTRAjvZBnnkrP/Kz2J6azN8n9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMth0F7PoBz+6YeAn/ZGDrSZDwE1pYYw3sIK8Oocp5o=;
 b=hFMYfdhiWL4Gq7g2d2NXI660Bq/7D7lLSGgRJ6j9618dAxDRADga98sr3kUE/c9xn5V4aije4BLyAGp0+h11nRzh92Ok+Yt6x5zpT6255/XadgoufYUdzHb42fLpmSvkCH9DJsZkHkuZfAOrLkcMjGvG91Uo+Cm+gDp9FxzeYHk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by GV1PR10MB8735.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 09:24:10 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8%5]) with mapi id 15.20.9700.018; Mon, 16 Mar 2026
 09:24:10 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: "Rasmus Villemoes via lists.openembedded.org"
 <rasmus.villemoes=prevas.dk@lists.openembedded.org>
Cc: openembedded-core@lists.openembedded.org,  Richard Purdie
 <richard.purdie@linuxfoundation.org>,  emkan@prevas.dk
Subject: Re: [OE-core] TMPDIR, bitbake v posix
In-Reply-To: <188B34BEFB66411E.2721127@lists.openembedded.org> (Rasmus
	Villemoes via lists openembedded org's message of "Fri, 16 Jan 2026
	13:07:44 +0100")
References: <188B34BEFB66411E.2721127@lists.openembedded.org>
Date: Mon, 16 Mar 2026 10:24:08 +0100
Message-ID: <87cy14p1on.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: CPBP307CA0019.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:2::7)
 To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|GV1PR10MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: 8538340a-887b-4ae7-0221-08de833dc7ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|22082099003|18002099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	fkyVFioEtG7tPeKnl3TVMOH2fUE2eKBMw286b7LsMNaNR+wbL76tlk+5t2HijraLVyO9usYDdRh9j+UCwzzX2UM0RPiQr+Ec9cjmYRKpzt1gWpMVEh5X5dtpJUHL/4QA0FPgLmKpFm0SXX5RI2k6T2HbpNrEHcZ3C1D3q7fdupl7pjqIXM1Rx+eFiHig5C8dL029n3a2eil7got7MqsG8hToz7i/PhxlOtJhqIUTa2UC2IQcCh9UJOQokzEBzSmDCE3UXuQu8XplFNeylKXgSuv0Hn+CEL0PV2KMhYJZS2cEZhVgcwdKqxkj/UG38b3otW2UkjL2kDRgTCtHail0W/Qnc0HKslz4oDEM29vXT2xtpsDAgiT7hYWIMxHQL1o2+pepnZr21YA7W8JOhZb/ZG3DyKOQlJ6Efiq6L3Oq01e6hbqtGBSAAkNez+KqAwy8x6k8PRqX+GO2JgOJnhHCFlo3dKSRsAbot3/l4V1Y0TIz19LdgUQhudzqTWs6rFVOOxaadMHswEQ+wk1nW+5KrSybpAqFYCVkBjfmCDwksaoMtM5XiFWelBvnv3Ng1s/Jqn/f8hq50AZmanY0kz3DRgrYCVPcwJKMk8zkuZgtv4MyfYywUJsIX/oUsGx2J5GwWQEbDy+VVqS9s1/aDTguWu5gw096pDnH8nTfDP+oxIx8lIKu7p6zU4XW9rBJGdrnEmBUqZG9eItCg7Rwo5rASjPJy67MlKTbyY05UW+8W09V1wajP3PP6SJW/1Mc4MBxk7NUZV5ksLX7UJZxSmy3FTxBr7pgLArfGbbR7eJCsuo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(22082099003)(18002099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j21hnGe5f7sSxcqRZhXzUN8AuBH/tnSH35m0DRjNYBF4NE/xHGIKCIOuaWOP?=
 =?us-ascii?Q?tN7f4ZRD3XV6EzYUewbjwMt+TaV2SK7TTkYt9ClZyAwGGtKd8FGVAV0+4inB?=
 =?us-ascii?Q?Y9p2cXb+zes9NtNg8uWgGSYX5o8dcaJNhmQGL56vqbJKAFoP5BbJ7CrpN//I?=
 =?us-ascii?Q?cK/s3Npp3kqwJZO6mi/rzFUiYcqTgk7Ynbv/9njD+3dMdJTlQ1ybKhF0occ0?=
 =?us-ascii?Q?nsua7LwwlUEAQZq9lytSurs0ucBJ84zoyB64LcEn4glBrbmcefd9pD0r2m1l?=
 =?us-ascii?Q?TxeWwvqwjlOrp6pAjo8wBZqyETY9TMztFtwq6p/gvN8LzUwwE3tPPZVQnjkA?=
 =?us-ascii?Q?oLfisbGHZy1x2NiA9tswRi5YhCVsMUhUELWpbqWm/LucI1JjTBWqSNA1+m1e?=
 =?us-ascii?Q?D6WNiUEUD/NF2UOwNQ36nONjIo4lX/n6JXDPyh/UJmv4C6SrfdEhR1z2sQo4?=
 =?us-ascii?Q?+29VNjL76y/XUYMHy7gB2M+rtX5GgUIJzADY3StV8Nirn87OXuYHPQf1kJao?=
 =?us-ascii?Q?8PpCx4AqYosAQyaN1rvMyanGi/d1D+h56H7vzb1Bop55oXf3kDfPlVix/X7o?=
 =?us-ascii?Q?RlgiCNtmbea72mpKWzM44DIHFtHsENnvwLAWWi4h+aKpZwzyiJh/bCeMlDJg?=
 =?us-ascii?Q?4GLpQXEj21CEQUYSePoDUqMvEuPn6ef2l8sE8gSK3Y0tTF/oXsKykRAogAjz?=
 =?us-ascii?Q?01pS8ilju33Pg8PW1uZ36BoBL/QEw/afktADpGOyhfAz0V5drbTCPE9XZcWK?=
 =?us-ascii?Q?PLYT6t+70sKan8u1kU4CU1XR2CRKE28+A3O+g9sYSs3Uix1N1hjGqy+2JTCd?=
 =?us-ascii?Q?iTdOff53k3E2qZl6qyZiJPbd0sGWAbL5dhTF2Fq/HoUhBXlTe7OXg1YokvSW?=
 =?us-ascii?Q?RrxrEW7Ha2FxjG2Y9BcB3CbbEceltykgNnvzjDhpQnCI9L6onPSQtoTxFFrQ?=
 =?us-ascii?Q?oyLFf7pjoy93LtiukBC4vKHXMPDO8+zbSiHhoEpQJe4CVhrEeVFuhTmjdhPo?=
 =?us-ascii?Q?DETbnOHYxkQHxXtIrrgriskV1E1ZEnb+VFS42LuinZR0Zi5jZL4WBhC7yQFl?=
 =?us-ascii?Q?kWE0B1MUDYn/BoPz4Z7yUNjI+uN7GGMK2r3ey6DUtTh1qv3ia6YFHlRrmtir?=
 =?us-ascii?Q?Rqqv2nX8Hj+bAhnced25s3OUowixagVzKbhsZx5dTRrEDhf4FrPq8zG4+3Pf?=
 =?us-ascii?Q?R6Ko4VpZAXyX9YXPeeG/2xm3TihagTYoGXsqdi370/23qAlxbCB+ZORVMTv/?=
 =?us-ascii?Q?xgGYu5TyngvAv4dpXqNk46aQDIU46cqAeZrEga+5MXCPD+tKo7TnzMSJ62Jd?=
 =?us-ascii?Q?c611rBehsJXeN513r73KXK5tn6wrcWVDRgNhdT5a4I4b5R4umr382cXq7v8X?=
 =?us-ascii?Q?spSw59GXZ3nSn7pyxScIRGyW/sa4WFhUK9DP2H51QrP72FzJpdi6Jn64Ac2f?=
 =?us-ascii?Q?kbY+GWJdRDDzZ6+Rk/7Tq5PlTGx8UKLI5+VvCqNfA7nSK7nxwD3sYiGuuGjt?=
 =?us-ascii?Q?L05zRGcxKtZlnMet6cWgrwlx5+A4+kC+bsye5KiBOYuKkeQ4H4tuKZ+wTRuz?=
 =?us-ascii?Q?fXp6gQ887ysapVzD4eV3N0yp3ADtf8zQo2EUS1gMF/mvrBhuuv9lnHltI4ym?=
 =?us-ascii?Q?GKFpwPP7hbgqXjBE8f2/Lfj0dWRmUZtiD5nx4L6OAL4Ep9X6JnLweoOsNCPE?=
 =?us-ascii?Q?cUoPEhzEnfEVO5khJ9VIwQS6BJf9G6mI1u2lCidSb8l3Sq73QGjxKpB4MQdP?=
 =?us-ascii?Q?6WmurYgg6IGgMrQ/qARJZqKPIVuAFyY=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 8538340a-887b-4ae7-0221-08de833dc7ae
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 09:24:10.1595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BVt85QjqZhopu6PJxhp4K6UwkE3r1kBiuOistHAZTryuQ2KIbadWYUmC8l0PCVirYU42A4FCUAKTzL9kejEu1kU19GIpfh9S/k/5YLWpAJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8735
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 09:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233220

On Fri, Jan 16 2026, "Rasmus Villemoes via lists.openembedded.org" <rasmus.villemoes=prevas.dk@lists.openembedded.org> wrote:

> Hi
>
> When some task uses mktemp(1) or similar functionality (e.g. the
> python tempfile module) to create a temporary file or dir, those end up
> being created in the global /tmp directory. That's obviously not ideal,
> as those might be left behind in case of an unclean shutdown or if the
> script is not properly written, and won't be cleaned by do_clean or
> RM_WORK. Also, /tmp is often a tmpfs instance, while some tasks might
> want to create rather large temporary files.
>
> Most such utilities/interfaces respect the TMPDIR environment variable,
> if set. However, since that name is used by bitbake for a rather central
> concept, one cannot simply 'export TMPDIR', as one doesn't want that
> top-level build dir polluted by random build files, and it still
> wouldn't be removed by do_clean or RM_WORK. Ideally, all tasks would
> have a TMPDIR _environment_ variable set to something below ${WORKDIR},
> maybe even something unique per task (say ${T}/${taskname}.d). But
> there's no simple way to do that that doesn't conflict with bitbake's
> use of the TMPDIR name.
>
> Can we do anything about this?
>
> (1) Do nothing, live with this limitation.
>
> (2) Special-case TMPDIR, so that all tasks are created with a proper
> value of TMPDIR in the environment, not derived from the bitbake
> variable of the same name. Could be settable with some new TASK_TMPDIR
> or do_foo[tmpdir] flag. Somewhat hacky, though.
>
> (3) Bite the bullet and plan for renaming TMPDIR -> BBTMPDIR, so that
> the TMPDIR name becomes available for use with its standard POSIX
> meaning. Obviously a huge thing to do, but hopefully most direct TMPDIR
> references are in core or bitbake and used for deriving other standard
> variables.

I tried doing TMPDIR -> BB_TMPDIR in bitbake and most places in core
(there are some places which use TMPDIR in the posix sense), and it
seems to build a core-image-minimal without problems.

So it's not impossible, and one could prepare for the transition by
eliminating quite a few direct TMPDIR references using already existing
or new derived variables (e.g. BASE_SHAREDWORKDIR =
${TMPDIR}/work-shared), making the number of places that would need
the rename rather small.

I'd be happy to send such preparatory patches, but it would be pointless
if the community doesn't deem this to be a problem worth fixing.

Rasmus

