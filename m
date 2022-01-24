Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44777C433F5
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 09:58:05 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.97])
 by mx.groups.io with SMTP id smtpd.web12.1658.1643018280917533571
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 01:58:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=uOdwcmsf;
 spf=pass (domain: arri.de, ip: 40.107.13.97, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRqwPjlMVcSvEElb/7q9Gsw4wUqXIknRRPYT+Fh+Fbs+bhveiz5eVFhPjmPxDAHA9MbjIR4eWNS8xn+XWH+TcmMAvL+zi7A7md+BqZg1LXIm6GM9stX1TflKvnF4VIAIZwIpO5d+P3ijfvcO495nWtKmCj1gPVAWFGCgVkIjp1RxKex2FCO0pgNxkoZEvdGFhV0rmby0F+brALwCImu+lAnrULkMwaLMRcBEUaEGnRiQLDndDYpcN2UgymJUv3Pr0Plu46tsJc1FDYEltSxfKCygYTI2F1gms0nZXKnoddhVVz1mkNpyDUDUWfqkhm+XiPPUVbnLgQ/tNWviyJrHJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ht593gtYOMwJTn1FDDEHbUTY4cuEFgmoyaUxdaIsU4Y=;
 b=ET+z2Nv7CoZIQxKhpx7j4B/zIxTIqDn9dHmVq28QgyBOnkfFbZKILwRZ2AtztfJ612j8oKPe2EEUGz2LS6kvWeSOrTnMlJxS7dRWP/gaBaaVZ+u1hMSypjXCpFS+TvRtoMv/HVT3mT+Vj86zaGfiIBY8rRNzinKk1RkHthM+02EQ3Rx8zMixpAjnMeKp9tuOyYnXlFB2C9ciYhljAKtYBNngOZnUn68ZYXQ5sR/pgFzx7FAG0ac3hpv/F7DtZfdhZECVDs1X6T/Q3vW2l590AVOu4h8ZQQGB4TBw6YJCTtcsA+p2R2vc4YYeeFdP+TfDyvqE8LxZXO+9kHltj48dDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 104.40.229.156) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arri.de;
 dmarc=bestguesspass action=none header.from=arri.de; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ht593gtYOMwJTn1FDDEHbUTY4cuEFgmoyaUxdaIsU4Y=;
 b=uOdwcmsfhbys7gHWLWHokw8i34n44k7E99mrTqIY8n5woZCcq87gyrkrnWf6u3yNhyvxHWmon1p7I7TyDcLfdtYIdUGsCHJNAPAsTch3TstEzILS5NGypXlyv9a7nBS322cGM6X7n4eZnIJ3QM8h54qSZ49zrinBSIqG68V6Tes=
Received: from SV0P279CA0062.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:14::13)
 by DB7PR07MB6025.eurprd07.prod.outlook.com (2603:10a6:10:85::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.14; Mon, 24 Jan
 2022 09:57:56 +0000
Received: from HE1EUR02FT040.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:f10:14:cafe::97) by SV0P279CA0062.outlook.office365.com
 (2603:10a6:f10:14::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Mon, 24 Jan 2022 09:57:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 104.40.229.156)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=arri.de;
Received-SPF: Pass (protection.outlook.com: domain of arri.de designates
 104.40.229.156 as permitted sender) receiver=protection.outlook.com;
 client-ip=104.40.229.156; helo=eu1.smtp.exclaimer.net;
Received: from eu1.smtp.exclaimer.net (104.40.229.156) by
 HE1EUR02FT040.mail.protection.outlook.com (10.152.11.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Mon, 24 Jan 2022 09:57:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.176)
	 by eu1.smtp.exclaimer.net (104.40.229.156) with Exclaimer Signature Manager
	 ESMTP Proxy eu1.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Mon, 24 Jan 2022 09:57:55 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 16116626
X-ExclaimerImprintLatency: 4030774
X-ExclaimerImprintAction: 635d36e1671b4cbfa9d6560988a58460
Content-Type: multipart/related;
	boundary="----_=_NextPart_9ecbd06e-cf9b-4151-a101-fa2fa88b1ef7"
