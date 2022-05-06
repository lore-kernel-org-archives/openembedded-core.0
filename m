Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8785FC4332F
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 07:00:45 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.85])
 by mx.groups.io with SMTP id smtpd.web10.6635.1651820433030208227
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 00:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=M+Yqcn9W;
 spf=pass (domain: weidmueller.com, ip: 40.107.13.85,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQbSZxmC8J6Yei83GG86kvN1/Vr3DoV6Q0ET5qOKpIsVQ3K1xQZJg67Uepfe2pJPBgT4Rel50Xnx/nPZLw9Z5f12NXzhwpAxwcG7dua83cHZ+10FqIvcQMT/DSMcTXnECbC755SE5bFhpysWDpTz97PPY7RdyJEjA0yYsRP/mRK7rGT6fEoyjTh+iJ105sAr50pYYH39n/j9w75nqBztXUA4IGGL3/6msO8h3eeedXFFPEJee+XDFWWfYhngXXxdg/Wkd91Ww5b0uU5RJMZm0bpGALGSOIje1aVv4Yj6CdlH9LBeLG1FqNsHXA9K0xnD4Qo1RrNpaf2RxbGdgMBRHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRj4VY9att/NO2nFDk4Dh6yiv8xluf+xjJUTqe9bAO4=;
 b=EsRsUKET7AyORCKt5EkuFWfQDwA/DKxnNXhb4BQDYctzRjW/XPn6FrZh8x8MatrnHyERpJnxf4XD1BwqqWW0MdILS+vxkbFfnGN4ihSW3pT+vMRMMHC5znDVCQoxEH5+1btIr880u1d3hEX7GsK+5086S6Y7HL8Gsr6lZXg/RvAHt5j3k2F2u+GFs9VxBLTzu/om6Y8/u2JH3yt465NMmfaV92GB8BKIjYrTjQ6+BQS9gzMkW86I6fUHNmDJSE7Qjyw3ddmiC8WBuTLCGLP58XIcVdKan1B64OrNgzRyxWivxK/SIRNgWwIrzXZdyxpzTfpiUfGypQTtpLY2o6fnFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRj4VY9att/NO2nFDk4Dh6yiv8xluf+xjJUTqe9bAO4=;
 b=M+Yqcn9WwE0BkRBHnxL6VjLfEqPUu5F1Dc//d9EbnVraFNDYEoLpugiTrePolfJyym32dn9cBeRGplyWeB3l3wzY2T/C79Fi83pXz45hrlVPPU5DYtXLS4XSo3WpzTKz6FXcttxCJ3MZW1JEpxzOA4WsbUaf4n4HBRldHX0ei8M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by HE1PR0801MB1881.eurprd08.prod.outlook.com (2603:10a6:3:55::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Fri, 6 May
 2022 07:00:29 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f938:78d7:da4b:8d23]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f938:78d7:da4b:8d23%8]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 07:00:28 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Lukas Funke <lukas.funke@weidmueller.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 3/5] poky-meta: add go vendor class for offline builds
