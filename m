Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24299.1795540703718479399
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 09:18:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=xUxF/ObJ;
 spf=pass (domain: est.tech, ip: 52.101.72.63, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AB5cL55rgADNtywqE3DOQuDByicybL3YyYR7oQtuOnIwd9Hmh98aF1rKAFVtySg2JpOhP+4nlpjRpGseBkRJmqirpoIR3fPBkPq/mWuT/QCbU8e5nmtPCVKQpCM+D+ubwJ4KQiZytV+/mmaK6ND6Hb2ihhl8yYDSjmCVAWc7iCjU8tZ4vSEA85ZJaJYMw9zA56LNxfpj4DrU4nPFV+Ojb2XYAEIqYgEhGW0y6di965exsw3i7gvKg4r9ji4SQWg+DpxYcCdAdD7AlhESOJHAAsbT/jig0lSGEXG8U+mMjTEcBO+PvvQaYbUXKtCKAkV+KrSphWNUmFwIpWgNOWrj2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfQwja9j8DGPq+6ZyF11Jl7X2lroNSELT/AwfqtKs/M=;
 b=Txpr60uMRCmMWKt5DGyp2okV9qorvUu6okjsBQgZEN8pqSnw7htN/ndJ1dSrvsMyX55TZQljWwCr+IoRh17D1j2hKySG8vn/Z1JKALwCkHnTsgPhDeUmXeAX0C8UvmvrUIesvp3YagSw80In5uD0djY+xUTKoGfShWtCH9O5REE5B2gr2nzmnWqyz9mWXdvY54B2tn4B2agoKJDjy8duX6tnJagKClGPb+Lt35dumUqsNngxHtjWDpdxRF/bLqFqEVAIKni5SoS49MVJeGuR0nWyU1c5L6xlObstk8F1S5bgRc7VCtYQF3NMU0i+aAi0oE/BOQG0qeOYjBEhA4FgDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfQwja9j8DGPq+6ZyF11Jl7X2lroNSELT/AwfqtKs/M=;
 b=xUxF/ObJqo5I03vwi6bUNPDgvRWshud/MVm8LFqUhvoJvAGdwEnqvbxl5GnZrov4kz5DjQNf9BAuWTMAsv6m+Ocq+jPlfAvK8T8mhldqOHbimI11Otu9uClBbasWyXcscEz3Dap0DVGkWOo2kNwSL6y69843LfEZo6cWS0JsBlyTy12k/v4AYtfSNuy448FtKD+Y+QPNbzirA+/GS4CcvqwGOExiN/AegvVs/AT2DPVyNEtWZn2pUy2ahON5i/NyUDyU7JK0PWRHIJku8uQWqF8c+m/pxYScfgJSBbMV2z/b0jInd7y/tdE69G4kqbo8EvF2HUvD8ujyOshrus5HyQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM4P189MB3668.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6e2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 17:18:21 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 17:18:21 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/11] devtool: fix misleading error when srcrev is on no branch
