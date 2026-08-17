Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DE2C5B572
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 13:03:29 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29723.1786971798729159557
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 06:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=jkHyCSCZ;
 spf=pass (domain: est.tech, ip: 40.107.159.70, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTVWoMDrxwob1LJPeVAEHtPR/BLITm6Kyn088M9uQ3Sy2qzVeXnJcI3zagkCEZTPDI8z39qPoFSauHl0Pdy9fj08c4ZnNvnnpla9K5DOS40SK+C3t3EqC7e/eXwp+ePq702aootVqWOlCYzYOnAkdJ9tHQPVTcV0Yqc7+bj40U776E/eObsHQwIuIIQn9nQld9nRQHwFAoX4WmjNdvC3ZUpNXEpSectA8dSnOLpjnMv2iKVqbijR0MYTROiSOEJWa9jDrs8S7RM1RBs+QuOB8Na8LlNNErWF3iE/6ocvYK5BLEumBGenydJ9F44/Ax2cxdNJh7o6HIDBjjBI6TUGrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOBzU1nBiG/ZUEQwiBarGkqtursSxdci1xtVWz5Zq5o=;
 b=s08U4dviISUXZ505sQCt80RK84Z9kTiAMRcLOQuWzpHfo5kHCbkKfMqH+5X3+VR0agX0RhwNlyAZt4LqevWzJLIqx/gL1537EfTdLzlNSlKeg6ZUkb5OVxucuzxAns54XyJiocD3qh4Nc6bCjsrhhINHirejI0INSTOFXr2P4QX+diKZadFsGXRGn5ivmizoKLIbBdQol882143L1pHUJwLesfAc2qCwR7CbjFNqTjYp3799SfiT0cxK77bHqLcGfEl+zIFU3o7Um+u0jAJa2PmF4BGliIz4O/ejl5mN4/oh16WnxdI/ecFe8JdECnqF3X/jP/HtgRPuQ95VskezWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOBzU1nBiG/ZUEQwiBarGkqtursSxdci1xtVWz5Zq5o=;
 b=jkHyCSCZCSyxZlfFt0q+pp4Jp6qjX20dEc1ANfVfHn0iokcULorVyLJLVYmT6UeZXZCYt6NN0pv3yqHqszujLa6KO38hYZZq8Note/OW+/egSwvhEvPCertmkIgEjQy5k2/Dhe1uITcBoMC76B+KY9OhZYDf7I0+EyZmznfj/sHvjXz36AHAO7VKIV+SHggc08UYF/L1XH7raV14lwt4QFsMEMeKZzCaXrxoPT9yXguAyumG/jE6gM9NE41NqLK9DyPpQi2MFdEqcWxH6sDJHIuo/lScWTIgr8xzNEpAOGQXWsO32kA/lWXSWqmcm4WHydY4xg07CA/Dz5Yz3u4CZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PR3P189MB0972.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Mon, 17 Aug
 2026 13:03:09 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.007; Mon, 17 Aug 2026
 13:03:09 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v2 0/2] boost: upgrade 1.91.0 -> 1.92.0
