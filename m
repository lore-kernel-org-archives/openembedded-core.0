Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88271C54E55
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 14:41:00 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.138])
 by mx.groups.io with SMTP id smtpd.web11.21659.1708958455668094328
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 06:40:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=Kd5GUI0W;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.138, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRpzAqhCI4C/DAy4cHM4cjc+5CJ9p8R9xN8/ojv/gghptI0N0AUvFnBTd8bv5YyFHHFr4ndh3ziw7x3zowkbhC/UGacBg+8Gx9mS1FEP+A21hbepbXLATBFVpD1V1hoJ7Whq8CFhW2p0k4QLQJLgJQjVJVRjMW/EtaSfKU3R7gOKhAl2KsEt5aiamqJ4Xwy17zXJzE1AbyQgtHgmo7o9g+1wmGbP1NJJOx4F82oFc7r7pfU11qQtsZLpX/ZgjxnCDNYdQyq4zlTN3FXOK+R66vnkUC9dlYJY+HMeownC3H7l6J+Hxoi2A0V0Qg7BrkUWZPjHO1nqkpZkSwAuzKrm9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMHkpJ66BNDh4vc2GgcBGq+n00YreQ/6i/pSAkSbl0w=;
 b=Z8jiiXDOJgx5gLINlFPW/I+1cVglj38dcvzB+Q0D4e0WcJcxUR4EY9vRWbOYZUipHraMGEORvyns1eFZEcbY/e5f64LyY9p+IZlBDnLddGVF5Q44bYBNzceNb6oVRkopjh8snOuWBFjstq1sn0mNaoOmcR757MFU5ytcPtUqopa9IaHkfwFIzEtNNlRBU2QCOifphDR5JYTkEFQATRrZZUj6Ya00srUhFy8wm3iFJnJDviXBp2KQRwvVxbJq1KCBYGJycnzdcpOiN7eDDoEvD9WvbWq9Gv/AvUc/H908pTwp9HdU74H+cYX/tBu7hE4Sph3e8dLh0mrUx/SgTFw+Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMHkpJ66BNDh4vc2GgcBGq+n00YreQ/6i/pSAkSbl0w=;
 b=Kd5GUI0WAR7bmxQeamfiq4aG91mFJprxdXmTGUTHi7w04KIJrMJRGcSFljZl2mKPbM6fvFNjviOvfUHgjAzjrV49XFqhFRCbL76RxZK0iXNC+RK0TOgUnmMRpA873p+MS/YlgxBOVCYDOTkzOVLfYB9ufhxhIVuytjwsHFnatbU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by PR3PR08MB5626.eurprd08.prod.outlook.com (2603:10a6:102:81::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 14:40:49 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::d003:60c0:6918:8a5]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::d003:60c0:6918:8a5%6]) with mapi id 15.20.7316.034; Mon, 26 Feb 2024
 14:40:49 +0000
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [PATCH 1/4] classes: go-vendor: improve handling of go vendoring
Date: Mon, 26 Feb 2024 15:40:37 +0100
Message-ID: <20240226144040.2007482-2-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240226144040.2007482-1-lukas.funke-oss@weidmueller.com>
References: <20240226144040.2007482-1-lukas.funke-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::13) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|PR3PR08MB5626:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c2c9e2f-3706-4d7b-717d-08dc36d8ec90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+5caBHupJKI7NkrcA/Hp7WX2yaxT0yiEUP7Rq8E/vY04m2x55XL7UH8iZzCUmZik5k7wv97Eegi+cwglr4qa0SNIse98Mu2z4gDEN2uv66keFmlQIjRpDPqpo9xRTnhT2x8SjydnRL0Fzem55ilEV/LZV8n96a4lTA9p56GV75Xi52OWgmGMkpOwkRN2a0SFX6UbvLt7Kv4MOlAfhUQxiMBACKt3azjqWAlJuiCKEcAEnkr1mSjcxJ6ZykvHw11UjPdguoCxNWOec+PHgAlgN06ibcKTOhDkcbK0xHizWL+xZasDSdfJhr4YJm7NZr1JzYdBEYDfIJmSTh4nksrk6BRechfFY3aln8NaLe3kSwYfpEsHilO9pan55JNU/gZn6N48cJI6bCMhJsmIEHCwIRnKYmHrkKjnUKEtqgjExeCI6hmf3GX8xzgo1RLfIYXN7Cc+3ZCGWXR3D2nQhWl/eeWmujcgZkypb0yrIgoTdJM1dv+A6rJdqVUSHeZVf4nYirjH/a73+mnj1YjiJONGVfWzaDvOwbNvwxQUcY8J9pnTw1ucC4kE+LQlIFh1G4+Ko5Y3q6fdWNg1KN+kByyxG+vBX9uNi3pcvxtHx4KGgyu1SDpdhv5upbjpUlm1I5vHeMWJxzdUq1hM19mOukgCqghkBE3bcqVq7WBXsr8pJNUZPZ/MYHOGbdh+Kuo6YCDCF5mi9Nd+jol+4ZYVtFxDaA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1MrU7ypN/Z+iWmJMMXMhVzFoHYuippx2l/JcxIOFKKUN7tsIi3F/JLmYhTxg?=
 =?us-ascii?Q?XHHrq30J2LNJWgblkXEQ9cPaOCcaJFwraT5N6lL5nuf+kZdxaNZlMsE6hJWh?=
 =?us-ascii?Q?LLJJ6D87TXO+eCmmpHHjqoMH1H0AGln95AkytCjFXg4RxpkZHfjDTKh9RoYG?=
 =?us-ascii?Q?4geyIQrJN/A+2C0NFVLbZtXA0sFMFIvxwBlCWox39MrV8Bokq21M9AOR7Sb2?=
 =?us-ascii?Q?3wMWlVO2RKrVKMP+RpkbD9xvbRa1ppcVOiS7GGVN4MoOxzSCCjAp5yUmK5Lq?=
 =?us-ascii?Q?wdC3qPVMFwa4ilbui7v1OaW7JKiXOzJR9NtLr+ePgtwedQRn5+PbDV/SR171?=
 =?us-ascii?Q?aTKYPQsUd2pQuMFplCGaVS2eaQyGYGkeNU2LfNDZHUDKMTb2HS6eozuMEUzd?=
 =?us-ascii?Q?aGgBtS9dABzCeKJ85w/3BgrQJOqBbTuXJxOJ2aFrCAAo274G35ds7yU9N3le?=
 =?us-ascii?Q?iQQNAAo8u0rhxafK0cnxr1abQpiDf4DuSId119BUVa1PhUufS4Et5QrIwXIO?=
 =?us-ascii?Q?FoImpBSH+Wql2Gk0fQXoxIZ459iZWdYkO90BYhWEqnIASWk/uBuju8PAYrs5?=
 =?us-ascii?Q?LVNzAQcvH4F3UUqCvYVCVvT+O1CODNAWxEeAYT1CZWAwGP09nW3499Y8Tvoa?=
 =?us-ascii?Q?95y+v6MDsHRqo68pOKLrQMoAv0qBWf0CmOTzPJv5y98t50buBxxmNxNwaxTE?=
 =?us-ascii?Q?5hugj0OP7xinXh41cOXs4usup+4AhlYaHaFyC+wpn4IkJ+Akqds8b0orfpPd?=
 =?us-ascii?Q?7SSKzptIPlz1MR7XbuxA6dR+l43z81mYkzS7f+vrNCmYrUxmiNe7OE6ACJjf?=
 =?us-ascii?Q?bjK2fcZlf9weJTd0u6DHjHerYlNaNFGdc9HKv8aHiMZVwic5HYTOq5j2OYPk?=
 =?us-ascii?Q?bGCOMObNslDyi0Wk7icnOqA6yZ/RxCAkxGnp5NT1u74IE6yqF1m+iAyFj2ll?=
 =?us-ascii?Q?7GGJTpOBSr8m7yg0O7OgB3pjx4QN1UxDOY+2EcHvO5wGT1iXszFr03jWNlpl?=
 =?us-ascii?Q?zFaL7ndyFRP+P0ciDXERCVj6tAvzUuJ1vd8BuiQVKpevWbdDBimJQIP/k3Eh?=
 =?us-ascii?Q?2fxQtTXCw/HqqEMylrDRYVH/kwedbo3S33sfsKG0GUnoCuEaFLadgClNOvqC?=
 =?us-ascii?Q?hZ+Nx5bldYihGmrlSsmKQkBUqjU375f80r0FYsqIwZB9Btt+eL9I+b9vpFmB?=
 =?us-ascii?Q?iHlBNSJbFDE0pb+UaHguh4pghwCLDGDII4MmxTLv928qtC6umIJAC1m7FDvf?=
 =?us-ascii?Q?LwXJ6s5WUDPs0bprK4MaBqEY1fl0yW/MMOZeLTHrNfkxT5fpMdDvrwJJye2p?=
 =?us-ascii?Q?o4IEXlRRo9Q1NfGKmLdaOn5d4iKnpm5Qzfx0mP+74paCK6WDUkLjf82fmtuN?=
 =?us-ascii?Q?/G8VV1WfKow9dYUBVNGOldUmU8yFgUXjW21cVdlLcwh2hXaK8KG4svDmY+ce?=
 =?us-ascii?Q?1WqcL06ZKGkQWXiXOHlYNofgckHZ0E5XJ+EN5KOGul/ohB8lmsKQSpNUGyE3?=
 =?us-ascii?Q?feFL6Kbpicyy7Vm4GAZBR9PPc8HZRoC3ubFIo5B8MbEOQg4FLxa6+Y7KuXLk?=
 =?us-ascii?Q?OO6eAM61H+WGcb89W4aeBWHNlvpKXGw+FPb8IktdTuqTcLRXG9ZjTO4ntlwm?=
 =?us-ascii?Q?zw=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2c9e2f-3706-4d7b-717d-08dc36d8ec90
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 14:40:49.0216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+pQ4fP54zTwWWw2nfyMLpkS1KpM0Fc54w8TCcGrbOMVcAXBRtPmtFohPsQwXUL3qEdTdfdNhnJXP8YmTTvlKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5626
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 14:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196208

