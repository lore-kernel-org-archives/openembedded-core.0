Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A16C4167E
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:43:28 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.44])
 by mx.groups.io with SMTP id smtpd.web10.230.1639584519863923480
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 08:08:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=qcDNCkle;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.44,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0aft+ZXY08nw79zhNVhDSACobSK+CSJXGdMjMtVG9B2k/JMaaE5LPCNeQJhZ2pUfbH+gXXN+CqqVvPdSbls8g/QaaADMgjXLcV83KOAQA5u7WK/rvfysxMDvRbYy5+jHpcOk67EfQGVRtgGio+pQP2KvqVsENWY/dEW6+xhfuKwmJmAuGsSdRexphlrOUmepPcLxWwVOwkteDBYOZ64DlfUkGnA75cEuN+kCqw1fHuy9nRxGjvAoUcMOP2n82is53F8IDpGd6cqlu3ogtksOB2iLf4VguBAvT9LP12FvQYauGr0cmuZ/ADZzuoTlnrPvxpjOsMfKy55Q+azGpefwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSHIumeib8qTzREZkFI0Tet0CpSUi7mjQ01EM7nhdW8=;
 b=jF7wyE9r0lt1gjF7l/5IWeud7jaSntaGIsB5NXIWL7FJqfynYLcBSpwvo5mIEg0CHWv+mMEmPtSGkG43Y1ruZenvCVnGVAGzM5nsc5cml7fG7LdpChzXuGgoYOHK8Yi85D09Xdi+fr7AXjEK+HU/yLYSZQ/9nk6tKyG+hSEzEnfiw3BOvDdkLFTpFY3CBcB86voD8hIkcn5+4uvPLx1YdWzlawoItJKcwSegDfzEb0K/7PqwaIwbm8ijgTsGxv395NwVi7aK5OxoyfHypRmz1NMMYh1nl0urk7HCndy2M6EdDLMNHjmXJ84nYz4xDj2Yu7D6xpw5CdIJQWb/4k8VsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSHIumeib8qTzREZkFI0Tet0CpSUi7mjQ01EM7nhdW8=;
 b=qcDNCkled+AkxLeZ7trgyua3rchW8tz5II/OsRSLM3u7vkCLbshW34OBuLZB0k7mbLHkL8pIDNKntDxWk/C0Gz3n7U5DrZdUrmuXtIzc5V86m7TbDguytnIVYeqMFwvy5zdVbndJRIYIqcD9T8bi3NfylF/9wQHbiSRpVJctubI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR2PR08MB4665.eurprd08.prod.outlook.com (2603:10a6:101:25::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Wed, 15 Dec
 2021 16:08:37 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%9]) with mapi id 15.20.4801.014; Wed, 15 Dec 2021
 16:08:37 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v3 2/4] recipetool: Separate licenses with & operator
Date: Wed, 15 Dec 2021 17:08:11 +0100
Message-ID: 
 <20211215160813.23368-2-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <20211215160813.23368-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20211215160813.23368-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6P191CA0097.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::38) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30bd1557-ae06-4960-fa8b-08d9bfe526ce
