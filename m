Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0620CC369A6
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 21:18:44 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.24])
 by mx.groups.io with SMTP id smtpd.web10.59866.1744060717594523402
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 14:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=qKVfanAs;
 spf=pass (domain: oss.nxp.com, ip: 40.107.159.24, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VGfOjHO9hxPTR5ZuhSwRbx3aCgH1ViHRLHYCnvYI1wsJJ2Sm/ygGOU9TBMOa8fc1a78Vl3NyuOpawO+DgXDDhajvjnud/AuU4+9lGiVaPUn8U28thtLAji2MC0w6vPOImwZSXL7X+kWaELTQI5/ifx6eGUTU/EKL6mgbEVUW1138aWJkTo5sw+KPpB8IEVhTlVuvEbqfWNm28/WZQqTIuoZRCViG6HY6gvvex+ddC6zFq6JxoPqC2OHtvgXy1pKsYdBbrsDLyulT4IuBLoDQkIC0xlbHdVO/OgoTCs8xN7JgJnfarRtv/g39USfKDiMycaY5muBNDD5mrQIHW7Hb9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FO87xwqxP7d00iPFCh0YkZyeqnOpOG3yddk373tQ6Q=;
 b=OGhJC1RWB7HOqBOV1nQv2oYh4iakbxb4W8Gbvufhuppz4Hs8x208sU/FtSrwN/y6Bz6CAMmuKLsAmAPUWN4X51zkYSsFm7aqsiZ00Di3/04yD63Ru3c4eFyUGFsJEdv/gTUFlxYLevIPpzCK6MNUT0vuStiPZPh+MBrTYq2kUb9ihJaunrbM7UITtq8qS5lO3uIa1GkZyrsKS4AuVYFA0tnThoBjoPBNHw07Utu2pSFxVD+aBn02ECuyyhHqMu+h6iyMC+WcP34trTjy1/YW5hOhTalDzWR+w+u3zWaDB507WWJkYDG4+BRuF4CNO8YO8xasy0mqqRvkaaWFXrZg0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FO87xwqxP7d00iPFCh0YkZyeqnOpOG3yddk373tQ6Q=;
 b=qKVfanAsv+l5ktzksNVS/qHn3DaZr3k266F+fTWunHYk4kIM20eMBeuy2+wefXuRBZBuBNX4C55ev6xDH6pmqf3IFze/Rw3L1CCI9IjBue9h/dnQZaSEdy5RsdWtGyhWjZOMD5PnYqgiv9M410+NQC3MqzU+dJS+DLto4Atl4akhPiKjGlJM+edkTlk1V0+i43V6JJ908ZdbxtFtD7DwQgBxLZsQMthmq9QpbLScAFyIwjLEX0krhEFzQCi7gXvB/dhwMQ3UJbXLL+1WBXcj4QbbXJ49XA6x08cY7FbLgD70pAhAy5Qr6mV/BC6BAsX/OPbq6imy/bt0E4CWFnArmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VI0PR04MB10760.eurprd04.prod.outlook.com (2603:10a6:800:25e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Mon, 7 Apr
 2025 21:18:38 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 21:18:38 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v5 5/5] meson: Allow user to override setup command options
Date: Mon,  7 Apr 2025 16:18:06 -0500
Message-ID: <20250407211806.1782316-5-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407211806.1782316-1-tom.hochstein@oss.nxp.com>
References: <20250407211806.1782316-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0164.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::19) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|VI0PR04MB10760:EE_
X-MS-Office365-Filtering-Correlation-Id: 4784820d-929b-4021-c876-08dd7619c3b1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vi41Tk2gRIghiBnpeqbR7BXGwC6I9ZdeRa2YupTpdARNHne3PyYpq/4qpdGg?=
 =?us-ascii?Q?OdedtdIYCeNzqt3/7e5KQR8Cx0zxlAbj9JyuRkKKn06XlIrNj9Zda7CyE45b?=
 =?us-ascii?Q?sS0+9Ftjo9YuSjYhZpgOgxp7+WatCIhapW7b3HEc5MKWV5vYlyDU6PHKadDp?=
 =?us-ascii?Q?akn+T+KyJJ7SadCskFygvcZYHGiLIfjmmCHGCpH41oZaLvzT96i8BPbezlKz?=
 =?us-ascii?Q?XHaUv+/ODKxoZlHkNIDMSFqo3YC7eqX7ua4F55Nic1awCKBxWtBiba9q4i0L?=
 =?us-ascii?Q?w6JNPX4Ca58ueP9i88jvgZtNCw6tI92I3vYs1tkb/rhj4ASv0oAgzM8HSMeM?=
 =?us-ascii?Q?8UG0WJYaD7n+NjS9Z2yBAIu+9m24rFO7N6Xea17yS5nZQmhzhH2Zg61TZoYq?=
 =?us-ascii?Q?MP137bDrcji4ZgUYx7VujlRFRXDHzeBJpeJGyl1MOnd6qoV6gGtPSm4sW/Cc?=
 =?us-ascii?Q?7cx5zRxaS5cQ13hhpZqdf3qyaLGUGFdCDJG9+czfMRkovNOKx7DVcx8hL7IB?=
 =?us-ascii?Q?GAd5wo0r/xPB8UaUsNIffqFlkbBNjVd1SZmWzjbMkZAw30FI9NE5F8/Ea49T?=
 =?us-ascii?Q?0hwQJfkjj+N8I9EEyk6rBmRyJ1bfB9YVa127Ps1lFGH0bzxeAUuM7PAHsPAP?=
 =?us-ascii?Q?hItMt6KvDHwGZr7dDdm0ZkaZhx7jgTiZeAbjqvyNJFKid5DHShYBVOacivFc?=
 =?us-ascii?Q?b7EbBHlJR2zqIMk6+MfBtAbUT/7jSD3iOZC7QT2lppvfFztnkwD2nc1AfX0y?=
 =?us-ascii?Q?ZsbsaUWUszRIz6Ifxd+Nuz5pSijA1Yx8LEXxYVj07rC3T8IWlmMHrZYsx0FA?=
 =?us-ascii?Q?wU8wp2DH6TpcP0PL7SugjdOjLIGxmNg0RmwaiLOIdS2u8d6i70t+uVKPpZK3?=
 =?us-ascii?Q?2bjfjzQFkoU9VcSHBBTRUSMwhRNM399F0yEY7eO6Js1pB6Beu8vE0k1CAS8n?=
 =?us-ascii?Q?Ddq0oUYyY+qObcxL5dt1KSEu0TX/oqsTnJ5c4PnwAmWqWzmsbEB4Q6BOVJi9?=
 =?us-ascii?Q?gKa17gzR80Iy3Cf92j0L8/rKBDlBQnliVZqcb7g0uwGdSFiWZvXsX3ipEo9U?=
 =?us-ascii?Q?JYHus75ghn74LQMzFjhWngYKiEJXdYskjl8AikiojkTQSfP+qzTQIFB8sX4n?=
 =?us-ascii?Q?twNEfuqnyVnd0K1TWnjsTBkGgmXWnz0+He/zRPpkogBCsBuDE10GCMNh+MUr?=
 =?us-ascii?Q?EvMLbNOua4Sa7kK1rSv4MBLju5SoTbk0sgPS9/JWlE+jF/TB7KjSwnA53Wx6?=
 =?us-ascii?Q?AB1gglrIV+mThOeiEFHDpcIt3tP/+W8+scT88OtIv1LmnRlEfzJ6kB3lIUI7?=
 =?us-ascii?Q?67qjbsxLKaGpz3Bc9NvcW8gN1rjOGXIfkcWXmOefo1HfxG4MZM++/C5WCDff?=
 =?us-ascii?Q?i4fYy9Sxxd0p5tk79rgUuLZ7cyDtZ7U4o/UpJwWVy+ska+TOi5AM9fjRlftE?=
 =?us-ascii?Q?st6waYgydtlzgNtd3t4QsF+JJtWVVkiO?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?K81dKL+5HObJoX790pA1U/lViwzXm/fFUYhKb98BMF5fJnuTBlSJDBgFd52b?=
 =?us-ascii?Q?i1LgheTYKZGCuNbsYWPZAx2p/Tim0vx94wPuMCUV2+/XQfEpUgQ10dEOcMdR?=
 =?us-ascii?Q?VD8+S2W7KyXct4d8sYEuhIW2L3eRsodjCJLrv/NO6L+BjlOXXJvMSFGOi86Y?=
 =?us-ascii?Q?ivduROd0EMlJ9ibaX+wS7+APr0bAMUl1M3WdoZ8XJPqhDn5BnmV+QoNpzDrg?=
 =?us-ascii?Q?g2weCBe+7pajNqFWdbl9IEmAArl5FZA3ijiAcdRbMXgpuIvx6Lkaor/D67jc?=
 =?us-ascii?Q?kH29+0mimxxo2CJLK57jBnwUdemr+8pfb/2ZVyWXCZUwyH1qk3bdSakOo9iS?=
 =?us-ascii?Q?o2Pkg4tmB30DFbjtw0w2AeObR5RuwAWSCAPCHS/7YNLmretzm8XTUY8JPb1b?=
 =?us-ascii?Q?wwx3lG2sGNiyYltyh1PSU9sNOjL0++vEopL73C3rXaVLJpjsgNINso6Iox0X?=
 =?us-ascii?Q?MXSV2ClNz2W37ia3zNcJpkmK9tWRn4ml1WSiCbT6l9Ag74QPNR5dWDdHAOcE?=
 =?us-ascii?Q?1kqNAwcZ4NOC/BiMnruqxtEGhc0uhvJOguGW60E4gYDufO8ugRciLHwp3rVE?=
 =?us-ascii?Q?mMnR6+ZhGc/G6l0VW4cbAVdY+o6JpvS8s2dQBlVFAVAv6BTEV2WWE1YVUtws?=
 =?us-ascii?Q?vNirRi8li3QniIrwUBO4tKhrqisZgFFyqZo8rrfUR9KiLEcs9AeETetNp1Ah?=
 =?us-ascii?Q?PQDL1TNtsnValA9v8YyRHRJvxYnLrdAi6Ru5WqIxZ0GqbvUvnmDeJv+4FXBA?=
 =?us-ascii?Q?20uEBrKhmJtjo6y+m/rWqK7T42E/eEcJh5/fVUpMT2dMQJETsbuvtB4iCyYq?=
 =?us-ascii?Q?81jRopwFW1uWF2mzbHZOrJlM09/LtlErewl5sqUkwNb0QjCyIEk6GRt3QPvk?=
 =?us-ascii?Q?UI9cOkji4A+BihFQigFMFcRXLkLTDnImkPibvebGfm9Rn8EvoO9RZVHvXWNx?=
 =?us-ascii?Q?91tCw+NSzWV8rQT0Uc/oXV2aXS99JXFW619j/QyDVqGfabSe+zi47KaM/tVK?=
 =?us-ascii?Q?AQoFU5tdsqu/zpXrllJ425/NW4A75fiPliQVqJ4Pu1Je0HaCviz2+eY37jLd?=
 =?us-ascii?Q?lxTMz5t2F835lohz8k99wcqgqZVZl4IwklasvGL1oWGnOtqDW8rxlL/y3XyP?=
 =?us-ascii?Q?W8LYmlxq06ASXyvIzKSWzBGq1BtDf1jhmWDSskvHf0HzZrbkd35o/5mMq4Zr?=
 =?us-ascii?Q?zruR2ohe9DyUngiW9l6FWkSeyr8QJ33IcQJ5QKWZ0dE52C/Hjb6MFN28L+/b?=
 =?us-ascii?Q?lUGDjhnF2b17wi8UW0jpOHPtWpLe8QVp+YlHJe02Cjf/FU3D+5RkbEwDnlBm?=
 =?us-ascii?Q?X/q2y8dc+2XRsAedkGqlOVkikqwrpq8RqRege/E9mALzftLyZvcKVzLET2c7?=
 =?us-ascii?Q?gK1dE/3sFVmQMBNNjXI5deSOBrPdE4cTvhCLZqEPHAso1eg9b1G+F98H33pw?=
 =?us-ascii?Q?4HN/7SXFDd1iJt1fNbIUp0+uPsNqSoN3PHjaUXUDWe0CdEXIFtknCxOIv/VJ?=
 =?us-ascii?Q?gifBVmRLbFq31kXvHxGIXR0KvLQwdcgLarxX581fe3s6LA60ILpqvD39r04A?=
 =?us-ascii?Q?FkfcHDHPBj/Drv3Ahc40uJrxllaXvbwQ3eh6JfZK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4784820d-929b-4021-c876-08dd7619c3b1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 21:18:38.7293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QIuzJcmKMtqwy+W6NhdENRUHYeaUhXB05TLAbWyms4sS+KKRJv7XYhbSydbg0dXPkKbylHdguFxshxa7EYWqrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10760
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 21:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214481

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
=20
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
=20
 if [ "$MESON_CMD" =3D "setup" ]; then
@@ -27,5 +33,6 @@ if [ "$MESON_CMD" =3D "setup" ]; then
 fi
=20
 exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
-    "$@" \
-    $MESON_SETUP_OPTS
+    $MESON_CMD \
+    $MESON_SETUP_OPTS \
+    "$@"
--=20
2.34.1


