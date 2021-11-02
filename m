Return-Path: <mleonhardt@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18495C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 19:15:10 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.95])
 by mx.groups.io with SMTP id smtpd.web08.21.1635880505749412874
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 12:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=Lu3p5EAV;
 spf=pass (domain: arri.de, ip: 40.107.6.95, mailfrom: mleonhardt@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bp1PgwboA/VbUEvwCXhPcsFeuBXoLes9XqSEpzCWQ5R0VAgKYgnbF9OBfIpjrikZFt0p89OlKa/yfdX0TdJQLVT/1O/V1dIpsiF3FA8GA/eJlsaEY9oG3rgPbr/aqujwTE8vH5aO0c94Sy0TtDVFy3q/LnZ6TJOWDaqSjSW0ZbVCnwfB0ed93Ixex5z8xtCaeBvV+r5O9VDmLOCscUtUK5cgDws/uPREyhCZsobkttim6bTy/sc5vkP9CwPmdpvkvLjHm3P7/kk1ZZr3rdaAz5nzRl+XC8v3mS4+p0J8HbTpagm3fYZfoRyElgxPVtb55tDCJ6xmE1W0NLHWe7yhTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEI4IyoUsc//gObOy3p65iWx8uu9l3YJQ7eV3Kbyo/E=;
 b=eslfHUktVR7YlG2FvuxMXqUSOADWg3rvVb8jnN7xRHFdpe78dyUUdjSgsPNTh51SC97yQUdSbvCiQOwwEF2QshcEkbl+We3aa+XxUE7u/8/O7MGouOC8PXL/fa3hZMb9q0Nc8bpdFbDooY3umVmOwIPMIUgylndAQc6ZSUzfJSxo/1C552ZCPH75J+Y8A+JiUIYMz8r4SLTEDigWBGG0tayT/MDuoGxth+Z1d7z+n1Dt9Xv+E5hxQ32qRL54INy3irbT6/5GxmzZDbLsxWHfdxhvg7pz4mK4Kcek0u3zuBjLRv5YkqRVKBB9WQHhF3BW7lyI2R5S6ylydzFOy9s7mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 52.169.0.179) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=bestguesspass action=none header.from=arri.de; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEI4IyoUsc//gObOy3p65iWx8uu9l3YJQ7eV3Kbyo/E=;
 b=Lu3p5EAVwqZQtaPMDlRa8SmhYvcPN9nUlZOy1zMBRtvJE2OK4c7RSSi3wxd3jyQ8JLbZoHab9HItmDMy+845EBWqlZ0af5D2/Q+bKlifQlWqZ1wM6XaKEXpm+EkMBKZm35SDlbyUy5MsNx9srK8A/AjGWK9XarB0nwlK7r0rF/A=
Received: from AS8PR04CA0203.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::28)
 by DBAPR07MB6920.eurprd07.prod.outlook.com (2603:10a6:10:19c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.6; Tue, 2 Nov
 2021 19:15:02 +0000
Received: from VE1EUR02FT042.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::23) by AS8PR04CA0203.outlook.office365.com
 (2603:10a6:20b:2f3::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Tue, 2 Nov 2021 19:15:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 52.169.0.179)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=arri.de;
