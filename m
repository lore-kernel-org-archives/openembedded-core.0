Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.69])
 by mx.groups.io with SMTP id smtpd.web10.553.1605160955989181532
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2020 22:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IYj1Jf+Q;
 spf=pass (domain: windriver.com, ip: 40.107.94.69, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G9Z6vheRbDlA+eQb8Yl82P2d0HVhWeq20ha2qxXmlTrJiuhw2oqm9N4v+9WDCCWDVlXmnIK/abEgo3zA/fjaJg4w0Z9OVXJg+tlx3HeKyN0K5n8AwbasJU43fU6deeKWxGBSnOSwFGdjofP7R955Ssa9XHQLbKFW94Rh6x5waXCgwiyBUrcH7arB6Z7GG3XcCcpFhOE8nntOCejr6++x9McqIoesit8nS7VoAhRjbNwDWFE8OYVzjBDfO+S3dWb/2eufvOR1tYy+UWuFKw29syBcKPyZDkMyulIOFDThcP4fInbTCFF+OxelKU8IpA/uo95EJkoqndrjjtQxiKNxKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1K9P8PauUHKanh/LY31pesvgqSh18HZLoyjJWY0KgTA=;
 b=bT6cUZqDWsKIqyifWX639Tgp/MXmrM63B93QgRLDmXP4gu5MTHCzEN8aAxYkTk8Cp6y0OUYExTB6AORh7QwCxbk2C/B/CU39Ik9tfuzIkB1TpCkTMlcaE8o/88TfOu3Xj9zrypSqIxX0vlxkc0TswwYM6Kcev0zjUCtRKjYmNWolKvFQFtIPpspwFoK3X73ryMCvxS/RNlnHsBZoDbfQ7yKry0gr4eMuluGjoL9fmJgG3c3o9h3zSmkZ4wj9n+S0l/dA6GJwGYNu/r062zGKSJGuheQLUPIhFDj+qUzAtkbiu+W3c5qzYfUMFHTsP6haCxrNJSRYMFfMPpcvZBu/dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1K9P8PauUHKanh/LY31pesvgqSh18HZLoyjJWY0KgTA=;
 b=IYj1Jf+QBhAwjI2w009grdArXilryfownr3zQvDWczkV3A2o+qOuDnqjsceeMTBuJOFUx6GK/5uW2ZHwUjEmetV5xX4uTqxg7neJCxAAJ8TmyZgoDorZ7QjrTHS+3ssKZSh6A9HLx7xDWXK120gmV1RGOvg7id6V9m0CYtwT19U=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA2PR11MB5001.namprd11.prod.outlook.com (2603:10b6:806:118::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Thu, 12 Nov
 2020 06:02:33 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::e933:258c:17b3:105]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::e933:258c:17b3:105%6]) with mapi id 15.20.3541.026; Thu, 12 Nov 2020
 06:02:33 +0000
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vulkan-samples: fix do_compile failure
Date: Thu, 12 Nov 2020 14:02:17 +0800
Message-ID: <20201112060217.7282-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR03CA0058.apcprd03.prod.outlook.com
 (2603:1096:202:17::28) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR03CA0058.apcprd03.prod.outlook.com (2603:1096:202:17::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.21 via Frontend Transport; Thu, 12 Nov 2020 06:02:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7834da2c-6173-49c2-b73e-08d886d08bf1
X-MS-TrafficTypeDiagnostic: SA2PR11MB5001:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB50010BDEE426F8A4B8F478D882E70@SA2PR11MB5001.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WL5aCACLYSkxb9lPcP+574K+XKVcyCCm3gDf6S279RHev8rldeji2cfN74ap76Jj5AFYzLStIAYavJOx2+17WWE3PJ+MB7DHMZUCkbETWx32Dckih35RaaamlWE4av1CoJtCBxm3B498tISo87FUEUt3TFMkDwGweSVax7YUN6wQMuR7o4UglTCMqwRnrTvEKwRDGIdGpf0HPm6uVqwcR+Fs7LNSm/g2U2lb+swEscFyAaSzywm8c1KcPTCCt90RMYU6KwdUN9V3RBN7nIuOPTpGaV5MaJyUzF+DveeVSEeGuTlqgo2mPI/MR5LRPTl2Bg1+S/EU49XHsqEDg04Vkg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(346002)(39850400004)(136003)(16526019)(83380400001)(186003)(956004)(86362001)(66946007)(6506007)(66556008)(2906002)(8936002)(5660300002)(66476007)(36756003)(26005)(478600001)(2616005)(6916009)(8676002)(6666004)(1076003)(6512007)(44832011)(316002)(52116002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	XRFf0qsL9jhKUcBMzAro2RCnfvKxzGyYthJhlKItpJ94lYUHky162uzeoD36j3aOuLZAfHCXHn9tvZoCVt0zqzMid3+OGW63SoD5ixnmOJ3L0S/9mdFkDGFfrj88u6sgDqC9uTsPVqmHUYxmwfksTo4/nhSBU3eXA6y5BruaD0AppxpLgZFojQ9qItbV1HGoFger/uWSe/LUg213dYxsvRa9evQMGbKjwRYo2neXUtX0mHVaQ4SSMTOCg2cspoMAuWrL14ngWvwrcAIgLjHKszi197Q48YG9FgbxzGtIe/9V6NJRdbrFC15bgnWYvmONhBxYtNT5TiDS32+ZPofounjWPkuDLrqLwGHi3jpEfIzdOQfNPFG15yVahEIEbcf/BXlAeR8yh6A+CSX7hUq/AnonztyyRKponzaShS5uwXasVKkA2oDhyFsWUAbfcHdz7rnDmrUENqflR6nPFeBu8TaV1ROkR5i0PlLan8J94bBOKIiEv2sC9nLh0eRe52iuwCF0EJNvLH9uRgkZrqiWBRwyi+u9amwY9kGULmCmQDKH/vKjkXa6rZjCRsWlJDm1OcaMGktz+Pxn3/qx9KH7u3KZlUiguUP166ebPKJz/CMCvzecD8aeuJ0U5ysD9C3mT+acJ3gmlSuyHnVDFshXkQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7834da2c-6173-49c2-b73e-08d886d08bf1
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 06:02:33.4657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: scX9ouhcYeaY6ZjXpSWK7b08ambnX14LmPpayx0cyTRxKVMt1JJ03tNRoNT7NQsnVESFkZh11QBTM1NrV+PCaRRJzF5LLe4Kbrsf0xoiFFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5001
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

fix error:
| framework/lib/ppc/libframework.a(device.cpp.o): in function `std::__atomi=
c_base<unsigned long long>::load(std::memory_order) const':
| /usr/include/c++/10.2.0/bits/atomic_base.h:426: undefined reference to `_=
_atomic_load_8'

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...ts.txt-link-atomic-for-arch-ppc-mips.patch | 33 +++++++++++++++++++
 .../vulkan/vulkan-samples_git.bb              |  3 ++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-CMakeL=
ists.txt-link-atomic-for-arch-ppc-mips.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-CMakeLists.tx=
t-link-atomic-for-arch-ppc-mips.patch b/meta/recipes-graphics/vulkan/vulkan=
-samples/0001-CMakeLists.txt-link-atomic-for-arch-ppc-mips.patch
new file mode 100644
index 0000000000..54bd90c610
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0001-CMakeLists.txt-link-=
atomic-for-arch-ppc-mips.patch
@@ -0,0 +1,33 @@
+From e7cccf6626e9a7e20f963f8bbbffc9dae3863ce8 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 12 Nov 2020 08:10:51 +0800
+Subject: [PATCH] CMakeLists.txt: link atomic for arch ppc/mips
+
+fix error:
+| framework/lib/ppc/libframework.a(device.cpp.o): in function `std::__atom=
ic_base<unsigned long long>::load(std::memory_order) const':
+| /usr/include/c++/10.2.0/bits/atomic_base.h:426: undefined reference to `=
__atomic_load_8'
+
+Upstream-Status: oe-specific
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ framework/CMakeLists.txt | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/framework/CMakeLists.txt b/framework/CMakeLists.txt
+index bf26786..4d8c594 100644
+--- a/framework/CMakeLists.txt
++++ b/framework/CMakeLists.txt
+@@ -410,7 +410,8 @@ target_link_libraries(${PROJECT_NAME}
+     glslang-default-resource-limits
+     spdlog
+     ctpl
+-    docopt)
++    docopt
++    atomic)
+=20
+ # Link platform specific libraries
+ if(ANDROID)
+--=20
+2.17.1
+
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/reci=
pes-graphics/vulkan/vulkan-samples_git.bb
index 241a313a7b..f9d6c9b1de 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -6,6 +6,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D48aa35cefb768436=
223a6e7f18dc2a2a"
 SRC_URI =3D "gitsm://github.com/KhronosGroup/Vulkan-Samples.git \
            file://0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-=
t.patch \
            "
+SRC_URI_append_mipsarch =3D "file://0001-CMakeLists.txt-link-atomic-for-ar=
ch-ppc-mips.patch"
+SRC_URI_append_powerpc =3D "file://0001-CMakeLists.txt-link-atomic-for-arc=
h-ppc-mips.patch"
+
 UPSTREAM_CHECK_COMMITS =3D "1"
 SRCREV =3D "f52361d3cd6ac8c30fc3365a464b4e220c32cfd6"
=20
--=20
2.26.2

