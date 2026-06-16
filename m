Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FAC1CD98CF
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 08:26:03 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.149171.1781598324624140879
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 01:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Z//jpwrt;
 spf=pass (domain: est.tech, ip: 40.107.159.71, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qX+gwXP9yjfHWH6Ys0GIb9x/DWUgkKd26gUzC7mu3KYlp/y9HRVaLIcSrvFG/slnuaPv/3kW+hjlvDrOLVyYM/zIxYMOgVQM0vGO0RMdL8AUkyxJXsjr1yGAsbuWpGE47urlb20OhBA0VipR8r2IioF7OwMA7mC9xZUFs7hpXAJAXTtP2Cqrk0l5pzt4d+IsMt8LIS1GJkmyaSLe7oxxHxQgHV4HxEiK2ySQbMZhwg/0wOM1yWSCSUnZDyXZsyuzs0mZe9mMxdAP17IIuu7z2riJzdUU3LoDE8C23l6aI9RLyUtYHGdcMBY4fclOwR0uVf1+TwBFwCbig6s7DQ0ycA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7TCpyIYQD33jnwGNwa8hieQuaLB2qbbKmSEftBNglc=;
 b=yJ36r0bDUGmQLOU7nMLcqe1Od5l0ZvI9+nS7iBdWPmWhqB4R0NgYHPjm7ga1sW5Y9sp6avvXgIupuUzYzmfuUvKSUpmdQSVTZ93GW/pgJcKJ7LHcCRb+ag/nDF/OATTmtDosKEQ0nH2guBX1nhvUYEQCOWn1aa4TeQbi7thX44LEYeDbPO8lmR1yqmLMwDL8HahwCCR+WfLLshHMrNBHHiJjFKPYnA7kiVH0lpouh9nChlQjPtW0BMvcxgll7n5Tq4Hvl3LGz6TMNob2/gVnqhXH8/SSLnRGIlLimjjBuJKeLjfoQy2gQlEX6I+EMiMKMQmjzaW4N9U9bvN9wE5P3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7TCpyIYQD33jnwGNwa8hieQuaLB2qbbKmSEftBNglc=;
 b=Z//jpwrtcDYF28dp7or+oGh7sMXwrd0pDI+rGDSOyn2TKohZz1eKh5ZrgNGOujfai08dFXs8pbbwudXPk83h8B9i61vwhj5Vu9UrWvy7rx68WNyMiKX62uPaXx1hEOtAFewkDwha3rQ1kXDVC3Afqv2VaM//pcVbX2WaaIZU+mlw/pHaGWIrK61oQ9gTaATEyNLf8JnPZPVuz0Ca8rasSZMfy6KEIWCxxLdrDzv9T2p7Is9DK8TJGuFl8dfmBDIo4PbYQGMA+6fii/rCZdWXRczyw/Intg5pc4ef4Q7Z8Ch4+jd0obk/gxttx/oArlPfMv4hH8nWX3d46aDJZf4O6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 VI0P189MB3317.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2b1::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Tue, 16 Jun 2026 08:25:21 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 08:25:21 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>
Subject: [PATCH 1/2] package: replace copydebugsources shell pipelines with Popen
Date: Tue, 16 Jun 2026 10:25:15 +0200
Message-ID: <20260616082516.1553768-2-anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616082516.1553768-1-anders.heimer@est.tech>
References: <20260616082516.1553768-1-anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PR3P189CA0050.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::25) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|VI0P189MB3317:EE_
X-MS-Office365-Filtering-Correlation-Id: 41d28981-6aed-42f1-bd0e-08decb80ce3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	zEQbYYGAkbhYR3MOSXZeuOvQVHdh6qfZW/hjk+zL8uSRLL2VNUFKeP1n0GGhAOxVMSjtCDcm2VGsRUz6bg0g7Ij3mQx/IHKTMMzXG0NfkbmhQLUBjPh8l4rAkJ/ZXjkuPv03h1GeNdOCXt56NnK2NdrHVOV0+q2qPaqui/Q6Za15HnEsvJACRBU2EZDJw7V4/uALAzz08o40Xv/C9WC2tSlm+xQ+KS10P+kv5OYiNPx3Mv0d4nz1kYcOS7ynPBJ8lshePa25hLmN/bdzy8nqAoXc5ee91iulMixdz8v7R6ZCyskj691v4xRA2x0OmBj+y9JGYv0pXn8S9sTRD4Fnn9IvIIFcLJBHQU/ML0d/xHgWPPySowZAmyLcW0+cmr86rH630+4M/bctO1UmDieA8XdPJuYFtvQE7bmQYy0p9hoqzrNaIJEHkCRadkJjegpt+Ih9rYld0MWwcL3gPc5+87Xe2LjY3wv82a+G65aYIzc0fVMQlqj0zxdxEZgNl2qmGlMFIhcbCj5UMAaAtBQm3IgR/VQbLgsMMQ+pPdHyZAKNG2Pe2rZy2vtjuN/nYFNraBuYKb30CoyVtQ/FthmSo0Od49gsmNOY3hKPvatL/qCYwRv1loBZ1DfwMD95FB+p1N5hX5qs/23sCK7t1ysiZfmOxgqCzYRbdqYhLnR42B0FBRaw16fjrjEDy8YAqhhC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6gyjxBqsWnTMt8Cp76oqSQyrUCHRGSb3Zbx+MRw6+8Tp0n3GDZ//sQRGwIaW?=
 =?us-ascii?Q?H6RIH/nAIfzRt7R6he6dvua8cySqmKxd1A2MJvwD8z+pNWr1ILp6GnBzuxJH?=
 =?us-ascii?Q?pPdy4+q64Y7sk3NxiGi3iSAFRXXAhD0EaJW88e9W1fXAIsDDE+79Z3BqdC/7?=
 =?us-ascii?Q?lmw25Oz53aPQoCPwC1F60NysVdPxc+/ElzVCYsmVfxQ6Wt2KCBO4SP6q39wx?=
 =?us-ascii?Q?ejLFMGbsoaE1Ejop/dJi40otid+fysXwd9B8Cx5Bl70QQSwzSpMMRoXPnLdN?=
 =?us-ascii?Q?+dXKiQPA/+7wlfIcHw0IyI3+dy11pDSWjHfzko0FfgFcJMW3xH4ecRwY5hs9?=
 =?us-ascii?Q?l1p8ZMZhYu4PkmVmI0Fzq0ODfQIhpQGa0iSHZyryydK+30nCJ2f9FfqYJyKX?=
 =?us-ascii?Q?hJbdVpz+f12CzQ064cpOe6cC7+A1njFqfuS86Lu0adB47aa2T3LdPaX1wG3G?=
 =?us-ascii?Q?nA3z9g30Ec31YVP+XadyfqFViJgSarxX3P3aW0fk+O0UcuJg9iacnc7ZLtZW?=
 =?us-ascii?Q?ccik+oIm95FjQrY+khiBWSnufsRpUbMjJWN+nbDEwcdv/qY7cW9JqAtlRlVG?=
 =?us-ascii?Q?RiUMvejrKthFjM8bqVQtyXWyRCQAhPWLu8+BEhgaRW53VEWU62J0ZEBtsdcT?=
 =?us-ascii?Q?AsKk6mMyC3vW73FZyuapq0FBoMgA7nReT4nMbV7Isk6rIxID53IhXUtaHLWv?=
 =?us-ascii?Q?HgWW+D/bs5U0LFvscgaxHUEp21v02h84c9XxJ22wQIEqowuejlnG3YaS7JFn?=
 =?us-ascii?Q?dyfgX74aN+UVJ6XM+Bh9k8SmgPbd9qrUBYb2VratCaPO5vrJWhV49YF2cv3F?=
 =?us-ascii?Q?zvZEPTEJAjvcPRaGBFstAqhL15N3DJHcYka9xQBPWwKSNoyzZIk6b2raZurL?=
 =?us-ascii?Q?jDJhru07oeN0i+CTonbYpESePQKLFzW+zvC/lW1l6hU/+7Hq93E2psTjBeHf?=
 =?us-ascii?Q?uTXtG8l54H2sk7Uow0NvNCt1bAWACBphafxpxM0yrCnyysN85azf1Vd7+Umh?=
 =?us-ascii?Q?tJKN0MqMDFd6gGJ2ZchKzu8SnUZc44FSJEc0M9+ZIoKp7fihhC9jHmhzn4TM?=
 =?us-ascii?Q?Ybtrq391vLegqp0Teii3op09+NzdN/6q3FfzkItzfiiyHufU/LUzypirceP+?=
 =?us-ascii?Q?yraiKenpQAUL+ENnZdLGe2IrpZnSkySNH5ihbcnpQ/oLTmCi/nmzkDnaKBHd?=
 =?us-ascii?Q?CWjCqmOhs1RjtzDFHeqi+oF7NMHCrWzGBX1K1TxjYGGeCc+C4v3Nyy7K6GVA?=
 =?us-ascii?Q?mvGxew/IcKSxiO8N/Uk+JOFvuzvOKtoaxZxQHEL4ULD1g3KlR5Y0orlLSoL+?=
 =?us-ascii?Q?0K6t6UbxnO5UC5RSKbhEHKuJZZvLrcfaUFo33ym8bUuZpzrssh6dlxD+vlW8?=
 =?us-ascii?Q?8bHecRCWkIfaimAl4H/A0oy3+uaTwm6EgEA8vCEsDZqDid/p7XwWzWj3gFZk?=
 =?us-ascii?Q?G/oZnyi4aeGpDFZd7oSz+oYaHY50Jhl7Mpi4/SQrR2lJmojML5/F8DDSbHzb?=
 =?us-ascii?Q?wQrIAOVKIC41UlpwHBuDssWgSQpKOijEm8yG+UDNf8q50dI//5VZ9nqbRei9?=
 =?us-ascii?Q?Hjt0THTzI3baaS3/rzABTCPRA/Kd2hmshRwJ2y93uQrjHHZnYltlLGFYVnRA?=
 =?us-ascii?Q?CVfIGmleFJXv5toNKnSRLAtcWnepTpdRtGJx8ZlE5pztua9f3OYNH5bHlS8B?=
 =?us-ascii?Q?7/Kd68SkpqICopkApFUJG75dJF9aUpsxhhzn/7mlWNoHJ3e4MXQTP+Hp0naj?=
 =?us-ascii?Q?cuun0/BKQw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d28981-6aed-42f1-bd0e-08decb80ce3f
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 08:25:21.0809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKhQ06QNh3r42QfhfXiEGI2DVGcld80MMUm6Fof1hW0QDspUIhhLYREuTgp/KqfgnnWjKRewJpHtly0vI/SjSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3317
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 08:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238878

