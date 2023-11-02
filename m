Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9C1C41535
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 15:53:29 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.59])
 by mx.groups.io with SMTP id smtpd.web10.34981.1698940405841993678
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 08:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=JbpvjkvN;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.59, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2g2okfomYMD/n4k07Kr6v7O57cV8WIu0hgJolyll2ADSGX6kwKgU5TENYMJFvduEqpn3d4mNOGxMimQIygGBDGx/zNUdV7nC/ZHl2Xadf+e5I9+408aOLGeP4bvOKLUo1+WfBX/9KShrVlS8LbDm5mk6s+Pv+jfrrXAHzisx3nA6n6vHGTVhe9KmQ62tkV3Qa94IJHBO7xPRyd65cctZevGjAuTm0TVLhNJJ651VjHLd/knO9tpcPwyfBYLNKTn7KGh4V2UrOPPMAlgyjOK5mxIBksBGMJOedFXxQEgwFCMMXGpvmg+NHpyCWP6pfISaKtLIFxVivPzigrY03foLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vGfgXRRyJOyeOB8xAqrx6Q6krN355Gi73g2EqyQ5gE=;
 b=DlCSMIHYIfuPMzEYofAKPu+f/WAKUAeeNxcc6F8QEQFpkJNCm+zS85quy0Ji/M41YdQ4JYnZcPOP3TwJym1n3CZzkro1qT3rep/G3FRln6girTvSNoKnp0QHGNn2Q3mdam0bCLiCRCozqhUPFAIrYIzM235HufpMvH0SgXM035JYURbQOkXOAfhuPze+KdP2VuL3i1vKGFKornNh8b7Uq0wKZgK77EG0F14+yArGww/W/9vBPkdeB/XO9maTrudW67+TE+E6uxuaAxbXGlHoa82JcowQBBUqtsxDtOJuDv+2OF5gP34nmSqP/UQZzJ0ENXiwQTKEeFLUywEDpv3C3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vGfgXRRyJOyeOB8xAqrx6Q6krN355Gi73g2EqyQ5gE=;
 b=JbpvjkvNDGVQvs82YxsoFg66ernqGpvNgirV2lmr4sZrbmAdhUokuFi5mglkorU4vzRJZT0myPX8lR8GP8CpAUu3iwredrRNShzb19O0DUjm1FOprbld2qxwA/TfCBoV8Np95GFn2M2YogPrTFoEOCm5Yp6aiTRmovQKaJEoIYo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by PAWPR08MB10059.eurprd08.prod.outlook.com (2603:10a6:102:35d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Thu, 2 Nov
 2023 15:53:22 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::c337:aad3:ff97:b20c]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::c337:aad3:ff97:b20c%7]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 15:53:22 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	u.oelmann@pengutronix.de,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [OE-Core][PATCH v3 1/4] classes: go-vendor: Add go-vendor class
