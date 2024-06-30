Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D4EC27C4F
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 09:25:35 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.92.59.91])
 by mx.groups.io with SMTP id smtpd.web11.22263.1719739531334073290
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 02:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=h/8vvLrS;
 spf=pass (domain: outlook.com, ip: 40.92.59.91, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7yLuhhpekB6X9G0flfIuUPmV2+thA/8lXhCMVaUSOABsMZ5AVDHom33SDZK5KU8VQqk6UtEvcxqSlxH+D+Sc8mLONXd3NjA134DY6ofmHk1IVm2DLh6mGBVIjvBkYAeF6Q0rMc9bKnI4g/SqY3gqdqmilAwlBY/y0wM33Dka2PCzid+W0M5QMf+4LVUnogIq5sJu72S0DEyOp7j8NGIr3JKnOuSNBfJdmvVM/OoKT1kflzuh+Uuft23Gu3lXwNsssElwpfzaUte8GmGGqWjo8CNmOh28jp+vME780HQ9gvyFUhUUe/nMwOaZQDaTYIfAVSfuiBte/Hnf8M7yBaypQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdBTqDtSuqtQGrslXhGKD2SLQoIoCcjqeC02+8hteW4=;
 b=d6F5PQOc6UyjiDlDgWDk4MUpM2Tt/iQLaygsyJ3JrOzLoDijx3izdaVfcbQkzjTmm1OFKJ0rRrkrTHuXdJuK8/4QrWZkqcNpIxxs1YBQUWNzr6/EbL2aSkvsfRDS2cvn0fflCthNMbiLfSpEVaZYTzJJOEh4Ma+rUFKAq7taBlCb6wkMz2xUnuHce7pOKi1tFuZNOF0MgEnFBv8Ga1f2+z29QWt0pWAQHc2XBtJDnqPKMvA+xwNU4Dt1OWhpfkW+5xCHatULbOYyL3pEfwDg2DG1yibLBkb9qAcZleMBe6K1mVpVrn5V5Im5guTcRnwW2LZ+ZxuvyJS2vwAU/lGXDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdBTqDtSuqtQGrslXhGKD2SLQoIoCcjqeC02+8hteW4=;
 b=h/8vvLrSUG+0OneeYCqgPXuVeQoSycB2A47ZVak9DdQCJvY+Sn9NHFyjH+5GOp4Udp03d/cmZK01fpMwHiSK1C/vuu98jaytyyTUhW4zgT64AyOFCpoD41FMgBlOMwWTN5nVulG2aSqyZvf1GYtiAQZMb9KX8/igAJO9VpeKHPiJFzsaFZhvKxsEUP5S4ddEFpl5nNZpv/ANF0Q+eC8+Lr3rcdBKpDfNgyGN9CPsCdoabL1fUbJyCPuScBLz/jNbpBkB7ntftkUtcJPUnouOXvm3j/N6ryzi9l5eQIPo5EGP461Yeyb9v9TZ/TotBdWvQGpkK9eDbubYsDTKdyxqNw==
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com (2603:10a6:150:80::7)
 by AM9PR07MB7300.eurprd07.prod.outlook.com (2603:10a6:20b:2c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.16; Sun, 30 Jun
 2024 09:25:28 +0000
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a]) by GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a%4]) with mapi id 15.20.7741.017; Sun, 30 Jun 2024
 09:25:27 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] python3-docutils: fix interpreter lines
Date: Sun, 30 Jun 2024 09:25:10 +0000
Message-ID: <GV1PR07MB91203857CFAC6393A256F929A8D22@GV1PR07MB9120.eurprd07.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [xcsdLyoJ+AupItZgqSLOGdC2jh+6GGmuyLCL3V5XHzfrD02H2ATjWp5yYl6nc21H]
X-ClientProxiedBy: FR0P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::9) To GV1PR07MB9120.eurprd07.prod.outlook.com
 (2603:10a6:150:80::7)
