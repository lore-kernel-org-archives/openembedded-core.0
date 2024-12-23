Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D8BAE7718D
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 20:05:26 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.77])
 by mx.groups.io with SMTP id smtpd.web11.20895.1734984317855565748
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 12:05:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=cQLgKlNa;
 spf=pass (domain: oss.nxp.com, ip: 40.107.247.77, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jaNvWfB3aYdBL8dFrnmbxTQDsHhU9Cbrl4Ul/jpwEk75nJ3QeB4kUol+nVtEeFUYHqrIWHdTGVxlw1qcNSeQQnl5/pnia9N0qrnMDKGEnXT4h0AdDPrj/QPJVY6W2rTkqTubd9Nqj5w/HhJkjryvW90L+Mp4bqQQVks3uDxKojEBNJqwWWksLHM2ZJzF6xFcVbCrB5zN9lK7TjtBjBHbEhNvWvxSeuES2dcRFbNcmMTla5+dQN/YCIVScvcU6U5gHc4p2jVnii5qAoU/wURX7880tQbWTZfaDriHZQnRi1Ahs3oOEFxyeMFfPDxcwvHh0l9FtjYSNWEloGMMQQkaKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHV92y8DSYfToHl6jXQa4dt4yHKHiEzMvXmZcYJB6OM=;
 b=tCkWwXZtLfJuKqmeN9HtapMJOH2BaWP/fsvNRrzKtrMR/pqhgqanLqsgECag6hZKvoQMiJ+YypqjTA10SJodJYOGJ+w9eVHtL8PESzQbXfoWiHeH/cAmiB6eZ4ieLVs3Ykr2s+ARI98iephuRvpmxCHs75tvDIUNLG4Y4McDVfiKFdPxBFOBCaoETmCBdJu2+lFJqXB4SHumGjk0zWAiK7OJJ9BaJzrgSmS9Txnm3BDREAvI36154y1ckiFxMuE4U1cOmjAqnErcZFIAdD+lwwgIOcZrufbCSHajmUPnWHLWpXFTURL9OEf7IDNcjd0N0DNAmXyhWEPiMKWpwI+sJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHV92y8DSYfToHl6jXQa4dt4yHKHiEzMvXmZcYJB6OM=;
 b=cQLgKlNawEzrfvCYkME7yB5dxXUv1V66gOSqKc/pSipp+R/pUh9O+iZMXLs+OO91EVT9f+zyQETrh+Va7bC6NfaM53BO9YRnEa/wQ7XnBfWnph6OcdJAgEMydeD86XkzxkY3BgjafxUB5ln/luGd7POOIvzikkcH+CKVYyyPgAUwdwZ9Fl5ki0fqzPea2ppTKr2a8XOXFUKbMnWk3xSDiBxZDqUuSgt8hIeq/L8DVImZH/DDhItc9QlUPkREGwpPKVe0wA89NoYTq8ehWY8fWSCS1R2Yt/GdPr1mgw4Nssc+F6KVXXBaxU0uIjkIa/0icJE0EcT9zLRPqg8Surw7IQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAXPR04MB8157.eurprd04.prod.outlook.com (2603:10a6:102:1cf::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.19; Mon, 23 Dec
 2024 20:05:10 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 20:05:10 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v4 1/5] pkgconfig: Add pkg-config-native to SDK
Date: Mon, 23 Dec 2024 14:04:52 -0600
Message-ID: <20241223200456.2504683-1-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0003.prod.exchangelabs.com (2603:10b6:a02:80::16)
 To PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PAXPR04MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: 13f2cb11-d0cc-45b2-99c4-08dd238d1aa0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?krYylcRcPW428iuXmzipBxdrk6/hSthjT9P5/orOWHTySOunnxPvQAUyLKHo?=
 =?us-ascii?Q?d9XbaseYxNYId2bz4Mf7XMN61paCCxm1qtOutdGbKanCOVkFLm0CiKBF15Hx?=
 =?us-ascii?Q?BgI+5/0CM5mN5nMv9LI3/uoajRFA4aGwUTmi6czlM/fpOqDUnd9CgPJXb0Bl?=
 =?us-ascii?Q?YAPAXiIj5nFjFA4k28o29HWw17tiLZBRzoHzFsBdm7bF1C/S9Li2JTlNod0h?=
 =?us-ascii?Q?FE1Gse85i98FZY+CN5OSFr+ow5ZXbHCO1RUAwct0i9iJxWuXiNYXlBow1g+6?=
 =?us-ascii?Q?2xqpT8jGdbhHcB/z17rrYPNM+KKrj8vXSy4mACxyFprOqziaTzoLskj7op7k?=
 =?us-ascii?Q?A4cGagK91h8WrUBn78iKJNbpX+pax9oztgwV8yc+EgZygBUGbeWg3Wp0NH7S?=
 =?us-ascii?Q?D92FU9orHd8CAmByhCCSCzb7DIIBneCQAz/vkgI9icTCVW1BULvfKtlkKSIl?=
 =?us-ascii?Q?p5lvIGXYVI2ykCcfof4ptne4qr/T4j5pP1uTGkYC8M8M36f8nGDqqpRPGUJ+?=
 =?us-ascii?Q?wj8f79QJcvLxwKe3ri+d4/IyrxgT5Kbd9EIJabohpZnStrfwRbtMggYC5r2t?=
 =?us-ascii?Q?A1JB0CbJKv2NYBJepaI0VYkA7yx/+MuzwTv7yd8o2TqqRTdhQ3M6UIq4jzj1?=
 =?us-ascii?Q?aFvUvP5fQF0dKMEqhY/a+48YkPbJ3JrG01no5KQPZikOM978AyeFtCO5+QG+?=
 =?us-ascii?Q?wkRIfBzPywLN/FrxTBYUmdQAUGfhDkobJxv73Wdw/ldoh4tBYPxpyo9DMSuv?=
 =?us-ascii?Q?a7rpc28E1q8AKWaoR88FdzxmruWiUD1EC/FuKfHrPbvs6lCXLDt68qhfvWFz?=
 =?us-ascii?Q?QkgXkDFuhbCD3FVwxlchysS8D8NJPjiu8ufQzEet2QFGboEIYo9LUADMF1a4?=
 =?us-ascii?Q?AnEJLiW8cqVot5K5q9Dd0ZYHwGH473pRTMkWgAcIF5+jtcDyVZlFDZS3I7/y?=
 =?us-ascii?Q?aSV+c3UKItcw4inTGFYmqoAyT26N/do72+K4zJDOcBiu8q36H7wh+duS6uuk?=
 =?us-ascii?Q?f7kbGozQMsQ3rF3pDRy1STsZj8bOZsffYGwGHhQKD8xqDlxgpy9elBX7CK9i?=
 =?us-ascii?Q?DlPaCCevB8AcDKjFto2Rw7Fb//woRP3eCs+SNqYIb6KowOkPKDBpE8wj1Yy/?=
 =?us-ascii?Q?hGSBQ3Wyxpsb4DNnmOvNTuqfSz8rMvAXbNF3808XNAsH+andXaSU18Ir0Yju?=
 =?us-ascii?Q?nH+pibijblZo7VRjtuejTlvpCzsVHvI0+jTL3H/hq484TeS9x99+58BO7RCB?=
 =?us-ascii?Q?1W+6cWrt/OtvQ/im5oF8u2sgnuwukjiMYyvcph/VUNMPBCUElHFHvP0gNDDO?=
 =?us-ascii?Q?dzPN7dPPESQFj6OYAPrFDcdyo+sQYep8IuGlLo9ha0r61ED7RV5MKnz2aJ7E?=
 =?us-ascii?Q?Qv3lxv6IWjoIVSEEj2Ul2oONYFu2Dm3kHEcR3GvsKIyvrhaAyUP+/zKWhO9a?=
 =?us-ascii?Q?KSXDDZkxyYb5ZWbmUK1BVlEhH/qtMT2+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I4kyXprRIXnHbxGsL+A7lE5AvY9JC7NNJJwAShnp/wxWLDiHCRETe19CHqIz?=
 =?us-ascii?Q?/dy5Q/mn1y5w3FF5ZyZ7grRfVgrLQ8YNad1g38u5lrItDTnl/2qHIwxVCD4I?=
 =?us-ascii?Q?vhaefAds1C4UHCvgto3G35JjRIT+BivCOvJA9mL1PiFVkTY5gaqC5kHd9417?=
 =?us-ascii?Q?i9qnxesgyzh9r9wIsSAle04ESmdHliT9CtMnyPhoYWgsgcJCYzPnchibGDCZ?=
 =?us-ascii?Q?AmJ4IgGNc4slmPW89joDS2buCj5osfe370SiiK06qvqnp1tvWnenN+HPD1F0?=
 =?us-ascii?Q?Ag89gjf4SJnyn0yUzJWDqRutG75nx9VRasO7ahV7xgcBZQZS1VF+WeJBKUml?=
 =?us-ascii?Q?oE5lul2Ia4u83sql1eXS/47C7fUpn75sJYX3o1UKAChsvi6rEd0TfevBs9tV?=
 =?us-ascii?Q?OracleG3GIXespr/hmBelsdpzjfZjXWaQHDClx754cnHxATtuUhIr1WDHc0r?=
 =?us-ascii?Q?j0NYEgOHv3gguYoL7jlD1hTkwEU0W3reVgluZU3oEchYx31YDm6vYWsIggSi?=
 =?us-ascii?Q?aY6vfNumiG8pkNBMpBJujhD+8NYOg5IVJim4dbwTElLjpr6SId8hmr50NSq6?=
 =?us-ascii?Q?OdLuT+FWTs+JckFl4mOIkGYcVmicZqc/bfOoYoR702w8NEVhr+nDltaIj1HL?=
 =?us-ascii?Q?WnnOOOTyStvJcNdi6eeM8DXuOHcLKrD3RlTZ52hXTAa0u8NznBKkVWrkid3P?=
 =?us-ascii?Q?J+a2hALAt7v37vpB6faDa7jpA5HgFwVJqx0cD/gaj6i6pXPZgTY6cUvYJQUk?=
 =?us-ascii?Q?djVUjH6wNVJ8pOFub4Of6R9NUBhn7//NzdqpsgoPOAR+9QydqgQHMxl7v4S/?=
 =?us-ascii?Q?zncfwG2jI+lZDMtgRaC9c6OQxy71FBOBkRs/s39pZmrUIIveuB3D0eFd9Fon?=
 =?us-ascii?Q?2NXqrcKVam8Je8K5mkXjXRQCwDdZ1+WXe/1FL78VDcGjXRaiOkNJezPG2ehp?=
 =?us-ascii?Q?U6HePUwyAKmi66khu4zIS2mZMAOjngtF8IVDRipMIvRArKwPbDP7HMV/CC2Q?=
 =?us-ascii?Q?Pv1sma4sOce8qvRHuw6Xmy7e1wHkoncr+3LqBbMbB+kQFr2Bi+6kUEuVy+eL?=
 =?us-ascii?Q?LOYpM9soF+FucJkp2egSZ4ylQlA3q4l5QrjttJsX+49wJdNGjnpVMhYtath1?=
 =?us-ascii?Q?AaVk2sTUDrxV3R1qLROIMmoAbW4t2Pvh8BLR/RRXqYnBbOk2jZ60qCXtcXYf?=
 =?us-ascii?Q?Esl4PLKNXSqqu9vD7rNTQKrpQfxFd5nXn1m/K2+YDGGtjLwg5LdnH7RyqTPG?=
 =?us-ascii?Q?9jhNlnJOvaQRR9qn0J9Ql36/USZux9e1tf4vd8VKKKgLZvJoukB6YHtN4z9p?=
 =?us-ascii?Q?eEec0VLvvMKo0m0l3ERhHuCPfdl2E3aNv8GJQqeMcbIg0Jjr7tWjzvHu7wJT?=
 =?us-ascii?Q?fW5aY30M04Vn3Vvf59vDHGOoJ7pp4cVSwNgOGhmGvPjdae8AfVoX0Zb42eyU?=
 =?us-ascii?Q?s5eN5daG384lW5hPEilLmN46N7fm6TNfjWcUj4LUgMz6ZTiZb8NAphhlTTX6?=
 =?us-ascii?Q?+ld3NFJmb1zGrsnljptX07iKlELy3rUfZr+JqePtj8s2t+luosZ2LKRDBvA7?=
 =?us-ascii?Q?5bzbDmt7Xu8DTHvlMvTbyPN0IRB1zxYyX+RJdHXw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f2cb11-d0cc-45b2-99c4-08dd238d1aa0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 20:05:10.2924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5q7iE0aDJKVHcLslwOA2QT3ibsC8SPL7K/b4qGLmSl/Nw2ws2LfYH94OEQVV5FAAlZFKPR3rBVGpHVbbdeb4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8157
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 20:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209048

Building weston with an SDK fails to find pkg-config-native:
```
Did not find pkg-config by name 'pkg-config-native'
Found pkg-config: NO
Found CMake: /opt/poky/5.1/sysroots/x86_64-pokysdk-linux/usr/bin/cmake (3.3=
1.0)
Build-time dependency wayland-scanner found: NO (tried cmake)

protocol/meson.build:1:14: ERROR: Dependency lookup for wayland-scanner wit=
h method 'pkgconfig' failed: Pkg-config for machine build machine not found=
. Giving up.
```

Fix the problem by extending the pkg-config-native wrapper install to
class-nativesdk.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipe=
s-devtools/pkgconfig/pkgconfig_git.bb
index 6f13d0177e..2b298eb5e8 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -46,9 +46,9 @@ FILES:${PN} +=3D "${datadir}/aclocal/pkg.m4"
 # specifying an appropriate provide.
 RPROVIDES:${PN} +=3D "pkgconfig(pkg-config)"
=20
-# Install a pkg-config-native wrapper that will use the native sysroot ins=
tead
-# of the MACHINE sysroot, for using pkg-config when building native tools.
 do_install:append:class-native () {
+    # Install a pkg-config-native wrapper that will use the native sysroot=
 instead
+    # of the MACHINE sysroot, for using pkg-config when building native to=
ols.
     sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
         -e "s|@LIBDIR_NATIVE@|${PKG_CONFIG_LIBDIR}|" \
         < ${UNPACKDIR}/pkg-config-native.in > ${B}/pkg-config-native
@@ -59,6 +59,15 @@ do_install:append:class-native () {
     install -m755 ${B}/pkg-config-esdk ${D}${bindir}/pkg-config-esdk
 }
=20
+do_install:append:class-nativesdk () {
+    # Install a pkg-config-native wrapper that will use the native sysroot=
 instead
+    # of the MACHINE sysroot, for using pkg-config when building native to=
ols.
+    sed -e "s|@PATH_NATIVE@|\$OECORE_NATIVE_SYSROOT|" \
+        -e "s|@LIBDIR_NATIVE@|\$OECORE_NATIVE_SYSROOT/usr/lib/pkgconfig|" =
\
+        < ${UNPACKDIR}/pkg-config-native.in > ${B}/pkg-config-native
+    install -m755 ${B}/pkg-config-native ${D}${bindir}/pkg-config-native
+}
+
 pkgconfig_sstate_fixup_esdk () {
 	if [ "${BB_CURRENTTASK}" =3D "populate_sysroot_setscene" -a "${WITHIN_EXT=
_SDK}" =3D "1" ] ; then
 		pkgconfdir=3D"${SSTATE_INSTDIR}/recipe-sysroot-native/${bindir_native}"
--=20
2.34.1