Date: Fri,  6 May 2022 08:59:15 +0200
Message-ID: <20220506065917.1375-3-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <20220506065917.1375-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20220506065917.1375-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0090.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::7) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 034dd016-d75e-4559-e705-08da2f2e1a60
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1881:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB1881C4F4A398B71600214291D7C59@HE1PR0801MB1881.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i1BpxRWlqvQLyxHSpkXmlowCrGHYze0VfF+n4ySaXnvptq7vQWP7jIoWXme/yXmk6rUVayRaLLL5Ehib38eakEcM7Hpbh6M+raYYd4ylao2CHBbnTVfBU8Z3HaUpCzt28PkxaW9hbVHf3QHCvvQgl2ZkFDWz1Wkws54J+k/vZKiUZPJmPS0wQCy1aMpLrWDDfowrE6cIzPBCVIHGPGLMch19S3pRtW+T6xnFHuMepHTM295poc15vKLVAmiFCq3qjPwzFhAMn+HtkID5rcItmGeLXjuzoNpvR4YKMzqySSehUPoj2d4tz1f7MO+JouIPGI/jKWLzWJXaXPNlkApWP2NhpAI+071IcIZ1UM5slq0JGMGhQqp6BivWjataXIlhFuRzGPHD4dQmpK7YtpFXCsk3RlE6V8wxbcq1KowTwDgUX5PzCY/zO5FcOvyBGz8aTw0SnsaO3Zzkpk21otMbJvJMNdEZY+fDeu1JFSf20w12INt47ZvLPan1BCFg8xXfTVXP7fTMnEo4pefR8i33OK41Ov8mKQAvKQ86L/XKuwJIoNnPnVIlUZzTF7eEk5hjqdQ7hkSo1tX1GP9uxCtH6bz8eiguJ6seREAbEVbvBGG9Dkdiyh++VwWEuKDvH1/UBsyB6w6FFrlHkoAAyX2an2yelChi1EIOF86BhBh9+kZWr/c8HHdALL91qBs4ziEPUspTZatpMs/TRHn5j1Lhkg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(6486002)(5660300002)(316002)(38100700002)(38350700002)(2906002)(6666004)(83380400001)(8936002)(508600001)(52116002)(36756003)(1076003)(2616005)(86362001)(6512007)(186003)(26005)(19627235002)(54906003)(6916009)(4326008)(66556008)(66476007)(66946007)(8676002)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UhaKjACTo11klOIH8DZpqEwiKiY0xaf49qfDY3oiJmQuA3uhYP2HME+QYym2?=
 =?us-ascii?Q?olBZxSoYPZe2DKhpwfHHeHC0zCP2tefm/tE6w0fgTJxb31Lhqp0Xz5Iet5Kh?=
 =?us-ascii?Q?oM6t+WHQXcfmhN9MCR2lXJ8lETiBJSNVTW7fsVzth7hGQO4spKhbOTyN1bWz?=
 =?us-ascii?Q?2cSpWU741pPVWimVh8c90a/F2NLJjlmApf6C258EeqN+MVfuuYmDcZHWwblE?=
 =?us-ascii?Q?Ll/InlSoJnE0mAe0v+JPZF6OsdPZMFNSMXeExjsgD2a7F75yDevHN1jg31DT?=
 =?us-ascii?Q?JS3fp3ePAh+gFBaTGCoTwPOX+bd8O+ESFaBBpeoGhSMgg0DqieMsezkVOHIX?=
 =?us-ascii?Q?YFxh8MY8fXfYIL0iJTN9UFLhBQrPFUGEk3N6UJLA42gI48iOkDr4OV0wtxKW?=
 =?us-ascii?Q?i7pe0IKPy5V9OQHvE7DDeLoCySnN3jEOfBxgGjI66f67O1VQsdB4RS2YrLC7?=
 =?us-ascii?Q?8RbYfh77Cui33uRV7B10OE9A/Ml60E9gAQdyUk6VoPkAfkcn6K2czNgu2DAV?=
 =?us-ascii?Q?38VKmOQrMayLM6DAVBSfGK/2vwtjiuE2HHicHIpnJCxUMfxs/x0A4FjvdxgL?=
 =?us-ascii?Q?eEdFzTpzb7B0vbHL1OwZeNNqgoU//mKn0yTkdEpBPu2jmyomQcpPRabpnkd8?=
 =?us-ascii?Q?4wmN7UQV5NnIUiX0frCzzCA5xLHoRVAa/+nYM4rU1nVTRgO2mVzNxqm8ZsP1?=
 =?us-ascii?Q?CrY9o2ZYCuvIneentJJUBK14WtONpF7wHDNu1GisOwHWEyzVluwKy4ULnSVZ?=
 =?us-ascii?Q?9HyPNIG+UwApiWY3643uYrMf6C1w8f+KkrkkknSULwRna5yUt5IfjKd1leJU?=
 =?us-ascii?Q?Ae9/CzFB07Gk5kN3rc5c2+gGXtz0X/sPC4kIVN3mTbzEjHcRUPIuzhV2C97y?=
 =?us-ascii?Q?H7X/qbHYuPm5TddJf+yjd6JgTTP6slDRsNfe/+cBZ5dx2uLG90dc9FUJlTOq?=
 =?us-ascii?Q?0kNbjUaG2Ezer7LZVSt3HRyILzAVHeTzPVptA+iKQLjBIo/H6gDg33kb1Awt?=
 =?us-ascii?Q?V0DxazT43/A0VxkWqCl9A4MPU4OV8s7/18eNaV4laeIiiv43hnpGsIxIppeI?=
 =?us-ascii?Q?np8rfgmvxgROc7GFg5eegjfceO5WZs9bqVlN5kn36ESIY7MfqMlQldF4N1XD?=
 =?us-ascii?Q?01mhrGO1BEiE+y4uyo/IGF/mQXuUzWFRKxxzE4/eOipyziYPjCcZiFn+Nh5z?=
 =?us-ascii?Q?//To/9fbQrVTEcC282zg/NRGA8HKgxEys37XU3nTSUeAxnc+Iil5Ldw7QAYb?=
 =?us-ascii?Q?EIKIvx+lAhDREBysBCp75IfzmlyF4yHQYfkguULvSsbOrDz2Z1s99Q1J2Kmk?=
 =?us-ascii?Q?8riKA66k52h/XxdURyQ5grDTEWwRbA8je62xFliHmVcwIGKlTKJuTsfzspiX?=
 =?us-ascii?Q?Qn+DRNParr30C3Aiq3ZXkE86Jl4sQv15JceI2+v4658T3oDCXncfF/8cV7uX?=
 =?us-ascii?Q?wkn0DwBVSRAh0Ogv9z8DFcHLDhcGH3gPX5lJ1zFOu5lXcSsC/8/ZQhPWDaPg?=
 =?us-ascii?Q?+Lfv8gBp8laSGXGvrG+adYWJbfAfzeTx1t8A/VxICsdvnKuv2Ck1/nAQZqP6?=
 =?us-ascii?Q?Vmulfh/RBokoHIsqw6VpvJc7jtXBZtQhUMdH89dJi8GotdaZ7zNqCkIVrtN4?=
 =?us-ascii?Q?9XHaIr6VMcbSUEgZSRjT7ZrrShewpEY44sjnyyduvl2hM6j4ui2w9OxiJw9b?=
 =?us-ascii?Q?TT6WKaJ/Ve+nFaltVWPgXH5E7zvcPLe9nmaxS4H/AF3bISHhz2LBrXFYIFSD?=
 =?us-ascii?Q?DMz7giHikU6DmhJFN5dtbVW6gYK12bQ=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 034dd016-d75e-4559-e705-08da2f2e1a60
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 07:00:28.5311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mRvAWf5i0PzyLc6i2OVLbEFfkRJfuWnjjTfMfhE199gYQw43L0HeaupTlYd4MJSUQPq+5FjDh9UVWK59fA+p9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1881
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 07:00:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165324

