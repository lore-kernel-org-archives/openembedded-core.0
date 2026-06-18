Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE48BCD98F8
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 15:58:04 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23044.1781798274316705747
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 08:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=MbPAdWJ7;
 spf=pass (domain: est.tech, ip: 52.101.66.67, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUFWIWXTOzBWXz/uXiFC+syf/93kbfP7fW3AZJEo7pt3ITASFe+dbj6n4lh0oR5rSgWRjFYtsnGoWJtYhZZTwLvA9bFi4LaHlh4NppVG96Y9rP8z6QMOgCpjE/kdRbqJ7f2JDEqYB27phEoj0NqOV1AgYnnWEWh4rlFSCTZIV5rRiRKJE6aRsit/gHcAugrprBivTH30rlPR7E8zNbDYGdKCzqUv6Z2yvn+SfrhW7W1Yby3lc0HxYsvO3AXZLGRXXb1DRj6wbtoZWmKWg0CQgbdwZRuhn5+dJNFeQM3UpNG8sZVQXVNmtQJVfFPbfnh7mo73MvMm0Id+Quk6coRjhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziTmeqtNbOWDoJN6xGRsqIDQRwUmFWu2GFYpmpdhjkI=;
 b=gJBxomdGDia9m5RjdTcGRlXVdrLfHAQ4en0qlX2uaFppnpSycShoyePdRNYo7wcq0Yjk3wl9wre55i+UBGXPyo2ixlMJgRa7mu5RlVh04H9CMXQFvW6+1PA9CKOyEbU1tLZqH1lqA6EbhViY9MgtELPXNP0p7ci/Jj2JrISroYfIgI6PuRgMb2tJpo9j1pztNCO0vLnnHAKhaWADEj5V1mU4XTDtsu9NRFEA3t65CwcBuHXf2p4RaqApAIsqMkxl8uNih8cyLts8gWxvGZjl1Y2rqAjPbk12taWimiFdzNCE+FSgQT2DfDpLV84iwdcw4TTVJn2PAn1EBoU6QDMNHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziTmeqtNbOWDoJN6xGRsqIDQRwUmFWu2GFYpmpdhjkI=;
 b=MbPAdWJ7Yjew4v6B6d/0kBBBNo8a8SFipIwlj+r+fwGZX8fVLIhUTttC9CuNEnjh4eOm+8VXcwAnN9W5NjLYTyxcIp86frAhMNNGVkvndqGJSCDPQ/OhtBREp/JsgBWexWZgglnJWGaCfBVwx7Bv1xIj1BOBJWSFTwJsYTzi7RlY/o29Hg6oso4lYF/qB0guiWo9SEcid9NKUmkIlH+ySbq/OhAKqxZicsQqtF/ZUoW6s4EL91qeBMtst7F0H2/B9DDeeVpsN9qWte1M82gvvB/R2G76+BmtaGSkXrMLRCfWtsvsTcg58K+sySml0CEGkm4cUWHhMk4SjQR8DGBdfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 AMBP189MB3277.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.11; Thu, 18 Jun 2026 15:57:54 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0139.011; Thu, 18 Jun 2026
 15:57:54 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>
Subject: [PATCH v3 2/2] oeqa/selftest: add copydebugsources tests
Date: Thu, 18 Jun 2026 17:57:47 +0200
Message-ID: <8aab102dc05984d47067c2f50c834b1ac71a1554.1781796358.git.anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781796358.git.anders.heimer@est.tech>
References: <cover.1781796358.git.anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU6P191CA0017.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::28) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|AMBP189MB3277:EE_
X-MS-Office365-Filtering-Correlation-Id: 806c1281-0e40-4d48-35db-08decd525bf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	m39XcYoe6yS0Wy7n8OOHINkvsdHLM0PUje4YyWZvEf5g9nGNSIr7ZRDdXt/f8F1gqgE/OAiV4zuCS20f+Cz+FcF19HxRvyzUoLtTTWe25tl3TK2TmDR4wNg2LmvuTRg2OvbeX5Qf7sYkGRcjQXGqZyj8CCt0e8M51MkudHfIfv53Bfme3Xlm3JPHhvuQTPGe1uLzakMhV8fyokkkE1Z4itjZjW3sZluyzkmzePhv6uE0dmb853x3nyI51CMRv4+TnoZ5SClIMupSMGjUVns2BMPzXMNW3D7xxVhH3WaqwZwGnMzuySskIJxBppaE4HQGZKzxo38l2hAHtTQQHjgyeRCztckQDS+3+qZaWCCCrPn4D51v/2K+P+r4jt9uG9hKf1MBaI449FgLNck4stp6y12e3XywgFaZaSYYh8zauDQzAT3u9nZ5vHjbtl6zaGwtFKSMd7vFHI0M//MPVN43gSRYqNLf/WzXSqgHdzKcix91ADdX5+QKG+KDpib6/kdcFCUXMExEe/ydU0yjHEHlaRvrFY/yE4v/u2FNslYo0KXw0PMZZ+AZ1+0yn89RPG9+EqwasZOFUEZ9PB2AllWhnPFFhX0GG9MO4QBU70K91tFjgLZRiZw0Jj1oWPNZWp0/4c7etlFVhXzTytlPvVQ0RNml+qxRC46bKr1saYHIbWy9gwG8daJ3i/0JUbdwt6MR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EUI8MDC/BWAXix/d7ExEMbcP/bN/mylX9iKzbDABp+yo2GGhBdfQJzF8dBxP?=
 =?us-ascii?Q?eflWzYpJJ3mM3McXJ7ZtSp/0SyJm7c+1csMnE3uYCrlTL2djXkgE1Nz/gJnw?=
 =?us-ascii?Q?BBPIBpD0t+8mN4ImYJmYu+LIxeo1izbKF3J9AdvBREP0o40STG8jCY4kp5Xl?=
 =?us-ascii?Q?rz/ZBKlNLk2eyQYdML6kSecqcHBGWVxrn+zG3qtg5Wd/uKX9AmdtKKr0tGzb?=
 =?us-ascii?Q?vE1DBg1BUJrz21mvB5WKG5kjjATOgslW2ZUDn8X6GdUvNMIdoPxME0XLpViT?=
 =?us-ascii?Q?Rp43s0XVWz/uKiIqZX9JHeBFs4opF2XXZ23TiMWRg6/EttuE8HvRJpOPCFW5?=
 =?us-ascii?Q?3aj1fGDOb93PX0YdpRtXUlTe8r+Zlh4nCS2Dn5mCLNd7UXEyW1TxIozgXUEd?=
 =?us-ascii?Q?qFv63/wRhs78s+PEqVufz2Ys2o4JsSLJPQdBdDY7eiQjcMrnbAm4vrD00Cze?=
 =?us-ascii?Q?ZtcVmF5vAne0K+jhhQs/EMOPBSvkKxC2d/f58OHcWSzMmOC3ZEzk4VSrCxZ6?=
 =?us-ascii?Q?Hhby4zsSgM0WqHu0CwUfin/FcsTTPKTVTRrJrqUZq1zUAe0JrwOpWv6KupPX?=
 =?us-ascii?Q?w8BSvLaheVeBCrzbmvnhDGHBuVEturqCyJQG2yGM37ACsjGd8GjwzmM6JB7i?=
 =?us-ascii?Q?ijKLFx0Y/Q7C+ZtTw5zjCMf/yHzO60pLUS9GbOu4sWhzt1x7BM3wU2o91kzr?=
 =?us-ascii?Q?VRTi1E+qNgUmck+013VcgbfuuinDoOG7RKTcWWFrTj75YaWTyAbUp/+Ugnv4?=
 =?us-ascii?Q?ElVE1050h3uYIE8aS6CBgk2nxz8W6bshVOHCahteDzIyMYN3w3nytkjGbfbs?=
 =?us-ascii?Q?5RAkLJLPEwulOojggqABI1UFq+2+UplL1H8LtPj8xxajorcHxufK3yRx3tms?=
 =?us-ascii?Q?vhaa3UphCK2ZzYPnsXoaM4QFz7ImtcWJJ8RYMU713+9NjC0YfXV14E1kmCFs?=
 =?us-ascii?Q?FckwCEZkF7zBvZ2HqWEsbyY+3pw3hRqdE4J9TPSdWM3XJI/Ufk1OIyXnbt7y?=
 =?us-ascii?Q?/2Hk+qS6xfVUao47bJSpFdft6m9YZx7uguGeHaT8iCCigFoaidZUR1dZ0R6p?=
 =?us-ascii?Q?quGGstVvajvPwStNy47H1m5U3ZKpY31Aw5D60sFV9o0cwpTBjz01qPPs/MLt?=
 =?us-ascii?Q?V5tgw91LzgEgBa1JWfb3K7km+iDHvNVoGJxmnjyPbFwLKUxFEEgHJaJo1EaP?=
 =?us-ascii?Q?nNCMeuk8Rz1dm/n7xgzwGxg5b7xLg3ctIEarihpHZe5Wp7z2NSlhnp/gwX5S?=
 =?us-ascii?Q?753I34ZxkVBQgCIq1aSMucL+KbVRKlc34CTgw9bdhx5y1zy+tQ4ZQumB4Yzp?=
 =?us-ascii?Q?Gl3+psn72EMPi1zdlnj8kuWKJAbX+/2hxTjcFHGQsUnYi3aUXyHe9xmEinzp?=
 =?us-ascii?Q?tyKNoGqVUpT02xF2ZEEc8+j2+PveSH7Z6tplA1Py+xkuEAgY7F99AVX0NH1J?=
 =?us-ascii?Q?SNWwvvU6DyPftO5mWbBD9Ef5v93vrmM9XlJTLbpUUCUjFaxNMJTdSLTD+Eor?=
 =?us-ascii?Q?yqA35uJb1DanQRnRmVRDISC2cjiS+KATsoDa4HKINdHSYsiuikkxABY9rQH4?=
 =?us-ascii?Q?kEBQTyzi5iZhj282MvrxD+XpUq6Go7G4kBIklTNWrfUKcTgtUuzQp6Jb3dia?=
 =?us-ascii?Q?NIcAW89U4Qub5jDhoph9oF1U9G28Lya49uN0ZC6sBVJ+qc3jPJPJnypyLuS1?=
 =?us-ascii?Q?5su3V9/dUL20djSsD68e3dC6big2tdY2OS4UPfJAY2hJoG1eIQo0ddsxxfzx?=
 =?us-ascii?Q?n4nTUAC8AQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 806c1281-0e40-4d48-35db-08decd525bf0
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 15:57:54.7365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FGNvLepPeYj7WBbsZs/h1uryI1BYhc9cdVFUIF2tmbgMd8BSwTExy5ANoVMLh2/Rs/wFGOEX9TMVNIH/JS2wIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP189MB3277
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 15:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239089

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
 meta/lib/oeqa/selftest/cases/oelib/package.py | 265 ++++++++++++++++++
 1 file changed, 265 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/oelib/package.py b/meta/lib/oeqa/=
selftest/cases/oelib/package.py
index 5751057a8d..d1b0e2ed4f 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/package.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/package.py
@@ -6,9 +6,12 @@
=20
 import mmap
 import os
+import shutil
 import tempfile
 from unittest.case import TestCase
=20
+from oe.package import copydebugsources
+
=20
 class TestKernelModuleFilenameFilter(TestCase):
     """
@@ -106,3 +109,265 @@ class TestIsKernelModuleSigned(TestCase):
     def test_rejects_unsigned(self):
         self._tmpfile =3D self._make_tmp(b"\x7fELF\x00" * 20)
         self.assertFalse(self.is_kernel_module_signed(self._tmpfile))
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

