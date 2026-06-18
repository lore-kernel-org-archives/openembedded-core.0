Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD49CCD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 15:58:04 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23044.1781798274316705747
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 08:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=TNYRMYho;
 spf=pass (domain: est.tech, ip: 52.101.66.67, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X5WXOJrddbmRMycvYOBjvKuMGF1cLycqRygxZaRRLB8zUxF4Bz50cNpEKTGMj0IyRbELLmpqQkA3hvwPav7t7UcJA3SdBlmhD6YqycrdJ4G4grb6+7JAyXMWi9ZHb8t86HCFWDyH9PhBub5Yua0kBPqhPDgUdEVBolNDsbESYZoonZ+CJY+SnAl63jaDTzCLvgRD91SuQZD4rOvyxM9mifJBrs/HJMl7+h4k1I4mj1L5hUeIHBZBj9JzS7FURDsxnCEuEzxeNwr2eeCgygmhiZ7xbHSABcv6bDfXKKZbXzyCu2zkE3C2qoAoABQwYRcU5d8kez/P7tsJURnToMLJnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9MKU9BS73MTJfpUZ9TLFhWzR4q/2L6fNjAyh+7EenI=;
 b=kJP8Mji2bJEiJ/b3O7VQCojQ3mdNdwjHE46xKvCoTdvr5JvFZmvEBBM5UmSvLbAB+ZQo2TPHchg+G37o30ifo21+4+yAUzxw+OCsXNIzOtQHM0NVtmwvlTTuj19NFhq2hxCFOQI14LwK4OphpMkwdwYRuzDDpDCXO1MzElDq+c+OQ8AytlMeDg3wXY8WT7V0E+cw1LM7FP72XI3aLguC6jTUssk2M+r67j9tp51kQEXrmFRQkShzow8suRwhR5BYn9P0Q2w8fi9cGQaS63ufG4TTrVfZv5JUG26VBLgNLrwN8sMatJV1NvoFgO0Hc+3D2Y5b5f04102SnGTZiGuxgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9MKU9BS73MTJfpUZ9TLFhWzR4q/2L6fNjAyh+7EenI=;
 b=TNYRMYhoJos/fnXEOwRhYj18/gUzgRU8FU1ZWk97mt4d2NcsXr5ulnoathyjD7sbtnkn3NT7JZd4LrGpQWwh3+YmrOtEyDqpzejPBJKdWu00Umgkhpnh651KhOkt1Z6c3Te7FpsNeJyYKypMdWANxuUoNdUVKVIAz4BfK+WMMaFE6ZlAm2TNI9T+Th1rcCw/tBTcKjv+zL65Z2yHBikdCGrE3Cp6I79rNdETNT0ppLo/PI16dhkIOZ5yGuXKcEE14WDOZ3MSiASdVLQX5I7vgT1hZvwlzLkD+TuJY8j/0t/SV1Xb6o0lqpyBmxJDkHWadKOpcy7693/kruNbWfn8Gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 AMBP189MB3277.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.11; Thu, 18 Jun 2026 15:57:52 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0139.011; Thu, 18 Jun 2026
 15:57:52 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>
Subject: [PATCH v3 1/2] package: replace copydebugsources shell pipelines
Date: Thu, 18 Jun 2026 17:57:46 +0200
Message-ID: <558e19ee3aa1a0dcccf5d46de7ac87ce21c80808.1781796358.git.anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781796358.git.anders.heimer@est.tech>
References: <cover.1781796358.git.anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0031.eurprd04.prod.outlook.com
 (2603:10a6:10:234::6) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|AMBP189MB3277:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b8ed477-6dc2-4c65-57d2-08decd525a5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|11063799006|22082099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	p1sy0jG5bFIvUIMeWxPekyzxrdUzJGv7Vrz3OZHh6Dqk81i6gsdXdShmS8HeFLswaSFy87Mh8Q1ChfmoLHYFmajiq2y55bJ9YOEluGr/CQvAeEkigP8TT/akTbOILMQ/fWnUlQo3zainJSQOU/wc3dJp8GxWmFFG//OcFVsk9bxH1Z2nEduPCxKaGD0dguCLEIUx34112OYSZXeFkDnMFqLExAlsmyXU9xZIOsUPsfH7IR/8HZmidByR1EKDmUKzIhFSeOO9q1RzgFx/FizhmNdkX3V/1CMiDuHUTXM7MwvZzl7QecBCMAVv+Q1YZIJ3YvvslO979vyWMJA/NxU1VT6d2mTp1+o3eGFrso86Nii+ofAbJh+7ajfEP9MB16swdOaKZQBJJ5Nqj0rjKtJT1W37RUxSfoDlp48DVqG7zJ1QjKRTSS/WtsflmQCHL8kdq4N44kIgxJUeX4XIbVrJ6SFnyJklV+KEkbiSAxhNUoQvto/RgFIpuqF3Z3Je9mj+pfY8LMGbNgXsgizu0NRtkPgbOIWXecMiBjW22c4PxgvsmhKfMo673tAflCdfTJYxahUw8iI6kwuZsohVZrW77rAllZo9tkf+opYfpJLSaBMUxGUpSjahKdTZT6BiHiAqQa880crwfRK7BNL3NMi37ct70j/aQ0Ed9gjA25N+yxoeYZoYiOas8KOWfl3mxp9q
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(11063799006)(22082099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IV/gKGVXbLJUWzpyf/IcbZuuKBJD+gDkSlL3BTrM6KTe9vir3PZ19b3xtsKg?=
 =?us-ascii?Q?aiSjwoBCstx0Q8KzvC4X4uV9a4b1SpUtl+gFagmkbYnLHOdaTZP0mU9+IuM3?=
 =?us-ascii?Q?EQlIZJsqglLAQEyR0Ne5wCQVoR7cEDLcdAo8xlzTJ6mruyKSeDmZ5sZB8HUI?=
 =?us-ascii?Q?VjurPN4AtOJdoVfUpv/F+P2v+AlVVKrZL11CF+oVJZGmNWla5v72RT1Hpc18?=
 =?us-ascii?Q?RgC49D11ag4ncK4zmNeisKosCRD/NTQVdboia0nQVWIQV6EKJs4dFC+d0LPu?=
 =?us-ascii?Q?1aMv5r9O501VhnsKiYHONKRZfb6dwP5dOO0rxJ1Q7tjJ0Nz6GpmGVH62HUoS?=
 =?us-ascii?Q?jd97bAp3xD2w+T3mzsQ3uMfjhzblblgigRhybXDpIMRC8cUOXI+VNQvEiLvw?=
 =?us-ascii?Q?suXVIThrCA5L80Q9SG4IG53NqGrSRHOh7OJWe3dr/9Rj+iF28Mvy5zCYdYk9?=
 =?us-ascii?Q?l/CjBCYQ9ZVNBFtlRP+WM88mq3S1VQxG9WmiTIQajUBdNnGVkn2Bou+QFcCj?=
 =?us-ascii?Q?+YmA2RfMh5dIMoNw3p0KCfmsUZSZkzDCnZ57KZQpEiYoH5dR8QYrYt07GKAn?=
 =?us-ascii?Q?LeslHUoWXPdgMvi2Jx1zuuyTrShAXGXaFB4Fb67/ktZOg32qL3TJ9SH5KCqy?=
 =?us-ascii?Q?0dCP4hFZvHIzjjMM8I2V44w+hBW5JcthIBjc/dXOFAU4BBepENfk59M5ok5v?=
 =?us-ascii?Q?Nkp/6cDZDkCAzV329qKnqWUeY6I28dczcVw7Xpoio43KMuAmYyPrbQpCVf6t?=
 =?us-ascii?Q?/Wykm7LywQWZ6pbz1IzPpLhUZmz4cRmOqOXHZHz0AbcyzhYZ53h9/XANHwL5?=
 =?us-ascii?Q?xTEvveYvxkFQQSlrKM8SRseQjsTUiMy3weJXiLOYzaXElmx1PBuuNcOG2XNq?=
 =?us-ascii?Q?+T2TWFnCzMmdweURDj7OMYa3gRRI3hvgfwohR1FEocnBEk2uZm3WlbdToqbN?=
 =?us-ascii?Q?YRZwHiedIUiApEr7wqW02SsSYX08VFq6q+VbmpxbyQ4PPdlU27OCwnXb+Jgm?=
 =?us-ascii?Q?qCzs0eFI+5MYcBNrLcqT9CAQvC9DrnX6XxKssjhFjLAMPcepMnFfT1/6lKHz?=
 =?us-ascii?Q?6tyhKdluFZ5opCtpNpu0E5KzamUFIBQEursb9o4XdYtffvezQptInOw9K3SF?=
 =?us-ascii?Q?Qq5eT0oQYu7oZLPFm8QBUfYJ71qmYbGPHyQcTIQeXJkuLcdK9GG7x24JkDx4?=
 =?us-ascii?Q?ioyhX5IAVqgsK2mRYy3K8hlEFIe5MYO6KxoVaq6i/XuPknTtDJY5ZwZO4Hlq?=
 =?us-ascii?Q?JSNehRNWqanB0v6zi4eEoy8NBrEwSfznIYFdgzToJWeQ2r6PZu1nKAxrHH/R?=
 =?us-ascii?Q?V/oEtEVGonnrcke9LPW4+RXCpC4vV6HbYIB9Ac1wRDStGGVGoiF/NGV/R6jW?=
 =?us-ascii?Q?teH23Xvgjr7TQ99VWLuEx/Wi8EoPdIp8FMMZX5TyrR8FACS4gfFTZOwx+UAH?=
 =?us-ascii?Q?DuOPIrHvumaKclJCbnjt84ey0mGnqe1qgmO4ftB8mTaAIoaxNBmOv16B14mV?=
 =?us-ascii?Q?QjfIuxaNom5Txiya97LhzkcOHQZoZDc4FuS6ou/eKt2gA0mpCfBw70oHdqyb?=
 =?us-ascii?Q?O/odMWZ3tszD89y0KDoiOUsU+HbWPLTT3T4S7vDe444EJC3FtQaTVCL993ZA?=
 =?us-ascii?Q?JqM3wyrBlr5c4Vh1j8GNRYtblUZSxoWw0xNHP7YUNWtFMOV0dJZAvIHa+BzU?=
 =?us-ascii?Q?YIM2+UwTJHJ+7L24alq7kGctzIsszSetpUbGLGmd9J8qs1072KoYgnMWr421?=
 =?us-ascii?Q?FoYao9Z3HQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8ed477-6dc2-4c65-57d2-08decd525a5f
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 15:57:52.0995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZnd5q9jhamNPWaP5ENmTBduf30/1etj6MGIFmzaVRoC6hR/15cG/fVTvN2YAWm2rCDcC87T2drVQFtKG+RxEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP189MB3277
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 15:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239088

Replace the sort/grep/sed parts of copydebugsources with Python
filtering on the NUL-separated source list. Keep cpio since it is
faster than doing it in python.

Use an explicit prefix + "/" match before stripping the prefix so source
selection is limited to files in the mapped debug source directory.

Replace the find/sed symlink fixup pipeline with os.walk() plus cpio,
use an argv-list mv for the externalsrc relocation, and pass the
empty-directory find command as an argv list.

The first cpio copy pass continues to ignore failures as before since
some inputs are expected to fail. The symlink fixup copy still reports
cpio failures.

Signed-off-by: Anders Heimer <anders.heimer@est.tech>
---
 meta/lib/oe/package.py | 72 +++++++++++++++++++++++++++++-------------
 1 file changed, 50 insertions(+), 22 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index c375acc124..d047e41a78 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1017,26 +1017,50 @@ def copydebugsources(debugsrcdir, sources, d):
         bb.utils.mkdirhier(basepath)
         cpath.updatecache(basepath)
=20
-        for pmap in prefixmap:
-            # Ignore files from the recipe sysroots (target and native)
-            cmd =3D  "LC_ALL=3DC ; sort -z -u '%s' | egrep -v -z '((<inter=
nal>|<built-in>)$|/.*recipe-sysroot.*/)' | " % sourcefile
-            # We need to ignore files that are not actually ours
-            # we do this by only paying attention to items from this packa=
ge
-            cmd +=3D "fgrep -zw '%s' | " % prefixmap[pmap]
-            # Remove prefix in the source paths
-            cmd +=3D "sed 's#%s/##g' | " % (prefixmap[pmap])
-            cmd +=3D "(cd '%s' ; cpio -pd0mlLu --no-preserve-owner '%s%s' =
2>/dev/null)" % (pmap, dvar, prefixmap[pmap])
+        with open(sourcefile, "rb") as f:
+            rawpaths =3D f.read().split(b"\0")
+
+        # Ignore files from the recipe sysroots (target and native), and
+        # compiler internal entries. Use a set comprehension to prevent
+        # duplicate entries.
+        sourcepaths =3D {path for path in rawpaths
+                       if path
+                       and not path.endswith((b"<internal>", b"<built-in>"=
))
+                       and b"recipe-sysroot" not in os.path.dirname(path)}
+
+        for pmap, prefix in prefixmap.items():
+            dstroot =3D dvar + prefix
+            prefix_slash =3D os.fsencode(prefix) + b"/"
+            relpaths =3D [path.removeprefix(prefix_slash) for path in sour=
cepaths
+                        if path.startswith(prefix_slash)]
+
+            if relpaths:
+                subprocess.run(["cpio", "-pd0mlLu", "--no-preserve-owner",=
 dstroot],
+                               input=3Db"\0".join(sorted(relpaths)) + b"\0=
",
+                               cwd=3Dpmap, stdout=3Dsubprocess.DEVNULL,
+                               stderr=3Dsubprocess.DEVNULL, check=3DFalse)
=20
-            try:
-                subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubpro=
cess.STDOUT)
-            except subprocess.CalledProcessError:
-                # Can "fail" if internal headers/transient sources are att=
empted
-                pass
             # cpio seems to have a bug with -lL together and symbolic link=
