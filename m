Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA01EB26FC
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 18:49:51 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.34])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.631.1770749388136803214
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 10:49:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=NZ7CPf8T;
 spf=pass (domain: est.tech, ip: 52.101.84.34, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ner5pEyq7iADC2BE7gU5j9OdBFC6sfaEpal0rRmVOn8jOrJPT/9XuLByykdRoS9xM7QM8A2rRjfP5xqH2Fppp5YhozFIIR2pwu/R8H7Hju3usEOtGE2HdEt39D80rSG84Mjzzs/xVtIt/IYn2eTub4jtOVugoXPoG1jNDWyg2GmiPstG7vWt0syzTcKx5sQ5YCcRiuJ0K0+Ux+sMMSe2reHDRylARQgUSZpwhb2OJBHzPQlodrN+T1GAASv9obfSt1gl9aUqJBsojuJqEhSzZ8E0Pw/aRV6cbqUtNBUreUxwGaOMY6wkee5RqapAGYw+un51jrACwdp+bY/AF19LwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdSQ6e/ndnY19/FHc6Qcw/x71tIcghtGB3XiHHunMzQ=;
 b=qczLBQICvy5NabhnC4qLRVWyZy03bjin5ECrbHTi06x77e6qQSpuYHPFTBORXYUVQPLZvbWN/qr0k8TcDtBhv0Z9a3Fr6TE0saNYdvw0xlpvOLj6vPKwA4p6HRuGfYEWctfo1AsnJ2Pk+Ej4PDdrC9CTjMPlTBD82lYlfLnuPDL1IJQDaP+w7aKlsMW+pucXJpqmTCQY/pg1o6LO3T3iz9vTHffdyrjboVRBiLRIZPuUP5BqImuqmCNaaMfqxCUXQI1TwETwh//yQ83s0Lh7P+QoFgq2Gb50oq/m6oRpCMnsBcpj7rN8ieT9TQAYVF6TfKTvwQQHZMSUL928EqzECA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdSQ6e/ndnY19/FHc6Qcw/x71tIcghtGB3XiHHunMzQ=;
 b=NZ7CPf8TpgjQfcMNTBuhLMJqcO3xIw2CO9ddkN6QZx+0OJoFxT+3CiSCuToSdL/Xv9327DqPMVmPAN9+8TNloi7HG20r7sb8QRHgO20mEjU1E65NoCOJahNlQUW+7te6ek0W5cqufqhT+OcYnyLfdJVaCfqXjenGEdjsxfz31C5rXgcRyl+KAk2KjTuOTshrIQeBT3H2mmBDyMPhsIi4GNbCLIV9P4A30IdNY3j3uM33mmel9qdsTq+gJh8JEPKLAZRpGwC3hHHDxn1arZju8cAmHKTucdHVEuauTs8tt5eho1eUF/y4YyY4UAWyy1xo8n2rpaOU2ltg+6sOBca1vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by AS8P189MB1303.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2a7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 18:49:13 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 18:49:13 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] libsolv: add ptest support
Date: Tue, 10 Feb 2026 19:49:08 +0100
Message-ID: <20260210184908.7373-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202223606.19978-1-pratik.farkase@est.tech>
References: <20260202223606.19978-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::27) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|AS8P189MB1303:EE_
X-MS-Office365-Filtering-Correlation-Id: 91d026ca-a4eb-4a56-eb62-08de68d51590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hRLpr1Rj2DNXQx0r4nz/yFlLI7v7S37NksIkX76kkobUa5OtlB3MZEitb4OG?=
 =?us-ascii?Q?iL1qrk7aZn5+DOtabva8NObh6Q71D+gdRW0IHvblQ4lUKNgK1Le7XffSK3ww?=
 =?us-ascii?Q?U5hsUtLuz7GvEkSNIhK1oIGuokDVg060ucTrzrgZ6O/zeWLC4wLyM3wiEcl7?=
 =?us-ascii?Q?/iNVKpxigKdHgNw1MIhJuvbnUTtwZDmPu1Fmcx4uTX2+siNZBWAqGh2vAePn?=
 =?us-ascii?Q?lVD4WLTg5ZnS09dDtXWuiWMuEhaH2ZaA4kpF0tmAKPGzTJdJ1kz3e3RZlcgl?=
 =?us-ascii?Q?TRd6O2mzsYIXE2nmJQJpa2y1ApZ49LtOjbGwPnlKfNZPAbhq2SzHvMbBxddB?=
 =?us-ascii?Q?MuALmS/eSELcJvHqHw18w9qpBXb7EqA/T4MbDVg4yOoCLr3pLs9tSQzPvDtW?=
 =?us-ascii?Q?4FwQsTQQKrkoJ6Z2iSDlrRi737QKMP3jFemde8/A113pWBryU0EhDbZIBEXT?=
 =?us-ascii?Q?d7XJNu6i4Z1lBzZzcffIq6XBuUZr6/8iHoZHNyRaxniKaPnw4e7WP7M0FWge?=
 =?us-ascii?Q?ZiQI+V5I8ux1D9UZ4cZrD1pRLqhrC22qCd5qerIUEXk7RHkA2LJR+BXaWcBq?=
 =?us-ascii?Q?mD3vCMTWFeTbvrUNi48mKvjzKcngQel2SIwaTagqdG4rOXt3iypSx1tM1KdY?=
 =?us-ascii?Q?Z+WdnsIOTFRK0DoCSIQUyZMYeFzjX23/K+ToIRdb0PdwNtCeUF6DDdP1APkF?=
 =?us-ascii?Q?cqv0mC5M+1bBBQh4GGz9mGhC11IRX2OWn7Bmoqolan+XdiqUxZd6fSbA/tYw?=
 =?us-ascii?Q?Z2zEXmgF0TMXnfNtfBgWSLjxoGHsGry3bS8hqHqMAjRgLMpSqwMc+5+BOFvi?=
 =?us-ascii?Q?leT6vN26y23ydxIpZgOFL98b7z4ZGYW+qh/Qjt4uP7sowmt0cNzeURlgZZhY?=
 =?us-ascii?Q?+gkjdCrnSZbzdRgVb2Pif2fMcv5GuZpzdmFSrqV9fsa2fT57tJKTUbvlFOf0?=
 =?us-ascii?Q?qjYSuQDDTPtLQOSIFh0ft5oN81wfB5dVaLL5RQNYmksCckeSkT+r4sd5gYwR?=
 =?us-ascii?Q?n4OFqZtxdQ/Rr+Th/2OqkSNqHvu4mKm4E2Da4HamhoM3aTu3saaai3WA3tAm?=
 =?us-ascii?Q?Kwx2UBuUcaXHRK1+ixwqabNYGaSrlAG2BhxKqJo8bvxQ7W2QzALPTvHte1u3?=
 =?us-ascii?Q?Af5cvovFxPzOQxfTe9xdu9tlVpMGpVkxTj/gwye41cIKfCb6Mi0k1cuY7ke0?=
 =?us-ascii?Q?Zcg6poFKYd5zA4dt25HfFjUhNPnNQxUbCyKzIbNMD4gUCffaEUfYiDdg7SHq?=
 =?us-ascii?Q?xOiT1ROYZTaEx8YaIaqyJ0f5pr9gz6cj+8QPjuC1CuytLXsWf7TCYrfpkqol?=
 =?us-ascii?Q?ESpLEKADNBlkmEhDTKmjd7ChL9zGkLPnn4bystjGGZkstjIl1e36Xeo7AIL8?=
 =?us-ascii?Q?7myQp+WEQL1PomamfvBrHT9OcEE3UBHK+qcwFYkpr7ApadMAhdJZbcU/bkiz?=
 =?us-ascii?Q?41bcNVl9OoKq2/U+MpuUNERIPd4pqNZ/KKxaJ5TzCwY39E0l2B2ovlbuAOU7?=
 =?us-ascii?Q?+BZXv8dxkF6T/Pzq7gqpOq8dSSXaAzCl4+pOhQD/a4AJds5NYW/tnJ5b5sPk?=
 =?us-ascii?Q?qzMw6vdD/Pm/f5SB3nI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LhcvAFtBQaCnKolqqh34RqNaIUc9Cl6djZbU2G//1AFAPv7kn+42jf1HnAh9?=
 =?us-ascii?Q?haXbFNH/Cu65cv1qNjktwq4rfM88bQWywyLgQFwS/+J6FxmRCoGaqdq75QDQ?=
 =?us-ascii?Q?oMU3oCLbm/K/YLyP/GSxDQ4z6tSmU+oCD5apZEv3+47aNKAaucIypOCWt457?=
 =?us-ascii?Q?86A7EtIOpK/49qrop6+khTJ8r+TWQSrfwp4R7fw9SW3OThq/nWRAjnp8MiPi?=
 =?us-ascii?Q?j/zrvzgS8EvlAvbr35lo3NcjmhWMj4y1zqP8Zx1uu/R0jtmPY/22UTpzJTi1?=
 =?us-ascii?Q?QwTrm95u/3NTNxOjFkSh57isLAnSTtFzkehet5ZS/zOazdqEcAzI4b2T7Bzu?=
 =?us-ascii?Q?+aeJMQYlh6jhw4gkj5hJqeJ1qlYh7fBsiaouLp9v5EB1x1cvrXtIQkfQhrkK?=
 =?us-ascii?Q?xvUiXyHEI8ALHV/oJJRtbl/EvIHIon42/CXzzTn2CIirOVz16EzsuRPKLKPb?=
 =?us-ascii?Q?DObvVcKABlBw68oldpDgYuAhGgzCZEflilr7yio+V/aLmj5dsWvJvzkLkMcA?=
 =?us-ascii?Q?7fLbu/gbR0d+m9zqHfnYDT7x24woUEJqfFx0lwMbxlEKiIzYDF+jm4XIxSU2?=
 =?us-ascii?Q?tjRygbaEl0oUSIjdLrPxS1jNbsQ+Wzg69H35qOA0VMm3XtftuCCIqjMU8lLI?=
 =?us-ascii?Q?+vnJJHhSgL2iYrNBSs8K22m7ALlm9Ch/dECtipTYg64WyYT6OPY+ue8iIo3D?=
 =?us-ascii?Q?IWeVXiFzA3Yljcw6ng+SXT48tmvfRKq7HmJy2e8k1VJgv/u75BBCQMcNUO8r?=
 =?us-ascii?Q?ZfTUDhhMVUvS2Za6eOjIWoCskAbGOCp7YHIX+grhABqAIDEgtOGROVgs4qJS?=
 =?us-ascii?Q?WMk+td6Pr5kiAkUbbm89EUJyoL5nR5Qa4nXzIkmBnRzUkv3IXplu4/lF9zvv?=
 =?us-ascii?Q?2IfZbIsU4D5p/zajxGbcGksjJ1SbrhvsgM3KVHZSznNpgh7fUsRqC2VsSQV+?=
 =?us-ascii?Q?rqBqSFWVgOP4wzryLcwpf4Fs2KGT9FznFKz3YM9tTCywpSQzk1AUKH76qYMZ?=
 =?us-ascii?Q?2AXNdURWpFpYfdyeYGejlGje5+LhRP+AGWlY/g2yYa6XKkGkV4mOWOTA4bVk?=
 =?us-ascii?Q?unl9In9nyC6OXY+KpQJgKbflr9OjwAfnFiJDPCpIcMFMwetTyJKQwTYsgItW?=
 =?us-ascii?Q?i0/wbawfNvaPA9Nw6JyCHdFql2OWXolPTlcWLSo035B/mn2WDjg/kA4ifa6G?=
 =?us-ascii?Q?ePGS4QLeEUAI+uCbOHKyOyiyuLyAQVEAhjgXKEn9WNeGQfeTc+/XePANcwLD?=
 =?us-ascii?Q?yxKENZ7XnaSG2A9PjbP14eJ3bUfrwJ2FnSr8ELnGKwSrOFZuGyxuyrhzKoI7?=
 =?us-ascii?Q?unsKM29mwR40SPqe1q4xzZC9qbStM6HL/ntjfkqAHdHFizLd5163X/1153k0?=
 =?us-ascii?Q?1e/udpzdaPq3KtZMtUeiTGkd5V9sisfm4DEhVeHa/w5wSKz2lKh7ju0aL/Gb?=
 =?us-ascii?Q?g1CejiXMbJB1fUMNFOyUGhHdgCe/zo4Sn3Z7Lt13wRhaqGxn2AKAcCq0DVnB?=
 =?us-ascii?Q?uhPFVVuraA8zlsb9qEB1WopFCcgQQVLEW9mtf8ICLsaM3BMLswlQ6jw44o32?=
 =?us-ascii?Q?MMwqYZ6wE3pRXe4SsmbTIm9pn47ry1VD9sv55OElOEBzfXPeCvZtSaWZI1gN?=
 =?us-ascii?Q?v0bfiW4xFLNloFP7XzBxKW5u8yJzzq4cb9EiHYw+JdbSAcsjoWzOGBSQADGI?=
 =?us-ascii?Q?6e7BH6smPLArelKPk7mA1eZQbz2CCT9A+JM81Ba/leQLyyGXW1d+OAgdLHSd?=
 =?us-ascii?Q?7heTO1AQcQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d026ca-a4eb-4a56-eb62-08de68d51590
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 18:49:13.3397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKc8Wj+I5/DaOPpm9KRq5A0nlhPo+rIc1P2ve2JlvuS5U1OeLC8Vowmu5QSJx/NCuZyXkiekqGd9SyDcVaKjLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB1303
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 18:49:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230927