Convert the copydebugsources command pipelines to explicit Popen calls
using argument lists. Use env=3D for LC_ALL, cwd=3D for the cpio working
directory and glob.glob() for the externalsrc move.

The first pipeline keeps ignoring command failures as before since some
inputs are expected to fail. The symlink fixup pipeline checks each stage
so failures are reported directly.

Skip the externalsrc mv when the glob has no matches and let the
following empty-directory cleanup handle the empty tree.

Signed-off-by: Anders Heimer <anders.heimer@est.tech>
---
 meta/lib/oe/package.py | 63 ++++++++++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 18 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index c375acc124..ad4b7a2769 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1017,26 +1017,50 @@ def copydebugsources(debugsrcdir, sources, d):
         bb.utils.mkdirhier(basepath)
         cpath.updatecache(basepath)
=20
-        for pmap in prefixmap:
+        env =3D os.environ.copy()
+        env["LC_ALL"] =3D "C"
+
+        for pmap, prefix in prefixmap.items():
+            dstroot =3D dvar + prefix
             # Ignore files from the recipe sysroots (target and native)
-            cmd =3D  "LC_ALL=3DC ; sort -z -u '%s' | egrep -v -z '((<inter=
nal>|<built-in>)$|/.*recipe-sysroot.*/)' | " % sourcefile
+            sort_p =3D subprocess.Popen(["sort", "-z", "-u", "--", sourcef=
ile], stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.DEVNULL, env=3Denv)
+            egrep_p =3D subprocess.Popen(["egrep", "-v", "-z", "-e", r"((<=
internal>|<built-in>)$|/.*recipe-sysroot.*/)"], stdin=3Dsort_p.stdout, stdo=
ut=3Dsubprocess.PIPE, stderr=3Dsubprocess.DEVNULL, env=3Denv)
+            sort_p.stdout.close()
+
             # We need to ignore files that are not actually ours
             # we do this by only paying attention to items from this packa=