Received: from AS9PR0301CA0047.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::27) by DB7PR07MB5609.eurprd07.prod.outlook.com
 (2603:10a6:10:31::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.14; Mon, 24 Jan
 2022 09:57:52 +0000
Received: from HE1EUR02FT056.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:469:cafe::56) by AS9PR0301CA0047.outlook.office365.com
 (2603:10a6:20b:469::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17 via Frontend
 Transport; Mon, 24 Jan 2022 09:57:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.66)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.66 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.66; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.66) by
 HE1EUR02FT056.mail.protection.outlook.com (10.152.11.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Mon, 24 Jan 2022 09:57:51 +0000
Received: from dhcp-192-168-0-28.wgnetz.xx (192.168.55.5) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 24 Jan
 2022 10:57:50 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: <otavio.salvador@ossystems.com.br>, <hs@denx.de>,
	<alexandre.belloni@bootlin.com>, Fabio Estevam <festevam@denx.de>, Fabio
 Estevam <festevam@gmail.com>
Subject: Re: [OE-core] [PATCH meta-oe] rtc-tool: Add a recipe
Date: Mon, 24 Jan 2022 10:57:50 +0100
Message-ID: <5813000.lOV4Wx5bFT@dhcp-192-168-0-28.wgnetz.xx>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <20220123150358.1306062-1-festevam@gmail.com>
References: <20220123150358.1306062-1-festevam@gmail.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.55.5]
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 0fe700ca-25bb-4995-46ac-08d9df1ffeb4
X-MS-TrafficTypeDiagnostic: 
	DB7PR07MB5609:EE_|HE1EUR02FT040:EE_|DB7PR07MB6025:EE_
X-Microsoft-Antispam-PRVS: 
	<DB7PR07MB6025E6B2021EB47F1C83E084BF5E9@DB7PR07MB6025.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 tKTA5sSJwUSesGdF3Y3kDoAhSBQQd1HGKUx2ZpdLvIl/9VetP9w/Q0n9fVBu0te/cGDx3VrlQiYYfxcp1Peo7vf48a+F6mYgbgWujffGPOlLRCbM03pHffXjzeZcE0TN7QEctatGCNlHRmKcCE8tCI0X5tzqvybmNi0etuI9AdcYiSy9aF3ROZD3PpMtcpGOFLDDoe27XFgdXZ6qX9b6+6AvOFEGG/VeZWSSEofvkFCeIJHEPGOh2uwoFd7STeuHBOz17oBQdEax2WLCEVjfMkG1CC9xbFjG8CfmR6O14QpJYdLMNz8QjMm5RN/qrA+3t2pOAY+FNcfy3zqUrZUyMI7LOtz2eeYJNIz+B2MpcELOhNz8nxBg8DGHEb4fGEthu4w/ymxQLMBVNIeXJ5mX/JBHpslHmGsb2rKWVblwZMV7WfQMdSEe5d0ur34TbMELRTlaSe79qFZgzxQkXFJrp4RCmmyJBy4O96XHx2RpjMcC1wpAVmSoWwLGYsAPXGChB7CeBs3+IxFGBg75Gb41l2FcJjmL1OnYKKyIOpuB6bwJmYnU7AJ9K8SbVwbRGYjG28x7p3FlfoveI7CRtBkjDWNiCLYt7P+FcF4J6cw6uPTLHqV17Ia6JrEvqfRyUitFDj/YjHRWzKaoKGtbqfOguAzursv/qNA2hzsqOaSWI4OmclFvV0xKNDlI82iV56hjWF+rQ2IrEcRPvjeiIuKRjt5Bwy4t0ohTZg0vk1LByshv2wuG3Od5lXOb9LRP5fT13pcPvlC9edkAvJbI4ykr+PF5AgQJRlCgUBLvIb3IEo2KFspWAXvXns8aYR2IQmnS
