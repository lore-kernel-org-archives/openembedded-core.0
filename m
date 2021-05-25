Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.42])
 by mx.groups.io with SMTP id smtpd.web08.8906.1621944823570926068
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 05:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=fNFRhDhU;
 spf=pass (domain: kpit.com, ip: 40.107.138.42, mailfrom: nisha.parrakat@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mwqCEIQYzeGh50magd03KWkBvaRLXoT6BgPGBCHw7hu8VI34eAWUpKmvTxZsNcEM1qOoAc5W8T7Fgb8MHANU/IVlBq5+AHVJ88pEtRo0XJfb82y3YaTD9qx8/pILlWBOqcqdsrDikKEkL+pjFtNIVZO0+QfG7HzNkBz/5SyuXeQzaIFP/wW0xWZRPHHN2SBkbcbahKlFPvvgCykSH51nQ2qA/darIoRm1L3PwQNEpY4ufCJMIHYhUChd8b9c0+LxOTu+l6I4YGWx9dLr5y0fwWMY1giAA4srcI1iuOraIjVw/1b6dhBJ8yIHDYvH3ScRrTRf6dYfxLc+1WiZAjgC6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pctp45vmv7KzpS0vCjNfg+NaJkfCkkVLU/XHqKJVZRQ=;
 b=NUFnbuh0ijNdnvEQGwo0rOhZC/Ru1MZtYINSDbc9xSLmGfFX+Om3/3G8soBnIqL+C9c4OUL3XAb1MTRdXTMMrBSk9wqzvflEz2+djC9iYUd7b1ksc4/Z8fbw5FZ06etdhEyFY8iEjNbOFw41FaY5hiFY7PcBFLjstj+8CdwGQuHpxs3oS5BqHxG3mKrXB/OY514g4560FdbLr6UYOQIV6OvY8KpI/GdjBG91PlqqCPRDHnD5vpc/erfdmA+9LtYcA9VXSRPoTM4FworUOO8OsTYaONW1fOeDijJwPoXsphubkcJBPjB3IycZS24jnM7jsP4tkdtebrK6WEikD57Y1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pctp45vmv7KzpS0vCjNfg+NaJkfCkkVLU/XHqKJVZRQ=;
 b=fNFRhDhUu4RE+AubhtjvuKPESDDQI/JHQXY138VLsDVqLAfqJ4WBYoac0bTpVc3UgHKy86LDHuVzgKykNyfYHLksKADLqbXz5sakNDqEm2Id3xftWKBWMRVIXxPFvSmO9XLse8P8V/HhC+TyQO6UydZwC5rANeTaeSwW352bXJ4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:36::6)
 by PN0PR01MB5059.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:43::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Tue, 25 May
 2021 12:13:33 +0000