Received-SPF: Pass (protection.outlook.com: domain of arri.de designates
 52.169.0.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.169.0.179; helo=eu2.smtp.exclaimer.net;
Received: from eu2.smtp.exclaimer.net (52.169.0.179) by
 VE1EUR02FT042.mail.protection.outlook.com (10.152.13.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4649.14 via Frontend Transport; Tue, 2 Nov 2021 19:15:01 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (104.47.5.56) by
	 eu2.smtp.exclaimer.net (52.169.0.179) with Exclaimer Signature Manager
	 ESMTP Proxy eu2.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Tue, 2 Nov 2021 19:15:01 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 15656187
X-ExclaimerImprintLatency: 2546947
X-ExclaimerImprintAction: 1c9b920108fc4081b16233ac93d9f4be
Content-Type: multipart/related;
	boundary="----_=_NextPart_f48fd3d4-fa85-40c4-acaa-2c545b69cf2e"
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received: from PA4PR07MB7309.eurprd07.prod.outlook.com (2603:10a6:102:d0::23)
 by PR1PR07MB5753.eurprd07.prod.outlook.com (2603:10a6:102:4::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.6; Tue, 2 Nov
 2021 19:14:55 +0000
Received: from PA4PR07MB7309.eurprd07.prod.outlook.com
 ([fe80::a150:27f6:7b27:fd22]) by PA4PR07MB7309.eurprd07.prod.outlook.com
 ([fe80::a150:27f6:7b27:fd22%6]) with mapi id 15.20.4669.010; Tue, 2 Nov 2021
 19:14:55 +0000
From: Manuel Leonhardt <mleonhardt@arri.de>
To: openembedded-core@lists.openembedded.org
CC: Manuel Leonhardt <mleonhardt@arri.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] dpkg: Install dkpg-perl scripts to versioned perl directory
Date: Tue,  2 Nov 2021 20:14:30 +0100
Message-ID: <20211102191430.8505-1-mleonhardt@arri.de>
X-Mailer: git-send-email 2.33.1
X-ClientProxiedBy: AM6P195CA0074.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::15) To PA4PR07MB7309.eurprd07.prod.outlook.com
 (2603:10a6:102:d0::23)
MIME-Version: 1.0
Received: from MN-C02ZH1SVLVDR.fritz.box
 (2001:a61:ab1:ef01:f43c:68d8:fbc5:45c3) by
 AM6P195CA0074.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::15) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Tue, 2 Nov 2021 19:14:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2298df3-238a-4206-a876-08d99e3511dc
