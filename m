Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84AC5CDB479
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 04:46:06 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13878.1782189956534568429
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 21:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=gCmyeivs;
 spf=pass (domain: est.tech, ip: 40.107.159.41, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cTE/wGmdWHugmf+mpA7G3MIXcL1K198WcIEZRf1bCLvsOt7FNgMVzf+8XSGOXn5JznlS4Z6g6kWfyxWsz960Oo9Z0QlxKva986K99Xc0YnaIuSwtXKrEvWIURlcOgLswtnUp9/1C4aRzGLYngSlpZjFOItGfdwZAjVP2B/jpUc/DNehLDhjgLsMgqw0sVN+Zemu2SBl7LalJ0Z0fHbfUQY4w8Try4712pM+I8t6qLQw2SCHDsPrttfXSKC7YQgkbyYrX7iCAKl2ripWsUut8BZwhjLesRwvWjg7NfVcUBcFONT1UuBP1AgBWBjUf75CvedUNntei0V/efOdJYj9Ctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9MKU9BS73MTJfpUZ9TLFhWzR4q/2L6fNjAyh+7EenI=;
 b=hOUSRnHg5fKHTR3cIekZP3sPoq9Kq+ygDV5NSxL+G2wt78Smn8/VmOobCo+tbgcy23VCvQ1xgr1GR3XSaiX9/yMfCsQWm+fJuhgPE6szDCsiDyLR226gCMPDy1QhGnKMcu7AYnrnlNEUmOXCsXIfZbuUKPgRU4QVKl3HKZKM8Mr6Y5YV8Y/ik1auHZNq1wN58qt+GT5Hiaez/PipglTB+oveNGnNP8i7chsgLrH5+CUpwHjd5sq8LrCL6XGm8vhVz/fRNWOYR1M0IG9JezGs2TpQUFrAV92yxwgvP3BnQSl+0M4yiwxQJgsWo3ZQsIOHHid07DX3VmYNMetc8EUJSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9MKU9BS73MTJfpUZ9TLFhWzR4q/2L6fNjAyh+7EenI=;
 b=gCmyeivsL2PTJxOgH5G5/Dmtfcvw6OdgOB0VmOeTx3r8uJJlBsc35ISSuLuf/V0N3DF425HQ5WJ1PXY0ybYONIx9uq43YUIeyFWVXPW1DJIJX8w8KsPMasEA1bHq9T50xq08NZesgyulUqGU9T6N9qk9R5Ww5W3e5eeHAuJv2W3bDT7KixwKZ/oDFqG9nWN8HrM83UGFzdd1o1J8Y5i1jb40GgUWaLy1Hd0CxdqoxUfb8DhUaDi6wL9WVP/n3a84u4Msblpq3+CnvM3s4t7xvrc5/96Jl5h8SlAEwLAzmLtqob9QP8H1XZIJBSknsFaamRWGCxwCRHrw+UzYVM1N+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 DB8P189MB0700.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:fd::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.11; Tue, 23 Jun 2026 04:45:52 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 04:45:52 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>
Subject: [PATCH v4 1/2] package: replace copydebugsources shell pipelines
Date: Tue, 23 Jun 2026 06:45:47 +0200
Message-ID: <8008514308adb5deddaab041bf0094c9b1219a60.1782189065.git.anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1782189065.git.anders.heimer@est.tech>
References: <cover.1782189065.git.anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR02CA0019.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::24) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|DB8P189MB0700:EE_
X-MS-Office365-Filtering-Correlation-Id: 442c0d9d-ece8-4f2e-6d53-08ded0e24e3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|11063799006|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: 
	cQJBRbM60fFhlNRz8qNU1qEzh5CbOQdxPf8fyoYw2I0S0mzouEaolnGBXl13Lx8QSQhywmwyBDmOvCk1VJ24Qo6DrDtWhBpDCBY1v98ysOscwtBESliTIgI/VYudT4uMkFAQLhWo0AhYcMwj6U3DOVHBdZzPzhrFMWOY1EYr7mBudjBwZvLrAXy242+1wPbuuvcEtsMweousMVcMmdRCCuObhWkiqG6HA4b2UlXeUf3jRCZxgN3lIW1gOLKnWLX2Dg4d073UICpYGQuGkq8NN6WUKmKDk4AMpiqWUZlKKTf4QlgWMGE+eV5VG2H0PvEf+OascpfxmD5ggg6NqkVntCAt+ZhKoTKqfaInXNdiREsLV3Lqs0ozNedTxbsDKqK4CeCiRTVnJgsT+4r84E3ALTjuvaFZQlMbr7Cgj8k8aWF10AuF/osT87vHlERKVG3nvUSefWAkbiMDNQ+TrhcO9lox1Xi0DVT5ssK5WFGG4Fo2siqhq4Y1+cOXexTWfi2NibdyOkQgrSkeW5nq8+4voPp23MSELO35KzTXO/lsYMOtzmFqowegsJ3FYyUKIKmXEsCtepQbcn3WmywLyGytS7fKOXFswBpmMK3QdvzSHGiFEfMAqBfhwswvXkr3NwBnmNqVpulvEJvVgLmbLYP2QFQSW55z3e/6pAskgaN9710=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(11063799006)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RXXyAXePdz1TgFOafy9ZEXDnmM/WK0pjaJADw1e5MxG0f3kdNu/y3lLRnbTi?=
 =?us-ascii?Q?RMtwMEY/T4nSEN5NUeZvn22grT8QPfb4Z0sQ+Ir7BLWeHi19TgqgiKrSU6lj?=
 =?us-ascii?Q?m9n6y4OP0sQQvtBwqyzjiEIJKmyIWHPrURc3DO0q9k65958AOQgY/y3y/5iR?=
 =?us-ascii?Q?rMlrHqfQTVuY4azXtCCASpxNncxHX6DVEqRxIGcKn2KHQj8cqLI4VOsaPiB+?=
 =?us-ascii?Q?w1ilKu/wUaNTzEcKlOoZWN+IxlEtFuR4etGvOaAecETyuJj7MUzeAWUMBla7?=
 =?us-ascii?Q?pgZjsvvJcQAxNakLjh/h/gNeX0k7bHPBA9lYxSm7LXJZs1N30B5OK49V0OlS?=
 =?us-ascii?Q?RdsZVAp3+reXR+PA8nVgIWG5JPh+ODTwEDnSfE5lY4B39QYeusZmOOv61yrp?=
 =?us-ascii?Q?ELBe3BRWE125jEgUsqTFXL0rrscYSocO5kQy3T6ujb4xJDUkVYrEdGz8Hc7g?=
 =?us-ascii?Q?BthPSxuzVDuRZzxsTAfdwLGoi98IU4d3pvUi1asmHLxc2qBi6X7NO0Wz7rk3?=
 =?us-ascii?Q?T7cZtPR8O2B/29GbQ2w61bcmN1O8SHLbet6WoHA80MgaXWa4z6zKyh4R2lOp?=
 =?us-ascii?Q?GDXJDFtEEh8CwFpwAZ9hwvPwL7ZP3wq5HOsNxlYB3wJxubIj8li3mmXWvgCl?=
 =?us-ascii?Q?tHcLK31u3UhG/fqL2k1FTphQxJXAXwNs2p57I0ukHS1biEntUKubcuh49PFC?=
 =?us-ascii?Q?lvwguJgCSE+Ijff64KDLUVq6jG4xMIE1KHOQpglYrUJGFcq1FFuALQieiuN+?=
 =?us-ascii?Q?1Ta+TGu+yATK/YFsfQEy/Y2/r8+FvpWrNaVJtiDoDeb8XoDV5zgbfyh0NZpJ?=
 =?us-ascii?Q?+iDJh3+waccgPiysH3WcuawaIJfavglfvPan9PgQn1rh7pWpQYPBS9svXNh1?=
 =?us-ascii?Q?XzQyDSsyzuXvwO1TKY/Glf5ppy/wDKlMJQGbdVi0YOxHUvjSemDhh5mjs6+h?=
 =?us-ascii?Q?STE9GMSqprYofft9ECUYG+keaYZC8Q5SoTSimrWB4DU/Nn5673BFpfZZ8A5M?=
 =?us-ascii?Q?kvY2/IJoo/9LKyGuO08/QFI4n+Pf53u5ZgUj+hnllg2XpnbPO3WQvuzPm6y/?=
 =?us-ascii?Q?24Qk0rvzkarpUQxW1j41jrUv04hQUoP9QQqs3u12sk/4R4t9iZCuK9NXCIH3?=
 =?us-ascii?Q?7la0R5nK2fGGFhS7/a7c6AFTdRUa4q/dksT3qVhzgUk09Ssx7nXppnHseySZ?=
 =?us-ascii?Q?hBphigfGCF3wLWgTlDzh9V2sOp7OTDnjBgMeFM0r24NKEMxkl/dVUB2O+0Dm?=
 =?us-ascii?Q?SXP7+H9WYMAo8WHhsX6jhEXUIhjFKWyLiTnKcSFYm59koRJyZNAjjrKnFvZv?=
 =?us-ascii?Q?lfDgk7WT1XNBPy+5K4ihB4vhAj1Tgy93VR7oMyaWNW8UHNP76ZYzO8uWa31d?=
 =?us-ascii?Q?3OyaVpJbDQ8xZZVaOjeWc5cEfU7N1LG3zL11d+fGjh+xHAcbRbbUW7Wwvn81?=
 =?us-ascii?Q?z6j3Dj7PQnXWVsgAip3+8Im9Y1TElL+iz1JObbRq6ps6mSNdDFe2ewz+QI/c?=
 =?us-ascii?Q?h+QkXSaxEGm3Mcz9WR39Chg8UEzcseMKyOC0TyY+KFRXulSPT/sGiItXEFBc?=
 =?us-ascii?Q?wMbMXLTXQBx7iTgPqBcAK638BNSFl5t47k9ZZNbEUvg7zv4SNTE5sRxVG1U6?=
 =?us-ascii?Q?NXp+hzzMqVBNtoLjlNk0iAIDaxYKftwvmCefM+YKBXfjlOsgMi2bzhXy9Nf9?=
 =?us-ascii?Q?lHZec2kID5rxm+26fnUbqZ1amezQZKV1yAn/rT1mrHDqMNsVtsSaJapecjt8?=
 =?us-ascii?Q?9bFtsP/qAw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 442c0d9d-ece8-4f2e-6d53-08ded0e24e3d
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 04:45:52.7810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s8ouXWcx9XbzwhA60rk/PVfCGt2PrOPF7H0wvVBQw6gLElg0olrzthDTBFCfGmHFJ9ATx54gdhrkb5ZqAvwg2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0700
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 04:46:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239328

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

