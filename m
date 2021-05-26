Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.58])
 by mx.groups.io with SMTP id smtpd.web08.4628.1622017349797179907
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 01:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=bOlyBbrs;
 spf=pass (domain: kpit.com, ip: 40.107.138.58, mailfrom: nisha.parrakat@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cv+Vglgl1FiMiPSEHKC1zW4jm/pJn9j4qtxA7KjnGcXPLdS98uGTMcHzvYzRr8TK3bJZ0zbjPLigDJ6sxkhnxd32gHrknmB+21d9yREZO/jbXbQpn7sW8XYkdapCyquI0RScUzmvwU3cHXt30c3OSllr+PhBMnnLhE0NXTsIpVoXvYR6AqxIciKVASfwt3W5dH/Q3mnEeBhkBfnmHT1Cxu8FOtmfYcSdroMhE3Qz/D33Uv7wsGVmDSwwuojrFQMiFNvltR+97oZLEGl3kRhWbeRJ2hbUIU9lPNMPBKMHUyJVSBnHkSmFsdWp6ErrC0jrMKf321d6PtMf7//q4REWjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pctp45vmv7KzpS0vCjNfg+NaJkfCkkVLU/XHqKJVZRQ=;
 b=KkFK7RwM7U/VivDhG2M/di27rIjh3s/KCoS0VE5Wwctx1wjf3JH9d7WdBj3V3sNLEMCrGfuBwJLGgIqn33/vghDGK6ILlJqZGZmgxrflyWsZP7jBXnjK1crgCXyP26Qak/nBrW+1TYETweCEU+SbVwklU6ovjlvE4Gj4J3fVsWL2zllZTVIS+nPJZJdYJUN9R+D/hopewOzihCLrr6TEAjOhfMY9lzcu+nZK6CGnGcXZk60hVPY3hsjktqJfU0iyAExCyvfWTUKXO0idMlF4e5I2jJSyEzc9eIjyzfwAKDZLY7MN4U6GcLbbbRbwdbtYtbAfN4RjNHmimFTs+RPVnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pctp45vmv7KzpS0vCjNfg+NaJkfCkkVLU/XHqKJVZRQ=;
 b=bOlyBbrsibPXvuBsrsMzr/sOglOqGn20HnYvVpqG7FvO2oQ9xU6i11tI78/i0oy04jNDTlANjnQ/8MMvhuLcDa0klLWMo7SE4MDwkszGyb+6bdTO5DWU1ZVocBCHOisoOmn62NMaQJ0d3hAAeaE48b0B6WN4FqINW0fhhjFb6WI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:36::6)
 by PN0PR01MB4977.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:47::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Wed, 26 May
 2021 08:22:23 +0000
