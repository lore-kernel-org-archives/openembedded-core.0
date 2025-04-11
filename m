Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72450C369A2
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 17:28:52 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.22])
 by mx.groups.io with SMTP id smtpd.web10.32593.1744392531471074902
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 10:28:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=Ec+Zqejr;
 spf=pass (domain: oss.nxp.com, ip: 52.101.67.22, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tgCbHwtSWkNQ59miUDOfotI/OpQCEWTshFpgdFvA4iP3TScggWbrlNaz/c2d+bxmGJtAwKZaF5QlUE//xJjM8R6r5ksU5Um0inX7H7dGgVCXlj/leL4mfD9tDJy01Max7LdrfcNb1K4Zw6ARKCM+oYSOJZixAOBlN3OMKxjwBVxhI1rUVKzjBM4X4u9IS43ctSgYt2p6p6qihzN0giL9DYwHXT6VU3G/3/ilFa7maZzekwu8jYQt6Z42twNwAhdGv78TfHOUpDWrtIaTS+GUfPB7vXMtfdAXVm33UiRJzJJjH/tx9pSN+iWrIPxfeHk0q9BWMZpAsTeBM4wCvk5ekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnzXJcPjEINYNXlukSrLryhFIWSJ/ywBHeazm1CS7C4=;
 b=xzaQ0Op4t9NTqP8rotVWq0qk+bLjHSYRlx4yAXwcJTQ/KqejnnhwPdJLqaeBjdkqVCc2+cIEczn69YAczR5d4V7iwAxMYJe4wfMUvX09DT//VN34ltYkF5N/MJyD6fNDYspmt7NO1lAuN+N4CX4D56opStWeUMs2ZigFtvQQe27Ze/G7swifpeMAac+VraZfxHPZwhS2A/1YlluDwlMNIiVeXdTfKbP3VKwVXiK+iFhH2r3kLNrLVB3C1O9tZing1d3dkGBQEUDG1XDuO3DAbakTZcDI7RpIdC7fMtBmlVsp6SnKrDR6cS/XInGCPiuFIPB8dEnEDEkTtIviqMyxmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnzXJcPjEINYNXlukSrLryhFIWSJ/ywBHeazm1CS7C4=;
 b=Ec+ZqejrR9dtILfcS5+gmpi+BRSHqiWtd9usyv9tVYVZgaz0MEnHNEXKvLgcCq8TQ1mkm35C5FyMcaPJznfmCqK67CFkmtQGyMYd613Usd5uDidWNQee0iuyJ3nx93CikLs2PSqwgl7mEuYjugLd23LtLlTTbicsJCt+pwqR7JSM2s+5PFNwO+wOMYjizvxJWjYtdbnfZcMGy2qMKdaJVk2e58Ldolyz/U0BwDUFEcaZ7Mpn/vdeGr2Z2pcL+BGQNcSBA4ltQsDdi9mgUksuzeNK8/uVznWNzI3YE3ykbOVvh4JYg09lOJhuBydhpzhlqPqCQ+vufC96n2L+QXlG6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM9PR04MB8100.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Fri, 11 Apr
 2025 17:28:49 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 17:28:49 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v6 6/6] oeqa/sdk/meson: Skip test when SDK arch != build machine arch
