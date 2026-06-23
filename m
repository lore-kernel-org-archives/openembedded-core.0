Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51ADBCDB47A
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 04:46:06 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13878.1782189956534568429
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 21:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=wiYizLlU;
 spf=pass (domain: est.tech, ip: 40.107.159.41, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R6znypru45xda+hPSYgiH/zbHHdT3E6ZcRl1gtZ/vFDa7aqJms5OREbQVHHaNqUmPEvsQRQg4LfwHJ//NH5BspqOqHH9dTU3c0DfU4ev1P3AqzNuHQePmlUhwrCRBpT1dHgIYMWcFC/qMDVPo1kR0MgDH+ZXHcZYiFGJZZB8zRikFK3M7YeMQdIagXaMYOjhkk9ELohYLEedfx+dEnC5C/f+KK5coqz1Z/YlfXY6ug9BoiB97CIM39MN1wcgk0yAeR4klrGPpPtxtXGfgVz81xu7QhAoHQmV+zKTQAlWxrgPiJO4y06PI9wef5h38M0c8SQef7wLsVDFF0W2cm4oKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbNb9p8AI56i2AXGYO3COLbbTRphiS/7WrzAqNrgI1w=;
 b=p7Jbg3kpnHdtk9xa2LNXfvn2h1KoREG5MHwsdBKZbAE54D2RSmNH8U1/73S289PkudgFs2oy1nzt7fUamWDuJy3U/JX1ePsBJ0OqO5w9xOGB5cQcpjf8kQB+nuflfXh7OfBfFgeNTIu8NgVD09TDpKi9YQImkkBj2AUp66Cl14Vtk6j21zn7tsMkNL4Z+IAHq+p3EB1UkHoQYuDjhAzZYSH+y06EIb531p1IGu2TEFWWHqHMeSgeXHmiJi+/BaGAqn6MXBrMIgv4rpDO5sfwND5q/aSNulRDgOtXwqKltuzHswZAGFXw+bcGdR8+B86Ly1W+sSu10yOdEms8cbEIlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbNb9p8AI56i2AXGYO3COLbbTRphiS/7WrzAqNrgI1w=;
 b=wiYizLlUl9QngDAlaSXXxcR1iMa7oPBokDdob8ZfMqw41mzciqdbniecyblWX+AAxx8ISBEzsGB4jAj8UW/LZD49SeNa/3ipOfAws5HvUq3kgXlLr/q6MmKUcUlGBbl5o3LwQAgNp4P8WiEEtbh0M+Q93v6QiwBjFsQpOJbrt1CVGVF509aYasErbPtz9o192kHHXivkMymIwvIksg4t+UP3GglXCkrFU+qxTR1DlpEsR7s6v4mFucvG2auKt9YxZcGHW7T8TATZPL+hoMc58/argJIrNWp5fU2FAXvaZS3sp4lb/FKCZa/NnGfJe98TcOKwyhU7KiL3JAw1Tl8lbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 DB8P189MB0700.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:fd::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.11; Tue, 23 Jun 2026 04:45:54 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 04:45:54 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>
Subject: [PATCH v4 2/2] oeqa/selftest: add copydebugsources tests
Date: Tue, 23 Jun 2026 06:45:48 +0200
Message-ID: <a65e58b8e68dff4552c042ee39dbed7055dea4b7.1782189065.git.anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1782189065.git.anders.heimer@est.tech>
References: <cover.1782189065.git.anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0273.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::8) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|DB8P189MB0700:EE_
X-MS-Office365-Filtering-Correlation-Id: 80d23384-15bd-4f33-0af1-08ded0e24f3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	pILQ9xLsWG3Zg/d3MOzULzPIkqoyOi7Css2wTD/Hlq3h5rBRVjwjrhrWVe6whr8TkuDHgCH0dCxAQB4BNtvzv3IZohVsKr5O9UlsD583vBfUNWjlfLj46Ng/jWacG6bP5pK2ZqVR0RzRJtiJIib033xqAwXWNpNRHmT+pe3WJR4YONVQrhlCMz38hYohacaM5/fhE1Vmayrdtvyr0r5T8NzhcUhQ/2jNist2lfCDgVyru1a9cSKNxnwGcEzcy0+B0qwO9ogYhZj52FMXAOIfV3bqKzIiAxMfOstpKpxjb3QUF24nVHVzt6rKjd0sdhUUUFUnKqxqOQPxMx0IoHNpzHOcpCXA+bLyIZEMGaUOQLjYsKZZCdl199tYUoJP9/IBBSuvj12pXJkkp6xMUM2hzjef386ZEazwMC6YwktqIN7hoV6+2b+OCXqNRoI7jvzpWInyp/ohLdRactvhcijpgPqGrxA10b6Sjh0saFLjQfP/K39dVJF4XRMFMBv0+avZe8a35B5mCe9gPdc7/N3CHKtReC0JtCJwhZnkEZJw2ZbEAMMbhG95TP9uewTPG79G1dMuS9zStl1SAJEWKNh7ujMd8oZ27TEC/6jjFuF4ejxCdVkixcsDknzIuxawgW341va28zcErl+xAdRUqbV/I3l5vyceh6MEWpyfHcKIm5g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ioy4ahaIAINg/kFoSr0wkS4mxWFB/NmgmsrvH/7J8GfFlT1hExAC/qR5Ky7D?=
 =?us-ascii?Q?j1XLOMIXIaDehznEAFGcyNSfisSh6ModQm6rBDjt0xyPBYrM1dyg6f9ExsNU?=
 =?us-ascii?Q?9JVwqzjc6QSZQsdzVL0QPS+naGWFWqJ7twb+u0wiPMtSUP0KmYtqtD0LELre?=
 =?us-ascii?Q?MWQIp+Px2DFtnK4gPxnX8pIWioxH9oHlqBKjkto0u+TJvhcOD0CtRlmhkY23?=
 =?us-ascii?Q?l/5SvWVQRv5Huv/o+fqsc5dC9B2idhx6gmrLSZW59C6X5pqQIiUnCxAjNGFf?=
 =?us-ascii?Q?/rIS1pTuySmCeuMBJWKtijdHWxmwVEU5lkPbCWHd2eF7ES0YebnS/+SbEMkw?=
 =?us-ascii?Q?0N6xvtv9vLAAA7sqXnnWJrT4pEuq6Ig5aHUHA3pIit4RXoXGO3P0i3gEGUbT?=
 =?us-ascii?Q?JW1aRf0tffqQOriqvdvUDeVDUDzM7P3aAQyBJ/+XzwRMYbhGDSbOuxRbYQ39?=
 =?us-ascii?Q?df6rzTZ3cDZlUj3z8AjFB7CLhAHIsyxOhjLS45NITn57c1aZQupmP50spCba?=
 =?us-ascii?Q?AVjvMRCZuZ/A9DwONATBpSDa1LmrL3sb/YONYGdg4A9V7R9Dq1zkqDmbO27D?=
 =?us-ascii?Q?fmYBlZdHqKG3zfBNnbfAVCA6XYPmrNVAd7DeMjZW4m4SQv5LUNeRU3ebiovM?=
 =?us-ascii?Q?raZLCME5BczMtizr2m77CmEFE/Ke3dFky2fwMwaGMj3oFxSCsC3MB4ztV9Os?=
 =?us-ascii?Q?PAQtOrYruX1iu/SZ3M25buYbV9zX0AsVk8Jhb+sjfAMOsyB+BrzzazcYb0g+?=
 =?us-ascii?Q?z3W6kPxTblM6QCojASbjdi2FjLU/2S6UpE5H6lK9sHN2L+vcvpgjOv6YODTh?=
 =?us-ascii?Q?ya03VqoY7m8aLsAvHD7BRKPyF+0yUh6TNRr7lNWIsgOkN/x/KRdYQlKfIIHo?=
 =?us-ascii?Q?FcxtYZji8V0hvhqeOf8HDYZjXAn/fAZLR/Fkl0sPMtxksg3gwsiCJfkM1bAO?=
 =?us-ascii?Q?KEXKA4C7aOoxBC+0VOTyg0z2BtRGWqInVsuZtpv97O9iVfBZX5WqSX1Yx2xB?=
 =?us-ascii?Q?3OU7asmcd6djkerQ60/zwA5MHHq9R2nwmM7VZAfldF6hluhSlUl39GV7B/UN?=
 =?us-ascii?Q?lw3D5xcs5udsLGE8wRKizzVuo7KPG6bTRZ5TlURp1bktTrfvwfN+5ExkIaVT?=
 =?us-ascii?Q?97Qoz/eJBHKPwfH+zuvWVw3jWav1TOCeNoZ2ZD8TXxeSRIlTys5pMqFjbMJB?=
 =?us-ascii?Q?JR+TeE6SodcCZOSwFhrkW7D/UndR2yScTSzCv8j2XzQxlTsxheAtLQKLvaIi?=
 =?us-ascii?Q?MEyp0bAwDnuXQNwOT45NDoOujL+EVxCv3QM4FiFnkgqlolkOMP/2EGdSFP8Y?=
 =?us-ascii?Q?1XhsJa18eRTXGf0VObmCYQexFyBqEbYheo+2tfkx/6EJxuld920kmghi/nc7?=
 =?us-ascii?Q?4KQHEP/YFTtH+3SJyJlUk/vPjbiq4PEb6fKvldLJw/bqZnT1GfM4dq2T/ir4?=
 =?us-ascii?Q?sTao4Bpakuxl/Cw80zqvbE8GTYXJBBUzcP1Bi92vc4f3rDN6tYYIzTxdUVmM?=
 =?us-ascii?Q?EvlQ4ejU2IXlt7iIirLW1wvahHalkFt2M8KyIUnqeiBL+/YigaPRKw/bquAW?=
 =?us-ascii?Q?osBruhByQNC5x21Jjpi1wocq+OzhBr7wACegaxKMITABKsu1Vja399JIimAT?=
 =?us-ascii?Q?axrjCy6ateQXGV9LGsOHOfNenTp6EMiUbj3dJ9AYRCT3tszhclRSqRFrJ/tF?=
 =?us-ascii?Q?r+tgylQ7fwrmoc7lYKlqSQ0ZLdffhi370y0E362dLjtfPDqoYsQfc8QbG9I4?=
 =?us-ascii?Q?MPPNp3rAqQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d23384-15bd-4f33-0af1-08ded0e24f3f
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 04:45:54.5229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q93ilCu1ksOrN0OOQrhEscj+I9ALL4jtoam0OMOZPgYzFV3ARjm3XQVNbw0ZCPbUrBei9DHpcAQ3WR1aEdb+WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0700
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 04:46:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239329

