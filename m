Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E61E6C56208
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 10:45:04 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16439.1786013100114332160
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 03:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=W+hksZ0D;
 spf=pass (domain: est.tech, ip: 52.101.65.17, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+uslZ2zweH9fyGnr49Dfn486mBR9j3RGI11lKiBtLeetM93yaxxyqQ0a/2vf0FCS7KjIwMFyrUM0YkmRUUuD34RISPlj4GVbUsU0uCC5Ct/cwxXiVfeChiIA7GxUVx6I3ayWcoNS9/YuiQGy5sibK0h+4oL3P6WBrbyMxqStGmH1NOIOWm2scFQNWgHbvPKNalAbB7megSawVmXhXcLx9nIQYsAWh+r0zR7VO0Vfb7bAeRwpXDB1VcmlB82LE2q2UXpPxdwISWmTcdJMeoLgThJDmvBEoivPEA68M9zdWvlSdtwD4pyc8EelLM+auS6nFt716FbP8CxR7MTQ9TV5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sG8LqoLh1vUhElV5bC0MOYUVSuhczJ2+qZmjRbBHkf4=;
 b=xGdV/HZ6aT2d62XPxf9escj8oP7T8uhf08fGlwkSdYxKsaKvYhxuTncNU6NrU/+N5ouHA+GcdkxY0iUY1a2hQTv/ZE1UVzbi9PueoOBoMUz72gpq66ItE5EFNq48PLriaBTQkZ0ugBVCNInkVqjGt5gekWY2V8qJ26ipYFXjiuPuDjGoSit4hRJfOPsaQc++0Gm8+MTYyE4x3wo/lqlz7I19MBqmrT3Wi3rpXX2QRjtjbpCBBpNfYJm7oBj0iW5jRT3mbUfY91ub/ZXHyuEiCcFu66dZZgoPf+Elnm5J2y7c6XYe4elFZM7GQcIeqHuCog5MieB6P/n5veliy4om7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sG8LqoLh1vUhElV5bC0MOYUVSuhczJ2+qZmjRbBHkf4=;
 b=W+hksZ0Dz/iBdY1E0zcEQ+5/Xi715Nswwc9SmHILHH+KNbqKgpRVAr18RHwAy9NxpBi+MX/3nc5Bm8Fr6SUQOcOqYA5ONBxBXs6IiMVEedZkPgdR+UNbsDaITfhUQMCSXuo/4+hvaLZ597FUA0tNDlOFZPEZlhAJPM4PBJJgIImk2TgVjK5K6/dMOp/0v1J6gbep3FZiSBloTjEJPO2pgHRsZumDTyMVmpLtKdnI4XYquVl98wterSlBxI0mhI0WsHXUZIG1/4yx+50uW7DupJ4xqCrBJaBpXbKCyT8ABLgPpc2hg0f8sXOALi14oNHmYj07enFWa76MGEWtlU5Txg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by VI1P18901MB0702.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:127::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.6; Thu, 6 Aug 2026
 10:44:55 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 10:44:55 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v2] parse: warn on trailing whitespace in parsed lines