ge
-            cmd +=3D "fgrep -zw '%s' | " % prefixmap[pmap]
+            fgrep_p =3D subprocess.Popen(["fgrep", "-zw", "-e", prefix], s=
tdin=3Degrep_p.stdout, stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.DEVNUL=
L, env=3Denv)
+            egrep_p.stdout.close()
+
             # Remove prefix in the source paths
-            cmd +=3D "sed 's#%s/##g' | " % (prefixmap[pmap])
-            cmd +=3D "(cd '%s' ; cpio -pd0mlLu --no-preserve-owner '%s%s' =
2>/dev/null)" % (pmap, dvar, prefixmap[pmap])
+            sed_p =3D subprocess.Popen(["sed", "s#%s/##g" % prefix], stdin=
=3Dfgrep_p.stdout, stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.DEVNULL, e=
nv=3Denv)
+            fgrep_p.stdout.close()
+
+            cpio_p =3D subprocess.Popen(["cpio", "-pd0mlLu", "--no-preserv=
e-owner", dstroot], stdin=3Dsed_p.stdout, cwd=3Dpmap, stderr=3Dsubprocess.D=
EVNULL, env=3Denv)
+            sed_p.stdout.close()
+
+            for proc in (cpio_p, sed_p, fgrep_p, egrep_p, sort_p):
+                proc.wait()
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
+            # The source copy pipeline above can fail without aborting, so=
 there may be no copied tree to scan for symlinks.
+            if not os.path.exists(dstroot):
+                continue
+
+            find_p =3D subprocess.Popen(["find", dstroot, "-type", "l", "-=
print0", "-delete"], stdout=3Dsubprocess.PIPE)
+            sed_p =3D subprocess.Popen(["sed", "s#%s/##g" % dstroot], stdi=
n=3Dfind_p.stdout, stdout=3Dsubprocess.PIPE)
+            find_p.stdout.close()
+
+            cpio_p =3D subprocess.Popen(["cpio", "-pd0mL", "--no-preserve-=
owner", dstroot], stdin=3Dsed_p.stdout, stderr=3Dsubprocess.DEVNULL, cwd=3D=
pmap)
+            sed_p.stdout.close()
+
+            procs =3D (cpio_p, sed_p, find_p)
+            for proc in procs:
+                proc.wait()
+            for proc in procs:
+                if proc.returncode:
+                    raise subprocess.CalledProcessError(proc.returncode, p=
roc.args)
=20
         # debugsources.list may be polluted from the host if we used exter=
nalsrc,
         # cpio uses copy-pass and may have just created a directory struct=
ure
@@ -1046,13 +1070,16 @@ def copydebugsources(debugsrcdir, sources, d):
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
+                entries =3D glob.glob(os.path.join(glob.escape(srcdir), "*=
"))
+                if entries:
+                    subprocess.check_output(["mv", "--"] + entries + [dstd=
ir], stderr=3Dsubprocess.STDOUT)
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

