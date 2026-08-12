Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B183AC5CFDB
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 08:54:47 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3616.1786524882971122681
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 01:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=RvLek3Kz;
 spf=pass (domain: est.tech, ip: 52.101.72.18, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkcpT2pknEEBtncpkoyL04fUR9rO84HM+FQFQ3yY8n9ni2iLzyFr2fM/hk/iJk+5Ait4BEq8DDsbI2NiiNDkhcvD5fTF/0CvZvc+ROMSLrWh0uR9xR0avL3P4wQJ4VHRpxcJjgqc3xTe72HewAxtQ2F2y6EtM7DVE28H2ewyyyhhYzvQmVZhqh4yWoIfmrOIT1NRrv7iK46G7PSEYY+ERewXmIRvRTndmizs6XiEI/mGhwK5qA73Mhceckm1dUVJjkVqS8P7q+pc07D6GinEtZQVJg49fKvX+plrh685zWkEGfOAnGxNpuNb1fQ6izDMelcsJWCaYeh0bIO6QT1bPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rg7QjNpeDmQK6FTXBN3OCJQd7VdbuII9g4WeTL2/6Y=;
 b=rm6YkkSJQqvHvp9ubTzeCTPCMQ0Z81KExoL823JV6gHCd5vlTJOWuEJGwbUZJ02gN16zeDp8xK6CsAO5HxhCiQw4m5EhOhZMRII1hZ3omQ6yhp9Ruou01xeAIre0us/+1BKvBDb+UhKZlvPA6npAjvsikF47NgV9v6O7XGfxvrQ7j92SUy+bRNsdyeqmfINYyEh84x3dvMLLtpLBbHWM5MFvI2gncxdg5to/X+RmabDFPVEWJYw/qriXYyWzyw6nH55mvoPOf8y/udmjPaVNYpwuRe6/kP2W6dAIcgwQoO9WFad0rj+GLv7Qs6oP2ds/qzEHA4FJ1kMx+6m3aPEGSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rg7QjNpeDmQK6FTXBN3OCJQd7VdbuII9g4WeTL2/6Y=;
 b=RvLek3KzWL2zDRazCi0eHCZ6tmvjdj6BJywTb83nlR8mgAkze2OmkCdM3oiqlIFpToZaaY0ySH/w4Mkgb0z1HgDGYWGCMLuCz3NyGJJF694B2In1iVzxyOUg/bHNYpNyhUIyminz9gUgVKSGNJxxI4QrsbyenhmLj2T/at9/VunxHzR6tU3+42QEsZ6SSaxnNci+qMoPXBjXKb7SsTdgq1fOwQtSq06S/ITBAW4sk7apESYDdZ4AxNP9XZR6BVaggH0Gwj1Olx8OjX1eh60OJxBSYHdpuPHvvCIaOiTlgoNlaHMHbNhiv1HO3cGkYaOuHUKIGQ9/eb8v4hjMi8RBfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB9P189MB2099.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:397::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 08:54:37 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 08:54:36 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH 0/2] binutils: fix CVE-2026-15003 and CVE-2026-18220