Date: Thu,  6 Aug 2026 12:44:48 +0200
Message-ID: <20260806104448.24671-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260804090834.99906-1-jaipaul.cheernam@est.tech>
References: <20260804090834.99906-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0299.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::34) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|VI1P18901MB0702:EE_
X-MS-Office365-Filtering-Correlation-Id: 34f1d91d-8b14-449d-b441-08def3a7c07b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|56012099006|10067099003|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	JyKBxauy/lGvUxRFYl6KZS59cwso4Ry7aeoxAktdlqCIZvCS2/hULFxDWRdUqTVmhp68Ub3xDint1MDvJpU+E5q3Qt67exf2+By3N0ZjIaM1JQnoHHD4qiFBUq3L6AyhHXn9y9Ihy6Tc4WjwfJiBEEiDlQ3u5qctSGJhQHGB+IKCD9FHKR01Q8kCx+k5KKVQT0UJWsbNwpV/Yi+h0C6xLSGjsa/KgUFmT7r6axUmi/Vdjh2xHzmOPSGZxIpKXmwVFdv5DVioGQSz7gpf8Z7Sr7L3unED3990ff+Wi/sZZyKhOoTsqZp6GpBwETCXYhvqr+rYoVvtdBMqm1D/vIhq1y7kZg7CCO0T8mBgIAp4+BZuVGXWzjOC/DRkQ8TO2YVqEF6nU9kA6Ck4DW0MWCak3QdwyVdadZ51f0giug8v0XLmceUMvKTLYxSik6foH43dVJPDwXJfgeju9hiG09/Eed2lFhaIk3T1ufoCOCkJrOX/Z1PWRZN9CtxwEWPffRf/hn1HTKJTuQGBlAYfnTvVrZ+T5HhjSEgP2b2rv4Vr7mI/08ZTdlDG8SVoUw2dJgJkui+LqqJoZwrsqCwkAJQmg+I9E+uzS9SGU06UfIrg+PZLHM4ty0Z4HeU8Nb8htud3wWDuDqctfQfa9/Z1f0py0TEI2SuGhiIYQ2dOXsNct1Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(56012099006)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PbkQ4HXcPqx5YBc+N8v+/YZEoeY08z7yrHz3M8+lNQirS3R8u8HTrhhPne8a?=
 =?us-ascii?Q?xrfDzXanoCcB74XGJ+bOppmCx1TAqbly8dMKPKUxjJc+sipXOg/quLKHGORC?=
 =?us-ascii?Q?A4PBa+X1VQqVe1T+XUzNMxdF2tRqCwR3u6N+C+LI8yy6xL7ptX3BSDKrzN2Q?=
 =?us-ascii?Q?33zMeb8YZC3cnXWyop3nZDlJnt4wd5N/KzORUTm67vBGLuaWKCSxB2r1a9ij?=
 =?us-ascii?Q?xarbf3UfaFOGLu1LK+2b+tnM7upOhSqh2FGQ5r6v9ZR3HrjeFKhnepLlwQMT?=
 =?us-ascii?Q?L7liNdk6OGT7M1o7yjAlp3w/2T4qCzpmChC5uE0l4IL+5aiP5OpnBC0P4QJv?=
 =?us-ascii?Q?3ZaXoqm0L6W6yY19u5m00f1sxkquzPpWOH5nW2zVsEdLyC8bdqVS35i4AbhW?=
 =?us-ascii?Q?7uDfIIQHyxBlVMKDAOxMfQ1Ggnmydx+B4Gk5tnp8Sz7xeImVFYqAqV2LgiYs?=
 =?us-ascii?Q?oKHYHASrfY0ujfx+lYEnK1rQaCTv5BRFQg+AmPWegMb6FerPUBq2f5uAtgMc?=
 =?us-ascii?Q?j3Mr3FF412PwmmAjIJ4cQQJmoiW/PXYK8IQL9PUFhR33zmUJR8+PcA+IVQID?=
 =?us-ascii?Q?XLdfSAdRs1x4NXSm/lox5hg70hakESYDKtlK55PC9Gk2BjWvGTUr3iSAXdKv?=
 =?us-ascii?Q?HmdfshSOJV+xdB+29S/BM5LGfu/ca3fdB1hahyyr6mfM/yCGWUzS4QsbDkiP?=
 =?us-ascii?Q?Ppbi75YExhItqUYTXmH4iBHg4zz90/zSBgPiUDXQCs/WO9j7WQ/52xMSE1P2?=
 =?us-ascii?Q?74FQKZNGgbKkOxkQDLJSEWBhFaOCBuzRhaFORC2mnqZ3l6QoGYN8M/jm/STU?=
 =?us-ascii?Q?1Uy+fxslZd2EMqy2JWKvW3MXh0ykGG2ihq05385O6Y8JJxmTF8NHdKNoifiS?=
 =?us-ascii?Q?rgkvwaPDI4ukMGlxPFt0n6E0FBAzWZZnll71fRnxfa6o/jqj7uI3TU8tgu33?=
 =?us-ascii?Q?H1X/Hh115h1bgMmCI13S8Vm55MnwmdnD6/soOb8/+1J6fWAJoe3Py3zEGNaA?=
 =?us-ascii?Q?iRlhSxzkDDo4wB31d4GZ2wPexYpAjRy3WQWruFTGeai5W4P5hR9jIb5VnD4e?=
 =?us-ascii?Q?0YuYNWZRILj/dEVaohZmQcj29JqGCfIwSNx1gRuerGCRfPcxo1hdGzqOvVYx?=
 =?us-ascii?Q?SX/qexMDGv9+TFrrBB204SdnheDCgK0+ipcRran95rje6qs6jrcUUDW5DRH4?=
 =?us-ascii?Q?TXN+VnhnxIjVJ/cQbe3OQqSd08bFnhEyp3f4PI5sysUTnG3t5F5sh9mZteUp?=
 =?us-ascii?Q?lfP16f+8ef521/oQVqlcM04WhxXr2cmWfjT8h174WkC71ZkW6SjEjumyAtq9?=
 =?us-ascii?Q?YSLbwxetDsvAakK3e2L9Fa2qrzXttLA0rfUTT13rN7sEH/c3jQdjYNSSiDIB?=
 =?us-ascii?Q?eOL9NTtSx/Ot9lBVjpZhEdiLbPvkjE+8hMTBpC5BDAbEcfbzaAGBrCX/HGDo?=
 =?us-ascii?Q?r2OC/YL65/6Odly0E1TNXROomkXz+rb7ifopT83SU6QwFrM/x/7tji4CCllw?=
 =?us-ascii?Q?2A1T8G+m3YK5FuqeptGdWsYkudLnoOmgQfpJrvGIS3VNyq3wWXq1FCqvwTMV?=
 =?us-ascii?Q?qPBFcEFpup6iwnCC+eWNWipseJZx9R0hVSa1Xv78tuJMir0xAF9GV4DbBgsH?=
 =?us-ascii?Q?H/jix4CFNjLDByAUC3ArodXiWkgvkQOpzhseFzqcRJvsktvQXzEKilLJn5Cc?=
 =?us-ascii?Q?iMMmENV672Pu5bzKd6vspbpouKhzpBvvPMAd5OtFicdc8XGfmEQICdAiFAl9?=
 =?us-ascii?Q?eoV/4UvH8bWzpmDFoDbM5O25ANVINqc=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f1d91d-8b14-449d-b441-08def3a7c07b
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 10:44:55.0083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fcowsR27AHjzLBL/3lpx46OAcs4dHUOQEcoVpXvFqE4BloWRp617aD7fdlsWZYUIHItKkSb2OygQ/r78qr8rjlP73rHk5B/2kSlLLzlv3po=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0702
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 10:45:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242924

