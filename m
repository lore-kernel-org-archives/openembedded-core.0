Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.108])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9842.1795192423759702913
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 08:33:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=J7PXkHlF;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.130.108, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qxKcVvQ6pb7l0XAM0BnMbYChdIzse7aXBISJ2apa4iN2cW0vMQxTobi8IDS0hO2j8O41HhkoB/oGX7gzkvzjzQzFJRmhe+VE2hCID95epNAGjlGeo50Ft0fDRNvNwZIlT0PvRg1OOlBo2IGiKWQjwPpAv+3TSEcP2HdI9AgzidjejcJJj4HIJOr5l++LNTdwUtYlJWE5NJx/bcPXM9dgiu/TmgaSJVxl63ff5JVJ6bHtOD0g8+rbjncqS/EjfZimMyfz+/cN9rS4fJRjlb+bGmgmDuJP8zDKdSk2FdgjQocGOIZ+N1fXCotwONjBsSx06PvxEPKO6F76BPzgVP/udg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxM+ljqwhEegEnopklcPRX7O3FR8/0VED/GdYKaD3vs=;
 b=OIoDhiW7IkzG6Ky0RGo8D5sBy3pHmyiCUcQ0GzheRb3rjId4b5RmFf3M82JSGvgUXThnTjgqUJjR/jsJ8KdOz/HHrlaFxk2/c1EPCgVGebilhih6zTUvCaaEXcg/ZjXF66M1HC/tVeui6WXVvfvMM8JuAzDR3y9zqxHUPXZRBFR+3XOdNpgd44vF96S9JpmSQCGnFT22AhfwtqgyX2STE0olXt95I8Ko5zTIs1Zidgg1Y59WY1ONYGRUGGp3Yd/nMsSiyp2LBEGOwica3kh2c0MsFW9MSDoTFM16oiZVcFysl3eDBcIJL1VlqInqGRpAxxs3S9MDFp4cRvXKcULkeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxM+ljqwhEegEnopklcPRX7O3FR8/0VED/GdYKaD3vs=;
 b=J7PXkHlFA3t518WTgVSSdj8cb/NcxhBu9L4XRsJl2KMQ7d14x1mcNv02NaCcYw/WLI6Utvj6eQQ1OJ5VqiDzgwONUZapGG7OaxRIAeNDeUykUcNLrddp6gmNj+iOx2dXzEpju88o9v6lBRgzsQs9xZ7Xx/IlOC+uWpNweyWrbnUzVgq7REJ6XEmYk1c54AEKdfjym8ZF58JpQn1jSV5RO95h6rikjxEqeAVZszwQlldiIz5ktH2A753FlKwZU/sZnGkSysXGJ73VnkKBbd7EPjeVGSs+2HW2Nk1ykmLPB6GJRdN7e2BFtbgpXaAoumMj3cDJps9YjE40m/yD8y5/dw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from GVXPR06MB9766.eurprd06.prod.outlook.com (2603:10a6:150:1dc::17)
 by AS8PR06MB7462.eurprd06.prod.outlook.com (2603:10a6:20b:31b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 16:33:38 +0000
Received: from GVXPR06MB9766.eurprd06.prod.outlook.com
 ([fe80::485c:86c9:bd8:53bc]) by GVXPR06MB9766.eurprd06.prod.outlook.com
 ([fe80::485c:86c9:bd8:53bc%6]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 16:33:38 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] systemd-serialgetty: Fix do_install for mixed baud rates
Date: Fri, 20 Nov 2026 18:33:26 +0200
Message-ID: <20261120163326.6114-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV2PEPF000467E0.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::19b) To GVXPR06MB9766.eurprd06.prod.outlook.com
 (2603:10a6:150:1dc::17)
