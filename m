Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C698C44512
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 06:40:24 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.118])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6956.1784184015874490880
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 23:40:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=4KDOk9T6;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=ETTf2M9J;
 spf=pass (domain: navimatix.de, ip: 40.107.159.118, mailfrom: joerg.sommer@navimatix.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcSa9yGXn01/YYRB6QFcgRwbNWow4R24Ol6UZaD9SBw=;
 b=4KDOk9T6Gh3LLzZQqd2jtwi4xhQ2OhOycgB1NbIPf/QEi1qgimbamWNud+9iw+QDjIYInleniFBNzNMz3Wq7EAOyiChFtbDI3Izui3JsZmfA2I/u6BSExM6KQwJto98UHugFGqKrbiuSD5iYxQ1vAYVP9udlzghqbF25OEfi4ag=
Authentication-Results: dkim=error (no key for signature)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DB8PR01MB6518.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:15c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 06:40:12 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0223.011; Thu, 16 Jul 2026 06:40:12 +0000
Resent-From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Resent-Date: Thu, 16 Jul 2026 08:40:09 +0200
Resent-Message-ID: <alh8yaGaCVx1UNZa@navimatix.de>
Resent-To: openembedded-core@lists.openembedded.org
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tE/5N1v+BKlAzcsDTJ1+3DhimFv/b+L/D3cfyyUYKrUWnFqJqwzeWALOKaVWB5h5it4TnMHPT8xGIvMtHZNrZajgADWx5K/azbPDexoo/MNaED/quIRKKxdmDSp211BhDcrZNSXdWOXNc/00obxOAqEPi1GYxcO4QJH4CbLXkbWCTD4fl1onYiEngXqz3n4mOKkaclzYYPDaIX8acmAK+OXroFfyp0NRdCkYFTh1iD1NpYEHut5KvRrYLSFzIZCNvAib8WG+50JtCu0FobQomIZJqENrh9zqGQbbsAcRh5PrJmYsK5vFWBqindnRBX5aDnLF9LQ3zu6AVyfq9eV3ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zAvYqX42Jq6VA/Qxhsm0+jia7m7rwdb5dHQ3IzcQVM=;
 b=Yc8ewKxhw1ZB2nBQIERqLbgP/Ym2Osxf+z6SnSlRhm3WnZmldb/TVpR+BQRqMGJSbmxFhsY5muWutTHAFFnrZUGAoppq3NI8BV9F9ZLSC39j2DlRC//+COgihfbmMZ9mfAUpRM2bXGtEvLVu824UTqogBflI4H4j+pZqxWAH4J9UhDCx5B9RJ5A7NvszoauwVQ/jpCDVtcNaMXN9GztkKKPVV6v+IyuB0gk3w7po2JORuWk1HIQpUSpg22+adGUrQZrxsFoBs3VKnNOINlwnz7dFboarMYWQXRZAw1iHP1QXuGgn0FP2kZZJsGVvKAKqlg8ELnsavePcMHfycfewlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zAvYqX42Jq6VA/Qxhsm0+jia7m7rwdb5dHQ3IzcQVM=;
 b=ETTf2M9JO47AlMLLIRe7H4g4e4Ku8we02/GF+uRzLUa/ilqTd1aQDOoY09mzgewGeIBcOq6qaxl851Gbxit1erPeKRFbwalu/RSyXNMt1igudbUg3NaT6WuCECFYyJvqSTWhCg6juEiBlZ4DJpy0hQvSVmdhR5M3IAebD7qwxsY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Date: Tue, 14 Jul 2026 16:41:37 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: <openembedded-core@lists.openembedded.org>, <joerg.sommer@navimatix.de>
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 2/6] libpam: Enable PACKAGECONFIG[audit] by DISTRO_FEATURES
Message-ID: <8cd2c1991ba680bd141d63085671e1d3282037f0.1784039919.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <4fb61a12d8843e728054e9c46c6bc09c50aa2957.1784039919.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4fb61a12d8843e728054e9c46c6bc09c50aa2957.1784039919.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0277.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::18) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
X-MS-TrafficTypeDiagnostic: 
	GV2PR01MB11835:EE_|PAXPR01MB8872:EE_|GV2PR01MB12594:EE_|GV1PR01MB10474:EE_|DU2PR01MB8128:EE_|GV2PR01MB11835:EE_|DB8PR01MB6518:EE_
