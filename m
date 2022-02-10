Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9EB1C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 10:28:40 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.130])
 by mx.groups.io with SMTP id smtpd.web08.8335.1644488917736663794
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 02:28:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=edWWKQr6;
 spf=pass (domain: arri.de, ip: 40.107.20.130, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFkI5CVb6ik3fmD+J+TAtmeCMrvSJ09YaSYKhDgh4YZhbt+qOqkZ0+rxdt+R07QvQn9cdc70qyh6Dgwf+XVAShP+1Y2bKg7fk5jFqMIP2wk1bMdmOAHh31ss4T3Fv0eb2MRQKR6ngV8I9Z8nLC9VMph8U2Cov0CdaHTOvnCCelhXVXlfpA155oKxE5OtN9+O2C3Ugpx/JSqfWu5/So1iy8RcJBylq45S5DfNIlNoj3bBxkeO/Yrp957o+FO81xvGv5ZDffE0YkD9AlYX7kPSqycqZUBPcgVTNsrgfS4ZLEaA2SG1S0TzUnSbd7Bg9XxMDJA6ik7DaDKcErpURlRvtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EU01FD+/4ngv7DOcmwO6SvtOMm4vtfI09lNntCIh9+s=;
 b=lDazRnpqCneCxgvhYcaKB1UitGoR4nHMytYlZXn2sXToriiLAv/ZfCeQxh3pZoCMvlDzdQn3Pe28ZLVoXmHFzZvx/85NUFRS3PFVe1ZMigNSSB3X86UfzoZr9QSuIpQDCnpT1zOjf3e4m9F/JAZPoDdQL9rDUBx9hhgeJKsTfAU4y4tirIArDNvKmD3pQtIfGZ6i7gHb/ext3B+O6yxaPSlpiIvMK+D3zSyAxCEVj+vAgK1+fpPP60QAykliq+LDz3SLRvDUeuQlFTcMRpUFdWOo7t5dhTyNGXC48/yXWUdm21fQX9r9QfANsHre9ERtmpel8ND/o2RxkvtCWZMm2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 52.169.0.179) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=bestguesspass action=none header.from=arri.de; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EU01FD+/4ngv7DOcmwO6SvtOMm4vtfI09lNntCIh9+s=;
 b=edWWKQr64scVvKsUCR+N2XFpLt5CCpsvbtvLHEicuZz0D71BHHPPeiJbuj/J1y7wPJMDH4tIV4qPMZlbBFkx/AdvAs4K4Vmwwv3Fi4KDyRnU5EI+u8XwLltcMg7KOtyMjjH28KI6RZZ0Iu1O2dckBkea6hQoBlVNfZIMtiIUEUU=
Received: from AM6P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::33)
 by VI1PR07MB4141.eurprd07.prod.outlook.com (2603:10a6:803:32::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.9; Thu, 10 Feb
 2022 10:28:32 +0000
Received: from VE1EUR02FT051.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::d5) by AM6P192CA0020.outlook.office365.com
 (2603:10a6:209:83::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14 via Frontend
 Transport; Thu, 10 Feb 2022 10:28:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 52.169.0.179)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=arri.de;