Received: from PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8d5b:7904:5e3b:7167]) by PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8d5b:7904:5e3b:7167%3]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 12:13:33 +0000
From: "Nisha Parrakat" <Nisha.Parrakat@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com
Subject: [meta-oe][master][PATCH 1/2] p7zip: build and package lib7z.so needed for fastboot
Date: Tue, 25 May 2021 12:13:09 +0000
Message-Id: <20210525121310.28169-1-Nisha.Parrakat@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2003:c0:f3b:b062:3a22:e2ff:fe1a:a816]
X-ClientProxiedBy: PR3P251CA0004.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::16) To PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:36::6)
Return-Path: Nisha.Parrakat@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from bsys_traas.speedport.ip (2003:c0:f3b:b062:3a22:e2ff:fe1a:a816) by PR3P251CA0004.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Tue, 25 May 2021 12:13:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57dd7098-1ea1-4a8f-f7e4-08d91f76841f
X-MS-TrafficTypeDiagnostic: PN0PR01MB5059:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN0PR01MB5059A4523BC1EED8F35F0717EE259@PN0PR01MB5059.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QORAK9OhRmfdZ2tH57NbPpIqiYmZclFC7zMiqJ/5UaVsoPlBg5qsGqp+xJyMtgFey83lULt9F/i1XJSjR175OEA1HSn8iEswPSTuNCUaTv9aW0OIovx4p5sYrCff6PT6m0XYYBENBUTraQuZeJe28dKaFpQHT38kDd63EFFHlgCS1ksO8vZ6CvC2S34LpObCZQ2VGx6SM99b0cuVKsvprsgMOshfM1iYt0Y1jOgy0xiAy1/nOtYbLyP/JUkO8mZaB3dT+js60H+3IOvkmJsfuYt4hdjEf8FAjLKD9ZietMchdMItJ7hNk+giOpUIokoc9WSgZ1nhMO54uwaf08DTu75opcN6unj2G4F/0C6PN364vhE4CoofMXo9ZTmrOkuyWPC2/Y+pAYSdHRo74iHe8FIoXMsDoJxJ0VhcpzJQGzkmeSjSOeVUOYdZlGg02kO5szkBMkah9Hqbhp/7he9B6Hzjm5DSQi7le04M7LQt7rqtg/VnLI50Xlvf+iR4TiLOlxdec+cKNbAABjw+5ph6BFfVgRsYKSCyxcHr0/1C+dPTlR6jx4ga2DyH+31bmzly2UOEJjA8pHF8OM0139K11cg+PzOQUOL4T+39tj14mImP+l/3hFzg8HI0pMRYALntebDhcd5b+kmaNr3ZDuXshU/Eeutgk3reZ08vBgP/HWdlkkCpbKwSyG97M0XDJO3bB4Ob6iRwV/zflilfJpyA0xGMAsispeE5BiawwGpUFT4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(136003)(346002)(396003)(376002)(6486002)(478600001)(316002)(38100700002)(4326008)(19627235002)(107886003)(16526019)(66574015)(2616005)(6666004)(186003)(1076003)(2906002)(66946007)(8676002)(8936002)(6506007)(36756003)(6512007)(66476007)(5660300002)(86362001)(66556008)(52116002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?w4ZWfljJkEjnrB23BunbSGGej5VlyQsIYvj7eOgfpmIxH31+T9KvpbnWXyHK?=
 =?us-ascii?Q?jVanfBKK0Mr8MlZbUPgoPBF8Dm3PVUInH5rjSLdjv25T7RU51PZ5ouWCFopA?=
 =?us-ascii?Q?z0qp0LVsmTcvr4Fi+NhepOjKrfjeZUuE1AC+2UsuROl5PgFy/WPaFGQvslc2?=
 =?us-ascii?Q?dJ5v6ACBMx4gWcNK//pljRGnRMUJj7ZqgWiJOIi+ZLqCFC9kWBojna0oR412?=
 =?us-ascii?Q?oHNLuRv7kjioOwy2gxDn4DSlEsAnsmasBYupHWW6P8E1KEGeSaQusGeM5UQf?=
 =?us-ascii?Q?hv3sNPkCrQ69x8H0ka5rOIdlKYvrVNgMVow5QRcOkFXHmv7JeJmLi6Wy0up4?=
 =?us-ascii?Q?He0kbnBm4Pg8zeCuxaBbQnK7X32O+6M5N+/jCl7OCZcAfnnpJWl52iZTLuBt?=
 =?us-ascii?Q?S2WyRHuarTH51mfK/QGr+lrEv2Fen3N8ReV49GECyTbUxXyBc/3GvcSEIGgQ?=
 =?us-ascii?Q?xWztfNmnUy0LUpZ/ydW9BNxPFAaGqN0u19ytFz+GkK3tYXGs+A/IpeOuI0xH?=
 =?us-ascii?Q?iTUb4eJfxkknpqfpesCgRiDHZdQZEdfLXODwvQTlC/0JOkN7qbjdO5XFKWeb?=
 =?us-ascii?Q?3bIlnw25Lf00OFkoSyfg5clH6CUI4SkClkFiasmtVn9WjuhO+9xlJNMiTXmm?=
 =?us-ascii?Q?zbefwzjSCHcICVhHQTGLtIayyLxRkGm19vjaSYNcUsOPmZP7KO9U9QEchIWs?=
 =?us-ascii?Q?HB6dLjluhPOqa/zHgw4O8pXtu6M+I5r6LqSjhoSJn94NqmzRWXsVMaO0TD+/?=
 =?us-ascii?Q?0SqKAcp+epbf1bbLiM4elX7FblopQQySfDBlKsrIganKvnlTNIZiXGDY9fRh?=
 =?us-ascii?Q?rDUm10GV5+lIWOyhpUpuTYg1bwdYAq+3Yzm4zYMsvL2YfKv1mXJ5OshBdvTc?=
 =?us-ascii?Q?Chv+p21p+wGKSF/xtea31KXxeJmTciaXI6SjAWCa5UWm5xMRTDTVAzWxC8Ge?=
 =?us-ascii?Q?8r/uq4OAvSWms2aZJSIduCCNFnmiw60VrDH9/9nyIpqnTBMoLSEASlTSrHPC?=
 =?us-ascii?Q?8XKqusR7SFhhgLYeOf6CP3Rq4O0ZcORpXT9u63tQT3+KqfbNdjKAi5GupgWq?=
 =?us-ascii?Q?Bw4xdmfG+9JzobNrCKccUx4TkPv6LA1AqFPKjOutSaMmXMzwrXkhgnRFRSwC?=
 =?us-ascii?Q?0fplf/QkCadh9Xd3HCblZss6B8JuCmPmRRNPV7bupTI3+JF+3BVDngc4X+fq?=
 =?us-ascii?Q?2OENx/uuvcRGfEh2oc2H4dLYBjzC70D4CbckjbGKxp7fGeOiKVwhjyWNvdTX?=
 =?us-ascii?Q?WPb4nEwmyT4Ib7vBXED+w3nck4aaV1KJ+3f6ePXf2xfH+20tv6+vYq2FsZlr?=
 =?us-ascii?Q?RYTFzOvA7qGteHbV8nzUhSmTFuJTqlDR8Xon6yCLGEBQX7SNUlfSLiowlz67?=
 =?us-ascii?Q?k5i7g2h2sHdkurY6DIW3t21yNGj4?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57dd7098-1ea1-4a8f-f7e4-08d91f76841f
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 12:13:33.5056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOPXBVsWaF2GQSQRa6bvQ209ZGiMV0Mzl5ZI2Yl8r7Wr+iMbNB4qPg0LbPE30MwI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB5059
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Nisha Parrakat <nisha.parrakat@kpit.com>

a) use option 7z to build the lib7z.so library
This is needed for android-tools for building fastboot
from android-tools

