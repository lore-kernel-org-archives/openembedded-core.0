Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7424C433FE
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 13:29:14 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.92.72.30])
 by mx.groups.io with SMTP id smtpd.web12.9281.1633354152574399098
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 06:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=FaHUEYyc;
 spf=pass (domain: outlook.com, ip: 40.92.72.30,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1qopLAzDt6pyUqtnNzMGZ8w4U6FGAr4prF7bCPBIccemF4kmo3FSANhoAPlAH9vh0xW1nKM87lfylMLnyd1uYXvQg7O0IXY9YxPs8ZUrKvDvWiQMda0vYPefcltRXWoXxoDHsfIhVUrL+yaHW2TcgRYiM2av6Owo/gQrE/ZmzCIrqXmXcnRDkf0Ft4sObcx1+e1fnhtKfQ8Nvg03nCi6Ucsol/Z/SAemXK2dFWHPusWCJp3CsZQlGJJXHRYyJZUPjseBWjTL3WAXa8MNzt+huEbablrNOYfB2xSN6w4ZioeDtY7Zxd5YL10H9UqILW8AFAnYUeZIRTb7wJfX0YCEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GANuB9jPaaxtFIRmy2tUABsuoBwkz6SnGYtR5C7fz+c=;
 b=DzshYko19v0XIIhvNkexdmXF6/swdsHTlTOeXnZg5J13ZTM4SsaxspxgrZXoWNJfZT1UsF3ULFTRrDaqRZeCoiIe9W6rSYFpktjm8xs+Yb53nIBjZOCTdeODM/FzaXYTypAC87Z10qjsb142f592rKr11eVy3QlZM55Ysedwg2DJcxPgbMdtH3+e3Rea2hlj8j4AC50IAEYBUe54BIZWV+L4lRN5Qu5rBQ5m525CWBm4AKxCDwXhtOu/Dwk6amm+DzoIQREPorYV6Pb1y7WYYoIppoCrkTtet7QQeIb99Hb/EGYo6nUyTx+QgvhUcniIBtGAOmmcImN8ItI/MV2jzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GANuB9jPaaxtFIRmy2tUABsuoBwkz6SnGYtR5C7fz+c=;
 b=FaHUEYycp0Icevqk6NId4LEUf5CXNF4wfvqzUp5SyZNBFvhU6Ux3j2Hos3E0u8LIvV7AqkNYE6dEzlcHd798amnlu6Vq20Lztw/7AXz1eju5/zWq138JHA0rLPify3SPVqsA5NUYGuR9BvBL6Ht2cwcsIbfagPswNM2vZ0glgFioU+qZt18/2ZFW3qx2JrdEBkFKjzRdjW0JkjaxLg6Iy8tftFWYyKPTwVAH+MlIpVowxMAAzZOcyxPckb09x/9h8tvefm2X8ccMJik10VIa9mCEBu2zMxcvWqNr8kUdU/5zOzCvEtZg+ZDfi6Q9Hp3k1CAsAxW8vuE+JBEa2gEvew==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB2770.eurprd09.prod.outlook.com (2603:10a6:208:128::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Mon, 4 Oct
 2021 13:29:12 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%3]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 13:29:12 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 2/3] glibc: fix append in DEPENDS
Date: Mon,  4 Oct 2021 15:28:52 +0200
Message-ID: 
 <AM9PR09MB46421376B722A7A7A315BC8CA8AE9@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004132853.30543-1-kweihmann@outlook.com>
References: <20211004132853.30543-1-kweihmann@outlook.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [Mj47EBUqcOVaoOeLgncWIbo/uClXEIcd]
X-ClientProxiedBy: AM0PR10CA0115.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::32) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <20211004132853.30543-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (46.114.34.242) by
 AM0PR10CA0115.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::32) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.21 via Frontend
 Transport; Mon, 4 Oct 2021 13:29:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45c88565-a448-4688-0f02-08d9873af422
