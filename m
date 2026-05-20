Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB49CD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 10:44:40 +0000 (UTC)
Received: from mx-relay14-hz12-if1.hornetsecurity.com (mx-relay14-hz12-if1.hornetsecurity.com [94.100.139.214])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9368.1779273871533182049
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 03:44:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=qBbNE0gk;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.214, mailfrom: hsimeliere@witekio.com)
Received: from mail-francesouthazon11021100.outbound.protection.outlook.com ([40.107.130.100]) by mx-gate14-hz12;
 Wed, 20 May 2026 12:44:29 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dup9BXUIp4kI+HgCPNaztJlNJKi7P8EmFRJVDWvAYs66M10gyEgsUDM0gUNgzUY7fEJAUcEOxgQFoBwrwvB1RBVK2Da9uuSgDZnqV/XxJU67JlhKt/dSHkB1chJFbWePAnYr+wuMaPzSE1B1QuwJay9/yvnYUARcfXG/BEPFfTFJyyRexpVxc5ZMUaszXhyg1kOIJ3Mq5Kfxlfs+VO82/6HAzDj8O4Z/ZFT2NIP46uakhlWsci9IfdXgAjODzOLMLlEDTQkoFjpHIuiMBfKWPntT4AxSEN+n4c9MPse17uy8GxH00+KoSkghVtpnPx1vRYeOhR+JvnB5Yxm1fo8L5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsMvgXGjn/7ZiG6MwpI4pHEaV5fbj8CL40PnPMIf9nM=;
 b=YJeYIn8/TQFjRrDc9JZiHCiSVlMwmdevBnyz/XHTLgyvWhSVO5Orj4MsCOFaKpP39bN9roVs/9lPF+3XtiLuP3bg9qzo+rVXWU3KJeMzKw7vG9wo+QVP1pS931nyEkoqeEGYIRLNPSzaD0VTSrV28RAT7z1Zyy1h1qMwXC1A+Ok2K69/+7H6c/SRMum/5gQ4wJonwqaOqlHb8M12Zv0FlVaxVU+ATZZ7ObMnCh83Xzz6UVtNGDCEpNdZHQLsYWpogUbVQ+zFXEMBQ2ypqqs0uPzZ6HKldhzWkwdn93GEqhOYerdOdY6zA1psUOArGJl3DtbBwthMfjReoIehXcuZqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsMvgXGjn/7ZiG6MwpI4pHEaV5fbj8CL40PnPMIf9nM=;
 b=qBbNE0gkbfRHjC3rFlOa2wHUaxYVpSS13Ffntu1ff8eNTJ/ibkmO4xfPYt8xg9bVbidg89am9bgyMdqH6e3YbgfacCrbKYwJJS9bmf4dPIZtpBY58pp9aDQsda9LtPAFTuKS8tgD9LOwR+kewM7pdHt3YLJ3hGuyeso0wQfNSjgyv6E5UCfQDkQdC2PeWEJhW/cXrkiPoka0uHSUPC7IyCErGNAz4/OaYAPvq2HFUz3X5HdIhAbACqSL+zkqYDUAbf1SPnpQ1Mjwxk9VqNtXYc0Np/udSwPlD7O8otBjfBnYE8eSQe29jh6Frdr3nQXhNVbFnPeCI+xseoH8A14HJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 DB9P192MB1564.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:33a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Wed, 20 May 2026 10:44:21 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 10:44:21 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][scarthgap][PATCH] busybox: Fix CVE-2026-29004
