Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ABD0CE7AF3
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 09:02:54 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.119])
 by mx.groups.io with SMTP id smtpd.web11.30525.1725613362147603825
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 02:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=i6c+6s06;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.119, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/P945ZTPNoLYYnWqkedTGUAlKMaxlXN10Td6+2gmDSlYoHW9mvB51vcwxF++US2fhRB2xiVzml/UCyS4DWfugp0E5ATd8aP5e56rb9/Xy3AvwPwTT3PklbxHc3Z+VH1xht3uL7e42L2ABsOXxWBqifhEnYM7lpkolbvTJdwweAYXfGK3G5u21pzePWlkxB1hlsOZVUqhBm9wqlyB2eM6F1dHO+YvPqaNIgcJffWjgX/flzmdG1imGFz4i4F5OzVgnqjgIPB9FiYgDlZFyaI3ltsViDXUCUiWVJrXQA8ag3t+WALU95W/600AXaKmwRj6SVqYY8ZgSB5VyVFklEFaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v73ytWxQs+d1c17ygFFXMUn8hMd11eqSMYBR4zUcg/g=;
 b=sxVRPIK2fJwdW93WZZO2Tu5+pyEdC3oIXlLDyoHWe7h+MbgWtbejPfnRbKsdb3wD+NjEhPMTtjKrx4lyatcL/7WQLW8WsB6mqlGAPlg2wOHnrn3or51sgSqQzMhC1m9sZVxzYXDDbMOnqRaAXpLef4lJiOfQAlxMf7lRX1TSsqQCxeVT+OsePIDGv9W1W6EAW9CQpnjf0oP+niglF4cwUPjtdY3kGF650rqYHGN3YKsbiOJG8R5bqnGVKFI5cWQ4i3djx0XhvyipSPT9+rgsPdUqwUJwXEYuBeADch/WSvUQzKNow/lOEqNuvXXYJQQe2qWcCXjARyakaPSZ8nFB6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v73ytWxQs+d1c17ygFFXMUn8hMd11eqSMYBR4zUcg/g=;
 b=i6c+6s066DOfkENtddfaIPPEi5m6YFW3U2VuZ6TjT/P0JcZTq1Tjx96bS1AVOoZif2rEjH0oPBK7TzjwS1FEU3crnCPmw/4p9jHUUb3ZK3lyumTih+EJRYRuEAOjAWzhhEzdVDddo4FS+d9lbg5AhLhK+nen7ZXnFu/r4y6brSCDayBZACvBhUFMBLtBC+C2q/7h4OWjmUyvNLBU6GpC2UhVAmf5NZWObqh+BbIDJXRHkx2p8efwNfzBLTnTj3tFcFWZ50Vfe4OTsxULG9iE1PiBss9bZLeGZWNHDh2ERnvGsvXN9xMlq+khHWyxnltav/y7Sd/NqWdY2ljv3Ur76Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PR3PR06MB6780.eurprd06.prod.outlook.com (2603:10a6:102:66::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 09:02:39 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 09:02:39 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 6/7] gcr: Fix LICENSE
