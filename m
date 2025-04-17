Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5E8C369C9
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 14:12:58 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [52.102.179.63])
 by mx.groups.io with SMTP id smtpd.web11.9448.1744898022627447438
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 06:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=dbNDltV7;
 spf=pass (domain: nxp.com, ip: 52.102.179.63, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFf37r1cboTS9FFROnflNlE66I2LxVc3itY60OJfcci83VqwCifhb5fXg0J5I+39xeE5D1aMxtcgCyo/CmZTFmPJ7+CM5+3UYTTrPzqkOPb4pXlAcQXY1w4LZB/KAbdQCTXiVErrKcQTxUQqHcrlu5/fBwWL+U/AQr1/lvkOmo/3RnJVkPu/RJ8PzCYSblDNv7D7stmLkQu4BA9l/eKVzSCcbbO9V9Q0YxLwkHVGQZv3VBQxAruCpUMt3c22qz45Eve034soz4VrmmzkQ44FiXmgzRsHsDUBxJzD3QDyeBhhoPOJ5ta+30rz72fMLsNTHODvJMe8Nxq+I5QlhhV/Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cm2u9ijYeea1Vvol5NiylbJNEw/kAt+mo2Aq0D9zgJU=;
 b=jx4uhdWc4wXiDPYNGET0grux6ikbdRwvcIBaTOQTJG86LiRxFctf7/+OPHQbZlFhnbaXP7o3FfdaX7Ycn8BbPf6VYaQOSy1nL5QC830Pq6QL4DZ5IUDshWAyw8+CgpDlDbq83azOKipKVpIOGIN5oPp2KN34peRMcYCGFNJNwEMMhUGjTwQpWeRNhq8ioaVjPFPvRA79EE1992eNE85DwktS0WcDz3WTfchdPQ30+9FHsARXIDM4SmyusNOrAU1PvPFZHIlymr/U4rvnfNsCshMvAk0ODnPqdc0zwcf6LWNRlZCOc6rLotSGtCeWEriZFHRolli9JCKhZZyNghLqgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=none; dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cm2u9ijYeea1Vvol5NiylbJNEw/kAt+mo2Aq0D9zgJU=;
 b=dbNDltV7+o43+HnKY/qNZ5Thg34D4cHHN5ZIPHWqZD3/2XACi/1PzGmzMjlr7DYqC2VOLNYlgOPn1mF6yU3deo5bCEJihev0xl2Q6xmz6GeeuqmQL3Tcrz0In7BjsOZ63OaRAhh/3znnMTaj+DqUoM9faF1x+xNbhau63Vu9zCX7GSGKXlfDeszdoY+OqaH9uahdjKe2PctP/O0EY8BC+UywQPSKJmkOF/9YZt5tjzGkhOAzyH0/O0ATZw676/ABmnGV2g6k/5kgUFCYuN/5xkJwsO6geZ3TXxK/lA4N3g9AvSIAoqi4v308/sJJU4h+b+WEWmksL2vucRyMU6xzcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VI0PR04MB10319.eurprd04.prod.outlook.com (2603:10a6:800:231::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.37; Thu, 17 Apr
 2025 13:53:39 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 13:53:38 +0000
To: openembedded-core@lists.openembedded.org
Cc: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v7 1/7] meson: Allow user to override setup command options
Date: Thu, 17 Apr 2025 08:52:43 -0500
Message-Id: <20250417135249.1720715-1-user@yb20>
X-Mailer: git-send-email 2.34.1
From: 
X-ClientProxiedBy: BY5PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::36) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|VI0PR04MB10319:EE_
X-MS-Office365-Filtering-Correlation-Id: fa60d7ec-fac0-42c1-4516-08dd7db74169
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|61400799027|52116014|366016|38350700014|1557600111;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hzGIdAkTJMXaf6bBoGplPnfVH/cBlE8fVdnZdD7qcacZH8kIwfXq2l6omm1B?=
 =?us-ascii?Q?llZ5drHF+d/PCPnckhDSh+/tDW1MW73agzCN9sUDSglRm/qvm5uTQyPXPrNQ?=
 =?us-ascii?Q?UU0Wn/qFsTczXqB3qa6ZVxDRx6lje3R8vz+F4tADUXzoWXLBAdNbNf0QW8XW?=
 =?us-ascii?Q?CMMgwbouOhFDwdbj0xU5W6+fcDA4x4e7aXLklxGMMK5bR60ouhLciV4gLf+N?=
 =?us-ascii?Q?TNWOC1I7EpvOo1e9V335DHDHkCB22EFDvSCpPvW/21FM10nMdCFgD8WW3JIT?=
 =?us-ascii?Q?rqRexkRYZuSpiv/KELGgBORh/fTRm1OEv60/zS5yvd9Z6ouJOxPvdNF0yy/l?=
 =?us-ascii?Q?A/GJNMooSwBbwCKdhhynXqwKDS+w1wbKzAJR6i5Q3R5ivcNIQcZbfjQ/zoRK?=
 =?us-ascii?Q?DitkrIcfrXa2BLuWO5tBu7FAN2U5SQPc2wmjwKvjD5fSmtVHBOL+ckDxCdJR?=
 =?us-ascii?Q?jJPOCTWrM/SungevUAlmqU4WL6klzrujszBs8TE79yVDk0CYHvreTpevtxe3?=
 =?us-ascii?Q?k7ei9SQ36MaBMGowhgn9xjlLst2oEIEYY4aqqyF1TmWLHI2ItgW6VUA7Heeg?=
 =?us-ascii?Q?a7vmHt519IxV3hX9oQkIW70fg0TG1k1gxcXcTkZ6CxC933kK8VeHoA9UvWHS?=
 =?us-ascii?Q?sF2CmvCCuUtUfdAj7KYCUN0sei4j7pvFz9/YSHlKaZDnXvG2tSIF+/aWZAyA?=
 =?us-ascii?Q?Zrr6H0mqcG8W2lIsmGX/w/5KBd02PJkYpWdlMrl/NsYuOL5gaIGUNWyl5yEb?=
 =?us-ascii?Q?0d3vP1SIB3dL11Bl+6xCC25NeFjQy7yzKjf3w/7S2nF7b5Cbnv2sLethMJXH?=
 =?us-ascii?Q?XxoQSeAu7j1sCJbZYlGzT6w2K0CCXe6vtKl7zmE/uFcK0dP+TIabhjYFOcUP?=
 =?us-ascii?Q?ik3K1C8TC4MDNOBGJ28LKDCt3CYzgrqw7nVqJnDMdRe6t+H+HyMnQUFFPeRC?=
 =?us-ascii?Q?fMf7F42iGto76mOgwRi/+pEo5dYLglvM+SOxP46OESK4JLKFy8+QDJ0s7H97?=
 =?us-ascii?Q?/fJKFA4svVHL0DQDQZrGqjKYHCtcY3mT1ntPt10NzPuP42dBEYjjZDhxELMe?=
 =?us-ascii?Q?sWDaeyqZyYvo2EiGHbxgKZ6zi9D4f7UEDk9sFqpmbDkd3y8VA/eXhBxh3BfL?=
 =?us-ascii?Q?CIdSAqXqkpZtLqmRBfuhctY00LQ9mgKJN8wKKaYugFumZov9UIo/OW2UUx0X?=
 =?us-ascii?Q?45QARXk8aJzIIpx7J38ekNctvd8rv1dWoTSi3esfqAZFG5xr+g92ixUlJ9bY?=
 =?us-ascii?Q?1fIP8/cwaOjlLARBOeD4Vn9FR6F5QXBNO2gHtKDdTdtft9fBhNfZJUudj4/O?=
 =?us-ascii?Q?mWc/994pi2v5PH3m2Fba09MZCi0ENZ9NL8ST5Pb9Dy5ejxMAYAgtKIlERpmA?=
 =?us-ascii?Q?1EKtOJ4GL3N7GsL7uuUWhkpatVtqbrczNhtnJGbI5FqYJbFnD8soLGViuFPC?=
 =?us-ascii?Q?a9QeQSYNTSHI1nvjQnKroBGyOA6Zr5FYHTCi9bWKDrWIMHY4PUUWYvecX2CK?=
 =?us-ascii?Q?pzICoVIVn6G5z1sElDc2ef85Rw7gd/zS0SOF60T2swyOoUtKHGsSoZMv/tHw?=
 =?us-ascii?Q?ehI5R5CaOP6YcNPldf6aqHJUn7YWI6ZFiGfKPRcKX5I12w4NcMfcVMyDlFxs?=
 =?us-ascii?Q?MuMctLkyZ+DgwZYxHLZAE58WEstBN6c1sDTKAAgKnols/RPjn5Ks5HP5Goo+?=
 =?us-ascii?Q?Rkjl/SBeZsDU0F1zIFL+8Po2bS1MzWDm4Q+36T2Wjs3VslGlR5Y7A/ywna60?=
 =?us-ascii?Q?o4/+HqJSxsJgRBfACRzljwD6/+E9XV/HUnxFMXZlxmeAcBUtSimA6tJgM2TS?=
 =?us-ascii?Q?cxEn+3/jQYo+jXEFOBru8L7/PqHXp3ZsRkEh/LmtYEt4ceyY2afsvY3Repc8?=
 =?us-ascii?Q?iUAc97yfOoboz5hI6CaPVyGG2aMLRVJV5pg0GQnX/hqQJmb0Vis3qWv2+9v4?=
 =?us-ascii?Q?+93+BctogUjSkS6b2OS3yw///VMdHenelrL3O418WMXVVvX7yDzI3UqLiKkI?=
 =?us-ascii?Q?4o+m?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:6;SRV:;IPV:NLI;SFV:SPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:OSPM;SFS:(13230040)(376014)(61400799027)(52116014)(366016)(38350700014)(1557600111);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VSenTTNhC3BqaODiovYpY62chvHIHD8qrQGAp1By+JneWP55TG164N7lbJoj?=
 =?us-ascii?Q?FobWzq4ubQ+i8oG2UhLCY3Pb1+JQ51jVe+a3wSBuglXt9fqzPHUbfoKUfUGD?=
 =?us-ascii?Q?dZ7j+ygGm3iFG1B/TcIb6zkXdEZuYLgf9SIve9I5UyJm8T1PElh0L7DpKYgF?=
 =?us-ascii?Q?SiJoEPdtmgbkmwIGbyqTVp5S9vYtEPqtutj6ZLC3z+QJ08VXE4tNlFOVlMt9?=
 =?us-ascii?Q?pJiftcJAx8wsM1e6CNYs1ebJTUCOdSd9UKvWWKHQU1I0jNFw2v/I4UDdwV6a?=
 =?us-ascii?Q?uol+byj4n4IwXuEBbzwq+tHiR3ufZc5N0FxmRU3ft/sv9oFkc1ofGcKunDH5?=
 =?us-ascii?Q?zsx2N5xYgjv64qJEKBCKJ/S75Obbr5xAdda83ayxihSNEFyOY8/g/7DR0ndz?=
 =?us-ascii?Q?LGdhLoafz1ZxCGoJCa3o/WVB67rtYLDO66V6Dafk69Nwxo5E0AtwWW4ojLig?=
 =?us-ascii?Q?4QYUA89sTdsWCvRubO9PdTM4lusselBgHpw2NHI35qBugAMyEf2v8b8ikokD?=
 =?us-ascii?Q?18dKRjFmx8Q/Iq7du4Zk0IXxCeSvCrM13mnmx+Qcwveqzt++D5P+5A52QZs5?=
 =?us-ascii?Q?JRGg8kj1Tc9yO/WJ7lXiDuOsLkox2RcuveOzziY2UXpxeoy7HvvAaP6CTmW/?=
 =?us-ascii?Q?caboyk0GPBoaqxX+tVeRGVJ/Xy0e3bgGs1UFQk8j2I9diDu73UfG2Vw3LQv4?=
 =?us-ascii?Q?yEW1lxh1iDj/1IvaQduAfLYKP8NtluojFq1A+hfP/hqKbMZ1LPM13kBwCEES?=
 =?us-ascii?Q?aBfU+a/KhuHQwzOsKwVLfFvo68jkqcmTJ8lt47IZCiuIpJlpRFEcpik9xMgr?=
 =?us-ascii?Q?nJqz/Dr+Mz6QM99xmAckYiHq8CF6dLyOh6kHkklx0VwLFhU+keJO5ceABpeS?=
 =?us-ascii?Q?znlBASmroLFxSUGPi3PozDfPdmZTo0rLh14ktYt+t0lirMj6zc3tfU3A96+w?=
 =?us-ascii?Q?K0OfamP0dhAVJRFXZywQFmX8sWdDDYUzi9EYyiDATda1fUgLPP1Q9fug0UaU?=
 =?us-ascii?Q?pNdEvlCdt6Urbd1WmsPQYGwBn0DQETuG25EI+X+OANFGgqz/VHE3WOKiY7+8?=
 =?us-ascii?Q?eFPBBDqbtPa8iQIOyV0I2Aka1+sVL1Aam2u52sSfYdOSVb4JQvmlYluA8WEL?=
 =?us-ascii?Q?VaC7JAv4h2CVePcqy/9Eje+PlolQWixxcTpPWHeiRjeswFtXlLizZubU8saD?=
 =?us-ascii?Q?U1Kvy8xBUQoFhIJB/tX0yV3sfUKbSDhBJjKZ81WbVldB/ivPF4vg8Kb3Yvsn?=
 =?us-ascii?Q?2FXHpt4LxId0Z6DPKuqrBeGx+0H8QkLk6m38oyaEjjCE8wUd422/P17S1u/L?=
 =?us-ascii?Q?Jw5GkQC+2p+1GZYSPYFddjgWgKa1ZuYRNSosVwqgcu7uzzx3O358cetw6McF?=
 =?us-ascii?Q?q6bC9berhwhL3+7J6GAsP5yPSoZPsAnC94lexKJvLSFZFT4ktXG92ck7AMw6?=
 =?us-ascii?Q?9HYmwcghRaS9P/tkhnzsqL+MygndjgNuo0lZ/Q7ML2TKeWf5Mwc7h7l5Hvqf?=
 =?us-ascii?Q?XOEqgsSV8VYVeEPKM2At8daM6hq8pasfazxBLPiWAWJkJr9ZUSF5qqsxjR/r?=
 =?us-ascii?Q?nQiJRymHdtYAWDV+dEzBIirQOQp9T1ji8iddePTH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa60d7ec-fac0-42c1-4516-08dd7db74169
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 13:53:38.8213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F50r1/a7N7Bp5rXOgbMCfyZ3cmhok9laxB9pFU7LpTvy9kNqBd0rpeUaI8ndshixnIjrK+CByg22/hKv+bEpSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10319
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 14:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215084

