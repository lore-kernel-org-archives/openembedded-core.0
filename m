Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B5DC36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 11:32:01 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.89])
 by mx.groups.io with SMTP id smtpd.web10.16516.1743507111046690231
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 04:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=GmmRLaID;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.159.89, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=McSxaIlV/Hfqz+2P/Vkl3L6Jyng+gM/pIz/j5E5/VRBvR7IxWUtVGgKTncMqi055qRhafBAXkUqfJvqDYU/piTDEnT5fYcsoXhW8q4VWKxe2rFrvo/eYe9JoxXLYa0pRO6Zej1sFjHOZJLeuyZo/lvMAOHRtK+IROsZUv4NbNSqrFi5+eUKvPpYAyXlaY29HDmYgiBMZXXg9P+sXy0+z1sMGsT31h05Mer1nWWot4eUPIqcm/nkQ62tiangjqtZwIoSlpehb+xEtfFWI4btxfoeAUFAevTRK7sd2Vc1zetMmGfp47kJ2M2RRA4tKxb3zORqgqHwosAhDbYYdcXSUhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1r5RkvnMFd94EnfJ/tAj624VMePeAgpxqi5rNXVarY=;
 b=cYqyTugqNpr8nHuj8wpfaoJUBewhnTdgOhf+fwP+mTmchN9A2QVWxYQwGQVgnlWtsvqSJY/IqRlaYVfpHKdAWbevvVEAujmZuWsa1itiCo1Ud4XcWAzdygudn9tR6MIaihKeTRoCoD05UbCX2/pu6QvnGYhlByeQNrlpf9KjIde6FEQm0HY7gPL44Rj/SZcAguXj4crrWS5e4tZP7u81IWV+EpFa+CxLvRSISPFlfOHbMzmioeDfm1A1KID8iCAqXACV2qdiTkDH6hBOlmBo5+5SrNigZNP2LsU5YjIxwWzWD2yS8srHDSxbGb+sARZpvu31Xfg0mIAyiuCRNJFCtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1r5RkvnMFd94EnfJ/tAj624VMePeAgpxqi5rNXVarY=;
 b=GmmRLaID6tdCPIQs+ahSzw+sXbOIQXDLv8fN0VAxxvhK8Plb032XE89frav3/JzGRdBBIiuGyTnP29MtHD6ALL9pyPIVpApsONtasEfAbrTyZVJYLu+ZHsFedahKbQ2wOgDiwIDgo5To+YkInplmRk8f/cTnw6kML/RLUo9vLiU6EcCJ2A0hmh9cqJn2p2M1SUCUH6NqEDx1qEwRUZlzVrv0yERu/fmOkLo1huOBUJ7E4Iuj2T9esYrhnKLGJODftRyggas5KsLTvKzqaxUdpiC49pJdUKpBlqWRnZyJ9uS4+fkFaramU2RXIa+D6OX2aIRfShlkEhhL92Fs9IkAag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PR3PR06MB7147.eurprd06.prod.outlook.com (2603:10a6:102:87::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.51; Tue, 1 Apr
 2025 11:31:47 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 11:31:47 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v3 1/6] default-providers: Add VIRTUAL-RUNTIME_dbus variable