Date: Fri,  6 Sep 2024 09:01:50 +0000
Message-ID: <20240906090151.513160-6-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240906090151.513160-1-niko.mauno@vaisala.com>
References: <20240906090151.513160-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0020.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::6) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PR3PR06MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cf0865d-9b7e-4805-50e2-08dcce52a88d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JUeGnufgChyxJ7rftU7UEsx83hkI3llKFoYspA2CgAIQatHopIjnHvVMEQ3I?=
 =?us-ascii?Q?EDG/7PytBw+lS+OnOZDWf4IEoCHh4wwLFByi59FY6N0JH4TIiAUTdtLwOn9Z?=
 =?us-ascii?Q?EjaaACEe7lk55wQBFRNe5dHBTI+NtLGPoMPLQGA80slRmI6ttBaf29SZWdIb?=
 =?us-ascii?Q?J+K9+DVq0TDN1OAgtDYS189iDE0YZtZU6lf9g8CviEUYDWKIzyq4+sQHOkCW?=
 =?us-ascii?Q?MreQDCeSW0I3E8l+FmR1TYeBLHj8l5MSqa19BNILRVZCLIQEAaVQDVdI02F8?=
 =?us-ascii?Q?txqaGFFMKf1Q9mqITkHKjerpU/jJy+plHrN5weYRjGzllZRtWpgxdzFIW+G2?=
 =?us-ascii?Q?shPLbKIwPGzfi/sxxP4F9cB8SXnPuanu7kwxAfzIRgNEmo00xieR6yE5ERJE?=
 =?us-ascii?Q?G2yPOdrQuut6uINQN6kD2HiPwOfhhGBabCIpUWHQlkvZPBdVeodCXW92Yxie?=
 =?us-ascii?Q?ceMlX9vkCGcj9oEABL89KkrFTevTcbfaYHdON2U2QfB10hH4jyY8Ztu1l8W5?=
 =?us-ascii?Q?odYjWpMmN6fBoteKrq07Lnz6SpIG0d1j2TxgsGdXQRGAUrUmwD4iyR1SVbbz?=
 =?us-ascii?Q?dRK8+ZsNFrf4R3LM3hjFGrVi9NtSwu/bEbWfHYn1b9Flvk/ormFyCJqB7uEQ?=
 =?us-ascii?Q?OG+ZB8ur6/1H94sv+E/0rw9AkVAZ8aIyXGgMstdChRPvHFi8tc7AbsrD5WZg?=
 =?us-ascii?Q?TaSlza1XbnzWNyb64TLW6ViUv5lFMbgbMQJJKKQkLOYIWehRFNu80Ym/7FsL?=
 =?us-ascii?Q?Lxh1SCLJlPeTH+9CF47JOcfxWVYhl5OJ881hAZR2u9NPqEtibq696EhQf12p?=
 =?us-ascii?Q?67My8Qpxe6nHGSgmwBmUbvkTkW2wx70KVSsNuVpxNb7mA5mlqHrWQmi1P/bU?=
 =?us-ascii?Q?BIk7xtgp08GiPIJJJssvSNOKaeE7vR3teNgB+4rDWsa5W35T+7VTNPlKhJ4H?=
 =?us-ascii?Q?8UEu4vMrupHtfzhbJve879vlQVyYb7GpYYdnVfWKcEUQ0fe71frL7+GwqLwL?=
 =?us-ascii?Q?swOln/G16LLVyH44uBr/ux/5Hg3qHEAMVI0BSNOn6USGJt+rfUZ1soV6UrgY?=
 =?us-ascii?Q?2xzaVYjWOA2cODNSWNFt661rUn3QWNQ1jNfmeWY6yaFR2kFDbpBmVTP1rypI?=
 =?us-ascii?Q?5WU6YOpXuDdXJgeH55Is18/MQzLV4NvImqINqL2JVUpzsn7Sz8i71OVSNDZH?=
 =?us-ascii?Q?xhspFxI/QWWMA3CTS8X//7dnPs/w2UXS9OIIdKJf73j51Od2QHSoTI8SI/tc?=
 =?us-ascii?Q?OLZxcu0uIHt/WioOM2RlnYXaYQ10rtj86MsR7spAnajrT0KTSxA3pgJtO96o?=
 =?us-ascii?Q?xvfT0sDDExmqyJaI8KOPkgoLdTWEh8/Xq3df38n7gun+EquHPl9yhIvqoWzt?=
 =?us-ascii?Q?ee+v2VrbelzYV5d+jf3cFRawGMm/ad7vJ61Gjg+X53F3lRlZng=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JW5aI8WAaRtV7jKQZ1jGHM5KCc6cIB4SiZiOndxqePkEEy7ubmj014CEcqkD?=
 =?us-ascii?Q?66CB5Khzw9uYPLrDoLDVWw3dlJmvqommWoPEsjcjW4l0Y1dH9LaLlnQ/6Kot?=
 =?us-ascii?Q?NPSALeNzpeZGDv0KWuSQGVcEuwlVDaLTwDE8fd69NEevxCgKEKDfIp4wpNLw?=
 =?us-ascii?Q?reR94wtvZNlvZ6Dvm+MyfJaKz2J+mF4c673zFRMigITXZpLgotkm75Mf2fk8?=
 =?us-ascii?Q?TNpMuwgcQJbUg6eyMi0eCfqaMuNpyYjnQl3zMs7z8sin0IZtXazbUCNqmF0d?=
 =?us-ascii?Q?dGntiIuPT/uTCcY3CVXhVJVdKtcI61Od+BubLW9ylauf6qV8YRhn3XLFy/T6?=
 =?us-ascii?Q?+gi5VOdP+dKNoQfjSM/Ij7ZGcLkprSrs9CLW8jSUYOM00hA1ekUGBhuaVxMx?=
 =?us-ascii?Q?HDIW3fqtbtKjwAfKh6k/MqIiYV4WeIGZuXgKUtrPesSmw2AlmhryAYb8Nijd?=
 =?us-ascii?Q?7Zps9r0Ydb+S2J9oFjHmr9qLifqwn3z9FI0usrD4+ZwABNt2aOt34eRxRTyu?=
 =?us-ascii?Q?NIQIBUEi/rdL1cqdfKrO4ePiyboKAHy96eWp7amhd2b5/IpyzaC/b6Vxmuxh?=
 =?us-ascii?Q?9I3H3vmcB5JqRMpezidfv54qfXYRHcpLsbORqoGoYFmCQ+r5gsTEhzRNDfS8?=
 =?us-ascii?Q?D1QiUQAFp7RonqpT40o+YGCirVt6NkxCS1fYrVXgio077ARBjcfgBR2KumPB?=
 =?us-ascii?Q?75Yv9PF1LqdECry4ISeX+ETGaNUL+L/YLIHr43l1EfpMbYBr8z93tA4pA0OR?=
 =?us-ascii?Q?nflRhjwzrm0wllUkP1LG/xagWl3t3mUnOSLNRijJX6FaR///tly3Xw5sYqMK?=
 =?us-ascii?Q?apuK9/t3EFi1Hwti4aUZ80p49JxjqobO/5BQU2Tuulju6XYJ73Pvvitofl88?=
 =?us-ascii?Q?GzEzfVaBnHzcM+dPJMb3n7mOjEyw7cvWLhNc4/WCRdG6Hd+Z33olVyVcNAOj?=
 =?us-ascii?Q?RI4ALVoL2CEalqHFLXgVjbNeeniWsPrpmVR6pBIawCqS9dSEz/9dxaJ7ID8f?=
 =?us-ascii?Q?1kANe3GSL+YH+r+/aqL2dcTLRcOiLHOk+EZU5ihRyo5YEybJdUSSGGAUVYbF?=
 =?us-ascii?Q?UI8zizcVCu0/dyoW+1M506R40EzoHrFKF0rMVeKYImBk+QFjPm7kh0FCxI5N?=
 =?us-ascii?Q?qGKiVEZE8bLCRnYr8KEfqWskwZJW1PtLNqBmn2w2aZYnzksahwwdT3ZQagkf?=
 =?us-ascii?Q?6ZQP4MzqKaLGbM4CWlhcmORQzuKikwYPuEVeUbQIywPPI/ioVklwSWp9LxoK?=
 =?us-ascii?Q?D54ZiUnBGVjsj8tt1IwXV/Eu3IVpfoemgu3rYH6cc7NnFb9DFJd3dM66sonl?=
 =?us-ascii?Q?vA5GsAxrqvTfaPI/DTRKxRXu9h5RnlC2O08iUAFreuT25AfGqyi+XL0JnIuz?=
 =?us-ascii?Q?VY/lodaW4NmoddOTjER5xyxMvMFaBcTmprxOu+b8GTQu0hNOpwMxusXdr4CY?=
 =?us-ascii?Q?LF9hzyGtU1Mw2vEZX/VMApUOl+GSa4ATjYnGD2SoEJXvHscQtjzLGyshx9jZ?=
 =?us-ascii?Q?s0eWMsdhh1WdFBJpLow9RT2mxpjXXkYx8vTzg+STcZfHNtD1lLFfd1qFI1tu?=
 =?us-ascii?Q?0HNcjA681cp1Ct8nnh8lm7wQPGfWTnm7kYP/vdERSV9HkMDGzau6IgKw93cS?=
 =?us-ascii?Q?uQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf0865d-9b7e-4805-50e2-08dcce52a88d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 09:02:39.1596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFkcJ8iO+FBbd/APN5ovDWUw40FTRjyXRss41k2Sq2NKp538TpmaMWcD2Aptwgs0XA/J/TO8TpujKOibGwtN8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB6780
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 09:02:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204258

The contents of the COPYING file included in the current source code
package match those of LGPL-2.0 license, which seems to have been the
case since 2011 commit
https://gitlab.gnome.org/GNOME/gcr/-/commit/c6691faa0348ab087e99ab9bd9914e1=
d5e81fa14

(From OE-Core rev: f3ae58b741e4e6e3a5196ff75fcc4da6ee89d0b9)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/gcr/gcr_4.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gcr/gcr_4.2.1.bb b/meta/recipes-gnome/gcr/g=
cr_4.2.1.bb
index 26dc1d1bc6..7ffcc1b7a0 100644
--- a/meta/recipes-gnome/gcr/gcr_4.2.1.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.2.1.bb
@@ -5,7 +5,7 @@ GNOME desktop."
 HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/gcr"
 BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/gcr/issues"
=20
-LICENSE =3D "GPL-2.0-only"
+LICENSE =3D "LGPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc60=
5"
=20
 DEPENDS =3D "p11-kit glib-2.0 libgcrypt gnupg-native \
--=20
2.39.2