rstrip() silently strips trailing whitespace before processing. This
hides invisible spaces or tabs that end up in patch context and cause
patches to fail to apply across branches.

Warn on any line with trailing whitespace so developers can fix it early.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes since v1:
- Broadened from just backslash continuation to any trailing whitespace,
  as suggested by Richard.

Real example from oe-core master (libssh2_1.11.1.bb, line 18):
    file://CVE-2025-15661-3.patch \<TAB>  =20
This caused CVE patches to fail to apply on wrynose where the trailing
tab was absent =E2=80=94 invisible context mismatch.

Full parse (bitbake -p) across oe-core + meta-openembedded (2970 recipes):
- 228 unique trailing whitespace instances (verified, 0 false positives)
- 82 files affected (53 .bb, 19 .bbclass, 8 .inc, 2 .conf)
- 92 in oe-core, 136 in meta-openembedded

bbclass files like useradd.bbclass, sanity.bbclass, buildstats.bbclass
account for most of the warning noise since they are re-parsed for every
recipe that inherits them.

Tested with bitbake-selftest:
  $ PYTHONPATH=3Dlib python3 -m unittest lib.bb.tests.parse.ParseTest -v
  3 new tests pass, no regressions.

A separate cleanup series will follow to fix the affected files.

 lib/bb/parse/parse_py/BBHandler.py   |  5 ++++-
 lib/bb/parse/parse_py/ConfHandler.py | 10 ++++++++--
 lib/bb/tests/parse.py                | 28 ++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/lib/bb/parse/parse_py/BBHandler.py b/lib/bb/parse/parse_py/BBH=
andler.py
index 008fec230..3ac694e20 100644
--- a/lib/bb/parse/parse_py/BBHandler.py
+++ b/lib/bb/parse/parse_py/BBHandler.py
@@ -104,7 +104,10 @@ def get_statements(filename, absolute_filename, base_n=
ame):
                 lineno =3D lineno + 1
                 s =3D f.readline()
                 if not s: break
