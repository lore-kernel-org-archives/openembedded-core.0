Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.73])
 by mx.groups.io with SMTP id smtpd.web12.4709.1585861187529726092
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2020 13:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=TSg2dLK1;
 spf=pass (domain: xevo.com, ip: 40.107.243.73, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6cym8wASkeyeTEhWIB5YcUFTvYmXWSwY4cfZ69G92MvFk2xn1QgPrkt16UiJVecE8FEWSe7ixOUFdoDJEEYwvrbhGOMQa4QEI5M3LaFkdUPcJSEPhFQJQ+phxPJinWCP6DYCcbQUsF9rvgdZNrTIC1dNpb7VNogWKE9bcYkUTN5/yJkOCiqwWo3VPOE/0fa92/8EJP5wj49IiSkgulzQKVByXmfoHQtRTiCV6DRCRPQ9UMwGwjBsGmsFaVOtwUYBWujXHJftxa1h6PTZGwHAxoSkwuQjfEnuS0Hn7E2orowYRGUZl65w5rJUSr9QeKPYW7TKn5j0bjaX+fvZOqpPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNEyVxggOQnq79e8LJG/Fx+oox97JSrW1ZtFf7+ofuA=;
 b=XV9TFzxaqYRZe7uwFZdiDp7NyRh3rehdhMJ/pIa5JXsIu9EH56dmJZEr9SZ3Rg2i+JANgMBQ4sApr8dMGUrFCbLduUCIzg9y7TunBmgzxc8ix8nN9Pa5iVI/VdeKRYeQwPJgOqKZbR5UUguoK3caWTTyHvOlFuz49odskyLxmqW39UDcT7I7b9nSb3d53YdhiHO0RojKj4PJHWRWNBnxSvxfWOQlelLl5Y7P9D+VGdU7MVvSwPVaSKTzRDNwq3DvWmiFaN6CCklW0sWtRIgUXGDmsQPtrH146jnabgg93JjhHPESy1lVAihNYZfbvysDJKUqxqgmY/eAHlrgkbVD2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNEyVxggOQnq79e8LJG/Fx+oox97JSrW1ZtFf7+ofuA=;
 b=TSg2dLK1NigonH4bGgiOKiOJ698xjTUO9N/lOj9eIAq3/wbkU/dRa9vPi8sj4nvenux0CKbCUyec0j/iPGMQsYW2pNcQ/hpAUhntO0KBxDKaK7p0M/vpJ7YP0TtRQOCDhYpk+CKZG8jUy7Yxh8fAHzu9tTVlcmpW4bd+Yd8dVts=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2313.namprd18.prod.outlook.com (2603:10b6:907:8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Thu, 2 Apr
 2020 20:59:44 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::3d:5c5b:af00:a4a6]) by MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::3d:5c5b:af00:a4a6%5]) with mapi id 15.20.2878.014; Thu, 2 Apr 2020
 20:59:44 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