Date: Fri, 11 Apr 2025 12:28:03 -0500
Message-ID: <20250411172803.3706607-6-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411172803.3706607-1-tom.hochstein@oss.nxp.com>
References: <20250411172803.3706607-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PH3PEPF000040AF.namprd05.prod.outlook.com
 (2603:10b6:518:1::5a) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM9PR04MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: e951292f-367d-4b01-5ff7-08dd791e5214
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LfUWhWQxtNHa/iNlIkyM3pj6d1myKgnwx7QedJ3I0JrUxQFNn95GdFiDTinK?=
 =?us-ascii?Q?cwricuFND+Dq/MmkRHuVaCVde1slToC0f/BJY7TgMnLSCz7i8A6ixR7XA4ZB?=
 =?us-ascii?Q?ICuNcNX0j4Tc+Z0aYvKo+yx17BGqmjfUm8oqA9OkAb44gEKc3jH+JT9fR4OJ?=
 =?us-ascii?Q?ShatLs1sLUNXEQVujpoTnq/Znf2RCQA7G7XXlPU802G0YWSHi3k/iPT6irQh?=
 =?us-ascii?Q?Y17kObCe4WyuXjY+qaWmJ3KrMeQSooeyq8liFSXAsy2UysygxyE5hOW3NUNB?=
 =?us-ascii?Q?ajGt6iJU7CGhCMrYvF8njMIpFhP645i41fanZoiJ2F42zNOdFjPeBmW0IkCc?=
 =?us-ascii?Q?Mi9QzjSgfUR07n0rb2QtFBKM3gZYDWm24pkulsFGxue1J/8NSpQG6JalplOx?=
 =?us-ascii?Q?60BDXJH7guMCbX3Veqd/ftt8EQzgu6ZbyHKKnDAA0+SkeHfTGWj4QAk17hPC?=
 =?us-ascii?Q?ABTbZg4HC4PvoL+y+iUKpsoQIocqinYuc5Sc2Q+7ntGPWGXErsJGSKhqtp1d?=
 =?us-ascii?Q?Lbn0/PJivBtm+AX6hh66bcUv9qWsTMtHyC36AYeAq7xf5I3+jHdKn2VW23hW?=
 =?us-ascii?Q?0mNlI0vbgKiVy4eU+71OB25jcWB/nmJAK6/3zhtHr1VrIdfVIiQNX4lp/ap9?=
 =?us-ascii?Q?E/v85lvFnkCcWJVI3gZxvQNngTO4ayJUwZ8y1aEXdZHK/vu7kuXvvAW9t8sZ?=
 =?us-ascii?Q?z84bc4ai9JEvasp51BoTqcMVE//xQUYmjibGZQyGw5usaHCbevQMPT8z78yX?=
 =?us-ascii?Q?1tr/TnuSIrxL346eorUzyVB4KttxhwlGRpBCCajMhgcawS+RHOJF1xxvWXjT?=
 =?us-ascii?Q?lWihy8Wl107k+9vcjv8dJ7ffAcpmZ/2NEMfOo9VD/H1OqKIGJSQ2rfWMaV7e?=
 =?us-ascii?Q?ntJBAtISXrTMmPvErYQW0XJnUQpu5VfYjqJQQOygMGo+WMWNd8MNpfIdfz4z?=
 =?us-ascii?Q?cxCwlA0uEu9OXXvW9Uobs980B56T23+hxYyHaTcT1d4z2zCurwjLXkLTxp43?=
 =?us-ascii?Q?A3jAZoFrcL2f+63SWfBX7vyJOHjlXeFavZbZaRJ4PwS+jiKrFPxzl3LvFJph?=
 =?us-ascii?Q?vCg7uYib9rDamScVjkjwQ2RHqMP6Jf+dOMopd/VR4HvauQNBoWr7c5l8gJ2T?=
 =?us-ascii?Q?VbMAuPIQfU44ZnVhjAGCs2t41lqH0JdgMjHkMDsdBcqg7rLcss5KeFUtYJkM?=
 =?us-ascii?Q?ECDzIasSUz8qLyzLPd98ATzhf7kYd2wED+Nq/EkHZLs/CgcqQjkwzdgmuu6g?=
 =?us-ascii?Q?fsbqQrF1BkIWvBrHgn4YYMkITU4BA/fmxZpgbHrf20TfqZCwKkqL8pMQLMjk?=
 =?us-ascii?Q?8YkQiP3yJM91VuZ64Kc3Ja1Bhd1RAHdf/HxuKxMTGPI7aFh8pzT1R6qNylHj?=
 =?us-ascii?Q?188Xv6yxfpCGBKbw1yJyJ0tM7ASf3A737ZCma2YjL11c1Hv+yDeuF5o+6iKG?=
 =?us-ascii?Q?Nw/TYltDqhg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RU58hBFfKz1swe7JzRj3wf7vx3NUVnNBtNKapMns3OUfymxs1kaAsqLVvaMf?=
 =?us-ascii?Q?0J4T6C6O5YxX5to+IgW8NY15WhKKhSJsMlbfQfbkJHBPpgLIIZH9OJ6GEOzB?=
 =?us-ascii?Q?lfHckWac/dZx/Itj8OrA5veigWBY3sY0KOUqk1rCboNicPTOm9ActQHx+EtS?=
 =?us-ascii?Q?KBgLlc1SAy7j0llvSpImpzNLS+PmcM2uLBqVe3sJl/bmaNRVdxgmsdY4fmEq?=
 =?us-ascii?Q?QlESR5Jy+dWprvwb0Qq4s053sE4C4MVaNcprkhD0DKM1VRuQuNEToSlWesn4?=
 =?us-ascii?Q?q6p7q7v/WxqIj6I5STThvaPT26cTSgQeYCb9k/xORz7MkBJXDuK+6Jm83Zei?=
 =?us-ascii?Q?JZa8qdN40MDToLTYO2tpkfKDRx+ffgNVXnEa06OLc9rzdSIyxvP05mwBx7xh?=
 =?us-ascii?Q?9WzOp3let584QufPS/hpu6Zr07OL8c0IuDkk7GMSD+aEizM+W8tmbJQlDf3V?=
 =?us-ascii?Q?wP4PkBM43w/HGRdgITReXST4+Kj11okJoRElxb086TerupIhvpwMMOWhAY8I?=
 =?us-ascii?Q?pE/Gl2MHMG44r15RXK+wK8uPPsSrk2dn9BvXmGtNHZZtb7NQiHvFSWVqJXH3?=
 =?us-ascii?Q?DEA9ruCcbq/gp6MiyWn/uXKRG5/y7uZIGFDK343DxZgNhRjZXnDl4gyCcw3R?=
 =?us-ascii?Q?+meWxs0BEIbRE3Gl3f+SYel5c10DY/g4MHd4PCww5GR6ayqCACYPcJzOSpZe?=
 =?us-ascii?Q?sf29CKaEQnLsJQ1K7q66pBOhni21oK/qy7oRNTLrjz/KThAO+3FsKWzQ/Fed?=
 =?us-ascii?Q?aEpzP8YTN0j01WceRTbl+Vx9kZ09qUxf7cdehbKUjw4uXx/xfNJLnfDJJB0Q?=
 =?us-ascii?Q?yIID0kLJhFcy8jq8HIjRS25KSpA3//eyXtcZTo+NdDsx2YUboPipDeoJCyul?=
 =?us-ascii?Q?cxzSvt41bf/opZJqaxhSgfFt+PiWT2N+VhyAggI5kPhaLH6YMC5BSUMsgh1N?=
 =?us-ascii?Q?w9Psi0R2/6DENbC3NwUYdI3r7Hy7pCKoPBDMu4ncfgm1UmcQ2CsojrZq0rcs?=
 =?us-ascii?Q?0DTxhVs19uXT/ijEr+L7nJl2rawP3aQ3G2VZWYp24yppRRnpF5I8qgWVOUvu?=
 =?us-ascii?Q?eADCdAdmlvy10K/1WANHX2RJymm3RN83hVFBWPSaJYA9GUdU7Lg0ivqkBrxI?=
 =?us-ascii?Q?i+tbympdf4BRpeu8RjfC8UzYibAIqdDzxz5fnZLL/Q5mmbplCIoZEOoyML3p?=
 =?us-ascii?Q?EEapRHvBJORlBfXHIEFfSZiaMTWHy3nNQnUTee/5OsCgFf2QPKSC5uuGKLad?=
 =?us-ascii?Q?meQliAvYLq1mknM/anExi3mEmVd8f33upZp4+N6LNTtR/X87L0yk6uow2HaG?=
 =?us-ascii?Q?wF4QFXiwNnTwR8iMtYaTzaFG84S6HC04V8U36GztJAn8nBD67T6OjeFQ85tr?=
 =?us-ascii?Q?CVAVnwth4zr0KFsd6Fyjx3MJDJgaVhRq93pl4zBUr236vVmlcbjYjLl1+dAT?=
 =?us-ascii?Q?0BUho0Hns8sQoDLvE6cumC/cIdJYQ6sHY1JYg033nOLGXFRddnRyp6wK9CvE?=
 =?us-ascii?Q?vRjbwVOXnXHz3W1RJiDCZBelcymyMuKcXePU0Zq30Agmo0CHW/hduv1x4c1a?=
 =?us-ascii?Q?478Vihs/j3+anobuO0Qrlbyev05RSJbEi6t/UUKzjYWVHfYDc3laTROKQfNn?=
 =?us-ascii?Q?0w=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e951292f-367d-4b01-5ff7-08dd791e5214
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:28:49.1307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZnKR8Bod8rFc7hao3DnKEZjnFNE1pwyn5/N/Y3MyXDHug1GNGP7lIMKVN815b2dr7CNID8rDWUDAnaJsyaY1sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 17:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214752