X-MS-Exchange-SLBlob-MailProps: 
	7MJMDUNTCtwQpGLSKUvrClBBalqGM3MCwjIAW89gZaGWc1xhwdKouiuGs7LYJ4Wwb87q9UMVcGHQ82nDAqTiMXefV4LbT2CSOZN0meXm2KsJLlcebIlWFZAbZbFFGL4Z7cYE9NO+jJ0UdjPHw/ZubYJ0y3nvoed5VXq2NWumIpAlSE8pEvFsbE3l3tLxTXFCm1jqwRp32zFSZem5rzVw5LNqvbc6UpnDpzjDInhDpjell0rhCkvZvdvoqD+fsRdNaq4dphupEbmApEkfMV2l9hED7LFqGJtY0a0/0sX6cdeWcBCijhUCsEJG+mQEwtGGLWAUKdsZtn78zgJ9jhtU04dtFBPAtOoGSPYQ2r6X9urmfBv5OmIfD+hLbjztqVTV5oObMCDyYWTLZHghEVXWfiRhbKb/uwsASt2wQ6Eg32VGH3F78OLAxnGCMOMVskwRBf9LNWJfQlR4GMH1ErYzhkWLNn3gA4ex97z+N4DDm5muoSMNNexyFSB00pkseckBAwEjJxxzh9aN6RYl34UIjm3brleIrtzza19AxRAGSvSuRyM8Rs2abF6tblAONX5BqNeIUGc7f0nUPx/XBKvg9w/c2tfTOx7NWkIMovZWw97yRBCT/8JVmWFc6+GnzZWwkLcPBbBk+0a5mml1wmGg4ZAh2J5D1j9Ajn7o21rWA55SsFgcEPb1aPdQYByWZLDEiCnlUabiLXOk+fxacstf0KXs5RjDWPq+NLnqaEPIoOsqarky9/5BGA==
X-MS-TrafficTypeDiagnostic: AM0PR09MB2770:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	An7fgB6NJXsR9+539GSSMyfe9u/NpXZy3xBKgfmQeRTagOCsx+ZTHEV4J5gHEbLcAlXxhiL4MMOnMyDFBJc+d/eGmg3YpAc49FTLLH3FDEfEVthFRdizQnPDd3kTiN2m0fWajHu8vp42/fm47PAv1lvhReeD0IX3nBtrZGlZsFO3wgFkkDc6qU+VaN8mrJib/jSD7wZsLMZlsnYK4OHj+s/IwzWC/55ldxNV5KIzjpR+WVTpk+pSBdWplYp3FSfvppTKajoc4XmK9ElUQ/6niyHufk/MkJN/EFRh64fq/OK2pAi74S3fAXYseKYaXM6CCUH3jvAaHyOIn1ZzXXfiniQi1YOQa8Xkg9woeWpGPXK+WLqFK2tjofnNO4KcAM1UPPW485xtEU/3Sfl+3JTWuiSvmoByWN/81Vqyu0oW+acQbqXHyp1xAhdGicaA+tRg
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PuYCaUe6mvK8l/MH+kZHSBkG45YstfuPiopbNFDRxNxtOwlxsQ5hvPTtfbwXcQCR+H4NZMJyfgDAReGzhnTIG7cfQxmplIxrAhoEW9B2RPiJeekU/Mcqq6sJoXhrC7a1jnYxKxQ2a6noUrl44xyeaQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 45c88565-a448-4688-0f02-08d9873af422
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 13:29:12.6258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2770
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 13:29:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156588

fix the append with a leading blank, otherwise this messes up
DEPENDS when globally inherited classes add dependecies of their own

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index a34776b083..3436645f15 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -30,7 +30,7 @@ LEAD_SONAME =3D "libglib-2.0.*"
=20
 inherit meson gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-ev=
en bash-completion gio-module-cache manpages
=20
-DEPENDS:append:class-target =3D "${@' gtk-doc' if d.getVar('GTKDOC_ENABLED=
') =3D=3D 'True' else ''}"
+DEPENDS:append:class-target =3D " ${@' gtk-doc' if d.getVar('GTKDOC_ENABLE=
D') =3D=3D 'True' else ''}"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
--=20
2.25.1