Return-Path: niko.mauno@vaisala.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR06MB9766:EE_|AS8PR06MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: 32215170-d384-48aa-2951-08df47240784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|23010399003|1800799024|18002099003|11063799006|56012099006|261026121527099003|261102123227099003|261026140227099003|261009223027099003|261021123027099003|261022105027099003|261021121427099003|10067099003|38350700014|261028144727099003;
X-Microsoft-Antispam-Message-Info: HsxKxYcCyh6JLEsAXkECOTO1rmlWI6PTcN/zxasnBj7ox9H4toHLpSzXEiPJIdXoB9hCNRc29yKWVJm2zScMpHva1hMtQwu2J2KuYxscgkxI4KbvRqdkMmdKJi3WTraPXhOgjhiqhOKMaNemLCqgv0UgqZBUAX39hlS1dY7GY7mjobRWrHDNdjt8okhcDtqfN11QmbYdShdLIMMqz0Z+8Fs0vvLJAWVb281+xBq7GHOP67WMOTBqYcp2ZAMy9OUPDV9TWdV7C28aGa1UloJU53Tfg3ik++4E8NOEFI5LHmfW80mSUm1MvFfR3lIUIP9JpTaDYCIiXWlVPRq1DFapTT9B/XdEMSFGeJXE5tKqrvjorjM+hMzhkVHhG6wIbQcFy2sZH3NFG1TuMuRgcnj/eMsJk4Vi+4TCEVqpDiHtGQ1sZr7fBHPKUQqhqKILcfFW7ftGT5wOKw2R1ED1sgjq0VRCl5BK2nDlbCERm4DL8HbLeplQ+sP95VD0ZaEYi9ojBdRsOeUtM6/oh9rQpMUYdq7SA+0OHXfCSL0keE9HWPEF7slyJkOdQeeGmObYe5CbwaD5uRafAG5fbHWnTAqZojK0gER7qGMKif/MbM+hUnyPsDoen3pO9SuQ1jsVeGMzwYPxb2l0Jx2FxX2PAsLclie6eb6svKwlHS1B9txVNKJhu6404gXXKQCB22Gd36ssiA9V7UVQ3e1BwGaT2Mhm3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR06MB9766.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(23010399003)(1800799024)(18002099003)(11063799006)(56012099006)(261026121527099003)(261102123227099003)(261026140227099003)(261009223027099003)(261021123027099003)(261022105027099003)(261021121427099003)(10067099003)(38350700014)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WtMppZtzmA9c55ibmSzZtybaN/C3ppKkTu2M6B11Rm7S2dJT/vECmh1PmAub?=
 =?us-ascii?Q?bTsVkldpPCq/jqTcBFygUoh3Q++tQ/bYg4qAX0m3Ur0LqU4x46hNQhDCjXKO?=
 =?us-ascii?Q?zLiQeLLwNa3ad3yeZpzthqj8n5NZFWEWOxDKHxE5Fk9pIXU5iWCj9yLLVZbr?=
 =?us-ascii?Q?s7OyT9rptq7WVqYlwzMBjX02fiTQ5aDC+1fS0OWAdmLskD1A9MoxmpDKjRs5?=
 =?us-ascii?Q?+T7e12PWyIV7aXuJg3vfcvHZDxE9kiwrur8te5ezpYX28sstgfzlchNabmlt?=
 =?us-ascii?Q?BVPXcxgnca4ka1EPjlYdcSu/h8h3HzExl1XDLpWjSQvaBG7+EuDPut++rdn8?=
 =?us-ascii?Q?uBbo2ucqhMYE3LCt6KMndbFANbaYgdCmxdWrHst2WkqMuD3NJAUdsOj9yCpS?=
 =?us-ascii?Q?SbOejelhMCaKBATQQJ/2DfCCCerXaNqa2F9oh5oAgNesGgVfqY+tUjKcP6Nc?=
 =?us-ascii?Q?jFgf+B+CnB+xSpQjQKUvTwjumQhSUeyZUy9eHgJkZRa0NbJPw99c9I0iiaN7?=
 =?us-ascii?Q?+xTVLADJL1DBcfU/3ieU9imkTABHgTRztEEcXFMRm/wBS66PRYTi9F7zvaCT?=
 =?us-ascii?Q?xQ+mFHDTUv2EPahJliHPtgye1Uvk3ZvLfmyM1lZIDW1KilT6tAtBCjkBicP9?=
 =?us-ascii?Q?6ZjpyU0O2zOmIhPTrjbpuZRVjsfGCVKJver5kJMuPL1iSdNfWJ9lODUGw/j5?=
 =?us-ascii?Q?zT24qx/PZLrXlA6oNjUCODzF5Nl29YlMO2qRWmYdpdgUSZe+/w18WAatWA4U?=
 =?us-ascii?Q?hdXJ1s1rpwU1cyLvBxUEGkfYJ/P4KruCqBJma2OXwHfegxMswvtKZNom4LQr?=
 =?us-ascii?Q?/FqXXgeMgIeli3/CPwKVj0mCpkN/spho0u+T4At2R6wMoqb5jl5ETatt+508?=
 =?us-ascii?Q?fxxjGs6hpKtxS9LD5Du0sQnn9LC63lnHe8MCCOT8y4dSty3ue93H0xyBcR+7?=
 =?us-ascii?Q?RwqCIyZM3kXYi6BPQeGjTX+6/T7tI6ElIDN0ojsyMOL38lb+NY6m1HQ12gEF?=
 =?us-ascii?Q?mUlgXyeiCtUspOT/q4rgB4twdhnw8qp4yYkme61VjxLf339stHTche+fTGVp?=
 =?us-ascii?Q?J7pUxmvtGkQ4nSzc7lhki9Hl6CS3/MMtjDyDMhe5a8xH9ncQwWPMhCy62zIp?=
 =?us-ascii?Q?3e9q4xGfCaCi+e/Up0Oc/qdmYL5M6gNeGm9YXFn2a8NLXFJ9HNlmbkAjxVJF?=
 =?us-ascii?Q?1lIEnMAhl1BQ2nml8YPDBu9tNk6sCo14kxFvEp0AiEofsBBnGOnYa/g+OK/n?=
 =?us-ascii?Q?oKDe4iXe3DA/zy7adWgV+SEhlkAWzYnOzBDj5ojTZpUhf5ilL9tDcw2Y4WpZ?=
 =?us-ascii?Q?Ea03djJNYrqmuVRFYFZ2QNdLLMVA7UNwzVQUgrX2Z9BKOwBnyz7hHtkuD0wJ?=
 =?us-ascii?Q?bSnHLWX+EOwszTLyodtxUHH2+o4jmoDPdyrpGSrs3+Qys1LU1J+iusN9CTgc?=
 =?us-ascii?Q?6lJCQphW3aqUx06FAvmD9egDiblMKjHbClgGRFBKkhLyobDw0Lcn9SJXtY7T?=
 =?us-ascii?Q?sMxiSdNPLZxrRpxOEU/ndSNSUe58spnB0pWfbsCu4j95G06pz8BqxvXrqyrt?=
 =?us-ascii?Q?1j3VEWilOt4KDQ0dxPa2JAWUzTmS3gePriEeQ8ZPPL+qHZ0tA7hdcgI5GY2O?=
 =?us-ascii?Q?qSKKlAmdSLoYFillFnDVueJ5i6hD4jeFc2K+pbtW219ynV4RQIJrtsDd0xQ+?=
 =?us-ascii?Q?PBSD6CpqTuFzt3eW1XwOPeOOWU0RHdjHEsT2ZJsAcDIgtezDIAoY0Ydskd03?=
 =?us-ascii?Q?r1MsegKn3A=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32215170-d384-48aa-2951-08df47240784