X-MS-TrafficTypeDiagnostic: PR1PR07MB5753:|DBAPR07MB6920:
X-Microsoft-Antispam-PRVS: 
	<DBAPR07MB6920ECB215CD49A656AED3C2D38B9@DBAPR07MB6920.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 oYnYFIm6yheacTggrtb9Z/l3hY9O9XhLhavS8iEBG6mrqpLIuKGEescqxZU/bzkEirf1uDAJN1YKpCQSphb2ZVkswxZugaJj7yRxq+5cGechZqBKL6NxuRDl7e6NA6e1ylV0dZc4bWRh4EkY5btoLIHpgpThOuVj+Osio7MkZ14n6XEeqWFa7Cp5zpdJVUpUCYNZa7h5f/agljUiSeAcZPzcTaPOaszVCntikj+mwYcQoRvsOD8o7ns6PiXJ7scxYDEYQEjaZNAoJ1BqUsxgyF6xIvUPh6uh/TJ9VWem0TKduV5zbzqGIqs0XKHMJt4vV6CqxhCK1eTYQU1KQKhAXhvvcUF013gVZ0BLu0u+X8upAgmQancV1aIo7REfRSl4E2RKIfeTZhSR4fKMm/T7F4G29mgTKPZbS9HOmUvYGb2z9BThHlYzAJnKvKwkTaej1417SinC2Jc6TJk2ZrV7HAVuAZVU53lCEl4SdJGv24AVr4wBA/3tk5uRO/jiQTu+zv2xIqv0uw8vG7xhNjbfFhh8RMRvqchbWXGYFV2TbUWpTURvWUMcMU4Ak4C4Sggo5ZZNks4S6Jm80ymORFniG36V9irt8E2/bCWIaPC16MlrnbQCTI3+w/BGByLt7KIIX8XpNB8wmN1DUj/w9hsS+Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR07MB7309.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(6506007)(86362001)(52116002)(4326008)(66556008)(38100700002)(186003)(2906002)(2616005)(66946007)(66476007)(6916009)(6512007)(8676002)(8936002)(1076003)(6486002)(36756003)(83380400001)(5660300002)(508600001)(316002)(54906003);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1PR07MB5753
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR02FT042.eop-EUR02.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a4bc77d3-2b04-4b3a-decb-08d99e350e01
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2E/ge/jAccIfiHnewLW0COrYY0OLDAXPt1uer8HF6BXo1bH0s4OShSxD30oWlxmT00zFAJhHmTjQ24r8/u0X+eEceyvHNrVfqa/fKAmNVZLm53/vpma/FXjdV6kHC52ZM8TSkfIK1qUe0VMbizuCpfF3yOlAedzWrGJuhCzFIbiTdi4wxgolw+OyoLnOxOySCRPmZsj+ApejHgP7UDoMgzhopRt694ygUvJRlMJdRgU833okeyyWg8dMjsgw+xAnQApjOZI0k49OD9BG+0wpbT2yZDCP9XNec+FwRDImHmkiD6YnCQtT7WB1vjDvtsUCeId1+XuJMK3zrTKzhLWzsu8aC5u2/3hQUi6w0vW7SiHLjumX6igeopVDABUS+5A+vft1ZJ7LPvHsmSWeAqBE4Uh7M2DJL0041SwDPDOYeWIPEcHLbCbjWbeZ7deGLr+a/bTyEodEA7dYBFWz1nG0fZxy2kUZLKFQ6KhZ1iyRPLXNJNr9ZuvR2VDXy+3hl306HMwzcEamc/JbUQEEJcnFUa2icAq+0dxtXeB/Wy0j8mm3N2Bmd7tjWzcUAoxxvu9LFiDRMx/IuVqU3L9fyYbPSjv7Qrm8tR4WY/ELtnKn1PmRufcuzPCF4SauUgswtmwsVsYOXVkTvnmzDNY4n3Isxkg5YlyMVNV7BLShK46R5X8luQ5ISD/xEh47zja5buMoH1iwJi2VSTx1VD30fbBd/N4PpqE/A6Cz2Jh4duuu+XpTJgFY/5sN9LOJWOc07H9vmn0zVseEFFZdtcIwvTXN/U7+9SjTfanRIi1ueQz6Dv0iKdwN0o5j+QWPoGBpexpP
X-Forefront-Antispam-Report: 
	CIP:52.169.0.179;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu2.smtp.exclaimer.net;PTR:eu2.smtp.exclaimer.net;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(15974865002)(6666004)(1076003)(26005)(2616005)(7066003)(186003)(5660300002)(6512007)(508600001)(47076005)(86362001)(8676002)(66574015)(36860700001)(36756003)(6916009)(33964004)(166002)(4326008)(7636003)(7596003)(6486002)(83380400001)(6506007)(2906002)(336012)(8936002)(316002)(70206006)(54906003)(356005)(82310400003)(70586007);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 19:15:01.3975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d2298df3-238a-4206-a876-08d99e3511dc
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[52.169.0.179];Helo=[eu2.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT042.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR07MB6920
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 19:15:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157810

This is a multi-part message in MIME format.

------_=_NextPart_f48fd3d4-fa85-40c4-acaa-2c545b69cf2e
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_716a9f8b-2423-45f9-83aa-7bcb9b14e1bf"

------_=_NextPart_716a9f8b-2423-45f9-83aa-7bcb9b14e1bf
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Install dpkg-perl scripts to versioned perl directory, otherwise the
following traceback happens when running, e.g. dpkg-architecture on the
target:

Can't locate Dpkg.pm in @INC (you may need to install the Dpkg module)
  (@INC contains: /usr/lib/perl5/site_perl/5.30.1/aarch64-linux
  /usr/lib/perl5/site_perl/5.30.1
  /usr/lib/perl5/vendor_perl/5.30.1/aarch64-linux
  /usr/lib/perl5/vendor_perl/5.30.1
  /usr/lib/perl5/5.30.1/aarch64-linux
  /usr/lib/perl5/5.30.1 .) at /usr/bin/dpkg-architecture line 25.

Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Manuel Leonhardt <mleonhardt@arri.de>
---
 meta/recipes-devtools/dpkg/dpkg.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dp=
kg/dpkg.inc
index b6807b004f..74074cfdd7 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -15,7 +15,7 @@ inherit autotools gettext perlnative pkgconfig perl-versi=
on update-alternatives
 
 PERL:class-native =3D "${STAGING_BINDIR_NATIVE}/perl-native/perl"
 
-export PERL_LIBDIR =3D "${libdir}/perl/${@get_perl_version(d)}"
+export PERL_LIBDIR =3D "${libdir}/perl5/${@get_perl_version(d)}"
 PERL_LIBDIR:class-native =3D "${libdir}/perl-native/perl/${@get_perl_versi=
on(d)}"
 
 EXTRA_OECONF =3D "\
@@ -66,7 +66,7 @@ FILES:update-alternatives-dpkg =3D "${bindir}/update-alte=
rnatives ${localstatedir}
 RPROVIDES:update-alternatives-dpkg +=3D "update-alternatives"
 
 PACKAGES +=3D "${PN}-perl"