The SDK Meson test fails when the SDK is not for the build machine:
```
Traceback (most recent call last):
   File "/srv/pokybuild/yocto-worker/qemux86/build/meta/lib/oeqa/sdk/cases/=
meson.py", line 47, in test_epoxy
     self.assertNotEqual(data["build"]["c"]["exelist"], data["host"]["c"]["=
exelist"])
                         ~~~~~~~~~~~~~^^^^^
KeyError: 'c'
```

Skip the test in this case.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/lib/oeqa/sdk/cases/meson.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oeqa/sdk/cases/meson.py b/meta/lib/oeqa/sdk/cases/mes=
on.py
index 407b94d242..63bdac93a9 100644
--- a/meta/lib/oeqa/sdk/cases/meson.py
+++ b/meta/lib/oeqa/sdk/cases/meson.py
@@ -27,6 +27,11 @@ class MesonTest(OESDKTestCase):
                 self.tc.hasHostPackage("meson-native")):
             raise unittest.SkipTest("MesonTest: needs meson")
=20
+        sdk_arch =3D self.td["SDK_ARCH"]
+        build_arch =3D self._run("uname -m").strip()
+        if not sdk_arch =3D=3D build_arch:
+            raise unittest.SkipTest("MesonTest: SDK arch '%s' not valid fo=
r build machine arch '%s'" % (sdk_arch, build_arch))
+
     def test_epoxy(self):
         with tempfile.TemporaryDirectory(prefix=3D"epoxy", dir=3Dself.tc.s=
dk_dir) as testdir:
             tarball =3D self.fetch(testdir, self.td["DL_DIR"], "https://gi=
thub.com/anholt/libepoxy/releases/download/1.5.3/libepoxy-1.5.3.tar.xz")
--=20
2.34.1