X-Microsoft-Original-Message-ID: <20240630092510.17696-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR07MB9120:EE_|AM9PR07MB7300:EE_
X-MS-Office365-Filtering-Correlation-Id: 966c67aa-cff2-4eac-bb30-08dc98e6940e
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|8060799006|461199028|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: 
	/4gsUZ9s17DnPopdTIcZUg8EJBYUQx8FL0DffJOpYx8r2K01dOF6B0CWS8g1lEVEySh/O8nZzf7Pn5cJIIPp2F9lMh1VEgUWFKyojDPBrp5TlrBWQCGfPTJA8uxgtFcIRDDpUIIpTXan2YOMAHp/9THlLZlYWA49S6reEF0pIkKfg6siLXNjneKzWAXRaCrcBeElZb4AFyf0GgDJ7zJtxsEXxkn3qu5jdcNvYfQ8BBR6dYnMIeqSHHhUZR7diDnTzD+kkFr9B+HMRmBB7hvaFTczyf8ihuk3JOmD9Tg4RUSG+MrQedbUoploZe0y8+dkOVakMXlbw0WCmwJMenZgOdyyTbZkaN78ZMnBawz+e7NP6lviOyexQWPzeZ7GalPCUmvwAUCmNI2sRyqpzFhRK+/pylqmbLF72Hqf7zptTdKjoyPMqKJuSdEvZogGyueQFgAodiWQnIxODtpsN3yvbGZfgoTXmx0ytPUjnShNA85xTg/scfacgfHEckyPGggg5siYBF0dVJS+cGxeeNKXm8z3MACZ/cnLowNOsChrWG7OxOQJ+o4BCJXPriXBstmgqNNxz/9bTQDSB+U1GMStMekohtnYVE9DRNL5ak6Fmvtan2c8NoqGJHQiAN2lhJeCKDo8j+g6MbSfrwc6iv1EkQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yl2yh3LLlP7fTwAlsjrE+mcT4/MF7laen4qax0AwM7OTGHi9pCHb0rfI9iBz?=
 =?us-ascii?Q?FpD9LHResmMHuUlz6ABeBei6nYuK42Xz+7dFwCB7MuKbsr8OgQcE+YPeiW5r?=
 =?us-ascii?Q?G9IbTooul3JRkjYvz+RSSwdgm+kxpkkcVSMGd/a8bFRYn4LaXxwp0oxzsQX/?=
 =?us-ascii?Q?kBbu9IdzwycfmwaZ9WhdhSZNdEs1F+rmZ+MFBEDA9ke8ewyQQp7bC2K2Et8I?=
 =?us-ascii?Q?0PdcXMAE2qohQS3dTMrDg5GHWDOc8xvzLh7kQoOqGVFLTBoap1EMW1BP/VRS?=
 =?us-ascii?Q?JKY5sxwc1bfhSCDr5f7TMDl9otUKQaUmcqjv6B8wHNRuEmL239d1Kp8HTvYp?=
 =?us-ascii?Q?Y2lTEn9wGh9k9VC+MpCw12vKijmZ5+9ClV5AMAchLPZmhhQXFTWuhTl7Hg0E?=
 =?us-ascii?Q?aO1RPXSpUYdtazuFJXWsAnRDGfneJy+xpo1i+2nV4qJZXod8MLHD17bkfiSS?=
 =?us-ascii?Q?9luIQ0JQhqwMv3jXXwADFK3zhrF6xLdkkUz+Rtx6pHSnPbbvR1qZ5tvaIEzN?=
 =?us-ascii?Q?ctn2koB8Or1SH5BNaYOvqnqexLt3otnnXW/2rpW5fj7oQ3bu2wjHS9wfzaQN?=
 =?us-ascii?Q?lJ6J2IMDwDH8XyoAfp0+5yo2FfOjtDLNaNyeJeH30dxwz5zowRctdgrySGsM?=
 =?us-ascii?Q?DsK2E8ssxUyd28yIFwftqiC8Ufdfdspoc7m2ooFfh27WT1CVCVcLSGn3LPx9?=
 =?us-ascii?Q?/r7jm4ci7BUxOre3PxjUJUgXfMdkNt/LH2AgqAhhawdZKKvuiU9NubFpDwDy?=
 =?us-ascii?Q?m4W3wLJibGarV9it05rUcHlgtQ5oPqehw3IBPPxD4HyIBw4WW+Q1ZaCMAG9k?=
 =?us-ascii?Q?42UO0WKzUDtMYZG+GfnV+jLL5SoTzl/M3Ni+gKGpQK4MPJmLwcHsXQOpsX9d?=
 =?us-ascii?Q?lN4bC+KGfWy3mZuv9uQ6g/pSeQ6khI4WePhimgvQ65F0IGCmAR8C5DhKR5az?=
 =?us-ascii?Q?ryVyFmA/7g8P3bsQUa7n9Fpcv9lFpAdP0cW0QXsVGLZ8R3B2ldWFbjrE2cpl?=
 =?us-ascii?Q?iFZt3d9+gm8okIM7XpCu9BS01rJBEaX6FnVE6ODKwbv8v/641cp6IdrMhXqP?=
 =?us-ascii?Q?pkBOjSEnG/yizJATbCPTu1jvjY1GeN2frn5JCZHx697WiNM7gIl+U+MtZOx2?=
 =?us-ascii?Q?lOT+KoB6XSORpTVFRDU92FLUiTir2YPUQWdQR966636VzPYna+FZx4r2UFRd?=
 =?us-ascii?Q?B+ugIfHKJI+mDY3uXSr2/P9Uo28tMOwnZlBP9TzZblStQsifWAYzQahSJ55n?=
 =?us-ascii?Q?wyzE0HRfVFLkxvWmsB47PED0wB32Y6x/b8Ahxe682/sXbD+qH//jdFKsYqE6?=
 =?us-ascii?Q?C7w=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 966c67aa-cff2-4eac-bb30-08dc98e6940e
X-MS-Exchange-CrossTenant-AuthSource: GV1PR07MB9120.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2024 09:25:27.5915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7300
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 09:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201232

when compiling a non native variant, latest update
introduced package-qa errors like

ERROR: QA Issue: .../docutils/utils/smartquotes.py contained in package
nativesdk-python3-docutils requires /usr/bin/python3, but no providers
found in RDEPENDS:nativesdk-python3-docutils? [file-rdeps]

Fix that by patching the interpreter lines after install

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-devtools/python/python3-docutils_0.21.2.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.21.2.bb b/meta=
/recipes-devtools/python/python3-docutils_0.21.2.bb
index ac41ef6858..d9f8160913 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.21.2.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.21.2.bb
@@ -11,4 +11,12 @@ inherit pypi python_setuptools_build_meta
 RDEPENDS:${PN} +=3D " \
                    python3-pprint \
 "
+
+do_install:append() {
+	# Make sure we use /usr/bin/env python3
+	for PYTHSCRIPT in `grep -rIl '^#!.*python' ${D}`; do
+		sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
+	done
+}
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