Date: Mon, 17 Aug 2026 15:02:58 +0200
Message-ID: <20260817130300.47761-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260816162611.41933-1-jaipaul.cheernam@est.tech>
References: <20260816162611.41933-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P189CA0012.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::15) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PR3P189MB0972:EE_
X-MS-Office365-Filtering-Correlation-Id: b98ac170-1e11-41aa-7d1d-08defc5fe2dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|3023799007|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	wk/J2yOszfwOBzp3v8ZGEXqsTmpFUlD1CcivxO6kKoDv2TvzrMCEBHuaHUdN+z3EtRqnlvEIUzVUGC09D54XP4PAkoGQ/gS1xeT3KPp0t5ESH5r7T79G69giv+PlQ8tT6R4t3b/+15B8yYZhEcoiYGKWSTxfUjVqaj6lFOClI30GzG2/LYt8HWOXihq2SNmZdXyIOt/N8Opd21bNEPSBCjvGa2FjGIBqME1O52yNm3pC0j5RfYFmG/I6MgsMrdCKFPW9mwNzx1iPhoRyVx/Bc8Tgid3bCmCq4tuum4mkS44KbAOSLB8x+AUcohuOcb/XvlkFvnVDj+VtNn2H8wK6RnPSUckM5BIyFcGQXb8jp/eF6TUqvhDmhRZmGDMaYDAyl1BXKokQ1PRYa0xCH8noDDwdG9OnIi7T0zzGX4yZBNPDFqRzIaGN7PGOXVUp/tY5pysWKwretmNa++mEGi+69qure2kh0yIbaye7Q0zVaRtwodJTuScgC1ni7nqcB9YvF3ezDLHpIgAFkQ5kzEzS4vj5qJxaGj0+5wGONcUC61db0yFGCz8YnCKma42UjCc7HGmv+PKXBC+SZJ35FNm6K3A1rVeT2CLA85eCjMY0MJ6UmgAof+QNQwiJadJQMdHDoxOWNkRrOrKt+E+wDIWtLEIkf9lW1J5r7zbXEKkN8VI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JV7Z30s+9bXY5j/su5AfbveBBOE45rWvyXMIqKhBbxAi4KwOWXyl5yF8H07Z?=
 =?us-ascii?Q?FHKlVP2g0656KoSt2wQ469WzKAkx2rQqng5VAHCHj3Rs/hbsQd2Uk+ZRaRU3?=
 =?us-ascii?Q?Ew6bNaV1NcPT7jWyfjEuJ8yWLvScKqofYDRUyQce4nQgeh6+CY1opULi+X3K?=
 =?us-ascii?Q?PETtjhGLcFTzvywK+bCM+OgxIILcAtZm7At5T7zs1EHtHLVuodCVY06101qT?=
 =?us-ascii?Q?4l39qGUEJ1rq4uxRiu1HkcLnrH8mwUB23YtuAUiz1d/FiGIxJ6PFC3Z6VAI/?=
 =?us-ascii?Q?fNz44KNmPYdyzQTeF3f0kvBcGj9vQnPlTQS+JkxilRi8080hMMrZUp2mmhh4?=
 =?us-ascii?Q?wVtZ5IFtczhLKmTCFgEqCSzWJhIb/O65u58o8Ug13gBjzltjKZ5ndvydQqt2?=
 =?us-ascii?Q?WmPsMuDe1B6qUyOYydeHN+Bsqwzdk5Jff66FHB0MthvHZRNoEkvsUD6EmOQz?=
 =?us-ascii?Q?YqJmpwIAZHYOCQPzZy0kKd2IasWB1WPLgSyeTH2NtwE2RY+FN5C9ekv3lAVG?=
 =?us-ascii?Q?YP924tr+5yOjgZZaOXhFE7jnVVk9V9JUOLxIGiYfEsi4NH/488oyVnEUmQTk?=
 =?us-ascii?Q?uruQ2hwk9Wg55agdpnqSe5Pm2g/5SvzIW3Dr2/+Rdis/4CW+/ZeL/ZP0wE14?=
 =?us-ascii?Q?XEeMDf+PO5b2wEbnpNKbn07l2d+DODu2+nV0Bvcu8t0AQWE5+5ts8ZTop6ab?=
 =?us-ascii?Q?nIyqa8A2uNXd90TeIrOrnHX+PHZjzGTALL3D1vz7fiDT+nIrkS/qUAEwEoBS?=
 =?us-ascii?Q?mY7EX2EbqgjN5mwgk0/lOuiRCyUfOb9Ga1SL9lJXsGtUCaHkBefuzd5JPGcR?=
 =?us-ascii?Q?dD2a2bTXNftSYYPGpwUAmazDEI/AgvyjRHrKWH/JiCeWzT+/wn2bFS5Wti/q?=
 =?us-ascii?Q?YnkWHq3L7VMJdandnjrksFba6d288wOu+N8b7gm/qO86r5lirVPntvG49/Vd?=
 =?us-ascii?Q?vdje+WfA+Rw3IvGVLAV2sEEOkQJ/bNU1D1h85/EquOruuL1hCMwAFjphHIqY?=
 =?us-ascii?Q?36cTghBD7BUA4vh2KQUr29RtwsVGpdJ3ZtbRd5L+43jo7s072Y+z3SnDbANz?=
 =?us-ascii?Q?pi8NSzVudNchL6lZEq9XZHn4kCh/u9IZ3lN8EFjoifNjig9H2anqiwxKDORC?=
 =?us-ascii?Q?NJDP+OQz5mbFxxls+xtGLVqchEQLLh5lMoMCuxV/ehc9sACu/ewzEDRwXoLd?=
 =?us-ascii?Q?g8UV/leu0owtj776Xl3A6Gt9PI6NNSJoVJ7DsDMP5XfS2MVYDlWb9IMpxNHv?=
 =?us-ascii?Q?o1A9GUWEQyiQrjYtFcG5ofhExwzHjkTAAS9GYvzTfjX/Mw2t0AjAfM6GPy2K?=
 =?us-ascii?Q?P/XOJO/SGEsCq1hItEPxY9qvXOFKgO+r93bvqd380gKB5GfN4aYJohvHfsnQ?=
 =?us-ascii?Q?ZWXajmvvNiRkUD/x9t+jBhyUmfbxgHGXPUpjlsdX1M9iyxecyxdeOqhShswS?=
 =?us-ascii?Q?33+b8haQx5iIZqmeFUNy8uzR2slsiHKn+UoBZhts424Zn3VAmRT9DgfMMJki?=
 =?us-ascii?Q?F2TKrlUqmsdiRUleBlKrdFFGSTUMWWHLoGrY4CEpZsKK0yWw2vjU1AQgT7qS?=
 =?us-ascii?Q?jKN4UvGVG4XO8kjXlRnGr216LfCULGvAfsT0+lMMD2LN8JJv+BT7IlouHewu?=
 =?us-ascii?Q?rLV9CsScsgVY5JMpqLmMEURlbcO67+QLd1VywQv5b/FCXWczekAow4VJlI8G?=
 =?us-ascii?Q?yiuJWUiQwDcGqBL1lPR8iEgIK2CpQU+n3ixgM50Yx+R6qmujjgqCWi4wUVGR?=
 =?us-ascii?Q?qTypIHPLkYv0nfuWWtU6nkldsAHwLG8=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b98ac170-1e11-41aa-7d1d-08defc5fe2dc
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 13:03:09.3004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3NfVgTksnwj3ka1nGX3M5dF4zqBTcaqnzB94aI1YXpEc6sUBeTUJMMun0Xlbg3cTFTotOYAOasEJhSOcSPyjsepLgjZAARPxWHzlv7TS5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB0972
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 13:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243621