s are just copied, not dereferenced.
             # Work around this by manually finding and copying any symboli=
c links that made it through.
-            cmd =3D "find %s%s -type l -print0 -delete | sed s#%s%s/##g | =
(cd '%s' ; cpio -pd0mL --no-preserve-owner '%s%s')" % \
-                    (dvar, prefixmap[pmap], dvar, prefixmap[pmap], pmap, d=
var, prefixmap[pmap])
-            subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess=
.STDOUT)
+            symlinks =3D []
+            for root, dirs, files in os.walk(dstroot, topdown=3DTrue, foll=
owlinks=3DFalse):
+                for name in dirs[:]:
+                    path =3D os.path.join(root, name)
+                    if os.path.islink(path):
+                        symlinks.append(os.fsencode(os.path.relpath(path, =
dstroot)))
+                        os.unlink(path)
+                        dirs.remove(name)
+
+                for name in files:
+                    path =3D os.path.join(root, name)
+                    if os.path.islink(path):
+                        symlinks.append(os.fsencode(os.path.relpath(path, =
dstroot)))
+                        os.unlink(path)
+
+            if symlinks:
+                subprocess.check_output(["cpio", "-pd0mL", "--no-preserve-=
owner", dstroot],
+                                        input=3Db"\0".join(sorted(symlinks=
)) + b"\0",
+                                        cwd=3Dpmap, stderr=3Dsubprocess.ST=
DOUT)
=20
         # debugsources.list may be polluted from the host if we used exter=
nalsrc,
         # cpio uses copy-pass and may have just created a directory struct=
ure
@@ -1046,13 +1070,17 @@ def copydebugsources(debugsrcdir, sources, d):
=20
         # Same check as above for externalsrc
         if workdir not in sdir:
-            if os.path.exists(dvar + debugsrcdir + sdir):
-                cmd =3D "mv %s%s%s/* %s%s" % (dvar, debugsrcdir, sdir, dva=
r,debugsrcdir)
-                subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubpro=
cess.STDOUT)
+            srcdir =3D dvar + debugsrcdir + sdir
+            dstdir =3D dvar + debugsrcdir
+            if os.path.exists(srcdir):
+                entries =3D sorted(glob.glob(os.path.join(glob.escape(srcd=
ir), "*")))
+                if entries:
+                    subprocess.check_output(["mv", "--"] + entries + [dstd=
ir],
+                                            stderr=3Dsubprocess.STDOUT)
=20
         # The copy by cpio may have resulted in some empty directories!  R=
emove these
-        cmd =3D "find %s%s -empty -type d -delete" % (dvar, debugsrcdir)
-        subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STD=
OUT)
+        cmd =3D ["find", dvar + debugsrcdir, "-empty", "-type", "d", "-del=
ete"]
+        subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)
=20
         # Also remove debugsrcdir if its empty
         for p in nosuchdir[::-1]:

