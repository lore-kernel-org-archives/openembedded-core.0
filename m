Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F6CC433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 15:06:16 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.88])
 by mx.groups.io with SMTP id smtpd.web08.12074.1639407970721331560
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 07:06:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=LaxHbNg4;
 spf=pass (domain: weidmueller.com, ip: 40.107.14.88,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RnMMBBK5ZE63L+TvYNWi8FV90vLBfwAvxIQcTPqecP5gByKpdz1DChacwo4c6kvw2eK4RPAKawQku5DJ1PqB6WRIx1z+1Nre6OgKTjQNvXWTTgyTD7HHBYGHn7qvcTbqXDbqw8P7oMOAMdF6+x+nZwPmYdAN1nul/oXq/24lQDBxPSpEYyMo8y/H2QZHIPavVZMfr2CO7sRAch1U6/T67A6+MM8t+M3W24aIgB5C91zTAtvgmzzrgirXiO4AoRuoTuhsfOqoC2yDYq8HMVwtGD63vwXVb6vuBcJDwz+zcSQ1hXSYgcLaTi9a0x1sstSd8bL9YBJ1KjZ8gSQXVS8vJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnZfylpRZ+c/xpG/FVuWL9yWggDhgKhXc9ryGeUk+ZM=;
 b=l9l3OWzbjvwX7wijwr3XP9MpXQDMGgy/75Y4f4a2zeAxZylB09cDyPCL3aTUPcElmTlejTO0K+g1QLBE+4UFV1+huYnKMw31ssCDCBtgelDjP5gTyQJIoKzbYxP3kvLa6gyucxrULviz6uB1caj976U9Z5wc8G8Fj16bWL8z+RuBdKdTVhCI+26tZRGmuZfrIuHM5/zUT6DqXKSqTqqqidnqxtqTRm4anYgy+4+Gu3gadE9npBAoGqepaM04GhKZF4exqMVgy2h2IkAGAQuFY3r+x1Bg7jxvqJBf487LcyFzW7ZjD6gsTGzB+ZMmu56e167t0N+YrJFRXlFaSsB2Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnZfylpRZ+c/xpG/FVuWL9yWggDhgKhXc9ryGeUk+ZM=;
 b=LaxHbNg4KUJf3Oa0MuGWw9POLn+pb7cLt2T6gclwv2gu281X9SgoW2tjIE+xFlwyH6vS48XF05o1n1pU4eLJ9gnwUbde2wCGRTjTyAypL5lV49R3nkh0KrSCuuVdE0+LvzKJ3B9U/cWqt4QKcUB1tDmt4u8RZOVt+5Jz/KqAzgM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB6317.eurprd08.prod.outlook.com (2603:10a6:102:ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Mon, 13 Dec
 2021 15:06:07 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%8]) with mapi id 15.20.4734.032; Mon, 13 Dec 2021
 15:06:07 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH v2 1/3] recipetool: Separate licenses with & operator
Date: Mon, 13 Dec 2021 16:05:44 +0100
Message-ID: 
 <20211213150546.22196-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6P192CA0059.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::36) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (89.247.126.92) by
 AM6P192CA0059.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 13 Dec 2021 15:06:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9994aef2-4e03-4f34-f2c7-08d9be4a16e4
