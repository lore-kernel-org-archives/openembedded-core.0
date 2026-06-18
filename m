Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBBDDCD98F6
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 07:19:22 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14004.1781767159077588388
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 00:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=e528wCeM;
 spf=pass (domain: est.tech, ip: 40.107.162.28, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q07cdIFyy+mYVWna3/xJ+2asdhiXT0vmoCWVwK4cgicyjMLY1UzV3mGI8prLloxKA4OPtVaIoaUQofPhrSc3fBE10coEUDtP5VCgUJ5MY0qZdyc5WNXNPPiVhpQ1vDMbdThi/F5VekHpVMKhH8z6144p42Jpdj1izJayPfQYyXa6kX9WWCmAOs/P9S64Q00mNWppq1tSBp8/2VukYOD995admBOKsVL7wPFugmfSqG/oqNV5D9Y/nqZHqQKQmHpwXmCWkK8uH9w3J4pQ9hqF7t+uNWuedkPCj3ggtReWB5qHxI0tnbBsfc9imQOvwpEwiI1j5FRJPghXPCcKOd9KkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbNb9p8AI56i2AXGYO3COLbbTRphiS/7WrzAqNrgI1w=;
 b=IdKKfp007ZxJxTRa8Sxsyes5tpMPfErqc8aSY/KmNbHRU9Vj6o1m2gtzRbqA5MyxSuUg8atugAw1fnJvL0Ke0T2pp1Kz1YHNGWnrcX4lH3liC2fGC3bTMYUNVy2PVv3Tpt3rYqOu3dXs4JQv5WFY9jLadmmDQQ43Ccxmuu5mBvpFeUQbTlS9PwVlvcpK5EzEODuzNaXhtZwE+3i6BdndKtsfMjI2TdmNLC4RDDwwt/GFuUkMz6rFzgpQ/aL79XmrgVlBKIKCnUFhZ+ZgzRkdf2aJcYh6jmX2DYxsNRpF6t5sIxZD1RKYE4vf8CJ7VD0VQ4WvJqakNeuEzFKSg3NF0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbNb9p8AI56i2AXGYO3COLbbTRphiS/7WrzAqNrgI1w=;
 b=e528wCeMuSJ4MeY/laOSGup1qU+xFfYnDD4W0FwE5PJbbSjiWKlQ2enooCyaTM/T2GKDIjOnmHoT25NHtOznpCKHgkmoREKMD6zKA9Ji68pIs+gsCbMn6pP59w2GyG5SI7As37sHFycZXAmdvXKI1RjbZvBFQBlVl9n72ALeuJm9U3hKzUzFkNW/Puv/7IFicstiNcSq2FQHxaZ7oUh6Ib3qlV/vJVCQWBb/WIeU/a97trNiVrcgccpsrx89uCWrAjGuUIFtmNirZegs+AJMc871fEc/uditE7AsFN73gkCiN7QXWHFAMY63RvPUP4DjAoVQpgtP1MrTXoX9VZpEpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 DB8P189MB0840.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:16f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.13; Thu, 18 Jun 2026 07:19:15 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0139.011; Thu, 18 Jun 2026
 07:19:15 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>
Subject: [PATCH v2 2/2] oeqa/selftest: add copydebugsources tests
Date: Thu, 18 Jun 2026 09:19:08 +0200
Message-ID: <6544c23dd1abc78b8e2cfab1aab64b779a23b59f.1781766061.git.anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781766061.git.anders.heimer@est.tech>
References: <cover.1781766061.git.anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0341.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::22) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|DB8P189MB0840:EE_
X-MS-Office365-Filtering-Correlation-Id: f4407b2a-439d-4ccd-b320-08decd09e714
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	CXlRD4FtsdkrLtm1PMzeXX9pmotT54VfQQW8aqly9QfaCMgYtH3lMTcbcyb5UIPh6BW6Oi6wHStDd26I+eo6qE70vWL1IpZ7zM17HdpAlrwsPUbfS9vrtYkREIW4JhYVhXRq5ax498QFKUYZkFuKzp/BicuOD6djccEmW7LqW8/vqXNc2ibrjZUVHEhvF8w6/5zLskk1SOUfHQjFLuh9srAL3DyQ7j0o6QiVLi5zhKWZWELOM+OnHE+E38q4iuy4hh3jk4mkfk8NbKCui9U4iKZwUD/9YKK+POD1RCiikdIL4cof8ddeXoxMjOBcOS2Qf5oswr8S0/hvyQ6qHiyumPVx2/Oav4tNe9OgOI0jCinSpHMHW+zoq0AAklwI67j4fxfodl1Wl1FsI/XBNv0cxsTCB1uXbz6yUaaRB/J7IS2hvf36wIrwm6YLvWFRb43Nr0kHOCkLJW42TgNzL0sJWPar4HRmkxWLxkuvZAqCWaLBh8dIviKoWURXiOdQr9mVgTy9LoatHnfWYr9N3vLeQDfu7UiiyFW9FkFFut86+qD3GnXCuvyRzQYu3ius9956Mm8nByAa9pOr05vo5m1CSF/WOzR4RB5i+00xt7GocqaYmSo+Jw5u5O+SNBfM6lpcHFTW6jrW/T43keJmQUdjug3v8PWN830wAGL0XEk5/Fh9fNBRlGXQpi95jkXq/1PE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QLHBy7lAtxxjAgrsSwP819x4XMZ+cPgjkoUUbu33kDyPCUOOp28uzsLui0hj?=
 =?us-ascii?Q?RWpCKOGhJ+VY6BX3dHEzQNr3tAvNYo7yq5KDqCo3W7ms+At9X4dgEttnUxyz?=
 =?us-ascii?Q?lbzTVM84EYdng4D9HARm1zY5xbjTh2w8JuHHPLn/TkjhDOKgTJ8mUxTM6z6b?=
 =?us-ascii?Q?cK6SFk/VON9mnMbXHHh6XwDP2c3IiBZ18X2gjSoZPy0s/pqR8LAKYJcCSvD6?=
 =?us-ascii?Q?GO59MZEXANt+7lTRHQxgvL21vklu/5R0UA+4m+NOVvrPOkX59KlJntlnILZ0?=
 =?us-ascii?Q?wcnc8plurO06f3EM0Z0wP95k9skQy1hZUko7wu/mfvPveiQAzDIWFjd0bL0X?=
 =?us-ascii?Q?GNDlahVdxDlOJVzUNDljVJCgHqOcsY1EtKGdMGaRbDH45lEAb+NcL2Ga3zgY?=
 =?us-ascii?Q?mG5xl4cU4BH/TH5+A5J/1TBtDj78RrEWpyJUePQtDrogdK2lQIiJ10zMEiSt?=
 =?us-ascii?Q?kjApZSFoNaSPgkF+5Llx1nBaG8QkTHxqb4syVvrnWMPxYW6NzbP1XxaAth5/?=
 =?us-ascii?Q?su7ZqpFtEd0TX334UkwkcEn0xwAD32j7eTHyyss9IOKJzBAdrFq8nuOtNx73?=
 =?us-ascii?Q?A6E1NreoNfq5QAOLhIHC8MSgkXks+cfTmZb3Xx3ptLjL3Xn6c6T5SXkR52ZX?=
 =?us-ascii?Q?GhrtLGlElj2K0Rh2vzPxHWvNJ5xWpy7rv5lZ/LCr7JLPzTRcV88tIr+fVWTa?=
 =?us-ascii?Q?PLn0lfCvM9KG/9ACNbuWWUP6ySwFc9WlPr1IP6JgZv2B6EP+2XSjoXX/he39?=
 =?us-ascii?Q?fMfWIh5HgR8jmrH01SmvYOb2FaiO+epkDWhAedFkHCxu1bHaECLkJb7wveXb?=
 =?us-ascii?Q?d/zEF3kFo+JLc2drCMlIX+EO3qQTUwHmI4tSWgrG88LRvF9uZ2iXsHk7nUIu?=
 =?us-ascii?Q?9wO4T+L3PEbgEovUmxXs5lM+DV+KBzu6A5nppLfu4st7+CaccUj+y/dYEeao?=
 =?us-ascii?Q?zzOfR14+M5VaMasLmOhsDogu9BRQmIOOt6Ds/7D8kO7KxD4Vh3H5V362PFnV?=
 =?us-ascii?Q?4b5Z7huJB9G0W85tBNEyfl97DEoKPF7YZ1o9bHc7ccD+1x0d2hpSMdUnSzna?=
 =?us-ascii?Q?sHDBj9q0MK38AEModFka8utRg/H9Psla//qBx5s6PB719jntl57a2Jq3KPU4?=
 =?us-ascii?Q?UM8YjTsL18iPmv9nFmY3n563JOasKXqJdQp6HQLYv1SNQ4tjDXzKqfsDFmBS?=
 =?us-ascii?Q?DxnyYsSnlDV51eF4sGDVCeJelJnBoHfI25W25FlmrEY0B6/RMHAs55Ar4iGA?=
 =?us-ascii?Q?WJbdmJxEDOcA5YbMWzFEMH831qsNjCEy0525xwX3XNB11lKOfMe3xLK98czV?=
 =?us-ascii?Q?H6vkg7XKtjU6aqmwqYvU3/lOCtpo5ypYWi2c+u57tm7EtB6La2enZ+PbkRDE?=
 =?us-ascii?Q?5o2UpX4Dl0rA2PZ/nshaqEWfQVM7F8b8mtnDraSLx+QTnQwMRi2q6N1r16dq?=
 =?us-ascii?Q?hVUQ8nlb9jy8D6I2GiCt1vSt0H+bur/wrb3BZhp+KYFDY1Kqz9SEtFdwiug0?=
 =?us-ascii?Q?+MaZBaUuESM8AyVZRxBT3iUwK8MwHRW0s6hzZe5A1/4vNi877k9OCH7Nd+MA?=
 =?us-ascii?Q?2E0rpkx1/5IVO+vy9K99mHgSWV/o7lMQDdhL5vtabEf3ktxgSIznOma1WNTg?=
 =?us-ascii?Q?yXKgb8xv4l9mxAdhVRAHlIwNTbWGtJS8Rwltpilz6BycRxiv2qSMNqTQITV8?=
 =?us-ascii?Q?jYlYugnuFnOQvMGZx4qOKPk6su68/pDiruompo3Q81ChYebbCiyBgLpan9+v?=
 =?us-ascii?Q?yFpmiKk1Rw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f4407b2a-439d-4ccd-b320-08decd09e714
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 07:19:14.9594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tM0WCx2cmp6IYGvLLmFKvYT+VupNmGW9VKv+D27KQlKF/MyCoSFXq0cOTpQOheIiRAeqHWmsW9tv15k895AHuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0840
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 07:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239062

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