X-Forefront-Antispam-Report-Untrusted: 
 CIP:217.111.95.66;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(508600001)(70586007)(8936002)(70206006)(81166007)(4326008)(336012)(356005)(8676002)(16526019)(186003)(426003)(82310400004)(36916002)(9686003)(26005)(7696005)(19627235002)(316002)(6916009)(47076005)(36860700001)(86362001)(54906003)(2906002)(5660300002)(55016003)(39026012)(102196002)(36900700001)(20210929001);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR07MB5609
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 HE1EUR02FT040.eop-EUR02.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	81884c29-1c63-4723-88d0-08d9df1ffc61
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Rgvwkjf3ttd2Oq/fXV7suCVwBw4PKN0AFH2Ik4lxXYJ+q690NBMDFppp6L7ZWOl1VeegTQ4lOYKx4N9LVm9Kid80VM7mHpYDi2M+6odD+MWtTFKL2JJws45/FynRv3z/GVceXlp6eh9iGDBWctzM4gXhkCONfGK/7gR2UoEo5rYrvy724qmdaYd0cSpt4ae1Go0tcx5mbAbB9Fzo4WVjkh0B7e3qSLhYSDCg1WJyI+mlxFlRMcJlvn+9hhv8qUhWD4GC8XFEcJNxlwtwj4+mSgaFR+mIMyWmCC/q1WZZIxuBJ/bnu5wi/WRAt8Hv9jejEE+KnxTwY+0FyOZ51IbO20cCgaNb9L4dqq7t7/5FSkCZ8AtE2XcU33N1i+s85gFzE49izNcDLxeLSlE5zYmf85i6c5Hoj2BEhOXNWfjrV4WUDkrXqVacwhqW0hdO37vLpEUesIOS8qrOWkiGMrMITK6KT3pIuB+vDT1E5tY95Y3k92OsvGuxvxKfuSpoiy/QToNb3kI0oRkxIp5eMxzz2lPb3+5Yuszu5tOkiDDel5INl8ABdz+BsULAu8JSjr6Ayg2jJ5/5VG8GlERqy4i8WsTJs3vcGVWJHScRywthaYX9Rpe7PY1mmOwpBUUmKsIGLfO0jnTbCo2MA6bW401LtwkymVfuQyGmoSM6ZAEfcl5rPc7OtCYEIveN9hoXfLDmDaPvazZEQ6D0hV+ISGclkhYNw0M7+B5epSSC5Owd+sBfgdp2PeXZRWeCYvhgtjfGydYeTkOjS3HOH/kjvCiiI0aGxbySeNtrRNGJ2VDK6M96HPVYIVF2f87wajw3Eh6a
X-Forefront-Antispam-Report: 
	CIP:104.40.229.156;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu1.smtp.exclaimer.net;PTR:eu1.smtp.exclaimer.net;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(36860700001)(47076005)(82310400004)(316002)(86362001)(2906002)(5660300002)(55016003)(7066003)(36916002)(15974865002)(33964004)(9686003)(7596003)(7636003)(336012)(426003)(70206006)(166002)(4326008)(70586007)(8936002)(8676002)(19627235002)(54906003)(7696005)(508600001)(186003)(26005)(16526019)(6916009)(39026012)(102196002)(20210929001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 09:57:54.8594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0fe700ca-25bb-4995-46ac-08d9df1ffeb4
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[104.40.229.156];Helo=[eu1.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR02FT040.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR07MB6025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 09:58:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160873

This is a multi-part message in MIME format.

------_=_NextPart_9ecbd06e-cf9b-4151-a101-fa2fa88b1ef7
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_21df9bbc-ef31-4e42-82db-36bed418dfc5"

------_=_NextPart_21df9bbc-ef31-4e42-82db-36bed418dfc5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Fabio,

from my experience, custom build systems (including "bare" Makefiles)
are often hard to integrate/maintain for distributors.

What about using CMake instead?

regards
Christian

On Sunday, 23 January 2022, 16:03:58 CET, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> rtc-tools is a useful utility developed by Alexandre Belloni
> for testing RTC kernel drivers, such as y2038 support.
> 
> Based on the initial recipe from Heiko Schocher <hs@denx.de>.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  .../0001-rtc-tools-Add-a-Makefile.patch       | 52 +++++++++++++++++++
>  .../rtc-tools/rtc-tools_1.0.0.bb              | 19 +++++++
>  2 files changed, 71 insertions(+)
>  create mode 100644 meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-=
tools-Add-a-Makefile.patch
>  create mode 100644 meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb
> 
> diff --git a/meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-A=
dd-a-Makefile.patch b/meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-=
tools-Add-a-Makefile.patch
> new file mode 100644
> index 000000000000..a372e390efb9
> --- /dev/null
> +++ b/meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Ma=
kefile.patch
> @@ -0,0 +1,52 @@
> +From faa6dd2e4d063afcaa19f16740a3fc413a399e60 Mon Sep 17 00:00:00 2001
> +
_______________________________________________________
Christian 
Eggers
Software Engineer
=E2=80=8B
ARRI
Arnold & Richter Cine Technik GmbH & Co. Betriebs KG 
Arriweg 17, 
83071 
Stephanskirchen
www.arri.com 

+49 8036 3009-3118
CEggers@arri.de

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
From: Fabio Estevam <festevam@denx.de>
> +Date: Sun, 23 Jan 2022 09:22:19 -0300
> +Subject: [PATCH rtc-tools] rtc-tools: Add a Makefile
> +
> +Add a Makefile to make installation and uninstallation
> +process easier.
> +
> +Upstream-Status: Submitted [https://marc.info/?l=3Dlinux-rtc&m=3D1642940=
73129803&w=3D2]
> +Signed-off-by: Fabio Estevam <festevam@denx.de>
> +---
> + Makefile | 29 +++++++++++++++++++++++++++++
> + 1 file changed, 29 insertions(+)
> + create mode 100644 Makefile
> +
> +diff --git a/Makefile b/Makefile
> +new file mode 100644
> +index 000000000000..4f244d9289f1
> +--- /dev/null
> ++++ b/Makefile
> +@@ -0,0 +1,29 @@
> ++prefix ?=3D /usr
> ++bindir ?=3D $(prefix)/bin
> ++
> ++EXEC =3D rtc-range rtc rtc-sync
> ++
> ++all: $(EXEC)
> ++
> ++rtc-range: rtc-range.c
> ++	$(CC) $(CFLAGS) -o $@ rtc-range.c
> ++
> ++rtc: rtc.c
> ++	$(CC) $(CFLAGS) -o $@ rtc.c
> ++
> ++rtc-sync: rtc-sync.c
> ++	$(CC) $(CFLAGS) -o $@ rtc-sync.c
> ++
> ++clean:
> ++	rm -f $(EXEC)
> ++
> ++install: rtc-range rtc rtc-sync
> ++	mkdir -p '$(DESTDIR)$(bindir)'
> ++	install -m755 rtc-range '$(DESTDIR)$(bindir)/rtc-range'
> ++	install -m755 rtc '$(DESTDIR)$(bindir)/rtc'
> ++	install -m755 rtc-sync '$(DESTDIR)$(bindir)/rtc-sync'
> ++
> ++uninstall:
> ++	rm -rf '$(DESTDIR)$(bindir)/rtc-range'
> ++	rm -rf '$(DESTDIR)$(bindir)/rtc'
> ++	rm -rf '$(DESTDIR)$(bindir)/rtc-sync'
> +--
> +2.25.1
> diff --git a/meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb b/meta-=
oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb
> new file mode 100644
> index 000000000000..8f0326829d8c
> --- /dev/null
> +++ b/meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION =3D "Useful programs to test rtc drivers"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D74274e8a218423e49eefdea80bc55=
038"
> +
> +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-=
tools.git;protocol=3Dhttps;branch=3Dmaster \
> +           file://0001-rtc-tools-Add-a-Makefile.patch \
> +           "
> +SRCREV ?=3D "acc442e7af4e1e783432a43d37f1a7938c692659"
> +
> +S =3D "${WORKDIR}/git"
> +
> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
> +EXTRA_OEMAKE =3D " \
> +	DESTDIR=3D${D} \
> +	all \
> +	"
> +do_install() {
> +	oe_runmake install
> +}
> 





------_=_NextPart_21df9bbc-ef31-4e42-82db-36bed418dfc5
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8" /></head><body><div>Hi Fabio,<br /><br />from my experience, cust=
om build systems (including &quot;bare&quot; Makefiles)<br />are often hard=
 to integrate/maintain for distributors.<br /><br />What about using CMake =
instead?<br /><br />regards<br />Christian<br /><br />On Sunday, 23 January=
 2022, 16:03:58 CET, Fabio Estevam wrote:<br />&gt; From: Fabio Estevam &lt=
;festevam@denx.de&gt;<br />&gt; <br />&gt; rtc-tools is a useful utility de=
veloped by Alexandre Belloni<br />&gt; for testing RTC kernel drivers, such=
 as y2038 support.<br />&gt; <br />&gt; Based on the initial recipe from He=
iko Schocher &lt;hs@denx.de&gt;.<br />&gt; <br />&gt; Signed-off-by: Fabio =
Estevam &lt;festevam@denx.de&gt;<br />&gt; ---<br />&gt;  .../0001-rtc-tool=
s-Add-a-Makefile.patch       | 52 +++++++++++++++++++<br />&gt;  .../rtc-to=
ols/rtc-tools_1.0.0.bb              | 19 +++++++<br />&gt;  2 files changed=
, 71 insertions(+)<br />&gt;  create mode 100644 meta-oe/recipes-support/rt=
c-tools/rtc-tools/0001-rtc-tools-Add-a-Makefile.patch<br />&gt;  create mod=
e 100644 meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb<br />&gt; <br=
 />&gt; diff --git a/meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-t=
ools-Add-a-Makefile.patch b/meta-oe/recipes-support/rtc-tools/rtc-tools/000=
1-rtc-tools-Add-a-Makefile.patch<br />&gt; new file mode 100644<br />&gt; i=
ndex 000000000000..a372e390efb9<br />&gt; --- /dev/null<br />&gt; +++ b/met=
a-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Makefile.patc=
h<br />&gt; @@ -0,0 +1,52 @@<br />&gt; +From faa6dd2e4d063afcaa19f16740a3fc=
413a399e60 Mon Sep 17 00:00:00 2001<br />&gt; +<div dir=3D"ltr" style=3D"ms=
o-line-height-rule:exactly;-webkit-text-size-adjust:100%;direction:ltr;"><t=
able cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"width:100%;"=
><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:top;=
"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-siz=
e:0;"><tr style=3D"font-size:0;"><td align=3D"left" style=3D"padding:0;vert=
ical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" st=
yle=3D"width:100%;font-size:0;"><tr style=3D"font-size:14.67px;color:#7F7F7=
F;font-style:normal;font-weight:400;white-space:nowrap;"><td align=3D"left"=
 style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;">_______=
________________________________________________<span style=3D"font-family:=
remialcxesans;font-size:1px;color:#FFFFFF;line-height:1px;">&#8203;</span><=
/td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-al=
ign:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"=
font-size:0;"><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertic=
al-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" styl=
e=3D"font-size:0;color:#7F7F7F;font-style:normal;font-weight:400;white-spac=
e:nowrap;"><tr style=3D"font-size:14.67px;"><td align=3D"left" style=3D"ver=
tical-align:top;font-family:Calibri,Arial,sans-serif;">Christian</td><td al=
ign=3D"left" style=3D"vertical-align:top;color:#000001;font-family:Calibri,=
Arial,sans-serif;">&nbsp;<br /></td><td align=3D"left" style=3D"vertical-al=
ign:top;font-family:Calibri,Arial,sans-serif;">Eggers</td></tr></table></td=
></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align=
:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"fon=
t-size:0;color:#7F7F7F;font-style:normal;font-weight:400;white-space:nowrap=
;"><tr style=3D"font-size:14.67px;"><td align=3D"left" style=3D"vertical-al=
ign:top;font-family:Calibri,Arial,sans-serif;">Software&nbsp;Engineer</td><=
/tr><tr style=3D"font-size:14.67px;color:#000001;"><td align=3D"left" style=
=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;">&#8203;</td><=
/tr></table></td></tr></table></td></tr><tr style=3D"font-size:0;"><td alig=
n=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspaci=
ng=3D"0" border=3D"0" style=3D"font-size:0;"><tr style=3D"font-size:0;"><td=
 align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" cell=
spacing=3D"0" border=3D"0" style=3D"font-size:0;color:#0E50AD;font-style:no=
rmal;font-weight:400;white-space:nowrap;"><tr style=3D"font-size:13.33px;">=
<td align=3D"left" style=3D"vertical-align:top;font-family:&#39;Arial Black=
&#39;;">ARRI</td></tr><tr style=3D"font-size:10.67px;color:#7F7F7F;"><td al=
ign=3D"left" style=3D"vertical-align:top;font-family:Arial;"><span style=
=3D"font-size:11px;">Arnold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&nbsp;Technik&=
nbsp;GmbH&nbsp;&amp;&nbsp;Co.&nbsp;Betriebs&nbsp;KG</span>&nbsp;<br /></td>=
</tr></table></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=
=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=
=3D"0" style=3D"font-size:0;color:#7F7F7F;font-style:normal;font-weight:400=
;white-space:nowrap;"><tr style=3D"font-size:10.67px;"><td align=3D"left" s=
tyle=3D"vertical-align:top;font-family:Arial;">Arriweg&nbsp;17</td><td alig=
n=3D"left" style=3D"vertical-align:top;font-family:Arial;">,&nbsp;<br /></t=
d><td align=3D"left" style=3D"vertical-align:middle;font-family:Arial;">830=
71</td><td align=3D"left" style=3D"vertical-align:middle;font-family:Arial;=
">&nbsp;<br /></td><td align=3D"left" style=3D"vertical-align:middle;font-f=
amily:Arial;">Stephanskirchen</td></tr></table></td></tr></table></td></tr>=
<tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"=
><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size=
:0;"><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:=
top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font=
-size:0;color:#1532B9;font-style:normal;font-weight:400;white-space:nowrap;=
"><tr style=3D"font-size:11px;"><td align=3D"left" style=3D"vertical-align:=
top;font-family:Arial;"><span style=3D"text-decoration:underline;"><a href=
=3D"http://www.arri.com/" target=3D"_blank" id=3D"LPlnk689713" style=3D"tex=
t-decoration:underline;color:#1532B9;"><strong style=3D"font-weight:400;">w=
ww.arri.com&nbsp;<br /><br /></strong></a></span></td></tr><tr style=3D"fon=
t-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpadd=
ing=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#858080=
;font-style:normal;font-weight:400;line-height:normal;white-space:nowrap;">=
<tr style=3D"font-size:14.67px;"><td align=3D"left" style=3D"padding:0;vert=
ical-align:top;font-size:0;"><img src=3D"cid:image458720.png@C2E1C228.C394C=
653" width=3D"20" border=3D"0" alt=3D"" style=3D"width:20px;min-width:20px;=
max-width:20px;font-size:0;" /></td><td align=3D"left" style=3D"padding:0;v=
ertical-align:top;font-family:Calibri,Arial,sans-serif;"><a href=3D"tel:+49=
%208036%203009-3118" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-dec=
oration:none;color:#858080;"><strong style=3D"font-weight:400;">+49&nbsp;80=
36&nbsp;3009-3118</strong></a></td></tr><tr style=3D"font-size:0;"><td alig=
n=3D"left" style=3D"padding:0;vertical-align:top;"></td><td align=3D"left" =
style=3D"padding:0;vertical-align:top;"></td></tr><tr style=3D"font-size:0;=
"><td align=3D"left" style=3D"padding:0;vertical-align:top;"></td><td align=
=3D"left" style=3D"padding:0;vertical-align:top;"></td></tr><tr style=3D"fo=
nt-size:14.67px;"><td align=3D"left" style=3D"padding:0;vertical-align:top;=
font-size:0;"><img src=3D"cid:image140513.png@11F4A1F7.8329A9B5" width=3D"2=
0" border=3D"0" alt=3D"" style=3D"width:20px;min-width:20px;max-width:20px;=
font-size:0;" /></td><td align=3D"left" style=3D"padding:0;vertical-align:t=
op;font-family:Calibri,Arial,sans-serif;"><a href=3D"mailto:CEggers@arri.de=
" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:none;color:=
#858080;"><strong style=3D"font-weight:400;">CEggers@arri.de</strong></a></=
td></tr></table></td></tr></table></td></tr></table></td></tr><tr style=3D"=
font-size:14.67px;color:#000001;font-style:normal;font-weight:400;white-spa=
ce:nowrap;"><td align=3D"left" style=3D"vertical-align:top;font-family:Cali=
bri,Arial,sans-serif;"><br />&#8203;</td></tr></table></td></tr><tr style=
=3D"font-size:0;line-height:normal;"><td align=3D"left" style=3D"padding:0;=
vertical-align:top;"><a href=3D"https://www.arri.com/en/lighting/led/orbite=
r-accessories/orbiter-dockingring/" target=3D"_blank" id=3D"LPlnk689713" st=
yle=3D"text-decoration:none;"><img src=3D"https://assets.arri.com/media/sig=
n/2022_Orbiter_Docking-Ring_E-mail-Signature_650x95.jpg" border=3D"0" title=
=3D"Orbiter Docking Ring" alt=3D"Orbiter Docking Ring" style=3D"font-size:1=
2px;" /></a></td></tr><tr style=3D"font-size:13px;color:#7F7F7F;font-style:=
normal;font-weight:400;white-space:nowrap;"><td align=3D"left" style=3D"pad=
ding:0;vertical-align:top;font-family:Calibri,Arial,sans-serif;">Get&nbsp;a=
ll&nbsp;the&nbsp;latest&nbsp;information&nbsp;from&nbsp;<span style=3D"text=
-decoration:underline;"><a href=3D"http://www.arri.com/" target=3D"_blank" =
id=3D"LPlnk689713" title=3D"www.arri.com" style=3D"text-decoration:underlin=
e;color:#7F7F7F;"><strong style=3D"font-weight:400;">www.arri.com</strong><=
/a></span>,&nbsp;<span style=3D"text-decoration:underline;"><a href=3D"http=
s://www.facebook.com/TeamARRI" target=3D"_blank" id=3D"LPlnk689713" style=
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
td></tr></table></td></tr></table></td></tr></table></div>From: Fabio Estev=
am &lt;festevam@denx.de&gt;<br />&gt; +Date: Sun, 23 Jan 2022 09:22:19 -030=
0<br />&gt; +Subject: [PATCH rtc-tools] rtc-tools: Add a Makefile<br />&gt;=
 +<br />&gt; +Add a Makefile to make installation and uninstallation<br />&=
gt; +process easier.<br />&gt; +<br />&gt; +Upstream-Status: Submitted [htt=
ps://marc.info/?l=3Dlinux-rtc&amp;m=3D164294073129803&amp;w=3D2]<br />&gt; =
+Signed-off-by: Fabio Estevam &lt;festevam@denx.de&gt;<br />&gt; +---<br />=
&gt; + Makefile | 29 +++++++++++++++++++++++++++++<br />&gt; + 1 file chang=
ed, 29 insertions(+)<br />&gt; + create mode 100644 Makefile<br />&gt; +<br=
 />&gt; +diff --git a/Makefile b/Makefile<br />&gt; +new file mode 100644<b=
r />&gt; +index 000000000000..4f244d9289f1<br />&gt; +--- /dev/null<br />&g=
t; ++++ b/Makefile<br />&gt; +@@ -0,0 +1,29 @@<br />&gt; ++prefix ?=3D /usr=
<br />&gt; ++bindir ?=3D $(prefix)/bin<br />&gt; ++<br />&gt; ++EXEC =3D rt=
c-range rtc rtc-sync<br />&gt; ++<br />&gt; ++all: $(EXEC)<br />&gt; ++<br =
/>&gt; ++rtc-range: rtc-range.c<br />&gt; ++	$(CC) $(CFLAGS) -o $@ rtc-rang=
e.c<br />&gt; ++<br />&gt; ++rtc: rtc.c<br />&gt; ++	$(CC) $(CFLAGS) -o $@ =
rtc.c<br />&gt; ++<br />&gt; ++rtc-sync: rtc-sync.c<br />&gt; ++	$(CC) $(CF=
LAGS) -o $@ rtc-sync.c<br />&gt; ++<br />&gt; ++clean:<br />&gt; ++	rm -f $=
(EXEC)<br />&gt; ++<br />&gt; ++install: rtc-range rtc rtc-sync<br />&gt; +=
+	mkdir -p &#39;$(DESTDIR)$(bindir)&#39;<br />&gt; ++	install -m755 rtc-ran=
ge &#39;$(DESTDIR)$(bindir)/rtc-range&#39;<br />&gt; ++	install -m755 rtc &=
#39;$(DESTDIR)$(bindir)/rtc&#39;<br />&gt; ++	install -m755 rtc-sync &#39;$=
(DESTDIR)$(bindir)/rtc-sync&#39;<br />&gt; ++<br />&gt; ++uninstall:<br />&=
gt; ++	rm -rf &#39;$(DESTDIR)$(bindir)/rtc-range&#39;<br />&gt; ++	rm -rf &=
#39;$(DESTDIR)$(bindir)/rtc&#39;<br />&gt; ++	rm -rf &#39;$(DESTDIR)$(bindi=
r)/rtc-sync&#39;<br />&gt; +--<br />&gt; +2.25.1<br />&gt; diff --git a/met=
a-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb b/meta-oe/recipes-support=
/rtc-tools/rtc-tools_1.0.0.bb<br />&gt; new file mode 100644<br />&gt; inde=
x 000000000000..8f0326829d8c<br />&gt; --- /dev/null<br />&gt; +++ b/meta-o=
e/recipes-support/rtc-tools/rtc-tools_1.0.0.bb<br />&gt; @@ -0,0 +1,19 @@<b=
r />&gt; +DESCRIPTION =3D &quot;Useful programs to test rtc drivers&quot;<b=
r />&gt; +LICENSE =3D &quot;GPLv2&quot;<br />&gt; +LIC_FILES_CHKSUM =3D &qu=
ot;file://COPYING;md5=3D74274e8a218423e49eefdea80bc55038&quot;<br />&gt; +<=
br />&gt; +SRC_URI =3D &quot;git://git.kernel.org/pub/scm/linux/kernel/git/=
abelloni/rtc-tools.git;protocol=3Dhttps;branch=3Dmaster \<br />&gt; +      =
     file://0001-rtc-tools-Add-a-Makefile.patch \<br />&gt; +           &qu=
ot;<br />&gt; +SRCREV ?=3D &quot;acc442e7af4e1e783432a43d37f1a7938c692659&q=
uot;<br />&gt; +<br />&gt; +S =3D &quot;${WORKDIR}/git&quot;<br />&gt; +<br=
 />&gt; +TARGET_CC_ARCH +=3D &quot;${LDFLAGS}&quot;<br />&gt; +EXTRA_OEMAKE=
 =3D &quot; \<br />&gt; +	DESTDIR=3D${D} \<br />&gt; +	all \<br />&gt; +	&q=
uot;<br />&gt; +do_install() {<br />&gt; +	oe_runmake install<br />&gt; +}<=
br />&gt; <br /><br /><br /><br /><br /></div></body></html>
------_=_NextPart_21df9bbc-ef31-4e42-82db-36bed418dfc5--

------_=_NextPart_9ecbd06e-cf9b-4151-a101-fa2fa88b1ef7
Content-Type: image/png;
	name="image458720.png"
Content-Transfer-Encoding: base64
Content-ID: <image458720.png@C2E1C228.C394C653>
Content-Description: image458720.png
Content-Disposition: inline;
	creation-date="Mon, 24 Jan 2022 09:57:56 +0000";
	filename=image458720.png;
	modification-date="Mon, 24 Jan 2022 09:57:56 +0000";
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

------_=_NextPart_9ecbd06e-cf9b-4151-a101-fa2fa88b1ef7
Content-Type: image/png;
	name="image140513.png"
Content-Transfer-Encoding: base64
Content-ID: <image140513.png@11F4A1F7.8329A9B5>
Content-Description: image140513.png
Content-Disposition: inline;
	creation-date="Mon, 24 Jan 2022 09:57:56 +0000";
	filename=image140513.png;
	modification-date="Mon, 24 Jan 2022 09:57:56 +0000";
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

------_=_NextPart_9ecbd06e-cf9b-4151-a101-fa2fa88b1ef7--