Date: Tue, 24 Nov 2026 18:18:03 +0100
Message-ID: <20261124171807.74394-8-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
References: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P302CA0024.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM4P189MB3668:EE_
X-MS-Office365-Filtering-Correlation-Id: aa29ba7f-1dd9-4deb-d75c-08df4a4ef07c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|56012099006|11063799006|261009223027099003|261102123227099003|261026140227099003|261022105027099003|261028144727099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: lx1zg31s11maS8FJWmJndnOtX7g87LsGG+ZcC4YMgb+ATgzPAOeoKYndYgTl9mVRVwDL6OqbdLAhcZbr5gjPCMyNSoaNoQMvLIygIsI+gGjfeKO8CK/pi2xkgrEmKU2bQ+r/IPIHwtJtBaW0/sHd9gRbJK8s8dDYRpGNvZzwJvouvW2O5YN3FFSZyZo6BCkougmGTsfPV2/eZQLpzr01elUDaTasLJ11+EcH5J2sWScwizUiJXPVj0eJX0rQwggdW7Xj5wXdWB1PR8a0scgqvKvxHi8E78mGo/Cv61hO5YYwP3DLPUUU3iBgqKi7rrqBCkvdiSlmE5fdjmWEupUCzUyzfhGfLZ7eom71Qg8T3eEyOuNB/nTiN952n1xDWOaGT4PT1W8bMw4HuDs+jPv3RJ6TwdpXhVGPWWoy1j9Vt3ZGk09L4QlXZlhNnD2tvl8BKBLaObM4yTdr/iZU5WgDMYpeB+/7F/UmJWEJF6ZvL+KdMXuqsanAYrdDHHLSr+iRKvYWM1PUbNOXQULr6ZoJ8q6kBRQLsOCr67X4bW5spFt60RQoD7aHTFL8Ueqp4PvSDa94A159F1J1r4DUmJ3MxPnTFSYZxaCwpHOUySkabvbY6QpGQrSk19YYpS6lZXwRkNsKZXjTNPmrnlvGJpdLXe2CE8SWo+JVyamJ7B8Tz9o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(261009223027099003)(261102123227099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1tdjlaAJEyYep3Uba4q7WEQumSWg0hmStZkOrHkkRqmAiqmyYfSIxbinisTg?=
 =?us-ascii?Q?1kj6iOSLIsP+CgyLDaqs6cmtpOode3r0H5jYmyC4UmnNkmrEe8TNr1/7IwUe?=
 =?us-ascii?Q?zIw5oYvo176O5EuZXNTm46IShE/+8/6hYMSiA6CNTE3RoFR4vZe7scouPi1M?=
 =?us-ascii?Q?NKu+gu4REYA0FSg0XMCPQmGlaj6j48Qufhg/7B+9DBzFCCyzoBB9IDQjykJk?=
 =?us-ascii?Q?nI7MnsbYsuW29IFxh5c1iHLTIcMtiB6LbwSd7ZS1D0UolgvNh+VIHniwUgme?=
 =?us-ascii?Q?gjq4JWSRtKMyJHFQeQt8akOXybdyqWG7RwfPXgFM7amIc1AOj6RC1l3KVoja?=
 =?us-ascii?Q?w9isdMb6p8oLsHvdW8MRtVwGEfEVXNm2PpaFSVFx7MHmCArpPQEvBBxFVD+L?=
 =?us-ascii?Q?n0oGYEw61w4h6M7dVT+s/UXp3cbzhcPkEhWXXQ9ZN5Yc6nTkIczfiCIOgtTB?=
 =?us-ascii?Q?HvUeB/51R3hKPFz66VmmzHlaj2J8tDRyPTpBo0KCZEOJhhVK5f9+92al3LtV?=
 =?us-ascii?Q?1Vkhd+AkJYXzSYLVBgan2jEmb652gtMD1WGCGV0WGu60kJzXTakFXTsRmkhM?=
 =?us-ascii?Q?yJzZzmPtJJ5D5wGUMdVXAJcHpgiEhUaQrbmMWWlS9v6f2NJ5hu0lZnw8Db+X?=
 =?us-ascii?Q?O7vuWP0mMjidROIOy+Mu7iGXTl180C1S04Bn6JlkUONYxgs1L+0uzcTpyn57?=
 =?us-ascii?Q?0EE4JPKHIZf91oETcmEbDumT5azBl12zmU9/LPuDmvFo1HtZdS+ed5DNPdx5?=
 =?us-ascii?Q?WBUXvnciYvf1GDxs6uEmVXaWhdHFOwFJDdhRAvJvkwqnp5nysABM0nSzxG6n?=
 =?us-ascii?Q?aZ/a1hxPOLLy1q7V7PsRA/zN+THVq6zrnb4RPs3WTFiAhqDHig5EYy3o6/s8?=
 =?us-ascii?Q?p19E2lVYGnliyokSJU9X6nPlRwFICcFerTK0xwflnsZsK5Uf941vF7ReuGqF?=
 =?us-ascii?Q?wBbeDz9YvliKU48c2sy104hNGhAAMMq3Yl9ScM0THaYZiqmo3vjQwhn/OOkE?=
 =?us-ascii?Q?FdQK/YEffg2vqZ9fuzNnPpOZWRo+uWtVhaGYPA3AMP3P3qicURiqx0teh4nZ?=
 =?us-ascii?Q?Glgs7pob3gHK2UnXKr5dIFniTZru32JWR/j/2U8VtUMzvY1wqQ0LUDsZq1pM?=
 =?us-ascii?Q?Yl9WW0X+u4AcEvCMD1+zINfTcYxIqTWoaIN8HamipXxK9lrzqaMOh/0HTULa?=
 =?us-ascii?Q?R3/Fr4b6TdLAKfFZI39I7rpD3W/SA2IMGWBmrAJC5ctPslGjvr4jyTaUq726?=
 =?us-ascii?Q?k0ZcYzDPiO4tmLw/boZoTQqvNo7K5wqR9qP14bZPUugnFJBtfCsuEvjx/TP1?=
 =?us-ascii?Q?gAwMJCuV1AKhs6njIYz5V9z+vLhR9kATKzBOnx+v9e4p77nNtgn2G9rYsyfD?=
 =?us-ascii?Q?o7Eh/Gc/SpgH/UsTUXmhDIY5sLxucymM8pypTU7xtZYxNrc5EETyutTXeAzz?=
 =?us-ascii?Q?5HVI4qiSuxIpt0lAkfqfYf7p3A0vhMKy/3bSV3T3VJosfDFVCxSBXdPk/zDl?=
 =?us-ascii?Q?G2Mj0+EDazvr9CCdq40LhkgY5VelyKGA93EtFBBbsFTaBYb990rvTm6gXq3d?=
 =?us-ascii?Q?/jVeNAm4nxL4zXCXR1m7tc2Fh3HdUN9LRujStLnuxwNCl9NFT4CJm1HDR0Lv?=
 =?us-ascii?Q?Tek+IxW3zqXeKWiAK6sraaB1v4XgDAslSKaUXVQ9b21TDoki2zApaJGsTWyD?=
 =?us-ascii?Q?7QZYRQit4yJEFSumkIGjtS/ge8+hirCiZfZ0K6IEuJnlblIt8OjdPRUUYsVF?=
 =?us-ascii?Q?g2iX9Rwt6A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: aa29ba7f-1dd9-4deb-d75c-08df4a4ef07c
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 17:18:21.3877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQreyBg3YMifrM+xNViJikJSZxpLXfzHo7213HqXOacCDheEY1TDrtok56TJFhXZRzMzPb5CSQBW+csAHcXy5UF+JGFGQfUU3NpZ9ZhVWVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3668
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251059
Content-Type: text/plain; charset="utf-8"

If srcrev is only reachable from a tag, devtool wrongly reports it as
found on multiple branches. Report that no remote branch contains it.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 scripts/lib/devtool/upgrade.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y
index 6cec34d2d5..46fb1be5d5 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -241,6 +241,9 @@ def _extract_new_source(newpv, srctree, no_patch, srcre=
v, srcbranch, branch, kee
         srcsubdir_rel =3D params.get('destsuffix', 'git')
         if not srcbranch:
             check_branch, check_branch_err =3D __run('git branch -r --cont=
ains %s' % srcrev)
+            if not check_branch.strip():
+                # srcrev is not on any remote branch (e.g. it is only reac=
hable from a tag)
+                raise DevtoolError('Revision %s was not found on any remot=
e branch.\nIt may only be reachable through a tag' % srcrev)
             get_branch =3D [x.strip() for x in check_branch.splitlines()]
             # Remove HEAD reference point and drop remote prefix
             get_branch =3D [x.split('/', 1)[1] for x in get_branch if not =
x.startswith('origin/HEAD')]