-FILES:${PN}-perl =3D "${libdir}/perl/${@get_perl_version(d)}"
+FILES:${PN}-perl =3D "${libdir}/perl5/${@get_perl_version(d)}"
 
 RDEPENDS:${PN}-perl +=3D "perl-module-carp perl-module-constant \
                         perl-module-cwd perl-module-digest \
-- 
2.33.1


_______________________________________________________
Manuel 
Leonhardt
Softwareentwickler
=E2=80=8B
ARRI
Arnold & Richter Cine Technik GmbH & Co. Betriebs KG 
Herbert-Bayer-Str. 10, 
80807 
M=C3=BCnchen
www.arri.com 

+49 89 3809-1719
MLeonhardt@arri.de

=E2=80=8B
Get all the latest information from www.arri.com, Facebook, Twitter, Instag=
ram and YouTube.

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRA 57918
Pers=C3=B6nlich haftender Gesellschafter: Arnold & Richter Cine Technik Gmb=
H
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRB 54477
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Neuh=C3=A4user; Stephan Schenk; Walt=
er Trauninger; Markus Zeiler

=E2=80=8B

------_=_NextPart_716a9f8b-2423-45f9-83aa-7bcb9b14e1bf
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8" /></head><body><div>Install dpkg-perl scripts to versioned perl d=
irectory, otherwise the<br />following traceback happens when running, e.g.=
 dpkg-architecture on the<br />target:<br /><br />Can&#39;t locate Dpkg.pm =
in @INC (you may need to install the Dpkg module)<br />  (@INC contains: /u=
sr/lib/perl5/site_perl/5.30.1/aarch64-linux<br />  /usr/lib/perl5/site_perl=
/5.30.1<br />  /usr/lib/perl5/vendor_perl/5.30.1/aarch64-linux<br />  /usr/=
lib/perl5/vendor_perl/5.30.1<br />  /usr/lib/perl5/5.30.1/aarch64-linux<br =
/>  /usr/lib/perl5/5.30.1 .) at /usr/bin/dpkg-architecture line 25.<br /><b=
r />Cc: Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;<br />Sign=
ed-off-by: Manuel Leonhardt &lt;mleonhardt@arri.de&gt;<br />---<br /> meta/=
recipes-devtools/dpkg/dpkg.inc | 4 ++--<br /> 1 file changed, 2 insertions(=
+), 2 deletions(-)<br /><br />diff --git a/meta/recipes-devtools/dpkg/dpkg.=
inc b/meta/recipes-devtools/dpkg/dpkg.inc<br />index b6807b004f..74074cfdd7=
 100644<br />--- a/meta/recipes-devtools/dpkg/dpkg.inc<br />+++ b/meta/reci=
pes-devtools/dpkg/dpkg.inc<br />@@ -15,7 +15,7 @@ inherit autotools gettext=
 perlnative pkgconfig perl-version update-alternatives<br /> <br /> PERL:cl=
ass-native =3D &quot;${STAGING_BINDIR_NATIVE}/perl-native/perl&quot;<br /> =
<br />-export PERL_LIBDIR =3D &quot;${libdir}/perl/${@get_perl_version(d)}&=
quot;<br />+export PERL_LIBDIR =3D &quot;${libdir}/perl5/${@get_perl_versio=
n(d)}&quot;<br /> PERL_LIBDIR:class-native =3D &quot;${libdir}/perl-native/=
perl/${@get_perl_version(d)}&quot;<br /> <br /> EXTRA_OECONF =3D &quot;\<br=
 />@@ -66,7 +66,7 @@ FILES:update-alternatives-dpkg =3D &quot;${bindir}/upd=