Date: Tue,  1 Apr 2025 11:31:24 +0000
Message-ID: <20250401113129.3531757-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00003852.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:1a) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PR3PR06MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: fb08bbc6-39ae-4ce7-b20f-08dd7110c986
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PE58p4196ctzX9XlucSb5YqQ9/dW09lOHNnet2b5Jh++9/esaRec502bOYZF?=
 =?us-ascii?Q?q+lBp/+uXG1UmJvsFNZckFyFpoMYB0RsfBWcyTnMqZZeBwnBhrArZPeevFRp?=
 =?us-ascii?Q?8YWWJy4Y9PMnidCq5OOJxAzj2dg5fbXFIZf1Y1p18XZBFySBkhfsyC8CBi4b?=
 =?us-ascii?Q?n7KwVKiUtrI9bPv7o8Qk4w2G7Uzuw6c1s6ZHVTFWnG3cgLTwUpo5TjJ6BY+Z?=
 =?us-ascii?Q?3cXCSQI9J2hyvsNUyWA3klqdVgjjFRk+5eHhKZFc/ZXejQcoxs3xSS5NlRn2?=
 =?us-ascii?Q?1EL7fXXQXzkiI7YOPL1cU+9VImU7foMyti+jw3Tc7Yrka90Tq6ApnM1FASof?=
 =?us-ascii?Q?LPKXhG3Mxnd1AHU8vzfVTTSsp116OaIOwkhpzi6KLkHqbcaDXLaR1eyjqc/6?=
 =?us-ascii?Q?mIWrp2huh4zIJeQCaj2jJ3vRHleLU143Vp0NItG3NebNjxVkZw6X0UOw2/UY?=
 =?us-ascii?Q?rrxGPCwz2chf53dM76weHS9L3pHDoAKSnCcmHoJOsxDTHdrNPY0oD5DWhsBj?=
 =?us-ascii?Q?IHUjr8tz8+CzNrNycnSlDrKLP4mz2Aib2aFkt7bSF6y2P1BXmtCoSRNrLTVV?=
 =?us-ascii?Q?j2WMDqK0NvKoeLrKOSG2V2YAIJncqrqrVpjxN+x7m9PqiJQx9pgFT7yhFDoK?=
 =?us-ascii?Q?k1EImKAbJ6dzB2dqkKVLnN3Rlv6N4g5gmtq+Hw6IvlQA0QXnIbT88FIofTXT?=
 =?us-ascii?Q?q1wtv/VnBOArKJbxVg/Cu0+5g+a8oqXhX8xGqJZxKELZgIUVqJn65Nkcs+K1?=
 =?us-ascii?Q?z4qP5c82R7qRstUCmm5KAiaDjiiNCroTCjZeI5FmC559/2soCt82rYjE1Zen?=
 =?us-ascii?Q?H3FheBcSWzW1FjVkyzo+1HDUyxx8w8toYj3oJQNLVs9Wpi0eqIzcbUQg5RYg?=
 =?us-ascii?Q?1Kf4m5DAZQBbBuQt0OAQEO3GZNS/0O5//g5whFIkLEWUVqK5NnanDezec+P+?=
 =?us-ascii?Q?9xT8YkM+LtEdHhgTte1y5ggLs6nBNuW3KCkv4KCE6rCIhpukHf7exV1DDigT?=
 =?us-ascii?Q?N+qud9kS0onuEloRBTw3U1Ys6olwHmoLABRoPlGj6XT7fi9+pMpdo0hBuWoS?=
 =?us-ascii?Q?W/epLqubJRfHcZZdc+ojqTgakUtMnBARsn7p3mBUesP0CL9wumZ5+dsScvE/?=
 =?us-ascii?Q?LkccFwB3gjlGUm7rBDQAFr2kxIx9/HHwc8/cO6jRznAeik7D79/LnRKhBTQ2?=
 =?us-ascii?Q?aa3/6hlSUgn1I7uabMlbpRqVyv6p5D5Z0aonzh1Amzg5HyyyxUEcubq7qTNg?=
 =?us-ascii?Q?tjQZY/LExlmMpB/WImur8gSwkuHJa7DWyTVyekyEyR1IRGLo+IYAWxfwavNB?=
 =?us-ascii?Q?OqDAh8wy9L2BuCr5XMMy8mTVkdN6HsJAqHmUCCukgpXqhBRFHTrU21KxCp5e?=
 =?us-ascii?Q?A1dKYFb9oVqQGccotHV2zCgIM22GP/ibjoqSGcb1byoFJHM06Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aYZNykMGhXKDVW1aE6NbWvmxYHeE5KxOjLiPwY1H0eUBHDIk6iuUVW6Ess1Z?=
 =?us-ascii?Q?7Y53bt5s5LVGKr6Va73TqRM4d7/9FxnO9dkteqdw+j6kgJkk1EqqTntCZaBA?=
 =?us-ascii?Q?2FprUh/1B20aQvpeq75/xovmE/eS+yL9p8Y1bbNQf99aiUzqqFi5NegIzXJp?=
 =?us-ascii?Q?0hwhHdGYMy00QSckBvMerYZOKZ+KL7h+s9J+LJWB4EPJnPeP7ao27668Zx9e?=
 =?us-ascii?Q?Z1Br7STaZbAwJTADUDeuxjSNe+LrAW11STQF6Saw/++8f66Q3C1SURkAFsUq?=
 =?us-ascii?Q?4HK6YVjv8r2IgMK08O6gyQvVarBtpiVALz83vTEFVI8HGb33sAGvztLI9ccU?=
 =?us-ascii?Q?5z9SkAi2z0MuHwrCU9wEkyeoWwEVLwSlP1aQyqf5uaXsEre81q+vpx4v2pqD?=
 =?us-ascii?Q?7b/t+f70hK+NNPALtnKrF7QcqYofjwTs2utGywaFf4KDO6lEPlosOHqCJPKU?=
 =?us-ascii?Q?dBA8KUe2UBsruYRAcXoFxPBBeewQBH0Nn9+B9exSUemf8QYR/OGuo2W4FRNd?=
 =?us-ascii?Q?bSaylAsf8upENFTiAarvSbCwwQeuBllLwZj3DyrX0KRniQt/ZhEssZR+XZi8?=
 =?us-ascii?Q?/kRjOUItKARjMyq0tJu00rSNFDEIXcc14pN4Iwv8f5+8wvxPTEh3EXYMJm8u?=
 =?us-ascii?Q?EBfSmj8p13vKrvNoHLtWRpS4nNAhMie8f0L/h5mHYllmQjNP0jW9d3btm4S0?=
 =?us-ascii?Q?zG0WQ8kcwW3E9nCBXfITr7keNrnc33uWsxVQ6x0FGM0OKsHU2gGx1tl3Ixek?=
 =?us-ascii?Q?62HB8EBGgBTI0b2EMZFLmnz3euWNkILBOdTOyu7Zo0xNxu+VN5cFmXSCC16T?=
 =?us-ascii?Q?RLScFBvrfmztnVTXFxPbo5E1pcwdSDkgRS1SUkxUW6Iwygr4EM/aG/h8JSax?=
 =?us-ascii?Q?NVn2r5/rHSDRZguuEWDpdoLKkRAyv+HG+2j2W3Gc8qpvLyCzIlFZ6CSO+W3k?=
 =?us-ascii?Q?oJbkuuwLZw6LPHWCCxlIgQHgDnwBilzt9fxfaWvV42qL9vKGPLBw8Mf2PpLk?=
 =?us-ascii?Q?tcBSfWoo/hGLJk3i082cY2avfJ7v3A2bLKQFMf2OJm1nXha27Ic41zEtyKwH?=
 =?us-ascii?Q?1mymwCHjSkS7yVx93uH540xa3U7KuD88iwRWqyKhzZmDsJkJUeY+iUhOx5tI?=
 =?us-ascii?Q?iYfPHA+ww3qrqPzqw3dIQAIlzy8/fpXqOw8//oHOKgGAYZD8fWHqpPay67Yw?=
 =?us-ascii?Q?0iRyNiLcdNIPMpFBjS1aW8MjG72As5fUGdv8SzgCNP9il58AzIQmGARVM354?=
 =?us-ascii?Q?do+bN/dEe8HgpZqYZuq34ko9n3QGym0d8cjj1oCQiTezVOKwiwTq4AgQbXfr?=
 =?us-ascii?Q?4eQs1mIgKrPcerkOzeoYAPdnDxfHNRqXqaVQV5hoSEN3fhQKdTez7McQGEjD?=
 =?us-ascii?Q?SE4ERSQERf8vX5Sy0nXogTcDYWJ9z+GN1PXjCmWojh4yqau5phvEEvv1skNP?=
 =?us-ascii?Q?lcDmj/atR2cDEwN4te20E3Ln1baRZ6aCDDX9TO0vCy7yhI99q8x8HzJcJYKV?=
 =?us-ascii?Q?847pBjCC+ERbWGJgEoWtxZ1+n20DFcNja/bFuO9Mru8Yx1TBOk8S56KqHro5?=
 =?us-ascii?Q?hvShzmClmnnzJ43Jz8RSDE+3b8ff9rTgMTPLfjCCv29R5qjN3wLK+9CZhFnR?=
 =?us-ascii?Q?cg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb08bbc6-39ae-4ce7-b20f-08dd7110c986
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 11:31:47.1948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0LjlF/lHsnkXkWcDYqC4c33cmnoIrjD3vtTdbt0duIREqATs8R7WK1oj0YIwMSvPqHo9+Iqr6OY8QpuEGmFGwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB7147
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 11:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214016