CC: Martin Kelly <mkelly@xevo.com>
Subject: [PATCH] cmake: fix Python executable with cmake
Date: Thu,  2 Apr 2020 13:56:32 -0700
Message-ID: <20200402205632.1355452-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: CO2PR04CA0161.namprd04.prod.outlook.com
 (2603:10b6:104:4::15) To MW2PR18MB2236.namprd18.prod.outlook.com
 (2603:10b6:907:7::14)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from columbia.corp.xevo.com (50.54.140.49) by CO2PR04CA0161.namprd04.prod.outlook.com (2603:10b6:104:4::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend Transport; Thu, 2 Apr 2020 20:59:43 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [50.54.140.49]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69343797-82de-46f8-8dd1-08d7d748c549
X-MS-TrafficTypeDiagnostic: MW2PR18MB2313:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB231340CE9C2AA962AF5A1140ABC60@MW2PR18MB2313.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0361212EA8
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR18MB2236.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(396003)(39850400004)(346002)(366004)(376002)(136003)(186003)(66556008)(1076003)(86362001)(66476007)(66946007)(6486002)(81156014)(6666004)(5660300002)(19627235002)(8676002)(36756003)(478600001)(107886003)(316002)(26005)(966005)(8936002)(81166006)(16526019)(7696005)(52116002)(6916009)(956004)(2616005)(2906002)(4326008);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pEnefCWROxlyx+J0/venB+tU0LS3acOVpqt3CbCbQsIX7SIJ5t01617ZPCLNct3w7GC7dQOZLtWiyjBvqfclZwi8S9B9r+uovgdpfQqAGtNut2RODmS9CPL9R4BWTBGZnEWYWQoq3oN+mH12GOfAXthISjOF8gaHQpheN3SSq9qK25k3Rbb1JeBmWNaOrO9eu4IoOKhDk/vZuNh2UiDbVTCqXVoETSEokRqJmJnuI+9ePOfcGiNgTkJVS1rrWQkTsU02vtJhoJWjQ8vqKconsNf+9sYqDlZq60MBGwJaNAPLUL0xgYa97pPAGHUWT3YRc3yr80mGmmdtHO6T5/SphuFcFMdrfr/fZPa0dlwjtskQBBHWQRb0pgQbmV0FyOmnvqxPe4jACeRkaSz7N5/5ij6gYCdpxgUpPjxpC+S/VTay5hn2B07ClptT7aGzjQ48JZF/1jNxNicHkJgCqJlNU5ABz7D+krzeNQpgOymfQ4CrZ2QPAVEChQdDG45TxXE92/iYTCI9qZt9fMiJz461qA==
X-MS-Exchange-AntiSpam-MessageData: 
	OaR+RDpW9unEY4xyuqbI+FijxfeB8sw6niC3GqQVoAH7bXZ7B+saSI1h6muhFwCycnOLYrbOyQ9Ai0xwR3K040T9xwSK6fps3mVr7B931nWMekQEbPoxWDt7D/6DkTV03KSMLCRV0gD0UNdGur1Mjw==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69343797-82de-46f8-8dd1-08d7d748c549
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2020 20:59:44.6961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPmRaWuaOFb1mTiTAixem2C7GY8N3PBRMZAjuv8wPoy2oe4PhVDDFDx+NpOfUw5z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2313
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Currently, CMake has two ways of finding Python executables:
FindPythonInterp and FindPython/FindPython3. FindPythonInterp is
deprecated and may be removed at some point. Currently, python3native
sets PYTHON_EXECUTABLE, which FindPythonInterp uses. This is a problem
for a few reasons:

- Setting PYTHON_EXECUTABLE as an environment variable doesn't work, as
  CMake needs it to be set as an explicit CMake option via -D.
- Projects using the newer FindPython/FindPython3 don't pickup the right
  Python, as the newer routines use Python_EXECUTABLE and
  Python3_EXECUTABLE.

Fix this by setting PYTHON_EXECUTABLE, Python_EXECUTABLE, and
Python3_EXECUTABLE using -D options to EXTRA_OECMAKE.

The CMake routines are documented below:
https://cmake.org/cmake/help/latest/module/FindPythonInterp.html
https://cmake.org/cmake/help/latest/module/FindPython.html
https://cmake.org/cmake/help/latest/module/FindPython3.html

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/classes/cmake.bbclass         | 3 +++
 meta/classes/python3native.bbclass | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index d91cf20130..94ed8061bb 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -175,6 +175,9 @@ cmake_do_configure() {
 	  -DCMAKE_INSTALL_LIBDIR:PATH=3D${@os.path.relpath(d.getVar('libdir'), d.=
getVar('prefix') + '/')} \
 	  -DCMAKE_INSTALL_INCLUDEDIR:PATH=3D${@os.path.relpath(d.getVar('included=
ir'), d.getVar('prefix') + '/')} \
 	  -DCMAKE_INSTALL_DATAROOTDIR:PATH=3D${@os.path.relpath(d.getVar('datadir=
'), d.getVar('prefix') + '/')} \
+	  -DPYTHON_EXECUTABLE:PATH=3D${PYTHON} \
+	  -DPython_EXECUTABLE:PATH=3D${PYTHON} \
+	  -DPython3_EXECUTABLE:PATH=3D${PYTHON} \
 	  -DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib', '')} \
 	  -DCMAKE_INSTALL_SO_NO_EXE=3D0 \
 	  -DCMAKE_TOOLCHAIN_FILE=3D${WORKDIR}/toolchain.cmake \
diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3nativ=
e.bbclass
index 182c11aa2e..d98fb4c758 100644
--- a/meta/classes/python3native.bbclass
+++ b/meta/classes/python3native.bbclass
@@ -1,8 +1,6 @@
 inherit python3-dir
=20
 PYTHON=3D"${STAGING_BINDIR_NATIVE}/python3-native/python3"
-# PYTHON_EXECUTABLE is used by cmake
-PYTHON_EXECUTABLE=3D"${PYTHON}"
 EXTRANATIVEPATH +=3D "python3-native"
 DEPENDS_append =3D " python3-native "
=20
--=20
2.25.1