Received: from PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8d5b:7904:5e3b:7167]) by PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8d5b:7904:5e3b:7167%3]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 08:22:23 +0000
From: "Nisha Parrakat" <Nisha.Parrakat@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com
Subject: [meta-oe][master][PATCH 1/2] p7zip: build and package lib7z.so needed for fastboot
Date: Wed, 26 May 2021 08:22:02 +0000
Message-Id: <20210526082203.6853-1-Nisha.Parrakat@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2003:c0:f3b:b059:3a22:e2ff:fe1a:a816]
X-ClientProxiedBy: FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::20) To PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:36::6)
Return-Path: Nisha.Parrakat@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from bsys_traas.speedport.ip (2003:c0:f3b:b059:3a22:e2ff:fe1a:a816) by FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.16 via Frontend Transport; Wed, 26 May 2021 08:22:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 177fcdb2-a4f8-409a-0a87-08d9201f6345
X-MS-TrafficTypeDiagnostic: PN0PR01MB4977:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN0PR01MB49770274DB9E57366FD3C804EE249@PN0PR01MB4977.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a6ewNKwl5m3uIbeeWKrcSNQmCb9vWybLFWXohMaKKhO+L/4tmjVq5U+W+e+nvNemwMW9rMiI3pS8zn5UBa1bxyzn40DWGJiVNDyrbGpKQ7ICT6hkaSnyX3/69zKfQfMVthyadRHmBEIP4mJdgQaaMIGc/4nGamSkdhRlFTCC/3YRPC1gxXtEJPPP414XItS3QlyebHXUdUgR7FpKakXGcebR/VKKOHZayZ5vLQe/g2XOnElcj7A7azduSJBVI8Hs+WouU+Imuz4gT4FEkJ4++dvsksWyDIo9c5kH/IMhBdgN2vCx+L0ZCrB4SOKRRQDMgBEYJY07SfI6bWO0yPQ0xxGgIi9vKetHmc5kG3U0Z2bWEWBBbh0WXPLvRfhW6VSed0pdZB/L6shynowsU0dEErM/lFGOFvSMG00NL0HJABWuUt8c6bdAktddAu2yybncd+i9SWNAQQIUPRyA81orFOjlCp+FV+jJJfSiFVG7Jv+CyXXmLLu40curxleBQ9XyPx3/H4bMXdsMeW9UIvVN1lgitY8qgM3gRsVDMOm76xKYDyeGWDApFAZpT+kmSeFp9Vs4NobrOuw3tzLG/aDa2MPc94mErnIYx42lq1H+bFHh1lQvUHdErYcmXZIX6SLDcjYUC0dIz4qrRmkdwcHns96/kvIW0GMl2kfwTTXta7xWDfwjWnWPPyDagDVyL6iS7HGXyzr299IwHw7yQkaTXQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39850400004)(136003)(376002)(396003)(107886003)(66574015)(478600001)(83380400001)(316002)(8676002)(8936002)(186003)(66946007)(2616005)(6512007)(38100700002)(52116002)(36756003)(16526019)(1076003)(86362001)(4326008)(19627235002)(2906002)(6486002)(5660300002)(6506007)(66476007)(6666004)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/eoN/ZTqI5p5hNKixky6XwvdeckDC6D8Bcp+663oWDnVK6d0NOxd5WbqH72pzAYqdmB03uXHG71RGZBe1oGr6dEwL0XznAQs7H2WV1YHhc+6L+lOwau54shlGauFUn1lnQF9IKExLqUFHUYgHYYi+mrj5djzTU3N1tHTKrIN+00LwxN2nW9YP4F586SKnzlSadiTdVHk8mDYHFlRYE2a0EjG73Ewa6KYebNXSULStlBtlgiWjRHTTh5vitZu4ngx33uyD/5a3BfIrvdgurHmvjeohkXZrAv0I5xKbI1ktqtVTlYi0JBaWyAYGL47edG+BdGVwSlfmfc0B/37Dt7NSiwaKJoEiOp2oP5gTAGARB2bVtvg40b8upnjmotDVEYUeBiQcNIgIBMRvQEm8VQtdSJqMoBa3hfjVDZ0mb7RZsP7oiOwwbmy7Eeya2ey8YD5AgL1xwftwidjb6U7g/FW8HVkeNWSKRcCaKD8L/3fcnfIFF8O57ZA6qzfnO3agGISFiTHdK+US+72A7f5y5i3YcXrg/MAVtpLC6KgaHooRIoTzmWzsOupqDbRjajUi183JerAGJFDF7IXgTL0tyeeyfyEKtAd9HGEvMI07JPELUc7AxlTPzYTasI7ODD129nKD6TRqs/LiDvFazdPSm4lp/hYuZZFhCwjy1tX7b9+jqaIxWWiCWYvx4QXBtRh/bilMvEIKnCWVth5BtISjSfDK8e8gKMnprDPzkP3kVN9rdccLEAlpz1ZKx4YByd0vcRoQ5BuFmsLoRIfAibPBlU9PuFLrS0EYRPLf7rouW+UvqDyW5wfkjkH1zJURUWcmKbA
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 177fcdb2-a4f8-409a-0a87-08d9201f6345
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 08:22:23.3668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ekzi60T7OCYXVqoHHKYK+S1eXdbSSGhtBDYPoHsnGu4yWQ3EM/tu/Nx4a3mHWgdS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB4977
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
