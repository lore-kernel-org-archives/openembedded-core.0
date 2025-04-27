Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D324BC369D1
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 12:10:48 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.105])
 by mx.groups.io with SMTP id smtpd.web10.25177.1745755845482655833
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 05:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=FXLeqK0I;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.65.105, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y13iiNs09PQCTNpR7mA5mAb4C3cF/3W39QodaYXH4Ye3+wJ33nZvy23xV7DyLZalnMDWaCPN86zxtsHCVOD8urNK2P4OVmn8RnkHZL2oOWgj4ddDPkBXi7q5nocsBNoFLRwCYKBoZX/MZcRXwcq3juux26lPUtVdmcZlI/k2Hnru/xRV+CZc658yu2Y3iZzU5jEad4JgGV9mEbwp4a+DUm1oM16nkkzq26cE9GWvtflLlzsAQJ41ShunEOzIG/zgD037uh/HtXEXR38ij9ux67JudKqWWRhZfFgNSKD2U6loTmbZ3zLHMa+WQuvm5BFfI0FN3i+EeRXLkhN3XJDo8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqzpgR5D3txsHSow9mK5YHG6YVloWCDwnbzJRHfR+vg=;
 b=hdomQ5RJqaz5/PhzgZlqC187kdxZA3PwQ6/Xya69OxteIJtLrJUpzZ1R4eXBg8oSm7MSkjx+ZfVBrsQ+O7JoD9FAl1LrSwOOBdBdmE04CUzZd/HeKMHzvAgN45pI0onVbIWAHg3FyOAjcW1pIlTA9s5jlouh1h9SeQ1ANms9D6ibUJNIZIx48X4nem87nse/IVms1QpJaItJx4q82aeIf2GxVOTxr03Gp1957UjuC/RRokhmKxm1qQe7DsDr6K/JbMowGwWkOUz3T+kEW8NmH3nRoaekqVGoezBfgG5B31SEAyyph0Xge4WKALc6AsChxtqbMAcV2qPib3AOCjin3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqzpgR5D3txsHSow9mK5YHG6YVloWCDwnbzJRHfR+vg=;
 b=FXLeqK0IPEXVNuKp4SkrBnJUVX+1ZVteqly5Dh0DJqgQAtQKc3dValYo+jKrg4fS0IAreQv0THDV0UapST91a4uwwKdKKTrI4/3OEGthIPOF9Pgy7cy6QzphSBj8OFfckC117G/DHDYBOWBcUAPVjjROWw4Rt1WN3m7ycQ8SKWakgauMkoGnREgAgbGannp6zmL4TIr1ndrYNTFe+0kKmeVbIet9EsdyasxLHZSVOpjxxkSB54cspR5Dm2OA5WwyurJGIPkITZ5L3GlsmrF/kQgy04etDkEh85o+OebVetN5KTmPe1EjvNdOE5+VrueUN6MJY9Px0DOFy5P+uXxBTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com (2603:10a6:10:371::13)
 by VI1PR06MB8759.eurprd06.prod.outlook.com (2603:10a6:800:1d4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Sun, 27 Apr
 2025 12:10:38 +0000
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522]) by DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522%4]) with mapi id 15.20.8678.028; Sun, 27 Apr 2025
 12:10:38 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] dbus: Remove 'dbus-x11' from RPROVIDES
