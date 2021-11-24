Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB72C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 14:48:18 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.72])
 by mx.groups.io with SMTP id smtpd.web10.6992.1637765289962517376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 06:48:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=kOOQBK8b;
 spf=pass (domain: weidmueller.com, ip: 40.107.0.72,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HDxyjIc/jcBzAS4uC2fnct92SPTmKi6Dxafq/M5jw3MbnT9S9kqgZgKoiDHAdSH1gTMADUWU2YHjWqY4hPVo/xmRSXgoE6OUT6nrq5LYaaeDV5eTlMxzgsM9PiufQNQG0FUNxjoToG5jSmGdncfkeBJzJV/EvBQnlGRX9ImSLyC3L6DxIoNfv8kCslIq9h+g9CSbkA8Bl0TQaM8QVhzOjGeRxg20A7QOAPp+iEDC0C2mwUpi5HMUC4I+ymHYFuZv6br5ngapMgj9Bf0A+ADibI2Ulz91qfcqwrtFPnlZX8EF6DbCmw5dvkgN28/w0uAwCsZB1/xmvD3bhL9B24dIoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Ej6svadUXzQ58RmbH+qUSUFEWQt2G/Amsmv18T8II4=;
 b=VfsAJNyk6V0svhx6kvl4M2VXdClLCVtt8DA4+rQgGEdTGdMZ5aaCihbT4HMfPo2DcsS3fwDg8TuuxY3bXVlOuivKHAO8H9ZuezBUUx/Z6kLGX5qB1Vq2A3GQgLXaZJip79wBd/sf5wRsSv7JA+xO4BOj3BX4/4+WLcsz4MjES8nmB1elqN1StC8FneVZm0Ujdt90oOXjvK/2ERrlB+jKKTddR6gS7HSSq+RN/3IIFH+CYvZemmNW6tWd2C5Z0qE6n4hAy6XIUeTzeuozMgnf0ScfpZZZX70ySu0Z1CupVR5NU5VUhGxDRjt9Nw7yh0mSXZ7GS1YG4b2zCV6QOSY8ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ej6svadUXzQ58RmbH+qUSUFEWQt2G/Amsmv18T8II4=;
 b=kOOQBK8bQIJrGkdPeE8vPXUxJZoabzf1MuRBpRtlLPfzCoXfVzlKh5qWcQ3TcUO5TFsTyIK3pZdMMDGen/LM7iUOKY9DlFOj/XAoo4R5sjBc1Mbf6L7vk+vR8sa6HLta+SCF/mLl1Bu3rNnBNaT+97P5XqWGUzUpk04V1FR0VPs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5801.eurprd08.prod.outlook.com (2603:10a6:102:81::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 14:48:11 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%7]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 14:48:11 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
	Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 14/15] node-red: Add version 2.1.3
