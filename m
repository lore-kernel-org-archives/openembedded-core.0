Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4249CD98ED
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 07:19:22 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14115.1781767159320576491
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 00:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=nxF0xDXw;
 spf=pass (domain: est.tech, ip: 52.101.69.3, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQuxqFa/mTsPKNr/6VqNN+HxhF0nZJtEGWF+8ZI4TShrHNt8zQQjC+2hYOK2pDxxChvSdw1DaWAbr9cPF0colNtrh8TLEkRX135Fqaheo6AmEtRLg09U0jZNfKcz5r/SppNum/0AL38IVlBDY8ujNoEQQkCu0esOIsS2WYmA2rzhWPHGWc7Jr5lb6RtACs9m9uEsG7A+Rta6ULPeGe0wudcteAw/mL1qD3Jp0dSHMQHtGPCeia1IfF1C974JLD3J/g4cX+L0+RRxEQb+JOpoOIMU1/fG9DrSM6MnaJVNqo6yQL+NXNrwkZeO9/42zUj0P1Jw/GIGqnAudgCiMsymLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXI3R9Itaw4Y6Fp4LbxisGFd1te3nTL+EJVYEu99Bp8=;
 b=Vhh+A8bkQb2Xh1S4/NY67x6zLieP3e5vsIhA/kJ2wkAjcImSG9CjszL/P5urSXP31E9qYnJr4Yjz0J+M7FrcrkJx2dYgOMHABUZRBv21vyWExoEBBCtqfKarMIIOjH7JtX4WtqTZUtyC6fHKFSNm6haGVzrXkm68Xb7ZPda8q5+5aXMHIc2QsfQLXy/4tILKi/3gV44eSvuOjistwh9epQ8ZP+I/JOfaesNTpxisqD9DWpTszW0tcK8lw8pLzKibvOYEG7jI4zVFtD18Xzno2Rqg5o1fSAZTmuty2zq747A2H/wUEYWbpIKPvf/zvSk45f5Iz1sgDq8cIMkOzNianA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXI3R9Itaw4Y6Fp4LbxisGFd1te3nTL+EJVYEu99Bp8=;
 b=nxF0xDXwWbkbihWO9Gm7JKiTSoPqC+7k4O6m802ASpnMfOncjB4r1Q7sawCjiWV13+oe3yNeqJuG+lyo6k5ooaorQpvmuR1YsPGATbtxNfoCLZWE/FiUoBiQ10mr5T1Y1eV38VNn+zyWBuDzZ3W4R2Rwq0ov2LI3czlbsiZTN52ohFae9vW24eGRjkFIvnwOZmmOJ8N4WgA7RNWU6JQox4dPEkmmvLx4Uu0RLj/sgWIuZoBuJI8Sd2zp0ujdritSdlt+gvKn3t82O948meRGFNqGCZT4YFdwaYJawyd64/DQFyTEZEpPmxdzgVNzc1kfb+zDzqMzc4eYYY1VOr3jwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 VI0P189MB2776.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:254::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.11; Thu, 18 Jun 2026 07:19:13 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0139.011; Thu, 18 Jun 2026
 07:19:13 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>
Subject: [PATCH v2 1/2] package: replace copydebugsources shell pipelines
Date: Thu, 18 Jun 2026 09:19:07 +0200
Message-ID: <a3e600b6d0d61b567c5ba296f66947a9728f296a.1781766061.git.anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781766061.git.anders.heimer@est.tech>
References: <cover.1781766061.git.anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0090.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::23) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|VI0P189MB2776:EE_
X-MS-Office365-Filtering-Correlation-Id: 8adca7c8-4013-4d1b-c856-08decd09e5ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|11063799006|3023799007|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	56NvPpTY8jyHYHcXwravYzqQgNRMNKa5VEN/lGEVoIjL93A19TtELpJ+2dVV8mnlZCgpg20bXMgfiOFw6x+Fq+jy0kwpoKWX+Wb6LLNBxlgCVHDIYSPl5rWTEJoy7eU/d+Wk0o29pwXetAxlp7A8VKKFE0iXBxKPJQDKWme269Qs0vie1kqiIWPhvVv6Ip3FJEnGzXTKSBj13L6nkuZ81te91hTH3E29Q9f0J0Ro9Zl02zGWGxN01XfJbBgUEYjuvEbBG6hc/djvLcEHWoI0Kv9ha54BxJrFQe/6TcS1zf0o6TAkyNVv3fgBhG7xEKv6mgsMytgm0VpJUAX+5Ij5m1yaIF1xnm5pcVvXB/vdsa7eG9PqD0BGCvi/FLdWFz/hxhsH+ASIvonVTrj2bBI8EB0C4P6E7aoK6aY2QNxbWGjqt/Ll8SIaCmg1lWL7TI+1LVTad4cb0B7fTyg7Ohgp8aTzmBDztDGQi3ne5/qmEd5u1uEPxwdOPVvBVabXwKV9op1kNxmYvbi7P7UhKUaedmGaKk3gtUe2PmHUTU8zHmFV24MDaqwtFTAR3hR1Ub6Dbpmd8c3sbOuI7LRC9jTOZ/Txg28M17wXuK32fNNtVbDhcZ4enAkA0D5cQcQwFnHNkHGq3s0g0VZlT1BGGhv2lrdVd+Q0Wcgb1rK8uBVz0bohySZMWQzGXKDgPkJf/MLJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(11063799006)(3023799007)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qz/99HgMd5+f25fsWmguZuP+zmF5yP4qqJ2bnfH/T0V14ugKKCMfbbLjQlGq?=
 =?us-ascii?Q?zDNH4bYTj1RixMZ93rXgWsdUGhVmIgmFqsswvTEd09QYSBle8zlXBGhuB6vi?=
 =?us-ascii?Q?mKaviJe/XfA8sDFkDUaZHkHPiVuUzT3mVgXOQ66haUSzVOG3SHc9lz3hqYLb?=
 =?us-ascii?Q?fY/F406lqjmr7FlZ9bVKG4rWEfDwsKgC0C9QQl/O6EjV6gPyVZaMbBSQp67K?=
 =?us-ascii?Q?8A7CzldloAp12rWMeEe7+j/kIdTpzUbLQ1119Bfzm8rj6wXOow1ayNHksYV+?=
 =?us-ascii?Q?2igFGaZ0fHgiRrlI5XtS7P/6GQF8oQqrahFqTo+pO9Z1iN08VxIjg2lShO06?=
 =?us-ascii?Q?NOcHy1GplJNeM47cYS/2EP6138oT3tDrPot1314QlUyihMT87+AR2IBRS6LD?=
 =?us-ascii?Q?BbVqHxwp++JFozavOjPyJCs9v0BsmwE2SzhA5egz6LouudBOK5h9AQYm5APd?=
 =?us-ascii?Q?XCEq1RDzC46iLCeUdoZqTedEb+Ubhc359gAiEPTzxRXEGqVIgiAmIeWIk24I?=
 =?us-ascii?Q?beR8QjNyOp8klrBcNDScnhL2I9/LSzCTojPlHGJ+zoe+7o1+CpAEaG3qHW6m?=
 =?us-ascii?Q?09YWWndBMW2Qv9rwNzcyZ/KlC8a/0umbX1YtE44olreTiuNEb4anAWRLLd1b?=
 =?us-ascii?Q?Oq65L7CFeDke1P0KVKG101Rkh1wv5hL9vuaQVXOEuMYo/A92dzrB5f3WMq8o?=
 =?us-ascii?Q?J8tEQuREnbdDkWIOxEuizndB6hcHJNlR407QKA40k8HlGU/NZvOEF65dgKua?=
 =?us-ascii?Q?32kCR3CwPwa+KNIE5K2BnjtRWSiNTDEeTC8zThS2nWKr7lZkowr75DKXLaBQ?=
 =?us-ascii?Q?jCCVna2qAw/bfPdsDTHr0aVOAZYNPuTjkbf986Mg5pgmUSMlMNSIGCfXFM+e?=
 =?us-ascii?Q?Xrm2GzEzF18DUpGFcbupAWzLovXgGWJ4aW4Ys5b4v5YIKfbGxwlagtAP2JnY?=
 =?us-ascii?Q?w63mQDtCFcuV16mjxwq0a3VJYbJMkod9yAKXXRUVq5MlWKQljP5Q/OaaCX9C?=
 =?us-ascii?Q?eX4JAsNc8SVPkPqgKjnYp4ESg8wWSpisG25mYHleN2y+1erbWdVHLlCnNF6Q?=
 =?us-ascii?Q?ZiCEg65MTUNSnjzcn8DyhAxdZcfsx5bpdBGT6AxZIANOXdhPynhyUdJQVAJ/?=
 =?us-ascii?Q?QUtpH7maXHg/Y5prxgXKYPUjVAHbUT47gUJ93CyTJpGwu10bBL6E+hG/NW5T?=
 =?us-ascii?Q?A8Yi5etuwMtJulbnUCk6XexTwccQHqSbfZpCeanIb/4KL9De6lwnl+KKSONh?=
 =?us-ascii?Q?q8mS4m8n8oPq5x/C29/27JX+zblreE3LJ/05Hp5zCUBa17abtxCLMb7dLPFh?=
 =?us-ascii?Q?642HknI2YIOPLcxyCRev9SUemHXIxxqpR/hJQ/WOB/fwzMThzouT30ZmsYB+?=
 =?us-ascii?Q?0xF8wzvKFPID6GQc2IW6lGwX+xEEgkT0IPDC/ZJRlg7nfOHbErhLwjg29NUI?=
 =?us-ascii?Q?5DCwGTrJFd06oGIo0hLcwGaYtrS2ltQD+PH6A8ibOtAp7oJnG5BrUMjum5eB?=
 =?us-ascii?Q?A8JcJ65j2zztRLhemugtObX3z5reBXJzAVsFflTFadnuAHA+H8+JVca2MLLh?=
 =?us-ascii?Q?S9kAylkEzSfj3bk3kFEzAKF7HEHthS/nO++WSXDcLR856z4Ybzzjoqc6Wvnb?=
 =?us-ascii?Q?h2f1XZ9UN5qoKpgUJd53o7ETZB6UmgOQ5C6xsZHuwOYBj5G1baZqR+lrB7I7?=
 =?us-ascii?Q?t66/vgFpGP0a16vaM/mD9x8haJ/hIeBjKJgkPLsqown/Z7d7UWCBtR+AwZ+p?=
 =?us-ascii?Q?4gGr+l2w/g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8adca7c8-4013-4d1b-c856-08decd09e5ee
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 07:19:13.0027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +mIeNYBahIPK2oN5Uc+LvUyMhpOsq73s3L8nyRAftVwZsIyZLzcX5hX93AK3XWAU4ybljRhmzqbeHd07rE9e7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB2776
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 07:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239063

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
 meta/lib/oe/package.py | 70 +++++++++++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 22 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index c375acc124..c4ad364b64 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1017,26 +1017,48 @@ def copydebugsources(debugsrcdir, sources, d):
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
+        # Ignore files from the recipe sysroots (target and native), and
+        # compiler internal entries.
+        with open(sourcefile, "rb") as f:
+            sourcepaths =3D sorted({path for path in f.read().split(b"\0")
+                                  if path
+                                  and not path.endswith((b"<internal>", b"=
<built-in>"))
+                                  and b"recipe-sysroot" not in os.path.dir=
name(path)})
+
+        for pmap, prefix in prefixmap.items():
+            dstroot =3D dvar + prefix
+            prefix_slash =3D os.fsencode(prefix) + b"/"
+            relpaths =3D [path[len(prefix_slash):]
+                        for path in sourcepaths
+                        if path.startswith(prefix_slash)]
+
+            if relpaths:
+                subprocess.run(["cpio", "-pd0mlLu", "--no-preserve-owner",=
 dstroot],
+                               input=3Db"\0".join(relpaths) + b"\0",
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
@@ -1046,13 +1068,17 @@ def copydebugsources(debugsrcdir, sources, d):
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