Add ptest support to enable automated testing of libsolv
using ptest-runner.

The implementation uses upstream's test infrastructure:
testsolv binary, runtestcases.sh script, and testcase data.
The test suite runs 28 test categories covering solver
functionality, package dependencies, and repository handling.

All 28 upstream tests pass successfully on qemux86-64:
START: ptest-runner
BEGIN: /usr/lib/libsolv/ptest
conflict.t .......................................   Passed
forcebest.t ......................................   Passed
PASS: testcases/allowuninstall
job.t ............................................   Passed
learnt.t .........................................   Passed
recommends.t .....................................   Passed
requires.t .......................................   Passed
strongrecommends.t ...............................   Passed
update.t .........................................   Passed
yumobs.t .........................................   Passed
PASS: testcases/alternative
ptf.t ............................................   Passed
retracted.t ......................................   Passed
PASS: testcases/blacklist
choice1.t ........................................   Passed
choice1b.t .......................................   Passed
choice2.t ........................................   Passed
choice2b.t .......................................   Passed
choice3.t ........................................   Passed
choice3b.t .......................................   Passed
choice4.t ........................................   Passed
choice5.t ........................................   Passed
choice6.t ........................................   Passed
choice7.t ........................................   Passed
PASS: testcases/choicerules
default.t ........................................   Passed
enhanced.t .......................................   Passed
oldversion.t .....................................   Passed
suggested.t ......................................   Passed
versioned.t ......................................   Passed
versioned2.t .....................................   Passed
PASS: testcases/choose
cleandeps_dup.t ..................................   Passed
cleandeps_in.t ...................................   Passed
cleandeps_up.t ...................................   Passed
cleandeps_up3.t ..................................   Passed
mistake.t ........................................   Passed
PASS: testcases/cleandeps
and.t ............................................   Passed
andor.t ..........................................   Passed
if.t .............................................   Passed
ifelse.t .........................................   Passed
ifelse_rec.t .....................................   Passed
or.t .............................................   Passed
orand.t ..........................................   Passed
PASS: testcases/cplxdeps
dup_allowuninstall.t .............................   Passed
dup_multiversion1.t ..............................   Passed
dup_multiversion2.t ..............................   Passed
dup_multiversion3.t ..............................   Passed
dup_noarchchange.t ...............................   Passed
dup_orphan1.t ....................................   Passed
dup_orphan2.t ....................................   Passed
dup_orphan3.t ....................................   Passed
PASS: testcases/distupgrade
caret.t ..........................................   Passed
testevr.t ........................................   Passed
PASS: testcases/evrcmp
excludefromweak-obsoletes.t ......................   Passed
excludefromweak.t ................................   Passed
PASS: testcases/excludefromweak
recommends.t .....................................   Passed
recommends2.t ....................................   Passed
requires.t .......................................   Passed
single.t .........................................   Passed
supplements.t ....................................   Passed
PASS: testcases/favor
best.t ...........................................   Passed
installed.t ......................................   Passed
new1.t ...........................................   Passed
new2.t ...........................................   Passed
normal.t .........................................   Passed
PASS: testcases/focus
forcebest_dup.t ..................................   Passed
forcebest_in.t ...................................   Passed
forcebest_up.t ...................................   Passed
PASS: testcases/forcebest
best.t ...........................................   Passed
dup.t ............................................   Passed
PASS: testcases/lock
infarch_install_best.t ...........................   Passed
lockstep_install.t ...............................   Passed
lockstep_update.t ................................   Passed
PASS: testcases/lockstep
multiversion.t ...................................   Passed
update.t .........................................   Passed
update2.t ........................................   Passed
PASS: testcases/multiversion
namespaceprovides.t ..............................   Passed
PASS: testcases/namespace
pubg1.t ..........................................   Passed
pubg2.t ..........................................   Passed
PASS: testcases/proof
recommended_conflicts.t ..........................   Passed
recommended_multirepo.t ..........................   Passed
recommended_oldversion.t .........................   Passed
recommended_targeted.t ...........................   Passed
recommended_version.t ............................   Passed
suggested_conflicts.t ............................   Passed
suggested_multirepo.t ............................   Passed
suggested_oldversion.t ...........................   Passed
suggested_targeted.t .............................   Passed
suggested_version.t ..............................   Passed
PASS: testcases/recommendations
assert.t .........................................   Passed
mm-test.t ........................................   Passed
reuse.t ..........................................   Passed
PASS: testcases/sat
disable: unknown package 'E-1-1.src@available'
disable: unknown package 'F-1-1.src@available'
selection_canon_rpm.t ............................   Passed
selection_filelist.t .............................   Passed
selection_matchdeps.t ............................   Passed
selection_matchsolvable.t ........................   Passed
selection_name.t .................................   Passed
selection_provides.t .............................   Passed
PASS: testcases/selection
strictrepoprio.t .................................   Passed
PASS: testcases/strictrepoprio
break.t ..........................................   Passed
disfavored.t .....................................   Passed
strongr.t ........................................   Passed
PASS: testcases/strongrecommends
targeted_color.t .................................   Passed
targeted_dup.t ...................................   Passed
targeted_up.t ....................................   Passed
PASS: testcases/targeted
nested.t .........................................   Passed
str2dep.t ........................................   Passed
PASS: testcases/testcase
supplements_implicitobsoleteusescolors.t .........   Passed
PASS: testcases/weakdeps
dup.t ............................................   Passed
dup2.t ...........................................   Passed
forcebest_in.t ...................................   Passed
forcebest_up.t ...................................   Passed
PASS: testcases/whatprovideswithdisabled
split.t ..........................................   Passed
split2.t .........................................   Passed
PASS: testcases/yumobs
DURATION: 7
END: /usr/lib/libsolv/ptest
STOP: ptest-runner

