Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FF3C61DBD
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 12:36:25 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20444.1787661383826136487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 05:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=BAXxr25D;
 spf=pass (domain: est.tech, ip: 52.101.66.6, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qsy+hTkk5LqYut0HkaGGBzZmG8QTK6iAlFGI1cD6YR4c1SY+lpqxbwHZzuVe0SzcREDTSlv9H9Turmixx9bJ958QpHJ5qhQUAm5/q27iiEdTl0+QYEPjUG5DxrcSmO6N49nWC89iqOo4H0XiamwGqljhwsXf35y6AyYg0n9QKhoro/Q7vFsRonHrjc88C5KyJbfX+Zu4VeAx3OQy2iB6TNyi/aeDK4BqHGDSVBc0PA1Cl/5+CNcPhcJ1/XNUYECrUkxMe9SCcwvj1mhVHnAKPAo7Dm19Df5TAXSyM2AX2fnv8VsCHf5ntGYRncP8MGoYDpYinY43ifNFeo7T85VXUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCySUU9NQ5NdYbv7JWdpYydPKD8RahbdBGuCn5O35mo=;
 b=xpIwRY4GAERG+sb+kEW2yb7RoXNj5+akQQGOyS3WaTUo9evi4XLU1n2+wYC955mCu9N5eNaZnHYXLKN/fpTWZWBOy8IlFniD3aJlbpD5aKKQcyj+M7LfStaxGwlaQ9Ko8s6RqBb5OP6rKxiVxpmNVs0+9uGK1k6duF3SrrCYw1RwWt3upAsI3H9GHWvP5+viyZFkUWMldRcjNTIJkMnh4x8G3GcO3nWtbCzhxRGxSwV52sA1cZLDkV55Oi5+PkgfjAIiE8VJPqUrgTa2uYRDBTI8iE916DKcWQe1KvV3NRVS8ZmENJk0cvfFLWb5c0ko3XVpRf8SSAcYQ9wZoCuv5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCySUU9NQ5NdYbv7JWdpYydPKD8RahbdBGuCn5O35mo=;
 b=BAXxr25DB6bKzFy2SCGPr/X793ceMfg3jw0DPPhvKsJIZ71UQFD0TO/dNb2BNPLI1Y0fU3UMuI3yXSX/l5jfHMX3xtzxu/iS0Kg3qyiHPsel7OPcd0QOVyYBJENnlsxrvrtIb0bbREy2QpH3AdKNmQ+3Y+RoU6xMNQpUQK15vf4kXyJorc+C+j9Tl29dPlVIzNH//Ih1b6R7qhWiQ1+RAcp8NjST8CdMOBg9sPxVEZqTZlLsHA4YhqoFXR6BrwZonAsO5kG/9/Kg3xmJjdvSKYa0tagzJlJKPNLjIkQal2cRKYQZf6UWS9okw1WEUBV74wU38SFFuhb9b8E2rk9fcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by GV1P189MB2083.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:56::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 12:36:16 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0360.003; Tue, 25 Aug 2026
 12:36:16 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] ptest-perl: fix overly greedy SKIP detection in run-ptest