Date: Wed, 12 Aug 2026 10:54:30 +0200
Message-ID: <20260812085432.22810-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260807140902.4732-1-jaipaul.cheernam@est.tech>
References: <20260807140902.4732-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P191CA0001.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::20) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB9P189MB2099:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b888fa3-baa8-48d2-e0ed-08def84f5643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	EXqb+Uv6FadYLNkF5pW1qre7HZmoJ+nTrQeDwCAfvj3XK7Q98U+JSGon45KAHnB0tHnioKmocZDX5rAI2Vjb4m4jbSWSaQbsLRSQ1/8vuZ/z+a2qZmboiqblshqQpGYpsl+cACEeJr50EvOcBntjd02mhsoD3d0yrh4MhzrmAL9BMAPySZbZXlMmui8HebSEj1IiRFqjX40fiMJXaDaM+heYzYvs+UJ5rL8P0/7ZMiWiw4YuhV2+vgN5auCTEcezykGmUPVHk4KnRZM4zHhOMIEyvS2YaK/3zEh2qkPgZFitDwSGyZiktGO4psYH69dVBsiu80pnQQIJyMhtQScHdO1dPjTiN/lTc7OwbhuEmVVRyDMeze5vaJ0Yk2VtgF6PwkkOwLDGfK+UaNtS0rJptQml//gEC/Yo5p45wPCflNqZSGl2zcsI54WNyq+S6w+5sre62VD9+1TleK0/Uu2IjWEv7nNThnHEU5m7t0+OovJ/Rt8FUrjA/34tZGjYEupgIlcx8x0dALshHkQTE4IqXDNTx92UGB57NMNI366r44ggUzbECkoY6/Hj8RPSGxve7Sj53jorDG9LW2+VkiN4q7DsswDaeK1G0hlvOohC2uTMD7/QbAFmVksCJZCK11GTloMK7GpFj8DqhQoclFrFeUzkTilbBFU1GRPY6BNRvTw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dFpPvJA8pfTAC4KlLDtwOoxkXTt//osyb1mVWjwVF3sVeaWjeVC/o2OMAxXl?=
 =?us-ascii?Q?SM5GvXtTMmE4D72pkV/UJ/Wul+xmjmpdeI9I/1ntnRl6wS0Y8gbduU+R2Jdg?=
 =?us-ascii?Q?OfXhvjAPaT1mlMU+ptL1bLU9E9NsZCa6rj5b5bJqCHnPZcR6OpgBjfYDZtJf?=
 =?us-ascii?Q?epQiGQG/plydDeB2TRMUHZkHibYrL9jckc47DOukOyVThXgT9GEws74Phnsl?=
 =?us-ascii?Q?In2Yc8eHnOwZhrEsXgVd9BSF2Q/7k6m7cZpuV/12B/GfvnDjicCViJ+1Fez8?=
 =?us-ascii?Q?I9akbbnB9KjrwttzamBSe1vPFuQ+Lncf8t0Y6mLBEEehNEXHMyPHc/7qVAg2?=
 =?us-ascii?Q?6HWD37g37Mm1lEdSNDhnffvCtS9C+UPAdxSxx03d+APOj9DZ0sBeVocWmROy?=
 =?us-ascii?Q?onHrZlyN+/FmMMshZVhOxal7fDSZvtgMQwScb0v4r5qwAk897iJAcCGeNE47?=
 =?us-ascii?Q?gIi9Zw41z+fVs/G8kPstb2MTSfScmnx9XUFegr9t1pT4opOdZCe4NVEfa2sW?=
 =?us-ascii?Q?Nn5lmOTmip3xLiDH9davkMwmF0cWt9P0GcyqaEOVvDvp7vRhkVvepGF0mftG?=
 =?us-ascii?Q?hn9aYwp+LVn4hbyj9Of//zSJaB7kH39WgIt2xNKf2g8OAXyF4Zt6GPb3R5Wi?=
 =?us-ascii?Q?85L1IKeg3CSBeNkrE/q4ezCaYGLjyaYrWL9pzTpV5Essryu3J43SDpRWNU8X?=
 =?us-ascii?Q?poa6VO9jlCmUswUsoVmAD9kCcYI5mhMWSo3pVGUZVxHqH1L6fQ4DHGYHCk8y?=
 =?us-ascii?Q?e30Fwi7GNPwo5OHLKsmi9ZvF/V25DmkTdXsnEWnIvc3TpnuRD4VerPXE7BkP?=
 =?us-ascii?Q?zbKZ9ofNo1G+OeQFnhvDAUFNwx9idqhBUZ9Od7eUQvsigbDGm6bTLhuAgE3k?=
 =?us-ascii?Q?OWZ16LB7X66bIYUGxqC20jT6Ilf7mqNKLecPmx86hAtFEW8lkQOJ/T2062TU?=
 =?us-ascii?Q?1SNdd3MfB/ZP5OrfSAos2zX47W+p84+yuvRwvwvlhr3j09mqivvmGecftQY2?=
 =?us-ascii?Q?74QI2hPFdpO6EqwhQyt0CYFTWZf9jlnMqTq55r2VXGolRbLnCPKOKlVuaflg?=
 =?us-ascii?Q?R37gOXuK81Ep/73r0lS/0FjKgcPGky/gnOwYLjRsUT3eJar6cqkpiUgNSXML?=
 =?us-ascii?Q?ouoz1ViwjGKN3mCy3IqORdZ429b/UZMTqJNJQZJ9uNU9rCoe9Eql0e1mLqaB?=
 =?us-ascii?Q?VfwCwH7NhEJ29zexOT5LkoWJlXvYN+8hsH8Yl1OwmMoPdR9DwEmFROgIqB+m?=
 =?us-ascii?Q?yeZVOlIHUvkfWYpGj6MbH5I2+AX1CNlHeIZUEHjm7xyKFM0FtxsvSWyYU4Nz?=
 =?us-ascii?Q?ldVosQbXCqb6aWzrNkMAeJRdRCImD5WvdjEmseoF+qQr8iTDarHk9C52Rvwz?=
 =?us-ascii?Q?rEmCZ2RQZ3R0hum9Sbq86CJIPR+Gjpa2dNWBr/5AYq9fI3BfpifVmhKnbq1c?=
 =?us-ascii?Q?BMVk4GgfeTKIHpnJoTMWLFwyUk6LnRJHtivPPbcs1wRUy6b+oH9pXkO2z1Hb?=
 =?us-ascii?Q?pFIlW40x68qNBu1x0bE+BYuknIQi5DncX3vsTQap48RlPqundIyi0nKoK3Dt?=
 =?us-ascii?Q?WTrcbjI4qNJbxO5inufRJ3B/U2HSa2NkGBKYeB3IynFXV0yno2KOA53u3dag?=
 =?us-ascii?Q?XylZCGuTGSoUm8gRmHNfhC3kZuZybpPlngAiyFA9+Scdz5bsu3LULpAY7IE1?=
 =?us-ascii?Q?3zM4sK5TjNXtZjFL1KAOIK0J+iDjWINTdL3DxhuN8ls0JgvPvfUYjnU0CxdG?=
 =?us-ascii?Q?hQpmh+y4jXHx1GdQBJcqWpU42fMZM+w=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b888fa3-baa8-48d2-e0ed-08def84f5643
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 08:54:36.7938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RLLa2Rlcy+PkIMEFFI+3BTIVJLgt3YP6N+bm7z/zLhpe3VmhF8U5S6NgZbRgs5t/WHHXyym9LcZ6P/ZqAXo9jtuDemfCGGHfXvshU8hgodw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB2099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 08:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243260

Backport two upstream fixes for binutils 2.46.1:

- CVE-2026-15003: buffer overflow in xcoff_link_add_symbols (PR 34053)
- CVE-2026-18220: buffer overflow in elf32_dlx_relocate26

Both patches apply cleanly and all tests pass with no regressions.

Test results:
  binutils-testsuite 2.46.1 (x86_64-oe-linux) - All tests PASSED

  binutils: 327 passed, 5 untested, 9 unsupported
  gas:      2091 passed, 4 unsupported
  ld:       1899 passed, 7 expected failures, 20 untested, 109 unsupported

Jaipaul Cheernam (2):
  binutils: Patch for CVE-2026-15003
  binutils: fix CVE-2026-18220

 .../binutils/binutils-2.46.inc                |   2 +
 .../binutils/binutils/CVE-2026-15003.patch    | 402 ++++++++++++++++++
 .../binutils/binutils/CVE-2026-18220.patch    |  65 +++
 3 files changed, 469 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-15003.=
patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-18220.=
patch


