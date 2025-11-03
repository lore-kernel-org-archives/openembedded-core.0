Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8248CCFA06
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:22:18 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15844.1762158130762091447
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 00:22:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=idFgQ+9W;
 spf=pass (domain: navimatix.de, ip: 40.107.162.93, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=neW2HbmSxN0RRe89s/ccLsJeTkM7A0mJJ8xb4Eg8Pji1pg4zm1/7dCjOGR4FZ2OnDlyJ9nkRzaxKByWVkHNsR33W1HSSkBD6iOR6D/G8CHz6tIbjMvqEFnrkj80ePJP0X4U0Re+YEZUOW4/h+4eVsFwnUYO6yraheC5+VpIlqP0rqZg2/y/mathi1u/pIe377vMeA/gVkHtPvfey8Qr3CLJTRPbG/ywFU8GJIyGwnHbmTjgHopF10fG2F7S3nSbuPSRQH0nQu2KA9emMOkSMVjDbp+LwfEqXZ/uOKH6mFHp+++WvmyjRK0dnyxveDc/bH/2nkaFoxslHa4S66nCcEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lt98HgyvjMVi7QEMR4MzI2JSCdf5p0ivOhBLeb2SoYM=;
 b=v3OOJkMTn8nLMjQ9SocyJSPNcCytHXUmQOHl7sm/SV1FpezXQNMLt3L3r+aMpYIW12imoF/Ztmvejs0Vmfu4B6+mk7+ql2jjgeiFFnP/j1Q3myrHeh+7/Ra5+qsjPVnJMOP8HtPgWeV6F+jLH8S4X0fCsiuGHllmkphswFCA7Z99El/ey9G+NkPEQkCncf6IREfUQyLpudcKOQab+yx8XerdMl0gfVJk4teJsP4Spy+nBMl84x5wQD9gcnexyHDvbLOmdYLpGNYHWHtKNPSc4qoT7jq5gclMyp8HsM/fXjSrMP5WufxLV7YIhsshbiUsu8kM9+t1STZTZhsegq9/IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lt98HgyvjMVi7QEMR4MzI2JSCdf5p0ivOhBLeb2SoYM=;
 b=idFgQ+9WZmkMKTsIktvkDX9HfwsxJZ+Q/5oidWrrX9FHKxgunWD5OqUe97+DIY2b7gLw9e6Rf3KUM+VGb9PFi6+8VK+7dH4R9JtILvrQ3jcQckN3i3+Z+P4FvzwPiPJ9VKLfGBczBC9Wel2NhdLMuEFZ5SuAuyiyzKQghCmhfKE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PAXPR01MB10285.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:24e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 08:22:10 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 08:22:10 +0000
Date: Mon, 3 Nov 2025 09:22:08 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, f_l_k@t-online.de, 
	richard.purdie@linuxfoundation.org, joerg.sommer@navimatix.de
CC: Markus Volk <f_l_k@t-online.de>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [kirkstone][PATCH 15/19] gtk+3: rename tracker dependencies
Message-ID: <c1641c15f747f70250ab3257edee3640d8cb916f.1762157680.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::14) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PAXPR01MB10285:EE_
X-MS-Office365-Filtering-Correlation-Id: cbc4b12d-eabe-4084-b9da-08de1ab21574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?L49AjDT7o7JbuNKnQbB47HMPhrdn3ZblX8R7aWrd8SklwmJ0pTcUaNp6Buka?=
 =?us-ascii?Q?L6wMIMx3Ise2fbxMb7CWxvd5JMhTrltcNqDdvIDJMI5BC1gpFvomEE/AVyOL?=
 =?us-ascii?Q?EyZmiGW+AZ25RQpHZ83f9BQUPuPpzagmmZSvpvQME/3WmR7zcx2UaPF5TDn1?=
 =?us-ascii?Q?aECLSIK3nwJ8XC/eCf5MFmXN9v1HP3dLQKMgQyD0OBVn1TfO5K/lOhMjMMTp?=
 =?us-ascii?Q?5huCRF4HGvfTGbGe6Sqf408kU+ZGLc5z2mjp6nWlnNnKIBWeIBPbStXz0EP4?=
 =?us-ascii?Q?aM0giMiBBqmW3vkArdvYaL7xTKUoBFX5y9C72MZtk+3TuTqRYdzqDa0mEGUI?=
 =?us-ascii?Q?gq4bnDMoYqzHYXpIqwma2DybLgucYPDfRk16KBGEz7j4WEgz2gjG8vFW+Fld?=
 =?us-ascii?Q?rrlqDashffgGcThCgIWOnCs+aK0rptjvg+lY5uHnzEsXrMynjXNp7t2K1fJZ?=
 =?us-ascii?Q?mvF1YJZDAEKC8NnBQFKAiq2HSN/nWGdgmHtXQBoEjJ6burTK3o2euytHKMEX?=
 =?us-ascii?Q?e7VAMLbKZGtTZs8BfJWRz24KaRWmOvxmUOQ8OBGWiQjOzevxqCHygbSz/F8d?=
 =?us-ascii?Q?GZfmgefHghXFRhjs3nxKIuO9K35VfwZVxric2hAbBdXycSlWO9874Oowi7W4?=
 =?us-ascii?Q?3H0Zbx9VbVb0Fb3hl0Bl2frnmWpsLIDu7roQT7cC58mCTtN3ZiZFlceT4sKs?=
 =?us-ascii?Q?pO8crYLzQ3Vfs0Lp/odn2VVzrrJDZgL0ry629Zd9iG5cRI82xRXQH3bRLOgV?=
 =?us-ascii?Q?OeTNFDMgZFHbL+0d/Xl8g7Poox3J6Pro8eANIhlZnJgaviByc4sVpmpTD6zo?=
 =?us-ascii?Q?b2BEVp1jqiYROHEm0OuOurpmuBFMLSeqK7R0ySv9pmUg37op8QZ5yJXIMa4h?=
 =?us-ascii?Q?+UVmpSGQ+mCKkhrV6kx2uIaoWfhmNQjN+3K+0WUL32YTXD1zmBOZ7rhkKAca?=
 =?us-ascii?Q?DjJFbhWV0OfK/W9DttUw85oESpa9roIuknUtpzRiE/XOH+I3xFSsDHNGsVTW?=
 =?us-ascii?Q?U84kEWdxLu3odaHap5N5J19D4+DUc6IAj+EMZEqe/pRqPX9oqT3Y0fQj2efW?=
 =?us-ascii?Q?ekMmwAUpSp064dzZtqVhfJI+lGQc80ZfQooduBja0IwNygoYlRgUTJmJMiRY?=
 =?us-ascii?Q?TQGgutyuSMpe07nV7QJ9IIuzkedrhUYPcFDjDeba3WW58vxEJjzdQA5KK6LH?=
 =?us-ascii?Q?wCWayM91oHLjf7mvtlzWIuRe8UkHP45Z0FAAd0oeXBuZhOUuuhSGiBRPxorK?=
 =?us-ascii?Q?tO6nr7qHry3DJw8mUan6UabVr0GlLZcqc/uItNb/F6+IlGv/QdlSQ4Je02mr?=
 =?us-ascii?Q?WAzzPSfCqFE9+7bgD0WOGTn2aJZmcDNy5WwEPnnGxCDxiEfw4hp/9uk7lx9q?=
 =?us-ascii?Q?FuU07j93iwZZmrWLj2baM08iHBmSyrLzQC/COIYwBT4qX3BmW8v2MJq+J5KD?=
 =?us-ascii?Q?1oDbjzGlgpuzAMfM0z2szroQ3PKR6OK9?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2+xQHIuzs3n2d98fSAXz/VRcxy907ZM6xt+C1VTqRk9K1qiXpisy9oOhlPlF?=
 =?us-ascii?Q?40zGM/CFuMDId2MYGk5hmW8XJNhXz02uqysJLF81RlyiFXKUByjTdasa4448?=
 =?us-ascii?Q?cBz4LAqbWeti2vOEw6rrMx5xKIhKW1UKP9Pcz91lKqj7CC+VmlNtHKZag/4h?=
 =?us-ascii?Q?f3ee1iNonCiELg/gdg46xQDsd119Yx1XkeAUp8NPmyK/rbSRL7Ss92uEyntX?=
 =?us-ascii?Q?4EfEMaHsfWq3F3EJC5PSUSDGQgJdA0n5EcoxJr8J5EPBvWMWol4mNerhZS3W?=
 =?us-ascii?Q?V/PvfXSB48o/RssCwN081UM6FFCPWFYbBls6DzP9pzr99oTmIookEH6wQD8q?=
 =?us-ascii?Q?0CyaXAjYm9YE7/vy1/c7Ldi9xOXuUcTxCpoEACNaEOii4yU7BmvP4rKGELP6?=
 =?us-ascii?Q?o7f12HMBOv/QARK4oYNvgOe9TcAcpD6UewrAMaEjk+87llYihCt9iiOCbeAC?=
 =?us-ascii?Q?GGu0W+RkT95YwPt6muik0OEv2NXvoBwujbhp8evyBiMfqqlHig5rfKYWQcCR?=
 =?us-ascii?Q?uh534RpIzvFOnoH9ESGRT1BFroWF68/7XzGQlZ95v5vaQ7o7NXduEo7kYPCP?=
 =?us-ascii?Q?IkEE2nyxPqurVBU8QGyZnI9bEa7CJ8l+DwcErNSK4rP3RAuGU2QQrzxh7XuX?=
 =?us-ascii?Q?A9BVLMG66Z+YdoCAZNQoTPAPXsKDLhr3kF/D4+2ERDpK6UOh0naJwtAYkkcV?=
 =?us-ascii?Q?BHHipEzGE64gNjGpLuV57gyRiNvURjl3/x6noLzSAGQov4NDQa90Cp4Mi1qJ?=
 =?us-ascii?Q?4/ILbIP/MqA6gQX58PM/OWHRdolmvP2/t4bnnU4PMp2eHKwnPDzLGmYCuwiH?=
 =?us-ascii?Q?uLCAK7FNG6yPiNap0cX6RbXzKfY4CiijN87vbZ/5qyNXbpgl+M7ad1WnUuYI?=
 =?us-ascii?Q?+khfYlersFvj7tdnRILPdPRY88GCQobh4c3OBOaRW7DdI7CCthHp8qw2v8br?=
 =?us-ascii?Q?o0qpoz0/dsxuQj7NsHE06QwuXTCUbH0uvy82ALJZCkg5ongyTKAVApOHBxzE?=
 =?us-ascii?Q?dGS8N1+FJ2Z/ce668lZ8IrxRwhNDw8u81loce3m53TFGsHZD/VYRo80ML4sk?=
 =?us-ascii?Q?ijbw3LvIWiF3PSvlFylPwdAaLxrNh4xhee/sLo0xBylIaAUpGEoWKqFk4gt1?=
 =?us-ascii?Q?pw3Rua7EC1Js1Hs63v0083rUMV2geUpBVW3Ya95W8Xys7ogPZ+yCxGBZF72T?=
 =?us-ascii?Q?VAs51ldgHtfmYwYychp0cFxpvzltc9uWG4vfjrBdiaNz9TNPrp91w1NtX+D3?=
 =?us-ascii?Q?PXri0Q9P1eBnVnpLqHs/vF16RjUFkS/722rbbc97FTYrxknoupa+CeCEO6Rx?=
 =?us-ascii?Q?OJfrPKs6wTQxAK/IZWIgTzy6XqEbsvT6pWd1nTz8e1qpht39Z/bpdYVI3ivr?=
 =?us-ascii?Q?1Sbh6USlx2KTwCcl2awGr3aRxOwm57JXUvyEXJW5lipc28JZPQ6lty4lWHm2?=
 =?us-ascii?Q?6nSYOoIZzf8kVoOYnC0KR4QzUVEC63LNMAv8fE0AQpbCUCHDoq6+/8oxQ1km?=
 =?us-ascii?Q?xlJiqWuOrfA6HtFA6+IDvqR8BbFbc8ZYSTKg21gAplmgvlT9duup9gVtlWGv?=
 =?us-ascii?Q?SXaiGhCEpG1260Xy4MjueYEgDh0msdaWD/4fn2ojp7YMlDBvZZWSixmlPipw?=
 =?us-ascii?Q?NA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc4b12d-eabe-4084-b9da-08de1ab21574
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 08:22:10.0668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dNIVccrSVsr+hDPgBEqdSdT3rIMa7ljbcB47CHuzF6WRO7t682Zgod0h2iO8mD4bNUbg5Ix839566qSef5mxLFW2bqiKu+sMuks2oYYADqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB10285
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 08:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225629