Date: Tue, 25 Aug 2026 14:36:09 +0200
Message-ID: <20260825123609.31426-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::19) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|GV1P189MB2083:EE_
X-MS-Office365-Filtering-Correlation-Id: 03c12773-8a76-4b19-2e0b-08df02a57504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|56012099006|11063799006|5023799004|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	837gLHRWa20muJEUOHvp6dPbPJbCvCRgwsCnrYnN/2RpR5zQd1mct94OCCgCWzntWaKrTNfax3rB6VUONtlpZXQjVxYgns5Lv0hg8SZKs09FwuiPlL3+flg0mHtma6CsrMPATPvP3td9eAuYYP4d+0LFFh7UztoOdVcBByaZvRpRJleTqhaHaq6DUfbd3HNUuRlkflzFplIzRjq78efYkMOa82LoJprNb+RWm18KpIPt7gE4bkfesS2XtIh5ztIea7iO8MJLMW5TAvKtjv66pvkyEORRfWCO7esyEiCElw4BOnnhG4PD3h1EAVytDM7FdJiL7FCw0uAJXsFKEW8cD4r3kVnOJNClOkBy8kWu5xLYNl+ddrjhhLgZrxcBGxLUatsJH47A/Nh+igJusStHq6eec7qXbJR5HfF7kpR+VlTRqWVyxVd0SmeW9VjsNFBnkJzrTWxqzf4Zn2ZGNyNkh2tBdd0HC14RJCnbzmBLSthFz6kiPqXL1kLQ5hz1rDj3V5ysAO5dphim2783QYnAGdLOlZepGrL1h5W8V7WoPa+GQX7Bs8j3Xy2zMrCkab5EpqxmfBajN8XiFLIavkyXPJh0hSSW+VYEl9H+e0j2njM2amWvaiMVr5/CZsiwdJF+mcPcihzmOWnVaJRAMCky1ekSk9dwwnTGhyGasfDgKJs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(56012099006)(11063799006)(5023799004)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2pXBlqiXmMsL2eFOAemNNTnBIGG8GeNOu1HCl62ePuLgEzjLPbYDu2LasWSt?=
 =?us-ascii?Q?bElk1I/GC1MG6qOQc1Le1mYyxhhBV+D+IW0pD/iwCIxk7QCkpWVpMlCH1l18?=
 =?us-ascii?Q?OFO+hSfZZUzj+K3TKYv5DJYaqDLhxORjLXV1OzuBrEblq72RJ0ngNpCzzngi?=
 =?us-ascii?Q?h03SbdttnmVgVj3jd0tM0cJwOCC7tJ7xh4o3j2rtD2Gl7oo3ISMLsbG02uZD?=
 =?us-ascii?Q?4QGQvVVjwDv5mtZvcOPsR6QlQ+T1NLeTIMdNUwGWDRdn6BBW87+ZNy9uQpPT?=
 =?us-ascii?Q?k6dwIXF25fyiwDy3Io2s8LEFs5P5ENGK8iiOL+pOmI1I2BtsHSQZ8fv3kXlo?=
 =?us-ascii?Q?35ylw7HMSEwmXTcNvZwKduow5ILdki737TK+xfLEc2rhgJqdek7P1ZqAqIKZ?=
 =?us-ascii?Q?jBZI3O/MEmJzl3HuCXpSvRe5/WTc0Ce1RD9UbMSlg3LP9gmM8FDhKi2mxTJv?=
 =?us-ascii?Q?LlttqCZ+GCq4+0aCV1VSLpoBimKc8PoWKarx+Zvq0xKkWzHnYuJk+JchxGe0?=
 =?us-ascii?Q?qoP86CbshD8zKV5TwgUv/D6l5Wc7ppbPepEOAWmJMo3cEL9H4Yfvm8GCswgy?=
 =?us-ascii?Q?l5PPB9vtB6DEr1V4l7MOIE6RPNGNuwL8K2w907Op157Je7ENKcb6w7vJlcbZ?=
 =?us-ascii?Q?6G0kmu71vgDQhYY19EN3ZwkU20XpRfbrp63M23mrLF5Yp+x3U/VOq+4haDMD?=
 =?us-ascii?Q?7BYSDXNxo3wPKC4ohmekRcGeEMiHpjJg246UoLvch8y9iMoWEjqCX55ha69x?=
 =?us-ascii?Q?3ghZmi3AW+RiVdd3YEeMhlQubOIEua97zKRwVwJdidI2yYcUEbdNsy5+m2XV?=
 =?us-ascii?Q?LnVrbsS9tSZpolUjjTfb6AZ0sfwmz8aa7WHaLgZH0ZxR40EqzjONC2p3ZJ1x?=
 =?us-ascii?Q?F4VWhvel+Ni6R2cPMwKGXqrpNFDMsQMe/JCpEh4ZlEo+YbOQsiZoUfcXC3PL?=
 =?us-ascii?Q?XKE0exhAV30MYWkAoXR/G4kL0jo8F9kb8Y8U3l6hl2HJ4fyOrpc/SH8Cj5wq?=
 =?us-ascii?Q?6tWe5EtUlt33YT3bEmKWejTSdXT/2jDXMQ3m0dizet7GYELxnF4vhGkqZ4t9?=
 =?us-ascii?Q?wad6Ko4c5oHeJmi5iFc4M5cPRYVFRNAcux2jDwpgfsroCAii3vZDWXobe5W1?=
 =?us-ascii?Q?2VvhOd9mV8ldDOZevmlvEJKZN9WGBedyjLe08UeKF916pyTYVcQYKWRElYVs?=
 =?us-ascii?Q?+BVrD6zov0BDiMBBeYoLfk7rHMyrDCV1V5uxZ//Joc+/oUBCEVDsOzCAiMhk?=
 =?us-ascii?Q?h2nH4tCQcWQch5Zh4NqRR9blYXMuSL+/SAI+93U2EMvYu7ev62Ew0SJ8tMHb?=
 =?us-ascii?Q?ra/jxqhrX5A5O1KTNOgvIgwMKzmWtj7QEGpDdjPwl98M6WWq7E9HjeOGoFSO?=
 =?us-ascii?Q?31icvUNW9Pvq+4N5x+51xrIsa/jvmVT5XgpD7SK2aNhRDWLarfCdZDj6pwwk?=
 =?us-ascii?Q?9FoOQ2z3xaNnwUYnOOvKU35mwUwIDwuTRmZTwQkC7nRJHXTVHG70VQHUuyoA?=
 =?us-ascii?Q?E4OiI2pq9WUzehWAfCC4soZZsRbeCtmwgzZLSPnghM5nGt35n+pKMw9aU8R+?=
 =?us-ascii?Q?iHmiTucvx9NE6+GpwB9ToT3XyiI0wnT2w6cv4F4yLfITIJS4MnX1CdO5gS0G?=
 =?us-ascii?Q?GRtiHU40JF9Xdg70ot1pLTynLiW54vglpqBsTIfujvdUgtjhQjQ5vYCaQlas?=
 =?us-ascii?Q?zpzA01dz7miRT+FZkbzPptFkBk6XOnvfwtlb9r+0UXSrxKv4nboMSOIVIAJ1?=
 =?us-ascii?Q?T0bEgLU4iA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c12773-8a76-4b19-2e0b-08df02a57504
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 12:36:16.6662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qUTYaIbu01RP6rXMf9kjt2Urqp1YmwZI7nx6rFxQ2ASJRkqd7s2p9Ie46aFD43lJQbIXJmyCrB+InOEL+D7Mmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 12:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244233