b) Packaged the lib7z.so and codec libraries as a part of this recipe
Fastboot RDepends on it lib7z.so

c) Fixed a C++17 forbidden error when lib7z.so is built

fixes the below error

| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member function 'virt=
ual LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARIANT*)=
':
| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error: use of an =
operand of type 'bool' in 'operator++' is forbidden in C++17
|   308 |           numMethods++;
|       |           ^~~~~~~~~~
| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error: use of an o=
perand of type 'bool' in 'operator++' is forbidden in C++17
|   318 |         numMethods++;

Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
---
 ...nge_numMethods_from_bool_to_unsigned.patch | 25 +++++++++++++++++++
 meta-oe/recipes-extended/p7zip/p7zip_16.02.bb | 21 ++++++++++++++--
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/p7zip/files/change_numMethods_=
from_bool_to_unsigned.patch

diff --git a/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bo=
ol_to_unsigned.patch b/meta-oe/recipes-extended/p7zip/files/change_numMetho=
ds_from_bool_to_unsigned.patch
new file mode 100644
index 000000000..edde52593
--- /dev/null
+++ b/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_u=
nsigned.patch
@@ -0,0 +1,25 @@
+fixes the below error
+
+| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member function 'vir=
tual LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARIANT*=
)':
+| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error: use of an=
 operand of type 'bool' in 'operator++' is forbidden in C++17
+|   308 |           numMethods++;
+|       |           ^~~~~~~~~~
+| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error: use of an =
operand of type 'bool' in 'operator++' is forbidden in C++17
+|   318 |         numMethods++;
+
+
+use unsigned instead of bool
+Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
+
+Upstream-Status: Pending
+--- ./CPP/7zip/Archive/Wim/WimHandler.cpp       2021-05-20 10:51:56.997402=
701 +0000
++++ ./CPP/7zip/Archive/Wim/WimHandler.cpp       2021-05-20 10:52:16.665604=
125 +0000
+@@ -298,7 +298,7 @@
+
+       AString res;
+
+-      bool numMethods =3D 0;
++      unsigned numMethods =3D 0;
+       for (unsigned i =3D 0; i < ARRAY_SIZE(k_Methods); i++)
+       {
+         if (methodMask & ((UInt32)1 << i
diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/recipe=
s-extended/p7zip/p7zip_16.02.bb
index 13479a90f..ada49114c 100644
--- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
+++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
@@ -9,6 +9,7 @@ SRC_URI =3D "http://downloads.sourceforge.net/p7zip/p7zip/$=
{PV}/p7zip_${PV}_src_al
            file://do_not_override_compiler_and_do_not_strip.patch \
            file://CVE-2017-17969.patch \
            file://0001-Fix-narrowing-errors-Wc-11-narrowing.patch \
+           file://change_numMethods_from_bool_to_unsigned.patch \
            "

 SRC_URI[md5sum] =3D "a0128d661cfe7cc8c121e73519c54fbf"
@@ -16,10 +17,26 @@ SRC_URI[sha256sum] =3D "5eb20ac0e2944f6cb9c2d51dd6c4518=
941c185347d4089ea89087ffdd6

 S =3D "${WORKDIR}/${BPN}_${PV}"

+do_compile_append() {
+    oe_runmake 7z
+}
+FILES_${PN} +=3D "${libdir}/* ${bindir}/7z"
+
+FILES_SOLIBSDEV =3D ""
+INSANE_SKIP_${PN} +=3D "dev-so"
+
 do_install() {
        install -d ${D}${bindir}
-       install -m 0755 ${S}/bin/* ${D}${bindir}
+       install -d ${D}${bindir}/Codecs
+       install -d ${D}${libdir}
+       install -d ${D}${libdir}/Codecs
+       install -m 0755 ${S}/bin/7za ${D}${bindir}
        ln -s 7za ${D}${bindir}/7z
+       install -m 0755 ${S}/bin/Codecs/* ${D}${libdir}/Codecs/
+       install -m 0755 ${S}/bin/7z.so ${D}${libdir}/lib7z.so
 }

-BBCLASSEXTEND =3D "native"
+RPROVIDES_${PN} +=3D "lib7z.so()(64bit) 7z lib7z.so"
+RPROVIDES_${PN}-dev +=3D "lib7z.so()(64bit) 7z lib7z.so"
+
+BBCLASSEXTEND =3D "native nativesdk"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