Date: Wed, 20 May 2026 12:44:13 +0200
Message-ID: <20260520104413.3108569-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0479.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::16) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|DB9P192MB1564:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eebd3ed-7a40-4150-cf99-08deb65cc082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|10070799003|1800799024|366016|13003099007|56012099003|18002099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	ys1UlWLJCdRdTo7EMavr0jnDkbVqpUv3pTYe3sPUuIahYwZFZBTXdC2ztF3Bswc9pf2e2obVE7l9V2IsweVSFcCppti153EcOEOHtqT00LnHzcUwsO4f3RwREN873RByfP+UYaKSZKutOdLiJD88DgFMal8D3fK/OZxii5RB73uoyApMQRu+e0SLo4useOKS9rLXH7txqYg85WIGBhpclkJRB5wJUvDWfH+a6DOg15I+U19SlMz0r7zCNCUW/U/uBDv6hDz9obPYMuvybkLSMh58UPwhHqOHWhjWF0R3F4sPcVrfGyRBUJWXdbu9DfZ6FLU2+ygjxyTG09rPl3nLpF+MLX6CAI9hHkbHzSGwAco1IEgpJ9KJAKYaH/IdKpUe9BcQpL2PUMs+Omq6/kPC4X289m8LFdIwJMpeYp5DilWKHd0Fb65iR1K0WZ42cy7bhqj15t9ohfx7G6oXQACiXhXSw64UZZcYE2vFGX4LFF02AUOpYEfQHXvDYReQCHi7o2xJ1Nl+Nxcjdj1ayEm/pSo0OghFwmjX6xgfsrftTlEB0I2jd78Hqlq886IIZ+J8+gEXcC3ASLW0yHoLeUPLeZUJeXvGDPrNejrn67vPq3djEXYVxbma9q4gA0bgE95i+9krXR6R/3rtWXJFaeWg6eKz4NhD8MWoIwl1xH9BpWK6RtAzROIii0/fC153dH20ZZb44f/0daO0mOl00wWbHg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(10070799003)(1800799024)(366016)(13003099007)(56012099003)(18002099003)(12006099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8gklWdOYVxN93P0Pw113NZ+wFkH8Z2sJLapFrxSVXEgpdQYVCdKJLYThep2A?=
 =?us-ascii?Q?2JRm2BqDXRCFb7kymss38gLyCPAe07rCCz+++IyHtsONepouv1B2cCtC2LPx?=
 =?us-ascii?Q?Rx5gUq+ReUm3JwXwR2Gz5dIJ/1R9UDX7L7TFDe22QkqIfBOTbVWxnhWR3vY5?=
 =?us-ascii?Q?DuaUj7LMeOl/x99erJgm4rFjIZIdY6clPdJ5ivPJ1YTiDUu2LY8qBGuyjih0?=
 =?us-ascii?Q?H+GjI7nUeu4G5y14S3OW0vJhUH9fgHDjY+/C3UqQDKPMCLl8Js0o0Zage1N7?=
 =?us-ascii?Q?Lh1rgTmcloWplyjVKNYZF2FsSI6skJ/PmdF2/c7p4XLxhVZIZ34y7lxcA9CB?=
 =?us-ascii?Q?kMvX/YkSNIrTsj490axOhvXoIUZisnBq1rhV2Rn7ySF63wmqZ1Bl8yT0myrI?=
 =?us-ascii?Q?XDm7vZKyugC2pRxxPVaagadnHI1eSPuaJHUkOoDZsAimad9aIp86IcoA/o8c?=
 =?us-ascii?Q?QGH8O0ZXNhSPHzeYagfp0Ja6lpsjsGRuv4Rg762gWHPvccdQ6AiHqbprT1Ro?=
 =?us-ascii?Q?WvloDB2Ebb2XbFNvUyCVpJBBZF9vC7MaUsTVAyayxCQzzn+YpQxYNElTqXUG?=
 =?us-ascii?Q?fBn7ugmlRStg7AE1EE5zlIbS7jfUjwl0qR8YwKJkSOsPdzRBrcWw8eAKMuhe?=
 =?us-ascii?Q?4D142QcLXTXST9DLcQUM57wvekUS0+sJ86QxP8JlYCR0HdKBOysjrlmuE1J9?=
 =?us-ascii?Q?tMDSKJqpQ1/Upi4PQQZ/mqsWwdQgwf8cnUI5q1OuiwCRaKsCzopdXVRiYlWT?=
 =?us-ascii?Q?+pFyD9FUUOpmt/ZD4sXiM1OYf8gDMmQCFIwWA0qsju5xVP1a1A5B3ppPTOzX?=
 =?us-ascii?Q?GdfTnpB+WltuNz214pZo5Aftu836CYwK1zNCgp3cf5FaKFb0PTu9WU+K6Hst?=
 =?us-ascii?Q?apWg0ID6GS8Ik87X9sslrTDnQkef9PhChCfSHe7Te5rhJ+gZSX0gtPNEr9Hk?=
 =?us-ascii?Q?KFOzYMyBWuiAqeGS+XmP9EO8cgyjn4AZILb+0is1+oNNZDFGleWZdZoBZ0rs?=
 =?us-ascii?Q?rUOMuXPdN9/RywrbPpg22bJeY+LkNFCkiW/8WbGpNRORBkA/F3aRwmGJ/Ud9?=
 =?us-ascii?Q?FH7bkjme+7HZT4b6oUSnhDtNJJPH/itmpaceHLPUWFZswEOchSuMp8zThVoP?=
 =?us-ascii?Q?buyDdgjDYwtrUYx58b109y/kAxKWmzOJfWqNAx4Ryn5RMTUTrqobDopyuFmw?=
 =?us-ascii?Q?QuGRR01Ocu1VnW/rdhCPOoE1xXYeZg8GyOiVt5Dkt4PDbuhHwRMMDtrTqJ+L?=
 =?us-ascii?Q?4Iy40zw5WcT3IAdmqfOQDaTIJEh/EgZBc2ALyZlQ9xw5U7yS9IIx42WWeuYv?=
 =?us-ascii?Q?OKSK+NjbQynHden2pGcgVZET5ZAe5qcW0IKhymIPnlN67tyLiai7jhnf8+Yp?=
 =?us-ascii?Q?IvOWptzK0kfs/phZ0j+9Cpk4Za1Tzaogby1jfxfABXco3oi34G8QL8aL6uSa?=
 =?us-ascii?Q?ve7WyEuBjr2U44kJZoz7OfW5K4OnyPYRQ69MHvGmLaQY4OcVECf3iJwt6Mnu?=
 =?us-ascii?Q?Qvah0XTG8x8w3nCLDZHuL6U/yWgaN2h2aLwnL3YPlEPdo52LZVUNW7Lc6yYw?=
 =?us-ascii?Q?5oD673OTLybzzo6VdgnI+pJEcmV28utKty86jvkOfeUNdPTZiU21jPayaOMP?=
 =?us-ascii?Q?+YHuOF9jUhAnZ9Yh1SNksOsogVFU95HRqXGsM9QZxk32cfu+riAsOdk338db?=
 =?us-ascii?Q?3BCajz3afzdwSzqDLhP9MBzpg1o32lKbbShp2CC7DjugpFmm7bSf7ZJWj3/+?=
 =?us-ascii?Q?xYmHezWyWexe6iQa0qEQ/POFG0JR4sVD3nKgmgUiUl2vuuLxjqKegdSLOjdZ?=
X-MS-Exchange-AntiSpam-MessageData-1: sjO4knuX8sV+Lw==
X-Exchange-RoutingPolicyChecked: 
	B5P4bHbBRtQLBmOV8BSmlQ/MgdJ/60YFU/20CxlbqyE7Cn2TlPKTtLt349kO581UBZw7UWDrxsyluRCiijH1KfNDGPCzfVQo2h+AztwHLjclmmfp9+Og58KTLftZc8D7gl5rZCkMWTcKfPSVeGaG9oIRUcOZ5htww9OLLGAPrgtSb3TVqMCIXQryQRCCT7HVUc6vSaakA9J8YsBnGM0EmKA2r9kzE/ZRYDwanCccazfR944t2Jx0CwoIUiaTHzq795OeTeHfcoaBSz3ghGYlyIQvyeQcyDja/TmHxT6CdPg4b2eLaI6TonvOo3i1+KAVQOm1HXStrvV/oD1h1aRkxQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	ylN9UZrClg7aCJLa1BFu7NDAhgyd14yLSl2kB0awFrttsMsC1JmEXmblHrxcSx9cPBUdB7zIfdQPZVkhMZa/xXc9FXTnabHhcDnJ/CtBgw3k1mc0DOZGx+0QPGoBl+hs62kebtK3GIxBToMRrL4PU+xpZlG28lhHyE/4lgxTEGOlcXsy4VCPI7HVr3g3Clm9IUWm+rNyMk9wC7i86Ed3XtTjwVB9OV+hevSvF6r37cmtxW+nOyIOmYqY3681lAzVMG9f6UK7fIj8ovzsegcJ00Dkw+3UtdCVD6JPTIWDVjnAWtruvFxYiA+BihxoQJ0ou52zDc3apRABfAil3hljO1DHkdS04Muhsg/0a0QP+hiK3Xgfo2jJTpljnKFFpZO96jsdqGJNM01GKW1tr+tPOV2PGQX+VtqHSyWmUflXacqYS8KgWqa75shnADNeoMZQWApPFKEyoOsbeoLujbjjpQBDUUTno5Def6nICqHIMLN5xvDWBbytiB8EZnv6KE6B6nVWnJPe9TPmfhRUOG5rEnmopa0wwXtK8z3Ffi9/BpWjjovg4QKHBdAas4D0vzX67VwAqn69T/CGqUKXDooTm8F1dPMu9hZ4uGNphRpH1/P+i6ube7tvpzVXY+SS5rKw
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eebd3ed-7a40-4150-cf99-08deb65cc082
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 10:44:21.7856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fsY4ZvgV4Q96J5ORGvRqaRbygxqCPOlcXAavzMzcZ3liWHNltXYJ17uGS9l1id0Xg8qYaw+5tAfWXwyJdTDv3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P192MB1564
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate14-hz12 with 4gL7T42yn9z1spmG
X-cloud-security-connect: mail-francesouthazon11021100.outbound.protection.outlook.com[40.107.130.100], TLS=1, IP=40.107.130.100
X-cloud-security-Digest: e4800bc9bdc5ad86f184d1d7539840d6
X-cloud-security: scantime:2.337
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 10:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237443

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patches from [1] and [2] as mentioned in Debian report in [3].

[1] https://git.busybox.net/busybox/commit/archival?id=42202bfb1e6ac51fa995beda8be4d7b654aeee2a
[2] https://git.busybox.net/busybox/commit/archival?id=d368f3f7836d1c2484c8f839316e5c93e76d4409
[3] https://security-tracker.debian.org/tracker/CVE-2026-29004

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
---
 .../busybox/busybox/CVE-2026-29004-01.patch   | 41 +++++++++++++++++
 .../busybox/busybox/CVE-2026-29004-02.patch   | 46 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |  2 +
 3 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch b/meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch
new file mode 100644
index 0000000000..0423a76730
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch
@@ -0,0 +1,41 @@
+From e49fb0f6ad0a0f924ec2cfe6838d04c4f1f4c3ba Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 12 Mar 2026 07:25:38 +0100
+Subject: [PATCH 1/2] udhcpc6: fix buffer overflow
+
+CVE: CVE-2026-29004
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/archival?id=42202bfb1e6ac51fa995beda8be4d7b654aeee2a]
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+(cherry picked from commit 42202bfb1e6ac51fa995beda8be4d7b654aeee2a)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ networking/udhcp/d6_dhcpc.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/networking/udhcp/d6_dhcpc.c b/networking/udhcp/d6_dhcpc.c
+index cdd06188e..62cc0f466 100644
+--- a/networking/udhcp/d6_dhcpc.c
++++ b/networking/udhcp/d6_dhcpc.c
+@@ -351,15 +351,15 @@ static void option_to_env(const uint8_t *option, const uint8_t *option_end)
+ 			addrs = option[3] >> 4;
+ 
+ 			/* Setup environment variable */
+-			*new_env() = dlist = xmalloc(4 + addrs * 40 - 1);
++			*new_env() = dlist = xmalloc(4 + addrs * 40 + 1);
+ 			dlist = stpcpy(dlist, "dns=");
+ 			option_offset = 0;
+ 
+-			while (addrs--) {
++			while (addrs-- != 0) {
+ 				sprint_nip6(dlist, option + 4 + option_offset);
+ 				dlist += 39;
+ 				option_offset += 16;
+-				if (addrs)
++				if (addrs != 0)
+ 					*dlist++ = ' ';
+ 			}
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch b/meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch
new file mode 100644
index 0000000000..ac8c031cc6
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch
@@ -0,0 +1,46 @@
+From 4d8d5b7c4426e62375235cf4903b6cb53bb193d3 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 12 Mar 2026 13:23:48 +0100
+Subject: [PATCH 2/2] udhcpc6: check the size of D6_OPT_IAPREFIX option
+
+function                                             old     new   delta
+option_to_env                                        694     711     +17
+
+CVE: CVE-2026-29004
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/archival?id=d368f3f7836d1c2484c8f839316e5c93e76d4409]
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+(cherry picked from commit d368f3f7836d1c2484c8f839316e5c93e76d4409)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ networking/udhcp/d6_dhcpc.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/networking/udhcp/d6_dhcpc.c b/networking/udhcp/d6_dhcpc.c
+index 62cc0f466..64a41c9d8 100644
+--- a/networking/udhcp/d6_dhcpc.c
++++ b/networking/udhcp/d6_dhcpc.c
+@@ -287,8 +287,8 @@ static void option_to_env(const uint8_t *option, const uint8_t *option_end)
+  * |                        valid-lifetime                         |
+  * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+  */
+-			/* Make sure payload contains an address */
+-			if (option[3] < 24)
++			/* Make sure payload exists */
++			if (option[3] < (16 + 4 + 4))
+ 				break;
+ 
+ 			sprint_nip6(ipv6str, option + 4);
+@@ -332,6 +332,9 @@ static void option_to_env(const uint8_t *option, const uint8_t *option_end)
+  * |               |
+  * +-+-+-+-+-+-+-+-+
+  */
++			/* Make sure payload exists */
++			if (option[3] < (4 + 4 + 1 + 16))
++				break;
+ 			move_from_unaligned32(v32, option + 4 + 4);
+ 			v32 = ntohl(v32);
+ 			*new_env() = xasprintf("ipv6prefix_lease=%u", (unsigned)v32);
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
index 228bfdadd3..7929d396c8 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -64,6 +64,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2025-60876.patch \
            file://CVE-2026-26157-CVE-2026-26158-01.patch \
            file://CVE-2026-26157-CVE-2026-26158-02.patch \
+           file://CVE-2026-29004-01.patch \
+           file://CVE-2026-29004-02.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
-- 
2.43.0