Caution: This is an external email. Please take care when clicking links or=
 opening attachments. When in doubt, report the message using the 'Report t=
his email' button


From: Tom Hochstein <tom.hochstein@oss.nxp.com>

The user cannot override the setup command options --cross-file and
--native-file because the meson-wrapper places these options on the
command line after the user options. This problem was noticed when
trying to build with an SDK using a custom cross-file.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-devtools/meson/meson/meson-wrapper | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes=
-devtools/meson/meson/meson-wrapper
index 7455985297..3aa1a93520 100755
--- a/meta/recipes-devtools/meson/meson/meson-wrapper
+++ b/meta/recipes-devtools/meson/meson/meson-wrapper
@@ -14,8 +14,14 @@ fi
 unset CC CXX CPP LD AR NM STRIP

 case "$1" in
-setup|configure|dist|install|introspect|init|test|wrap|subprojects|rewrite=
|compile|devenv|env2mfile|help) MESON_CMD=3D"$1" ;;
-*) echo meson-wrapper: Implicit setup command assumed; MESON_CMD=3Dsetup ;=
;
+setup|configure|dist|install|introspect|init|test|wrap|subprojects|rewrite=
|compile|devenv|env2mfile|help)
+    MESON_CMD=3D"$1"
+    shift
+    ;;
+*)
+    MESON_CMD=3Dsetup
+    echo meson-wrapper: Implicit setup command assumed
+    ;;
 esac

 if [ "$MESON_CMD" =3D "setup" ]; then
@@ -27,5 +33,6 @@ if [ "$MESON_CMD" =3D "setup" ]; then
 fi

 exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
-    "$@" \
-    $MESON_SETUP_OPTS
+    $MESON_CMD \
+    $MESON_SETUP_OPTS \
+    "$@"
--
2.34.1


