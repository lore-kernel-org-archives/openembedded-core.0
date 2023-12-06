Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CADC10F13
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 19:22:40 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.61])
 by mx.groups.io with SMTP id smtpd.web10.42350.1701890557773064591
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 11:22:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Zu2xE8HW;
 spf=pass (domain: axis.com, ip: 40.107.22.61, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdqDXZR/lETYGEkFAiidwjUKOLq6vO3NPzZGY6hk7LqQHrqtutTRNAES244DUewlWcOOJef3KrE6Mho//yUByTxokU4HVcEdNtJcwy4Sarlhf6WR7SehbI4zTBpj6uu7b7BEatqYK7lcxwafMCStdZMjzAoJ/6NVempAJtDk545ohRvzGA6iYrJ7WAKDG1jvBL74Cw5Ksv4fQvStxBktrjeKXswJuEF7S5zTAardR1wjBs9PKKi/AdVtpq0BmHhN/cIGDAZn1XblbhuNBLr4WaEmP6Vm4Ip+dbnhzXqXAqZMkkQRQ43E/jgjMbOVfv2+8xXpV1h/6K7u8c8CXagglg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+KmaAhglqfZ9SeY7uzgEDpigOK+XbwEi76JV8HJEm0=;
 b=lCsb/dAMOqbY463zXJn/RweORHifrGSai7vTiKtdn5hMbdrSIGmxA0tPBk5t/+hCIyNx1fzoDq7nOibrnhnxTzOB90D9LJvVMacptkgfuPEUWvpzoD2sE7PtZxXfxrGWtxIsdP3VYpR6JkWanAY1Tzd+WZZrtODgou3pm1+0vkGoowZdspY8fPMdqk/cQyK5KnQcR6E88n+BZ/iF/gBkC3Bqx8v/DuvdYfQYtD2Sz42hgcePRsym2ppKMwZrrPxC7mrnB9csBUZ6LlQ21afPOZbuDbHLd7/yTiXzo+Nwkv55V5FIUthUL6iznDnOcSifMyNVnjMYfqxgBoUjoC8kpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+KmaAhglqfZ9SeY7uzgEDpigOK+XbwEi76JV8HJEm0=;
 b=Zu2xE8HWOLXRZWzBZjxtcexS04I3J+gAnEzYD1jm1Ws7qGpHxQ0fTNbdnZqyhieZex/71cguoetmmTQJiwvveUFCynxMrAvLBWeZq02PO7QWGJ/K1QDCahhs1oND24EXPvNmXPOAZWDpK5U7t0XVWEmhg/aj0a5pbAoMb7AZPwM=
Received: from DB7PR02CA0021.eurprd02.prod.outlook.com (2603:10a6:10:52::34)
 by AS4PR02MB7926.eurprd02.prod.outlook.com (2603:10a6:20b:4b5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 19:22:35 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:52:cafe::e9) by DB7PR02CA0021.outlook.office365.com
 (2603:10a6:10:52::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Wed, 6 Dec 2023 19:22:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 19:22:35 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 20:22:33 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 6 Dec 2023 20:22:33 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 14F77F5C4
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Dec 2023 20:22:33 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3B6JMWBf2838193
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Dec 2023 20:22:33 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3B6JMWjh2838192
	for openembedded-core@lists.openembedded.org; Wed, 6 Dec 2023 20:22:32 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 6/9] recipetool: create: Improve identification of licenses
Date: Wed, 6 Dec 2023 20:22:04 +0100
Message-ID: <20231206192207.2838077-7-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231206192207.2838077-1-pkj@axis.com>
References: <20231206192207.2838077-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B621:EE_|AS4PR02MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a7a54ca-c65e-464f-29d9-08dbf690b385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	74FXmB+m6X3tyZbZxQX+JgDx+lzgopT29T2lzcltR/v6ysFu71Mmy5MhjC1pWA+BHVHVPgs3JDujWbXwo980Ldd9p9SXZZvxOcrDQD6jT30mdEX8QYcfBqdV+INM7E43Ctsy7QwOKj7pyQNJsbNJKE95u2rdOZMjzKTtNKiIYVb4G2BOdRNxJ3/e3V3DJnoK+BUHr6LX73FPAwyyikpb8aNed/k3t4v9HAwiuhMRekUTmDTefaNBXjJFwdf+qqjbggiaT8HuTcCKIUKv+mCOPlpDbOnQpX8RGPnMwSriR0l2o+SvxjRRmhl6qWTCFxwLAirhJKQsFnyeomYE6dtsjLFnB26hC1Gg20ip/9/JBVE3CbF7WGyjtg1Jt1EmyU9/XXC44KNopJtSBBoZ81BhIIrkZ0uJy0ryI+8w73xACOF/5ccW87Euh/GbgH+bxIsrQH6BxoiOn1jx1dwmYALUop579aaHOpNfMbGq4idP5sgtw1exAwauflGhqvebT9sel02PaPRb3J7v157x3ltY3Yr0yREcpVUTMKVTRHpCwKOED6x7d5+5TMgKVqzlzB6gso42R5k7mzXp/6oCtZEU6paf0OBpnUE2fFayF3mqYs9suQr9ExK67eCcdlNtnVTrbgeDLPmRfc+ucdNv3tqX+0Zjo3C6HJDRFw1NKyved2Hzeppkucg4mxH37q0eFFlgcG4gCEwZuuRKuiQPCIi/vvoe2zpaIFMnelnNDjDBbA6Peu2bi3n/X1lBxHlD5f2mGzurHMl+o2ouDGGykk2ltfeJ89/iod1Hpa5GU+yKdLLDoisFSX3zlnvMfQtnvmN6
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39860400002)(230373577357003)(230922051799003)(230473577357003)(451199024)(64100799003)(82310400011)(186009)(1800799012)(46966006)(40470700004)(36840700001)(83380400001)(426003)(40460700003)(6666004)(1076003)(2616005)(26005)(336012)(316002)(70206006)(42186006)(70586007)(6916009)(40480700001)(5660300002)(2906002)(8676002)(8936002)(36756003)(41300700001)(966005)(478600001)(81166007)(356005)(82740400003)(36860700001)(47076005)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 19:22:35.0004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7a54ca-c65e-464f-29d9-08dbf690b385
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB7926
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 19:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191911

