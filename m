Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A971F4487B
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 10:39:34 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.236776.1775990364355322496
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 03:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=UsM2mu1C;
 spf=pass (domain: navimatix.de, ip: 40.107.162.139, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCJbId3qDzLdJyg5lsVKOXxb+TC3rgKxMzpn4VMOB0F9BfmXVFoaBVFYnOmKd0cU5kW8o3c16c5A1YFx7ttyNJ0xS7bKPgZQXHprPWE+l+VNfu7N8MHl+Oa8nSvRzPaKO+ZYqat5yK+Xhf7vtDg1b4SHalx/tIybegyuSV7FSUOnThI2g2tjlQoud19ihG+zvEql8Tn8BtHKf2I/YLZ9Pgc0naOqPFpoT4JY7eNbuBULtrMPdd9RHUfsHf8V7coFdFqJOAIdgiqqm+UP2LD4xzhcP0XJOxB7du3lVzafWYgp5eSoR4Nt6AhoYuE4boPmG5kajtVM9zahzc+7yoeaEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPJxHdABQ5ra0L9HpTs9bZP7gsSSFGHCYRtovt8ERGY=;
 b=Q/fZvGWTrylTqkOa00IYGQcuy0+s+joBpcE/Ef7/qBpHEX6qFrZAWFEAJNLSJYIxwSie9UefbOBKwB8j73UkWtS7CNBdNztzMV4+U/9SvfUEUmY0UyhpwiooxjMliXnqw6BGzyHEdRo3pYtl+CacSHCjLXjy0QTgMsrFkT3wwsZS4H5BeN43eW+lrNiIg2GFpqer9jQ08O8qm1OcxaPgY5okXMdajLmwidcOJiPOwRRt77iWLmMj8sBG1hFTn/ogOV6Pi/QKoMBpfxo4/Yxi2V6InKdsOi2I6lNFSyaVs007JrflJ+rzGZCFeFaYTHpY8n5JdN3IZ+1P8Hh3ligtfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPJxHdABQ5ra0L9HpTs9bZP7gsSSFGHCYRtovt8ERGY=;
 b=UsM2mu1ClAcUtLvLYyqkXFCvFa0J//TV02nzXTfF01GvQdmTKfy+EszSVCY4QVVoLhqj+0Xc6N8TdFnIO/n1074FFcIh7EVQTqFjqcG0R9d1W8a/Qtj92wdadt4v3RCfVx81uxG8XewEbTyc0C6RW1SNPmbcj/bmFwXwAI53OyU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PA4PR01MB9332.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:27e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Sun, 12 Apr
 2026 10:39:21 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9769.046; Sun, 12 Apr 2026 10:39:21 +0000
Date: Sun, 12 Apr 2026 12:39:20 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, rs@ti.com, 
	openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: rs@ti.com, openembedded-core@lists.openembedded.org, 
	=?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH v2 2/2] atop: Fix binmerge