From: Lukas Funke <lukas.funke@weidmueller.com>

Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes/go-vendor.bbclass | 68 ++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 meta/classes/go-vendor.bbclass

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclas=
s
new file mode 100644
index 0000000000..a1a740a1fc
--- /dev/null
+++ b/meta/classes/go-vendor.bbclass
@@ -0,0 +1,68 @@
+# Copyright 2022 (C) Weidmueller GmbH & Co KG
+# Author: Lukas Funke <lukas.funke@weidmueller.com>
+#
+# Handle Go vendor support for offline builds
+#
+# When importing Go modules, Go downloads the imported module using
+# a network (proxy) connection ahead of the compile stage. This contradict=
s=20
+# the yocto build concept of fetching every source ahead of build-time
+# and supporting offline builds.
+#
+# To support offline builds, we use Go 'vendoring': module dependencies ar=
e=20
+# downloaded during the fetch-phase and unpacked into the modules 'vendor'
+# folder. Additinally a manifest file is generated for the 'vendor' folder
+#=20
+
+inherit go-mod
+
+def go_src_uri(repo, path=3DNone, subdir=3DNone, vcs=3D'git', destsuffix_p=
refix =3D 'git/src/import/vendor.fetch'):
+    module_path =3D repo if not path else path
+    src_uri =3D "{}://{};name=3D{};destsuffix=3D{}/{}".format(vcs, repo, \
+                                    module_path.replace('/', '.'), \
+                                    destsuffix_prefix, module_path)
+
+    src_uri +=3D ";subdir=3D{}".format(subdir) if subdir else ""
+    src_uri +=3D ";nobranch=3D1;protocol=3Dhttps" if vcs =3D=3D "git" else=
 ""
+
+    return src_uri
+
+def go_generate_vendor_manifest(d):
+
+    vendor_dir =3D os.path.join(os.path.basename(d.getVar('S')),
+                                        'src', d.getVar('GO_IMPORT'), "ven=
dor")
+    dst =3D os.path.join(vendor_dir, "modules.txt")
+
+    go_modules =3D d.getVarFlags("GO_MODULE_PATH")
+    with open(dst, "w") as manifest:
+        for go_module in go_modules:
+            module_path =3D d.getVarFlag("GO_MODULE_PATH", go_module)
+            module_version =3D d.getVarFlag("GO_MODULE_VERSION", go_module=
)
+            if module_path and module_version:
+                manifest.write("# %s %s\n" % (module_path, module_version)=
)
+                manifest.write("## explicit\n")
+                exclude =3D set(['vendor'])
+                for subdir, dirs, files in os.walk(os.path.join(vendor_dir=
, module_path), topdown=3DTrue):
+                    dirs[:] =3D [d for d in dirs if d not in exclude]
+                    for file in files:
+                        if file.endswith(".go"):
+                            manifest.write(subdir[len(vendor_dir)+1:] + "\=
n")
+                            break
+
+python go_do_unpack:append() {
+    src_uri =3D (d.getVar('SRC_URI') or "").split()
+    if len(src_uri) =3D=3D 0:
+        return
+
+    try:
+        fetcher =3D bb.fetch2.Fetch(src_uri, d)
+        src_folder =3D os.path.join(os.path.basename(d.getVar('S')),
+                                        'src', d.getVar('GO_IMPORT'))
+        vendor_src =3D os.path.join(src_folder, "vendor")
+        vendor_dst =3D os.path.join(d.getVar('S'), "src", "import", "vendo=
r.fetch")
+
+        os.symlink(os.path.relpath(vendor_dst, src_folder), vendor_src)
+        go_generate_vendor_manifest(d)
+
+    except bb.fetch2.BBFetchException as e:
+        raise bb.build.FuncFailed(e)
+}
--=20
2.30.2