From: Markus Volk <f_l_k@t-online.de>

This is required for gnome 47 update in meta-openembedded

(From OE-Core rev: 51864b3494bd8fe456fffb2e0ccf70fee13cc013)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Cherry-pick-of: 07d2dc4c98f2fe1e2c8c0aae5ce863e7bc190b5f
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gt=
k+3.inc
index e1603b43fc..03913768b1 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -47,7 +47,7 @@ PACKAGECONFIG[wayland] =3D "-Dwayland_backend=3Dtrue,-Dwa=
yland_backend=3Dfalse,wayland
 PACKAGECONFIG[cups] =3D ",,cups,cups gtk3-printbackend-cups"
 PACKAGECONFIG[colord] =3D "-Dcolord=3Dyes,-Dcolord=3Dno,colord"
 PACKAGECONFIG[cloudproviders] =3D "-Dcloudproviders=3Dtrue,-Dcloudprovider=
s=3Dfalse,libcloudproviders"
-PACKAGECONFIG[tracker3] =3D "-Dtracker3=3Dtrue,-Dtracker3=3Dfalse,tracker,=
tracker-miners"
+PACKAGECONFIG[tracker3] =3D "-Dtracker3=3Dtrue,-Dtracker3=3Dfalse,tinyspar=
ql,localsearch"
=20
 prepare_gtk_scripts() {
     mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-c=
ache-3.0
--=20
2.51.0