Note: runtestcases.sh requires bash as it uses bash-specific features.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>

---
Changes in v2:
- Use testcases/* glob instead of explicit test list
- Remove existence checks from run-ptest
- Remove existence checks from do_install_ptest
---
 .../conf/distro/include/ptest-packagelists.inc |  1 +
 .../recipes-extended/libsolv/libsolv/run-ptest | 12 ++++++++++++
 .../recipes-extended/libsolv/libsolv_0.7.35.bb | 18 +++++++++++++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-extended/libsolv/libsolv/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index b9616e9bf4..fbbd118255 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -36,6 +36,7 @@ PTESTS_FAST =3D "\
     libnl \
     libpcre \
     librsvg \
+    libsolv \
     libssh2 \
     libtest-fatal-perl \
     libtest-needs-perl \
diff --git a/meta/recipes-extended/libsolv/libsolv/run-ptest b/meta/recipes=
-extended/libsolv/libsolv/run-ptest
new file mode 100755
index 0000000000..857b719ae5
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/run-ptest
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+cd test
+
+for t in testcases/*; do
+    ./runtestcases.sh ../tools/testsolv $t
+    if [ $? -eq 0 ]; then
+        echo "PASS: $t"
+    else
+        echo "FAIL: $t"
+    fi
+done
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.35.bb b/meta/recipes=
-extended/libsolv/libsolv_0.7.35.bb
index ec74308bb5..d42623b413 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
@@ -10,13 +10,14 @@ DEPENDS =3D "expat zlib zstd"
=20
 SRC_URI =3D "git://github.com/openSUSE/libsolv.git;branch=3Dmaster;protoco=
l=3Dhttps;tag=3D${PV} \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
+           file://run-ptest \
 "
=20
 SRCREV =3D "fb4b4340d46108cb365113e432642d6024886c7a"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)"
=20
-inherit cmake
+inherit cmake ptest
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains('PACKAGE_CLASSES','package_rpm',=
'rpm','',d)}"
 PACKAGECONFIG[rpm] =3D "-DENABLE_RPMMD=3DON -DENABLE_RPMDB=3DON,,rpm"
@@ -29,3 +30,18 @@ FILES:${PN}-tools =3D "${bindir}/*"
 FILES:${PN}ext =3D "${libdir}/${PN}ext.so.*"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+do_compile_ptest() {
+    cmake_runcmake_build --target testsolv
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tools
+    install -d ${D}${PTEST_PATH}/test
+
+    install -m 0755 ${B}/tools/testsolv ${D}${PTEST_PATH}/tools/
+    install -m 0755 ${S}/test/runtestcases.sh ${D}${PTEST_PATH}/test/
+    cp -r ${S}/test/testcases ${D}${PTEST_PATH}/test/
+}
+
+RDEPENDS:${PN}-ptest +=3D "bash"
--=20
2.43.0