The run-ptest script uses 'grep -i SKIP' to detect skipped tests, which
incorrectly marks entire test files as SKIP when they merely contain the
word 'skip' in their output. This happens with:

- TAP subtest skip directives: 'ok 3 # skip PadWalker required'
- Test descriptions containing 'skip': 'ok 84 - attributes successfully ski=
pped'

Per the TAP specification, a test file is fully skipped only when its
plan line reads '1..0' (zero tests planned). Change the detection to
match only this pattern.

Tested across all 12 recipes that use the default ptest-perl run-ptest.
The fix corrects 19 false SKIPs to PASS across 5 recipes.

[YOCTO #13411]

AI-Generated: Assisted by Claude Sonnet 4

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 meta/files/ptest-perl/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/ptest-perl/run-ptest b/meta/files/ptest-perl/run-pt=
est
index 51e467abe7..814d50ae63 100644
--- a/meta/files/ptest-perl/run-ptest
+++ b/meta/files/ptest-perl/run-ptest
@@ -8,7 +8,7 @@ for case in `find t -type f -name '*.t'`; do
     if [ $ret -ne 0 ]; then
         result=3D1
         echo "FAIL: ${case%.t}"
-    elif grep -i 'SKIP' $case.output; then
+    elif grep -q '^1\.\.0' $case.output; then
         echo "SKIP: ${case%.t}"
     else
         echo "PASS: ${case%.t}"
--=20
2.43.0