X-MS-Exchange-CrossTenant-AuthSource: GVXPR06MB9766.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 16:33:38.2446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QROmjvayMvUYF7CT28lQlHPSLPpebadgA1+n0bYtLiZeT/fv/66COXa1uaJ24XkyuoNbQM6DS47pTPod3u/BLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7462
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 16:33:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250816
Content-Type: text/plain; charset="utf-8"

Since commit b6a7617145c3 ("systemd-serialgetty: use existing unit
files in systemd") removed the recipe's own serial-getty@.service, any
SERIAL_CONSOLES entry whose baud rate differs from the first one fails
do_install, as the unit template it copies no longer exists:

  install: cannot stat '.../serial-getty@.service': No such file or directo=
ry

Enable systemd's serial-getty@.service for every console instead, as is
already done for the first one. That unit runs agetty with --keep-baud,
so a console's configured rate takes effect only where the kernel has
set it up, i.e. on a kernel console. Since b6a7617145c3 this has been
true of the first entry as well; say so in the recipe.

Tested on master and wrynose with mixed-rate SERIAL_CONSOLES: both
consoles get a getty, and on a qemux86-64 boot with "115200;ttyS0
38400;ttyS1", ttyS1, not a kernel console, runs at the 9600 default.

Fixes: b6a7617145c3 ("systemd-serialgetty: use existing unit files in syste=
md")
AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../recipes-core/systemd/systemd-serialgetty.bb | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipe=
s-core/systemd/systemd-serialgetty.bb
index c3fe9d5b6d..807dd8bb9f 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-=
licenses/GPL-2.0-only;m
 # will probe at boot and generate getty instances for any active consoles =
as
 # required.  This recipe (enabled via disabling serial-getty-generator in =
systemd)
 # should only be used if the generator is not appropriate.
+# Its gettys ignore SERIAL_CONSOLES baud rates and keep the rate the kerne=
l set.
=20
 # As this package is tied to systemd, only build it when we're also buildi=
ng systemd.
 inherit features_check
@@ -16,25 +17,13 @@ REQUIRED_DISTRO_FEATURES +=3D "usrmerge"
=20
 do_install() {
 	if [ ! -z "${SERIAL_CONSOLES}" ] ; then
-		default_baudrate=3D`echo "${SERIAL_CONSOLES}" | sed 's/\;.*//'`
 		install -d ${D}${sysconfdir}/systemd/system/getty.target.wants/
=20
 		tmp=3D"${SERIAL_CONSOLES}"
 		for entry in $tmp ; do
-			baudrate=3D`echo $entry | sed 's/\;.*//'`
 			ttydev=3D`echo $entry | sed -e 's/^[0-9]*\;//' -e 's/\;.*//'`
-			if [ "$baudrate" =3D "$default_baudrate" ] ; then
-				# enable the service
-				ln -sf ${systemd_system_unitdir}/serial-getty@.service \
-					${D}${sysconfdir}/systemd/system/getty.target.wants/serial-getty@$tty=
dev.service
-			else
-				# install custom service file for the non-default baudrate
-				install -m 0644 ${S}/serial-getty@.service ${D}${systemd_system_unitdi=
r}/serial-getty$baudrate@.service
-				sed -i -e "s/\@BAUDRATE\@/$baudrate/g" ${D}${systemd_system_unitdir}/s=
erial-getty$baudrate@.service
-				# enable the service
-				ln -sf ${systemd_system_unitdir}/serial-getty$baudrate@.service \
-					${D}${sysconfdir}/systemd/system/getty.target.wants/serial-getty$baud=
rate@$ttydev.service
-			fi
+			ln -sf ${systemd_system_unitdir}/serial-getty@.service \
+				${D}${sysconfdir}/systemd/system/getty.target.wants/serial-getty@$ttyd=
ev.service
 		done
 	fi
 }
--=20
2.47.3