X-MS-Office365-Filtering-Correlation-Id: eb574e4e-fbd8-410b-8f6f-08dee30515ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|14060799003|1800799024|366016|376014|23010399003|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	5OPabKogYa91cORVfo0gOADEw7A2dYV9QCmABweu/TLtGwpE+lQXAVCr0/ccD3w0egDLOQH/nYTgYoAbZLLjQNK5x0kvqhwxog5+VVGkIcxROfN0SN4qvbfkT7QNT5SOrUTi6YHZu0yQqofQWVwR11AnMS9qmBc3EB4iKuRiD1GKh7BIGtkuqxv63sRgWiUFgxi2kqe+uBuPFnbCwrGIL0IsAemAcNfZADRSizVn6MgE77L0TRwpgiEJJtvK42O6F5N6kksLXtMN0WqQku6TjkSr7VSqaAiGYB6s1TTdu1nXOltuKqqNIKs0zIHX6zhO7AXeyckybofw00MQOtkDQyjk5DtHhvF8/eTTDlRq0o8MHLVhYU38oriPhBMmN7hs5DZ9JpStwACHL1s8scitLWbWGvoSbV7QQeHsmiiGADFZNvaNoqZ7cAotPOLDsqWUZJ65U7EU2HyS8MneiexU8NuxM0Ifw/tO7cZaujPqMXLElmGpUBXMDIdG+o/pCTD0LZBpqOVh+PjhFFtXSyICTqyfaAwdDCmKD3oymtCAKRjsAuRoFx2XRvncFYvCWcqEthFpJ1BdQcW6cNAon056NKOpYgXoS49bdKMqkaoXcDBcAKKYtFPxNsdNW5vVsOaMta1Fxr44r/b02DxwTsLKxmT6E5/1XgJ2h4jxvLNdt10=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(1800799024)(366016)(376014)(23010399003)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d236217-4c32-4d24-2df1-08dee1b60326
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 14:41:38.7832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DbwJiVkisiyrFF+oUqL0ih25+w7kSgqc2UCbH7sWjSI9RY97Os1Qflq9V9+rUjd1EHIrc4vUzrWK1VjgzDb4V1zAUEfa6suOc98MjMYT5UU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB8872
X-ClientProxiedBy: BE1P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7c::16) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1d236217-4c32-4d24-2df1-08dee1b60326
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?/vl104GQmQOGU3J94KO7VtjW03GX4h6ncwV6pHbp9Nmr7mK0PQho+x0y+d?=
 =?iso-8859-1?Q?lPTh6cgn/MvfvFWvd2KTBgaJfE1zHcxfokhoisZwKkDu46eBrjYw7j/JgI?=
 =?iso-8859-1?Q?HxrlNk7UHrhPWGP5FvjywdRwPtKiqzZdvB/qtvBMm60pS+UT624ypzHCL1?=
 =?iso-8859-1?Q?hwr0gJD6L2+CwTBlFWVRnig8tQAqfEmCFOhYr0+wGDzuCQlkrFr0yUxZcW?=
 =?iso-8859-1?Q?E1OoALE3dXF2WMLwoWxQkLQYIWdBv3DIqCWHIvypdFeQ3wNPkmeOF1t9Um?=
 =?iso-8859-1?Q?YLD0FKc7Bv0Gj1y+poB5uyhEtlEudCtW+y/96HQJAXYvB8ZNa7rFMnBYoD?=
 =?iso-8859-1?Q?hpG9gWCcCOLjI/LpWHvXYYZyjhhsEz/1VnRliUP1s2oFqSv+Ue0Au+Mm6n?=
 =?iso-8859-1?Q?NXn/S/Wl049SgTaNqVhI7m3rw8hUwLBpAxnF0UAPjeEzFIFWX857zQ6T8w?=
 =?iso-8859-1?Q?qtQj7fvS+gbDtGfvEnARcd+Mz6zIAmgj4dcUYksG74qfVaMT+mxkZQGn4l?=
 =?iso-8859-1?Q?359xT5unrB13E/yyDXrUy9nJQTnOzGtS7V2iVDmaUo1XRM+lr3n4AqT7tU?=
 =?iso-8859-1?Q?o+i8TYF2f1s6JkG+qPyuVUs0LYu0I724XGe8uFHvzRyy3r/uILMcHeNESE?=
 =?iso-8859-1?Q?nRo4mqy5npk57FpX1hW7tmj5Ibd4RGnqvm3wwnBRIBZGvebl98lgPr6fgg?=
 =?iso-8859-1?Q?agMbysRmPKMsxCMHgJ1/u1vKlVlpgPyF4bAAcav1T1KJwdQjDffpXtBlYy?=
 =?iso-8859-1?Q?XQN78QiAqDYgB7UhBBvAXHJpB0KgetFTKLUg7yPbI/2VB6mX7w0HbbvwM7?=
 =?iso-8859-1?Q?h8hnAYhd+qC2XEcyKSu9ThNdnEyYSiXUBgK3wRw793JPxdtbMWyr+zVOy4?=
 =?iso-8859-1?Q?bJimfVlEh3PLbynxup29NDccvFENIa73+6B8OwuGFH4Rt9n0dmzb+NTI5j?=
 =?iso-8859-1?Q?FD94qwJ8d2nTkCAMoWjkMDTAMgo6Dh+WvytWZ209Sep42hNoz2jzHBfHgg?=
 =?iso-8859-1?Q?vI+P+e+o7youbkgSU+Xku+srvSabIjaSYnulEn/Ixi2t5lLbOK17/3uxRg?=
 =?iso-8859-1?Q?mbsmv8G198KCiW+ZL99e1mp5xZ/oc7EzbZwe1CF/QNHBhw11CGlzdmZkG6?=
 =?iso-8859-1?Q?VhTE1rKqn0KIx5gsjpnFfMXAV512AuUAopAj2JcKaJD6hKPZrAGCauWf75?=
 =?iso-8859-1?Q?mlDVtXv5to2H1eURjExVfO5lPD1+7Fw3Wo28Q64zPhEsExwkoAs97i2wTa?=
 =?iso-8859-1?Q?/iUI4AD/POEqhHY9Zco6lAdUs+UDypMpeZJorHZ5Yl3V/EdvzVtwCWDssO?=
 =?iso-8859-1?Q?62VV+510wSMm7dNq6PxrwTIJpM004bPsYGcIwXSRt/HC6LpT3EK/wEg/FM?=
 =?iso-8859-1?Q?7ArHvesTJMlcGjne+RrRFSjugrk8R1JNGry+Xgpi2DhqzFgnte5pNMN6em?=
 =?iso-8859-1?Q?PAwcPSrbOIbFAaFNv2jRa51yvWLvnNr0iYxfWbdHjUOIoUuSFB3hDiLwsN?=
 =?iso-8859-1?Q?yxkkOvY+z00kXa2vYvNroioZvpHcLGcgm5o5V26l6iuajXsRp11h1T0/3X?=
 =?iso-8859-1?Q?lbC04lOb7bhovd2E+kPRRAwYDyVzMZ8fQpNqtyFL6aLfLiVXEJvYt2hTNK?=
 =?iso-8859-1?Q?x18y/j6WJWy46bkj+ZMvXKnfj3CilIUjH+jhyYY9KSyCq6u5z4KkDWO5yY?=
 =?iso-8859-1?Q?JEVRhgjnJbViTWZgAuJL11ZRbs6H8+wMQ+xRR1gF8fsQyTy0iO13HHFDyb?=
 =?iso-8859-1?Q?XLHc3CHHHbsaeArPNi/T44TF53Nl5BOYSltDg2Gnw8zEaWMiVExQ0vXBLM?=
 =?iso-8859-1?Q?DWR7+NPVNlzxDlYwnFnvtiEENn9tVW8=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: eb574e4e-fbd8-410b-8f6f-08dee30515ea
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 06:40:11.9328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JkSb4PkRy66WtrdtaKQCUxFpzRrusEbrI+iswgtsGsr1VscQGiUyUt/QI0jV5zZ0+JnTc4xSqt03UMLDCtcitLG3nF+nhr7oqkv+tcXYDhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR01MB6518
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 06:40:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241057

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-extended/pam/libpam_1.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam_1.7.2.bb b/meta/recipes-exten=
ded/pam/libpam_1.7.2.bb
index 6955a5f2f6..60cb843f77 100644
--- a/meta/recipes-extended/pam/libpam_1.7.2.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.2.bb
@@ -36,7 +36,7 @@ S =3D "${UNPACKDIR}/Linux-PAM-${PV}"
=20
 inherit meson gettext pkgconfig systemd ptest github-releases
=20
-PACKAGECONFIG ??=3D ""
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'audit', d)}"
 PACKAGECONFIG[audit] =3D "-Daudit=3Denabled,-Daudit=3Ddisabled,audit,"
 PACKAGECONFIG[userdb] =3D "-Dpam_userdb=3Denabled -Ddb=3Dgdbm,-Dpam_userdb=
=3Ddisabled,gdbm,"
 PACKAGECONFIG[selinux] =3D "-Dselinux=3Denabled,-Dselinux=3Ddisabled,libse=
linux,"
--=20
2.53.0


