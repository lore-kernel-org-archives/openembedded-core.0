Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8449.1793269413219990545
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 03:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Tal5m+5m;
 spf=pass (domain: est.tech, ip: 40.107.159.31, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugme2YZaFOoI0R+pZS3G4DAVppCoLP4MmQTR2rTBhv6QnjzWKlu1HUxuizQ7XWIbpY1FHxctl+g5CMTTQEtSFiZ4zxWm5qnyDikxZJqoX/IBaZNcohZg7t5Zrk9b3J+ARjdIeci0/n2LnvaSANd9L3k/+ySYcm014aGPgYmgWKT8P4RRgQYAigfX2Zl72PVFxRMgRuxgAW5eUk/D4kT71QayOiD/BrZWrQVUol5L6mLJi/whA845mptKGaxS9xAhQXeZ1VpxTYl4pgeOXBafcfgTo/cvvkdj73ovYwYqDxi0eHG+Do3pjhgbliFUBuCTA4wqvqlWzRwaaAVoQoaXIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKxT8MMFCkb1jrromEko/OuKwmjf0MQdX2CxEB+aNN0=;
 b=H4YLn0hU+Z//8JYxI0QONTmtTPCY0VOlBTcOQyTkwyDf5lvc9hNVBA5U8OnzuMkPt6HJu4i5Ue1UDFb3t19JdOtghpSmXMW7LMdVERRlkoUDwgBDTRPjF0iSqc99Q3HXpcev5pECdUCXm6u1SvukY+uJnDY0cDtiG8ykriMmxcn60p7pvSsyyUV/bUBqEcMcrJlkArfrEh7mQ5HJIcIxFB4fKE7NuGIGs3uxngY45Y4jcBCU6Ysqy4FXap3hJhbAlBIUW/AO2JQKkRQAUW74iB/hswL1IUJkbP5geKg5ecj5DZXIMqvUWWC6b1uT6MpwQr/rYTPgjNyxorjicNaH7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKxT8MMFCkb1jrromEko/OuKwmjf0MQdX2CxEB+aNN0=;
 b=Tal5m+5mxqGTUAIe9cpqvynDRViFQSd2jB5Z5WjrFF121IDaYVPg3DadGUIvBdqTAEELEs3jhpPpMiOwS5BcncJC7hsN4VSzFxQK1R6XY71hf2GGClvaREWWQcapCVwYAnM+ntHk5Aip5J6fWjXNtUWUG1V8DnGGa5+ajjbYP2Z4cyqKicmaapb9NpbkxD6K9tYI/tuMi1dgCAZ8vx0g8V+3XaqmEhx4f79JLB1jG3rhVWEwhnLYM9mzYE8ivG2SPDqe+bDNxnMMiVWPSACrDR8tU5o+3FkPLTwY65lK+YcFIJjW89OloMHGEjqmtp58jq13EB8qvHPe1SNIx4A+pA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV1P189MB3132.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:293::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 10:23:21 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 10:23:20 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] python3-unittest-automake-output: fix pytest 9.2.0 trylast deprecation