Message-ID: <8da08c5212bb705329a8b7c390bbf676d7b1038f.1775990357.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <5a2e6c6a750bb04263768f47307607f17b77f4fe.1775990357.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5a2e6c6a750bb04263768f47307607f17b77f4fe.1775990357.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0368.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::7) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PA4PR01MB9332:EE_
X-MS-Office365-Filtering-Correlation-Id: 96bb3062-116a-4e6b-49c0-08de987fc1ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	t4Wa/1xSN30QIuD5r6Gk6LsXeBlsytUeAXNqXWgvtvCbP4nTnKp7AKHiu+Ne0yda6hxpOuUU2d1fXrW0zrLcOLhnkDoUhSg4aH7cpzpv0O4Z1fa99t5LY62gkOeyhDv2mcg00Nfpyvy4ZbUWZeyCfhJt/BwhVIDU3yU/fO+QLpXrs+mFrP3sxhMm+ZPE8NjPDUt7oNctSJNLHDFZICoeyBrPwfNPGIMGiME5axniSWaw8BT6c788QHk/OpzHKSgSiZ7IOzNevFmW4myd5XJetw2T07661uQ70lvjjq1TcT04sEZFXSu5wLyMBb/gVFWFLl14I39/L3aYTxKiHqWtanPvMWSPAo5j3rh4JRf+UxBFdlTOcGwsc87XIh+l34SBnFi/wxkCB+fYusSih3aN0D3pRuyxIWvGVOY//TZGAlgvZNy6xNg/xha17adbG2mCEDT8BBwSDMdnvbyW5wQ8GwMho/2GqIdVEDQAZxMUj0EDD3klPm8D0DfxByIwO87KioWS8Soj1uS2YEXI7wdSi21tp/aiyJV1RcFibvbuLbjlQh+hPBSLv8Gck5FkaMnkB7N0Itfq84MeQN+mz2ZqvlriIS6+9Jj55MEpVFhp9SmYVwHausNGE9Lg1yJtCp+fr6+AL71ZcTUqvu9XPr+/qmmEtMbu8p7ibSPWFML3tDygdey7ogIAlU9m3R1Q2/QAxEcEMVz0ZP8zFXd51gwjOp+PFsqPZcmCG6ioBjQdC6I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0Feat1urnqCjNANadF3XUUdkfbhRHzEYbjVlgpJuw0ybQ/W6fx2qt3jcZaHr?=
 =?us-ascii?Q?ziWZXPs8ZEKVIfJcbVBOnvNHFo9uNAoDVK0o3Geo14iXKlmUFwzpaQm8Oqoo?=
 =?us-ascii?Q?og4I+nFG//J0rySsYREIqp/Kbduc5pUrtStbD5jHGYo+xOHt7v77CZ2UGeOP?=
 =?us-ascii?Q?XqF4oQUzjfCqAtb1tFABaJ41KtQhSv8Vt6JjTJn/84gfTwSChKmWjaGRjrxz?=
 =?us-ascii?Q?yNf4gJnOSrxuQfz56oaA1U9X9vmdzJDfiU+FiZ6vCjfjBhkhN9dpmXU5QSO1?=
 =?us-ascii?Q?82rxw2DGpQTqtM75Sae0f396I8myC7hGGfB1Z6LbwHoqhiAXK07ZB0PMwg2O?=
 =?us-ascii?Q?O+Au+xJ1A4wgRvIQ+LjKPW7F5e2+Epgewg2OP9TxcKX6RiX/Ea0VKQETzYIW?=
 =?us-ascii?Q?mQjSNoiQZvfcQByehA3WUaBDuDSwzaWZMFGPIzzhN7FVtWlsApJXx+KzCYk6?=
 =?us-ascii?Q?l0FjcM0STOls2LykamRJqOZ8GDMI9JLjNSFidF2wcHVhktLcit0MZVU7sA9h?=
 =?us-ascii?Q?X5um+0LcPDW44YZx1srAonFm2fyl1aDwJIOe1sNA5FExTek0ao3bt57R8Bvs?=
 =?us-ascii?Q?vT00689lW7cbTfsBjQfHJFtadlrCmDc2vHc5LNRBPWSd9QM7UA41qQ0EbOJP?=
 =?us-ascii?Q?pefwtkpg9TXL/FxfhdiMfbFu644FkaG0qcUgjF/7jSlGMXCbNwPjzWLG8Nvg?=
 =?us-ascii?Q?YeW56TV7QsUhyfuTse48qKHB25uFykVflP0hEIbndfXuIuOf3YG2H/NlF8yl?=
 =?us-ascii?Q?aT/f8UPGj05e40voTqI6tJGRjJzqAyTbEgXm/ATAmSDRn3PkF6mUZvLxOp/V?=
 =?us-ascii?Q?fRPAIM4UChjHpaGcFpDeyCjy0UuZ8AnZ/jAaGBTsmbaNYNRV2J5q1TFHVnKk?=
 =?us-ascii?Q?LhowUxUegfVNh+lNKc4RUcEvTXNHkQ0EZxbDDfq4sDTlOQr7+4CRTPgA5VrC?=
 =?us-ascii?Q?kaa9agWVo0nDITcQUXcO5/eUlI4p0q07q9rFRF/WBEGkb+49t1O8jBYacv90?=
 =?us-ascii?Q?Adv2j/wvV9inxhU0LTwilKfS4LfBgRR63Vw+VnzcDY36p+drj1EeJtA5RFAT?=
 =?us-ascii?Q?qg7ykyL/+O3ILyLbZRi+cYDUjZUtqWkN0+GG56f2WLPNIAS8KwEc9V4LEE+/?=
 =?us-ascii?Q?8UrlB8hNRARIjceFchxevmsPXFWc2zHtjdFWhW+Q4EpOM6gOsDU1dKTWIPtU?=
 =?us-ascii?Q?4kC/uSsbx0jp/8vlfMV1d8mbkUUj1nHmrdR1dFZIwf+iqploCjlE+pHd0jww?=
 =?us-ascii?Q?a5W0vzV9M0fzhL/lYTldLEISLoqDkt2b/loecq8jJxPcOBKqVuRlloK0Demi?=
 =?us-ascii?Q?UwcOtI/Q2I3PBzCFB4/dgLqmNmHRagLE8eRiKXHw2PbOadfnR/aY7JYYUzxi?=
 =?us-ascii?Q?fsV8bdQsq+9HGP+zRpoRd8YhVH5DI9M4LtJn/tXis5FxQIWbYl0uiEVcgDD+?=
 =?us-ascii?Q?JaiN1jY4xevho0GZHBRGlGk9UCknOXQhRbqMYwbScL5ISTxxfm0YaXpnxLrO?=
 =?us-ascii?Q?hkv64xoWVIPdgUrWYhgKoxDxyqujCkS1mEv17oqb/Xi33mMTXt0Pe5DBugrx?=
 =?us-ascii?Q?M5kgNEAwPTxaaiR+MmRsVOpVwoHWQvTKi1DRpTeYmBdcRWpQea25SuLF4lyU?=
 =?us-ascii?Q?m24kPYgQSEmB8PzQVyJDSou8VB28s9u4RX15ZGu3fn+aHbHBAuVpqfToob60?=
 =?us-ascii?Q?EnImKjxomyrbOVP/W0KYy/ed1v4Siu4KKU12O61szDa4Y7eX7lXL0xw7CJ2U?=
 =?us-ascii?Q?7sckfVVus40930rjVE+uB9AlriR9ROg=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 96bb3062-116a-4e6b-49c0-08de987fc1ff
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2026 10:39:21.7381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7CCF45ySJiLAkxghB+xYZ8a2rW8U+Lzftl5dpgoGtQvDNmWsbWr1Ma6CeHAQVMf07+h7S1qah/hqNuLO3h+pEo7KAvTXpqVIhS0z8P0tNmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR01MB9332
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 10:39:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235062

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

In case $sbindir =3D $bindir we have to pass this setting to make install.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta-oe/recipes-support/atop/atop_2.12.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/atop/atop_2.12.1.bb b/meta-oe/recipes-=
support/atop/atop_2.12.1.bb
index 92665fa464..d40b95ce6c 100644
--- a/meta-oe/recipes-support/atop/atop_2.12.1.bb
+++ b/meta-oe/recipes-support/atop/atop_2.12.1.bb
@@ -37,7 +37,7 @@ do_compile() {
 do_install() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false',=
 d)}; then
         make DESTDIR=3D${D} VERS=3D${PV} SYSDPATH=3D${systemd_system_unitd=
ir} \
-            PMPATHD=3D${systemd_unitdir}/system-sleep install
+            PMPATHD=3D${systemd_unitdir}/system-sleep SBINPATH=3D${sbindir=
} install
         install -d ${D}${sysconfdir}/tmpfiles.d
         install -m 644 ${UNPACKDIR}/volatiles.atop.conf ${D}${sysconfdir}/=
tmpfiles.d/atop.conf
         rm -f ${D}${systemd_system_unitdir}/atopacct.service
--=20
2.53.0