Received-SPF: Pass (protection.outlook.com: domain of arri.de designates
 52.169.0.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.169.0.179; helo=eu2.smtp.exclaimer.net;
Received: from eu2.smtp.exclaimer.net (52.169.0.179) by
 VE1EUR02FT051.mail.protection.outlook.com (10.152.13.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 10:28:31 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (104.47.2.52) by
	 eu2.smtp.exclaimer.net (52.169.0.179) with Exclaimer Signature Manager
	 ESMTP Proxy eu2.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Thu, 10 Feb 2022 10:28:31 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 9432748
X-ExclaimerImprintLatency: 3896245
X-ExclaimerImprintAction: 6778043129784ee6bbb84efed918c906
Content-Type: multipart/related;
	boundary="----_=_NextPart_7c371925-f2d9-4684-9403-f917c02644b1"
Received: from AS8PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:20b:311::29)
 by DBBPR07MB7658.eurprd07.prod.outlook.com (2603:10a6:10:1e4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.6; Thu, 10 Feb
 2022 10:28:30 +0000
Received: from HE1EUR02FT037.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::98) by AS8PR05CA0024.outlook.office365.com
 (2603:10a6:20b:311::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Thu, 10 Feb 2022 10:28:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 HE1EUR02FT037.mail.protection.outlook.com (10.152.10.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 10:28:29 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Thu, 10 Feb
 2022 11:28:28 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Thu, 10 Feb 2022 11:28:28 +0100
Received: from localhost.de (192.168.54.166) by mta.arri.de (192.168.100.104)
 with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 10 Feb 2022 11:28:28
 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [PATCH] sdk: fix search for dynamic loader
Date: Thu, 10 Feb 2022 11:28:10 +0100
Message-ID: <20220210102810.15680-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [192.168.54.166]
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 029621ba-8719-4163-f815-08d9ec8015d0
X-MS-TrafficTypeDiagnostic: 
	DBBPR07MB7658:EE_|VE1EUR02FT051:EE_|VI1PR07MB4141:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR07MB41418C4F7F0F60506961C080BF2F9@VI1PR07MB4141.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ayK2JmZ2yNMkSjycM6IsxzK6pfdZSrFV4vQY7nMxTWY5DvvrovO8bcQahy0BCx0HHctf6y9AMZaqdD/tNmmYNejnMj2lIaGm7DXV5/SC7uXxqz0GeqtFKBCVO3wfnVN1epwVidWMhwDIv6SxyEL14CeVHclwWP2p0daXC1VLOZkC8FBsh8TdxcUWv1MRaAyDm52BT+XneNLFlGb0NoX8fs/VXi1iweIzua47VW6n6AS08ux+xZZunPiLHDc5bTGcumca2uk/R0oeFWIRMXBfGYP6bA5wVUly5Y+JU/8nAfyu5bKvq4/9mnRLq+S5k4+nrHJDzktFnk/xw7qCAuVatEaj0exAwUtS7rbjk8duJzZL9UtlcCaT6+a3Tb1x1KmXzXEzUseoLlNBN3z/LIcvucutNziIl4U1MPzmmlC1XdwQnKoJlbRlouv5VTesPX23bpEkVC8oe8u5uGKVdN7iGriVxosDiZb22Ci/hJNorWD40Qam8U5SN6Mi4Sdf1eS7lUKAuxgeXHyu8+iRKQ5CvxI0+wU8ONg16npjb1bmVhBVt7HNlL//i1g40jE2GHOh1ZFL10rQeDa+VOzGL3O29lBiLrI+qlDZjxohIjVxw0b7Qb4qmJxMFRFFjFNuD9b8RgUY9R7WN6gf1BU/CW1+6APYYAEqmcNdNArFbBzUutyOba82VWOjNR3Df6Q9gWY4cB8e8x6UQ0R2cm7Ky/BREg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(36756003)(1076003)(26005)(426003)(2906002)(2616005)(336012)(83380400001)(107886003)(16526019)(186003)(36860700001)(82310400004)(6916009)(8676002)(4326008)(70586007)(6666004)(508600001)(86362001)(8936002)(47076005)(81166007)(316002)(40460700003)(5660300002)(356005)(70206006)(36900700001);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR07MB7658
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR02FT051.eop-EUR02.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	806f2f7a-8c49-4f13-b253-08d9ec80147e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YlACrpb0rk3Txm2dhzYemkcU6EG+2zu2Yfu8rCw718MpjT8gG8H5KcrXlOkaJIXzjBRhvCrnoEJgkcukclcVi69VoAK67Buj//OPJFxnUFFhw/aisZmiTs1RcFQ6p0bO00AKFtrwgNflzlLRuHt1SKWyUxLrSGSyjZLBxojaEWk08spZSF5cUQMLSOCShOecUB7VIM2l+iQoDZU6sWbKW2pZnpoe4Hhjml4CgkPP8aZw1wHWFEoOql9pTadHDXG3CH4AmkcEO5E3nXiiM00Vd30dUbWUSNXEAuargH+M+JSZcnnQm/3T8MDWaREpqm8JDYsU/jCF8C6/MxyzO3WGHplckJ0Xr1MYNGIDYIwe1ukTHfYdH0TuB52YM1SWB0ki03zXksOchyjc5cCWfxGtniP64vHw6TE9IvkNKaXeGgdKt+/1r6iD5Iu5VmnwnG35FzneglFcOKUBHS2y4tODPOriXf0nvnVjQoLyQJyiysI99Yvj5Nu8dOPQzkN4+divWM9dSlLHabgryjwgvjFFk/OEy5s4lQsDk82KRX54CNxzFnoCPaqn2byjWe3NGn9uM6AC2XtvVheGW10mfmcIPe6fGMAjfpnhBMQlqJ4/VxABH+3E6wNdAIL6+D+6494GNW85kQdU6y/3pWXxiIGs4FUD7ZaSesohDlq5wIM2OHV3nw3gmpafnXvunzDJCAM+ff2eUcPoQB09F8Rlc/IOQeIaUCwI2aVSswhOJpKhKi4naABeaIKXAIwwa6Z1FTmMRXVcHhgZL9uq8w5rukwDK6iJvrvKRv+F2YleoX2YT0k=
X-Forefront-Antispam-Report: 
	CIP:52.169.0.179;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu2.smtp.exclaimer.net;PTR:eu2.smtp.exclaimer.net;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(2616005)(70586007)(107886003)(7596003)(7636003)(6666004)(47076005)(36756003)(6916009)(70206006)(66574015)(508600001)(15974865002)(7066003)(8936002)(26005)(86362001)(83380400001)(336012)(426003)(36860700001)(40460700003)(166002)(1076003)(16526019)(186003)(316002)(4326008)(2906002)(5660300002)(33964004)(82310400004)(8676002);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 10:28:31.0495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 029621ba-8719-4163-f815-08d9ec8015d0
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[52.169.0.179];Helo=[eu2.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT051.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB4141
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 10:28:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161604

This is a multi-part message in MIME format.

------_=_NextPart_7c371925-f2d9-4684-9403-f917c02644b1
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_c988e90b-7b29-4d39-a2a3-693531b5cad3"

------_=_NextPart_c988e90b-7b29-4d39-a2a3-693531b5cad3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

if the package "nativesdk-glibc-dbg" is installed as part of the SDK,
the existing search expression finds two files:

$OECORE_NATIVE_SYSROOT/lib/.debug/ld-linux-x86-64.so.2
$OECORE_NATIVE_SYSROOT/lib/ld-linux-x86-64.so.2

The generated relocate_sdk.sh shell script contains then an extra
newline and segfaults during SDK relocation.

Limit the search depth to 1, to avoid finding the file in the .debug
directory.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
I ran into this problem at first on honister (as previous releases seem
not to include nativesdk-glibc-dbg automatically, e.g. due to "dbg-pkgs"
in SDKIMAGE_FEATURES). But I think that this patch may also be relevant
hardknott and dunfell.

 meta/files/toolchain-shar-relocate.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-s=
har-relocate.sh
index 3ece04db0a4a..cee9adbf399c 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -5,7 +5,7 @@ fi
 
 # fix dynamic loader paths in all ELF SDK binaries
 native_sysroot=3D$($SUDO_EXEC cat $env_setup_script |grep 'OECORE_NATIVE_S=
YSROOT=3D'|cut -d'=3D' -f2|tr -d '"')
-dl_path=3D$($SUDO_EXEC find $native_sysroot/lib -name "ld-linux*")
+dl_path=3D$($SUDO_EXEC find $native_sysroot/lib -maxdepth 1 -name "ld-linu=
x*")
 if [ "$dl_path" =3D "" ] ; then
 	echo "SDK could not be set up. Relocate script unable to find ld-linux.so=
=2E Abort!"
 	exit 1
-- 
Christian Eggers
Embedded software developer

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregisternum=
mer: HRA 57918
Persoenlich haftender Gesellschafter: Arnold & Richter Cine Technik GmbH
Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregisternum=
mer: HRB 54477
Geschaeftsfuehrer: Dr. Michael Neuhaeuser; Stephan Schenk; Walter Trauninge=
r; Markus Zeiler


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

------_=_NextPart_c988e90b-7b29-4d39-a2a3-693531b5cad3
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8" /></head><body><div>if the package &quot;nativesdk-glibc-dbg&quot=
; is installed as part of the SDK,<br />the existing search expression find=
s two files:<br /><br />$OECORE_NATIVE_SYSROOT/lib/.debug/ld-linux-x86-64.s=
o.2<br />$OECORE_NATIVE_SYSROOT/lib/ld-linux-x86-64.so.2<br /><br />The gen=
erated relocate_sdk.sh shell script contains then an extra<br />newline and=
 segfaults during SDK relocation.<br /><br />Limit the search depth to 1, t=
o avoid finding the file in the .debug<br />directory.<br /><br />Signed-of=
f-by: Christian Eggers &lt;ceggers@arri.de&gt;<br />---<br />I ran into thi=
s problem at first on honister (as previous releases seem<br />not to inclu=
de nativesdk-glibc-dbg automatically, e.g. due to &quot;dbg-pkgs&quot;<br /=
>in SDKIMAGE_FEATURES). But I think that this patch may also be relevant<br=
 />hardknott and dunfell.<br /><br /> meta/files/toolchain-shar-relocate.sh=
 | 2 +-<br /> 1 file changed, 1 insertion(+), 1 deletion(-)<br /><br />diff=
 --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-=
relocate.sh<br />index 3ece04db0a4a..cee9adbf399c 100644<br />--- a/meta/fi=
les/toolchain-shar-relocate.sh<br />+++ b/meta/files/toolchain-shar-relocat=
e.sh<br />@@ -5,7 +5,7 @@ fi<br /> <br /> # fix dynamic loader paths in all=
 ELF SDK binaries<br /> native_sysroot=3D$($SUDO_EXEC cat $env_setup_script=
 |grep &#39;OECORE_NATIVE_SYSROOT=3D&#39;|cut -d&#39;=3D&#39; -f2|tr -d &#3=
9;&quot;&#39;)<br />-dl_path=3D$($SUDO_EXEC find $native_sysroot/lib -name =
&quot;ld-linux*&quot;)<br />+dl_path=3D$($SUDO_EXEC find $native_sysroot/li=
b -maxdepth 1 -name &quot;ld-linux*&quot;)<br /> if [ &quot;$dl_path&quot; =
=3D &quot;&quot; ] ; then<br /> 	echo &quot;SDK could not be set up. Reloca=
te script unable to find ld-linux.so. Abort!&quot;<br /> 	exit 1<br />-- <b=
r />Christian Eggers<br />Embedded software developer<br /><br />Arnold &am=
p; Richter Cine Technik GmbH &amp; Co. Betriebs KG<br />Sitz: Muenchen - Re=
gistergericht: Amtsgericht Muenchen - Handelsregisternummer: HRA 57918<br /=
>Persoenlich haftender Gesellschafter: Arnold &amp; Richter Cine Technik Gm=
bH<br />Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsreg=
isternummer: HRB 54477<br />Geschaeftsfuehrer: Dr. Michael Neuhaeuser; Step=
han Schenk; Walter Trauninger; Markus Zeiler<br /><br /></div><div dir=3D"l=
tr" style=3D"mso-line-height-rule:exactly;-webkit-text-size-adjust:100%;dir=
ection:ltr;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=
=3D"width:100%;"><tr style=3D"font-size:0;"><td align=3D"left" style=3D"ver=
tical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" s=
tyle=3D"font-size:0;"><tr style=3D"font-size:0;"><td align=3D"left" style=
=3D"padding:0;vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"=
0" border=3D"0" style=3D"width:100%;font-size:0;"><tr style=3D"font-size:14=
=2E67px;color:#7F7F7F;font-style:normal;font-weight:400;white-space:nowrap;=
"><td align=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,=
sans-serif;">_______________________________________________________<span s=
tyle=3D"font-family:remialcxesans;font-size:1px;color:#FFFFFF;line-height:1=
px;">&#8203;</span></td></tr><tr style=3D"font-size:0;"><td align=3D"left" =
style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" bo=
rder=3D"0" style=3D"font-size:0;"><tr style=3D"font-size:0;"><td align=3D"l=
eft" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"=
0" border=3D"0" style=3D"font-size:0;color:#7F7F7F;font-style:normal;font-w=
eight:400;white-space:nowrap;"><tr style=3D"font-size:14.67px;"><td align=
=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;=
">Christian</td><td align=3D"left" style=3D"vertical-align:top;color:#00000=
1;font-family:Calibri,Arial,sans-serif;">&nbsp;<br /></td><td align=3D"left=
" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;">Eggers=
</td></tr></table></td></tr><tr style=3D"font-size:0;"><td align=3D"left" s=
tyle=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" bor=
der=3D"0" style=3D"font-size:0;color:#7F7F7F;font-style:normal;font-weight:=
400;white-space:nowrap;"><tr style=3D"font-size:14.67px;"><td align=3D"left=
" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;">Softwa=
re&nbsp;Engineer</td></tr><tr style=3D"font-size:14.67px;color:#000001;"><t=
d align=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,sans=
-serif;">&#8203;</td></tr></table></td></tr></table></td></tr><tr style=3D"=
font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellp=
adding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;"><tr styl=
e=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table =
cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color=
:#0E50AD;font-style:normal;font-weight:400;white-space:nowrap;"><tr style=
=3D"font-size:13.33px;"><td align=3D"left" style=3D"vertical-align:top;font=
-family:&#39;Arial Black&#39;;">ARRI</td></tr><tr style=3D"font-size:10.67p=
x;color:#7F7F7F;"><td align=3D"left" style=3D"vertical-align:top;font-famil=
y:Arial;"><span style=3D"font-size:11px;">Arnold&nbsp;&amp;&nbsp;Richter&nb=
sp;Cine&nbsp;Technik&nbsp;GmbH&nbsp;&amp;&nbsp;Co.&nbsp;Betriebs&nbsp;KG</s=
pan>&nbsp;<br /></td></tr></table></td></tr><tr style=3D"font-size:0;"><td =
align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" cells=
pacing=3D"0" border=3D"0" style=3D"font-size:0;color:#7F7F7F;font-style:nor=
mal;font-weight:400;white-space:nowrap;"><tr style=3D"font-size:10.67px;"><=
td align=3D"left" style=3D"vertical-align:top;font-family:Arial;">Arriweg&n=
bsp;17</td><td align=3D"left" style=3D"vertical-align:top;font-family:Arial=
;">,&nbsp;<br /></td><td align=3D"left" style=3D"vertical-align:middle;font=
-family:Arial;">83071</td><td align=3D"left" style=3D"vertical-align:middle=
;font-family:Arial;">&nbsp;<br /></td><td align=3D"left" style=3D"vertical-=
align:middle;font-family:Arial;">Stephanskirchen</td></tr></table></td></tr=
></table></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"v=
ertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0"=
 style=3D"font-size:0;"><tr style=3D"font-size:0;"><td align=3D"left" style=
=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=
=3D"0" style=3D"font-size:0;color:#1532B9;font-style:normal;font-weight:400=
;white-space:nowrap;"><tr style=3D"font-size:11px;"><td align=3D"left" styl=
e=3D"vertical-align:top;font-family:Arial;"><span style=3D"text-decoration:=
underline;"><a href=3D"http://www.arri.com/" target=3D"_blank" id=3D"LPlnk6=
89713" style=3D"text-decoration:underline;color:#1532B9;"><strong style=3D"=
font-weight:400;">www.arri.com&nbsp;<br /><br /></strong></a></span></td></=
tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:to=
p;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-s=
ize:0;color:#858080;font-style:normal;font-weight:400;line-height:normal;wh=
ite-space:nowrap;"><tr style=3D"font-size:14.67px;"><td align=3D"left" styl=
e=3D"padding:0;vertical-align:top;font-size:0;"><img src=3D"cid:image539368=
=2Epng@36BFA51C.3BD44798" width=3D"20" border=3D"0" alt=3D"" style=3D"width=
:20px;min-width:20px;max-width:20px;font-size:0;" /></td><td align=3D"left"=
 style=3D"padding:0;vertical-align:top;font-family:Calibri,Arial,sans-serif=
;"><a href=3D"tel:+49%208036%203009-3118" target=3D"_blank" id=3D"LPlnk6897=
13" style=3D"text-decoration:none;color:#858080;"><strong style=3D"font-wei=
ght:400;">+49&nbsp;8036&nbsp;3009-3118</strong></a></td></tr><tr style=3D"f=
ont-size:0;"><td align=3D"left" style=3D"padding:0;vertical-align:top;"></t=
d><td align=3D"left" style=3D"padding:0;vertical-align:top;"></td></tr><tr =
style=3D"font-size:0;"><td align=3D"left" style=3D"padding:0;vertical-align=
:top;"></td><td align=3D"left" style=3D"padding:0;vertical-align:top;"></td=
></tr><tr style=3D"font-size:14.67px;"><td align=3D"left" style=3D"padding:=
0;vertical-align:top;font-size:0;"><img src=3D"cid:image378171.png@9BDAE7DE=
=2E5541857E" width=3D"20" border=3D"0" alt=3D"" style=3D"width:20px;min-wid=
th:20px;max-width:20px;font-size:0;" /></td><td align=3D"left" style=3D"pad=
ding:0;vertical-align:top;font-family:Calibri,Arial,sans-serif;"><a href=
=3D"mailto:CEggers@arri.de" target=3D"_blank" id=3D"LPlnk689713" style=3D"t=
ext-decoration:none;color:#858080;"><strong style=3D"font-weight:400;">CEgg=
ers@arri.de</strong></a></td></tr></table></td></tr></table></td></tr></tab=
le></td></tr><tr style=3D"font-size:14.67px;color:#000001;font-style:normal=
;font-weight:400;white-space:nowrap;"><td align=3D"left" style=3D"vertical-=
align:top;font-family:Calibri,Arial,sans-serif;"><br />&#8203;</td></tr></t=
able></td></tr><tr style=3D"font-size:0;line-height:normal;"><td align=3D"l=
eft" style=3D"padding:0;vertical-align:top;"><a href=3D"https://www.arri.co=
m/en/lighting/led/orbiter-accessories/orbiter-dockingring/" target=3D"_blan=
k" id=3D"LPlnk689713" style=3D"text-decoration:none;"><img src=3D"https://a=
ssets.arri.com/media/sign/2022_Orbiter_Docking-Ring_E-mail-Signature_650x95=
=2Ejpg" border=3D"0" title=3D"Orbiter Docking Ring" alt=3D"Orbiter Docking =
Ring" style=3D"font-size:12px;" /></a></td></tr><tr style=3D"font-size:13px=
;color:#7F7F7F;font-style:normal;font-weight:400;white-space:nowrap;"><td a=
lign=3D"left" style=3D"padding:0;vertical-align:top;font-family:Calibri,Ari=
al,sans-serif;">Get&nbsp;all&nbsp;the&nbsp;latest&nbsp;information&nbsp;fro=
m&nbsp;<span style=3D"text-decoration:underline;"><a href=3D"http://www.arr=
i.com/" target=3D"_blank" id=3D"LPlnk689713" title=3D"www.arri.com" style=
=3D"text-decoration:underline;color:#7F7F7F;"><strong style=3D"font-weight:=
400;">www.arri.com</strong></a></span>,&nbsp;<span style=3D"text-decoration=
:underline;"><a href=3D"https://www.facebook.com/TeamARRI" target=3D"_blank=
" id=3D"LPlnk689713" style=3D"text-decoration:underline;color:#7F7F7F;"><st=
rong style=3D"font-weight:400;">Facebook</strong></a></span>,&nbsp;<span st=
yle=3D"text-decoration:underline;"><a href=3D"https://twitter.com/ARRIChann=
el" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:underline=
;color:#7F7F7F;"><strong style=3D"font-weight:400;">Twitter</strong></a></s=
pan>,&nbsp;<span style=3D"text-decoration:underline;"><a href=3D"http://ins=
tagram.com/arri" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decorat=
ion:underline;color:#7F7F7F;"><strong style=3D"font-weight:400;">Instagram<=
/strong></a></span>&nbsp;and&nbsp;<span style=3D"text-decoration:underline;=
"><a href=3D"http://www.youtube.com/user/ARRIChannel" target=3D"_blank" id=
=3D"LPlnk689713" style=3D"text-decoration:underline;color:#7F7F7F;"><strong=
 style=3D"font-weight:400;">YouTube</strong></a></span>.<br /></td></tr><tr=
 style=3D"font-size:0;"><td align=3D"left" style=3D"padding:0;vertical-alig=
n:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"fo=
nt-size:0;color:#6A6A6A;font-style:normal;font-weight:400;white-space:nowra=
p;"><tr style=3D"font-size:10px;"><td align=3D"left" style=3D"vertical-alig=
n:top;font-family:Arial;"><br />Arnold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&nb=
sp;Technik&nbsp;GmbH&nbsp;&amp;&nbsp;Co.&nbsp;Betriebs&nbsp;KG<br />Sitz:&n=
bsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Registergericht:&nbsp;Amtsgericht&nbsp=
;M&#252;nchen&nbsp;=E2=80=91&nbsp;Handelsregisternummer:&nbsp;HRA&nbsp;5791=
8<br />Pers&#246;nlich&nbsp;haftender&nbsp;Gesellschafter:&nbsp;Arnold&nbsp=
;&amp;&nbsp;Richter&nbsp;Cine&nbsp;Technik&nbsp;GmbH<br />Sitz:&nbsp;M&#252=
;nchen&nbsp;=E2=80=91&nbsp;Registergericht:&nbsp;Amtsgericht&nbsp;M&#252;nc=
hen&nbsp;=E2=80=91&nbsp;Handelsregisternummer:&nbsp;HRB&nbsp;54477<br />Ges=
ch&#228;ftsf&#252;hrer:&nbsp;Dr.&nbsp;Michael&nbsp;Neuh&#228;user;&nbsp;Ste=
phan&nbsp;Schenk;&nbsp;Walter&nbsp;Trauninger;&nbsp;Markus&nbsp;Zeiler<br /=
></td></tr><tr style=3D"font-size:14.67px;color:#000001;"><td align=3D"left=
" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;"><br />=
&#8203;<br /></td></tr></table></td></tr></table></td></tr></table></div></=
body></html>
------_=_NextPart_c988e90b-7b29-4d39-a2a3-693531b5cad3--

------_=_NextPart_7c371925-f2d9-4684-9403-f917c02644b1
Content-Type: image/png;
	name="image539368.png"
Content-Transfer-Encoding: base64
Content-ID: <image539368.png@36BFA51C.3BD44798>
Content-Description: image539368.png
Content-Disposition: inline;
	creation-date="Thu, 10 Feb 2022 10:28:31 +0000";
	filename=image539368.png;
	modification-date="Thu, 10 Feb 2022 10:28:31 +0000";
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

------_=_NextPart_7c371925-f2d9-4684-9403-f917c02644b1
Content-Type: image/png;
	name="image378171.png"
Content-Transfer-Encoding: base64
Content-ID: <image378171.png@9BDAE7DE.5541857E>
Content-Description: image378171.png
Content-Disposition: inline;
	creation-date="Thu, 10 Feb 2022 10:28:31 +0000";
	filename=image378171.png;
	modification-date="Thu, 10 Feb 2022 10:28:31 +0000";
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

------_=_NextPart_7c371925-f2d9-4684-9403-f917c02644b1--