Rather than having a static list of crunched MD5 checksums for some of
the most common licenses, calculate it for all common licenses. This
should improve the identification of license text variantions.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/lib/recipetool/create.py | 91 ++++++++++++++++----------------
 1 file changed, 45 insertions(+), 46 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index 293198d1c8..66b985487a 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1059,54 +1059,18 @@ def get_license_md5sums(d, static_only=3DFalse, lin=
enumbers=3DFalse):
=20
     return md5sums
=20
-def crunch_license(licfile):
+def crunch_known_licenses(d):
     '''
-    Remove non-material text from a license file and then check
-    its md5sum against a known list. This works well for licenses
-    which contain a copyright statement, but is also a useful way
-    to handle people's insistence upon reformatting the license text
-    slightly (with no material difference to the text of the
-    license).
+    Calculate the MD5 checksums for the crunched versions of all common
+    licenses. Also add additional known checksums.
     '''
-
-    import oe.utils
-
-    # Note: these are carefully constructed!
-    license_title_re =3D re.compile(r'^#*\(? *(This is )?([Tt]he )?.{0,15}=
 ?[Ll]icen[sc]e( \(.{1,10}\))?\)?[:\.]? ?#*$')
-    license_statement_re =3D re.compile(r'^((This (project|software)|.{1,1=
0}) is( free software)? (released|licen[sc]ed)|(Released|Licen[cs]ed)) unde=
r the .{1,10} [Ll]icen[sc]e:?$')
-    copyright_re =3D re.compile('^ *[#\*]* *(Modified work |MIT LICENSED )=
?Copyright ?(\([cC]\))? .*$')
-    disclaimer_re =3D re.compile('^ *\*? ?All [Rr]ights [Rr]eserved\.$')
-    email_re =3D re.compile('^.*<[\w\.-]*@[\w\.\-]*>$')
-    header_re =3D re.compile('^(\/\**!?)? ?[\-=3D\*]* ?(\*\/)?$')
-    tag_re =3D re.compile('^ *@?\(?([Ll]icense|MIT)\)?$')
-    url_re =3D re.compile('^ *[#\*]* *https?:\/\/[\w\.\/\-]+$')
-
+   =20
     crunched_md5sums =3D {}
=20
     # common licenses
-    crunched_md5sums['89f3bf322f30a1dcfe952e09945842f0'] =3D 'Apache-2.0'
-    crunched_md5sums['13b6fe3075f8f42f2270a748965bf3a1'] =3D '0BSD'
-    crunched_md5sums['ba87a7d7c20719c8df4b8beed9b78c43'] =3D 'BSD-2-Clause=
'
-    crunched_md5sums['7f8892c03b72de419c27be4ebfa253f8'] =3D 'BSD-3-Clause=
'
-    crunched_md5sums['21128c0790b23a8a9f9e260d5f6b3619'] =3D 'BSL-1.0'
-    crunched_md5sums['975742a59ae1b8abdea63a97121f49f4'] =3D 'EDL-1.0'
-    crunched_md5sums['5322cee4433d84fb3aafc9e253116447'] =3D 'EPL-1.0'
-    crunched_md5sums['6922352e87de080f42419bed93063754'] =3D 'EPL-2.0'
-    crunched_md5sums['793475baa22295cae1d3d4046a3a0ceb'] =3D 'GPL-2.0-only=
'
-    crunched_md5sums['ff9047f969b02c20f0559470df5cb433'] =3D 'GPL-2.0-or-l=
ater'
-    crunched_md5sums['ea6de5453fcadf534df246e6cdafadcd'] =3D 'GPL-3.0-only=
'
-    crunched_md5sums['b419257d4d153a6fde92ddf96acf5b67'] =3D 'GPL-3.0-or-l=
ater'
-    crunched_md5sums['228737f4c49d3ee75b8fb3706b090b84'] =3D 'ISC'
-    crunched_md5sums['c6a782e826ca4e85bf7f8b89435a677d'] =3D 'LGPL-2.0-onl=
y'
-    crunched_md5sums['32d8f758a066752f0db09bd7624b8090'] =3D 'LGPL-2.0-or-=
later'
-    crunched_md5sums['4820937eb198b4f84c52217ed230be33'] =3D 'LGPL-2.1-onl=
y'
-    crunched_md5sums['db13fe9f3a13af7adab2dc7a76f9e44a'] =3D 'LGPL-2.1-or-=
later'
-    crunched_md5sums['d7a0f2e4e0950e837ac3eabf5bd1d246'] =3D 'LGPL-3.0-onl=
y'
-    crunched_md5sums['abbf328e2b434f9153351f06b9f79d02'] =3D 'LGPL-3.0-or-=
later'
-    crunched_md5sums['eecf6429523cbc9693547cf2db790b5c'] =3D 'MIT'
-    crunched_md5sums['b218b0e94290b9b818c4be67c8e1cc82'] =3D 'MIT-0'
-    crunched_md5sums['ddc18131d6748374f0f35a621c245b49'] =3D 'Unlicense'
-    crunched_md5sums['51f9570ff32571fc0a443102285c5e33'] =3D 'WTFPL'
+    crunched_md5sums['ad4e9d34a2e966dfe9837f18de03266d'] =3D 'GFDL-1.1-onl=
y'
+    crunched_md5sums['d014fb11a34eb67dc717fdcfc97e60ed'] =3D 'GFDL-1.2-onl=
y'
+    crunched_md5sums['e020ca655b06c112def28e597ab844f1'] =3D 'GFDL-1.3-onl=
y'
=20
     # The following two were gleaned from the "forever" npm package
     crunched_md5sums['0a97f8e4cbaf889d6fa51f84b89a79f6'] =3D 'ISC'
@@ -1162,6 +1126,39 @@ def crunch_license(licfile):
     # https://raw.githubusercontent.com/stackgl/gl-mat3/v2.0.0/LICENSE.md
     crunched_md5sums['75512892d6f59dddb6d1c7e191957e9c'] =3D 'Zlib'
=20
+    commonlicdir =3D d.getVar('COMMON_LICENSE_DIR')
+    for fn in sorted(os.listdir(commonlicdir)):
+        md5value, lictext =3D crunch_license(os.path.join(commonlicdir, fn=
))
+        if md5value not in crunched_md5sums:
+            crunched_md5sums[md5value] =3D fn
+        elif fn !=3D crunched_md5sums[md5value]:
+            bb.debug(2, "crunched_md5sums['%s'] is already set to '%s' rat=
her than '%s'" % (md5value, crunched_md5sums[md5value], fn))
+        else:
+            bb.debug(2, "crunched_md5sums['%s'] is already set to '%s'" % =
(md5value, crunched_md5sums[md5value]))
+
+    return crunched_md5sums
+
+def crunch_license(licfile):
+    '''
+    Remove non-material text from a license file and then calculate its
+    md5sum. This works well for licenses that contain a copyright statemen=
t,
+    but is also a useful way to handle people's insistence upon reformatti=
ng
+    the license text slightly (with no material difference to the text of =
the
+    license).
+    '''
+
+    import oe.utils
+
+    # Note: these are carefully constructed!
+    license_title_re =3D re.compile(r'^#*\(? *(This is )?([Tt]he )?.{0,15}=
 ?[Ll]icen[sc]e( \(.{1,10}\))?\)?[:\.]? ?#*$')
+    license_statement_re =3D re.compile(r'^((This (project|software)|.{1,1=
0}) is( free software)? (released|licen[sc]ed)|(Released|Licen[cs]ed)) unde=
r the .{1,10} [Ll]icen[sc]e:?$')
+    copyright_re =3D re.compile('^ *[#\*]* *(Modified work |MIT LICENSED )=
?Copyright ?(\([cC]\))? .*$')
+    disclaimer_re =3D re.compile('^ *\*? ?All [Rr]ights [Rr]eserved\.$')
+    email_re =3D re.compile('^.*<[\w\.-]*@[\w\.\-]*>$')
+    header_re =3D re.compile('^(\/\**!?)? ?[\-=3D\*]* ?(\*\/)?$')
+    tag_re =3D re.compile('^ *@?\(?([Ll]icense|MIT)\)?$')
+    url_re =3D re.compile('^ *[#\*]* *https?:\/\/[\w\.\/\-]+$')
+
     lictext =3D []
     with open(licfile, 'r', errors=3D'surrogateescape') as f:
         for line in f:
@@ -1203,13 +1200,14 @@ def crunch_license(licfile):
     except UnicodeEncodeError:
         md5val =3D None
         lictext =3D ''
-    license =3D crunched_md5sums.get(md5val, None)
-    return license, md5val, lictext
+    return md5val, lictext
=20
 def guess_license(srctree, d):
     import bb
     md5sums =3D get_license_md5sums(d)
=20
+    crunched_md5sums =3D crunch_known_licenses(d)
+
     licenses =3D []
     licspecs =3D ['*LICEN[CS]E*', 'COPYING*', '*[Ll]icense*', 'LEGAL*', '[=
Ll]egal*', '*GPL*', 'README.lic*', 'COPYRIGHT*', '[Cc]opyright*', 'e[dp]l-v=
10']
     skip_extensions =3D (".html", ".js", ".json", ".svg", ".ts", ".go")
@@ -1227,7 +1225,8 @@ def guess_license(srctree, d):
         md5value =3D bb.utils.md5_file(licfile)
         license =3D md5sums.get(md5value, None)
         if not license:
-            license, crunched_md5, lictext =3D crunch_license(licfile)
+            crunched_md5, lictext =3D crunch_license(licfile)
+            license =3D crunched_md5sums.get(crunched_md5, None)
             if lictext and not license:
                 license =3D 'Unknown'
                 logger.info("Please add the following line for '%s' to a '=
lib/recipetool/licenses.csv' " \