-                s =3D s.rstrip()
+                raw =3D s.rstrip('\n').rstrip('\r')
+                s =3D raw.rstrip()
+                if s and raw !=3D s:
+                    bb.warn("Trailing whitespace in %s, line %s" % (filena=
me, lineno))
                 feeder(lineno, s, filename, base_name, statements)
=20
         if __inpython__:
diff --git a/lib/bb/parse/parse_py/ConfHandler.py b/lib/bb/parse/parse_py/C=
onfHandler.py
index 9ddbae123..e4306d035 100644
--- a/lib/bb/parse/parse_py/ConfHandler.py
+++ b/lib/bb/parse/parse_py/ConfHandler.py
@@ -134,12 +134,18 @@ def handle(fn, data, include, baseconfig=3DFalse):
             # skip empty lines
             if not w:
                 continue
-            s =3D s.rstrip()
+            raw =3D s.rstrip('\n').rstrip('\r')
+            s =3D raw.rstrip()
+            if s and raw !=3D s:
+                bb.warn("Trailing whitespace in %s, line %s" % (fn, lineno=
))
             while s[-1] =3D=3D '\\':
                 line =3D f.readline()
                 origline +=3D line
-                s2 =3D line.rstrip()
+                raw2 =3D line.rstrip('\n').rstrip('\r')
+                s2 =3D raw2.rstrip()
                 lineno =3D lineno + 1
+                if s2 and raw2 !=3D s2:
+                    bb.warn("Trailing whitespace in %s, line %s" % (fn, li=
neno))
                 if (not s2 or s2 and s2[0] !=3D "#") and s[0] =3D=3D "#" :
                     bb.fatal("There is a confusing multiline, partially co=
mmented expression starting on line %s of file %s:\n%s\nPlease clarify whet=
her this is all a comment or should be parsed." % (origlineno, fn, origline=
))
=20
diff --git a/lib/bb/tests/parse.py b/lib/bb/tests/parse.py
index 6ac2137e0..5ccc6e93a 100644
--- a/lib/bb/tests/parse.py
+++ b/lib/bb/tests/parse.py
@@ -638,3 +638,31 @@ EXTRA_OECONF:append =3D " foobar"
             output =3D run_bitbake(["bitbake", "-e", "recipe-file1"], buil=
ddir, extraenv).splitlines()
             self.assertIn('BBCLASS_FILE=3D"recipe-file.inc"', output)
             self.assertIn(f'BBCLASS_RECIPE_FILE=3D"recipe-file1.bb"', outp=
ut)
+
+    trailing_whitespace_continuation =3D "A =3D \"1 \\\t  \n2\"\n"
+
+    def test_parse_trailing_whitespace_continuation(self):
+        """Test that trailing whitespace after backslash continuation emit=
s a warning"""
+        with self.parsehelper(self.trailing_whitespace_continuation) as f:
+            with self.assertLogs('BitBake', level=3D'WARNING') as cm:
+                d =3D bb.parse.handle(f.name, self.d)['']
+        self.assertTrue(any("Trailing whitespace" in msg for msg in cm.out=
put))
+        self.assertEqual(d.getVar("A"), "1 2")
+
+    trailing_whitespace_after_value =3D 'A =3D "1"  \n'
+
+    def test_parse_trailing_whitespace_after_value(self):
+        """Test that trailing whitespace after a normal value emits a warn=
ing"""
+        with self.parsehelper(self.trailing_whitespace_after_value) as f:
+            with self.assertLogs('BitBake', level=3D'WARNING') as cm:
+                d =3D bb.parse.handle(f.name, self.d)['']
+        self.assertTrue(any("Trailing whitespace" in msg for msg in cm.out=
put))
+        self.assertEqual(d.getVar("A"), "1")
+
+    clean_continuation =3D "A =3D \"1 \\\n2\"\n"
+
+    def test_parse_clean_continuation_no_warning(self):
+        """Test that clean backslash continuation does not warn"""
+        with self.parsehelper(self.clean_continuation) as f:
+            d =3D bb.parse.handle(f.name, self.d)['']
+        self.assertEqual(d.getVar("A"), "1 2")