Date: Sun, 27 Apr 2025 12:10:08 +0000
Message-ID: <20250427121008.2082310-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0000366A.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::386) To DB9PR06MB8439.eurprd06.prod.outlook.com
 (2603:10a6:10:371::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR06MB8439:EE_|VI1PR06MB8759:EE_
X-MS-Office365-Filtering-Correlation-Id: af7269c6-b20a-4299-1265-08dd858485b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?au+AqpEUDlJqqiXAIwUyNRiC1kCjQgnH/eISk0WOdOjDsmNvnL0zMSqsfB6Q?=
 =?us-ascii?Q?n4CSfdDRJQ5EfsgYIa9plC2foVtCpXUv5JqvkKscSNrpodaULm//B/8Qeg/c?=
 =?us-ascii?Q?YYMoltUatSIU+CZXLnPCwD3M4300CBkIL/TMVsOWSF1EA/8vw6ArAetQewVI?=
 =?us-ascii?Q?0/UIwXmaI4vQLXBHc3RYr+c1J3vzHh1xWtQ6eDZDWSMZKzPze4vSrMd1OhCq?=
 =?us-ascii?Q?Yqefo6HoNIpf0pxJOrXLOlY+5jBvx7wej025aODM+WtE4t3hwCbzNJs+1P0i?=
 =?us-ascii?Q?ByRDJXvbLE5No1hmz9rp+zsi8ODY4ftqCXONIPkcKRa6fdUS+TMdISKX2gfL?=
 =?us-ascii?Q?PM0OjKTvaiIsedjpqUsMu/mgcmliw1tHkuc0/XzxWUo7PyK/2xy7uSXvSOl7?=
 =?us-ascii?Q?rRzKlLQ/wEqoQmVh+zDEjiaEzlDGj+bypd0LY7//OIJ0yNLJEQgHo+Plb6CT?=
 =?us-ascii?Q?kuz8BAR5EneHVbDXjR/steWL7TRQYGwmwH2OAhubny1ycs1IisYezni3cbDo?=
 =?us-ascii?Q?80NCB24sVntRQCGahuTlpuCjCNl3XhJvDAXizlGdoHF7UkPu/eZI1lG3l/Iz?=
 =?us-ascii?Q?1HwVYx8XrdHUcCc36PysNLolGYZMds0lL77y0iJ9LG0JI08s5WgOZBZX5+d3?=
 =?us-ascii?Q?qEDgB6k3dtlwEcxJvtz8RwG4c/QAC1LjNgN7V5a+i2fEnKQd9wrVsLijxtKg?=
 =?us-ascii?Q?0E99hbOXzuPi/wXVxTUjVU1j3IxLtUBHasvOvOmBgVn7YiJom4d7AyjZ0aHa?=
 =?us-ascii?Q?YoOALIoHd/A/LMXbnzSyD7uuFRfx0NQw4IAO7Mu2qkbuxs2gBRBu0D3TWGbP?=
 =?us-ascii?Q?r440c8CcRfWO9FFIDwcv7AfAZPq0+TKOACe4+vXRvn8efXMKArmS430Arvt5?=
 =?us-ascii?Q?haI0sXqMOg7WJQGRuR+ks6bUiXJ1aBcTDvM3kTdTknlVCbSLaFL2onKIV+wl?=
 =?us-ascii?Q?Fiu9IW8tf7/C87OXFEPXOnzGFLqW900E8B88r2UBZmS/0CIYc+8c7mnXPw+Z?=
 =?us-ascii?Q?DXlsnyNTNQj3vYetO+2awji3aKdeY5cWnFtpoPR+F7Fy2xfvM5TazTSKAFK5?=
 =?us-ascii?Q?QmRIgts76zFfx8Vx6YglglroSreQwIPKCx+/ZD4VKg7bouAyeH7SN9L7uCGl?=
 =?us-ascii?Q?IRRKt00FSvD+YgzMlsCmfG4XMcvkl6+tGE2K4t0wCG5U7dju5DyFIec0gB5A?=
 =?us-ascii?Q?fFM3axdWVDEIww/HwbUIGE8QXdDoB2WoV8Yrew88orcJqzdnJRFHfGm2De9a?=
 =?us-ascii?Q?xc6i0WDMXx9Cj9/KAPxuuZaY3Ni+bSipLcjdc+CG0OzlVCN0Zw3wOqjelqnE?=
 =?us-ascii?Q?PZb0eZOaGdqcwtD6PNXHZGLiXZaby7Y7JCgGxa0wFOeUTvdWeHAZK1gkTtkk?=
 =?us-ascii?Q?0CPEERlUekrLWkPK3ZnxUEyNQNFK9TjlRHvE+Ge0w3is/3P+QcFAZv9S/Ux0?=
 =?us-ascii?Q?mlAbtysv/23Na0TFR8BnV+FtAdtJi//q0NCpU++qGeOPqbQhJ2wOxg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB8439.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4S0YvwHCbzIfL65Sl+4w9oKLYnFfTeNRYrz0SD8vtujr5xbMXVg7DwXmTBo6?=
 =?us-ascii?Q?zUZgYSGWZxPyfUp4w3zVJF5N3Via+gIRW0g2XOvxkVX+ItDckMTLkwN20+cD?=
 =?us-ascii?Q?Udbx4Rl0Y9Ro9xxx5BR2YOaydoh6MewLuVrkz3rmW3dqXmhcrGfHpf19OK+Y?=
 =?us-ascii?Q?fZB4qs2L7+3NC+H78aUF5sRBY7XmVaRO7Uu8oEuUlg9lvOXWvQ8J9L/F6JZb?=
 =?us-ascii?Q?KA9dzbS4ja0TPM4bKxJl3wI0dsFiap8SrJdKSJc+9CJkMKzx3Si4rNzNYZjU?=
 =?us-ascii?Q?b1zQfZ8VkzEVN8ROPHnyx2Iv2D0hBaUrVhYRaMqcJFfCtVJdvnjyhebB2qKP?=
 =?us-ascii?Q?EBMPEBqVVBY9SeUpPrE4Hn/eiU6ouQOpuMTwx0MOj7EHCHVmpQojrdlSG4F+?=
 =?us-ascii?Q?5a579kMXMT3R4PNJZne2QQoC1R7oDFCqV3i4D/jCqm3J72R8N8fqMjNGuinS?=
 =?us-ascii?Q?IuLUgwf67wLhcugYwr+0e5PF0IrwV53JE6EQLIvASG5jj427LR42RS82Ayt+?=
 =?us-ascii?Q?BLh08kcBq2eWjOmN41BkMTAGbMPJVaJUFx11ok4Q77H9SqkNaMqUGi4I+j2j?=
 =?us-ascii?Q?NN5WfDQ3Bkp9n19H0CTahh1tiJrX4Rr8pWyNq6bZSZh8Os6IVJ/xpb0iAONO?=
 =?us-ascii?Q?H/KBv+EjHn9On+F0mxgfZvfSpe254fmC8RahIR5Ghwe+uXx6uyxVLuh+f7mZ?=
 =?us-ascii?Q?pAl7DkK3DWwJi69SXn3wuxoEZaKPf+CFnQ+x+5npaJr7oI3KVICfhPItYDsg?=
 =?us-ascii?Q?cUGBMAmwbBrF+Ow4sciJ6LMMaUF5HPc4RUEJlWDBGZA3hNiMOQ+TEkvyl8xi?=
 =?us-ascii?Q?r6U6/03hjOVimhA61oAd2P3LbQxGp0qn2SdM6GYwfrrHFDU3v/nNWMREyoN5?=
 =?us-ascii?Q?LXJBsVTzChrktE3aaIc3+Z7nWo4R/uvlmy0G78WMlqCJ50XztKMyfP5ACy+Y?=
 =?us-ascii?Q?AgsJYx5G3ojg98TC/40JGDwg8Fj2rAxeMXL1nmMkcZyOV1IwWXxg5urOqw5Q?=
 =?us-ascii?Q?AY82MANuRnP6nqICFj05M+5Xw7QZyPsHA710JyXzoqunA29HFd1EMB2ZFDv5?=
 =?us-ascii?Q?CSgPsOPwXUCWHIyvzgC+VjeCBcUzBELz9SwsVjTmTpJAe/p4rcrf18mV28vm?=
 =?us-ascii?Q?aA6BaP8m4VsTiI7b082FBazVZSG66aycvdnm8ydpdz2HAKB0l/WR6Nme1gW6?=
 =?us-ascii?Q?8NcfDxzdsThVO7rfOce74DH009d1kJsac1dp+7gumPX2gyGu+sr9uTqs9WfC?=
 =?us-ascii?Q?CuZHLYFxhu9v934yGosbBXVSVXlmjPFoiqe//LjWVZJnxJ+O07EV+MNp8YUy?=
 =?us-ascii?Q?vRUSwRTrpIzlFO5C3hiY2HJsV7RyS33FLt4n0pcnyeq8+GNGn2mTZFNhPkID?=
 =?us-ascii?Q?3ZWZ7lHhAWcgkAU4Ajc8Va+3G/UzzM2BVnJ46DhhBsr4C1OrMRr3Nfzvq3RX?=
 =?us-ascii?Q?NqNFE3rlN1YJHQ8F5Cckvhn9HKC1p0VMHquGfE40eapUrFIOGEBM24pdia2h?=
 =?us-ascii?Q?SFIi/3iRm30gN2Ts7VPSxuNsMzoUZMWM7TV7t2yxUuF+yq7HWjdAla2mff0a?=
 =?us-ascii?Q?oSQfB4WZ0Lhs9PNsU43xER7Z74Ee42DpS12JfgeGdnqOAvoq7aW4vKz+yBEN?=
 =?us-ascii?Q?qQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af7269c6-b20a-4299-1265-08dd858485b6
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB8439.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2025 12:10:38.3530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PEM44jcU/zwkYxg6NVAUeNYT6Re1VDL3A57Q9tLzz9npO++N8w7oLXKWKaBarX8xgTZNTJ7mP8yH0ZvFdToeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8759
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 12:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215554

Since runtime dependencies to the old 'dbus-x11' compatibility label
are now no longer used in either poky or meta-openembedded provided
layers, we can remove it.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/dbus/dbus_1.16.2.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/dbus=
/dbus_1.16.2.bb
index eeeecde946..caff4c079b 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -67,13 +67,6 @@ CONFFILES:${PN} =3D "${sysconfdir}/dbus-1/system.conf ${=
sysconfdir}/dbus-1/session
=20
 DEBIANNAME:${PN} =3D "dbus-1"
=20
-OLDPKGNAME =3D "dbus-x11"
-OLDPKGNAME:class-nativesdk =3D ""
-
-# for compatibility
-RPROVIDES:${PN} =3D "${OLDPKGNAME}"
-RREPLACES:${PN} +=3D "${OLDPKGNAME}"
-
 FILES:${PN} =3D "${bindir}/dbus-daemon* \
                ${bindir}/dbus-cleanup-sockets \
                ${bindir}/dbus-launch \
--=20
2.39.5