ate-alternatives ${localstatedir}<br /> RPROVIDES:update-alternatives-dpkg =
+=3D &quot;update-alternatives&quot;<br /> <br /> PACKAGES +=3D &quot;${PN}=
-perl&quot;<br />-FILES:${PN}-perl =3D &quot;${libdir}/perl/${@get_perl_ver=
sion(d)}&quot;<br />+FILES:${PN}-perl =3D &quot;${libdir}/perl5/${@get_perl=
_version(d)}&quot;<br /> <br /> RDEPENDS:${PN}-perl +=3D &quot;perl-module-=
carp perl-module-constant \<br />                         perl-module-cwd p=
erl-module-digest \<br />-- <br />2.33.1<br /><br /></div><div dir=3D"ltr" =
style=3D"mso-line-height-rule:exactly;-webkit-text-size-adjust:100%;directi=
on:ltr;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"w=
idth:100%;"><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical=
-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=
=3D"font-size:0;"><tr style=3D"font-size:0;"><td align=3D"left" style=3D"pa=
dding:0;vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" bor=
der=3D"0" style=3D"width:100%;font-size:0;"><tr style=3D"font-size:14.67px;=
color:#7F7F7F;font-style:normal;font-weight:400;white-space:nowrap;"><td al=
ign=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-ser=
if;">_______________________________________________________<span style=3D"=
font-family:remialcxesans;font-size:1px;color:#FFFFFF;line-height:1px;">&#8=
203;</span></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=
=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=
=3D"0" style=3D"font-size:0;"><tr style=3D"font-size:0;"><td align=3D"left"=
 style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" b=
order=3D"0" style=3D"font-size:0;color:#7F7F7F;font-style:normal;font-weigh=
t:400;white-space:nowrap;"><tr style=3D"font-size:14.67px;"><td align=3D"le=
ft" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;">Manu=
el</td><td align=3D"left" style=3D"vertical-align:top;color:#000001;font-fa=
mily:Calibri,Arial,sans-serif;">&nbsp;<br /></td><td align=3D"left" style=
=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;">Leonhardt</td=
></tr></table></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=
=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=
=3D"0" style=3D"font-size:0;color:#7F7F7F;font-style:normal;font-weight:400=
;white-space:nowrap;"><tr style=3D"font-size:14.67px;"><td align=3D"left" s=
tyle=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;">Softwaree=
ntwickler</td></tr><tr style=3D"font-size:14.67px;color:#000001;"><td align=
=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;=
">&#8203;</td></tr></table></td></tr></table></td></tr><tr style=3D"font-si=
ze:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=
=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;"><tr style=3D"f=
ont-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpa=
dding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#0E50=
AD;font-style:normal;font-weight:400;white-space:nowrap;"><tr style=3D"font=
-size:13.33px;"><td align=3D"left" style=3D"vertical-align:top;font-family:=
&#39;Arial Black&#39;;">ARRI</td></tr><tr style=3D"font-size:10.67px;color:=
#7F7F7F;"><td align=3D"left" style=3D"vertical-align:top;font-family:Arial;=
"><span style=3D"font-size:11px;">Arnold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&=
nbsp;Technik&nbsp;GmbH&nbsp;&amp;&nbsp;Co.&nbsp;Betriebs&nbsp;KG</span>&nbs=
p;<br /></td></tr></table></td></tr><tr style=3D"font-size:0;"><td align=
=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacin=
g=3D"0" border=3D"0" style=3D"font-size:0;color:#7F7F7F;font-style:normal;f=
ont-weight:400;white-space:nowrap;"><tr style=3D"font-size:10.67px;"><td al=
ign=3D"left" style=3D"vertical-align:top;font-family:Arial;">Herbert=E2=80=
=91Bayer=E2=80=91Str.&nbsp;10</td><td align=3D"left" style=3D"vertical-alig=
n:top;font-family:Arial;">,&nbsp;<br /></td><td align=3D"left" style=3D"ver=
tical-align:middle;font-family:Arial;">80807</td><td align=3D"left" style=
=3D"vertical-align:middle;font-family:Arial;">&nbsp;<br /></td><td align=
=3D"left" style=3D"vertical-align:middle;font-family:Arial;">M&#252;nchen</=
td></tr></table></td></tr></table></td></tr><tr style=3D"font-size:0;"><td =
align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" cells=
pacing=3D"0" border=3D"0" style=3D"font-size:0;"><tr style=3D"font-size:0;"=
><td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" =
cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#1532B9;font-styl=
e:normal;font-weight:400;white-space:nowrap;"><tr style=3D"font-size:11px;"=
><td align=3D"left" style=3D"vertical-align:top;font-family:Arial;"><span s=
tyle=3D"text-decoration:underline;"><a href=3D"http://www.arri.com/" target=
=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:underline;color:#15=
32B9;"><strong style=3D"font-weight:400;">www.arri.com&nbsp;<br /><br /></s=
trong></a></span></td></tr><tr style=3D"font-size:0;"><td align=3D"left" st=
yle=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" bord=
er=3D"0" style=3D"font-size:0;color:#858080;font-style:normal;font-weight:4=
00;line-height:normal;white-space:nowrap;"><tr style=3D"font-size:14.67px;"=
><td align=3D"left" style=3D"padding:0;vertical-align:top;font-size:0;"><im=
g src=3D"cid:image386093.png@B1FE5672.C15A2511" width=3D"20" border=3D"0" a=
lt=3D"" style=3D"width:20px;min-width:20px;max-width:20px;font-size:0;" /><=
/td><td align=3D"left" style=3D"padding:0;vertical-align:top;font-family:Ca=
libri,Arial,sans-serif;"><a href=3D"tel:+49%2089%203809-1719" target=3D"_bl=
ank" id=3D"LPlnk689713" style=3D"text-decoration:none;color:#858080;"><stro=
ng style=3D"font-weight:400;">+49&nbsp;89&nbsp;3809-1719</strong></a></td><=
/tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"padding:0;vertic=
al-align:top;"></td><td align=3D"left" style=3D"padding:0;vertical-align:to=
p;"></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"paddin=
g:0;vertical-align:top;"></td><td align=3D"left" style=3D"padding:0;vertica=
l-align:top;"></td></tr><tr style=3D"font-size:14.67px;"><td align=3D"left"=
 style=3D"padding:0;vertical-align:top;font-size:0;"><img src=3D"cid:image7=