From: Lukas Funke <lukas.funke@weidmueller.com>

This commit deals with some specialties around go:

 - Enable the use of //go:embed directives:
     Using this directive it is possible to include additional sournce
     files into your go source-code. Since these are no listed in the
     vendor manifest, we have to check for the pattern in the actual
     source code

 - Do not vendor //go:build ignore files
     Do not vendor source files which should be ignored during the build

In addition to the changes above the behaviour of the vendoring folder
is changed: the vendor folder is not linked any longer into the source
directory, the files are rather copied directly into the projects
vendor folder. Because the link was removed before packaging, yocto was
unable to copie the listed licenses

Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
---
 meta/classes/go-vendor.bbclass | 324 ++++++++++++++++++++++++---------
 1 file changed, 240 insertions(+), 84 deletions(-)

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclas=
s
index 1bbb99ac79..d4a7d7c224 100644
--- a/meta/classes/go-vendor.bbclass
+++ b/meta/classes/go-vendor.bbclass
@@ -40,18 +40,159 @@ def go_src_uri(repo, version, path=3DNone, subdir=3DNo=
ne, \
=20
     return src_uri
=20
-python do_vendor_unlink() {
-    go_import =3D d.getVar('GO_IMPORT')
-    source_dir =3D d.getVar('S')
-    linkname =3D os.path.join(source_dir, *['src', go_import, 'vendor'])
=20
-    os.unlink(linkname)
-}
+def read_vendor_manifest(fname):
+    vendoredModulePaths =3D dict()
+    replacedPaths =3D dict()
+
+    with open(fname) as _file:
+        content =3D _file.readlines()
+        modPath =3D ""
+        version =3D ""
+        for line in content:
+            # Modules starts with a single hash tag
+            # followed by the modules path
+            if line.startswith("# ", 0, 2):
+                t =3D line[2:].strip()
+                if "=3D>" in t:
+                    lhs, rhs =3D t.split("=3D>")
+
+                    # This module has been replaced, use a local path
+                    # we parse the line that has a pattern "# module-name =
[module-version] =3D> local-path
+                    lhs =3D lhs.strip().split()
+                    rhs =3D rhs.strip().split()
+
+                    # Check for version replacement
+                    # "# module versionABC =3D> module versionXZY"
+                    if len(lhs) =3D=3D 2 and len(rhs) =3D=3D 2:
+                        lhsModPath =3D lhs[0]
+                        rhsModPath =3D rhs[0]
+                        if lhsModPath =3D=3D rhsModPath:
+                            modPath =3D lhsModPath
+                            version =3D rhs[1]
+
+                    elif (len(lhs) =3D=3D 1 or len(lhs) =3D=3D 2) \
+                            and len(rhs) =3D=3D 1:
+                        replacedPaths[modPath] =3D rhs[0]
+
+                else:
+                    modPath, version =3D t.split()
+                if modPath not in vendoredModulePaths:
+                    vendoredModulePaths[modPath] =3D {'version': version,
+                                                    'pkgs': set()}
+
+            if not line.startswith("#"):
+                pkg =3D line.strip()
+                bb.debug(2, "manifest: module %s: add pkg %s" % (modPath, =
pkg))
+                vendoredModulePaths[modPath]['pkgs'].add(pkg)
+
+    return vendoredModulePaths, replacedPaths
+
+
+def should_build(fname):
+
+    with open(fname) as _file:
+        goBuildDirectivePos =3D -1
+        endpos =3D -1
+        content =3D _file.readlines()
+
+        for i, line in enumerate(content):
+            if len(line.strip()) =3D=3D 0 \
+                    or line.startswith("//"):
+                continue
+            endpos =3D i
+            break
+
+        for i, line in enumerate(content):
+            if i =3D=3D endpos:
+                break
+            if line.startswith("//go:build"):
+                goBuildDirectivePos =3D i
+                continue
+            if goBuildDirectivePos >=3D 0 and len(line.strip()) =3D=3D 0:
+                directive =3D content[goBuildDirectivePos].strip().split()
+                if len(directive) > 1 and directive[1] =3D=3D "ignore":
+                    return False
+    return True
+
+
+def match_potential_source_file(fname):
+
+    basename =3D os.path.basename(fname)
+
+    if basename.endswith("_test.go"):
+        return False
+
+    # We assume that go version >=3D 1.17
+    # (See https://golang.org/issue/42970.)
+    if basename =3D=3D "go.mod" or basename =3D=3D "go.sum":
+        return False
+
+    if basename.endswith(".go"):
+        if not should_build(fname):
+            return False
+
+    return True
+
+
+def resolve_embed(fname, dst):
+    import glob
+    import re
+    import shutil
+
+    go_embed_re =3D re.compile("//go:embed (.*)")
+
+    basedir =3D os.path.dirname(fname)
+
+    with open(fname) as _file:
+        for i, line in enumerate(_file.readlines()):
+            m =3D go_embed_re.search(line)
+            if not m:
+                continue
+            embeddedpaths =3D m.group(1).split()
+            for embeddedpath in embeddedpaths:
+
+                p =3D os.path.join(basedir, embeddedpath)
+
+                for f in glob.glob(p, recursive=3DTrue):
+
+                    relpath_embed_dst =3D os.path.relpath(f, basedir)
+                    embed_dst =3D os.path.join(dst, relpath_embed_dst)
+
+                    embed_dst_dir =3D os.path.dirname(embed_dst)
+
+                    if not os.path.exists(embed_dst_dir):
+                        bb.utils.mkdirhier(embed_dst_dir)
+
+                    bb.debug(1, "cp embedded file '%s' for source '%s' to =
'%s'" %
+                                (f, fname, embed_dst))
+                    shutil.copy2(f, embed_dst)
+
+
+def match_metadata_prefix(fname):
+    metaPrefixes =3D {
+        "AUTHORS",
+        "CONTRIBUTORS",
+        "COPYLEFT",
+        "COPYING",
+        "COPYRIGHT",
+        "LEGAL",
+        "LICENSE",
+        "NOTICE",
+        "PATENTS"
+    }
+
+    for p in metaPrefixes:
+        if os.path.basename(fname).startswith(p):
+            return True
+
+    return False
=20
-addtask vendor_unlink before do_package after do_install
=20
 python do_go_vendor() {
     import shutil
+    import re
+    import glob
=20
     src_uri =3D (d.getVar('SRC_URI') or "").split()
=20
@@ -63,15 +204,12 @@ python do_go_vendor() {
     go_import =3D d.getVar('GO_IMPORT')
     source_dir =3D d.getVar('S')
=20
-    linkname =3D os.path.join(source_dir, *['src', go_import, 'vendor'])
-    vendor_dir =3D os.path.join(source_dir, *['src', 'import', 'vendor'])
+    vendor_dir =3D os.path.join(source_dir, *['src', go_import, 'vendor'])
     import_dir =3D os.path.join(source_dir, *['src', 'import', 'vendor.fet=
ch'])
=20
     if os.path.exists(vendor_dir):
-        # Nothing to do except re-establish link to actual vendor folder
         if not os.path.exists(linkname):
-            os.symlink(vendor_dir, linkname)
-        return
+            return
=20
     bb.utils.mkdirhier(vendor_dir)
=20
@@ -86,7 +224,7 @@ python do_go_vendor() {
=20
         destsuffix =3D fetcher.ud[url].parm.get('destsuffix')
         # We derive the module repo / version in the following manner (exm=
aple):
-        #=20
+        #
         # destsuffix =3D git/src/import/vendor.fetch/github.com/foo/bar@v1=
.2.3
         # p =3D github.com/foo/bar@v1.2.3
         # repo =3D github.com/foo/bar
@@ -103,14 +241,25 @@ python do_go_vendor() {
         pathMajor =3D fetcher.ud[url].parm.get('go_pathmajor')
         pathMajor =3D None if not pathMajor else pathMajor.strip('/')
=20
-        if not (repo, version) in modules:
-            modules[(repo, version)] =3D   {
-                                "repo_path": os.path.join(import_dir, p),
-                                "module_path": module_path,
-                                "subdir": subdir,
-                                "pathMajor": pathMajor }
+        if not (repo, version, subdir) in modules:
+            modules[(repo, version, subdir)] =3D {
+                "repo_path": os.path.join(import_dir, p),
+                "module_path": module_path,
+                "subdir": subdir,
+                "pathMajor": pathMajor}
=20
-    for module_key, module in modules.items():
+    # Copy vendor manifest
+    modules_txt_src =3D os.path.join(d.getVar('WORKDIR'), "modules.txt")
+    if not os.path.exists(modules_txt_src):
+        bb.fatal("No vendor manifest present")
+
+    manifest, replaced_paths =3D read_vendor_manifest(modules_txt_src)
+
+    bb.debug(1, "copy vendoring manifest %s -> %s" %
+             (modules_txt_src, vendor_dir))
+    shutil.copy2(modules_txt_src, vendor_dir)
+
+    for _, module in modules.items():
=20
         # only take the version which is explicitly listed
         # as a dependency in the go.mod
@@ -119,10 +268,12 @@ python do_go_vendor() {
         subdir =3D module['subdir']
         pathMajor =3D module['pathMajor']
=20
-        src =3D rootdir
+        bb.debug(2, "processing module: %s" % module_path)
+
+        modSrcDir =3D rootdir
=20
         if subdir:
-            src =3D os.path.join(rootdir, subdir)
+            modSrcDir =3D os.path.join(rootdir, subdir)
=20
         # If the module is released at major version 2 or higher, the modu=
le
         # path must end with a major version suffix like /v2.
@@ -130,82 +281,87 @@ python do_go_vendor() {
         #
         # https://go.dev/ref/mod#modules-overview
         if pathMajor:
-            tmp =3D os.path.join(src, pathMajor)
+            tmp =3D os.path.join(modSrcDir, pathMajor)
             # source directory including major version path may or may not=
 exist
             if os.path.exists(tmp):
-                src =3D tmp
+                modSrcDir =3D tmp
=20
-        dst =3D os.path.join(vendor_dir, module_path)
+        modDstDir =3D os.path.join(vendor_dir, module_path)
+        modDstLicense =3D os.path.join(modDstDir, "LICENSE")
=20
-        bb.debug(1, "cp %s --> %s" % (src, dst))
-        shutil.copytree(src, dst, symlinks=3DTrue, dirs_exist_ok=3DTrue, \
-            ignore=3Dshutil.ignore_patterns(".git", \
-                                            "vendor", \
-                                            "*._test.go"))
+        bb.utils.mkdirhier(modDstDir)
=20
-        # If the root directory has a LICENSE file but not the subdir
-        # we copy the root license to the sub module since the license
-        # applies to all modules in the repository
-        # see https://go.dev/ref/mod#vcs-license
-        if subdir:
-            rootdirLicese =3D os.path.join(rootdir, "LICENSE")
-            subdirLicense =3D os.path.join(src, "LICENSE")
+        bb.debug(2, "module source dir: %s" % modSrcDir)
+        bb.debug(2, "module dest dir: %s" % modDstDir)
=20
-            if not os.path.exists(subdir) and \
-                os.path.exists(rootdirLicese):
-                shutil.copy2(rootdirLicese, subdirLicense)
+        # Copy main license to package if it does not exist yet
+        licenseSearchPaths =3D [modSrcDir, rootdir]
+        if not os.path.exists(modDstLicense):
+            for p in licenseSearchPaths:
+                lic =3D os.path.join(p, "LICENSE")
+                if os.path.exists(lic):
+                    shutil.copyfile(lic, modDstLicense)
+                    break
=20
-    # Copy vendor manifest
-    modules_txt_src =3D os.path.join(d.getVar('WORKDIR'), "modules.txt")
-    bb.debug(1, "cp %s --> %s" % (modules_txt_src, vendor_dir))
-    shutil.copy2(modules_txt_src, vendor_dir)
+        # Copy source files
+        exclude =3D ["vendor", ".git", ".github"]
+        for root, dirs, files in os.walk(modSrcDir, topdown=3DTrue):
=20
-    # Clean up vendor dir
-    # We only require the modules in the modules_txt file
-    fetched_paths =3D set([os.path.relpath(x[0], vendor_dir) for x in os.w=
alk(vendor_dir)])
+            dirs[:] =3D [d for d in dirs if d not in exclude]
=20
-    # Remove toplevel dir
-    fetched_paths.remove('.')
+            pkgRelpath =3D os.path.relpath(root, modSrcDir)
+            pkg =3D os.path.join(module_path, pkgRelpath)
=20
-    vendored_paths =3D set()
-    replaced_paths =3D dict()
-    with open(modules_txt_src) as f:
-        for line in f:
-            if not line.startswith("#"):
-                line =3D line.strip()
-                vendored_paths.add(line)
-
-                # Add toplevel dirs into vendored dir, as we want to keep =
them
-                topdir =3D os.path.dirname(line)
-                while len(topdir):
-                    if not topdir in vendored_paths:
-                        vendored_paths.add(topdir)
-
-                    topdir =3D os.path.dirname(topdir)
-            else:
-                replaced_module =3D line.split("=3D>")
-                if len(replaced_module) > 1:
-                    # This module has been replaced, use a local path
-                    # we parse the line that has a pattern "# module-name =
[module-version] =3D> local-path
-                    actual_path =3D replaced_module[1].strip()
-                    vendored_name =3D replaced_module[0].split()[1]
-                    bb.debug(1, "added vendored name %s for actual path %s=
" % (vendored_name, actual_path))
-                    replaced_paths[vendored_name] =3D actual_path
+            # normalize the path, otherwise we get a "x/y/z/."
+            # for the main module path itself
+            pkg =3D os.path.normpath(pkg)
+            bb.debug(2, "  processing pkg %s" % pkg)
+
+            if not module_path in manifest:
+                bb.fatal("Module is not listed in manifest: %s" % module_p=
ath)
+
+            # if the folder is not a package, we can skip it
+            if not pkg in manifest[module_path]['pkgs']:
+                bb.debug(2, "  skipping pkg %s: not in manifest" % pkg)
+                continue
=20
-    for path in fetched_paths:
-        if path not in vendored_paths:
-            realpath =3D os.path.join(vendor_dir, path)
-            if os.path.exists(realpath):
-                shutil.rmtree(realpath)
+            dst =3D os.path.join(vendor_dir, pkg)
+            bb.utils.mkdirhier(dst)
+
+            for f in files:
+                srcfile =3D os.path.join(root, f)
+                dstfile =3D os.path.join(dst, f)
+
+                bb.debug(2, "cp %s -> %s" % (srcfile, dstfile))
+
+                if match_potential_source_file(srcfile):
+                    shutil.copyfile(srcfile, dstfile)
+
+                    if srcfile.endswith(".go"):
+                        resolve_embed(srcfile, os.path.dirname(dstfile))
+
+            # copy metadata files
+            src =3D root
+            while pkg !=3D module_path:
+                pkg =3D os.path.dirname(pkg)
+                dst =3D os.path.dirname(dst)
+                src =3D os.path.dirname(root)
+
+                for f in os.listdir(src):
+                    srcfile =3D os.path.join(src, f)
+                    if match_metadata_prefix(srcfile):
+                        dstfile =3D os.path.join(dst, f)
+                        if not os.path.exists(dstfile):
+                            shutil.copyfile(srcfile, dstfile)
=20
     for vendored_name, replaced_path in replaced_paths.items():
-        symlink_target =3D os.path.join(source_dir, *['src', go_import, re=
placed_path])
+        symlink_target =3D os.path.join(
+            source_dir, *['src', go_import, replaced_path])
         symlink_name =3D os.path.join(vendor_dir, vendored_name)
-        bb.debug(1, "vendored name %s, symlink name %s" % (vendored_name, =
symlink_name))
-        os.symlink(symlink_target, symlink_name)
-
-    # Create a symlink to the actual directory
-    os.symlink(vendor_dir, linkname)
+        bb.debug(1, "vendored name %s, symlink name %s, symlink target %s"
+                 % (vendored_name, symlink_name, symlink_target))
+        if not os.path.exists(symlink_name):
+            os.symlink(symlink_target, symlink_name)
 }
=20
 addtask go_vendor before do_patch after do_unpack
--=20
2.30.2