The purpose of the new variable is to facilitate oe-core users who wish
to use an alternative runtime D-Bus implementation instead of the
default Freedesktop.org's dbus, such as dbus-broker, a recipe for which
is currently available under
meta-openembedded/meta-oe/recipes-core/dbus/

While introducing this facilitation the intent is to preserve the
existing functionality, while allowing the user to optionally select an
alternative runtime D-Bus implementation by adding the following line
e.g. to local.conf file:

  VIRTUAL-RUNTIME_dbus =3D "dbus-broker"

As a background, for example the Fedora distribution uses dbus-broker
instead of Freedesktop.org's D-Bus implementation. The following
excerpts from
https://fedoraproject.org/wiki/Changes/DbusBrokerAsTheDefaultDbusImplementa=
tion
provide background for their technological decision

  This change provides a more scalable and more reliable implementation in =
place of the reference implementation.
  The reference implementation suffers from long-standing issues including =
potential dead-locks and susceptibility to denial of service attacks, which=
 the replacement implementation does not.

and

  No visible changes in behavior are expected, except for different log mes=
sages.
  Any visibly different behavior to `dbus-daemon` should be reported as a r=
egression.
  Ideally, this change should only improve the performance and security of =
the message bus.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/conf/distro/include/default-providers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/dis=
tro/include/default-providers.inc
index d3eefb754b..cebd0400f4 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -31,6 +31,7 @@ VIRTUAL-RUNTIME_base-utils ?=3D "busybox"
 VIRTUAL-RUNTIME_base-utils-hwclock ?=3D "busybox-hwclock"
 VIRTUAL-RUNTIME_base-utils-syslog ?=3D "busybox-syslog"
 VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
+VIRTUAL-RUNTIME_dbus ?=3D "dbus"
=20
 #
 # Default recipe providers
--=20
2.39.5