70990.png@41EE00A8.7DC4FF92" width=3D"20" border=3D"0" alt=3D"" style=3D"wi=
dth:20px;min-width:20px;max-width:20px;font-size:0;" /></td><td align=3D"le=
ft" style=3D"padding:0;vertical-align:top;font-family:Calibri,Arial,sans-se=
rif;"><a href=3D"mailto:MLeonhardt@arri.de" target=3D"_blank" id=3D"LPlnk68=
9713" style=3D"text-decoration:none;color:#858080;"><strong style=3D"font-w=
eight:400;">MLeonhardt@arri.de</strong></a></td></tr></table></td></tr></ta=
ble></td></tr></table></td></tr><tr style=3D"font-size:14.67px;color:#00000=
1;font-style:normal;font-weight:400;white-space:nowrap;"><td align=3D"left"=
 style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;"><br />&=
#8203;</td></tr></table></td></tr><tr style=3D"font-size:0;line-height:norm=
al;"><td align=3D"left" style=3D"padding:0;vertical-align:top;"><a href=3D"=
https://www.arri.com/hi-5" target=3D"_blank" id=3D"LPlnk689713" style=3D"te=
xt-decoration:none;"><img src=3D"https://assets.arri.com/media/sign/2021-06=
-16-E-mail-signature-Hi-5-01.jpg" border=3D"0" title=3D"Hi-5: Further. Stro=
nger. Faster" alt=3D"Hi-5: Further. Stronger. Faster" style=3D"font-size:12=
px;" /></a></td></tr><tr style=3D"font-size:13px;color:#7F7F7F;font-style:n=
ormal;font-weight:400;white-space:nowrap;"><td align=3D"left" style=3D"padd=
ing:0;vertical-align:top;font-family:Calibri,Arial,sans-serif;">Get&nbsp;al=
l&nbsp;the&nbsp;latest&nbsp;information&nbsp;from&nbsp;<span style=3D"text-=
decoration:underline;"><a href=3D"http://www.arri.com/" target=3D"_blank" i=
d=3D"LPlnk689713" title=3D"www.arri.com" style=3D"text-decoration:underline=
;color:#7F7F7F;"><strong style=3D"font-weight:400;">www.arri.com</strong></=
a></span>,&nbsp;<span style=3D"text-decoration:underline;"><a href=3D"https=
://www.facebook.com/TeamARRI" target=3D"_blank" id=3D"LPlnk689713" style=
=3D"text-decoration:underline;color:#7F7F7F;"><strong style=3D"font-weight:=
400;">Facebook</strong></a></span>,&nbsp;<span style=3D"text-decoration:und=
erline;"><a href=3D"https://twitter.com/ARRIChannel" target=3D"_blank" id=
=3D"LPlnk689713" style=3D"text-decoration:underline;color:#7F7F7F;"><strong=
 style=3D"font-weight:400;">Twitter</strong></a></span>,&nbsp;<span style=