X-MS-TrafficTypeDiagnostic: PR2PR08MB4665:EE_
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB4665D1248E09B4F9DC0ACCA5D7769@PR2PR08MB4665.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ijnr8uK2VuN35OmbxE/pBKMR+YROIb8PHdhlPSImHvp5yduX1ypZmtZy5N7RA04nVbV2/I7annIDTJOmEUGl215qswC1sf+S7aCM4bOvR+ZseecQI7u5qlax3pnURexk9Z/2gUOKFKoN9zhHbXZirnCRYohjo1LMGhJMEYdLNYLglzJKvtDjd3LcxORvrBZoMm0jsdBfKSVp7khncIxbEjppdBINFosXZO4C5L3QwEWmBIqZaYEM8r/WGfCWp28ow44FITV//2qk4CVM/ut+VAtxF+52/lvuR4XDFjX+D5A4A4MbeWegoyR4VnBHogCmn/de7OX6GGHsiI1p6nQMg5765mTLD8DTLHU7cc59xf6TYxPl+0TWFQke6xqLvIZla4MDhB2s1IXdy8ZC58d6ALUvuUdnZhjFgqhHZRFpWXH9Z8PzWFhYwCwGdY3pOYANJ9y2CxWePjAT28VHysJ7ZC7TV4kB46/8lc4/M5XYMLMlocuUrsuJBcfyxClA+mdiaa5fWoFcgR5DlPzRVULMqohVv9nNzx9AVrMJXFU9bk7yBbKlsbt27ZbnkAv1a3STnCmOh3tGk7TEkoihZG6GKx7dsCgD7RUAgeSZtkob2zs9wyC/Xweom7+oyVZk+qGjXp/uGlz9pY/os+EuVx76Uzgo7PIKr1Qxb21nQDIRC3DFFgljzWKhIm7MEvBh8waUbgACUIwkPYyFUHlfUlhyO+cTKUDVm1iGaKQutGuZkCP19/rIDh6o5Rk997M4D61XMT3Uzyo7Z//R2Hov+ZZutNN+GWu9OA/YR+KOuoVtOo8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(6506007)(52116002)(38100700002)(316002)(1076003)(6666004)(38350700002)(6512007)(107886003)(4326008)(2616005)(6486002)(8676002)(66476007)(186003)(66556008)(6916009)(26005)(66946007)(36756003)(83380400001)(508600001)(8936002)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+z9NMDv1Jbug+B3Km6K9j3hkrNO3+/mVHwv1T5WRa0SQFuY268RTwwwNfSUN?=
 =?us-ascii?Q?rRiItLHaFyps73mF8mdiWqJZOL/o63p2FSsEKGC0NmBZAHFQsISGYtec3qPY?=
 =?us-ascii?Q?H+QJkGdW/i25rfPYlVfAk0QtXEVxh8KthOXNIJBY5N9VEUzycR4w2CwqXH5O?=
 =?us-ascii?Q?WQkZgEKCWOFkE7J9CpsZPSr9Xojeyx0EE8RvJhuSsPMrlrExwD2sKZ6qN9f3?=
 =?us-ascii?Q?Na0HgV4wDDsUYd4fdWzBu8kfbBTEOYZUZOsT8OoUB/fBNqOF0xFfxe+kGefx?=
 =?us-ascii?Q?t1UAGJYy8fThhXB9Ojz8Bp5d37wtB1w5XoMtgnsR0+YKe9rY2zGan+62+UMy?=
 =?us-ascii?Q?EnlRYIj/exx8mJA8tHtXIgQGzh0vlEWXNrMjrku7bjgsU1b+TNP/dC6ym0Lj?=
 =?us-ascii?Q?DV+3bekPFMr0rQWuXm4okL6KlkhgTdb5sETBbCYpjeNyWyixkyhF2Jdkdo9E?=
 =?us-ascii?Q?QI5Sl/YYePe1aujbZ2Tg8W2WPBiCxJ6+VcUH/lciZf/gjtOrQR3KuC+LqNDi?=
 =?us-ascii?Q?neudwb/WLX1oFaOudDp7/ZTSAMEnK+Gl5/XFBm187AMBSdNNHfyRZ7TnCF3v?=
 =?us-ascii?Q?3yDGPBHR2z4ExTuJn12Mm9YtfTBrzUTl7HQeIKCx3oCaENoJfUlXLsqRfYMh?=
 =?us-ascii?Q?sK2tUpj5mZlvOpTUgBmtLkSgyXjPiFgp5D1THKZfKkuAVQj2U7lCuFmXATud?=
 =?us-ascii?Q?yrM+6+fj86ZsEY8iyBM2E6g39Wh+49TlGp+MRQpDGyVZFYRPczpnvJBnlWoG?=
 =?us-ascii?Q?sYKNsVBjk04wHjZdqERFLL6wLDYM69wG1G+zIec7eT59fYnMSOarBaQaCSiw?=
 =?us-ascii?Q?5IYscP8xeMpJHa5LjORn/GqrhGTcVewoziLs7CPhin9XxXG716L9HnOsnO7O?=
 =?us-ascii?Q?YKENTnlZBVJnFrehXAZS7yCGpPSNvvCGVFyzr7W/X5x9QZRVFXuvvelzAIka?=
 =?us-ascii?Q?v4pFn//voZBVJlrW5wLIBWcPbPqmd5NzB+EYz3jxcqn2vVm2OdhKVE5e58gR?=
 =?us-ascii?Q?+yJvvFp6Vpq+rf5or7YNVSW8P+P3CYR/dyQGcpT5+QrqxaFt6XRTW8z2tzFY?=
 =?us-ascii?Q?94MGd6wmbSg14t9jOYx6s1snMmP3VIxvH2AFZa3volF8fqDXbtwGrGN6rXvq?=
 =?us-ascii?Q?1gV7m/ZWsj9j9k0bfkGNFOYUsQOG/NtP/1pYiBJpWKupLafdh79Rp1RHSo89?=
 =?us-ascii?Q?MRoo3NH/lAp0zib79/jBegvVnsRCzW33ps4CacBcOOLb+fdhdRVFJrxuDXgB?=
 =?us-ascii?Q?r2xAe2zyYA7+Pok7fj4JE/qwbqY81GfuIo+BtYQLRVm6OpV1IUtAuApFkB2S?=
 =?us-ascii?Q?Y7ZFXmmjK4F+ay3rhhAW+mGzFo1h7bgvA4Xfcht8/1skQTyCLtl5OeRgfIt7?=
 =?us-ascii?Q?uJ0TYMFfh1oqajidqPVxmNy+i2LwGBccrYDv0731EgrA2Gfz2Gp8oCSolTJ4?=
 =?us-ascii?Q?ZYSkesJtuypvk9bfdA42TE07rhCADlHny7A/upK4EQT4ydo5wZeLoPd3V69R?=
 =?us-ascii?Q?ToaPH6zoArwEux8ztTKKRraNwRJf/CWzIfwWr526oAXSHLTuzse6RpyxX4Ak?=
 =?us-ascii?Q?nDpYPbM5wrida7FZOzoUyHDOA1dcNF62wMfjUaiaiPz39P7jgprc1rOyvhtl?=
 =?us-ascii?Q?Es/dBf45SbIxH3ef/eiehdI=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 30bd1557-ae06-4960-fa8b-08d9bfe526ce
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 16:08:37.0863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pb2UB7DWvxFTzO80e7EEd+o/FM1Jq/bh4SOdtTWkPfk9DSPP/mw98X6BR1AuFXXeMouXT3VqpuVdoYBtXAFEww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4665
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:43:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159732

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
index 28224dbc24..507a230511 100644
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