X-MS-TrafficTypeDiagnostic: PA4PR08MB6317:EE_
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB6317AD71B6E91B46A9721F80D7749@PA4PR08MB6317.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WsagQVgpAmDyhPeEiISI6UdEqd7ipqZS0EeCjRm02CJDbf5FVuW0Jyw+kdjkNOciBitckfkPj6XZ5+IQnvcK049LZVO3QvqceuG+LMMZAY1q6wSaqVdfNx1nOWPv0gi04uq41OvpX14WS+MRchkFzBatZpn1jHgpVEnoITKek/loN7NJd4vI7MAZEMfWAFci9MUusmnQQHvdjn8t8RL7t+xd2SG4GmYW132H1SmPtKn44aaVfiv/i4YxFc+u9vbZHIaw8hlH3lJJtMThqu/tSL9d9L7UkfiUFf6kYzPiSWLx6AMqtQ40SQj3Lq5QV/bQOvAKBH5z4di8EmSvLFTEQ4/9bJGN3oLxxPcksxQ7EPU1bj4QRxuS3XQX9z1AeRvJLldzxKoCDwHR6hD7uMHsWMz93kMM3do+SLXv1YPGdGcmhEoy07JMxgNjDTnTLiAeb/3B0ncHvaTvIgO2I4sue1Uyq9ygY8VxNbVVokN7IHye5t/kryY3/RgAsD9dG72eUxlr4Yae3FjuSzOzaJavJFSTe91fd3GARFzmHmRRKsaBgWl9VDHz2RtR0n385gimQHVqLo+5GK2h3nHZEPodQu6LLys6+u4Fpzxoicusena7tFOAyB5WzhnYzHpoczuu7tTf1kATArYXbvCF7b0h6VvVqZeNyn4ZhDyF13KJf7Ve6iKDhxZD0yZwgST8H4vxQr98xW2oW9Q/YcoPeojFy2/qh6eCDumrqF+n03gSriUvwvyrRW8Oj4EawMFh25uzMxie6dR46NsBCaPRs6iIhg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(316002)(7696005)(6916009)(36756003)(52116002)(66946007)(6666004)(2906002)(1076003)(66476007)(66556008)(8676002)(5660300002)(107886003)(508600001)(38350700002)(86362001)(26005)(8936002)(186003)(6486002)(38100700002)(956004)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zwEtOvhhqbdiTlSxjBbs5XyRjzaU5aWm58AY8kf53MFVQquw7hxxKqo62mpy?=
 =?us-ascii?Q?xl5BBP+bXfbt1l4Bnvotp0iBppRoF1E7W3PJUo5ScLN37zmL63rLKAeqTXI6?=
 =?us-ascii?Q?3NDgTK+oGn7SI3yo2oZ6i0syYOTlwFFYBl26WLc36b4gJVLntxeW1a8d/n/q?=
 =?us-ascii?Q?2YNdt3bBCGnkasLGwpWzgeTMG+4sH83UqGSsP/VBVFmgBH6TeV0t/7Lg6xbi?=
 =?us-ascii?Q?denuwtaIEQ9yaNvOLm/GZhKh6o5ky8vX4Y+9CIeBcDZm4v5CtveLEfThKTZ1?=
 =?us-ascii?Q?re4rq3C84Jn9xDj/ns3Lb6O5UxOxyl+ZbXdnEQ/edXHb9TwH38F/lycuyY89?=
 =?us-ascii?Q?lNmkll3VXYkPnTtuK3os6/VLToFk/AQM4E7gluATR02ztlq8vpA5h6/vB7Xo?=
 =?us-ascii?Q?gnmcVxzgWYiGyCMO7qspopYueIijc+wjYD3WIeOR6/P9OKcQ9n3e/8No5q0Z?=
 =?us-ascii?Q?Q9yMiL3inGgkXxfWRg9yazAZPbOHIlJR2637T5xbLTNPfeUT/kJnF7JhB7T3?=
 =?us-ascii?Q?rpuUc6KRVhl75TLggk5LDuXinxPG2VdItujT8p9p14lLp2sLwP1+ZtvDxvMq?=
 =?us-ascii?Q?1KBF/wiJzZe4EMDEX3Ap3qbWiS6NHeazjqeipZqJGsqK8YB4mgPsPNOjvB7M?=
 =?us-ascii?Q?4dBTmSPP4hR6Jve/k6CDsqLE72fZOUyUT0jyqkG7AydniuVfOM9dCWrUM2S+?=
 =?us-ascii?Q?fl9j9scZM1JaOcXnLc2Bx4S90DF/NuNL/UesWm1anlRdTgrQEhS7JYyIWKYz?=
 =?us-ascii?Q?Lkj9BEz74v/xT/Y6GOFCYBm3mAiKbNnSO1MKxwGh5rKLQC3fm/8ZSm8jCfL7?=
 =?us-ascii?Q?OaXMjNyX2Hhl6C3tvYSpITtt6XG6UsAJjjKKMLKRRYwFzOH8D+cFbFySc77b?=
 =?us-ascii?Q?/si2ZHseo43UmI3AyDgBmbM2GcTH1/k2byKI1VK+ENKafI8ye07reyEYw96E?=
 =?us-ascii?Q?Syd0Xcws2j74nHCjLQ6E/RZPpDupC6Zaq072Ew7GMLtSmzxAq/5160YVTL65?=
 =?us-ascii?Q?q7Iq4QGMXTtAgRUbRUuYOKsUAfUwtJ3B1+2YYYwsUPGXY2T/mInfXHbrh6zA?=
 =?us-ascii?Q?ryjeUZiLTkaccJ2PGxcZSNz6zBhh6BSVNi3Vo9RsCQ5jjPzYZNdh9/mboG6i?=
 =?us-ascii?Q?D0itXayegpLUrqW/ZioELOoxGh2GlT1LzJRS7xU1EquRF70A3NK9pMWCT7kB?=
 =?us-ascii?Q?MS2O3Tcz6G5Zr4Y3SVOQLNEEplqQtK2UsVZnvwc4vgILVzWsTSYCNMdMYt03?=
 =?us-ascii?Q?HhMoiPTrn7kj0exA+GRZJH3CpQlzLiok0cFz5SttaFUoZ0TqhcY4GnwMHa/I?=
 =?us-ascii?Q?hgs0kuTRjM79HoyEpeFdYOfhF10vOyuuSzWms0KpgSrYx/REjRCtiKm8W9wr?=
 =?us-ascii?Q?eoFZW96VkcsIZS0/3Rf0/2E3KGJLlBYROvr1JBNJpYSRaZkp8741FoGemW6a?=
 =?us-ascii?Q?tQpxUt5LsGtvA9Sjf16LsDi4GeFLd+NSl9Nwb5R6CSsMU+QzZI29DmR3qQnf?=
 =?us-ascii?Q?S6ngqGRql/4wpfi0Z98AQjceVUQXUIc3x2tL3Dj6T/cGPMPWDTQ6+PiUPGlL?=
 =?us-ascii?Q?C7QGk68nwSZZjNVh/1ULJI43+c1bieSdPhIQvBflbQViA5ifv4DjgjmNN4x2?=
 =?us-ascii?Q?2OYr+JNrhZHtmUXyqGeO1pk=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9994aef2-4e03-4f34-f2c7-08d9be4a16e4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 15:06:07.2926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GivDArtNSfhA+5kVz5rp29OyqBMYRp+Rcl0VZyZ3CmaREX/6e3ABGE6EQ5pvOPGNx3mPWABQCw9GPVKu/Uwg3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6317
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 15:06:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159641

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Separate licenses with & operator since it should be satisfied most use
cases and it is a reasonable assumption that all the licenses apply.
Furthermore flat, split and sort the licenses to minimize license string
changes.