=3D"text-decoration:underline;"><a href=3D"http://instagram.com/arri" targe=
t=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:underline;color:#7=
F7F7F;"><strong style=3D"font-weight:400;">Instagram</strong></a></span>&nb=
sp;and&nbsp;<span style=3D"text-decoration:underline;"><a href=3D"http://ww=
w.youtube.com/user/ARRIChannel" target=3D"_blank" id=3D"LPlnk689713" style=
=3D"text-decoration:underline;color:#7F7F7F;"><strong style=3D"font-weight:=
400;">YouTube</strong></a></span>.<br /></td></tr><tr style=3D"font-size:0;=
"><td align=3D"left" style=3D"padding:0;vertical-align:top;"><table cellpad=
ding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#6A6A6=
A;font-style:normal;font-weight:400;white-space:nowrap;"><tr style=3D"font-=
size:10px;"><td align=3D"left" style=3D"vertical-align:top;font-family:Aria=
l;"><br />Arnold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&nbsp;Technik&nbsp;GmbH&n=
bsp;&amp;&nbsp;Co.&nbsp;Betriebs&nbsp;KG<br />Sitz:&nbsp;M&#252;nchen&nbsp;=
=E2=80=91&nbsp;Registergericht:&nbsp;Amtsgericht&nbsp;M&#252;nchen&nbsp;=
=E2=80=91&nbsp;Handelsregisternummer:&nbsp;HRA&nbsp;57918<br />Pers&#246;nl=
ich&nbsp;haftender&nbsp;Gesellschafter:&nbsp;Arnold&nbsp;&amp;&nbsp;Richter=
&nbsp;Cine&nbsp;Technik&nbsp;GmbH<br />Sitz:&nbsp;M&#252;nchen&nbsp;=E2=80=
=91&nbsp;Registergericht:&nbsp;Amtsgericht&nbsp;M&#252;nchen&nbsp;=E2=80=
=91&nbsp;Handelsregisternummer:&nbsp;HRB&nbsp;54477<br />Gesch&#228;ftsf&#2=
52;hrer:&nbsp;Dr.&nbsp;Michael&nbsp;Neuh&#228;user;&nbsp;Stephan&nbsp;Schen=
k;&nbsp;Walter&nbsp;Trauninger;&nbsp;Markus&nbsp;Zeiler<br /></td></tr><tr =
style=3D"font-size:14.67px;color:#000001;"><td align=3D"left" style=3D"vert=
ical-align:top;font-family:Calibri,Arial,sans-serif;"><br />&#8203;<br /></=
td></tr></table></td></tr></table></td></tr></table></div></body></html>
------_=_NextPart_716a9f8b-2423-45f9-83aa-7bcb9b14e1bf--

------_=_NextPart_f48fd3d4-fa85-40c4-acaa-2c545b69cf2e
Content-Type: image/png;
	name="image386093.png"