Date: Thu, 29 Oct 2026 11:23:17 +0100
Message-ID: <20261029102318.10042-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028070350.13243-5-jaipaul.cheernam@est.tech>
References: <20261028070350.13243-5-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU6P191CA0070.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::18) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV1P189MB3132:EE_
X-MS-Office365-Filtering-Correlation-Id: eb772c95-930c-43d5-7822-08df35a6a7dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|18002099003|22082099003|3023799007|13003099007|56012099006|11063799006|261022105027099003|261021123027099003|10067099003|261028144727099003|261021121427099003|261009223027099003|261026121527099003|261026140227099003|260925022911599003|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info: Jmrc/BxaZGjE31gF08OKa/y3wopsQib/iM/JOxOqbQhA79+rrup3LJsdE3dYPG5C5+N/6KwgfblHwfXPsi2KUwgVs8Mo8zr0X9v0kg+UTEvDKIoiOQQJWBezbYJ7Ev5dC24oQlMmsUDkkToiahT9NJm3hhHk8+v7IhGQOCM4WPpbLcFHaA00uLf4+ZT98gtPVW64aKM29VGc3fzfD5LKa2v+qqtusZAXpsfMw283sP6NuX0egpT1pD4xtSSU72WoqP+l6tHGv4M71u/0mVEtmUP3bfzk/rAgCFDxZN3o84sZlvJLrkPBOBZy2SIVQGp3LgExDGNZZb9xcFRdrZAMf6MO9Qmu1Rl+pRG0hAwvK6lylR3DhF3gNpKmwthjSUCwIflA4aVXddNupH/cPrdwQkj9YCu7ufu471d8TGJU4I+orQvL7dcKKish8C3uh+RPJYFwXDDDLgzCAWp8KGORK7ZiUAkuARQ7uV+pmM4Qj7tAZFG+ehhxWpnH1aKSAc0EmF8rlXcjH8vyVsnptq2DO/eRCXqYMtojZyOTaknWGAEwH5xzu5iJS+wfewNNK0nDyqbZkSe5IQZBNx6FRhPlhD9SXewe0a3f2PweuVHfYP3EcahoH2ns2bSf2GxrFH6b8xwzjwXtUYeozUu3plZrnGcx+JwxYlOwJFuVks8SOMc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(3023799007)(13003099007)(56012099006)(11063799006)(261022105027099003)(261021123027099003)(10067099003)(261028144727099003)(261021121427099003)(261009223027099003)(261026121527099003)(261026140227099003)(260925022911599003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1Cce8kQK4mCzIG/naqL5oI7W1E1zA2YcmjKWVsmjltPASMigtG9yT3D1BfRV?=
 =?us-ascii?Q?X0+KJ16VOMhiKhCPs90wBS92/vKs8/2n//+PZL3pmMqfpS1u8Amxl8EcpNW6?=
 =?us-ascii?Q?NggM6alia4aw4dfkvjuM4GCp/6kCjXVmYRyDkBGQVu9Nv6x4aGa0RJmLvg+T?=
 =?us-ascii?Q?yYPXvWHuFkLxXOsY4gLMd4H7+vY3NTs9S5MPr03No5wnRVrg69tUB6zFlBfF?=
 =?us-ascii?Q?xMYlilV+G721JFgUGeIwzouik6szg/49BoBOAahHXztIVXjW6DJ3C0pcmhL6?=
 =?us-ascii?Q?cDjA8knLR/aM52OPtpyWeiM7SXI6kjbvPdUxLrYXZmL1Gp0kg0HKRpRTCX7D?=
 =?us-ascii?Q?wg+ecylXs6DSoWo2s7WlBizZFaNG2gQNrJBfg6m9mC1DuahJehcvBBFGFSFM?=
 =?us-ascii?Q?9H1arN6owFcK8CwmxWOqrdnT9IXmRfv3lKJHKMhxbk8i912reQAJbubka9Qn?=
 =?us-ascii?Q?Z5BWafNV3y7fdCOEJfwcACUGULAXWcMUNjLrJnZU/s+AE2vocKjZgk6UXOR5?=
 =?us-ascii?Q?xXnxR03VAgpXFpUbKt/HUOB50t7SYNsVlrHI+2cXjamTo6m73Jqc4BSd01gg?=
 =?us-ascii?Q?ft5tys5qg2xWZsKaSsjQ5BF8WQK0ZN3Jr0I/XRwzoPYA0+p3TPKHOaeuDUJ3?=
 =?us-ascii?Q?U52XzOi+SzK47kVMTH29ZNy86oAs+HSJ+GREgPMBo2aXJXcyYx70dC9k4aD1?=
 =?us-ascii?Q?yqLqN5EPADtltVddchM5mv8EBG2Q4Cx+jEzMmYceT79ApiE2XkrtQ2KjTWf+?=
 =?us-ascii?Q?ZgA3M3faxvWv8+tvUet6TenbyLSEC+LDGdeiTPcY2MkxPviDjpkoE4YOitMy?=
 =?us-ascii?Q?IUMNt4S0t9zWzqsIlmbjc1FY+kViBNzVO097zG+iEY4ALDO4/BCDjrZ0ZqF1?=
 =?us-ascii?Q?Y9dqPET+AL5YW3I1nGUecP0QrH0x1t2CnfzCEHI7UJpPESJH/gDyAm62NOjG?=
 =?us-ascii?Q?QuqqH8qrDndGFZXnNo0u485Ck4k+gP+PRem0lr6RfXhpe++DVeXybqWYNfMD?=
 =?us-ascii?Q?E6BH8dpX2UntLbdhexe+ol3kTVRV29bdZPpSdn5SLTfxmml7OFU/cVWGL1dz?=
 =?us-ascii?Q?3oWpYdWDD4TSQjVUZzR0J8kTnfADrQra1aD+uVQ5hzMdmuY25+rG5HC7jE7k?=
 =?us-ascii?Q?+I0cIw0Cm+lIRCZ0/5jT+5gv0XPQQ7G9hiMYlC9gos6bEEt3hDi3QEpj3t8A?=
 =?us-ascii?Q?oK/ZZsoCn+8BzGmztsdfvGaO8WCtvNsNV3qfUodjy4lgiL8Oqg6rgLVFEne+?=
 =?us-ascii?Q?KbAPtMyMQBTtQMCNUBbgQ13cfX0BWB1Uangn9Z7b8aBolB0XIBk/gW+zOlBz?=
 =?us-ascii?Q?/pCkELP48uv0V3fn7BCvnbOJ6gJ6kt8IQZ0I4CzXoDkJHf2cLFV1ezGTC6iz?=
 =?us-ascii?Q?yIOl97V3cyDhydHRixrmHnFuFZg5JBqxexu/wzZFkgRQjGuNHxGgbG3Cz6E0?=
 =?us-ascii?Q?tg4qYzFaVg3x+fYCal7d9nakYqb1gwxRf4gdRkN7K/7daUDnNLF0cG9XWGLM?=
 =?us-ascii?Q?3yLwLrCNzUbA4xV4NgyVStbws/zUpktU9qWqQFmhDRLY60EXUuLb/6t4ZluF?=
 =?us-ascii?Q?ofEbKVsTN8uhZvgW2Md+/AzAgHRjQRwXVugu7PR0UyNSCteTBim0bej+FVnB?=
 =?us-ascii?Q?SCBzmbJoHweOIgTLPZjRBbaWxy6GSVOcFznPWMsJHgnbimHfM1GGjjfD1SRT?=
 =?us-ascii?Q?d2A7cXNqOSENZcvtz2j9/HZTTgP6IUm/giVSiMUvm9ms/AfTry47h/FLdWa2?=
 =?us-ascii?Q?uTJstKKvZQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: eb772c95-930c-43d5-7822-08df35a6a7dc
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 10:23:20.8493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwkLDwbrdrFyfBVkomDPS6gdNHGEM4AeJjttNiZu4etGBs6ywlRx12oWdrd3Tz5cQ80AcQPAInOP5d2GXaP2ipKGMKvccl7kYTW8LjnIpTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB3132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 10:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248929
Content-Type: text/plain; charset="utf-8"

- Submitted upstream MR [1] and Only the plugin fix is backported.
  MR's test-suite commit is not run in OE-build.

[1] https://gitlab.com/rossburton/python-unittest-automake-output/-/merge_r=
equests/20

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...mpl-trylast-True-instead-of-mark.try.patch | 28 +++++++++++++++++++
 .../python3-unittest-automake-output_0.4.bb   |  4 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-unittest-automake-=
output/0001-pytest-use-hookimpl-trylast-True-instead-of-mark.try.patch

diff --git a/meta/recipes-devtools/python/python3-unittest-automake-output/=
0001-pytest-use-hookimpl-trylast-True-instead-of-mark.try.patch b/meta/reci=
pes-devtools/python/python3-unittest-automake-output/0001-pytest-use-hookim=
pl-trylast-True-instead-of-mark.try.patch
new file mode 100644
index 0000000000..dd36dca601
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-unittest-automake-output/0001-py=
test-use-hookimpl-trylast-True-instead-of-mark.try.patch
@@ -0,0 +1,28 @@
+From 801e5957e7050b370df60f82025efa2229f764ce Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 29 Oct 2026 09:33:37 +0000
+Subject: [PATCH 1/2] pytest: use hookimpl(trylast=3DTrue) instead of
+ mark.trylast
+
+pytest 9.2.0 deprecates mark.trylast and now fails to load the plugin.
+Use the hookimpl decorator instead.
+
+Upstream-Status: Submitted [https://gitlab.com/rossburton/python-unittest-=
automake-output/-/merge_requests/20]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/putao/pytest.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/putao/pytest.py b/src/putao/pytest.py
+index 13156c0..1e0f194 100644
+--- a/src/putao/pytest.py
++++ b/src/putao/pytest.py
+@@ -17,7 +17,7 @@ def pytest_addoption(parser):
+     )
+=20
+=20
+-@pytest.mark.trylast
++@pytest.hookimpl(trylast=3DTrue)
+ def pytest_configure(config):
+     """Set all the options before the test run."""
+     # The help printing uses the terminalreporter,
diff --git a/meta/recipes-devtools/python/python3-unittest-automake-output_=
0.4.bb b/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.=
bb
index 9b0c62f213..07ce70531d 100644
--- a/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb
+++ b/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb
@@ -3,7 +3,9 @@ HOMEPAGE =3D "https://gitlab.com/rossburton/python-unittest=
-automake-output"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df6f16008d9fb7349f06609329f1ab93=
b"
=20
-SRC_URI =3D "git://gitlab.com/rossburton/python-unittest-automake-output;p=
rotocol=3Dhttps;branch=3Dmain;tag=3D${PV}"
+SRC_URI =3D "git://gitlab.com/rossburton/python-unittest-automake-output;p=
rotocol=3Dhttps;branch=3Dmain;tag=3D${PV} \
+           file://0001-pytest-use-hookimpl-trylast-True-instead-of-mark.tr=
y.patch \
+           "
=20
 SRCREV =3D "4d64324a8910ad28b3157f902c35f19fcb479bc0"
=20