Upgrade boost and boost-build-native to 1.92.0.

Includes a backport for boost.histogram build failure and a fix
for boost.predef's newly triggered install-data target.

Changes since v1:
- Drop rm -rf ${datadir}; ship predef b2 check tooling in boost-dev
  instead of removing it

Jaipaul Cheernam (2):
  boost-build-native: upgrade 1.91.0 -> 1.92.0
  boost: upgrade 1.91.0 -> 1.92.0

 .../{boost-1.91.0.inc =3D> boost-1.92.0.inc}    |  2 +-
 ...1.91.0.bb =3D> boost-build-native_1.92.0.bb} |  2 +-
 meta/recipes-support/boost/boost.inc          |  3 +-
 ...h-instruction-set-flags-we-do-that-o.patch |  4 +-
 ...01-dont-setup-compiler-flags-m32-m64.patch |  4 +-
 ...b2-project-requirements-out-of-build.patch | 85 +++++++++++++++++++
 .../boost-math-disable-pch-for-gcc.patch      |  2 +-
 .../{boost_1.91.0.bb =3D> boost_1.92.0.bb}      |  1 +
 8 files changed, 95 insertions(+), 8 deletions(-)
 rename meta/recipes-support/boost/{boost-1.91.0.inc =3D> boost-1.92.0.inc}=
 (90%)
 rename meta/recipes-support/boost/{boost-build-native_1.91.0.bb =3D> boost=
-build-native_1.92.0.bb} (92%)
 create mode 100644 meta/recipes-support/boost/boost/0001-histogram-move-b2=
-project-requirements-out-of-build.patch
 rename meta/recipes-support/boost/{boost_1.91.0.bb =3D> boost_1.92.0.bb} (=
76%)