Content-Transfer-Encoding: base64
Content-ID: <image386093.png@B1FE5672.C15A2511>
Content-Description: image386093.png
Content-Disposition: inline;
	creation-date="Tue, 02 Nov 2021 19:15:01 +0000";
	filename=image386093.png;
	modification-date="Tue, 02 Nov 2021 19:15:01 +0000";
	size=528

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGlSURBVDhP1ZOxSgNBEIZ3o6QSSWGRwiJFCl9A
iCDEIqKFgo2FYGHjA1hYRZ0sGrURgq0WgkoqEUHQShJMYWFhmcLCwsIHsJBEs/5zmTvvJIE9sPGD
Zf7Zu/tvdndW/TVaogcRDSWVKlilMhvGVGQ6FoEhzAaTWt9AFji31q7C9Jh1HBISFSpbQPDMGK31
NlcsqTOBIRxmRPmkUTGJdubHUKmsxDA5ic6EDV8k+jRa1i6KdiYw/LL2QiTzDrNpY8yb5M4EhlvG
XKNdniXl9pkTHYvwkrlXDkTxIR3tEWUkcyZi2FbqBOGxm6lUR+tT7k/JnYgYYs8+sHfzkP7eTaJ1
LmGaktyjTDSGsSxphMjV89khyqGx7yG96rC3r7g5S5vGNHaJsrb7LI3RwPw6btQDv8f0NGRwTWYT
Wlch/eo+Mc5gPoWPfu9tpVgqrbGIHkoIVHOLQ5qAQVOmuNqVHma8guDK9jVkisY029aOQ/JhcYU9
wbLPRaoBiX2p1+utu1rtqpDPV9FKHVQziiqH5fETzMr40yHe68hcfPaJRnHyI5L+K5T6BsZ9gKi6
xb3hAAAAAElFTkSuQmCC

------_=_NextPart_f48fd3d4-fa85-40c4-acaa-2c545b69cf2e
Content-Type: image/png;
	name="image770990.png"
Content-Transfer-Encoding: base64
Content-ID: <image770990.png@41EE00A8.7DC4FF92>
Content-Description: image770990.png
Content-Disposition: inline;
	creation-date="Tue, 02 Nov 2021 19:15:01 +0000";
	filename=image770990.png;
	modification-date="Tue, 02 Nov 2021 19:15:01 +0000";
	size=824

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALNSURBVDhPtZQ/SNVRFMfv1Z/S4PCGBoeg1Uih
oaFB8j1wMGgweBJBgUNRUQ2BQaH2e79SaKipwcGhlkioQEiooT++7RUOBkYODg0GgiIOLyi1bp/v
/d3fL8U31hfuO/ec3z3nfM895z7zr2GDbIg4jgutxvQ6Yw5IRy5uGzOfJMmKP9AADQMSaH+LtQ/5
WEaNUutfEHj5t3OXbyfJTDDl2BNwPI7LxtoJthFOD5A1WM0hf7QY04FDB98vohdZjzeduwbjOnuP
piA9QrBnMJjl4KHRJBmD3hJlF5HdW8Z8HU6SqeFKpeScu4BLmUoepd4pcoYqs9XaLwo2UqkMoEfo
YjrIysreNs6dI+kk515b516wf4ptgETPdSBnqDtDRFuUIJ1g0s/jOE3pJ7TQZ30AY9pg4tmyn8E2
AYE29mlmdVMNwInrSFbG4vgq5kvY7lHeLZ0ROFcj0SrbCFYfZNM9N1n7XveLOucZajQQCl6TTsYr
MFv66dyo1wNItoFQg4QF/dAwL0GnfnxAnP2cqZu6S3WSD1MEwLQbnFVpdcpdlM6ZNcSatfaw9Cyg
2Ml5G7bd3ubcJ8md0D2RTEzmU0uOPLEPyM8yIiLqEYIXZMtY7wTJhsI2K1tJ2hHtEPgs3QfcVPdS
HGP5UijhtGSGO3F8EuOw9pmzGNOkSbYbkHkjGxWkGK9UXsGqk7Hp4tBLTN3oU2RcQvahH0VO49DP
XgxF4iyr8Is5zJ6hZyg08TY5XCDY3WbnzgTnMnKEz5FeBgN/ijG5gW1fSKLh7tr5pnOGguaPUjXQ
93l6GhlddlsYl13gmfZzVTXNbTB5NAfp8a5a/Vjq6flO0JsM6yD3sspaf1utruu77qy3WDzeWyo9
4T6HKO8bPunsBuximIHs+kfRo1eThA1KrHM46/w8pV/nzyNrZo6GATNwBRqjPtgeRK2H7i6MJEk+
Nv8ZxvwBPgIhrepF7fMAAAAASUVORK5CYII=

------_=_NextPart_f48fd3d4-fa85-40c4-acaa-2c545b69cf2e--