Separate package licenses with & operator:
-LICENSE:${PN} =3D "MIT ISC"
+LICENSE:${PN} =3D "ISC & MIT"

Respect | and brackets in LICENSE:
-LICENSE =3D "BSD-3-Clause & (ISC & | & MIT)"
+LICENSE =3D "BSD-3-Clause & (ISC | MIT)"

Sort licenses:
-LICENSE =3D "MIT & BSD-3-Clause & ISC"
+LICENSE =3D "BSD-3-Clause & ISC & MIT"

Remove duplicates:
-LICENSE =3D "MIT & ISC & MIT"
+LICENSE =3D "ISC & MIT"

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 meta/lib/oeqa/selftest/cases/recipetool.py |  4 +--
 scripts/lib/recipetool/create.py           | 39 +++++++++++++++++-----
 2 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/sel=
ftest/cases/recipetool.py
index 439e41597c..95e4753976 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -426,7 +426,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars =3D {}
         checkvars['SUMMARY'] =3D 'Node Server Example'
         checkvars['HOMEPAGE'] =3D 'https://github.com/savoirfairelinux/nod=
e-server-example#readme'
-        checkvars['LICENSE'] =3D set(['MIT', 'ISC', 'Unknown'])
+        checkvars['LICENSE'] =3D 'BSD-3-Clause & ISC & MIT & Unknown'
         urls =3D []
         urls.append('npm://registry.npmjs.org/;package=3D@savoirfairelinux=
/node-server-example;version=3D${PV}')
         urls.append('npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json')
@@ -483,7 +483,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         result =3D runCmd('recipetool create -o %s %s' % (temprecipe, srcu=
ri))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars =3D {}
-        checkvars['LICENSE'] =3D set(['PSF', '&', 'BSD-3-Clause', 'GPL'])
+        checkvars['LICENSE'] =3D 'BSD-3-Clause & GPL & PSF'
         checkvars['LIC_FILES_CHKSUM'] =3D 'file://COPYING.txt;md5=3D35a23d=
42b615470583563132872c97d6'
         checkvars['SRC_URI'] =3D 'https://files.pythonhosted.org/packages/=
84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c/docutils=
-${PV}.tar.gz'
         checkvars['SRC_URI[md5sum]'] =3D 'c53768d63db3873b7d452833553469de=
'
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index 406c97f1c5..8e8a621b4f 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -919,6 +919,22 @@ def split_value(value):
     else:
         return value
=20
+def fixup_license(value):
+    # Ensure licenses with OR starts and ends with brackets
+    if '|' in value:
+        return '(' + value + ')'
+    return value
+
+def tidy_licenses(value):
+    """Flat, split and sort licenses"""
+    from oe.license import flattened_licenses
+    def _choose(a, b):
+        str_a, str_b  =3D sorted((" & ".join(a), " & ".join(b)), key=3Dstr=
.casefold)
+        return ["(%s | %s)" % (str_a, str_b)]
+    if not isinstance(value, str):
+        value =3D " & ".join(value)
+    return sorted(list(set(flattened_licenses(value, _choose))), key=3Dstr=
.casefold)
+
 def handle_license_vars(srctree, lines_before, handled, extravalues, d):
     lichandled =3D [x for x in handled if x[0] =3D=3D 'license']
     if lichandled:
@@ -932,10 +948,13 @@ def handle_license_vars(srctree, lines_before, handle=
d, extravalues, d):
     lines =3D []
     if licvalues:
         for licvalue in licvalues:
-            if not licvalue[0] in licenses:
-                licenses.append(licvalue[0])
+            license =3D licvalue[0]
+            lics =3D tidy_licenses(fixup_license(license))
+            lics =3D [lic for lic in lics if lic not in licenses]
+            if len(lics):
+                licenses.extend(lics)
             lic_files_chksum.append('file://%s;md5=3D%s' % (licvalue[1], l=
icvalue[2]))
-            if licvalue[0] =3D=3D 'Unknown':
+            if license =3D=3D 'Unknown':
                 lic_unknown.append(licvalue[1])
         if lic_unknown:
             lines.append('#')
@@ -944,9 +963,7 @@ def handle_license_vars(srctree, lines_before, handled,=
 extravalues, d):
             for licfile in lic_unknown:
                 lines.append('#   %s' % licfile)
=20
-    extra_license =3D split_value(extravalues.pop('LICENSE', []))
-    if '&' in extra_license:
-        extra_license.remove('&')
+    extra_license =3D tidy_licenses(extravalues.pop('LICENSE', ''))
     if extra_license:
         if licenses =3D=3D ['Unknown']:
             licenses =3D extra_license
@@ -987,7 +1004,7 @@ def handle_license_vars(srctree, lines_before, handled=
, extravalues, d):
         lines.append('# instead of &. If there is any doubt, check the acc=
ompanying documentation')
         lines.append('# to determine which situation is applicable.')
=20
-    lines.append('LICENSE =3D "%s"' % ' & '.join(licenses))
+    lines.append('LICENSE =3D "%s"' % ' & '.join(sorted(licenses, key=3Dst=
r.casefold)))
     lines.append('LIC_FILES_CHKSUM =3D "%s"' % ' \\\n                    '=
.join(lic_files_chksum))
     lines.append('')
=20
@@ -1226,6 +1243,7 @@ def split_pkg_licenses(licvalues, packages, outlines,=
 fallback_licenses=3D[], pn=3D'
     """
     pkglicenses =3D {pn: []}
     for license, licpath, _ in licvalues:
+        license =3D fixup_license(license)
         for pkgname, pkgpath in packages.items():
             if licpath.startswith(pkgpath + '/'):
                 if pkgname in pkglicenses:
@@ -1238,11 +1256,14 @@ def split_pkg_licenses(licvalues, packages, outline=
s, fallback_licenses=3D[], pn=3D'
             pkglicenses[pn].append(license)
     outlicenses =3D {}
     for pkgname in packages:
-        license =3D ' '.join(list(set(pkglicenses.get(pkgname, ['Unknown']=
)))) or 'Unknown'
+        # Assume AND operator between license files
+        license =3D ' & '.join(list(set(pkglicenses.get(pkgname, ['Unknown=
'])))) or 'Unknown'
         if license =3D=3D 'Unknown' and pkgname in fallback_licenses:
             license =3D fallback_licenses[pkgname]
+        licenses =3D tidy_licenses(license)
+        license =3D ' & '.join(licenses)
         outlines.append('LICENSE:%s =3D "%s"' % (pkgname, license))
-        outlicenses[pkgname] =3D license.split()
+        outlicenses[pkgname] =3D licenses
     return outlicenses
=20
 def read_pkgconfig_provides(d):
--=20
2.30.2


