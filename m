Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4033C43327
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 15:05:17 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37112.1782486309137871765
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 08:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=aay72WF7;
 spf=pass (domain: est.tech, ip: 40.107.159.58, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lPE21qaKMLHE5xLNNKBFiKFGs3gB9kIazoZtgNmtWI/xm9xuWxo5cuGjZaurUAhSWwnB+y/xN4PiuuRPJ1pjDhs5ztcfZu345nYVWKDO6R/pTkixPiSKWboCqUxkQ9zfPAQZp34nyOiqgkfiV6Les29wu43UAbQdw2hmmu2ZqdzweC2/7pJAUkXRMZ1vGByJ+tX5Lf8P5ZNjzWzeLCpD4RxBzdnmKO0Ep3n1Hc7/fnDnTV0cslAss6LqyIE2Po3Y6nJysK8fnJOwoMG8Hs6+AdH7zFxi1ve8AE0pvRYZo2gVC321xWfxNCHoZVCnFc79CD8SyQ8ylIYuCoILfu0oog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9MKU9BS73MTJfpUZ9TLFhWzR4q/2L6fNjAyh+7EenI=;
 b=W18vJEHUWLLL7H71itIeKuWOiXQFNS/43y35MnSaWlOqQ9tIzMy8rN5YhsIZi45doIcsbMHorus4UTKdfd3j9cGJd20lDsvWK6EkIHnK8TlCsns1QquAbHzL7w5wid4JjmH7L+e+jrFqVqwF4tY1ch/F3qtvF65TxdjlzubRR1sKJp26zn4aJ35E27uOp1BZ2CzLDuK8mZGdqPFeh7Zv4so0HeXY4J5A+7vhv2C8UypQhW0cq08uimcm4H1qHvN4K22p4wgjsgbRzwOf8I2uPSGlXQDK39WmYCKzPQrjXEDfZ7vOsMObDO0TF5Fc5MVCBynsZuSzvjpNPr5UGXqhMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9MKU9BS73MTJfpUZ9TLFhWzR4q/2L6fNjAyh+7EenI=;
 b=aay72WF7y6Amwo6CGupdzv8CGv5yWjArsSarQMjQyxUEx+968aOwiYSoLa76Rsy7IzJWTVae828pkuu+5Y7rXIl6XxJuz55NnZdM2x6iyhT8M9xeoWkHXRq6IHRa84TLCE5t/w6a+gjDdtPNcT3/bQBYe103jP5R2FL2XgWkX4oHCTEqq26AVQA8xUQg5HLswF3zT9xC0SfIjpL8gGjD4HhUqJnzwIYL6CsE7+2xThJ8FhvJPN1ua8ym0I+KiCFLjjioP3+ZyWVAG13Jr6xHM5E7+qdMlcctELtlHrZwCo3iEI+0AuRF0j3aUe2IRvQncsL7KoW0ecaNyGpc0QYtYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 AS1P189MB1912.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4a2::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.16; Fri, 26 Jun 2026 15:05:05 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 15:05:05 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>
Subject: [PATCH v5 1/2] package: replace copydebugsources shell pipelines
Date: Fri, 26 Jun 2026 17:04:45 +0200
Message-ID: <8008514308adb5deddaab041bf0094c9b1219a60.1782486000.git.anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1782486000.git.anders.heimer@est.tech>
References: <cover.1782486000.git.anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0442.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::15) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|AS1P189MB1912:EE_
X-MS-Office365-Filtering-Correlation-Id: a38f8337-252b-4c3b-8634-08ded3944e27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|22082099003|3023799007|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	3igHrd87gQS4UpXLgszkwI0H+i3/zS9JE1rtSstTp50i9Mb+ge4r4zXFb7nZhZlGD95NOgSFnDKueQqQdAwhqtB6/2eRMKdm8CJudtl1kAusPf10vyrkIDTptlhmHVTi0agLT/a8aOTYzw832PUAm305kOvE3fIFsZvEPJ35ZY5mCxUQVmhCG89dD/hTrQ1GwHAU48BV8HgXwYVRuqs+WujcS2wFXyqPDUTYFXlDerLSjFquT4wUGHT1u78fVxBVpsU9FaBlXv4dQInLBuepTcovshs6SSBxA4hdhhY4N3upMIDnDtS6+uIoP6bX3aZM6oSywO60tVt71xdaLwJQaViwzQ5poTlDRaE5aMoKRWfhTb4CX0XXaRZbTYrBsJaeNbBL2uw1DjtDKoOLY+emb686/zMfKGJGvbtBloT6A/f2HRsUNuQrd8BC6OTYsJHF/wHuxplbXIrcgJmZ1MrVK+zJPIUWiZpzt2mBV9D5/UinlCt7HPXJ/62qRuhhz8y9pNaGzaVBVVZcMtrng9tcYWOTApAt0QhvdxDmqiwABqrzfIyHg2A6nafqQGFg5/v3JlEzDzxuRxhQtzN61KWcK/4klSBtNWZmUQfatMkbUYKbu4ahedxH7ThNkdHPvwrAltB6kdCE4C+Ebi8sTaZ8+aTO8Yy1iGsGe8PY1BVCdyg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(3023799007)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yffBJdNWj2RgEdtb77c3Sy++iZ6AStpuVr7KdEl60vrmi4AAEOi2Hsk9qWNO?=
 =?us-ascii?Q?RbDMnWSmrJIWiP43W3Cw5WFeYEuiPZPixsY/2priVvSN1DusczCgqZtZi8HD?=
 =?us-ascii?Q?HJWEUp12tkxhukKaoDVTu0yo6jaZgnE1vdv7hGdP4PHVr2n0HbRTDIGwqm/9?=
 =?us-ascii?Q?oLXQySAPzJrWIcbCzvaKuH5DycpsH8ebR/Gl4GC5ZQyHRxcq2fsu6cWDswTO?=
 =?us-ascii?Q?nftZRjmhqyXlKoTjYuVpGEGL6smtr4W1mZRWSa+1FC64OEL23eOI0d2rC0Vd?=
 =?us-ascii?Q?9DhLy4vt4859bAEke8nOCUSmn9VqK6qRJD2a5KuQgcdUm+Ozc71UNyGoAMkU?=
 =?us-ascii?Q?6J5hLF8NRjyeMwbO26zWcnjBGpJtgMLmcEp3YBFlagqajMIptMU4BwtkQAVO?=
 =?us-ascii?Q?SpeI31VpEE1JAZ/g0yKtCXUzozIJABtMZ9K7kblqe15pLDwnY3EkpIu2JzQM?=
 =?us-ascii?Q?kBbc6qcSisM5WBpfaoMslKwLNHtrbYIlATgdCOjc8vLhS2HQ82u4pgD4bDuG?=
 =?us-ascii?Q?2sUGBOwkmbEKYx8/39fjJJoIHe+ej5iB0SpEUksuZYq/GunMjuW+VFnqrQAg?=
 =?us-ascii?Q?6iWD+2BgM3STzs2P1hSMFWQU1PaTFGdCiuVsfKq8najQX1s3YF/pS30BN+jm?=
 =?us-ascii?Q?XGFFjrHOmuoLhQUmPUJAlz/hIlJ4zOabQUQet6iBVFe6UfdCrnVQKb6wFozM?=
 =?us-ascii?Q?nWzGJY0ZwdOlT+DbiVDlKCIpADCGD8mkbqom8x5UadwiJvRUMqW6Av66TMew?=
 =?us-ascii?Q?RSLQghdUmDaR29/CVEcb+HDEotEFHL2BxAzwT7upgxklAt/NQQXjpjXvveff?=
 =?us-ascii?Q?/GSdIClHVNYIAd//5gfSdfPtW4yY2uyZzHWB9ARG/D3lH6rN4a67TWQlYKQc?=
 =?us-ascii?Q?MVzlUvs1XGmgDSQXjMZ7hRZXjH+0Zbeo+UZMo5RgcJi8q4cldNTdvgP2Bdux?=
 =?us-ascii?Q?YUAWzW3G93PJ/2szWKEkaYFuET0KutQdNXYsw0lZP5orFktE9p+eC5amDapt?=
 =?us-ascii?Q?J0i0KAHjmMydoYzFsp80d/9Sjdn57gcM6NtWnd/REzxQC4NRgiuVc3EJmt0F?=
 =?us-ascii?Q?jSVl1R2WrPsD3BPYwjTznBXQmJ6gz9d1YnfsDlp2C8OTjBuhNTkbGifz9YBW?=
 =?us-ascii?Q?klZYZ9gJj10yiJUsc2Cqz53QRBxsF3J4YdXRR5FpKLYd36JSY5eDNyOfJ7d6?=
 =?us-ascii?Q?b5LEC1O4C306DH0UuLbZ6ffAIS7NZUzkX+pfPFJj7leE+0J1ntWdqalaSTJx?=
 =?us-ascii?Q?ziqTVy77teRYyIIUzoBIaWuvWp6ye2chF3KvKEy7HO0TuBgeO6IGg3hc0/FI?=
 =?us-ascii?Q?4h1e6MLn2PY6oujasHqOoi7gdiF1+XVr3Jz0WNFwe6qCRVz6Ul0ki9/Vu33K?=
 =?us-ascii?Q?6bmBAb3EuaE9+Sb1+Rqt6G3tElvm6qm7MdyUq68FhdP4JQDqDor851TO7Ywg?=
 =?us-ascii?Q?ZmostoQuKewQx/gHxry6e5eT4ym33b3bZ/maF0oqeeed35JomYKegD+41JT5?=
 =?us-ascii?Q?6f6UksMoDpHJbsCOxlytxEuqvgBMnTxAu7qfuEjhs8UQeQ8VwRrnSveHNJ71?=
 =?us-ascii?Q?7Nq/YtXfYT+nRGIsKBAsf3CnRSUkKYU2DhtsHHQczrGnAJWSkc669kK8vWWc?=
 =?us-ascii?Q?Al+qhaoMhJBNTkkvgHEBpJs6OQKa7ngMSLrNVPRfBEynuCqRdH3wz5Ampwrw?=
 =?us-ascii?Q?BAVk5NoY9TZYf5tddwo+XIH8HHtrFPHBaEHX3OtNTlMqNUh6l4LiqLm4quCP?=
 =?us-ascii?Q?NQGggVcn0A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a38f8337-252b-4c3b-8634-08ded3944e27
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 15:05:05.3816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oBC9gEXml/lkO6o5K5PH656+I3ciML8eqyuA29U90noqJCOlXVO0qf2g1YYnDtegEecva9d4hwfoE+UWauJ58w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P189MB1912
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 15:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239644

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