Cover multiple source-prefix mappings, recipe-sysroot and compiler
entry filtering, filenames requiring safe argument handling, symlink
dereferencing, tolerated cpio copy failures, empty-directory cleanup,
and externalsrc relocation.

Exercise paths containing spaces and glob metacharacters, leading-dash
filenames, mv overwrite behavior, an empty relocation directory, and a
source copy failure which leaves the prefix-specific destination
uncreated.

AI-Generated: Claude Opus 4.6

Signed-off-by: Anders Heimer <anders.heimer@est.tech>
---
 meta/lib/oeqa/selftest/cases/oelib/package.py | 274 ++++++++++++++++++
 1 file changed, 274 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/oelib/package.py

diff --git a/meta/lib/oeqa/selftest/cases/oelib/package.py b/meta/lib/oeqa/=
selftest/cases/oelib/package.py
new file mode 100644
index 0000000000..b9f9324a10
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/oelib/package.py
@@ -0,0 +1,274 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import os
+import shutil
+import tempfile
+from unittest.case import TestCase
+
+from oe.package import copydebugsources
+
+
+class FakeDataStore:
+    def __init__(self, values):
+        self.values =3D values
+
+    def getVar(self, name):
+        return self.values.get(name)
+
+    def expand(self, value):
+        for name, replacement in self.values.items():
+            value =3D value.replace("${%s}" % name, replacement)
+        return value
+
+
+class TestCopyDebugSources(TestCase):
+    def setUp(self):
+        for tool in ("cpio", "find", "mv"):
+            if shutil.which(tool) is None:
+                self.skipTest("Required tool %s not found" % tool)
+
+    def test_copydebugsources_copies_files_and_dereferences_links(self):
+        with tempfile.TemporaryDirectory(prefix=3D"oe-test-package-") as t=
mpdir:
+            source_root =3D os.path.join(tmpdir, "source")
+            second_source_root =3D os.path.join(tmpdir, "second-source")
+            workdir =3D os.path.join(tmpdir, "work")
+            pkgd =3D os.path.join(tmpdir, "pkgd")
+            debugsrcdir =3D "/usr/src/debug/testpkg/1.0"
+            second_debugsrcdir =3D "/usr/src/debug/secondpkg/1.0"
+
+            os.makedirs(os.path.join(source_root, "nested"))
+            os.makedirs(second_source_root)
+            os.makedirs(workdir)
+            os.makedirs(pkgd)
+
+            normal =3D os.path.join(source_root, "nested", "normal.c")
+            special =3D os.path.join(source_root, "nested", "name with ; s=
paces.c")
+            leading_dash =3D os.path.join(source_root, "nested", "-leading=
-dash.c")
+            recipe_sysroot_basename =3D os.path.join(source_root, "nested"=
,
+                                                   "recipe-sysroot-file.c"=
)
+            internal =3D os.path.join(source_root, "nested", "compiler<int=
ernal>")
+            built_in =3D os.path.join(source_root, "nested", "compiler<bui=
lt-in>")
+            target =3D os.path.join(source_root, "nested", "target.c")
+            link =3D os.path.join(source_root, "nested", "link.c")
+            ignored_src =3D os.path.join(source_root, "recipe-sysroot", "i=
gnored.c")
+            ignored_native_src =3D os.path.join(source_root,
+                                             "foo-recipe-sysroot-native",
+                                             "ignored.c")
+            second =3D os.path.join(second_source_root, "second.c")
+
+            with open(normal, "w") as f:
+                f.write("normal\n")
+            with open(special, "w") as f:
+                f.write("special\n")
+            with open(leading_dash, "w") as f:
+                f.write("leading dash\n")
+            with open(recipe_sysroot_basename, "w") as f:
+                f.write("recipe sysroot basename\n")
+            with open(internal, "w") as f:
+                f.write("internal\n")
+            with open(built_in, "w") as f:
+                f.write("built in\n")
+            with open(target, "w") as f:
+                f.write("target\n")
+            os.symlink("target.c", link)
+            os.makedirs(os.path.dirname(ignored_src))
+            with open(ignored_src, "w") as f:
+                f.write("ignored\n")
+            os.makedirs(os.path.dirname(ignored_native_src))
+            with open(ignored_native_src, "w") as f:
+                f.write("ignored native\n")
+            with open(second, "w") as f:
+                f.write("second\n")
+
+            empty_dir =3D os.path.join(pkgd, debugsrcdir.lstrip("/"),
+                                     "empty", "dir")
+            os.makedirs(empty_dir)
+
+            sources =3D [
+                os.path.join(debugsrcdir, "nested", "normal.c"),
+                os.path.join(debugsrcdir, "nested", "name with ; spaces.c"=
),
+                os.path.join(debugsrcdir, "nested", "-leading-dash.c"),
+                os.path.join(debugsrcdir, "nested", "recipe-sysroot-file.c=
"),
+                os.path.join(debugsrcdir, "nested", "compiler<internal>"),
+                os.path.join(debugsrcdir, "nested", "compiler<built-in>"),
+                os.path.join(debugsrcdir, "nested", "link.c"),
+                os.path.join(debugsrcdir, "recipe-sysroot", "ignored.c"),
+                os.path.join(debugsrcdir, "foo-recipe-sysroot-native",
+                             "ignored.c"),
+                os.path.join(second_debugsrcdir, "second.c"),
+            ]
+            d =3D FakeDataStore({
+                "WORKDIR": workdir,
+                "PKGD": pkgd,
+                "STRIP": "strip",
+                "OBJCOPY": "objcopy",
+                "S": os.path.join(workdir, "source"),
+                "CFLAGS": (
+                    "-ffile-prefix-map=3D%s=3D%s "
+                    "-ffile-prefix-map=3D%s=3D%s"
+                ) % (
+                    source_root,
+                    debugsrcdir,
+                    second_source_root,
+                    second_debugsrcdir,
+                ),
+            })
+
+            copydebugsources(debugsrcdir, sources, d)
+
+            copied_normal =3D os.path.join(pkgd, debugsrcdir.lstrip("/"),
+                                         "nested", "normal.c")
+            copied_special =3D os.path.join(pkgd, debugsrcdir.lstrip("/"),
+                                          "nested", "name with ; spaces.c"=
)
+            copied_leading_dash =3D os.path.join(pkgd, debugsrcdir.lstrip(=
"/"),
+                                               "nested", "-leading-dash.c"=
)
+            copied_recipe_sysroot_basename =3D os.path.join(
+                pkgd, debugsrcdir.lstrip("/"), "nested", "recipe-sysroot-f=
ile.c")
+            copied_internal =3D os.path.join(pkgd, debugsrcdir.lstrip("/")=
,
+                                           "nested", "compiler<internal>")
+            copied_built_in =3D os.path.join(pkgd, debugsrcdir.lstrip("/")=
,
+                                           "nested", "compiler<built-in>")
+            copied_link =3D os.path.join(pkgd, debugsrcdir.lstrip("/"),
+                                       "nested", "link.c")
+            copied_second =3D os.path.join(pkgd, second_debugsrcdir.lstrip=
("/"),
+                                         "second.c")
+            ignored =3D os.path.join(pkgd, debugsrcdir.lstrip("/"),
+                                   "recipe-sysroot", "ignored.c")
+            ignored_native =3D os.path.join(pkgd, debugsrcdir.lstrip("/"),
+                                          "foo-recipe-sysroot-native",
+                                          "ignored.c")
+
+            with open(copied_normal) as f:
+                self.assertEqual(f.read(), "normal\n")
+            with open(copied_special) as f:
+                self.assertEqual(f.read(), "special\n")
+            with open(copied_leading_dash) as f:
+                self.assertEqual(f.read(), "leading dash\n")
+            with open(copied_recipe_sysroot_basename) as f:
+                self.assertEqual(f.read(), "recipe sysroot basename\n")
+            with open(copied_link) as f:
+                self.assertEqual(f.read(), "target\n")
+            with open(copied_second) as f:
+                self.assertEqual(f.read(), "second\n")
+            self.assertFalse(os.path.islink(copied_link))
+            self.assertFalse(os.path.exists(copied_internal))
+            self.assertFalse(os.path.exists(copied_built_in))
+            self.assertFalse(os.path.exists(ignored))
+            self.assertFalse(os.path.exists(ignored_native))
+            self.assertFalse(os.path.exists(empty_dir))
+
+    def test_copydebugsources_ignores_copy_failure(self):
+        with tempfile.TemporaryDirectory(prefix=3D"oe-test-package-") as t=
mpdir:
+            source_root =3D os.path.join(tmpdir, "source")
+            workdir =3D os.path.join(tmpdir, "work")
+            pkgd =3D os.path.join(tmpdir, "pkgd")
+            debugsrcdir =3D "/usr/src/debug/testpkg/1.0"
+            mapped_debugsrcdir =3D os.path.join(debugsrcdir, "mapped")
+
+            os.makedirs(source_root)
+            os.makedirs(workdir)
+            os.makedirs(pkgd)
+
+            sources =3D [
+                os.path.join(mapped_debugsrcdir, "missing.c"),
+            ]
+            d =3D FakeDataStore({
+                "WORKDIR": workdir,
+                "PKGD": pkgd,
+                "STRIP": "strip",
+                "OBJCOPY": "objcopy",
+                "S": os.path.join(workdir, "source"),
+                "CFLAGS": "-ffile-prefix-map=3D%s=3D%s" % (
+                    source_root,
+                    mapped_debugsrcdir,
+                ),
+            })
+
+            copydebugsources(debugsrcdir, sources, d)
+
+            self.assertFalse(os.path.exists(pkgd + mapped_debugsrcdir))
+            self.assertFalse(os.path.exists(pkgd + debugsrcdir))
+
+    def test_copydebugsources_moves_externalsrc_relocation(self):
+        with tempfile.TemporaryDirectory(prefix=3D"oe-test-package-") as t=
mpdir:
+            source_root =3D os.path.join(tmpdir, "external-[source]")
+            workdir =3D os.path.join(tmpdir, "work")
+            pkgd =3D os.path.join(tmpdir, "pkgd")
+            debugsrcdir =3D "/usr/src/debug/testpkg/1.0"
+
+            os.makedirs(source_root)
+            os.makedirs(workdir)
+            os.makedirs(pkgd)
+
+            source =3D os.path.join(source_root, "real.c")
+            with open(source, "w") as f:
+                f.write("real\n")
+
+            relocation =3D pkgd + debugsrcdir + source_root
+            relocated_name =3D "-relocated with ; spaces.c"
+            os.makedirs(relocation)
+            with open(os.path.join(relocation, relocated_name), "w") as f:
+                f.write("relocated\n")
+            with open(os.path.join(pkgd + debugsrcdir, relocated_name), "w=
") as f:
+                f.write("old\n")
+
+            sources =3D [os.path.join(debugsrcdir, "real.c")]
+            d =3D FakeDataStore({
+                "WORKDIR": workdir,
+                "PKGD": pkgd,
+                "STRIP": "strip",
+                "OBJCOPY": "objcopy",
+                "S": source_root,
+                "CFLAGS": "-ffile-prefix-map=3D%s=3D%s" % (source_root, de=
bugsrcdir),
+            })
+
+            copydebugsources(debugsrcdir, sources, d)
+
+            copied_source =3D os.path.join(pkgd, debugsrcdir.lstrip("/"), =
"real.c")
+            moved_source =3D os.path.join(pkgd, debugsrcdir.lstrip("/"), r=
elocated_name)
+
+            with open(copied_source) as f:
+                self.assertEqual(f.read(), "real\n")
+            with open(moved_source) as f:
+                self.assertEqual(f.read(), "relocated\n")
+            self.assertFalse(os.path.exists(relocation))
+
+    def test_copydebugsources_ignores_empty_externalsrc_relocation(self):
+        with tempfile.TemporaryDirectory(prefix=3D"oe-test-package-") as t=
mpdir:
+            source_root =3D os.path.join(tmpdir, "external-source")
+            workdir =3D os.path.join(tmpdir, "work")
+            pkgd =3D os.path.join(tmpdir, "pkgd")
+            debugsrcdir =3D "/usr/src/debug/testpkg/1.0"
+
+            os.makedirs(source_root)
+            os.makedirs(workdir)
+            os.makedirs(pkgd)
+
+            source =3D os.path.join(source_root, "real.c")
+            with open(source, "w") as f:
+                f.write("real\n")
+
+            relocation =3D pkgd + debugsrcdir + source_root
+            os.makedirs(relocation)
+
+            sources =3D [os.path.join(debugsrcdir, "real.c")]
+            d =3D FakeDataStore({
+                "WORKDIR": workdir,
+                "PKGD": pkgd,
+                "STRIP": "strip",
+                "OBJCOPY": "objcopy",
+                "S": source_root,
+                "CFLAGS": "-ffile-prefix-map=3D%s=3D%s" % (source_root, de=
bugsrcdir),
+            })
+
+            copydebugsources(debugsrcdir, sources, d)
+
+            copied_source =3D os.path.join(pkgd, debugsrcdir.lstrip("/"), =
"real.c")
+
+            with open(copied_source) as f:
+                self.assertEqual(f.read(), "real\n")
+            self.assertFalse(os.path.exists(relocation))

