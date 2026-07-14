Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9FAC44501
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 06:40:04 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.111])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6954.1784184000946738101
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 23:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=0yak4VOl;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=fO80Jdzj;
 spf=pass (domain: navimatix.de, ip: 40.107.162.111, mailfrom: joerg.sommer@navimatix.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESgWr/zyGEB9KnEvSI6q2xdPlXfavIU3H/u+KO3MAqc=;
 b=0yak4VOljXoPBcM7uSfjbU5Rb8bWEXyTqqgTYYLtGALboONMqaJzPq53iwvTHJAlayhXAm/Xel74uJlREXRoEcLFqIQmhMAIFjLVdVFtYGFNjSjRWzrHjlXEijMkiEtRD++PsJhwcaTOAE6vANTLLDllji54cxk+9pyRxng5TEk=
Authentication-Results: dkim=error (no key for signature)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DB8PR01MB6518.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:15c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 06:39:56 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0223.011; Thu, 16 Jul 2026 06:39:56 +0000
Resent-From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Resent-Date: Thu, 16 Jul 2026 08:39:54 +0200
Resent-Message-ID: <alh8uj7u-pOtb-1l@navimatix.de>
Resent-To: openembedded-core@lists.openembedded.org
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fXHdiLbS547LIYkYveTIZX8C3jTpkUSrN4JvWCbfjs9nWFL46H9xIRajx8VzuKjocIn2FvuvyfKQqFF6qOBVvg4eT17BSQK73fKqDtJK42xL0PoQuuHOWBrci/1i72g+7+Xd08a0/oLYKzUsMkUxGF9+j420NVaoDCrS5QgwVFQTQxRN9o91MsD9LiVugpE6/BxOG80Rz2sOurTJbucAUpkPXCgQp3GyUcC/AgP/VfMJzXP1wiEYB5Hr3bLTHMFhiWWRgbmoP9MWzQIcqmsBKSe6a2OW7tabOQfYDb3KcHWU0iEhjYyAYv2EpZhij4odgLA9jGH8RCRQm1wmCI2eLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1zIeWcEiu5obecbur0elbngKiUYr8/uI45CjY5wZwA=;
 b=FLpZrqqnjvbOKiKqtLFWgBwhiAKiDCg4sL6McUTSm3hJcqG7i64+O3X5+aCdDwAFudl7kBjHgN3a37JQ6wYJfKd6onJmG1hczk9vmS+WdGBx8dkfURrX3phbkKA+y6gcRM087Ufrxbc3IFCDRsod6a+rI9oTm9ZPMtrFwWUmsET8uQIlOuvUkmjYmDpFe3wy8ohKMRTxar+5M+/ErG1dbRFNT8Dkw2l7mp5ElIfmI/Wlt+zoOsNr9sw/c3vg1CoODEWqfyORrvONnx7o7WkNMlj5inbX7ashJfyDCZQ7NdmcvUdAAainEcyqIjuHNorkxpUsI4AgvMJd9FoqaAHosg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1zIeWcEiu5obecbur0elbngKiUYr8/uI45CjY5wZwA=;
 b=fO80Jdzj91KUkDD66yVMllpaXgiZn5e33t+KQojHqzShvikW4w4h2SJRacidTS32QLyyAMkqsgqOkjLc1KfN2ghyudXOyV8/rxP043c6jdLFUG0VPJyO68wxbq95Fn/mHS8WzElcMDUmhFng/H0iGvThachelG4NyPXMBXGOiIc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Date: Tue, 14 Jul 2026 16:41:35 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: <openembedded-core@lists.openembedded.org>, <joerg.sommer@navimatix.de>
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 1/6] dbus: Enable PACKAGECONFIG[audit] by DISTRO_FEATURES
Message-ID: <4fb61a12d8843e728054e9c46c6bc09c50aa2957.1784039919.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <20260714144019.2771283-2-joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260714144019.2771283-2-joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:67::19) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
X-MS-TrafficTypeDiagnostic: 
	GV2PR01MB11835:EE_|PAXPR01MB8872:EE_|GV2PR01MB12594:EE_|DU4PR01MB11955:EE_|DB9PR01MB9008:EE_|GV2PR01MB11835:EE_|DB8PR01MB6518:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d80a55-fa3d-4851-285d-08dee3050cc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|14060799003|1800799024|366016|376014|23010399003|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	ijFiOx+HDRONon0lQY4rHmgDWTBgmxdwiQioDfq+Z3XPUGBIBQ0nPGEomDCT6kJoW9DjpgYTJeVaN6iftAedKRaGcBOla+pnB5UP799L1918c9n004sI9Ytr/QtKGhKanQOS0AJi1+y4GalV9Uf+4M++EMQGoCxdcECvsyESYeVoenjH+bTCReVHSrtEmfNw58nGQb44eLkUSIECRXTYx71QgDUWPlc96RTv5rp2DnTghhtLZ4dQYnOuBo3VTz44w7XfnlcIQNGT8Liah7n1KLEPgSO/r8X/PgkXWkSYxHkufCVlUZaKhfBZYFQrbColvEqt/8L0NzQ5i2ecMqKAIrG7ItyBSaQuIcXYTBh5dobJBQpGnw3B+pG6onI6ZbvxX8L5JMlxQXriiOS0GOTbjIQV8ImMQ00rXA7SKq5ngea+1P8BYyG4uDuzqdxq/4I8SZchx8OwFlhvFrTCi1U0L/naExs8lFPT2shDaGBZfiNmpBSYJmCJ5O05q3y6cmFKGrEpIHeDDvjzvkRB1ocKjRwnmm8ggJz5vXLfaWpbsbf17JUIPbh8hAxK6Ncb7GpmNYEcRvth5AJVnHBr9Kj+T+0IFNvl732E0/PTUcG00NHQN/43PohKs4R4aRlb2bwlCkXJ/PlSFyIT4vKyL1qmYQh3susjvu08aURVWk9bWeQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(1800799024)(366016)(376014)(23010399003)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-CrossTenant-Network-Message-Id: 789a3393-14aa-4510-6028-08dee1b60218
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 14:41:37.0011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g2HnhqEMP9lhbZVbYRmg/pHAUWxj17jyd2YtaWabpKQfUG/8T83pqfsj1qVuaJUF8lCB3oSZTiWEVnUhd4woqtktgoPInvqXWKs3doPS5+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB8872
X-ClientProxiedBy: BE0P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::16) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	789a3393-14aa-4510-6028-08dee1b60218
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?4/5rNfLdkxKuai2yVfC8rfSgoomLHhSZGsKVZrRu6T+79cNw+ByMPKkuYY?=
 =?iso-8859-1?Q?zZbs1VGYuq7Bhd7qdUECNS6S69S4dWq+BuMo3ce6E7dIRAal+r9rZkhMju?=
 =?iso-8859-1?Q?blVLKOEXvosgkxlxDFZRCFiMDc9X70rcN2EeU9P62zmANOku03CVOdELuJ?=
 =?iso-8859-1?Q?KkQ9GFZvh5w94095G1Sda5YfFvPbfkkWRXdIfFzUoql1FjutTA34FNLKLy?=
 =?iso-8859-1?Q?pyd8QODJqB6sFzBUFR4iw4TiTsjrV9Tw7aC3XkZrlMRsLF67uT1wRR2hPS?=
 =?iso-8859-1?Q?sg2gBnEj+21bF9ZfiUlTbocT6/UOK+LWUoBDN5sk9Ctr9kcoN6Yui7dhPJ?=
 =?iso-8859-1?Q?YyNcrSo1DWkdDuNWNmbNCW/ElTmHoZqkgCDktg5CTHOGYh0UZucyCJnBGf?=
 =?iso-8859-1?Q?78jj9C28iFbL9QFUb3+wWcse9vFLBeFG9zhLA7dzjadel+4hEFG1Q+Ztq3?=
 =?iso-8859-1?Q?mJM17NFAYtFMc0ws7dUbIQTMHkJ+sMeh5GCRQOqVJ7hJp+mAvrTEvVXdCW?=
 =?iso-8859-1?Q?74MZI9TI+PX64bSQmVAIv7GZDZW9oPrGDXDw3ccFioICfMYroBQ8ZILhK3?=
 =?iso-8859-1?Q?W3FnuNRKHzXswBEwg8czUUmJE3SXeHNPk63chRO60Qqx9tAtTOQioflxyE?=
 =?iso-8859-1?Q?cCo8MwS+UzPLZbB0sTV/+HRNPW7DFnq0eGLYCqgLA4cFnMgKz+WJD774KS?=
 =?iso-8859-1?Q?S4a1/IULOPuxKQPddkKAnTVi1Nx4j7T3bSzHb04oqhsc3RRSLR0Ws9shKS?=
 =?iso-8859-1?Q?mdRub3PRueGuwtobMJ5xVlJINIg1BbBJ4sUon0MhLDNT8H+f+73ulyQiSI?=
 =?iso-8859-1?Q?MQ5Gh5gn4/bdxzZ/+y/gqG26NNYwaT0nzWOWvPmkqgJjZ8nmh1B60cNlN/?=
 =?iso-8859-1?Q?xiGkZ9Ki7YyoommdmanPaxbyCqOlJ4K1dgen58Vds1c5TblRmK5UiJ4D2z?=
 =?iso-8859-1?Q?cUxpalEqPpyp/jnI2MWuKZq/EW+KOnf6yfeEFI+Cce0zgFLqdPQWl65SkX?=
 =?iso-8859-1?Q?T/sVV4/h/itqKvBckl/T+kGoBVTFLI9BWxzqNzURnnwJfxhLQfDa0hcqYM?=
 =?iso-8859-1?Q?qwooo8zf6jOVLgjxGTi+D/MZPBzKluXkoM+gP9FeR0PXVrBN9ZTF1eLzSr?=
 =?iso-8859-1?Q?yhIPeXf00tAiyISA/X1sMOe6+zGcbNpU2ErbpQ9dDB5Nyf2k5VBgDFu/Zu?=
 =?iso-8859-1?Q?Mx5w2ao/Sjz0Pv9SPp/N815GAbGe0xxTD99gyywfhnK1RLoXphumQFtZWz?=
 =?iso-8859-1?Q?WgA88/xCH2tL1euB79rvqLLRTTdkH6oSVOw7/XwlnH4Q6v8TUf2ErnUNgE?=
 =?iso-8859-1?Q?y7m47nGt+1db6n6QDvum81LKCd7Ikdex2vA8DSdXOjj8VKiqnysx8uZlP5?=
 =?iso-8859-1?Q?8BMTUpwCOE7j3f1/8nnWaqQqKol6dnOwsehyfBNSOXdH1A6742tBnAiA1k?=
 =?iso-8859-1?Q?mFzTLEpKPWvk426SAyI7dSqQhqQSeWiGSuHKmXsMpxXm2pKBDU62+YHKqU?=
 =?iso-8859-1?Q?0mhIQ4/4JeyMnEYhJ+ToGsHL9Tq+dAPeOm+cfQTpoI0Qn6zKIop52Jy7Kc?=
 =?iso-8859-1?Q?qnz5EqR9twfLOD9us5DBhYxy85RXRi+Blus/EmNlW0AVAzVeS7y/7dTpm6?=
 =?iso-8859-1?Q?qskU/nLoCJ/3LhmRnEc25n8ySqsLmnX+AA+iDTeenEzPlNL8pVOkEaw2mg?=
 =?iso-8859-1?Q?vL4Lr9fVBbQ8aTBlk3cViPaA+/fzo9xnCQxlqgDXHorKa58h1djXGSHjbr?=
 =?iso-8859-1?Q?MW+DLBXfwRteoi4TV/W+H0+7IwkoKm3f/4aRAIsdOw8sabw0JJ6UxkdFo3?=
 =?iso-8859-1?Q?Tq23pUbNF9IeEVS/0e8x/Nzn9puE5WU=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d80a55-fa3d-4851-285d-08dee3050cc3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 06:39:56.2794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B19EEbBP1nBeOkQVkmJJ/Arppk8nC8j7VT74hxq2gpXl6MkHvQJOXAoN1Cp7HfPIFQQXiD0LOZ3jxtW6+J6aHaKtQtoO3kl+2E+PTvjEMHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR01MB6518
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 06:40:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241056

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-core/dbus/dbus_1.16.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/dbus=
/dbus_1.16.2.bb
index 7425bd2364..1fbb6fe509 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -26,7 +26,7 @@ EXTRA_OEMESON =3D "-Dxml_docs=3Ddisabled \
                  -Dsession_socket_dir=3D/tmp \
                 "
=20
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', =
d)} \
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'audit systemd =
x11', d)} \
                    message-bus traditional-activation user-session \
                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', =
d)} \
                   "
--=20
2.53.0