Date: Wed, 24 Nov 2021 15:47:38 +0100
Message-ID: 
 <20211124144739.2250-15-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0701CA0015.eurprd07.prod.outlook.com
 (2603:10a6:203:51::25) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.208) by
 AM5PR0701CA0015.eurprd07.prod.outlook.com (2603:10a6:203:51::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Wed, 24 Nov 2021 14:48:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2123b9a-d653-41c0-5636-08d9af596ff8
X-MS-TrafficTypeDiagnostic: PR3PR08MB5801:
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB5801B91D397BF35C2B694E2BD7619@PR3PR08MB5801.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kRkG2v2BorIV+eqMrtGouOCGvcLqWVb2s1Jc5RaTHVvmhiwW5nI0MFfs8VsI3okiKjvn+OZtbCPcwfHZ5Z08P2jCTFlmUG80FmZD2U9vj10AB6FxP7HTqvoIjkHh/wrEhyz3PTYzb21dVOjzzJji5nTMLwsMC2CBvqbDq7ojwz9b9qmI8+yeS3Aa/sLRl+3mWRW/mifNTV9pza6lU58N9Sa7s3WkGypsREXC6/P1Axf/KMgtvx5OBf8HjyX9t1j/3gOGHNbqaxIk9mScT7zvkfppwELtZ3NmAkX2qIvV1P8lyiR/vXQQOHw4gLONs1v7WAZz/P/pU5HCYjky1yZqWN08TtzOpxTom/Hi6lbEkBUk9UF7mQWr+OV1cExux0A007mILHx5Bg6mIUkj4MPhuDPSxdHVSNYJ44ZwP9uQczFpymv6CcF1YM/H59FQFqhEEWejPBZeRNvQMBql9ywniXFGjTpWI7XgUYt5+nYvnKEJ//TLe5f9/qNEZV6/n5H7K/D1L8u0GZPaLTPzWyn/tNKe9Y/l9gKEIALtM/baQGJymmmNgiSgsKYnfsj8WSa1ZJfe++u9AO8HiAwT9Raq5o+BB+wsUHer+CADjlwwkc7UUZbaJys26AulPC/o8TZvT3JW3U+R+BX8yYjt9jaYDSVlBuPgVEJxEXn1p4ryNrREqwIShTXzTBeyDL7m8KsJ3efTSPG7Ju/xv7CtheguOH7/dUDMRtUadHE3wr/N8Ca4seNaEYQ0G9V+nA5sjhJiA6gt+NTUYw7L/yaGhdX/+7xMVCbcSnOVY7Izr4jymNVIThCF/QKBx5uRyh4b1uNl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(66476007)(66946007)(52116002)(66556008)(6666004)(8936002)(107886003)(8676002)(7696005)(2616005)(83380400001)(186003)(26005)(1076003)(38100700002)(5660300002)(38350700002)(2906002)(956004)(110136005)(316002)(508600001)(30864003)(4326008)(86362001)(966005)(36756003)(579004)(559001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dfMvalZ3ww1UK5qqM1ZrBt6agp1mI/4KlEQuX84qlpibvlexzi3VVABbZKjm?=
 =?us-ascii?Q?DNpPbiby3RolUgKMtioibt5Pk+/v3OwyvDy1gtypisrbXgHDUIeixsXSb5ty?=
 =?us-ascii?Q?26zIgK+EMWsav92QemFzmNE7I/a/Wf4Ayn/hT3gtImBenDxqeaPXpXA+X8nY?=
 =?us-ascii?Q?VrCsivph7r5ImPoypBtc/+D3EELI+flqhf3tts/cPrbNlxhkAHtSdUtRxoR+?=
 =?us-ascii?Q?8pjSPaR98yO+gGLlEbXPmXUur/3NGRxA6I4IthlKo+KxJA/udHBJu3vQPtpp?=
 =?us-ascii?Q?JV4HwUfiZDX1gSHhTXAOr4hx6deq9gzLtKExrpUJOjBWoBrncAAiD0eJUoy7?=
 =?us-ascii?Q?Q7B6CLEhLS4iaz0LW/Jr6vxVcQU3RF2z9Q8a8EUkoj4p8lQotnJqf8v1t3ZC?=
 =?us-ascii?Q?BEjdL8LLYRDxoWV8Kg7jjbhGvmiMPVfLf90gPCJqlgs0+/zL9g4UFMwyt5i7?=
 =?us-ascii?Q?jducStRK+J+SNN3Ik+lk/NtqxueAxsKxcpM376cUU1nhpPiEU+kKK/1e3MjS?=
 =?us-ascii?Q?pw6UE1GhDn3vGa5HerG4MNovr+0frpFWypyPj/X9Ejh5lOiNLD79muFnp4Ji?=
 =?us-ascii?Q?MeAULg3dj4BAzmzTDrKpwruFzRiDi+z0r/hiJdBoJbh2gidcG3f6+slKO343?=
 =?us-ascii?Q?DjLfG+ppF1wTyvHv88GMmNboNB+cC+bze0L3oJxwz0JC0TDM5Jg50Ts7377r?=
 =?us-ascii?Q?i4Kqtlane8QMVJIr2weVcn1kW0PjI2Ywf6IyKSVxsF4GVqyOUpI9gw+qxtSm?=
 =?us-ascii?Q?cSug3MgaJC+M4tW/zq45YglVnJ7cMJCVMHyxetclQFNcVvFbQ/yZ1j7fPUq9?=
 =?us-ascii?Q?aqJLcoVtpXF0EScG7AZraRZ211pj7p1yFzVOT77NL6w/up9vodHImDhTwfbv?=
 =?us-ascii?Q?L2yNdz9CuEi1hIv2/+0p6WqPBtlyhr5y9L2Gn4xA1GWY2Oe4pFYOcbpVJCMv?=
 =?us-ascii?Q?qnIfeGScDYIAEUtE3WMkArNwZPZDI0Lr0oysHlMJlkCypyklmKBzSSoRuECJ?=
 =?us-ascii?Q?T7H/TENKWdHqsnt0JRL134bq7GiDrMP2DfC7G+CFpV/vIv3vYBG7P2UGV/2U?=
 =?us-ascii?Q?CouQOoDog7k0kVZiyCYSWBcYesWLKD71om02DA13O/ZKLgq4sZtM8D1Q5b9R?=
 =?us-ascii?Q?LXf7XxpKjPIpi+th7jbqDkyeHvOS5UiLxb59Tv2ZHbkddB3RdUMko8oDDGy0?=
 =?us-ascii?Q?HkShcK7xJn5r8DTefKybkxsm5nYozube9fgzQvk+RUIB2R3QsaZFkkNRD87R?=
 =?us-ascii?Q?LofjJ7jCUVEOT2BFv0lt9FlFNUcaNf2xryxNialm1JYHVUxI38xMSwTp4BpO?=
 =?us-ascii?Q?nY5sYoZRx1BdGKHL3luqhJvp1XGeBNfvfj6pYQuSRFTrEuacUEEcdD0I1FWJ?=
 =?us-ascii?Q?06AetlF7tJxif8omUOa78U6okhFkB5EpFc50SGeJtKaDLPQWiJgIXg74cz5y?=
 =?us-ascii?Q?erAOQQQ1je+X0ZriIZFkxw5jfaBJkNWX0RuSQ0suNC6ocJRYl/n+gR+OXJ+s?=
 =?us-ascii?Q?K3C2sIrFIxj289b3y1oWizqRprildAOLsOo2Moy+gqXpVjitKYpmM94K8iS3?=
 =?us-ascii?Q?76D1+dM9UDmdsUFUz3GZ0us7FXXSqui73mIm35P7E707opyNiAkrq/3hMOcP?=
 =?us-ascii?Q?0cHDNT0VnJiiQ5FDCydKwgA=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f2123b9a-d653-41c0-5636-08d9af596ff8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 14:48:11.6963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1WEeeiEgQ8I73HbWleMoCIwxo2JLsMXYkeJ2hwEoGyUeoXrLvdT5Be92lIwQnGlJKpIm6nNCCup6kIBkma2qUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5801
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 14:48:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158709

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Created via recipetool:
  devtool add --npm-dev node-red https://registry.npmjs.org/node-red/-/node=
-red-2.1.3.tgz

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 .../node-red/node-red_2.1.3.bb                | 908 ++++++++++++++++++
 1 file changed, 908 insertions(+)
 create mode 100644 meta/recipes-devtools/node-red/node-red_2.1.3.bb

diff --git a/meta/recipes-devtools/node-red/node-red_2.1.3.bb b/meta/recipe=
s-devtools/node-red/node-red_2.1.3.bb
new file mode 100644
index 0000000000..b6d9400f98
--- /dev/null
+++ b/meta/recipes-devtools/node-red/node-red_2.1.3.bb
@@ -0,0 +1,908 @@
+# Recipe created by recipetool
+# This is the basis of a recipe and may need further editing in order to b=
e fully functional.
+# (Feel free to remove these comments when editing.)
+
+SUMMARY =3D "Low-code programming for event-driven applications"
+HOMEPAGE =3D "http://nodered.org"
+# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best gues=
ses - it is
+# your responsibility to verify that the values are complete and correct.
+#
+# NOTE: multiple licenses have been detected; they have been separated wit=
h &
+# in the LICENSE value for now since it is a reasonable assumption that al=
l
+# of the licenses apply. If instead there is a choice between the multiple
+# licenses then you should change the value to separate the licenses with =
|
+# instead of &. If there is any doubt, check the accompanying documentatio=
n
+# to determine which situation is applicable.
+LICENSE =3D "Apache-2.0 & MIT & ISC & ISC & MIT & BSD-3-Clause &  MIT & BS=
D-2-Clause & BSD-0-Clause & ISC & CC-BY-SA-4.0 & BSD-3-Clause & MIT & BSD-3=
-Clause & MPL-2.0 & ISC | MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd6f37569f5013072e9490d2194d10ae=
6 \
+                    file://node_modules/range-parser/LICENSE;md5=3Dd4246fb=
961a4f121eef5ffca47f0b010 \
+                    file://node_modules/json-buffer/LICENSE;md5=3Df26ea3f2=
a31273ebd199d933804f5e8b \
+                    file://node_modules/split2/LICENSE;md5=3Da3b8406138769=
6c9678867c878a6bbc3 \
+                    file://node_modules/minimist/LICENSE;md5=3Daea1cde6964=
5f4b99be4ff7ca9abcce1 \
+                    file://node_modules/leven/license;md5=3Da12ebca0510a77=
3644101a99a867d210 \
+                    file://node_modules/normalize-url/license;md5=3D915042=
b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/mute-stream/LICENSE;md5=3D82703a69=
f6d7411dde679954c2fd9dca \
+                    file://node_modules/content-disposition/LICENSE;md5=3D=
13babc4f212ce635d68da544339c962b \
+                    file://node_modules/oauth2orize/LICENSE;md5=3D6392ca87=
973f3c4bfd78b7cd812e289a \
+                    file://node_modules/resolve-alpn/LICENSE;md5=3Df3d086f=
7c83cdc609b9f5d6057d7c1e4 \
+                    file://node_modules/are-we-there-yet/LICENSE.md;md5=3D=
1750b360daee1aa920366e344c1b0c57 \
+                    file://node_modules/reinterval/LICENSE;md5=3Dc65ef22a3=
86436c433298ca42418c200 \
+                    file://node_modules/passport/LICENSE;md5=3Da632f82c0ee=
b821949115ede725c2326 \
+                    file://node_modules/path-is-absolute/license;md5=3Da12=
ebca0510a773644101a99a867d210 \
+                    file://node_modules/decompress-response/license;md5=3D=
d5f2a6dd0192dcc7c833e50bb9017337 \
+                    file://node_modules/decompress-response/node_modules/m=
imic-response/license;md5=3Dd5f2a6dd0192dcc7c833e50bb9017337 \
+                    file://node_modules/got/license;md5=3D915042b5df33c31a=
6db2b37eadaa00e3 \
+                    file://node_modules/ipaddr.js/LICENSE;md5=3D88f60a4b6e=
44cb849b5d907a7664c0ef \
+                    file://node_modules/bl/LICENSE.md;md5=3D455bc3781a009c=
f9a615e8622138814c \
+                    file://node_modules/bl/node_modules/inherits/LICENSE;m=
d5=3D5b2ef2247af6d355ae9d9f988092d470 \
+                    file://node_modules/make-dir/license;md5=3D915042b5df3=
3c31a6db2b37eadaa00e3 \
+                    file://node_modules/make-dir/node_modules/semver/LICEN=
SE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/sax/LICENSE;md5=3D326d5674181c4bb2=
10e424772c60fa80 \
+                    file://node_modules/acorn-walk/LICENSE;md5=3D33e8b86a0=
84578431a31c72608f226b8 \
+                    file://node_modules/busboy/LICENSE;md5=3Ddf3ad145c2acb=
fc4f246fa834a6675c7 \
+                    file://node_modules/busboy/node_modules/string_decoder=
/LICENSE;md5=3Dfcf5cfdc777e49f11402422c72a86f43 \
+                    file://node_modules/busboy/node_modules/readable-strea=
m/LICENSE;md5=3Dd7351a4fc8e956f1a68413490d5e655e \
+                    file://node_modules/parse5/LICENSE;md5=3D179850e04995d=
6fceaf64f2dd2a851b0 \
+                    file://node_modules/type-is/LICENSE;md5=3D0afd201e48c7=
d095454eed4ac1184e40 \
+                    file://node_modules/type-is/node_modules/media-typer/L=
ICENSE;md5=3Dc6e0ce1e688c5ff16db06b7259e9cd20 \
+                    file://node_modules/memorystore/LICENSE;md5=3D3c97a7f1=
928df131f083f488a42c41b7 \
+                    file://node_modules/memorystore/node_modules/debug/LIC=
ENSE;md5=3Dddd815a475e7338b0be7a14d8ee35a99 \
+                    file://node_modules/memorystore/node_modules/ms/licens=
e.md;md5=3Dfd56fd5f1860961dfa92d313167c37a6 \
+                    file://node_modules/chownr/LICENSE;md5=3D82703a69f6d74=
11dde679954c2fd9dca \
+                    file://node_modules/forwarded/LICENSE;md5=3D13babc4f21=
2ce635d68da544339c962b \
+                    file://node_modules/pump/LICENSE;md5=3D9befe7026bf9158=
86cd566a98117c80e \
+                    file://node_modules/buffer-from/LICENSE;md5=3D46513463=
e8f7d9eb671a243f0083b2c6 \
+                    file://node_modules/@mapbox/node-pre-gyp/LICENSE;md5=
=3D7e13c3cf883a44ebcc74a8f568c0f6fb \
+                    file://node_modules/set-blocking/LICENSE.txt;md5=3D8fd=
106383180f7bbb8f534414fdf7d35 \
+                    file://node_modules/emoji-regex/LICENSE-MIT.txt;md5=3D=
ee9bd8b835cfcd512dd644540dd96987 \
+                    file://node_modules/safer-buffer/LICENSE;md5=3D3baebc2=
a17b8f5bff04882cd0dc0f76e \
+                    file://node_modules/signal-exit/LICENSE.txt;md5=3De29e=
20260a1c78dba16a233048565cde \
+                    file://node_modules/htmlparser2/LICENSE;md5=3D10e03952=
c97f225d4229d7524619eb7f \
+                    file://node_modules/merge-descriptors/LICENSE;md5=3Daa=
f57ba8c5c9bf256fea7e943991a81a \
+                    file://node_modules/string_decoder/LICENSE;md5=3D14af5=
1f8c0a6c6e400b53e18c6e5f85c \
+                    file://node_modules/string_decoder/node_modules/safe-b=
uffer/LICENSE;md5=3Dbadd5e91c737e7ffdf10b40c1f907761 \
+                    file://node_modules/jsonfile/LICENSE;md5=3D423f377ade9=
5936f6fe009b1c137bfdb \
+                    file://node_modules/passport-http-bearer/LICENSE;md5=
=3Df694b9c022a5bf0f2c3976a047fed39c \
+                    file://node_modules/on-headers/LICENSE;md5=3Dc6e0ce1e6=
88c5ff16db06b7259e9cd20 \
+                    file://node_modules/tar/LICENSE;md5=3D82703a69f6d7411d=
de679954c2fd9dca \
+                    file://node_modules/tar/node_modules/mkdirp/LICENSE;md=
5=3Df653359cc2be3ff55aa601d58d84c808 \
+                    file://node_modules/tar/node_modules/yallist/LICENSE;m=
d5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/p-cancelable/license;md5=3D915042b=
5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/proxy-addr/LICENSE;md5=3D6e8686b7b=
13dd7ac8733645a81842c4a \
+                    file://node_modules/uri-js/LICENSE;md5=3D3b55dad4a9874=
8003b5b423477713da1 \
+                    file://node_modules/uuid/LICENSE.md;md5=3D353e680cdafd=
96bf30131cbb7b14a6e8 \
+                    file://node_modules/@babel/runtime/LICENSE;md5=3Db1d0c=
d283a346e919abb3beeb018279d \
+                    file://node_modules/vary/LICENSE;md5=3D13babc4f212ce63=
5d68da544339c962b \
+                    file://node_modules/depd/LICENSE;md5=3D13babc4f212ce63=
5d68da544339c962b \
+                    file://node_modules/lowercase-keys/license;md5=3D91504=
2b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/require-from-string/license;md5=3D=
be72c3ad86c1c4e9578a1945b082b17d \
+                    file://node_modules/cheerio-select/LICENSE;md5=3Dd5b9c=
b3bc7f6ffd7bea8661f30447c11 \
+                    file://node_modules/responselike/LICENSE;md5=3Debe53e6=
698981352da17c09ed915f13f \
+                    file://node_modules/base64-js/LICENSE;md5=3Dea9187ca93=
cdc4f71219d1675712e908 \
+                    file://node_modules/iconv-lite/LICENSE;md5=3Df942263d9=
8f0d75e0e0101884e86261d \
+                    file://node_modules/i18next/LICENSE;md5=3D3eff6c8f85f3=
d254cc65be1f1a47d81f \
+                    file://node_modules/fs.realpath/LICENSE;md5=3D06247052=
5c8e380f8567f665ef554d11 \
+                    file://node_modules/form-data/License;md5=3D7aa505292e=
2636a9e59d4d3f258f4819 \
+                    file://node_modules/qs/LICENSE;md5=3Dd5c7c6dc45a33a0a9=
620ed81315672d7 \
+                    file://node_modules/http-errors/LICENSE;md5=3D60720962=
3abfcc77b9098f71a0ef52f9 \
+                    file://node_modules/express/LICENSE;md5=3D5513c00a5c36=
cd361da863dd9aa8875d \
+                    file://node_modules/express/node_modules/cookie/LICENS=
E;md5=3Dbc85b43b6f963e8ab3f88e63628448ca \
+                    file://node_modules/mkdirp/LICENSE;md5=3Db2d989bc186e7=
f6b418a5fdd5cc0b56b \
+                    file://node_modules/fast-deep-equal/LICENSE;md5=3Dea87=
ade09b9e6da4f2e47904a4ee137b \
+                    file://node_modules/help-me/LICENSE;md5=3D6c5e18034ed4=
abefcb9ac97254596680 \
+                    file://node_modules/fs-extra/LICENSE;md5=3Dea817882455=
c03503f7d014a8f54f095 \
+                    file://node_modules/psl/LICENSE;md5=3D2425d288296fae32=
e27553694ff40294 \
+                    file://node_modules/domelementtype/LICENSE;md5=3Dd5b9c=
b3bc7f6ffd7bea8661f30447c11 \
+                    file://node_modules/once/LICENSE;md5=3D82703a69f6d7411=
dde679954c2fd9dca \
+                    file://node_modules/nopt/LICENSE;md5=3D82703a69f6d7411=
dde679954c2fd9dca \
+                    file://node_modules/esprima/LICENSE.BSD;md5=3De3c825c9=
32a984958bafbac21e21f984 \
+                    file://node_modules/semver/LICENSE;md5=3D82703a69f6d74=
11dde679954c2fd9dca \
+                    file://node_modules/semver/node_modules/yallist/LICENS=
E;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/semver/node_modules/lru-cache/LICE=
NSE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/passport-strategy/LICENSE;md5=3Df6=
94b9c022a5bf0f2c3976a047fed39c \
+                    file://node_modules/concat-map/LICENSE;md5=3Daea1cde69=
645f4b99be4ff7ca9abcce1 \
+                    file://node_modules/setprototypeof/LICENSE;md5=3D4846f=
1626304c2c0f806a539bbc7d54a \
+                    file://node_modules/uid-safe/LICENSE;md5=3D6a3e6caad27=
80f696f4884e98789e866 \
+                    file://node_modules/cacheable-request/LICENSE;md5=3D9a=
2baa6947d5018096b83508bd94026e \
+                    file://node_modules/string-width/license;md5=3D915042b=
5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/css-what/LICENSE;md5=3Dd5b9cb3bc7f=
6ffd7bea8661f30447c11 \
+                    file://node_modules/send/LICENSE;md5=3Ddf2b0938eba0709=
b77ac937e2d552b7a \
+                    file://node_modules/send/node_modules/mime/LICENSE;md5=
=3D8e8ea2ad138ce468f8570a0edbadea65 \
+                    file://node_modules/send/node_modules/ms/license.md;md=
5=3Dfd56fd5f1860961dfa92d313167c37a6 \
+                    file://node_modules/media-typer/LICENSE;md5=3D13babc4f=
212ce635d68da544339c962b \
+                    file://node_modules/tslib/CopyrightNotice.txt;md5=3D36=
b68802c0e2531ae0fe6cd30619652a \
+                    file://node_modules/tslib/LICENSE.txt;md5=3Df938d99cba=
29007eeae26d80a9a4cfa6 \
+                    file://node_modules/utils-merge/LICENSE;md5=3D1cf09060=
82187f374cb9a63c54eb782c \
+                    file://node_modules/etag/LICENSE;md5=3D6e8686b7b13dd7a=
c8733645a81842c4a \
+                    file://node_modules/denque/LICENSE;md5=3Df49b524d140e2=
dcf1b437d9185172531 \
+                    file://node_modules/delayed-stream/License;md5=3D5270b=
4ddb6700d0a820e6d066744589c \
+                    file://node_modules/mimic-response/license;md5=3D91504=
2b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/yallist/LICENSE;md5=3D82703a69f6d7=
411dde679954c2fd9dca \
+                    file://node_modules/punycode/LICENSE-MIT.txt;md5=3Dee9=
bd8b835cfcd512dd644540dd96987 \
+                    file://node_modules/delegates/License;md5=3D039225978c=
07bc42e8c0ef2f72b81c09 \
+                    file://node_modules/ansi-regex/license;md5=3D915042b5d=
f33c31a6db2b37eadaa00e3 \
+                    file://node_modules/encodeurl/LICENSE;md5=3D272621efa0=
ff4f18a73221e49ab60654 \
+                    file://node_modules/hpagent/LICENSE;md5=3D6b1a33a7ee2b=
aee18174a3db1ec2138f \
+                    file://node_modules/end-of-stream/LICENSE;md5=3D9befe7=
026bf915886cd566a98117c80e \
+                    file://node_modules/has-unicode/LICENSE;md5=3D2bab5b1c=
26e9c44fc4e489bb98cfb196 \
+                    file://node_modules/stream-shift/LICENSE;md5=3D4201401=
0547e55bd3bcac2fec8c45624 \
+                    file://node_modules/axios/LICENSE;md5=3D61ca8e74b70ea1=
9443b95af4bd607999 \
+                    file://node_modules/mime-types/LICENSE;md5=3Dbf1f9ad1e=
2e1d507aef4883fff7103de \
+                    file://node_modules/cli-table/LICENSE;md5=3D7426c3e07c=
d555a7113d8e4740f8bf6a \
+                    file://node_modules/mime/LICENSE;md5=3D8e8ea2ad138ce46=
8f8570a0edbadea65 \
+                    file://node_modules/methods/LICENSE;md5=3Dc16a7dd9f946=
172f07086576d135d9d3 \
+                    file://node_modules/ieee754/LICENSE;md5=3D56c3be003027=
d64d24ca6b69a2612f2f \
+                    file://node_modules/async/LICENSE;md5=3D64a378b2b01424=
fe22d54bc626175994 \
+                    file://node_modules/toidentifier/LICENSE;md5=3D1a26107=
1a044d02eb6f2bb47f51a3502 \
+                    file://node_modules/node-addon-api/LICENSE.md;md5=3D04=
92ef29a9d558a3e9660e7accc9ca6a \
+                    file://node_modules/cheerio/LICENSE;md5=3D476b79500345=
6b2ff8c5a905d5829955 \
+                    file://node_modules/on-finished/LICENSE;md5=3D1b1f7f9c=
ec194121fdf616b971df7a7b \
+                    file://node_modules/multer/LICENSE;md5=3D0395802799233=
34e9eaeb656c54e6039 \
+                    file://node_modules/multer/node_modules/string_decoder=
/LICENSE;md5=3D14af51f8c0a6c6e400b53e18c6e5f85c \
+                    file://node_modules/multer/node_modules/readable-strea=
m/LICENSE;md5=3Da67a7926e54316d90c14f74f71080977 \
+                    file://node_modules/multer/node_modules/concat-stream/=
LICENSE;md5=3D3ad90c134f824ddfcea611ee1fa567a8 \
+                    file://node_modules/npmlog/LICENSE.md;md5=3Dc637d431ac=
5faadb34aff5fbd6985239 \
+                    file://node_modules/node-red-admin/LICENSE;md5=3D2ee41=
112a44fe7014dce33e26468ba93 \
+                    file://node_modules/acorn/LICENSE;md5=3D33e8b86a084578=
431a31c72608f226b8 \
+                    file://node_modules/pseudomap/LICENSE;md5=3D82703a69f6=
d7411dde679954c2fd9dca \
+                    file://node_modules/retry/License;md5=3Dc40fe50d231414=
ad1bc68e8965e7e95e \
+                    file://node_modules/parseurl/LICENSE;md5=3De7842ed4f18=
8e53e53c3e8d9c4807e89 \
+                    file://node_modules/core-util-is/LICENSE;md5=3D6126e36=
127d20ec0e2f637204a5c68ff \
+                    file://node_modules/typedarray/LICENSE;md5=3D6085b70b7=
4c7dcf7df4e955725e3153d \
+                    file://node_modules/http-cache-semantics/LICENSE;md5=
=3D7b7cd412797b9e24e3c58eff96661bf9 \
+                    file://node_modules/commist/LICENSE;md5=3D3f047b8c7263=
3e56a5d2bddc7feaa719 \
+                    file://node_modules/body-parser/LICENSE;md5=3D0afd201e=
48c7d095454eed4ac1184e40 \
+                    file://node_modules/body-parser/node_modules/iconv-lit=
e/LICENSE;md5=3Df942263d98f0d75e0e0101884e86261d \
+                    file://node_modules/body-parser/node_modules/raw-body/=
LICENSE;md5=3Dc970d30155ebbdb1903e6de8c0666e18 \
+                    file://node_modules/glob/LICENSE;md5=3Dc727d36f28f2762=
b1011dd483aa1a191 \
+                    file://node_modules/moment/LICENSE;md5=3D397bb5fedab22=
612d8d69f1458a9321e \
+                    file://node_modules/xml2js/LICENSE;md5=3Dd9fc599c8d9e6=
f8665063862aac66dfc \
+                    file://node_modules/strip-ansi/license;md5=3D915042b5d=
f33c31a6db2b37eadaa00e3 \
+                    file://node_modules/quick-lru/license;md5=3D915042b5df=
33c31a6db2b37eadaa00e3 \
+                    file://node_modules/mustache/LICENSE;md5=3D33fa3c7f276=
11cfb1191e5aa2bb107b1 \
+                    file://node_modules/hash-sum/license;md5=3D06049b6eb5e=
43aafd8fe7c733d033646 \
+                    file://node_modules/safe-buffer/LICENSE;md5=3Dbadd5e91=
c737e7ffdf10b40c1f907761 \
+                    file://node_modules/raw-body/LICENSE;md5=3Dc970d30155e=
bbdb1903e6de8c0666e18 \
+                    file://node_modules/raw-body/node_modules/iconv-lite/L=
ICENSE;md5=3Df942263d98f0d75e0e0101884e86261d \
+                    file://node_modules/raw-body/node_modules/http-errors/=
LICENSE;md5=3D607209623abfcc77b9098f71a0ef52f9 \
+                    file://node_modules/raw-body/node_modules/inherits/LIC=
ENSE;md5=3D5b2ef2247af6d355ae9d9f988092d470 \
+                    file://node_modules/domhandler/LICENSE;md5=3Dd5b9cb3bc=
7f6ffd7bea8661f30447c11 \
+                    file://node_modules/enquirer/LICENSE;md5=3D62927f9e287=
cbc1dbddd9c8f208b7cdb \
+                    file://node_modules/object-assign/license;md5=3Da12ebc=
a0510a773644101a99a867d210 \
+                    file://node_modules/serve-static/LICENSE;md5=3D27b1707=
520b14d0bc890f4e75cd387b0 \
+                    file://node_modules/gauge/LICENSE.md;md5=3Dc637d431ac5=
faadb34aff5fbd6985239 \
+                    file://node_modules/entities/LICENSE;md5=3Dd5b9cb3bc7f=
6ffd7bea8661f30447c11 \
+                    file://node_modules/defer-to-connect/LICENSE;md5=3D78f=
d36a7284eb85369521bcb6e863186 \
+                    file://node_modules/uglify-js/LICENSE;md5=3D00b4520269=
5de5cd110bd3c2927a0da2 \
+                    file://node_modules/inflight/LICENSE;md5=3D90a3ca01a5e=
fed8b813a81c6c8fa2e63 \
+                    file://node_modules/sprintf-js/LICENSE;md5=3Dab40451de=
4e35c90f1b663b4fbd314a9 \
+                    file://node_modules/xtend/LICENSE;md5=3D66787c5cd698a0=
b30b358c7e30f500ca \
+                    file://node_modules/json-stringify-safe/LICENSE;md5=3D=
82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/balanced-match/LICENSE.md;md5=3D7f=
a99ddc3424107350ca6e9a24552085 \
+                    file://node_modules/get-stream/license;md5=3Dd5f2a6dd0=
192dcc7c833e50bb9017337 \
+                    file://node_modules/lodash.clonedeep/LICENSE;md5=3Da3b=
2b7770df62392c164de4001b59f8f \
+                    file://node_modules/is-utf8/LICENSE;md5=3D10d1495ba466=
09e55e586ab71fa81f45 \
+                    file://node_modules/lru-cache/LICENSE;md5=3D82703a69f6=
d7411dde679954c2fd9dca \
+                    file://node_modules/cacheable-lookup/LICENSE;md5=3D23a=
0ab677f942ddc394168925c5a9328 \
+                    file://node_modules/css-select/LICENSE;md5=3Dd5b9cb3bc=
7f6ffd7bea8661f30447c11 \
+                    file://node_modules/finalhandler/LICENSE;md5=3Db506956=
e5cbfbe0d04f8a5c40107ec89 \
+                    file://node_modules/minizlib/LICENSE;md5=3Dd8a0ca0c46b=
fa01db064fa836f550966 \
+                    file://node_modules/minizlib/node_modules/yallist/LICE=
NSE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/graceful-fs/LICENSE;md5=3Dfd63805f=
d8e3797063b247781e5ee6e4 \
+                    file://node_modules/bcrypt/LICENSE;md5=3D4665b5424ab73=
4549385bae891f8d35d \
+                    file://node_modules/mime-db/LICENSE;md5=3Dc8d3a30332ec=
b31cfaf4c0a06da18f5c \
+                    file://node_modules/streamsearch/LICENSE;md5=3Ddf3ad14=
5c2acbfc4f246fa834a6675c7 \
+                    file://node_modules/http2-wrapper/LICENSE;md5=3D78fd36=
a7284eb85369521bcb6e863186 \
+                    file://node_modules/regenerator-runtime/LICENSE;md5=3D=
57a79768a3b1e4d0f3a3787048a96356 \
+                    file://node_modules/node-fetch/LICENSE.md;md5=3D89fabe=
2fb10f72e48c2b3be506237d1e \
+                    file://node_modules/cronosjs/LICENSE;md5=3D364202e8ebc=
58122042346798591bff7 \
+                    file://node_modules/asynckit/LICENSE;md5=3D177bc287fb9=
558bf3ea50b440c1c86ff \
+                    file://node_modules/cookie-parser/LICENSE;md5=3D720bd7=
b9472a2297cd6820c73c71cf3e \
+                    file://node_modules/cookie-parser/node_modules/cookie/=
LICENSE;md5=3Dbc85b43b6f963e8ab3f88e63628448ca \
+                    file://node_modules/bcryptjs/LICENSE;md5=3Dd99a4f4253f=
ea793a1256aef626aa6e5 \
+                    file://node_modules/ws/LICENSE;md5=3D95833e8f03687308b=
0584a377b9e12b0 \
+                    file://node_modules/debug/LICENSE;md5=3Dddd815a475e733=
8b0be7a14d8ee35a99 \
+                    file://node_modules/path-to-regexp/LICENSE;md5=3D44088=
ba57cb871a58add36ce51b8de08 \
+                    file://node_modules/clone-response/LICENSE;md5=3D9a2ba=
a6947d5018096b83508bd94026e \
+                    file://node_modules/random-bytes/LICENSE;md5=3D65cf5ba=
a33cf259f107bbfc965d9f8a0 \
+                    file://node_modules/unpipe/LICENSE;md5=3D934ab86a8ab08=
1ea0326add08d550739 \
+                    file://node_modules/json-schema-traverse/LICENSE;md5=
=3Dea87ade09b9e6da4f2e47904a4ee137b \
+                    file://node_modules/destroy/LICENSE;md5=3Dc8d3a30332ec=
b31cfaf4c0a06da18f5c \
+                    file://node_modules/cookie/LICENSE;md5=3Dbc85b43b6f963=
e8ab3f88e63628448ca \
+                    file://node_modules/keyv/LICENSE;md5=3D13e5cd3c004de57=
8850c852f5760aa36 \
+                    file://node_modules/minipass/LICENSE;md5=3Dff53df3ad94=
e5c618e230ab49ce310fa \
+                    file://node_modules/minipass/node_modules/yallist/LICE=
NSE;md5=3D82703a69f6d7411dde679954c2fd9dca \
+                    file://node_modules/mqtt/LICENSE.md;md5=3D4ebb3d258700=
b7b67ec523232e4b5555 \
+                    file://node_modules/mqtt/node_modules/debug/LICENSE;md=
5=3Dddd815a475e7338b0be7a14d8ee35a99 \
+                    file://node_modules/mqtt/node_modules/ms/license.md;md=
5=3Dfd56fd5f1860961dfa92d313167c37a6 \
+                    file://node_modules/combined-stream/License;md5=3D5270=
b4ddb6700d0a820e6d066744589c \
+                    file://node_modules/colors/MIT-LICENSE.txt;md5=3D5bc6c=
72caa0dcc082d24a52a6ae12112 \
+                    file://node_modules/detect-libc/LICENSE;md5=3De3fc50a8=
8d0a364313df4b21ef20c29e \
+                    file://node_modules/escape-html/LICENSE;md5=3Df8746101=
546eeb9e4f6de64bb8bdf595 \
+                    file://node_modules/async-mutex/LICENSE;md5=3D2bed6324=
2f12f0617c19f2f6ceafab6f \
+                    file://node_modules/whatwg-url/LICENSE.txt;md5=3D5ab91=
13efe10eeab888f7502d1c2e894 \
+                    file://node_modules/universalify/LICENSE;md5=3Da734c6a=
d6e37a515025ac5e8e90ef786 \
+                    file://node_modules/console-control-strings/LICENSE;md=
5=3D43abbc6f9093aea69560715033788727 \
+                    file://node_modules/fs-minipass/LICENSE;md5=3D82703a69=
f6d7411dde679954c2fd9dca \
+                    file://node_modules/tough-cookie/LICENSE;md5=3D7189377=
a5215f1211b70cf2b9754841e \
+                    file://node_modules/tough-cookie/node_modules/universa=
lify/LICENSE;md5=3Da734c6ad6e37a515025ac5e8e90ef786 \
+                    file://node_modules/moment-timezone/LICENSE;md5=3Df512=
12467d7a94e1583a4cff9492bd80 \
+                    file://node_modules/cors/LICENSE;md5=3D947eb5e695dade4=
32a500b12c510de85 \
+                    file://node_modules/array-flatten/LICENSE;md5=3D44088b=
a57cb871a58add36ce51b8de08 \
+                    file://node_modules/aproba/LICENSE;md5=3D9d215c9223fbe=
f14a4642cc450e7ed4b \
+                    file://node_modules/dom-serializer/LICENSE;md5=3Dba339=
0a22fe1d127f3522ac8ef1bd1a0 \
+                    file://node_modules/webidl-conversions/LICENSE.md;md5=
=3D44d86433f305935cb0c3d3cd320e7a34 \
+                    file://node_modules/is-fullwidth-code-point/license;md=
5=3D915042b5df33c31a6db2b37eadaa00e3 \
+                    file://node_modules/follow-redirects/LICENSE;md5=3D291=
3574e921aefe1275cd5864b4f9b66 \
+                    file://node_modules/ee-first/LICENSE;md5=3Dc8d3a30332e=
cb31cfaf4c0a06da18f5c \
+                    file://node_modules/ajv/LICENSE;md5=3D5ed8db7ae36f56c8=
a5cfc218c41ac926 \
+                    file://node_modules/accepts/LICENSE;md5=3Dbf1f9ad1e2e1=
d507aef4883fff7103de \
+                    file://node_modules/color-support/LICENSE;md5=3D82703a=
69f6d7411dde679954c2fd9dca \
+                    file://node_modules/domutils/LICENSE;md5=3Dd5b9cb3bc7f=
6ffd7bea8661f30447c11 \
+                    file://node_modules/bytes/LICENSE;md5=3D013e95467eddb0=
48f19a6f5b42820f86 \
+                    file://node_modules/read/LICENSE;md5=3D82703a69f6d7411=
dde679954c2fd9dca \
+                    file://node_modules/duplexify/LICENSE;md5=3D9befe7026b=
f915886cd566a98117c80e \
+                    file://node_modules/minimatch/LICENSE;md5=3D82703a69f6=
d7411dde679954c2fd9dca \
+                    file://node_modules/fresh/LICENSE;md5=3D373c2cf0978b37=
e434394a43b4cbbdb4 \
+                    file://node_modules/@types/node/LICENSE;md5=3Dd4a904ca=
135bb7bc912156fee12726f0 \
+                    file://node_modules/@types/responselike/LICENSE;md5=3D=
27e94c0280987ab296b0b8dd02ab9fe5 \
+                    file://node_modules/@types/cacheable-request/LICENSE;m=
d5=3Dd4a904ca135bb7bc912156fee12726f0 \
+                    file://node_modules/@types/http-cache-semantics/LICENS=
E;md5=3Dd4a904ca135bb7bc912156fee12726f0 \
+                    file://node_modules/@types/keyv/LICENSE;md5=3Dd4a904ca=
135bb7bc912156fee12726f0 \
+                    file://node_modules/@szmarczak/http-timer/LICENSE;md5=
=3D78fd36a7284eb85369521bcb6e863186 \
+                    file://node_modules/wide-align/LICENSE;md5=3D9d215c922=
3fbef14a4642cc450e7ed4b \
+                    file://node_modules/xmlbuilder/LICENSE;md5=3Df2836c06c=
74eca0f4565de06fe9900b0 \
+                    file://node_modules/clone/LICENSE;md5=3D411e33109fa516=
d190d232100fdc7f8e \
+                    file://node_modules/uid2/LICENSE;md5=3Ddd54d0741106ff4=
193bcecb833f6e350 \
+                    file://node_modules/brace-expansion/LICENSE;md5=3Da5df=
515ef062cc3affd8c0ae59c059ec \
+                    file://node_modules/readable-stream/LICENSE;md5=3Da67a=
7926e54316d90c14f74f71080977 \
+                    file://node_modules/wrappy/LICENSE;md5=3D82703a69f6d74=
11dde679954c2fd9dca \
+                    file://node_modules/ms/license.md;md5=3Dfd56fd5f186096=
1dfa92d313167c37a6 \
+                    file://node_modules/process-nextick-args/license.md;md=
5=3D216769dac98a78ec088ee7cc6fad1dfa \
+                    file://node_modules/append-field/LICENSE;md5=3D5c090f9=
df283eefdcea00b2f0766ca6c \
+                    file://node_modules/ansi-colors/LICENSE;md5=3D442b5b96=
1878bc805832d1d24572f62d \
+                    file://node_modules/concat-stream/LICENSE;md5=3D3ad90c=
134f824ddfcea611ee1fa567a8 \
+                    file://node_modules/express-session/LICENSE;md5=3D23ef=
db85883c5cc9b6cc5b0456666a2b \
+                    file://node_modules/express-session/node_modules/depd/=
LICENSE;md5=3Debc30494fd072dc98368da73e1821715 \
+                    file://node_modules/express-session/node_modules/safe-=
buffer/LICENSE;md5=3Dbadd5e91c737e7ffdf10b40c1f907761 \
+                    file://node_modules/content-type/LICENSE;md5=3Df4b767f=
006864f81a4901347fe4efdab \
+                    file://node_modules/buffer/LICENSE;md5=3De49e579dbcc02=
cf1f699deec85fd96f0 \
+                    file://node_modules/inherits/LICENSE;md5=3D5b2ef2247af=
6d355ae9d9f988092d470 \
+                    file://node_modules/dicer/LICENSE;md5=3Ddf3ad145c2acbf=
c4f246fa834a6675c7 \
+                    file://node_modules/dicer/node_modules/string_decoder/=
LICENSE;md5=3Dfcf5cfdc777e49f11402422c72a86f43 \
+                    file://node_modules/dicer/node_modules/readable-stream=
/LICENSE;md5=3Dd7351a4fc8e956f1a68413490d5e655e \
+                    file://node_modules/rimraf/LICENSE;md5=3D82703a69f6d74=
11dde679954c2fd9dca \
+                    file://node_modules/negotiator/LICENSE;md5=3D6417a862a=
5e35c17c904d9dda2cbd499 \
+                    file://node_modules/util-deprecate/LICENSE;md5=3Db7c99=
ef4b0f3ad9911a52219947f8cf0 \
+                    file://node_modules/passport-oauth2-client-password/LI=
CENSE;md5=3D95ca2874231d1b4d06ca94c35aa604f7 \
+                    file://node_modules/statuses/LICENSE;md5=3D36e2bc837ce=
69a98cc33a9e140d457e5 \
+                    file://node_modules/@node-red/editor-client/LICENSE;md=
5=3Dd6f37569f5013072e9490d2194d10ae6 \
+                    file://node_modules/@node-red/editor-client/public/ven=
dor/ace/LICENSE;md5=3D794d11c5219c59c9efa2487c2b4066b2 \
+                    file://node_modules/@node-red/editor-client/public/ven=
dor/monaco/dist/LICENSE;md5=3Df54bb2c6fe5e92709d134914191197a3 \
+                    file://node_modules/@node-red/editor-client/public/ven=
dor/monaco/dist/theme/LICENSE;md5=3D280545e7ad0c4af4a6c0e737934a23b2 \
+                    file://node_modules/@node-red/nodes/LICENSE;md5=3Dd6f3=
7569f5013072e9490d2194d10ae6 \
+                    file://node_modules/@node-red/editor-api/LICENSE;md5=
=3Dd6f37569f5013072e9490d2194d10ae6 \
+                    file://node_modules/@node-red/util/LICENSE;md5=3Dd6f37=
569f5013072e9490d2194d10ae6 \
+                    file://node_modules/@node-red/registry/LICENSE;md5=3Dd=
6f37569f5013072e9490d2194d10ae6 \
+                    file://node_modules/@node-red/runtime/LICENSE;md5=3Dd6=
f37569f5013072e9490d2194d10ae6 \
+                    file://node_modules/basic-auth/LICENSE;md5=3D42fffe6fe=
0b70501d52150ebb52113df \
+                    file://node_modules/mqtt-packet/LICENSE.md;md5=3D622e7=
7e45833bb4f785aebc7e41c0bdb \
+                    file://node_modules/mqtt-packet/node_modules/debug/LIC=
ENSE;md5=3Dddd815a475e7338b0be7a14d8ee35a99 \
+                    file://node_modules/mqtt-packet/node_modules/ms/licens=
e.md;md5=3Dfd56fd5f1860961dfa92d313167c37a6 \
+                    file://node_modules/parse5-htmlparser2-tree-adapter/LI=
CENSE;md5=3D179850e04995d6fceaf64f2dd2a851b0 \
+                    file://node_modules/jsonata/LICENSE;md5=3D0a2fefbb55a8=
4675607e8efd57183e99 \
+                    file://node_modules/https-proxy-agent/node_modules/deb=
ug/LICENSE;md5=3Dddd815a475e7338b0be7a14d8ee35a99 \
+                    file://node_modules/https-proxy-agent/node_modules/ms/=
license.md;md5=3Dfd56fd5f1860961dfa92d313167c37a6 \
+                    file://node_modules/js-yaml/LICENSE;md5=3Deffd621a9bf5=
d72d6a7e6ef819bf3afb \
+                    file://node_modules/@sindresorhus/is/license;md5=3Dd5f=
2a6dd0192dcc7c833e50bb9017337 \
+                    file://node_modules/abbrev/LICENSE;md5=3De9c0b639498fb=
e60d17b10099aba77c0 \
+                    file://node_modules/argparse/LICENSE;md5=3Da2f2590d8d8=
2b0fa2b3e2fc5c69d2b81 \
+                    file://node_modules/agent-base/node_modules/debug/LICE=
NSE;md5=3Dddd815a475e7338b0be7a14d8ee35a99 \
+                    file://node_modules/agent-base/node_modules/ms/license=
.md;md5=3Dfd56fd5f1860961dfa92d313167c37a6 \
+                    file://node_modules/nth-check/LICENSE;md5=3Dd5b9cb3bc7=
f6ffd7bea8661f30447c11 \
+                    file://node_modules/agent-base/README.md;beginline=3D1=
18;endline=3D139;md5=3D817767aad5d49be3802ded0fd39ffb91 \
+                    file://node_modules/boolbase/README.md;md5=3D48c1ef355=
8d25499a96a3d66baed5d9c \
+                    file://node_modules/cookie-signature/Readme.md;beginli=
ne=3D21;endline=3D42;md5=3Ddb8ec78b5bb012861b19b8353c342fbe \
+                    file://node_modules/fs.notify/README.md;beginline=3D39=
;endline=3D57;md5=3Dc82960e8037b3f5932e15efede72951b \
+                    file://node_modules/https-proxy-agent/README.md;beginl=
ine=3D114;endline=3D135;md5=3D817767aad5d49be3802ded0fd39ffb91 \
+                    file://node_modules/isarray/README.md;beginline=3D34;e=
ndline=3D54;md5=3D7fa99ddc3424107350ca6e9a24552085 \
+                    file://node_modules/multer/node_modules/isarray/README=
.md;beginline=3D40;endline=3D60;md5=3D7fa99ddc3424107350ca6e9a24552085 \
+                    file://node_modules/pause/Readme.md;beginline=3D8;endl=
ine=3D29;md5=3Db45d61f441ee044a3ad2d6cdac00aa86"
+
+SRC_URI =3D " \
+    https://registry.npmjs.org/node-red/-/node-red-2.1.3.tgz;subdir=3Dnpm;=
striplevel=3D1;name=3Dmain \
+    https://registry.npmjs.org/%40babel/runtime/-/runtime-7.16.3.tgz;downl=
oadfilename=3Dnpm2/babel-runtime-7.16.3.tgz;sha512sum=3D581c1e91ca9a71d6367=
bd005fd0ed62c551699d24625391b8ea4e3a0c0e05e4559dd9454bce3ec2dbe4a770212a105=
6c6cff834335595b8661722d03be96cd4d;subdir=3Dnpm/node_modules/@babel/runtime=
;striplevel=3D1 \
+    https://registry.npmjs.org/%40mapbox/node-pre-gyp/-/node-pre-gyp-1.0.7=
.tgz;downloadfilename=3Dnpm2/mapbox-node-pre-gyp-1.0.7.tgz;sha512sum=3D3e99=
52be5e2927937706456301d0f3a4f85550f742ef7260b6d911f8b9c1c7638e442d46090b018=
d4784ba2a5ff6e39a00cd526f171d6457d1dca0d32a6d92d0;subdir=3Dnpm/node_modules=
/@mapbox/node-pre-gyp;striplevel=3D1 \
+    https://registry.npmjs.org/%40node-red/editor-api/-/editor-api-2.1.3.t=
gz;downloadfilename=3Dnpm2/node-red-editor-api-2.1.3.tgz;sha512sum=3De7baf8=
7f9ffc4b3f10ec712394d5a0cda3086afa161dab376e82615e9534c8b2f52c1cadcf0659875=
8c109d622b51393dfbc2bbb03c61fc5ca477b3616f0448d;subdir=3Dnpm/node_modules/@=
node-red/editor-api;striplevel=3D1 \
+    https://registry.npmjs.org/%40node-red/editor-client/-/editor-client-2=
.1.3.tgz;downloadfilename=3Dnpm2/node-red-editor-client-2.1.3.tgz;sha512sum=
=3Da264a4ef700a8154eb4ac12984438542d978481b404d63e2846249e1469b3e4798f8e05c=
1d17e08eba0c1c4459f34a573e68f054b7c2d0650dd0e614b34f1360;subdir=3Dnpm/node_=
modules/@node-red/editor-client;striplevel=3D1 \
+    https://registry.npmjs.org/%40node-red/nodes/-/nodes-2.1.3.tgz;downloa=
dfilename=3Dnpm2/node-red-nodes-2.1.3.tgz;sha512sum=3D27618e298ff802850af41=
1815c4b8f8e12502c669a61b62d687d062905df0fa44e0623d0cdb48e608116abc64c5cb754=
5d5732c854d505222ccbedbe44276a12;subdir=3Dnpm/node_modules/@node-red/nodes;=
striplevel=3D1 \
+    https://registry.npmjs.org/%40node-red/registry/-/registry-2.1.3.tgz;d=
ownloadfilename=3Dnpm2/node-red-registry-2.1.3.tgz;sha512sum=3Defc1681b602c=
30788c61d5757c232f024c132a4745fab3fc9afe4e7cd6be88f85353aea7db802d9f015e58e=
75ab1cd9920fe3377b4dbc6bde9713ffe9b490523;subdir=3Dnpm/node_modules/@node-r=
ed/registry;striplevel=3D1 \
+    https://registry.npmjs.org/%40node-red/runtime/-/runtime-2.1.3.tgz;dow=
nloadfilename=3Dnpm2/node-red-runtime-2.1.3.tgz;sha512sum=3Df95bbb6b5e0270e=
0d087f7d0c983fbb1a9cf73b08558e2b8248da5f4ad27e0ecb777fe13390d76937ca7734705=
a60989d48fdfa0520dfe8220ed3d9956342f0c;subdir=3Dnpm/node_modules/@node-red/=
runtime;striplevel=3D1 \
+    https://registry.npmjs.org/%40node-red/util/-/util-2.1.3.tgz;downloadf=
ilename=3Dnpm2/node-red-util-2.1.3.tgz;sha512sum=3D14ca8dc1decb69cde39bcdee=
490bab47737b13ada363a403bce3f6a50e0b082b46611291170ba47f31bd9b3ba68a8292ef8=
d2f37c21ff0405320f420453499e8;subdir=3Dnpm/node_modules/@node-red/util;stri=
plevel=3D1 \
+    https://registry.npmjs.org/%40sindresorhus/is/-/is-4.2.0.tgz;downloadf=
ilename=3Dnpm2/sindresorhus-is-4.2.0.tgz;sha512sum=3D56413728b0662707026950=
11b50a5fb8a70abfc81c06652e6eb7c7185f38757bae5ba8e0b116313edcdc2213f22bd5803=
e946ddbfc58eb3903f4c9d1689cd2cb;subdir=3Dnpm/node_modules/@sindresorhus/is;=
striplevel=3D1 \
+    https://registry.npmjs.org/%40szmarczak/http-timer/-/http-timer-4.0.6.=
tgz;downloadfilename=3Dnpm2/szmarczak-http-timer-4.0.6.tgz;sha512sum=3De010=
1f7f29183a03bee67cc1598c04dd6f74b0180b26850f45659c2fcc25ca233c201f22a49cf75=
0c27d29741dd512905e92a9f13bad9fcd0766d5acbb6bbbeb;subdir=3Dnpm/node_modules=
/@szmarczak/http-timer;striplevel=3D1 \
+    https://registry.npmjs.org/%40types/cacheable-request/-/cacheable-requ=
est-6.0.2.tgz;downloadfilename=3Dnpm2/types-cacheable-request-6.0.2.tgz;sha=
512sum=3D077c55a3e76528cea79ca4dc9a6e59b58fce2fc6ce00e7763a579ef4cd737edeb9=
a31e743b38c41d6f75b03894f63e9cbd6f048e0d7f4247f8c5dda4ba002950;subdir=3Dnpm=
/node_modules/@types/cacheable-request;striplevel=3D1 \
+    https://registry.npmjs.org/%40types/http-cache-semantics/-/http-cache-=
semantics-4.0.1.tgz;downloadfilename=3Dnpm2/types-http-cache-semantics-4.0.=
1.tgz;sha512sum=3D499b3b7a46cff02374b71546db15511fa1202a6126df504ec40d3bbe4=
15a113cd9cf5c61f9c6edf01708d2c969ca6bf0871e5d9459d01b6ad394f5509fe8913d;sub=
dir=3Dnpm/node_modules/@types/http-cache-semantics;striplevel=3D1 \
+    https://registry.npmjs.org/%40types/keyv/-/keyv-3.1.3.tgz;downloadfile=
name=3Dnpm2/types-keyv-3.1.3.tgz;sha512sum=3D157089832c8dde2bd5811a2697887d=
e06fe9de463ebbf07ce8b6be429b5ca89696b415ad99ce93b6435f4b8d27f5b22fc8bb5e1e1=
ef35ceb606e86ce44a3db0e;subdir=3Dnpm/node_modules/@types/keyv;striplevel=3D=
1 \
+    https://registry.npmjs.org/%40types/node/-/node-16.11.10.tgz;downloadf=
ilename=3Dnpm2/types-node-16.11.10.tgz;sha512sum=3Ddda4671dad4a94e104849ebe=
0afc8728ae6f13d05c2c68ed529c2fa982d1bd835028c7da6eedc1c1f25a03f48b5bc7717b6=
f0bb0d0e3b47c1e3d3bb39f782638;subdir=3Dnpm/node_modules/@types/node;striple=
vel=3D1 \
+    https://registry.npmjs.org/%40types/responselike/-/responselike-1.0.0.=
tgz;downloadfilename=3Dnpm2/types-responselike-1.0.0.tgz;sha512sum=3Df39636=
0638ae7c5cda30896f243bd34c1f05c65db17cba381e0987cd5073d3cc38c0378f0938d8c3a=
e8f76ba253b4933962df26a6fd80a046e7f2a350dd4154c;subdir=3Dnpm/node_modules/@=
types/responselike;striplevel=3D1 \
+    https://registry.npmjs.org/abbrev/-/abbrev-1.1.1.tgz;downloadfilename=
=3Dnpm2/abbrev-1.1.1.tgz;sha512sum=3D9e77bdfc8890fe1cc8858ea97439db06dcfb0e=
33d32ab634d0fff3bcf4a6e69385925eb1b86ac69d79ff56d4cd35f36d01f67dff546d7a192=
ccd4f6a7138a2d1;subdir=3Dnpm/node_modules/abbrev;striplevel=3D1 \
+    https://registry.npmjs.org/accepts/-/accepts-1.3.7.tgz;downloadfilenam=
e=3Dnpm2/accepts-1.3.7.tgz;sha512sum=3D225f3442cd968d89492013733642ba298aa5=
54c4db64b5e01f1da84f4a54fdf8d11f2129f8f11f10f634477582c001953ad6aec61d613b1=
36021fe5bbfb750a4;subdir=3Dnpm/node_modules/accepts;striplevel=3D1 \
+    https://registry.npmjs.org/acorn-walk/-/acorn-walk-8.2.0.tgz;downloadf=
ilename=3Dnpm2/acorn-walk-8.2.0.tgz;sha512sum=3D93e8b21c4b8f812c3a49bb83a46=
40cfb4e874146b4e03677a3e17a092cd732fbc8e4a32f9da12a5def9855ee79e51f679fa18f=
b78d387e8b38c1c829c35d920c;subdir=3Dnpm/node_modules/acorn-walk;striplevel=
=3D1 \
+    https://registry.npmjs.org/acorn/-/acorn-8.5.0.tgz;downloadfilename=3D=
npm2/acorn-8.5.0.tgz;sha512sum=3Dc976d8785cbe8d4b98777fc20dc83636421813df75=
5d85ff6e37bb2e68c98a051c89a78ed494785f15e0088575fd973f751b85132c352f4a5b03e=
ab29c9916e5;subdir=3Dnpm/node_modules/acorn;striplevel=3D1 \
+    https://registry.npmjs.org/agent-base/-/agent-base-6.0.2.tgz;downloadf=
ilename=3Dnpm2/agent-base-6.0.2.tgz;sha512sum=3D45937035c945efe312ffc6c383b=
d1a9a0df6772799199c620ee42667128b025423af78c6c8bc7ee0a924e7c50eec3d90760148=
402a2fb92b991129dee911ba5d;subdir=3Dnpm/node_modules/agent-base;striplevel=
=3D1 \
+    https://registry.npmjs.org/ajv/-/ajv-8.6.3.tgz;downloadfilename=3Dnpm2=
/ajv-8.6.3.tgz;sha512sum=3D48c24e7433fa2ea4e40f452af2a2e2fa03304add229972d2=
574f34a85570242a47f54e8c6fe49418701733428d6dc04f82ecad5b2bc5c5c1e030b7b60f6=
5d2a7;subdir=3Dnpm/node_modules/ajv;striplevel=3D1 \
+    https://registry.npmjs.org/ansi-colors/-/ansi-colors-4.1.1.tgz;downloa=
dfilename=3Dnpm2/ansi-colors-4.1.1.tgz;sha512sum=3D2685f46a919b1da50904d97a=
c85fa9e89005619ebaebf86108628de6df501636c940a514fe0f0c35b1436ef7eb80a5ef235=
42966994f3a7c08a3df655ff00098;subdir=3Dnpm/node_modules/ansi-colors;striple=
vel=3D1 \
+    https://registry.npmjs.org/ansi-regex/-/ansi-regex-5.0.1.tgz;downloadf=
ilename=3Dnpm2/ansi-regex-5.0.1.tgz;sha512sum=3Daae2505e54d25062f62c7f52517=
a3c570b18e2ca1a9e1828e8b3529bce04d4b05c13cb373b4c29762473c91f73fd9649325316=
bf7eea38e6fda5d26531410a15;subdir=3Dnpm/node_modules/ansi-regex;striplevel=
=3D1 \
+    https://registry.npmjs.org/append-field/-/append-field-1.0.0.tgz;downl=
oadfilename=3Dnpm2/append-field-1.0.0.tgz;sha1sum=3D1e3440e915f0b1203d23748=
e78edd7b9b5b43e56;subdir=3Dnpm/node_modules/append-field;striplevel=3D1 \
+    https://registry.npmjs.org/aproba/-/aproba-2.0.0.tgz;downloadfilename=
=3Dnpm2/aproba-2.0.0.tgz;sha512sum=3D9587b81b1ed04fe30a19b0ec03e67e85efd6b5=
e7f4062c033a52bf5e406b75fb21f49fe33cf5db5f4b44f71f5c976ed39aee608374146d4ad=
061aff2f8a3873d;subdir=3Dnpm/node_modules/aproba;striplevel=3D1 \
+    https://registry.npmjs.org/are-we-there-yet/-/are-we-there-yet-2.0.0.t=
gz;downloadfilename=3Dnpm2/are-we-there-yet-2.0.0.tgz;sha512sum=3D0a2fea10d=
9b01e7b18a3dc4a21c5093792de0ca749e91d59d63f55fc9e70caaf2787f9983c4a482896c1=
657b598c6d381e22bbcd5fe9e95b3df79d8cacc79423;subdir=3Dnpm/node_modules/are-=
we-there-yet;striplevel=3D1 \
+    https://registry.npmjs.org/argparse/-/argparse-1.0.10.tgz;downloadfile=
name=3Dnpm2/argparse-1.0.10.tgz;sha512sum=3Da39468cbab4d1b848bfc53a408037a4=
738e26a4652db944b605adc32db49a9b75df015ab9c0f9f1b3e7b88de4f6f4ea9bc11af9798=
10d01e3c74996c957be84e;subdir=3Dnpm/node_modules/argparse;striplevel=3D1 \
+    https://registry.npmjs.org/array-flatten/-/array-flatten-1.1.1.tgz;dow=
nloadfilename=3Dnpm2/array-flatten-1.1.1.tgz;sha1sum=3D9a5f699051b1e7073328=
f2a008968b64ea2955d2;subdir=3Dnpm/node_modules/array-flatten;striplevel=3D1=
 \
+    https://registry.npmjs.org/async-mutex/-/async-mutex-0.3.2.tgz;downloa=
dfilename=3Dnpm2/async-mutex-0.3.2.tgz;sha512sum=3D1ee4caec4ecc4fb8d9121d4f=
f46b515bdf9a4d68835968bd2276d9e618f1ae745adfd292e015b4e3ec4b06160d4b6697847=
5082994b0de08f83e7d698fea8600;subdir=3Dnpm/node_modules/async-mutex;striple=
vel=3D1 \
+    https://registry.npmjs.org/async/-/async-0.1.22.tgz;downloadfilename=
=3Dnpm2/async-0.1.22.tgz;sha1sum=3D0fc1aaa088a0e3ef0ebe2d8831bab0dcf8845061=
;subdir=3Dnpm/node_modules/async;striplevel=3D1 \
+    https://registry.npmjs.org/asynckit/-/asynckit-0.4.0.tgz;downloadfilen=
ame=3Dnpm2/asynckit-0.4.0.tgz;sha1sum=3Dc79ed97f7f34cb8f2ba1bc9790bcc366474=
b4b79;subdir=3Dnpm/node_modules/asynckit;striplevel=3D1 \
+    https://registry.npmjs.org/axios/-/axios-0.22.0.tgz;downloadfilename=
=3Dnpm2/axios-0.22.0.tgz;sha512sum=3D674537ba1a907a0d6835c8a1b307f8643e7b3b=
736b475f995e1c5a44e696a439ac0d3c7b4f61cd055dae941b627b6870269b6ef14be09c9a0=
af8122a77387fd7;subdir=3Dnpm/node_modules/axios;striplevel=3D1 \
+    https://registry.npmjs.org/balanced-match/-/balanced-match-1.0.2.tgz;d=
ownloadfilename=3Dnpm2/balanced-match-1.0.2.tgz;sha512sum=3Dde849e50ed13315=
ebb84dd4099b5ec2b8c9aa94eed8e21e56f144364ea47d0a5bdf82797e1b440697d009f1b74=
b71d8cae94695b041a3f02252121098585393f;subdir=3Dnpm/node_modules/balanced-m=
atch;striplevel=3D1 \
+    https://registry.npmjs.org/base64-js/-/base64-js-1.5.1.tgz;downloadfil=
ename=3Dnpm2/base64-js-1.5.1.tgz;sha512sum=3D00aa5a6251e7f2de1255b3870b2f9b=
e7e28a82f478bebb03f2f6efadb890269b3b7ca0d3923903af2ea38b4ad42630b49336cd78f=
2f0cf1abc8b2a68e35a9e58;subdir=3Dnpm/node_modules/base64-js;striplevel=3D1 =
\
+    https://registry.npmjs.org/basic-auth/-/basic-auth-2.0.1.tgz;downloadf=
ilename=3Dnpm2/basic-auth-2.0.1.tgz;sha512sum=3D345f9ea6e11d9d4615946ba16b1=
6dbabe76f26db702e7198f988b195794c1392a94395b70a75c0e5c5539de63748f6cf0d191c=
8cc6e27ebc261587029603997a;subdir=3Dnpm/node_modules/basic-auth;striplevel=
=3D1 \
+    https://registry.npmjs.org/bcrypt/-/bcrypt-5.0.1.tgz;downloadfilename=
=3Dnpm2/bcrypt-5.0.1.tgz;sha512sum=3Df414e09ab859336b756cdb83b6bb483154a69b=
1641ac9ef59fc5a0f9881d8c7b8859817b4a38e608f64507eff98bfa3f3c8791a705494773f=
e36ba4822d523ab;subdir=3Dnpm/node_modules/bcrypt;striplevel=3D1 \
+    https://registry.npmjs.org/bcryptjs/-/bcryptjs-2.4.3.tgz;downloadfilen=
ame=3Dnpm2/bcryptjs-2.4.3.tgz;sha1sum=3D9ab5627b93e60621ff7cdac5da9733027df=
1d0cb;subdir=3Dnpm/node_modules/bcryptjs;striplevel=3D1 \
+    https://registry.npmjs.org/bl/-/bl-4.1.0.tgz;downloadfilename=3Dnpm2/b=
l-4.1.0.tgz;sha512sum=3Dd56d3b70cf604ba0dc2e97ab65f1528fe6d62ed68f1923875a1=
3e21b35e6bd525b44b746f36b07fca9fc12d5b556a595039e0029fda1e64e416e721bc05de1=
eb;subdir=3Dnpm/node_modules/bl;striplevel=3D1 \
+    https://registry.npmjs.org/body-parser/-/body-parser-1.19.0.tgz;downlo=
adfilename=3Dnpm2/body-parser-1.19.0.tgz;sha512sum=3D76110fb3bd943db0e70102=
7d64a30d4cfea9b496a2a2784fe5c05be78d675cf956eb425ea68f5157f6b87d7e17596f42b=
8534adb692b86b8f5fab83389f342b3;subdir=3Dnpm/node_modules/body-parser;strip=
level=3D1 \
+    https://registry.npmjs.org/boolbase/-/boolbase-1.0.0.tgz;downloadfilen=
ame=3Dnpm2/boolbase-1.0.0.tgz;sha1sum=3D68dff5fbe60c51eb37725ea9e3ed310dcc1=
e776e;subdir=3Dnpm/node_modules/boolbase;striplevel=3D1 \
+    https://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.11.tg=
z;downloadfilename=3Dnpm2/brace-expansion-1.1.11.tgz;sha512sum=3D882b8f1c31=
60ac75fb1f6bc423fe71a73d3bcd21c1d344e9ba0aa1998b5598c3bae75f260ae44ca0e6059=
5d101974835f3bb9fa3375a1e058a71815beb5a8688;subdir=3Dnpm/node_modules/brace=
-expansion;striplevel=3D1 \
+    https://registry.npmjs.org/buffer-from/-/buffer-from-1.1.2.tgz;downloa=
dfilename=3Dnpm2/buffer-from-1.1.2.tgz;sha512sum=3D13e5d0091c126da6a20a1b6f=
ea4e83c2073e6f1f81b3abee2891c7979928c7f05a29b8625f3a903b02b870edb6c84946a76=
3829a3c15853dc79b18323c69c97d;subdir=3Dnpm/node_modules/buffer-from;striple=
vel=3D1 \
+    https://registry.npmjs.org/buffer/-/buffer-5.7.1.tgz;downloadfilename=
=3Dnpm2/buffer-5.7.1.tgz;sha512sum=3D10773220f050e0148696f8c1d7a9392a0009db=
b088b0763fd8906609145ea38f32f6b43731a533597dca56505ae14eccc97d361dd563d0aec=
2dd6681de3bbb15;subdir=3Dnpm/node_modules/buffer;striplevel=3D1 \
+    https://registry.npmjs.org/busboy/-/busboy-0.2.14.tgz;downloadfilename=
=3Dnpm2/busboy-0.2.14.tgz;sha1sum=3D6c2a622efcf47c57bbbe1e2a9c37ad36c792545=
3;subdir=3Dnpm/node_modules/busboy;striplevel=3D1 \
+    https://registry.npmjs.org/bytes/-/bytes-3.1.0.tgz;downloadfilename=3D=
npm2/bytes-3.1.0.tgz;sha512sum=3Dcdab8b8eb7c21bec6fa326aa2e857c6cb5575cd182=
e09aa5c450aeb520d603a7c9ad3a3666ebcb613a99eda1c12d948c3a8a5bcf0bfc7fec19715=
cdf5532360e;subdir=3Dnpm/node_modules/bytes;striplevel=3D1 \
+    https://registry.npmjs.org/cacheable-lookup/-/cacheable-lookup-5.0.4.t=
gz;downloadfilename=3Dnpm2/cacheable-lookup-5.0.4.tgz;sha512sum=3Ddbf90db1c=
3e1a5cc6b3a280c6736e2585eddcfc8a585bfe72075371326625d65e97aafdabbca89f1585d=
7ed324b72de7ec68fa1c819a9501bca2204d07700980;subdir=3Dnpm/node_modules/cach=
eable-lookup;striplevel=3D1 \
+    https://registry.npmjs.org/cacheable-request/-/cacheable-request-7.0.2=
.tgz;downloadfilename=3Dnpm2/cacheable-request-7.0.2.tgz;sha512sum=3Da68b96=
f3f16688f41bb86a645d0f4100fbff328e710c600d812357cd3cc9f03aca1ae5ceb2c338c08=
4118df6a735187762ee5c7d83ef728aea6e183628826d7b;subdir=3Dnpm/node_modules/c=
acheable-request;striplevel=3D1 \
+    https://registry.npmjs.org/cheerio-select/-/cheerio-select-1.5.0.tgz;d=
ownloadfilename=3Dnpm2/cheerio-select-1.5.0.tgz;sha512sum=3Daa871a1cfbf9ca9=
79f87a60dc6f9db001334eca3311316ed6dfb89a0889ede26575f5111c18989708891aebf47=
d39b9c40fd64dbc75abfcae974382341df1dae;subdir=3Dnpm/node_modules/cheerio-se=
lect;striplevel=3D1 \
+    https://registry.npmjs.org/cheerio/-/cheerio-1.0.0-rc.10.tgz;downloadf=
ilename=3Dnpm2/cheerio-1.0.0-rc.10.tgz;sha512sum=3D834274abf3ba996f33e73c50=
dc0f04f09d61520a7848c3af1285bfc7ce0ec321ca7bf65c733f373d54f8cb90ab72be77d05=
57a36098a235aaf19329597d5d757;subdir=3Dnpm/node_modules/cheerio;striplevel=
=3D1 \
+    https://registry.npmjs.org/chownr/-/chownr-2.0.0.tgz;downloadfilename=
=3Dnpm2/chownr-2.0.0.tgz;sha512sum=3D6c8a26b43179286a5da2090b77d56ca6f17393=
d29fa72c86952f18155665ed318f0472f9b2720e9f17ac8705603ed790f5be04c9d97ea556c=
8c84d4372f09681;subdir=3Dnpm/node_modules/chownr;striplevel=3D1 \
+    https://registry.npmjs.org/cli-table/-/cli-table-0.3.9.tgz;downloadfil=
ename=3Dnpm2/cli-table-0.3.9.tgz;sha512sum=3Dede03a845b40670571ddd5801a8681=
a93af35a4a398d15052a91d3eb8647909a5a037cb9c1fe4d94b8e0baa4d19aac9c6ad2598b0=
7ed383618c8634b6d0eccb8;subdir=3Dnpm/node_modules/cli-table;striplevel=3D1 =
\
+    https://registry.npmjs.org/clone-response/-/clone-response-1.0.2.tgz;d=
ownloadfilename=3Dnpm2/clone-response-1.0.2.tgz;sha1sum=3Dd1dc973920314df67=
fbeb94223b4ee350239e96b;subdir=3Dnpm/node_modules/clone-response;striplevel=
=3D1 \
+    https://registry.npmjs.org/clone/-/clone-2.1.2.tgz;downloadfilename=3D=
npm2/clone-2.1.2.tgz;sha1sum=3D1b7f4b9f591f1e8f83670401600345a02887435f;sub=
dir=3Dnpm/node_modules/clone;striplevel=3D1 \
+    https://registry.npmjs.org/color-support/-/color-support-1.1.3.tgz;dow=
nloadfilename=3Dnpm2/color-support-1.1.3.tgz;sha512sum=3Daa20639296cc2cefc7=
2faf32fa5878ab4fced4c6458f6457e97fca98c6b7fa0243df3f96c08d59cc31f2b2fa87192=
de63fa9b39cf724a579b0d6723d7098f246;subdir=3Dnpm/node_modules/color-support=
;striplevel=3D1 \
+    https://registry.npmjs.org/colors/-/colors-1.0.3.tgz;downloadfilename=
=3Dnpm2/colors-1.0.3.tgz;sha1sum=3D0433f44d809680fdeb60ed260f1b0c262e82a40b=
;subdir=3Dnpm/node_modules/colors;striplevel=3D1 \
+    https://registry.npmjs.org/combined-stream/-/combined-stream-1.0.8.tgz=
;downloadfilename=3Dnpm2/combined-stream-1.0.8.tgz;sha512sum=3D1503783117ee=
25e1dfedc05b04c2455e12920eafb690002b06599106f72f144e410751d9297b5214048385d=
973f73398c3187c943767be630e7bffb971da0476;subdir=3Dnpm/node_modules/combine=
d-stream;striplevel=3D1 \
+    https://registry.npmjs.org/commist/-/commist-1.1.0.tgz;downloadfilenam=
e=3Dnpm2/commist-1.1.0.tgz;sha512sum=3Daeb682f0d5d63848e10036d97bd4013732c0=
3794377ec4cf42d055f9f1158fac4a2200e036211513a64d7c7a593aa7d0db5614cdf54d517=
2ce119aae62f40f3e;subdir=3Dnpm/node_modules/commist;striplevel=3D1 \
+    https://registry.npmjs.org/concat-map/-/concat-map-0.0.1.tgz;downloadf=
ilename=3Dnpm2/concat-map-0.0.1.tgz;sha1sum=3Dd8a96bd77fd68df7793a73036a3ba=
0d5405d477b;subdir=3Dnpm/node_modules/concat-map;striplevel=3D1 \
+    https://registry.npmjs.org/concat-stream/-/concat-stream-1.6.2.tgz;dow=
nloadfilename=3Dnpm2/concat-stream-1.6.2.tgz;sha512sum=3Ddbb1c18212718e266d=
224dd872f9ffe246c993fd6e66e2457ee3c49ece8b684be9bc6d5fd214de6bc96296ba2eca8=
f6655cd8659d70467c38ba0699200396b0b;subdir=3Dnpm/node_modules/multer/node_m=
odules/concat-stream;striplevel=3D1 \
+    https://registry.npmjs.org/concat-stream/-/concat-stream-2.0.0.tgz;dow=
nloadfilename=3Dnpm2/concat-stream-2.0.0.tgz;sha512sum=3D316b9f61d170e7771c=
1a3080f8e97b5c96290255bafe9ad2333b8f393467246706cee84b9f849caf3eea7faa3c6d1=
399e75e25b5acdc2052597af71f6e8d31ec;subdir=3Dnpm/node_modules/concat-stream=
;striplevel=3D1 \
+    https://registry.npmjs.org/console-control-strings/-/console-control-s=
trings-1.1.0.tgz;downloadfilename=3Dnpm2/console-control-strings-1.1.0.tgz;=
sha1sum=3D3d7cf4464db6446ea644bf4b39507f9851008e8e;subdir=3Dnpm/node_module=
s/console-control-strings;striplevel=3D1 \
+    https://registry.npmjs.org/content-disposition/-/content-disposition-0=
.5.3.tgz;downloadfilename=3Dnpm2/content-disposition-0.5.3.tgz;sha512sum=3D=
1313b4efbe2290439b200115f640e8e74a3eefd54251d101ea7ea5cca806c2ea5c55e46586b=
8f7a8601fc2af06eae0498e4a8bae14f4a846057169e0f33d73d2;subdir=3Dnpm/node_mod=
ules/content-disposition;striplevel=3D1 \
+    https://registry.npmjs.org/content-type/-/content-type-1.0.4.tgz;downl=
oadfilename=3Dnpm2/content-type-1.0.4.tgz;sha512sum=3D8483f71043ecf2d07d013=
d4bf8d52ab70380a6ce269366686fcf4c5973078c75a0f668a517f8f8a2c9e740b5c1081141=
93fb6f206fed51cf663942623c184f5c;subdir=3Dnpm/node_modules/content-type;str=
iplevel=3D1 \
+    https://registry.npmjs.org/cookie-parser/-/cookie-parser-1.4.5.tgz;dow=
nloadfilename=3Dnpm2/cookie-parser-1.4.5.tgz;sha512sum=3D7f5ddb3d48ff806ff9=
983afec4b992c710ec07d0d089321f8494bfb2a8eb99f01688037ec763b88bf5e0b932fdc83=
67efc81436a727ee71ee10b80974fd4ddcf;subdir=3Dnpm/node_modules/cookie-parser=
;striplevel=3D1 \
+    https://registry.npmjs.org/cookie-signature/-/cookie-signature-1.0.6.t=
gz;downloadfilename=3Dnpm2/cookie-signature-1.0.6.tgz;sha1sum=3De303a882b34=
2cc3ee8ca513a79999734dab3ae2c;subdir=3Dnpm/node_modules/cookie-signature;st=
riplevel=3D1 \
+    https://registry.npmjs.org/cookie/-/cookie-0.4.0.tgz;downloadfilename=
=3Dnpm2/cookie-0.4.0.tgz;sha512sum=3Df87a7c7cba79ef09d44add2d634b47117878be=
86510e7a08ad93ea968dc33e2238cbd97083f8eac7ed4e9bde3f5ba65a3c33946e78ceb7ff7=
dc3aeb393e9755e;subdir=3Dnpm/node_modules/cookie-parser/node_modules/cookie=
;striplevel=3D1 \
+    https://registry.npmjs.org/cookie/-/cookie-0.4.0.tgz;downloadfilename=
=3Dnpm2/cookie-0.4.0.tgz;sha512sum=3Df87a7c7cba79ef09d44add2d634b47117878be=
86510e7a08ad93ea968dc33e2238cbd97083f8eac7ed4e9bde3f5ba65a3c33946e78ceb7ff7=
dc3aeb393e9755e;subdir=3Dnpm/node_modules/express/node_modules/cookie;strip=
level=3D1 \
+    https://registry.npmjs.org/cookie/-/cookie-0.4.1.tgz;downloadfilename=
=3Dnpm2/cookie-0.4.1.tgz;sha512sum=3D670ac5906271511dc42285ed3bec9513af446f=
b2a58b16da78059f05007dbd5b0d9ffa3e630ebd8015924832bcdb985035d37ec05f3310b7f=
7745365fe4c6450;subdir=3Dnpm/node_modules/cookie;striplevel=3D1 \
+    https://registry.npmjs.org/core-util-is/-/core-util-is-1.0.3.tgz;downl=
oadfilename=3Dnpm2/core-util-is-1.0.3.tgz;sha512sum=3D65006f8b50dca49e060ea=
6a78ee719d878f7c043b9a590d2f3d0566e472bbddc64b09a2bc140c365a997f65745929f5a=
c369660432e090e6c40380d6349f4561;subdir=3Dnpm/node_modules/core-util-is;str=
iplevel=3D1 \
+    https://registry.npmjs.org/cors/-/cors-2.8.5.tgz;downloadfilename=3Dnp=
m2/cors-2.8.5.tgz;sha512sum=3D2881db2c9aaeef7446aff8676eb3bdb817a2c4d1aebd2=
423ba5fe3745bd2fca152207d615957759e0ef3387c7e62b11f2272c6eeae27e861d0f5c0ed=
c6ffcfea;subdir=3Dnpm/node_modules/cors;striplevel=3D1 \
+    https://registry.npmjs.org/cronosjs/-/cronosjs-1.7.1.tgz;downloadfilen=
ame=3Dnpm2/cronosjs-1.7.1.tgz;sha512sum=3D77a4baf9ea7b749c6c006f0e41009d2ae=
07223f4bf015eb877d385e66b6673290ec8fbbdd9c0240271774db73db39a0e68b401618426=
4cdbe3a984643c9feee5;subdir=3Dnpm/node_modules/cronosjs;striplevel=3D1 \
+    https://registry.npmjs.org/css-select/-/css-select-4.1.3.tgz;downloadf=
ilename=3Dnpm2/css-select-4.1.3.tgz;sha512sum=3D813df004d77d363e3dac06e6b45=
1e3d5c96320038b6125f59d9f0207b4c13b720d61c932826e41ecb21253fb3363ffd899d892=
2db26f0cb3b1f559cc569301c4;subdir=3Dnpm/node_modules/css-select;striplevel=
=3D1 \
+    https://registry.npmjs.org/css-what/-/css-what-5.1.0.tgz;downloadfilen=
ame=3Dnpm2/css-what-5.1.0.tgz;sha512sum=3D6ab48c456208158d2157ca48c593047e6=
308e3b5a3dd1fda5a96430f159808f12238cbfab5f3ab9e90ed8310583c4403e15d18ffde7c=
fb54dd0b78964c57143f;subdir=3Dnpm/node_modules/css-what;striplevel=3D1 \
+    https://registry.npmjs.org/debug/-/debug-2.6.9.tgz;downloadfilename=3D=
npm2/debug-2.6.9.tgz;sha512sum=3D6c2ec496b7496899cf6c03fed44a2d62fa99b1bdde=
725e708ba05f8ba0494d470da30a7a72fb298348d7ce74532838e6fc4ec076014155e00f54c=
35c286b0730;subdir=3Dnpm/node_modules/debug;striplevel=3D1 \
+    https://registry.npmjs.org/debug/-/debug-4.3.2.tgz;downloadfilename=3D=
npm2/debug-4.3.2.tgz;sha512sum=3D98ea7cc0a72f8fb5f10bbf332e0c3f640fba4d2824=
a04d82fe27a7b618510f6f7c4fb50dc0083d7620692d1c42d2639eccb978074c55eccd1c08e=
e8ffced1787;subdir=3Dnpm/node_modules/agent-base/node_modules/debug;striple=
vel=3D1 \
+    https://registry.npmjs.org/debug/-/debug-4.3.2.tgz;downloadfilename=3D=
npm2/debug-4.3.2.tgz;sha512sum=3D98ea7cc0a72f8fb5f10bbf332e0c3f640fba4d2824=
a04d82fe27a7b618510f6f7c4fb50dc0083d7620692d1c42d2639eccb978074c55eccd1c08e=
e8ffced1787;subdir=3Dnpm/node_modules/https-proxy-agent/node_modules/debug;=
striplevel=3D1 \
+    https://registry.npmjs.org/debug/-/debug-4.3.2.tgz;downloadfilename=3D=
npm2/debug-4.3.2.tgz;sha512sum=3D98ea7cc0a72f8fb5f10bbf332e0c3f640fba4d2824=
a04d82fe27a7b618510f6f7c4fb50dc0083d7620692d1c42d2639eccb978074c55eccd1c08e=
e8ffced1787;subdir=3Dnpm/node_modules/memorystore/node_modules/debug;stripl=
evel=3D1 \
+    https://registry.npmjs.org/debug/-/debug-4.3.2.tgz;downloadfilename=3D=
npm2/debug-4.3.2.tgz;sha512sum=3D98ea7cc0a72f8fb5f10bbf332e0c3f640fba4d2824=
a04d82fe27a7b618510f6f7c4fb50dc0083d7620692d1c42d2639eccb978074c55eccd1c08e=
e8ffced1787;subdir=3Dnpm/node_modules/mqtt-packet/node_modules/debug;stripl=
evel=3D1 \
+    https://registry.npmjs.org/debug/-/debug-4.3.2.tgz;downloadfilename=3D=
npm2/debug-4.3.2.tgz;sha512sum=3D98ea7cc0a72f8fb5f10bbf332e0c3f640fba4d2824=
a04d82fe27a7b618510f6f7c4fb50dc0083d7620692d1c42d2639eccb978074c55eccd1c08e=
e8ffced1787;subdir=3Dnpm/node_modules/mqtt/node_modules/debug;striplevel=3D=
1 \
+    https://registry.npmjs.org/decompress-response/-/decompress-response-6=
.0.0.tgz;downloadfilename=3Dnpm2/decompress-response-6.0.0.tgz;sha512sum=3D=
696df9c9933a05bff8a099599dc307d8b0a866d2574d1c444b5eef137868462a305369161da=
24a1644810e70d1f9c9bd27ef5085799113221fbf4a638bd7a309;subdir=3Dnpm/node_mod=
ules/decompress-response;striplevel=3D1 \
+    https://registry.npmjs.org/defer-to-connect/-/defer-to-connect-2.0.1.t=
gz;downloadfilename=3Dnpm2/defer-to-connect-2.0.1.tgz;sha512sum=3De2dbedb5e=
a571b555a606ad189b93913025dd6de2e76e9d239531d2d200bea621dd62c78dfca0fc0f64c=
00b638d450a28ee90ed4bd2dc0d706b1dcd2edd1e00e;subdir=3Dnpm/node_modules/defe=
r-to-connect;striplevel=3D1 \
+    https://registry.npmjs.org/delayed-stream/-/delayed-stream-1.0.0.tgz;d=
ownloadfilename=3Dnpm2/delayed-stream-1.0.0.tgz;sha1sum=3Ddf3ae199acadfb7d4=
40aaae0b29e2272b24ec619;subdir=3Dnpm/node_modules/delayed-stream;striplevel=
=3D1 \
+    https://registry.npmjs.org/delegates/-/delegates-1.0.0.tgz;downloadfil=
ename=3Dnpm2/delegates-1.0.0.tgz;sha1sum=3D84c6e159b81904fdca59a0ef44cd870d=
31250f9a;subdir=3Dnpm/node_modules/delegates;striplevel=3D1 \
+    https://registry.npmjs.org/denque/-/denque-2.0.1.tgz;downloadfilename=
=3Dnpm2/denque-2.0.1.tgz;sha512sum=3Db5f89673a0502d734ba4d891e6219dd0e72edc=
fdd5a717f3162aae6cb80c7e17cec3d5b2be0241778e820a5367f64dea7db8ef4ffff471fec=
0958457fceb2531;subdir=3Dnpm/node_modules/denque;striplevel=3D1 \
+    https://registry.npmjs.org/depd/-/depd-1.1.2.tgz;downloadfilename=3Dnp=
m2/depd-1.1.2.tgz;sha1sum=3D9bcd52e14c097763e749b274c4346ed2e560b5a9;subdir=
=3Dnpm/node_modules/depd;striplevel=3D1 \
+    https://registry.npmjs.org/depd/-/depd-2.0.0.tgz;downloadfilename=3Dnp=
m2/depd-2.0.0.tgz;sha512sum=3D83b9c7e8fe9dc838a8268800006a6b1a90ad548989869=
3e4feba02cdd6f77c887ad7fb3f9cfb1f47aa27c8cc2408047f3a50b7c810b49444af528404=
02cb08af;subdir=3Dnpm/node_modules/express-session/node_modules/depd;stripl=
evel=3D1 \
+    https://registry.npmjs.org/destroy/-/destroy-1.0.4.tgz;downloadfilenam=
e=3Dnpm2/destroy-1.0.4.tgz;sha1sum=3D978857442c44749e4206613e37946205826abd=
80;subdir=3Dnpm/node_modules/destroy;striplevel=3D1 \
+    https://registry.npmjs.org/detect-libc/-/detect-libc-1.0.3.tgz;downloa=
dfilename=3Dnpm2/detect-libc-1.0.3.tgz;sha1sum=3Dfa137c4bd698edf55cd5cd02ac=
559f91a4c4ba9b;subdir=3Dnpm/node_modules/detect-libc;striplevel=3D1 \
+    https://registry.npmjs.org/dicer/-/dicer-0.2.5.tgz;downloadfilename=3D=
npm2/dicer-0.2.5.tgz;sha1sum=3D5996c086bb33218c812c090bddc09cd12facb70f;sub=
dir=3Dnpm/node_modules/dicer;striplevel=3D1 \
+    https://registry.npmjs.org/dom-serializer/-/dom-serializer-1.3.2.tgz;d=
ownloadfilename=3Dnpm2/dom-serializer-1.3.2.tgz;sha512sum=3De5ce78064e43c38=
a80c4d388d691448b33d28d5b31e7e6e924a98bda43e7f0984152adaad3db5309ade68e28ee=
9f635f2bbf0d328b8360d30190eacf6624be8a;subdir=3Dnpm/node_modules/dom-serial=
izer;striplevel=3D1 \
+    https://registry.npmjs.org/domelementtype/-/domelementtype-2.2.0.tgz;d=
ownloadfilename=3Dnpm2/domelementtype-2.2.0.tgz;sha512sum=3D0ed04ca3cda9bf5=
745b54987cabe3c6de8aeabbf764b1a21afef079bdce8c649583df6ba9f46770728e3d8857b=
6e6af6232a82967a844217e01c9279405d11e4;subdir=3Dnpm/node_modules/domelement=
type;striplevel=3D1 \
+    https://registry.npmjs.org/domhandler/-/domhandler-4.2.2.tgz;downloadf=
ilename=3Dnpm2/domhandler-4.2.2.tgz;sha512sum=3D3f313d68132c7593bc4cae019ee=
2701f4413e35c2031b473b99ac751ca589dc1239906b3abc4046815a02c6ed9c82fc3019284=
820969200ea3e109ff1e6c52df;subdir=3Dnpm/node_modules/domhandler;striplevel=
=3D1 \
+    https://registry.npmjs.org/domutils/-/domutils-2.8.0.tgz;downloadfilen=
ame=3Dnpm2/domutils-2.8.0.tgz;sha512sum=3Dc3de828e87e9ef63392088698e0a1b062=
99811fa0f8f1d55c740525fd3f7d1605d656d9620a5344f505dd24cf678d67d8a48ca8076c4=
c8ac7c041e87d4bde1dc;subdir=3Dnpm/node_modules/domutils;striplevel=3D1 \
+    https://registry.npmjs.org/duplexify/-/duplexify-4.1.2.tgz;downloadfil=
ename=3Dnpm2/duplexify-4.1.2.tgz;sha512sum=3D7f3dce8dc3421e644fd76309a1930f=
825c7c9b8aeb14ff2ba2f9e4e2f4fc16cf9aa276680b01a0d74752b10b1f3ff13ad9e65c3d3=
31230febaf3a7eef5096ab7;subdir=3Dnpm/node_modules/duplexify;striplevel=3D1 =
\
+    https://registry.npmjs.org/ee-first/-/ee-first-1.1.1.tgz;downloadfilen=
ame=3Dnpm2/ee-first-1.1.1.tgz;sha1sum=3D590c61156b0ae2f4f0255732a158b266bc5=
6b21d;subdir=3Dnpm/node_modules/ee-first;striplevel=3D1 \
+    https://registry.npmjs.org/emoji-regex/-/emoji-regex-8.0.0.tgz;downloa=
dfilename=3Dnpm2/emoji-regex-8.0.0.tgz;sha512sum=3D3128d8cdc58d380d1ec001e9=
cf4331a5816fc20eb28f2d4d1b7c6d7a8ab3eb8e150a8fd13e09ebd7f186b7e89cde2253cd0=
f04bb74dd335e126b09d5526184e8;subdir=3Dnpm/node_modules/emoji-regex;striple=
vel=3D1 \
+    https://registry.npmjs.org/encodeurl/-/encodeurl-1.0.2.tgz;downloadfil=
ename=3Dnpm2/encodeurl-1.0.2.tgz;sha1sum=3Dad3ff4c86ec2d029322f5a02c3a9a606=
c95b3f59;subdir=3Dnpm/node_modules/encodeurl;striplevel=3D1 \
+    https://registry.npmjs.org/end-of-stream/-/end-of-stream-1.4.4.tgz;dow=
nloadfilename=3Dnpm2/end-of-stream-1.4.4.tgz;sha512sum=3Dfaec358a720754f428=
695b87cd1c97776d6270cf9c9ede02cc3e6b5be342d708ce5124ceb3e4deec53afec084deef=
4bdc7fa08ca12cfe4f4751fea614001eee5;subdir=3Dnpm/node_modules/end-of-stream=
;striplevel=3D1 \
+    https://registry.npmjs.org/enquirer/-/enquirer-2.3.6.tgz;downloadfilen=
ame=3Dnpm2/enquirer-2.3.6.tgz;sha512sum=3Dca33673ebdf5e7f1634b8cc8b14c5882e=
6143cfd9ed4d2b877b13b64e2e2c9809c6c50624ccc880fedb0be6db0ebea59fe874c03b711=
92386c3db96dc013ab2e;subdir=3Dnpm/node_modules/enquirer;striplevel=3D1 \
+    https://registry.npmjs.org/entities/-/entities-2.2.0.tgz;downloadfilen=
ame=3Dnpm2/entities-2.2.0.tgz;sha512sum=3Da7dda27f9373eb5f48d30f9a909acb647=
d0c5f43dbe435f7f573b0413b5749d41039a607d374b5b88429e2684e66d017af1ab85623ba=
ed84e22c1a36eb7f28f4;subdir=3Dnpm/node_modules/entities;striplevel=3D1 \
+    https://registry.npmjs.org/escape-html/-/escape-html-1.0.3.tgz;downloa=
dfilename=3Dnpm2/escape-html-1.0.3.tgz;sha1sum=3D0258eae4d3d0c0974de1c16918=
8ef0051d1d1988;subdir=3Dnpm/node_modules/escape-html;striplevel=3D1 \
+    https://registry.npmjs.org/esprima/-/esprima-4.0.1.tgz;downloadfilenam=
e=3Dnpm2/esprima-4.0.1.tgz;sha512sum=3D786b85170ed4a5d6be838a7e407be75b4472=
4d7fd255e2410ccfe00ad30044ed1c2ee4f61dc10a9d33ef86357a6867aaac207fb1b368a74=
2acce6d23b1a594e0;subdir=3Dnpm/node_modules/esprima;striplevel=3D1 \
+    https://registry.npmjs.org/etag/-/etag-1.8.1.tgz;downloadfilename=3Dnp=
m2/etag-1.8.1.tgz;sha1sum=3D41ae2eeb65efa62268aebfea83ac7d79299b0887;subdir=
=3Dnpm/node_modules/etag;striplevel=3D1 \
+    https://registry.npmjs.org/express-session/-/express-session-1.17.2.tg=
z;downloadfilename=3Dnpm2/express-session-1.17.2.tgz;sha512sum=3D98f71870b0=
3496f87b0f83aaaf968d24532d04c28f2e5fbe38a2b1907cd9d14d280ead6ba4a067911e5fe=
6f087476e95780ae54ce105f6d778c7922320292c45;subdir=3Dnpm/node_modules/expre=
ss-session;striplevel=3D1 \
+    https://registry.npmjs.org/express/-/express-4.17.1.tgz;downloadfilena=
me=3Dnpm2/express-4.17.1.tgz;sha512sum=3D98727d3bbf51aa5ba9851adcc365ff1938=
7793db55bfc61ca326382a487858331460a45952ad21d68d30dabaebc41a8ced5a1e515aa06=
f6ef19443174e762de2;subdir=3Dnpm/node_modules/express;striplevel=3D1 \
+    https://registry.npmjs.org/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz=
;downloadfilename=3Dnpm2/fast-deep-equal-3.1.3.tgz;sha512sum=3D7f7a90f68432=
f63d808417bf1fd542f75c0b98a042094fe00ce9ca340606e61b303bb04b2a3d3d1dce4760d=
cfd70623efb19690c22200da8ad56cd3701347ce1;subdir=3Dnpm/node_modules/fast-de=
ep-equal;striplevel=3D1 \
+    https://registry.npmjs.org/finalhandler/-/finalhandler-1.1.2.tgz;downl=
oadfilename=3Dnpm2/finalhandler-1.1.2.tgz;sha512sum=3D68059c5b9eeec5536b419=
a855e3213a56dec2144261c61b7a926fd9946a1f4c80c0b835e5a134e94d8d7118ab71e3440=
bcbe9aad4be2646189b0183acf4cec58;subdir=3Dnpm/node_modules/finalhandler;str=
iplevel=3D1 \
+    https://registry.npmjs.org/follow-redirects/-/follow-redirects-1.14.5.=
tgz;downloadfilename=3Dnpm2/follow-redirects-1.14.5.tgz;sha512sum=3Dc2da614=
97cbb778fce47e32f2056c25410f3679e76d2a57c5df3e495237942dc6e314259f9bd169ecb=
757b59420e871fcee0a41ea8fc93416966a3be50868a34;subdir=3Dnpm/node_modules/fo=
llow-redirects;striplevel=3D1 \
+    https://registry.npmjs.org/form-data/-/form-data-4.0.0.tgz;downloadfil=
ename=3Dnpm2/form-data-4.0.0.tgz;sha512sum=3D1131249521a2e6dd10319ba25e803f=
43abdc9f170b40fe6f76e812a6e0328ba4951a2d9c94f3e9fb180486e31a1c2fb31a09f7d4a=
776df95b7e5fec7ca491ac3;subdir=3Dnpm/node_modules/form-data;striplevel=3D1 =
\
+    https://registry.npmjs.org/forwarded/-/forwarded-0.2.0.tgz;downloadfil=
ename=3Dnpm2/forwarded-0.2.0.tgz;sha512sum=3D6ee446d1fa41b511d24c238049eea1=
0f6e7cb44b9b16844b6f864d03a3713151cdc3680e7301e8f70c9a6e5ccccce039cfdc40f4b=
d4a36393f36de8c4fd698a3;subdir=3Dnpm/node_modules/forwarded;striplevel=3D1 =
\
+    https://registry.npmjs.org/fresh/-/fresh-0.5.2.tgz;downloadfilename=3D=
npm2/fresh-0.5.2.tgz;sha1sum=3D3d8cadd90d976569fa835ab1f8e4b23a105605a7;sub=
dir=3Dnpm/node_modules/fresh;striplevel=3D1 \
+    https://registry.npmjs.org/fs-extra/-/fs-extra-10.0.0.tgz;downloadfile=
name=3Dnpm2/fs-extra-10.0.0.tgz;sha512sum=3D0b9a306f5e2ef5e2708b328675c85c0=
d441e16d9521c7b61064f296d7f557353c566b2e899bb9d8c39cd9ecf3c698b250b217a218e=
52530dd1a33eb14a170421;subdir=3Dnpm/node_modules/fs-extra;striplevel=3D1 \
+    https://registry.npmjs.org/fs-minipass/-/fs-minipass-2.1.0.tgz;downloa=
dfilename=3Dnpm2/fs-minipass-2.1.0.tgz;sha512sum=3D57f26038b1424be47a55cab4=
b250ae69e58474d0b7a2e0e524c348b1a707d95b402e2bbd995e0b3eb1dce5c0e5f24e5ac3a=
27c8f08165a9893a39458866233be;subdir=3Dnpm/node_modules/fs-minipass;striple=
vel=3D1 \
+    https://registry.npmjs.org/fs.notify/-/fs.notify-0.0.4.tgz;downloadfil=
ename=3Dnpm2/fs.notify-0.0.4.tgz;sha1sum=3D63284d45a34b52ce60088a6ddbec5b77=
6d3c013d;subdir=3Dnpm/node_modules/fs.notify;striplevel=3D1 \
+    https://registry.npmjs.org/fs.realpath/-/fs.realpath-1.0.0.tgz;downloa=
dfilename=3Dnpm2/fs.realpath-1.0.0.tgz;sha1sum=3D1504ad2523158caa40db4a2787=
cb01411994ea4f;subdir=3Dnpm/node_modules/fs.realpath;striplevel=3D1 \
+    https://registry.npmjs.org/gauge/-/gauge-4.0.0.tgz;downloadfilename=3D=
npm2/gauge-4.0.0.tgz;sha512sum=3D17cb14e39c90a63423c4a926d5438085fd14fced1a=
16dfff165ee1b2b355b68fa96ad3078ecedd3c8f6614e19429b86b80a9b44b71235b7b1c305=
b909964913b;subdir=3Dnpm/node_modules/gauge;striplevel=3D1 \
+    https://registry.npmjs.org/get-stream/-/get-stream-5.2.0.tgz;downloadf=
ilename=3Dnpm2/get-stream-5.2.0.tgz;sha512sum=3D9c117e175ac06550aefe9eeb8f3=
800f986f895f617ae997b6ba56626b53cc05f48d422af3ff4303cd6479ce9706d3918e9dbed=
148cc5312c905db2e84d03d1a4;subdir=3Dnpm/node_modules/get-stream;striplevel=
=3D1 \
+    https://registry.npmjs.org/glob/-/glob-7.2.0.tgz;downloadfilename=3Dnp=
m2/glob-7.2.0.tgz;sha512sum=3D9662dfea0b72acfabcb538d29ab3bde3005e41b151dc7=
6cb1dbbb20faf70bb2424226a76856a8c181e3b397eb914190f7df3bae3520ff6359ad73e22=
bea1b6e9;subdir=3Dnpm/node_modules/glob;striplevel=3D1 \
+    https://registry.npmjs.org/got/-/got-11.8.2.tgz;downloadfilename=3Dnpm=
2/got-11.8.2.tgz;sha512sum=3D0f4432c0a8087b7d0e0ecf9f9bcc0c66201c663ca9702a=
1d3cdb8ccf91fd327cbb449f888c9d7405d9865bb38cedf1d73fe3bbafa6706a943f61098c4=
af07451;subdir=3Dnpm/node_modules/got;striplevel=3D1 \
+    https://registry.npmjs.org/graceful-fs/-/graceful-fs-4.2.8.tgz;downloa=
dfilename=3Dnpm2/graceful-fs-4.2.8.tgz;sha512sum=3Daa422294f51870d849a5ddf7=
9f41815d307530c3e9d784f112c12cd294ebb1256e700a6c6335b957e43c43186293a294dde=
bf2faa900028c13072ca62b46af76;subdir=3Dnpm/node_modules/graceful-fs;striple=
vel=3D1 \
+    https://registry.npmjs.org/has-unicode/-/has-unicode-2.0.1.tgz;downloa=
dfilename=3Dnpm2/has-unicode-2.0.1.tgz;sha1sum=3De0e6fe6a28cf51138855e086d1=
691e771de2a8b9;subdir=3Dnpm/node_modules/has-unicode;striplevel=3D1 \
+    https://registry.npmjs.org/hash-sum/-/hash-sum-2.0.0.tgz;downloadfilen=
ame=3Dnpm2/hash-sum-2.0.0.tgz;sha512sum=3D59d6536c00720fea477e5fe0f504ac048=
230cbc213f84b0f88a0ecd0a357fb348785d0cb14a759bb40501e58ef3bed1023f05ab1b312=
51af3060d0994ef86c96;subdir=3Dnpm/node_modules/hash-sum;striplevel=3D1 \
+    https://registry.npmjs.org/help-me/-/help-me-3.0.0.tgz;downloadfilenam=
e=3Dnpm2/help-me-3.0.0.tgz;sha512sum=3D871ef78c2961ca4f75d2c89d041ec44659e1=
32516c249201a9254c143c0f37ca36bfd9e6a792a02ead57cf505fd5f08c319ea63eb5f5e7d=
886d152f2fdf3ccb5;subdir=3Dnpm/node_modules/help-me;striplevel=3D1 \
+    https://registry.npmjs.org/hpagent/-/hpagent-0.1.2.tgz;downloadfilenam=
e=3Dnpm2/hpagent-0.1.2.tgz;sha512sum=3D78fa855c7b524160055d89a3f89b4e4c7afc=
e2236b208e3f41194000f3c4fb3aa72b2e31268ec87b5638902ec0741f8bc4bc524d3cc1300=
4ac11ccb4abc632bd;subdir=3Dnpm/node_modules/hpagent;striplevel=3D1 \
+    https://registry.npmjs.org/htmlparser2/-/htmlparser2-6.1.0.tgz;downloa=
dfilename=3Dnpm2/htmlparser2-6.1.0.tgz;sha512sum=3D832c8f93aae0a272c51031a8=
79181035a114bdd27892d4e699487f876b7bb3e33ca0fa483f180d00259afba112479ee45ec=
b70a8f882badd15f0d469730814ec;subdir=3Dnpm/node_modules/htmlparser2;striple=
vel=3D1 \
+    https://registry.npmjs.org/http-cache-semantics/-/http-cache-semantics=
-4.1.0.tgz;downloadfilename=3Dnpm2/http-cache-semantics-4.1.0.tgz;sha512sum=
=3D71aacf92571487b44e5912bb0afdbb44fb5d858854b1e95afee7b9fe32b38de815bd70ea=
33620b13d4360469fd259261d60f3b729e7ab2efc58104b37164bc71;subdir=3Dnpm/node_=
modules/http-cache-semantics;striplevel=3D1 \
+    https://registry.npmjs.org/http-errors/-/http-errors-1.7.2.tgz;downloa=
dfilename=3Dnpm2/http-errors-1.7.2.tgz;sha512sum=3Db94401b771ff7122157dc87a=
8b512e3cdcbf62c4523940574d57d9fb247b6637b3dea8c1cfa8bdfa2e338cd6a8a9ca05548=
e25409e69960eb74ef19f4520c246;subdir=3Dnpm/node_modules/http-errors;striple=
vel=3D1 \
+    https://registry.npmjs.org/http-errors/-/http-errors-1.7.3.tgz;downloa=
dfilename=3Dnpm2/http-errors-1.7.3.tgz;sha512sum=3D6534d7d0c5abb10d99021035=
71e8c0c032f2705b1dec8ee756d9e44f73a5d1aaa875a296fb4093643435b81bf9c21a6d0a7=
73c7bc1de45127146cd249a6fd07f;subdir=3Dnpm/node_modules/raw-body/node_modul=
es/http-errors;striplevel=3D1 \
+    https://registry.npmjs.org/http2-wrapper/-/http2-wrapper-1.0.3.tgz;dow=
nloadfilename=3Dnpm2/http2-wrapper-1.0.3.tgz;sha512sum=3D57edb7b0332bd765a7=
cfb893703789af73ba008c659ef4ff6e66800003ff5dd6b7e42f74a7de7df69d05d5e1d1fcd=
d4a20b592a1654088e3058c105769748cc6;subdir=3Dnpm/node_modules/http2-wrapper=
;striplevel=3D1 \
+    https://registry.npmjs.org/https-proxy-agent/-/https-proxy-agent-5.0.0=
.tgz;downloadfilename=3Dnpm2/https-proxy-agent-5.0.0.tgz;sha512sum=3D124626=
e4170a50689dbb1cd2b77129a64a3e3e2356344a5ae324a4f6f4c2eb00ec4095bdac749af94=
846349a11629edbcfa1edd5e69121ae90689a8ee6b0856c;subdir=3Dnpm/node_modules/h=
ttps-proxy-agent;striplevel=3D1 \
+    https://registry.npmjs.org/i18next/-/i18next-21.3.1.tgz;downloadfilena=
me=3Dnpm2/i18next-21.3.1.tgz;sha512sum=3D54494c9be2e8784ba15625709c3c35811d=
ec9d322d2bd349aa0a24f0f679594f3bd0c54ed71fb92846f32ceffa182d73bb8d9473712e1=
a3de7b0630630dc13d0;subdir=3Dnpm/node_modules/i18next;striplevel=3D1 \
+    https://registry.npmjs.org/iconv-lite/-/iconv-lite-0.4.24.tgz;download=
filename=3Dnpm2/iconv-lite-0.4.24.tgz;sha512sum=3Dbf73179d901cbe7cb09135046=
6898801cb657bb4575de79d391df5c3097b565ca85cee108bd6abbd27a73505a77b54dc4708=
422f51f02c8db56c4a9da63f3fac;subdir=3Dnpm/node_modules/body-parser/node_mod=
ules/iconv-lite;striplevel=3D1 \
+    https://registry.npmjs.org/iconv-lite/-/iconv-lite-0.4.24.tgz;download=
filename=3Dnpm2/iconv-lite-0.4.24.tgz;sha512sum=3Dbf73179d901cbe7cb09135046=
6898801cb657bb4575de79d391df5c3097b565ca85cee108bd6abbd27a73505a77b54dc4708=
422f51f02c8db56c4a9da63f3fac;subdir=3Dnpm/node_modules/raw-body/node_module=
s/iconv-lite;striplevel=3D1 \
+    https://registry.npmjs.org/iconv-lite/-/iconv-lite-0.6.3.tgz;downloadf=
ilename=3Dnpm2/iconv-lite-0.6.3.tgz;sha512sum=3De1f0a4efdc2c84c773329dab1f4=
eaa5ab244e22a25a8b842507f8e8ae22053ef91074fbde0d9432fcd5ab4eec65f9e6e50ab9e=
a34b711cdb6f13223a0fb59d33;subdir=3Dnpm/node_modules/iconv-lite;striplevel=
=3D1 \
+    https://registry.npmjs.org/ieee754/-/ieee754-1.2.1.tgz;downloadfilenam=
e=3Dnpm2/ieee754-1.2.1.tgz;sha512sum=3D75ccaa843bd7d42e3a95765c56a0a92be16d=
31141574830debf0dfe63b36ce8b94b2a1bb23ab05c62b480beeca60adbd29d5ce2c776ef73=
2f8b059e85509ea68;subdir=3Dnpm/node_modules/ieee754;striplevel=3D1 \
+    https://registry.npmjs.org/inflight/-/inflight-1.0.6.tgz;downloadfilen=
ame=3Dnpm2/inflight-1.0.6.tgz;sha1sum=3D49bd6331d7d02d0c09bc910a1075ba8165b=
56df9;subdir=3Dnpm/node_modules/inflight;striplevel=3D1 \
+    https://registry.npmjs.org/inherits/-/inherits-2.0.3.tgz;downloadfilen=
ame=3Dnpm2/inherits-2.0.3.tgz;sha1sum=3D633c2c83e3da42a502f52466022480f4208=
261de;subdir=3Dnpm/node_modules/inherits;striplevel=3D1 \
+    https://registry.npmjs.org/inherits/-/inherits-2.0.4.tgz;downloadfilen=
ame=3Dnpm2/inherits-2.0.4.tgz;sha512sum=3D93fbc6697e3f6256b75b3c8c0af4d0397=
61e207bea38ab67a8176ecd31e9ce9419cc0b2428c859d8af849c189233dcc64a820578ca57=
2b16b8758799210a9ec1;subdir=3Dnpm/node_modules/bl/node_modules/inherits;str=
iplevel=3D1 \
+    https://registry.npmjs.org/inherits/-/inherits-2.0.4.tgz;downloadfilen=
ame=3Dnpm2/inherits-2.0.4.tgz;sha512sum=3D93fbc6697e3f6256b75b3c8c0af4d0397=
61e207bea38ab67a8176ecd31e9ce9419cc0b2428c859d8af849c189233dcc64a820578ca57=
2b16b8758799210a9ec1;subdir=3Dnpm/node_modules/raw-body/node_modules/inheri=
ts;striplevel=3D1 \
+    https://registry.npmjs.org/ipaddr.js/-/ipaddr.js-1.9.1.tgz;downloadfil=
ename=3Dnpm2/ipaddr.js-1.9.1.tgz;sha512sum=3Dd0a23feb4ef1a31493a07ec68cdd45=
7d26cba14d3e6ed4e2723b1049642587f859ca437c2a998c7fbb98c0f5b747e6a467a47fc35=
f199574870585e26143cede;subdir=3Dnpm/node_modules/ipaddr.js;striplevel=3D1 =
\
+    https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code=
-point-3.0.0.tgz;downloadfilename=3Dnpm2/is-fullwidth-code-point-3.0.0.tgz;=
sha512sum=3Dcf29a6e7ebbeb02b125b20fda8d69e8d5dc316f84229c94a762cd868952e1c0=
f3744b8dbee74ae1a775d0871afd2193e298ec130096c59e2b851e83a115e9742;subdir=3D=
npm/node_modules/is-fullwidth-code-point;striplevel=3D1 \
+    https://registry.npmjs.org/is-utf8/-/is-utf8-0.2.1.tgz;downloadfilenam=
e=3Dnpm2/is-utf8-0.2.1.tgz;sha1sum=3D4b0da1442104d1b336340e80797e865cf39f7d=
72;subdir=3Dnpm/node_modules/is-utf8;striplevel=3D1 \
+    https://registry.npmjs.org/isarray/-/isarray-0.0.1.tgz;downloadfilenam=
e=3Dnpm2/isarray-0.0.1.tgz;sha1sum=3D8a18acfca9a8f4177e09abfc6038939b05d1ee=
df;subdir=3Dnpm/node_modules/isarray;striplevel=3D1 \
+    https://registry.npmjs.org/isarray/-/isarray-1.0.0.tgz;downloadfilenam=
e=3Dnpm2/isarray-1.0.0.tgz;sha1sum=3Dbb935d48582cba168c06834957a54a3e07124f=
11;subdir=3Dnpm/node_modules/multer/node_modules/isarray;striplevel=3D1 \
+    https://registry.npmjs.org/js-yaml/-/js-yaml-3.14.1.tgz;downloadfilena=
me=3Dnpm2/js-yaml-3.14.1.tgz;sha512sum=3Da24307ece5d727b62b37d3a4dff497ae7b=
b8897f723a4fb6e67a97e22992da7a6ebd36039a8fd0119a2ac199186880e4de356f04e4ce2=
0480485a2ceca7052f6;subdir=3Dnpm/node_modules/js-yaml;striplevel=3D1 \
+    https://registry.npmjs.org/json-buffer/-/json-buffer-3.0.1.tgz;downloa=
dfilename=3Dnpm2/json-buffer-3.0.1.tgz;sha512sum=3De1b57905f4769aa7d04c99be=
579b4f3dd7fe669ba1888bd3b8007983c91cad7399a534ff430c15456072c17d68cebea512e=
3dd6c7c70689966f46ea6236b1f49;subdir=3Dnpm/node_modules/json-buffer;striple=
vel=3D1 \
+    https://registry.npmjs.org/json-schema-traverse/-/json-schema-traverse=
-1.0.0.tgz;downloadfilename=3Dnpm2/json-schema-traverse-1.0.0.tgz;sha512sum=
=3D34cf3f3fd9f75e35e12199f594b86415a0024ce5114178d6855e0103f4673aff31be0aad=
aa9017f483b89914314b1d51968e2dab37aa6f4b0e96bb9a3b2dddba;subdir=3Dnpm/node_=
modules/json-schema-traverse;striplevel=3D1 \
+    https://registry.npmjs.org/json-stringify-safe/-/json-stringify-safe-5=
.0.1.tgz;downloadfilename=3Dnpm2/json-stringify-safe-5.0.1.tgz;sha1sum=3D12=
96a2d58fd45f19a0f6ce01d65701e2c735b6eb;subdir=3Dnpm/node_modules/json-strin=
gify-safe;striplevel=3D1 \
+    https://registry.npmjs.org/jsonata/-/jsonata-1.8.5.tgz;downloadfilenam=
e=3Dnpm2/jsonata-1.8.5.tgz;sha512sum=3D8a50f24c1920eaa84da0d56bf0f50fcf3e46=
62f44af9110a38ce4c74e1b31f6cba578caf3d131e812bdb64ba5b4ed234400833d3d40cedd=
ac38521d4970a7da4;subdir=3Dnpm/node_modules/jsonata;striplevel=3D1 \
+    https://registry.npmjs.org/jsonfile/-/jsonfile-6.1.0.tgz;downloadfilen=
ame=3Dnpm2/jsonfile-6.1.0.tgz;sha512sum=3De5d8277563ab8984a6e5c9d86893616a5=
2cd0ca3aa170c8307faebd44f59b067221af28fb3c476c5818269cb9fdf3e8ad58283cf5f36=
7ddf9f637727de932a5d;subdir=3Dnpm/node_modules/jsonfile;striplevel=3D1 \
+    https://registry.npmjs.org/keyv/-/keyv-4.0.4.tgz;downloadfilename=3Dnp=
m2/keyv-4.0.4.tgz;sha512sum=3Dbea3476c073c041b3193eed00582d6d18db5f6b59c0a5=
b2947a5927a81d8286e669ec4a8387f812f5a56ab4d830c255dbefb949f2e6b901973311ce8=
a9cf8622;subdir=3Dnpm/node_modules/keyv;striplevel=3D1 \
+    https://registry.npmjs.org/leven/-/leven-2.1.0.tgz;downloadfilename=3D=
npm2/leven-2.1.0.tgz;sha1sum=3Dc2e7a9f772094dee9d34202ae8acce4687875580;sub=
dir=3Dnpm/node_modules/leven;striplevel=3D1 \
+    https://registry.npmjs.org/lodash.clonedeep/-/lodash.clonedeep-4.5.0.t=
gz;downloadfilename=3Dnpm2/lodash.clonedeep-4.5.0.tgz;sha1sum=3De23f3f9c4f8=
fbdde872529c1071857a086e5ccef;subdir=3Dnpm/node_modules/lodash.clonedeep;st=
riplevel=3D1 \
+    https://registry.npmjs.org/lowercase-keys/-/lowercase-keys-2.0.0.tgz;d=
ownloadfilename=3Dnpm2/lowercase-keys-2.0.0.tgz;sha512sum=3Db6a357ad2efca0c=
384ef734cc4ae0430b42c428c167fc8caa281fd83bc4f6af453ef4e91e9b91027a0d8d937bb=
42e91a66cba5c5adf4c10edb934a66e1788798;subdir=3Dnpm/node_modules/lowercase-=
keys;striplevel=3D1 \
+    https://registry.npmjs.org/lru-cache/-/lru-cache-4.1.5.tgz;downloadfil=
ename=3Dnpm2/lru-cache-4.1.5.tgz;sha512sum=3Db166656c43f63ac1cd917acc979198=
93f8ca93bd0c06783a514e1823fa860d86e07fa61b3f812f9aa2126d70a826244ab3ed5b4a9=
147560431bc9d7b176962e6;subdir=3Dnpm/node_modules/lru-cache;striplevel=3D1 =
\
+    https://registry.npmjs.org/lru-cache/-/lru-cache-6.0.0.tgz;downloadfil=
ename=3Dnpm2/lru-cache-6.0.0.tgz;sha512sum=3D268e9d274e029928eece7c09492de9=
51e5a677f1f47df4e59175e0c198be7aad540a6a90c0287e78bb183980b063df758b615a878=
875044302c78a938466ec88;subdir=3Dnpm/node_modules/semver/node_modules/lru-c=
ache;striplevel=3D1 \
+    https://registry.npmjs.org/make-dir/-/make-dir-3.1.0.tgz;downloadfilen=
ame=3Dnpm2/make-dir-3.1.0.tgz;sha512sum=3D83715e3f6d0b3708402dbffa0b3e83778=
1769e0cded23cfbb5bceb0f6c0057ea3d15e3477b8acbfb22b699dd09fdf8927f5b1ad400e1=
5ea8b9fa857038cfde1b;subdir=3Dnpm/node_modules/make-dir;striplevel=3D1 \
+    https://registry.npmjs.org/media-typer/-/media-typer-0.3.0.tgz;downloa=
dfilename=3Dnpm2/media-typer-0.3.0.tgz;sha1sum=3D8710d7af0aa626f8fffa1ce001=
68545263255748;subdir=3Dnpm/node_modules/type-is/node_modules/media-typer;s=
triplevel=3D1 \
+    https://registry.npmjs.org/media-typer/-/media-typer-1.1.0.tgz;downloa=
dfilename=3Dnpm2/media-typer-1.1.0.tgz;sha512sum=3D6a2b27ac33f818d7b4e9470a=
1675796df30d3c1530e23b0b19a5b059f9c7defd361a706e5d7d8c0959f945bad6a348f7a5c=
cd48a561b96aedf43b370dade572b;subdir=3Dnpm/node_modules/media-typer;striple=
vel=3D1 \
+    https://registry.npmjs.org/memorystore/-/memorystore-1.6.6.tgz;downloa=
dfilename=3Dnpm2/memorystore-1.6.6.tgz;sha512sum=3D11b2e5d7183df839678d7919=
2bf78c5285b2859d48c5c58ca52b85caac80fd9e0136e1fb051f84d320b8d166cb659e86f0b=
c478946760cf86a57c0d1f3ef5441;subdir=3Dnpm/node_modules/memorystore;striple=
vel=3D1 \
+    https://registry.npmjs.org/merge-descriptors/-/merge-descriptors-1.0.1=
.tgz;downloadfilename=3Dnpm2/merge-descriptors-1.0.1.tgz;sha1sum=3Db00aaa55=
6dd8b44568150ec9d1b953f3f90cbb61;subdir=3Dnpm/node_modules/merge-descriptor=
s;striplevel=3D1 \
+    https://registry.npmjs.org/methods/-/methods-1.1.2.tgz;downloadfilenam=
e=3Dnpm2/methods-1.1.2.tgz;sha1sum=3D5529a4d67654134edcc5266656835b0f851afc=
ee;subdir=3Dnpm/node_modules/methods;striplevel=3D1 \
+    https://registry.npmjs.org/mime-db/-/mime-db-1.51.0.tgz;downloadfilena=
me=3Dnpm2/mime-db-1.51.0.tgz;sha512sum=3De72f00e7a8e0ed7550c7699bbf596ee3d3=
51e1da24467859613b4bf8a19f69adbbbaae294935e4c10905265e29911332345cff12d6034=
a48a2107c7717b50dea;subdir=3Dnpm/node_modules/mime-db;striplevel=3D1 \
+    https://registry.npmjs.org/mime-types/-/mime-types-2.1.34.tgz;download=
filename=3Dnpm2/mime-types-2.1.34.tgz;sha512sum=3De9c3faf765b0188b3d5d774e3=
b8fbe37eeea8eabf4aeac7156f2775473e1fd273d99565c40ff991a190a893bd631046bdad6=
c79093ff627ed8d27a5bdd906ce0;subdir=3Dnpm/node_modules/mime-types;stripleve=
l=3D1 \
+    https://registry.npmjs.org/mime/-/mime-1.6.0.tgz;downloadfilename=3Dnp=
m2/mime-1.6.0.tgz;sha512sum=3Dc74567f2ca48fb0b89d4ee92ee09db69083c3f187834d=
1dbeca4883661162a23c4e1128ea65be28e7f8d92662699180febc99cef48f611b793151b2b=
b306907a;subdir=3Dnpm/node_modules/send/node_modules/mime;striplevel=3D1 \
+    https://registry.npmjs.org/mime/-/mime-2.5.2.tgz;downloadfilename=3Dnp=
m2/mime-2.5.2.tgz;sha512sum=3Db6a921e3b17329e08f0f63d488f07aa646cccec09ab23=
c407c2eb6fd66a9e6aad459c6feb056ac5d40b923781833988133cbff4299f850ad31fa3d22=
1f214f0e;subdir=3Dnpm/node_modules/mime;striplevel=3D1 \
+    https://registry.npmjs.org/mimic-response/-/mimic-response-1.0.1.tgz;d=
ownloadfilename=3Dnpm2/mimic-response-1.0.1.tgz;sha512sum=3D8f911cb67907eda=
99f57fab91e09a86a5d60d901c5251ada3ad9b1d09a48aa4c6106123f9494a5d67329438e61=
55aaf03444cea161229a7759e102b4447c6ec5;subdir=3Dnpm/node_modules/mimic-resp=
onse;striplevel=3D1 \
+    https://registry.npmjs.org/mimic-response/-/mimic-response-3.1.0.tgz;d=
ownloadfilename=3Dnpm2/mimic-response-3.1.0.tgz;sha512sum=3Dcf4c9623ee050eb=
af0792f199ade048f91dd266932d79f8bd9ee96827dfe88ae5f5b36fa4f77e1345ab6f8c793=
45bd3ae1ce96af837fc2fd03cd04e33731cd19;subdir=3Dnpm/node_modules/decompress=
-response/node_modules/mimic-response;striplevel=3D1 \
+    https://registry.npmjs.org/minimatch/-/minimatch-3.0.4.tgz;downloadfil=
ename=3Dnpm2/minimatch-3.0.4.tgz;sha512sum=3Dc891d5404872a8f2d44e0b7d07cdcf=
5eee96debc7832fbc7bd252f4e8a20a70a060ce510fb20eb4741d1a2dfb23827423bbbb8857=
de959fb7a91604172a87450;subdir=3Dnpm/node_modules/minimatch;striplevel=3D1 =
\
+    https://registry.npmjs.org/minimist/-/minimist-1.2.5.tgz;downloadfilen=
ame=3Dnpm2/minimist-1.2.5.tgz;sha512sum=3D14cf6735462b4410042d9413df179943b=
7e630e060ea758d989293720b0979a2ecb4ffd43835691acaf93a15e185783a7feaad27cba2=
67e3d4c640d67202172f;subdir=3Dnpm/node_modules/minimist;striplevel=3D1 \
+    https://registry.npmjs.org/minipass/-/minipass-3.1.5.tgz;downloadfilen=
ame=3Dnpm2/minipass-3.1.5.tgz;sha512sum=3Dfbc373c43f365d0a0d28dae5d5dfc54a2=
f97f30004591fac6d801f22fb9be0dcf4776da99451bbd8211555ab9f57c3cd7f8a92b25153=
0fc54c3b13558470a34f;subdir=3Dnpm/node_modules/minipass;striplevel=3D1 \
+    https://registry.npmjs.org/minizlib/-/minizlib-2.1.2.tgz;downloadfilen=
ame=3Dnpm2/minizlib-2.1.2.tgz;sha512sum=3D6c0c6c47c0557e3eb40d65c7137bb7d28=
1f37e5e06ee48644ae3d6faabe977b8c54479bb74bc4e8d493510700227f8712d8f29846274=
621607668ee38a5ed076;subdir=3Dnpm/node_modules/minizlib;striplevel=3D1 \
+    https://registry.npmjs.org/mkdirp/-/mkdirp-0.5.5.tgz;downloadfilename=
=3Dnpm2/mkdirp-0.5.5.tgz;sha512sum=3D34a98094449fea3306ca6d7ef91d116bbc2f85=
5fb0156eb715a48e14fc116a1bde6b480c51c19485578083fd010b4c22bfd8a1e4d60f0755a=
7d54108d7f2fec5;subdir=3Dnpm/node_modules/mkdirp;striplevel=3D1 \
+    https://registry.npmjs.org/mkdirp/-/mkdirp-1.0.4.tgz;downloadfilename=
=3Dnpm2/mkdirp-1.0.4.tgz;sha512sum=3Dbd5a95650c9fdd62f1d9285dd2a27dc6ebea80=
0c8a3cb022a884c4b6a5b4a08523ce8dcf78f0dde9f5bd885cf7d1e7fb62ca7fa225aa6e1b3=
3786596d93e86cf;subdir=3Dnpm/node_modules/tar/node_modules/mkdirp;stripleve=
l=3D1 \
+    https://registry.npmjs.org/moment-timezone/-/moment-timezone-0.5.33.tg=
z;downloadfilename=3Dnpm2/moment-timezone-0.5.33.tgz;sha512sum=3D3d3736bdc4=
fc2bd279ffdac310f7b97334882a02e81ac1fc50da40e2a653570d1577f533d7d81e13d69b6=
c839029a01015c9d0defe58117adb49ce41a6c847fb;subdir=3Dnpm/node_modules/momen=
t-timezone;striplevel=3D1 \
+    https://registry.npmjs.org/moment/-/moment-2.29.1.tgz;downloadfilename=
=3Dnpm2/moment-2.29.1.tgz;sha512sum=3D9079a8c9b70f57c4aacb9f43c0d0d8dc979fa=
fae252bf6f2fdd6b456215cb80e031f4bd083943a65ee558a6c647d03520be325b3f2b1e77b=
3b4e33f54611440d;subdir=3Dnpm/node_modules/moment;striplevel=3D1 \
+    https://registry.npmjs.org/mqtt-packet/-/mqtt-packet-6.10.0.tgz;downlo=
adfilename=3Dnpm2/mqtt-packet-6.10.0.tgz;sha512sum=3D8daf3e9852881dd0754e99=
7abda73eb24b6acb7800f2df4c76ea26d4103be5c23e47d0079d93a2681430a468969da5492=
c319174d850985680a9deed90a48c18;subdir=3Dnpm/node_modules/mqtt-packet;strip=
level=3D1 \
+    https://registry.npmjs.org/mqtt/-/mqtt-4.2.8.tgz;downloadfilename=3Dnp=
m2/mqtt-4.2.8.tgz;sha512sum=3D0c9623957383557b520de70df239cdce2e88b57dfeb9f=
1ac12cf4e077615db81ed911ae1ee4a71f0be4cd4bbb21742b36a21ad5abd8fcc370c18063a=
d0a18e48;subdir=3Dnpm/node_modules/mqtt;striplevel=3D1 \
+    https://registry.npmjs.org/ms/-/ms-2.0.0.tgz;downloadfilename=3Dnpm2/m=
s-2.0.0.tgz;sha1sum=3D5608aeadfc00be6c2901df5f9861788de0d597c8;subdir=3Dnpm=
/node_modules/ms;striplevel=3D1 \
+    https://registry.npmjs.org/ms/-/ms-2.1.1.tgz;downloadfilename=3Dnpm2/m=
s-2.1.1.tgz;sha512sum=3Db60a7e765e5c1a4dbcbad624b41b2b16a03b1ca82b8603ec83a=
67f11f856238825d47c2af01fc6998ff4a1767a9c5f210d57ac4bf1699d8683fe439685842f=
ca;subdir=3Dnpm/node_modules/send/node_modules/ms;striplevel=3D1 \
+    https://registry.npmjs.org/ms/-/ms-2.1.2.tgz;downloadfilename=3Dnpm2/m=
s-2.1.2.tgz;sha512sum=3Db0690fc7e56332d980e8c5f6ee80381411442c50996784b85ea=
7863970afebcb53fa36f7be4fd1c9a2963f43d32b25ad98b48cd1bf9a7544c4bdbb353c4687=
db;subdir=3Dnpm/node_modules/agent-base/node_modules/ms;striplevel=3D1 \
+    https://registry.npmjs.org/ms/-/ms-2.1.2.tgz;downloadfilename=3Dnpm2/m=
s-2.1.2.tgz;sha512sum=3Db0690fc7e56332d980e8c5f6ee80381411442c50996784b85ea=
7863970afebcb53fa36f7be4fd1c9a2963f43d32b25ad98b48cd1bf9a7544c4bdbb353c4687=
db;subdir=3Dnpm/node_modules/https-proxy-agent/node_modules/ms;striplevel=
=3D1 \
+    https://registry.npmjs.org/ms/-/ms-2.1.2.tgz;downloadfilename=3Dnpm2/m=
s-2.1.2.tgz;sha512sum=3Db0690fc7e56332d980e8c5f6ee80381411442c50996784b85ea=
7863970afebcb53fa36f7be4fd1c9a2963f43d32b25ad98b48cd1bf9a7544c4bdbb353c4687=
db;subdir=3Dnpm/node_modules/memorystore/node_modules/ms;striplevel=3D1 \
+    https://registry.npmjs.org/ms/-/ms-2.1.2.tgz;downloadfilename=3Dnpm2/m=
s-2.1.2.tgz;sha512sum=3Db0690fc7e56332d980e8c5f6ee80381411442c50996784b85ea=
7863970afebcb53fa36f7be4fd1c9a2963f43d32b25ad98b48cd1bf9a7544c4bdbb353c4687=
db;subdir=3Dnpm/node_modules/mqtt-packet/node_modules/ms;striplevel=3D1 \
+    https://registry.npmjs.org/ms/-/ms-2.1.2.tgz;downloadfilename=3Dnpm2/m=
s-2.1.2.tgz;sha512sum=3Db0690fc7e56332d980e8c5f6ee80381411442c50996784b85ea=
7863970afebcb53fa36f7be4fd1c9a2963f43d32b25ad98b48cd1bf9a7544c4bdbb353c4687=
db;subdir=3Dnpm/node_modules/mqtt/node_modules/ms;striplevel=3D1 \
+    https://registry.npmjs.org/multer/-/multer-1.4.3.tgz;downloadfilename=
=3Dnpm2/multer-1.4.3.tgz;sha512sum=3D9e9d182ca9dcb99a13cee7db90ceb010aa7af0=
4856257714e9faba42aad2c247247762e532077552a85424b8fa352ff9b19f1d13c2d80d6b2=
5b25b49ce79d796;subdir=3Dnpm/node_modules/multer;striplevel=3D1 \
+    https://registry.npmjs.org/mustache/-/mustache-4.2.0.tgz;downloadfilen=
ame=3Dnpm2/mustache-4.2.0.tgz;sha512sum=3Def58a9a52cb0ab961beffb5563219b901=
8206d4f07deee51cf9e9f1fad2318582bf2e1f0c6cf9a48a7aa9a5b885733349b4901ef1423=
292eaa3df7746f6668a9;subdir=3Dnpm/node_modules/mustache;striplevel=3D1 \
+    https://registry.npmjs.org/mute-stream/-/mute-stream-0.0.8.tgz;downloa=
dfilename=3Dnpm2/mute-stream-0.0.8.tgz;sha512sum=3D9e76d658e9285b252c4e32ab=
8600f475ccf6da67644a7a58a9b123226da787086ec654a4a72c09981a3c87466a25d929ef7=
99bf744acb0790de2bb1168101f00;subdir=3Dnpm/node_modules/mute-stream;striple=
vel=3D1 \
+    https://registry.npmjs.org/negotiator/-/negotiator-0.6.2.tgz;downloadf=
ilename=3Dnpm2/negotiator-0.6.2.tgz;sha512sum=3D8595dcecad9ef8f81e23578305e=
ff5d00adde1e91b7ebaea1bc129fbc2667f82480f66cd83b36f08f39937e91f179ef8a45408=
ee6ba6d8052a0e27682aa7133b;subdir=3Dnpm/node_modules/negotiator;striplevel=
=3D1 \
+    https://registry.npmjs.org/node-addon-api/-/node-addon-api-3.2.1.tgz;d=
ownloadfilename=3Dnpm2/node-addon-api-3.2.1.tgz;sha512sum=3D9a671e8bd260855=
34363276085099e0d7f0aa009b4140898c88714b7f3789e1c808a9075ee99656500ce243d9f=
a2dc40067b7831dcfe74a4ceede7ed2e0e1dd0;subdir=3Dnpm/node_modules/node-addon=
-api;striplevel=3D1 \
+    https://registry.npmjs.org/node-fetch/-/node-fetch-2.6.6.tgz;downloadf=
ilename=3Dnpm2/node-fetch-2.6.6.tgz;sha512sum=3D67cffabd195350285274880c6b9=
d63c50e25af0fc9cb948e5b5d0e6da038eff44496c00dd9ce4f9fc6d38051969ff89bc335d3=
13cab0af5633c76f2fb1e71710;subdir=3Dnpm/node_modules/node-fetch;striplevel=
=3D1 \
+    https://registry.npmjs.org/node-red-admin/-/node-red-admin-2.2.1.tgz;d=
ownloadfilename=3Dnpm2/node-red-admin-2.2.1.tgz;sha512sum=3Dc58a7a9996916c0=
58b47c9cee07455bed8586683c6068b4fbdeb401a1a38017a51256edf5f0dfc5f02b428f49f=
7ef2d28ace9cc5ab2426af676412e9dcf26d9e;subdir=3Dnpm/node_modules/node-red-a=
dmin;striplevel=3D1 \
+    https://registry.npmjs.org/nopt/-/nopt-5.0.0.tgz;downloadfilename=3Dnp=
m2/nopt-5.0.0.tgz;sha512sum=3D4db8faeeb7dfa9c79e2e97115eb4fbbca00df02c1f3de=
20180cec4ea206498a2d5edb10cc291a060b1afd2300252c10269afefbb13f42231289edeae=
99d320b5;subdir=3Dnpm/node_modules/nopt;striplevel=3D1 \
+    https://registry.npmjs.org/normalize-url/-/normalize-url-6.1.0.tgz;dow=
nloadfilename=3Dnpm2/normalize-url-6.1.0.tgz;sha512sum=3D0e52fe5f03b2dcdc40=
43cc6e0b4a243e02b8ea2b953402b4d5837b46e79806aa85786b018d5f5798203301d82dfba=
ebb6c297990f87d12a28a0f09da3c6d48ec;subdir=3Dnpm/node_modules/normalize-url=
;striplevel=3D1 \
+    https://registry.npmjs.org/npmlog/-/npmlog-6.0.0.tgz;downloadfilename=
=3Dnpm2/npmlog-6.0.0.tgz;sha512sum=3Dd37a691511a5b3251a4056c60b60bc41624dfc=
2fcaecfb1fc83f5a41d8552804081f8b1005cf16012a8504fecef94b78776a28e4ba1ea1ba0=
1ddc19d0594a9e9;subdir=3Dnpm/node_modules/npmlog;striplevel=3D1 \
+    https://registry.npmjs.org/nth-check/-/nth-check-2.0.1.tgz;downloadfil=
ename=3Dnpm2/nth-check-2.0.1.tgz;sha512sum=3D8add6f13de7317a7534fd941b186f1=
bea8744a8cb848fa307218f45011a3fd5e9c4cf9d75ed40e3d46e167a0a61b3003feb5b6d8b=
40ae84f7aa5c7495e4e00e3;subdir=3Dnpm/node_modules/nth-check;striplevel=3D1 =
\
+    https://registry.npmjs.org/oauth2orize/-/oauth2orize-1.11.0.tgz;downlo=
adfilename=3Dnpm2/oauth2orize-1.11.0.tgz;sha1sum=3D793cef251d45ebdeac32ae40=
a8b6814faab1d483;subdir=3Dnpm/node_modules/oauth2orize;striplevel=3D1 \
+    https://registry.npmjs.org/object-assign/-/object-assign-4.1.1.tgz;dow=
nloadfilename=3Dnpm2/object-assign-4.1.1.tgz;sha1sum=3D2109adc7965887cfc05c=
bbd442cac8bfbb360863;subdir=3Dnpm/node_modules/object-assign;striplevel=3D1=
 \
+    https://registry.npmjs.org/on-finished/-/on-finished-2.3.0.tgz;downloa=
dfilename=3Dnpm2/on-finished-2.3.0.tgz;sha1sum=3D20f1336481b083cd75337992a1=
6971aa2d906947;subdir=3Dnpm/node_modules/on-finished;striplevel=3D1 \
+    https://registry.npmjs.org/on-headers/-/on-headers-1.0.2.tgz;downloadf=
ilename=3Dnpm2/on-headers-1.0.2.tgz;sha512sum=3Da59004f8524ba32213cad76a2b4=
539b3e148a6337424fdcecc58bfbbc471f84579fd6f894d61971bcc45cdebc4ec08c17c3a87=
bfff2f2fca90b088479ea464ac;subdir=3Dnpm/node_modules/on-headers;striplevel=
=3D1 \
+    https://registry.npmjs.org/once/-/once-1.4.0.tgz;downloadfilename=3Dnp=
m2/once-1.4.0.tgz;sha1sum=3D583b1aa775961d4b113ac17d9c50baef9dd76bd1;subdir=
=3Dnpm/node_modules/once;striplevel=3D1 \
+    https://registry.npmjs.org/p-cancelable/-/p-cancelable-2.1.1.tgz;downl=
oadfilename=3Dnpm2/p-cancelable-2.1.1.tgz;sha512sum=3D0593abde74501ce9ed523=
4eb1fcf8b879e2c98a1e81f2babf167b557c0d2315ae5e40da66a538ec2e2519ca4438d29e4=
a1e061e1ab7a0701276f923b265df5c2;subdir=3Dnpm/node_modules/p-cancelable;str=
iplevel=3D1 \
+    https://registry.npmjs.org/parse5-htmlparser2-tree-adapter/-/parse5-ht=
mlparser2-tree-adapter-6.0.1.tgz;downloadfilename=3Dnpm2/parse5-htmlparser2=
-tree-adapter-6.0.1.tgz;sha512sum=3Da8fb96bdb2e0bc31a294a73906889c468be54f8=
32d613e897c9c8138c0ec2a8893f868ae3f9ab2acf0a747d1dc3c40882499998798d19ddc8d=
4e19e185bfef94;subdir=3Dnpm/node_modules/parse5-htmlparser2-tree-adapter;st=
riplevel=3D1 \
+    https://registry.npmjs.org/parse5/-/parse5-6.0.1.tgz;downloadfilename=
=3Dnpm2/parse5-6.0.1.tgz;sha512sum=3D39f9ff0931734464d3c70a4d12cf4f3fdde05d=
2847713ab6e799f345848a7bc024569658eded5fa664df3b2a08be33f91c6ed9d9933b552f4=
f3e14065b6a4ea7;subdir=3Dnpm/node_modules/parse5;striplevel=3D1 \
+    https://registry.npmjs.org/parseurl/-/parseurl-1.3.3.tgz;downloadfilen=
ame=3Dnpm2/parseurl-1.3.3.tgz;sha512sum=3D0a2c9e3b1153fc96723799b4cfd3df5f0=
e1208127a4b2833d43a65d30aa39610c418604fd469ec51510bd29eb78681b57dc8f77c7ca7=
5e2f4d60ee2758e2fea9;subdir=3Dnpm/node_modules/parseurl;striplevel=3D1 \
+    https://registry.npmjs.org/passport-http-bearer/-/passport-http-bearer=
-1.0.1.tgz;downloadfilename=3Dnpm2/passport-http-bearer-1.0.1.tgz;sha1sum=
=3D147469ea3669e2a84c6167ef99dbb77e1f0098a8;subdir=3Dnpm/node_modules/passp=
ort-http-bearer;striplevel=3D1 \
+    https://registry.npmjs.org/passport-oauth2-client-password/-/passport-=
oauth2-client-password-0.1.2.tgz;downloadfilename=3Dnpm2/passport-oauth2-cl=
ient-password-0.1.2.tgz;sha1sum=3D4f378b678b92d16dbbd233a6c706520093e561ba;=
subdir=3Dnpm/node_modules/passport-oauth2-client-password;striplevel=3D1 \
+    https://registry.npmjs.org/passport-strategy/-/passport-strategy-1.0.0=
.tgz;downloadfilename=3Dnpm2/passport-strategy-1.0.0.tgz;sha1sum=3Db5539aa8=
fc225a3d1ad179476ddf236b440f52e4;subdir=3Dnpm/node_modules/passport-strateg=
y;striplevel=3D1 \
+    https://registry.npmjs.org/passport/-/passport-0.5.0.tgz;downloadfilen=
ame=3Dnpm2/passport-0.5.0.tgz;sha512sum=3D967fae7b961a3434be7deb3a3b93c2cd7=
292b1e639bbc318857f47e42a38b3e1df608e68aaf9c72a838e44b60350f87ef2d1efaf1ba0=
1761857140354351aa7e;subdir=3Dnpm/node_modules/passport;striplevel=3D1 \
+    https://registry.npmjs.org/path-is-absolute/-/path-is-absolute-1.0.1.t=
gz;downloadfilename=3Dnpm2/path-is-absolute-1.0.1.tgz;sha1sum=3D174b9268735=
534ffbc7ace6bf53a5a9e1b5c5f5f;subdir=3Dnpm/node_modules/path-is-absolute;st=
riplevel=3D1 \
+    https://registry.npmjs.org/path-to-regexp/-/path-to-regexp-0.1.7.tgz;d=
ownloadfilename=3Dnpm2/path-to-regexp-0.1.7.tgz;sha1sum=3Ddf604178005f522f1=
5eb4490e7247a1bfaa67f8c;subdir=3Dnpm/node_modules/path-to-regexp;striplevel=
=3D1 \
+    https://registry.npmjs.org/pause/-/pause-0.0.1.tgz;downloadfilename=3D=
npm2/pause-0.0.1.tgz;sha1sum=3D1d408b3fdb76923b9543d96fb4c9dfd535d9cb5d;sub=
dir=3Dnpm/node_modules/pause;striplevel=3D1 \
+    https://registry.npmjs.org/process-nextick-args/-/process-nextick-args=
-2.0.1.tgz;downloadfilename=3Dnpm2/process-nextick-args-2.0.1.tgz;sha512sum=
=3Dde8b943a9421b60adb39ad7b27bfaec4e4e92136166863fbfc0868477f80fbfd5ef6c92b=
cde9468bf757cc4632bdbc6e6c417a5a7db2a6c7132a22891459f56a;subdir=3Dnpm/node_=
modules/process-nextick-args;striplevel=3D1 \
+    https://registry.npmjs.org/proxy-addr/-/proxy-addr-2.0.7.tgz;downloadf=
ilename=3Dnpm2/proxy-addr-2.0.7.tgz;sha512sum=3D96542c30b4940d43d3e388ddad4=
fcedfbaa59e27e2b433fe670ae699972848ac8b2afb59c69c95d27dbf6c3fcde2d040019fe0=
24475953b28cadaa0ad7e5d802;subdir=3Dnpm/node_modules/proxy-addr;striplevel=
=3D1 \
+    https://registry.npmjs.org/pseudomap/-/pseudomap-1.0.2.tgz;downloadfil=
ename=3Dnpm2/pseudomap-1.0.2.tgz;sha1sum=3Df052a28da70e618917ef0a8ac34c1ae5=
a68286b3;subdir=3Dnpm/node_modules/pseudomap;striplevel=3D1 \
+    https://registry.npmjs.org/psl/-/psl-1.8.0.tgz;downloadfilename=3Dnpm2=
/psl-1.8.0.tgz;sha512sum=3D44874ecf2a1abcafa1035f0e186583a944ec08b86d03b21c=
67fe8d0ace1f14968704369bfa90c3983201c96151409ab609deebd4ea10c4118a39acedabe=
86321;subdir=3Dnpm/node_modules/psl;striplevel=3D1 \
+    https://registry.npmjs.org/pump/-/pump-3.0.0.tgz;downloadfilename=3Dnp=
m2/pump-3.0.0.tgz;sha512sum=3D2f0672fa9dd216cd4fcad77f8d872de30a6fe3d1e2602=
a9df5195ce5955d93457ef18cefea34790659374d198f2f57edebd4f13f420c64627e58f154=
d81161c3;subdir=3Dnpm/node_modules/pump;striplevel=3D1 \
+    https://registry.npmjs.org/punycode/-/punycode-2.1.1.tgz;downloadfilen=
ame=3Dnpm2/punycode-2.1.1.tgz;sha512sum=3D5d1b118dd7fe8f99a5fb2ffa18a1cf65b=
ac5ffca766206b424fb5da93218d977b9a2124f0fdb1a0c924b3efa7df8d481a6b56f7af757=
6726e78f672ff0e11dd0;subdir=3Dnpm/node_modules/punycode;striplevel=3D1 \
+    https://registry.npmjs.org/qs/-/qs-6.7.0.tgz;downloadfilename=3Dnpm2/q=
s-6.7.0.tgz;sha512sum=3D54274144d1535f57f213b35be85628511a3f48f7bad9009a032=
cc9bd48f045a22c73e35e3c112788796fc459a65f9ebe1d9a61206b55d177828ab06da43ad3=
c9;subdir=3Dnpm/node_modules/qs;striplevel=3D1 \
+    https://registry.npmjs.org/quick-lru/-/quick-lru-5.1.1.tgz;downloadfil=
ename=3Dnpm2/quick-lru-5.1.1.tgz;sha512sum=3D5aec802d18d63c31adb7fc3326269d=
3b901763ef2167cd215697ba3328af82b691116ef9d57dd26e146f1b778b28e60dfbc544bea=
2dc7f7c1d9ede386784b848;subdir=3Dnpm/node_modules/quick-lru;striplevel=3D1 =
\
+    https://registry.npmjs.org/random-bytes/-/random-bytes-1.0.0.tgz;downl=
oadfilename=3Dnpm2/random-bytes-1.0.0.tgz;sha1sum=3D4f68a1dc0ae58bd3fb95848=
c30324db75d64360b;subdir=3Dnpm/node_modules/random-bytes;striplevel=3D1 \
+    https://registry.npmjs.org/range-parser/-/range-parser-1.2.1.tgz;downl=
oadfilename=3Dnpm2/range-parser-1.2.1.tgz;sha512sum=3D1eb82cc7ea2baa8ca09e6=
8456ca68713a736f7a27e1d30105e8c4417a80dba944e9a6189468cb37c6ddc700bdea8206b=
c2bff6cb143905577f1939796a03b04a;subdir=3Dnpm/node_modules/range-parser;str=
iplevel=3D1 \
+    https://registry.npmjs.org/raw-body/-/raw-body-2.4.0.tgz;downloadfilen=
ame=3Dnpm2/raw-body-2.4.0.tgz;sha512sum=3De0ecfc0d423076fa1ae6a3097a5c62a73=
8bf889222e343b9706575c0d629e61bd93fc64dd13fa388d90bd107a95ecf84b10f5727c8a9=
103a221fbd3249424fdd;subdir=3Dnpm/node_modules/body-parser/node_modules/raw=
-body;striplevel=3D1 \
+    https://registry.npmjs.org/raw-body/-/raw-body-2.4.1.tgz;downloadfilen=
ame=3Dnpm2/raw-body-2.4.1.tgz;sha512sum=3Df56988285ea692f03448b980d8a9e6f7e=
aa3f3d7be8f5cea8329fc69719defe9c076e3e8aa023d94ee7b48064d9ff072ce8e4fec9857=
4f283d3f36896c7ef76c;subdir=3Dnpm/node_modules/raw-body;striplevel=3D1 \
+    https://registry.npmjs.org/read/-/read-1.0.7.tgz;downloadfilename=3Dnp=
m2/read-1.0.7.tgz;sha1sum=3Db3da19bd052431a97671d44a42634adf710b40c4;subdir=
=3Dnpm/node_modules/read;striplevel=3D1 \
+    https://registry.npmjs.org/readable-stream/-/readable-stream-1.1.14.tg=
z;downloadfilename=3Dnpm2/readable-stream-1.1.14.tgz;sha1sum=3D7cf4c54ef648=
e3813084c636dd2079e166c081d9;subdir=3Dnpm/node_modules/busboy/node_modules/=
readable-stream;striplevel=3D1 \
+    https://registry.npmjs.org/readable-stream/-/readable-stream-1.1.14.tg=
z;downloadfilename=3Dnpm2/readable-stream-1.1.14.tgz;sha1sum=3D7cf4c54ef648=
e3813084c636dd2079e166c081d9;subdir=3Dnpm/node_modules/dicer/node_modules/r=
eadable-stream;striplevel=3D1 \
+    https://registry.npmjs.org/readable-stream/-/readable-stream-2.3.7.tgz=
;downloadfilename=3Dnpm2/readable-stream-2.3.7.tgz;sha512sum=3D11b868f0ae23=
21b1c0c67bb18bba38d8ead9805fd94cd72c663ea744ac949a484b16af021c8b69fdfcba850=
66e6663ff9f7c99f550546e9e33cff997f219983f;subdir=3Dnpm/node_modules/multer/=
node_modules/readable-stream;striplevel=3D1 \
+    https://registry.npmjs.org/readable-stream/-/readable-stream-3.6.0.tgz=
;downloadfilename=3Dnpm2/readable-stream-3.6.0.tgz;sha512sum=3D055887cbb2ca=
793cf8a0d9e470b27e95548beafa6215e5fafddde8487f33096ed4c4fda89dc864faf4c6075=
e37c6e1631d2ddd7938242a85d7ca65eaca688874;subdir=3Dnpm/node_modules/readabl=
e-stream;striplevel=3D1 \
+    https://registry.npmjs.org/regenerator-runtime/-/regenerator-runtime-0=
.13.9.tgz;downloadfilename=3Dnpm2/regenerator-runtime-0.13.9.tgz;sha512sum=
=3Da77553f9c38483116c45103d5f896423513e936fc2b672ad53881cc7268252b7a294bfef=
a88e82759df0c55531dd439483e82750e41071123b066488eb9e8c60;subdir=3Dnpm/node_=
modules/regenerator-runtime;striplevel=3D1 \
+    https://registry.npmjs.org/reinterval/-/reinterval-1.1.0.tgz;downloadf=
ilename=3Dnpm2/reinterval-1.1.0.tgz;sha1sum=3D3361ecfa3ca6c18283380dd0bb954=
6f390f5ece7;subdir=3Dnpm/node_modules/reinterval;striplevel=3D1 \
+    https://registry.npmjs.org/require-from-string/-/require-from-string-2=
.0.2.tgz;downloadfilename=3Dnpm2/require-from-string-2.0.2.tgz;sha512sum=3D=
5dfd2759ee91b1ece214cbbe029f5b8a251b9a996ae92f7fa7eef0ed85cffc904786b5030d4=
8706bebc0372b9bbaa7d9593bde53ffc36151ac0c6ed128bfef13;subdir=3Dnpm/node_mod=
ules/require-from-string;striplevel=3D1 \
+    https://registry.npmjs.org/resolve-alpn/-/resolve-alpn-1.2.1.tgz;downl=
oadfilename=3Dnpm2/resolve-alpn-1.2.1.tgz;sha512sum=3Dd1ad45e25ef7fd915939a=
9099d0dc5be4276fa0493416cffaf6284e4e7436344f13e6e61e0692a91659f338ed3ec7b1b=
9ceb5c255105e1ea42572eaeed0dcafa;subdir=3Dnpm/node_modules/resolve-alpn;str=
iplevel=3D1 \
+    https://registry.npmjs.org/responselike/-/responselike-2.0.0.tgz;downl=
oadfilename=3Dnpm2/responselike-2.0.0.tgz;sha512sum=3Dc47e3cbb715307d56c670=
ed1fafbe068a78b2b34fa8cea206d08447bf8dec309d98333dc9f25ae8b602fe89a6861917f=
f75bae782fa5aa15aa794470e7faa10b;subdir=3Dnpm/node_modules/responselike;str=
iplevel=3D1 \
+    https://registry.npmjs.org/retry/-/retry-0.6.1.tgz;downloadfilename=3D=
npm2/retry-0.6.1.tgz;sha1sum=3Dfdc90eed943fde11b893554b8cc63d0e899ba918;sub=
dir=3Dnpm/node_modules/retry;striplevel=3D1 \
+    https://registry.npmjs.org/rimraf/-/rimraf-3.0.2.tgz;downloadfilename=
=3Dnpm2/rimraf-3.0.2.tgz;sha512sum=3D25990931990018514f3f662a5d95cf6cc94c06=
0b31cc4f082ece253085ffda8d0bf54070f4efd8de8eb0170fe2f582daa5c5095b0a9b8b791=
dc483dd0bad9320;subdir=3Dnpm/node_modules/rimraf;striplevel=3D1 \
+    https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.1.2.tgz;downloa=
dfilename=3Dnpm2/safe-buffer-5.1.2.tgz;sha512sum=3D19dd94641243917958ec66c9=
c5fb04f3f9ef2a45045351b7f1cd6c88de903fa6bd3d3f4c98707c1a7a6c71298c252a05f0b=
388aedf2e77fc0fb688f2b381bafa;subdir=3Dnpm/node_modules/safe-buffer;striple=
vel=3D1 \
+    https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.2.1.tgz;downloa=
dfilename=3Dnpm2/safe-buffer-5.2.1.tgz;sha512sum=3Dae9dd2a34eca71d9a629b1af=
81a37141226bedb1954959394bd12ad45fa9a5b468ef4f9879a0f1930e4377c34f37e183e9b=
8e7626d95b8fb825e6a6e62f9825d;subdir=3Dnpm/node_modules/express-session/nod=
e_modules/safe-buffer;striplevel=3D1 \
+    https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.2.1.tgz;downloa=
dfilename=3Dnpm2/safe-buffer-5.2.1.tgz;sha512sum=3Dae9dd2a34eca71d9a629b1af=
81a37141226bedb1954959394bd12ad45fa9a5b468ef4f9879a0f1930e4377c34f37e183e9b=
8e7626d95b8fb825e6a6e62f9825d;subdir=3Dnpm/node_modules/string_decoder/node=
_modules/safe-buffer;striplevel=3D1 \
+    https://registry.npmjs.org/safer-buffer/-/safer-buffer-2.1.2.tgz;downl=
oadfilename=3Dnpm2/safer-buffer-2.1.2.tgz;sha512sum=3D619a372bcd920fb462ca2=
d04d4440fa232f3ee4a5ea6749023d2323db1c78355d75debdbe5d248eeda72376003c46710=
6c71bbbdcc911e4d1c6f0a9c42b894b6;subdir=3Dnpm/node_modules/safer-buffer;str=
iplevel=3D1 \
+    https://registry.npmjs.org/sax/-/sax-1.2.4.tgz;downloadfilename=3Dnpm2=
/sax-1.2.4.tgz;sha512sum=3D36a543bfd4e900d523166d0df2e3391b12f7e9480a8bdfda=
b59c3ec7b6059d0f1c9301462ab978c57e325adadecb75099b99cfd6451b9d880ba29a96352=
4615b;subdir=3Dnpm/node_modules/sax;striplevel=3D1 \
+    https://registry.npmjs.org/semver/-/semver-6.3.0.tgz;downloadfilename=
=3Dnpm2/semver-6.3.0.tgz;sha512sum=3D6f7f5305a4d27d5eb206b6a953cf69e5f29e90=
4da6fcdc270e870e56bb90152d7fbde320773b8f72738cdf833a0b0c56f231ff97111ae6b06=
80de530bb91c74f;subdir=3Dnpm/node_modules/make-dir/node_modules/semver;stri=
plevel=3D1 \
+    https://registry.npmjs.org/semver/-/semver-7.3.5.tgz;downloadfilename=
=3Dnpm2/semver-7.3.5.tgz;sha512sum=3D3e878625887c1cae014cefdaf537fa646def7a=
8fc0ed956c62b480e89f27cbd9dbdc1d55ae992e37ecfd384e707c4e69e87e0b721619b1e82=
24206c90fde1915;subdir=3Dnpm/node_modules/semver;striplevel=3D1 \
+    https://registry.npmjs.org/send/-/send-0.17.1.tgz;downloadfilename=3Dn=
pm2/send-0.17.1.tgz;sha512sum=3D06c54ab2219c40c1704fc531ca9a1b50acafee2ac23=
511e4d53d06ebcd2f93cf327fa2c107219c649393242ad33f6c5537ac88f978cf25c36e1375=
787d3f6c02;subdir=3Dnpm/node_modules/send;striplevel=3D1 \
+    https://registry.npmjs.org/serve-static/-/serve-static-1.14.1.tgz;down=
loadfilename=3Dnpm2/serve-static-1.14.1.tgz;sha512sum=3D24caef530139e1e9826=
1695323e846ac6bf923c744c26728ff4d04be4cc822c47b32aac7a276c3f693b630e7c59e91=
67b65ede72966cfb7996f976d066ef500a;subdir=3Dnpm/node_modules/serve-static;s=
triplevel=3D1 \
+    https://registry.npmjs.org/set-blocking/-/set-blocking-2.0.0.tgz;downl=
oadfilename=3Dnpm2/set-blocking-2.0.0.tgz;sha1sum=3D045f9782d011ae9a6803ddd=
382b24392b3d890f7;subdir=3Dnpm/node_modules/set-blocking;striplevel=3D1 \
+    https://registry.npmjs.org/setprototypeof/-/setprototypeof-1.1.1.tgz;d=
ownloadfilename=3Dnpm2/setprototypeof-1.1.1.tgz;sha512sum=3D26f74059f6d7788=
19a67d7082e9dfc1e7b594854a8de65a0eb119c249b1df9de1a44c3aa6ae6a0d42eb77497c3=
c3b39a318c046c730ec4467596a55160fd8e03;subdir=3Dnpm/node_modules/setprototy=
peof;striplevel=3D1 \
+    https://registry.npmjs.org/signal-exit/-/signal-exit-3.0.6.tgz;downloa=
dfilename=3Dnpm2/signal-exit-3.0.6.tgz;sha512sum=3Db03978a8c1698a3706c36d94=
e70eb72a60f771925f06e16554d6d530a8deda47a828c2fb5f653359b7385eb9846c3c20d0d=
5c9737cafe3fa31edbf8959be7b91;subdir=3Dnpm/node_modules/signal-exit;striple=
vel=3D1 \
+    https://registry.npmjs.org/split2/-/split2-3.2.2.tgz;downloadfilename=
=3Dnpm2/split2-3.2.2.tgz;sha512sum=3Df4d4e18e98199e27d3909a734d9ec4b9ef394b=
8f50c29361653aba19127039b6fa8e72c534607b426ef75791dec1344e3f2c43d02dbdc6a99=
a23af1b42d57e86;subdir=3Dnpm/node_modules/split2;striplevel=3D1 \
+    https://registry.npmjs.org/sprintf-js/-/sprintf-js-1.0.3.tgz;downloadf=
ilename=3Dnpm2/sprintf-js-1.0.3.tgz;sha1sum=3D04e6926f662895354f3dd01520363=
3b857297e2c;subdir=3Dnpm/node_modules/sprintf-js;striplevel=3D1 \
+    https://registry.npmjs.org/statuses/-/statuses-1.5.0.tgz;downloadfilen=
ame=3Dnpm2/statuses-1.5.0.tgz;sha1sum=3D161c7dac177659fd9811f43771fa9938147=
8628c;subdir=3Dnpm/node_modules/statuses;striplevel=3D1 \
+    https://registry.npmjs.org/stream-shift/-/stream-shift-1.0.1.tgz;downl=
oadfilename=3Dnpm2/stream-shift-1.0.1.tgz;sha512sum=3D0228aca05a90d2f6c6719=
8103d8d5c74fd88efa82569503f45ab984781b8b613458244eaafdd325d3a382d85fad0997e=
b0894f3471dd192c28d3502f6ca51255;subdir=3Dnpm/node_modules/stream-shift;str=
iplevel=3D1 \
+    https://registry.npmjs.org/streamsearch/-/streamsearch-0.1.2.tgz;downl=
oadfilename=3Dnpm2/streamsearch-0.1.2.tgz;sha1sum=3D808b9d0e56fc273d809ba57=
338e929919a1a9f1a;subdir=3Dnpm/node_modules/streamsearch;striplevel=3D1 \
+    https://registry.npmjs.org/string-width/-/string-width-4.2.3.tgz;downl=
oadfilename=3Dnpm2/string-width-4.2.3.tgz;sha512sum=3Dc0ac90450a63274b08a7a=
d84ad265d1ac8cc256b1aa79a1136284786ee86ec954effd8c807a5327af2feb57b8eaab9e0=
f23fdcc4a4d6c96530bd24eb8a2673fe;subdir=3Dnpm/node_modules/string-width;str=
iplevel=3D1 \
+    https://registry.npmjs.org/string_decoder/-/string_decoder-0.10.31.tgz=
;downloadfilename=3Dnpm2/string_decoder-0.10.31.tgz;sha1sum=3D62e203bc41766=
c6c28c9fc84301dab1c5310fa94;subdir=3Dnpm/node_modules/busboy/node_modules/s=
tring_decoder;striplevel=3D1 \
+    https://registry.npmjs.org/string_decoder/-/string_decoder-0.10.31.tgz=
;downloadfilename=3Dnpm2/string_decoder-0.10.31.tgz;sha1sum=3D62e203bc41766=
c6c28c9fc84301dab1c5310fa94;subdir=3Dnpm/node_modules/dicer/node_modules/st=
ring_decoder;striplevel=3D1 \
+    https://registry.npmjs.org/string_decoder/-/string_decoder-1.1.1.tgz;d=
ownloadfilename=3Dnpm2/string_decoder-1.1.1.tgz;sha512sum=3D9ff4a19ef0e2e85=
1db6d57ef8aba3e5a88e2173bfeb3c30f30705ccd578f7d4a4324bc282d3d21b75978630042=
6e2f29240bde104767907c8fc933ff9b345fc2;subdir=3Dnpm/node_modules/multer/nod=
e_modules/string_decoder;striplevel=3D1 \
+    https://registry.npmjs.org/string_decoder/-/string_decoder-1.3.0.tgz;d=
ownloadfilename=3Dnpm2/string_decoder-1.3.0.tgz;sha512sum=3D864457f14d568c9=
15df0bb03276c90ff0596c5aa2912c0015355df90cf00fa3d3ef392401a9a6dd7a72bd56860=
e8a21b6f8a2453a32a97a04e8febaea7fc0a78;subdir=3Dnpm/node_modules/string_dec=
oder;striplevel=3D1 \
+    https://registry.npmjs.org/strip-ansi/-/strip-ansi-6.0.1.tgz;downloadf=
ilename=3Dnpm2/strip-ansi-6.0.1.tgz;sha512sum=3D637f153d21dcaa416b0a916743d=
bee4979aabaebf9a1738aa46793e9a1abaf7a3719cf409556ba2417d448e0a76f1186645fbf=
d28a08ecaacfb944b3b54754e4;subdir=3Dnpm/node_modules/strip-ansi;striplevel=
=3D1 \
+    https://registry.npmjs.org/tar/-/tar-6.1.11.tgz;downloadfilename=3Dnpm=
2/tar-6.1.11.tgz;sha512sum=3D6a7fca650cd052464292ea0003ae2133dd97d14adbe95a=
51840165943cf3e3853699c0f9b1c993df305ce15815a64ba0179f34f83427f1e0054b2a10b=
74b739c;subdir=3Dnpm/node_modules/tar;striplevel=3D1 \
+    https://registry.npmjs.org/toidentifier/-/toidentifier-1.0.0.tgz;downl=
oadfilename=3Dnpm2/toidentifier-1.0.0.tgz;sha512sum=3Dc9a387fcf93f544841596=
4e5848faa5f10c55e57a30c67108a9325cb175af67b61ba56b12d950d714a85c68929d2f718=
9efb5e2659f914d40346bc63dd871b57;subdir=3Dnpm/node_modules/toidentifier;str=
iplevel=3D1 \
+    https://registry.npmjs.org/tough-cookie/-/tough-cookie-4.0.0.tgz;downl=
oadfilename=3Dnpm2/tough-cookie-4.0.0.tgz;sha512sum=3Db4776d12940232b73560b=
acc6aa5d7723e80c61622ff1822b7a999bb5f840d6527faa8547fcc0c428148cbd357baadb7=
cc0c2d701d2dfcc8c0086475f297116e;subdir=3Dnpm/node_modules/tough-cookie;str=
iplevel=3D1 \
+    https://registry.npmjs.org/tr46/-/tr46-0.0.3.tgz;downloadfilename=3Dnp=
m2/tr46-0.0.3.tgz;sha1sum=3D8184fd347dac9cdc185992f3a6622e14b9d9ab6a;subdir=
=3Dnpm/node_modules/tr46;striplevel=3D1 \
+    https://registry.npmjs.org/tslib/-/tslib-2.3.1.tgz;downloadfilename=3D=
npm2/tslib-2.3.1.tgz;sha512sum=3Defb11bc8f3e9333f8544546e00595632d9a051619e=
f54386d99db936a0b08888d184e7f988a1aecd27b93f6c3595aabe164472e29f8f0ae564252=
1a4cd310a57;subdir=3Dnpm/node_modules/tslib;striplevel=3D1 \
+    https://registry.npmjs.org/type-is/-/type-is-1.6.18.tgz;downloadfilena=
me=3Dnpm2/type-is-1.6.18.tgz;sha512sum=3D4e444aafdb144f1107f0c75fb8248fed58=
b3272cd134c8e3d89d9da3626bdcaca6e7df0955d124b2eccf4029e514f5b8932f50fa203e9=
9af411a6d3a5d0072f2;subdir=3Dnpm/node_modules/type-is;striplevel=3D1 \
+    https://registry.npmjs.org/typedarray/-/typedarray-0.0.6.tgz;downloadf=
ilename=3Dnpm2/typedarray-0.0.6.tgz;sha1sum=3D867ac74e3864187b1d3d47d996a78=
ec5c8830777;subdir=3Dnpm/node_modules/typedarray;striplevel=3D1 \
+    https://registry.npmjs.org/uglify-js/-/uglify-js-3.14.2.tgz;downloadfi=
lename=3Dnpm2/uglify-js-3.14.2.tgz;sha512sum=3Daed3cc96670ee1a81351fcf5d026=
e027593a500a173368166f71a830f3d907ffbf01c91ff25356935d4ae2b622d83d1aa60a054=
4bb5039985bfbf886349ab6e8;subdir=3Dnpm/node_modules/uglify-js;striplevel=3D=
1 \
+    https://registry.npmjs.org/uid-safe/-/uid-safe-2.1.5.tgz;downloadfilen=
ame=3Dnpm2/uid-safe-2.1.5.tgz;sha512sum=3D28f1e6e152f97435cacf4d54b8477cf03=
7fe2b3ca76a88522fd7c1874f7a29603148a6500c8dae06b56ab6f44ce2bc2b22b4512ac74b=
34c2ff96769a552462a0;subdir=3Dnpm/node_modules/uid-safe;striplevel=3D1 \
+    https://registry.npmjs.org/uid2/-/uid2-0.0.4.tgz;downloadfilename=3Dnp=
m2/uid2-0.0.4.tgz;sha512sum=3D21ebd3bacd126c6c10cd8877f9f46c00c4d554f3a8215=
b9fcda7177073e676595ed63529abb0512fe9b0ddd81e2da9ef199770c1b5a1455e97adc14d=
7419a358;subdir=3Dnpm/node_modules/uid2;striplevel=3D1 \
+    https://registry.npmjs.org/universalify/-/universalify-0.1.2.tgz;downl=
oadfilename=3Dnpm2/universalify-0.1.2.tgz;sha512sum=3Dac125e2390970259b2d69=
57eeb5ed607d27add4e9771acc71c5d9fd9d6c98b1e17ce9505d114b765b8f414620e080bda=
e4ffddfc604e61a002435c3ed1acd492;subdir=3Dnpm/node_modules/tough-cookie/nod=
e_modules/universalify;striplevel=3D1 \
+    https://registry.npmjs.org/universalify/-/universalify-2.0.0.tgz;downl=
oadfilename=3Dnpm2/universalify-2.0.0.tgz;sha512sum=3D84066c2aaed8cb5d59bb5=
0c4d0ecd68f0ee79cb6662596130d96721051d9754855f05907e4c09fa14d5731ac57a2fa72=
5b99eae6c70faaad190cff59ca5d38a1;subdir=3Dnpm/node_modules/universalify;str=
iplevel=3D1 \
+    https://registry.npmjs.org/unpipe/-/unpipe-1.0.0.tgz;downloadfilename=
=3Dnpm2/unpipe-1.0.0.tgz;sha1sum=3Db2bf4ee8514aae6165b4817829d21b2ef49904ec=
;subdir=3Dnpm/node_modules/unpipe;striplevel=3D1 \
+    https://registry.npmjs.org/uri-js/-/uri-js-4.4.1.tgz;downloadfilename=
=3Dnpm2/uri-js-4.4.1.tgz;sha512sum=3Deeb294cb2df7435c9cf7ca50d430262edc17d7=
4f45ed321f5a55b561da3c5a5d628b549e1e279e8741c77cf78bd9f3172bacf4b3c79c2acf5=
fac2b8b26f9dd06;subdir=3Dnpm/node_modules/uri-js;striplevel=3D1 \
+    https://registry.npmjs.org/util-deprecate/-/util-deprecate-1.0.2.tgz;d=
ownloadfilename=3Dnpm2/util-deprecate-1.0.2.tgz;sha1sum=3D450d4dc9fa70de732=
762fbd2d4a28981419a0ccf;subdir=3Dnpm/node_modules/util-deprecate;striplevel=
=3D1 \
+    https://registry.npmjs.org/utils-merge/-/utils-merge-1.0.1.tgz;downloa=
dfilename=3Dnpm2/utils-merge-1.0.1.tgz;sha1sum=3D9f95710f50a267947b2ccc1247=
41c1028427e713;subdir=3Dnpm/node_modules/utils-merge;striplevel=3D1 \
+    https://registry.npmjs.org/uuid/-/uuid-8.3.2.tgz;downloadfilename=3Dnp=
m2/uuid-8.3.2.tgz;sha512sum=3Df8d62cd9078c5b2f865853849bdc679fa1c20e9d25ed0=
043ee697cccb52627ef77439345d0da1c12b9f09139175453625f7fdfa42e9a7d2f0385bfe0=
cfb47b7a;subdir=3Dnpm/node_modules/uuid;striplevel=3D1 \
+    https://registry.npmjs.org/vary/-/vary-1.1.2.tgz;downloadfilename=3Dnp=
m2/vary-1.1.2.tgz;sha1sum=3D2299f02c6ded30d4a5961b0b9f74524a18f634fc;subdir=
=3Dnpm/node_modules/vary;striplevel=3D1 \
+    https://registry.npmjs.org/webidl-conversions/-/webidl-conversions-3.0=
.1.tgz;downloadfilename=3Dnpm2/webidl-conversions-3.0.1.tgz;sha1sum=3D24534=
275e2a7bc6be7bc86611cc16ae0a5654871;subdir=3Dnpm/node_modules/webidl-conver=
sions;striplevel=3D1 \
+    https://registry.npmjs.org/whatwg-url/-/whatwg-url-5.0.0.tgz;downloadf=
ilename=3Dnpm2/whatwg-url-5.0.0.tgz;sha1sum=3D966454e8765462e37644d3626f674=
2ce8b70965d;subdir=3Dnpm/node_modules/whatwg-url;striplevel=3D1 \
+    https://registry.npmjs.org/wide-align/-/wide-align-1.1.5.tgz;downloadf=
ilename=3Dnpm2/wide-align-1.1.5.tgz;sha512sum=3D78330e45868f359e2c408bae60f=
0c7750bdfe20c8217dac4115ff23f119fc0f911a1dc048223145174f1fdd7b1f8c7b4c31c79=
dd2f8d8141da3fbcb73069439a;subdir=3Dnpm/node_modules/wide-align;striplevel=
=3D1 \
+    https://registry.npmjs.org/wrappy/-/wrappy-1.0.2.tgz;downloadfilename=
=3Dnpm2/wrappy-1.0.2.tgz;sha1sum=3Db5243d8f3ec1aa35f1364605bc0d1036e30ab69f=
;subdir=3Dnpm/node_modules/wrappy;striplevel=3D1 \
+    https://registry.npmjs.org/ws/-/ws-7.5.1.tgz;downloadfilename=3Dnpm2/w=
s-7.5.1.tgz;sha512sum=3Dd9ce9f68e507fe786840de9a6f0325a05ec8ca5d194b613d1c6=
b6c88bad69f4cce38c5a586d0e675ffee8a10edea39ee0b182dc0604dcba3a7b28cb6b363b6=
3b;subdir=3Dnpm/node_modules/ws;striplevel=3D1 \
+    https://registry.npmjs.org/xml2js/-/xml2js-0.4.23.tgz;downloadfilename=
=3Dnpm2/xml2js-0.4.23.tgz;sha512sum=3Dc923e2323334fa92c37ed1e05d8e01cb4bacc=
08dd23ca2c3c3f8b75176e73bc33fa76f33a9ec425283e6405ad80feff5073846252b368b51=
1158a240b622ebba;subdir=3Dnpm/node_modules/xml2js;striplevel=3D1 \
+    https://registry.npmjs.org/xmlbuilder/-/xmlbuilder-11.0.1.tgz;download=
filename=3Dnpm2/xmlbuilder-11.0.1.tgz;sha512sum=3D7c396c23f905131ee02ef6de7=
1cd3fa212c6e747ee810a7caf21f3313b96f6f49ad462745d858a9e1b14c7ba227b71bdf3ea=
f9e9a4d0214078921b78d91dc9bc;subdir=3Dnpm/node_modules/xmlbuilder;stripleve=
l=3D1 \
+    https://registry.npmjs.org/xtend/-/xtend-4.0.2.tgz;downloadfilename=3D=
npm2/xtend-4.0.2.tgz;sha512sum=3D2ca614d620172575200179fd5118e2bbe316872517=
1ecbdfa7b99cb989bd75250a2b4fc28edad4c050310fcdbf98259bb4bb068c521a774c08b28=
778ceb4c011;subdir=3Dnpm/node_modules/xtend;striplevel=3D1 \
+    https://registry.npmjs.org/yallist/-/yallist-2.1.2.tgz;downloadfilenam=
e=3Dnpm2/yallist-2.1.2.tgz;sha1sum=3D1c11f9218f076089a47dd512f93c6699a6a81d=
52;subdir=3Dnpm/node_modules/yallist;striplevel=3D1 \
+    https://registry.npmjs.org/yallist/-/yallist-4.0.0.tgz;downloadfilenam=
e=3Dnpm2/yallist-4.0.0.tgz;sha512sum=3Ddf074689d672ab93c1d3ce172c44b94e9392=
440df08d7025216321ba6da445cbffe354a7d9e990d1dc9c416e2e6572de8f02af83a12cbdb=
76554bf8560472dec;subdir=3Dnpm/node_modules/minipass/node_modules/yallist;s=
triplevel=3D1 \
+    https://registry.npmjs.org/yallist/-/yallist-4.0.0.tgz;downloadfilenam=
e=3Dnpm2/yallist-4.0.0.tgz;sha512sum=3Ddf074689d672ab93c1d3ce172c44b94e9392=
440df08d7025216321ba6da445cbffe354a7d9e990d1dc9c416e2e6572de8f02af83a12cbdb=
76554bf8560472dec;subdir=3Dnpm/node_modules/minizlib/node_modules/yallist;s=
triplevel=3D1 \
+    https://registry.npmjs.org/yallist/-/yallist-4.0.0.tgz;downloadfilenam=
e=3Dnpm2/yallist-4.0.0.tgz;sha512sum=3Ddf074689d672ab93c1d3ce172c44b94e9392=
440df08d7025216321ba6da445cbffe354a7d9e990d1dc9c416e2e6572de8f02af83a12cbdb=
76554bf8560472dec;subdir=3Dnpm/node_modules/semver/node_modules/yallist;str=
iplevel=3D1 \
+    https://registry.npmjs.org/yallist/-/yallist-4.0.0.tgz;downloadfilenam=
e=3Dnpm2/yallist-4.0.0.tgz;sha512sum=3Ddf074689d672ab93c1d3ce172c44b94e9392=
440df08d7025216321ba6da445cbffe354a7d9e990d1dc9c416e2e6572de8f02af83a12cbdb=
76554bf8560472dec;subdir=3Dnpm/node_modules/tar/node_modules/yallist;stripl=
evel=3D1 \
+    "
+SRC_URI[main.md5sum] =3D "d237b07ff9b5feb6cac72e3f09015201"
+SRC_URI[main.sha1sum] =3D "394abfed07efb0d6a5362c4d7e97b1ac31ea05db"
+SRC_URI[main.sha256sum] =3D "941ed26cf9fdd86881db4a1ee0a0c01362c9f00caa500=
e01c0604012829622e6"
+SRC_URI[main.sha384sum] =3D "458bafba7355ea1045c79ce9f5095c9a117abcb41a23c=
c601d995723cc4118f89d97043151b3a9e1ca80c77b32488c75"
+SRC_URI[main.sha512sum] =3D "211a5cf3ed424778de6503925fe88013b820bbfb117d5=
b2fe82a7f7e5444948ca1b997856a76ec537d7d28e20f9dfbaa1788a3c0f8b05858f6ce3b43=
96537ef9"
+
+S =3D "${WORKDIR}/npm"
+
+inherit npm
+
+LICENSE:${PN} =3D "Apache-2.0"
+LICENSE:${PN}-babel-runtime =3D "MIT"
+LICENSE:${PN}-mapbox-node-pre-gyp =3D "BSD-3-Clause"
+LICENSE:${PN}-node-red-editor-api =3D "Apache-2.0"
+LICENSE:${PN}-node-red-editor-client =3D "BSD-3-Clause MIT Apache-2.0"
+LICENSE:${PN}-node-red-nodes =3D "Apache-2.0"
+LICENSE:${PN}-node-red-registry =3D "Apache-2.0"
+LICENSE:${PN}-node-red-runtime =3D "Apache-2.0"
+LICENSE:${PN}-node-red-util =3D "Apache-2.0"
+LICENSE:${PN}-sindresorhus-is =3D "MIT"
+LICENSE:${PN}-szmarczak-http-timer =3D "MIT"
+LICENSE:${PN}-types-cacheable-request =3D "MIT"
+LICENSE:${PN}-types-http-cache-semantics =3D "MIT"
+LICENSE:${PN}-types-keyv =3D "MIT"
+LICENSE:${PN}-types-node =3D "MIT"
+LICENSE:${PN}-types-responselike =3D "MIT"
+LICENSE:${PN}-abbrev =3D "ISC | MIT"
+LICENSE:${PN}-accepts =3D "MIT"
+LICENSE:${PN}-acorn =3D "MIT"
+LICENSE:${PN}-acorn-walk =3D "MIT"
+LICENSE:${PN}-agent-base-debug =3D "MIT"
+LICENSE:${PN}-agent-base-ms =3D "MIT"
+LICENSE:${PN}-agent-base =3D "MIT"
+LICENSE:${PN}-ajv =3D "MIT"
+LICENSE:${PN}-ansi-colors =3D "MIT"
+LICENSE:${PN}-ansi-regex =3D "MIT"
+LICENSE:${PN}-append-field =3D "MIT"
+LICENSE:${PN}-aproba =3D "ISC"
+LICENSE:${PN}-are-we-there-yet =3D "ISC"
+LICENSE:${PN}-argparse =3D "MIT"
+LICENSE:${PN}-array-flatten =3D "MIT"
+LICENSE:${PN}-async =3D "MIT"
+LICENSE:${PN}-async-mutex =3D "MIT"
+LICENSE:${PN}-asynckit =3D "MIT"
+LICENSE:${PN}-axios =3D "MIT"
+LICENSE:${PN}-balanced-match =3D "MIT"
+LICENSE:${PN}-base64-js =3D "MIT"
+LICENSE:${PN}-basic-auth =3D "MIT"
+LICENSE:${PN}-bcrypt =3D "MIT"
+LICENSE:${PN}-bcryptjs =3D "BSD-3-Clause & MIT"
+LICENSE:${PN}-bl-inherits =3D "ISC"
+LICENSE:${PN}-bl =3D "MIT"
+LICENSE:${PN}-body-parser-iconv-lite =3D "MIT"
+LICENSE:${PN}-body-parser-raw-body =3D "MIT"
+LICENSE:${PN}-body-parser =3D "MIT"
+LICENSE:${PN}-boolbase =3D "Unknown"
+LICENSE:${PN}-brace-expansion =3D "MIT"
+LICENSE:${PN}-buffer =3D "MIT"
+LICENSE:${PN}-buffer-from =3D "MIT"
+LICENSE:${PN}-busboy-readable-stream =3D "MIT"
+LICENSE:${PN}-busboy-stringdecoder =3D "MIT"
+LICENSE:${PN}-busboy =3D "MIT"
+LICENSE:${PN}-bytes =3D "MIT"
+LICENSE:${PN}-cacheable-lookup =3D "MIT"
+LICENSE:${PN}-cacheable-request =3D "MIT"
+LICENSE:${PN}-cheerio =3D "MIT"
+LICENSE:${PN}-cheerio-select =3D "BSD-2-Clause"
+LICENSE:${PN}-chownr =3D "ISC"
+LICENSE:${PN}-cli-table =3D "MIT"
+LICENSE:${PN}-clone =3D "MIT"
+LICENSE:${PN}-clone-response =3D "MIT"
+LICENSE:${PN}-color-support =3D "ISC"
+LICENSE:${PN}-colors =3D "MIT"
+LICENSE:${PN}-combined-stream =3D "MIT"
+LICENSE:${PN}-commist =3D "MIT"
+LICENSE:${PN}-concat-map =3D "MIT"
+LICENSE:${PN}-concat-stream =3D "MIT"
+LICENSE:${PN}-console-control-strings =3D "ISC"
+LICENSE:${PN}-content-disposition =3D "MIT"
+LICENSE:${PN}-content-type =3D "MIT"
+LICENSE:${PN}-cookie =3D "MIT"
+LICENSE:${PN}-cookie-parser-cookie =3D "MIT"
+LICENSE:${PN}-cookie-parser =3D "MIT"
+LICENSE:${PN}-cookie-signature =3D "MIT"
+LICENSE:${PN}-core-util-is =3D "MIT"
+LICENSE:${PN}-cors =3D "MIT"
+LICENSE:${PN}-cronosjs =3D "ISC"
+LICENSE:${PN}-css-select =3D "BSD-2-Clause"
+LICENSE:${PN}-css-what =3D "BSD-2-Clause"
+LICENSE:${PN}-debug =3D "MIT"
+LICENSE:${PN}-decompress-response-mimic-response =3D "MIT"
+LICENSE:${PN}-decompress-response =3D "MIT"
+LICENSE:${PN}-defer-to-connect =3D "MIT"
+LICENSE:${PN}-delayed-stream =3D "MIT"
+LICENSE:${PN}-delegates =3D "MIT"
+LICENSE:${PN}-denque =3D "Apache-2.0"
+LICENSE:${PN}-depd =3D "MIT"
+LICENSE:${PN}-destroy =3D "MIT"
+LICENSE:${PN}-detect-libc =3D "Apache-2.0"
+LICENSE:${PN}-dicer-readable-stream =3D "MIT"
+LICENSE:${PN}-dicer-stringdecoder =3D "MIT"
+LICENSE:${PN}-dicer =3D "MIT"
+LICENSE:${PN}-dom-serializer =3D "MIT"
+LICENSE:${PN}-domelementtype =3D "BSD-2-Clause"
+LICENSE:${PN}-domhandler =3D "BSD-2-Clause"
+LICENSE:${PN}-domutils =3D "BSD-2-Clause"
+LICENSE:${PN}-duplexify =3D "MIT"
+LICENSE:${PN}-ee-first =3D "MIT"
+LICENSE:${PN}-emoji-regex =3D "MIT"
+LICENSE:${PN}-encodeurl =3D "MIT"
+LICENSE:${PN}-end-of-stream =3D "MIT"
+LICENSE:${PN}-enquirer =3D "MIT"
+LICENSE:${PN}-entities =3D "BSD-2-Clause"
+LICENSE:${PN}-escape-html =3D "MIT"
+LICENSE:${PN}-esprima =3D "BSD-2-Clause"
+LICENSE:${PN}-etag =3D "MIT"
+LICENSE:${PN}-express-cookie =3D "MIT"
+LICENSE:${PN}-express =3D "MIT"
+LICENSE:${PN}-express-session-depd =3D "MIT"
+LICENSE:${PN}-express-session-safe-buffer =3D "MIT"
+LICENSE:${PN}-express-session =3D "MIT"
+LICENSE:${PN}-fast-deep-equal =3D "MIT"
+LICENSE:${PN}-finalhandler =3D "MIT"
+LICENSE:${PN}-follow-redirects =3D "MIT"
+LICENSE:${PN}-form-data =3D "MIT"
+LICENSE:${PN}-forwarded =3D "MIT"
+LICENSE:${PN}-fresh =3D "MIT"
+LICENSE:${PN}-fs-extra =3D "MIT"
+LICENSE:${PN}-fs-minipass =3D "ISC"
+LICENSE:${PN}-fsnotify =3D "MIT"
+LICENSE:${PN}-fsrealpath =3D "ISC & MIT"
+LICENSE:${PN}-gauge =3D "ISC"
+LICENSE:${PN}-get-stream =3D "MIT"
+LICENSE:${PN}-glob =3D "ISC & CC-BY-SA-4.0"
+LICENSE:${PN}-got =3D "MIT"
+LICENSE:${PN}-graceful-fs =3D "ISC"
+LICENSE:${PN}-has-unicode =3D "ISC"
+LICENSE:${PN}-hash-sum =3D "MIT"
+LICENSE:${PN}-help-me =3D "MIT"
+LICENSE:${PN}-hpagent =3D "MIT"
+LICENSE:${PN}-htmlparser2 =3D "MIT"
+LICENSE:${PN}-http-cache-semantics =3D "BSD-2-Clause"
+LICENSE:${PN}-http-errors =3D "MIT"
+LICENSE:${PN}-http2-wrapper =3D "MIT"
+LICENSE:${PN}-https-proxy-agent-debug =3D "MIT"
+LICENSE:${PN}-https-proxy-agent-ms =3D "MIT"
+LICENSE:${PN}-https-proxy-agent =3D "MIT"
+LICENSE:${PN}-i18next =3D "MIT"
+LICENSE:${PN}-iconv-lite =3D "MIT"
+LICENSE:${PN}-ieee754 =3D "BSD-3-Clause"
+LICENSE:${PN}-inflight =3D "ISC"
+LICENSE:${PN}-inherits =3D "ISC"
+LICENSE:${PN}-ipaddrjs =3D "MIT"
+LICENSE:${PN}-is-fullwidth-code-point =3D "MIT"
+LICENSE:${PN}-is-utf8 =3D "MIT"
+LICENSE:${PN}-isarray =3D "MIT"
+LICENSE:${PN}-js-yaml =3D "MIT"
+LICENSE:${PN}-json-buffer =3D "MIT"
+LICENSE:${PN}-json-schema-traverse =3D "MIT"
+LICENSE:${PN}-json-stringify-safe =3D "ISC"
+LICENSE:${PN}-jsonata =3D "MIT"
+LICENSE:${PN}-jsonfile =3D "MIT"
+LICENSE:${PN}-keyv =3D "MIT"
+LICENSE:${PN}-leven =3D "MIT"
+LICENSE:${PN}-lodashclonedeep =3D "MIT"
+LICENSE:${PN}-lowercase-keys =3D "MIT"
+LICENSE:${PN}-lru-cache =3D "ISC"
+LICENSE:${PN}-make-dir-semver =3D "ISC"
+LICENSE:${PN}-make-dir =3D "MIT"
+LICENSE:${PN}-media-typer =3D "MIT"
+LICENSE:${PN}-memorystore-debug =3D "MIT"
+LICENSE:${PN}-memorystore-ms =3D "MIT"
+LICENSE:${PN}-memorystore =3D "MIT"
+LICENSE:${PN}-merge-descriptors =3D "MIT"
+LICENSE:${PN}-methods =3D "MIT"
+LICENSE:${PN}-mime =3D "MIT"
+LICENSE:${PN}-mime-db =3D "MIT"
+LICENSE:${PN}-mime-types =3D "MIT"
+LICENSE:${PN}-mimic-response =3D "MIT"
+LICENSE:${PN}-minimatch =3D "ISC"
+LICENSE:${PN}-minimist =3D "MIT"
+LICENSE:${PN}-minipass-yallist =3D "ISC"
+LICENSE:${PN}-minipass =3D "ISC"
+LICENSE:${PN}-minizlib-yallist =3D "ISC"
+LICENSE:${PN}-minizlib =3D "MIT"
+LICENSE:${PN}-mkdirp =3D "MIT"
+LICENSE:${PN}-moment =3D "MIT"
+LICENSE:${PN}-moment-timezone =3D "MIT"
+LICENSE:${PN}-mqtt-debug =3D "MIT"
+LICENSE:${PN}-mqtt-ms =3D "MIT"
+LICENSE:${PN}-mqtt =3D "MIT"
+LICENSE:${PN}-mqtt-packet-debug =3D "MIT"
+LICENSE:${PN}-mqtt-packet-ms =3D "MIT"
+LICENSE:${PN}-mqtt-packet =3D "MIT"
+LICENSE:${PN}-ms =3D "MIT"
+LICENSE:${PN}-multer-concat-stream =3D "MIT"
+LICENSE:${PN}-multer-isarray =3D "MIT"
+LICENSE:${PN}-multer-readable-stream =3D "MIT"
+LICENSE:${PN}-multer-stringdecoder =3D " MIT"
+LICENSE:${PN}-multer =3D "MIT"
+LICENSE:${PN}-mustache =3D "MIT"
+LICENSE:${PN}-mute-stream =3D "ISC"
+LICENSE:${PN}-negotiator =3D "MIT"
+LICENSE:${PN}-node-addon-api =3D "MIT"
+LICENSE:${PN}-node-fetch =3D "MIT"
+LICENSE:${PN}-node-red-admin =3D "Apache-2.0"
+LICENSE:${PN}-nopt =3D "ISC"
+LICENSE:${PN}-normalize-url =3D "MIT"
+LICENSE:${PN}-npmlog =3D "ISC"
+LICENSE:${PN}-nth-check =3D "BSD-2-Clause"
+LICENSE:${PN}-oauth2orize =3D "MIT"
+LICENSE:${PN}-object-assign =3D "MIT"
+LICENSE:${PN}-on-finished =3D "MIT"
+LICENSE:${PN}-on-headers =3D "MIT"
+LICENSE:${PN}-once =3D "ISC"
+LICENSE:${PN}-p-cancelable =3D "MIT"
+LICENSE:${PN}-parse5 =3D "MIT"
+LICENSE:${PN}-parse5-htmlparser2-tree-adapter =3D "MIT"
+LICENSE:${PN}-parseurl =3D "MIT"
+LICENSE:${PN}-passport =3D "MIT"
+LICENSE:${PN}-passport-http-bearer =3D "MIT"
+LICENSE:${PN}-passport-oauth2-client-password =3D "MIT"
+LICENSE:${PN}-passport-strategy =3D "MIT"
+LICENSE:${PN}-path-is-absolute =3D "MIT"
+LICENSE:${PN}-path-to-regexp =3D "MIT"
+LICENSE:${PN}-pause =3D "MIT"
+LICENSE:${PN}-process-nextick-args =3D "MIT"
+LICENSE:${PN}-proxy-addr =3D "MIT"
+LICENSE:${PN}-pseudomap =3D "ISC"
+LICENSE:${PN}-psl =3D "MIT"
+LICENSE:${PN}-pump =3D "MIT"
+LICENSE:${PN}-punycode =3D "MIT"
+LICENSE:${PN}-qs =3D "BSD-3-Clause"
+LICENSE:${PN}-quick-lru =3D "MIT"
+LICENSE:${PN}-random-bytes =3D "MIT"
+LICENSE:${PN}-range-parser =3D "MIT"
+LICENSE:${PN}-raw-body-http-errors =3D "MIT"
+LICENSE:${PN}-raw-body-iconv-lite =3D "MIT"
+LICENSE:${PN}-raw-body-inherits =3D "ISC"
+LICENSE:${PN}-raw-body =3D "MIT"
+LICENSE:${PN}-read =3D "ISC"
+LICENSE:${PN}-readable-stream =3D "MIT"
+LICENSE:${PN}-regenerator-runtime =3D "MIT"
+LICENSE:${PN}-reinterval =3D "MIT"
+LICENSE:${PN}-require-from-string =3D "MIT"
+LICENSE:${PN}-resolve-alpn =3D "MIT"
+LICENSE:${PN}-responselike =3D "MIT"
+LICENSE:${PN}-retry =3D "MIT"
+LICENSE:${PN}-rimraf =3D "ISC"
+LICENSE:${PN}-safe-buffer =3D "MIT"
+LICENSE:${PN}-safer-buffer =3D "MIT"
+LICENSE:${PN}-sax =3D "ISC & MIT"
+LICENSE:${PN}-semver-lru-cache =3D "ISC"
+LICENSE:${PN}-semver-yallist =3D "ISC"
+LICENSE:${PN}-semver =3D "ISC"
+LICENSE:${PN}-send-mime =3D "MIT"
+LICENSE:${PN}-send-ms =3D "MIT"
+LICENSE:${PN}-send =3D "MIT"
+LICENSE:${PN}-serve-static =3D "MIT"
+LICENSE:${PN}-set-blocking =3D "ISC"
+LICENSE:${PN}-setprototypeof =3D "ISC"
+LICENSE:${PN}-signal-exit =3D "ISC"
+LICENSE:${PN}-split2 =3D "ISC"
+LICENSE:${PN}-sprintf-js =3D "BSD-3-Clause"
+LICENSE:${PN}-statuses =3D "MIT"
+LICENSE:${PN}-stream-shift =3D "MIT"
+LICENSE:${PN}-streamsearch =3D "MIT"
+LICENSE:${PN}-stringdecoder-safe-buffer =3D "MIT"
+LICENSE:${PN}-stringdecoder =3D " MIT"
+LICENSE:${PN}-string-width =3D "MIT"
+LICENSE:${PN}-strip-ansi =3D "MIT"
+LICENSE:${PN}-tar-mkdirp =3D "MIT"
+LICENSE:${PN}-tar-yallist =3D "ISC"
+LICENSE:${PN}-tar =3D "ISC"
+LICENSE:${PN}-toidentifier =3D "MIT"
+LICENSE:${PN}-tough-cookie-universalify =3D "MIT"
+LICENSE:${PN}-tough-cookie =3D "BSD-3-Clause & MPL-2.0"
+LICENSE:${PN}-tr46 =3D "Unknown"
+LICENSE:${PN}-tslib =3D "BSD-0-Clause"
+LICENSE:${PN}-type-is-media-typer =3D "MIT"
+LICENSE:${PN}-type-is =3D "MIT"
+LICENSE:${PN}-typedarray =3D "MIT"
+LICENSE:${PN}-uglify-js =3D "BSD-2-Clause"
+LICENSE:${PN}-uid-safe =3D "MIT"
+LICENSE:${PN}-uid2 =3D "MIT"
+LICENSE:${PN}-universalify =3D "MIT"
+LICENSE:${PN}-unpipe =3D "MIT"
+LICENSE:${PN}-uri-js =3D "BSD-2-Clause"
+LICENSE:${PN}-util-deprecate =3D "MIT"
+LICENSE:${PN}-utils-merge =3D "MIT"
+LICENSE:${PN}-uuid =3D "MIT"
+LICENSE:${PN}-vary =3D "MIT"
+LICENSE:${PN}-webidl-conversions =3D "BSD-2-Clause"
+LICENSE:${PN}-whatwg-url =3D "MIT"
+LICENSE:${PN}-wide-align =3D "ISC"
+LICENSE:${PN}-wrappy =3D "ISC"
+LICENSE:${PN}-ws =3D "MIT"
+LICENSE:${PN}-xml2js =3D "MIT"
+LICENSE:${PN}-xmlbuilder =3D "MIT"
+LICENSE:${PN}-xtend =3D "MIT"
+LICENSE:${PN}-yallist =3D "ISC"
+
+
+NPM_INSTALL_DEV =3D "1"
--=20
2.20.1