Date: Thu,  2 Nov 2023 16:53:10 +0100
Message-ID: <20231102155313.309534-2-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231102155313.309534-1-lukas.funke-oss@weidmueller.com>
References: <20231102155313.309534-1-lukas.funke-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0189.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::20) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|PAWPR08MB10059:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d20a678-5a36-4ae4-6109-08dbdbbbd6ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ucv+wORl2mV6pw1wCF/X96ciwnz7J4uHIeuIIxEk/U52PruANDH1Z7ZT2qy3KbzJGLcbot9n87Xox3wYq4Gk5Zb5MF1e7QJA4pLMb1fEM7yHxRfgjmG/s5428LrUoYguigMbXE+OiQ7BdyVkKyc7yxLvPuSqtc4Mj78au9owXw8mNOF/bx76Bjcit65FeHwx3qCbLmqw0M+YNGYhy42UNkU5GkgPTQTqNIsqcb3dQFJVm1/t0Yc2oXdGf4MdHuuBNLTUCCiLt7kfvcpPIoenUndgfm+Da87STIlguuxvDHDkHP1foL40uJna3f3fmOMjD2DNBdCjPePxsJlD1iLzhoP4JF42BDRVjLaFUZh9MPq/ZRH8+oZDutH2DjHmP5IDdoLsEA842glfeDc2tsWNgriPN6dbP2bco410tHLY5cpFvcNKOzS5pHgD6pACYmpaFWpDi0j9jQT6zTs/Yz2UiWItTtLPFzeuiihyjOItNll8X4OpyaVPszXE4LgfgqmUimsfm8+/xwoORFlraEzmHWG3LyrdEmky1TRLo3oJrJ+p9Eqq1OHWMqi6SkrFZb0algFZzVcwsLF1arV7cWdqP07oN2zWb7lxcmGUA3eDD7NWjtzEiaBfEVy98ziIYvUz9T7J9TdiXu0WUZrHinOFtg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(366004)(396003)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(84970400001)(478600001)(6506007)(52116002)(83380400001)(38100700002)(1076003)(107886003)(2616005)(6512007)(9686003)(41300700001)(2906002)(86362001)(36756003)(5660300002)(4326008)(8936002)(8676002)(6666004)(38350700005)(66556008)(66476007)(66946007)(6916009)(54906003)(316002)(26005)(966005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1XvL9PGOzc1J+uCEa1i53gIkzTSmgXvSOAxpY8SEhd/HM7+UbeuTOd12A40x?=
 =?us-ascii?Q?905skw0zcpwlU2GFw+OksHByjmgW8LfAt3cz91rPMX2R1h3KqjmaL7u7kB+x?=
 =?us-ascii?Q?P4HKAa6bRbRz0V8J0PmADlsrQd2vRu1k1di2ms4Y/ergweEYsihpvoIIZg93?=
 =?us-ascii?Q?0kh7zabdaTq255ieWipALMf/y7Dft/KEte8f45sZRUEdk6/ZAIRzxPMNmnE8?=
 =?us-ascii?Q?1U/fq4dWWpNljknAtOx/f6KTV30RNYya1TbUmBfnTTqawNZcPtpKg/fRaEGJ?=
 =?us-ascii?Q?DynmoO5VQdaVlZNBZQebCybD0UvFpwG3ddietGAwWvYyBDWNhOM7mIb3nJ3y?=
 =?us-ascii?Q?UejoxH8Zj9VWTsEMYVANAlMRY44/vG+XNIEu4CcOQ3F4+9lGDRZVQZfCF0Le?=
 =?us-ascii?Q?NX5tqlYRwjZ6hZtd4cOLRViKKcQELHnSd/CEsR/xR6r38umImvfMVc5pdX33?=
 =?us-ascii?Q?ZnDkew+90zdlAj9Pvph2wGuK5mX2yUZWPxTK+IFOFbnCHAZPg+XFPX8D1YTI?=
 =?us-ascii?Q?ZcUZbuG9utI3pTDcBElMD84Z1KXyMNdOC5X+Aby1aCvhKoQ3h7jw2Oa4pRV7?=
 =?us-ascii?Q?ICjW4cxZaX8ebDpfrgno/wsKqXgoxXzD1St+1UaLvScqAHrYBq/CRjRXT5ml?=
 =?us-ascii?Q?l7ZcfdMOi+QJFNySgvT82WM4otQ1E5Kt8GZ6tpw6zD/P6zvxmYbkJA5MFl4z?=
 =?us-ascii?Q?0IPAxZwFItMcLQjD1EpFsuwnT4vkmLRSpIEK2Nr5ZQfZDIN705UKbC9bbyJ4?=
 =?us-ascii?Q?dnCWRBoDGvZRHjG9jC0ZcevZEe2r5pvwE/W1FLlhG53z2zAEscaWXZHuE7lg?=
 =?us-ascii?Q?K0KLMy/U13nFRVBYHMWbjZUrJRpX76h1GrPsmbTfs898/moTOsqY9ftfYej1?=
 =?us-ascii?Q?y/Pv4EV4loP734n7F82MHC5tyYkVRNUAPB6q78cv7rx96y2WVtaWlATrtK6x?=
 =?us-ascii?Q?0iipcXbazuPksi/3BDcgrWZkd1QvOR/lhuqRUTLk6D4aaSUFFSsvhVcURcEc?=
 =?us-ascii?Q?Maf+KkJJaalnc4hKJe9D9LJHPbYVG15tiBsejYwsq5z9l4BT6ojv8Q6/WcVV?=
 =?us-ascii?Q?u/CagsPoqbmoBJmSzg49dhtfY4j3i1sKY6xt8zMDkUCc2Z3b0XPmCvX2B/4n?=
 =?us-ascii?Q?3Lcss53SzNqj7YYATXGRw6lFvTRFdbD76ZeVNmkPCc6obQLJ/bzJ1bmYwv9x?=
 =?us-ascii?Q?FO0x0fgQUp8nHf2bNGVUh8x0KL4dohay5P8MZwF9+8xunl1eBDE+VMyJgwtq?=
 =?us-ascii?Q?6fmPxDFbH2mLpk0HZ8yoj/57XAUT03Qc5f3NSz2Mlvrm61Y3b0j+v60Kwbev?=
 =?us-ascii?Q?nfmsq2pYIwe2WLfudniFKR+9RT127BB6dZ78CNs5HT0z9gbhT7D72sfz0QjS?=
 =?us-ascii?Q?yxQLG0G++vaKfhkJe/2o0Ke2uEnXv3PGtNB6PfhzxHc8RI+Tl3nfxHKrgK0p?=
 =?us-ascii?Q?QKClNEbss9l1NYog1G8yfL9u8E8tw2Lo/C93rbqN82vAsviei1f36duZdqAb?=
 =?us-ascii?Q?hFcO7Or0Lzzx21TzSxGeYltCmzbWWKKtJKxunbX7IGNiJrkUik7Mm6MB0+4U?=
 =?us-ascii?Q?h+qpjl5tJrIZoU5Qddr3m7qbgijP6tjJ4LfdCHnrFsQopTPlxeC9QhoPdcum?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d20a678-5a36-4ae4-6109-08dbdbbbd6ff
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 15:53:21.6932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vqEcFdrScn3P39gktoOr1J+dNqAOgkXmUpbp7bDZYDD9xxN6Cajs6SM6UsIX+eyNxI+q+XbIfe0jZlerYTtKCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 15:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190084

From: Lukas Funke <lukas.funke@weidmueller.com>

Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
---
 meta/classes/go-vendor.bbclass | 200 +++++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)
 create mode 100644 meta/classes/go-vendor.bbclass

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclas=
s
new file mode 100644
index 0000000000..5b017b0b9d
--- /dev/null
+++ b/meta/classes/go-vendor.bbclass
@@ -0,0 +1,200 @@
+#
+# Copyright 2023 (C) Weidmueller GmbH & Co KG
+# Author: Lukas Funke <lukas.funke@weidmueller.com>
+#
+# Handle Go vendor support for offline builds
+#
+# When importing Go modules, Go downloads the imported modules using
+# a network (proxy) connection ahead of the compile stage. This contradict=
s=20
+# the yocto build concept of fetching every source ahead of build-time
+# and supporting offline builds.
+#
+# To support offline builds, we use Go 'vendoring': module dependencies ar=
e=20
+# downloaded during the fetch-phase and unpacked into the modules 'vendor'
+# folder. Additionally a manifest file is generated for the 'vendor' folde=
r
+#=20
+
+inherit go-mod
+
+def go_src_uri(repo, version, path=3DNone, subdir=3DNone, \
+                vcs=3D'git', replaces=3DNone, pathmajor=3DNone):
+
+    destsuffix =3D "git/src/import/vendor.fetch"
+    module_path =3D repo if not path else path
+
+    src_uri =3D "{}://{};name=3D{}".format(vcs, repo, module_path.replace(=
'/', '.'))
+    src_uri +=3D ";destsuffix=3D{}/{}@{}".format(destsuffix, repo, version=
)
+
+    if vcs =3D=3D "git":
+        src_uri +=3D ";nobranch=3D1;protocol=3Dhttps"
+
+    src_uri +=3D ";go_module_path=3D{}".format(module_path)
+
+    if replaces:
+        src_uri +=3D ";go_module_replacement=3D{}".format(replaces)
+    if subdir:
+        src_uri +=3D ";go_subdir=3D{}".format(subdir)
+    if pathmajor:
+        src_uri +=3D ";go_pathmajor=3D{}".format(pathmajor)
+    src_uri +=3D ";is_go_dependency=3D1"
+
+    return src_uri
+
+python do_vendor_unlink() {
+
+    # We unlink
+
+    go_import =3D d.getVar('GO_IMPORT')
+    source_dir =3D d.getVar('S')
+    linkname =3D os.path.join(source_dir, *['src', go_import, 'vendor'])
+
+    os.unlink(linkname)
+}
+
+addtask vendor_unlink before do_install after do_compile
+
+python do_go_vendor() {
+    import shutil
+
+    src_uri =3D (d.getVar('SRC_URI') or "").split()
+
+    if len(src_uri) =3D=3D 0:
+        bb.error("SRC_URI is empty")
+        return
+
+    default_destsuffix =3D "git/src/import/vendor.fetch"
+    fetcher =3D bb.fetch2.Fetch(src_uri, d)
+    go_import =3D d.getVar('GO_IMPORT')
+    source_dir =3D d.getVar('S')
+
+    linkname =3D os.path.join(source_dir, *['src', go_import, 'vendor'])
+    vendor_dir =3D os.path.join(source_dir, *['src', 'import', 'vendor'])
+    import_dir =3D os.path.join(source_dir, *['src', 'import', 'vendor.fet=
ch'])
+
+    if os.path.exists(vendor_dir):
+        # Nothing to do except re-establish link to actual vendor folder
+        if not os.path.exists(linkname):
+            os.symlink(vendor_dir, linkname)
+        return
+
+    bb.utils.mkdirhier(vendor_dir)
+
+    modules =3D {}
+
+    for url in fetcher.urls:
+        srcuri =3D fetcher.ud[url].host + fetcher.ud[url].path
+
+        # Skip non Go module src uris
+        if not fetcher.ud[url].parm.get('is_go_dependency'):
+            continue
+
+        destsuffix =3D fetcher.ud[url].parm.get('destsuffix')
+        # We derive the module repo / version in the following manner (exm=
aple):
+        #=20
+        # destsuffix =3D git/src/import/vendor.fetch/github.com/foo/bar@v1=
.2.3
+        # p =3D github.com/foo/bar@v1.2.3
+        # repo =3D github.com/foo/bar
+        # version =3D v1.2.3
+
+        p =3D destsuffix[len(default_destsuffix)+1:]
+        repo, version =3D p.split('@')
+
+        module_path =3D fetcher.ud[url].parm.get('go_module_path')
+
+        subdir =3D fetcher.ud[url].parm.get('go_subdir')
+        subdir =3D None if not subdir else subdir
+
+        pathMajor =3D fetcher.ud[url].parm.get('go_pathmajor')
+        pathMajor =3D None if not pathMajor else pathMajor.strip('/')
+
+        if not repo in modules:
+            modules[repo] =3D   { "version": version,
+                                "repo_path": os.path.join(import_dir, p),
+                                "module_path": module_path,
+                                "subdir": subdir,
+                                "pathMajor": pathMajor }
+
+    for module_key in sorted(modules):
+
+        # only take the version which is explicitly listed
+        # as a dependency in the go.mod
+        module =3D modules[module_key]
+        module_path =3D module['module_path']
+        rootdir =3D module['repo_path']
+        subdir =3D module['subdir']
+        pathMajor =3D module['pathMajor']
+
+        src =3D rootdir
+
+        if subdir:
+            src =3D os.path.join(rootdir, subdir)
+
+        # If the module is released at major version 2 or higher, the modu=
le
+        # path must end with a major version suffix like /v2.
+        # This may or may not be part of the subdirectory name
+        #
+        # https://go.dev/ref/mod#modules-overview
+        if pathMajor:
+            tmp =3D os.path.join(src, pathMajor)
+            # source directory including major version path may or may not=
 exist
+            if os.path.exists(tmp):
+                src =3D tmp
+
+        dst =3D os.path.join(vendor_dir, module_path)
+
+        bb.debug(1, "cp %s --> %s" % (src, dst))
+        shutil.copytree(src, dst, symlinks=3DTrue, \
+            ignore=3Dshutil.ignore_patterns(".git", \
+                                            "vendor", \
+                                            "*._test.go"))
+
+        # If the root directory has a LICENSE file but not the subdir
+        # we copy the root license to the sub module since the license
+        # applies to all modules in the repository
+        # see https://go.dev/ref/mod#vcs-license
+        if subdir:
+            rootdirLicese =3D os.path.join(rootdir, "LICENSE")
+            subdirLicense =3D os.path.join(src, "LICENSE")
+
+            if not os.path.exists(subdir) and \
+                os.path.exists(rootdirLicese):
+                shutil.copy2(rootdirLicese, subdirLicense)
+
+    # Copy vendor manifest
+    modules_txt_src =3D os.path.join(d.getVar('WORKDIR'), "modules.txt")
+    bb.debug(1, "cp %s --> %s" % (modules_txt_src, vendor_dir))
+    shutil.copy2(modules_txt_src, vendor_dir)
+
+    # Clean up vendor dir
+    # We only require the modules in the modules_txt file
+    fetched_paths =3D set([os.path.relpath(x[0], vendor_dir) for x in os.w=
alk(vendor_dir)])
+
+    # Remove toplevel dir
+    fetched_paths.remove('.')
+
+    vendored_paths =3D set()
+    with open(modules_txt_src) as f:
+        for line in f:
+            if not line.startswith("#"):
+                line =3D line.strip()
+                vendored_paths.add(line)
+
+                # Add toplevel dirs into vendored dir, as we want to keep =
them
+                topdir =3D os.path.dirname(line)
+                while len(topdir):
+                    if not topdir in vendored_paths:
+                        vendored_paths.add(topdir)
+
+                    topdir =3D os.path.dirname(topdir)
+
+    for path in fetched_paths:
+        if path not in vendored_paths:
+            realpath =3D os.path.join(vendor_dir, path)
+            if os.path.exists(realpath):
+                shutil.rmtree(realpath)
+
+    # Create a symlink the the actual directory
+    os.symlink(vendor_dir, linkname)
+}
+
+addtask go_vendor before do_patch after do_unpack
--=20
2.30.2


