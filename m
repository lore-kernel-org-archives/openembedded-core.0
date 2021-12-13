Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C1BC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 12:38:56 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.73])
 by mx.groups.io with SMTP id smtpd.web10.10522.1639399132240763451
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 04:38:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=dLS017Dn;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.73,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NytI5lsWNO+PgOgXKI3KftGXwd3t595f+dpwMbXstUXvxiDsp9ZjyvNWqAk+Cux6TgSbHJNwm2WviV+prKYWMKbvQZIl4q7Lh+hmKx/mi9RWeBQE+HjVRAfU9ihXArX0xDyiNM/hKNmuQ/9CUlGqkwSywkJT9DgRDClM34EWCJjxWdGFevaEYzU6f9M3O/XT7oTHyajHIrIFii+LAYnuGHCNA5J2BSHwRBo///XI7tjjvSagDLgMo6Anql8hWbQxikjbANHC8e6E3J5rkgpzLBDQdByFLlUjTuc/vHsMcXN8iuHmOO2m4zD33vzzTOAChfaA+fJV7gYkIbnuCOF+lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzF+8UOK3Q8Z1CVjW2AKKJdlBxKeBGOtsVBkEvANQiI=;
 b=FA10Q/gbO7cgevEvgNBTIgf0u+Mluu6Uy3iY4Tp7c/k7VevqVODr0vmpCe0E4Ylk0JCWyur1HBK3v7G8eP7XL77PCo6Rouwhl7cWM9PgZ1N6WvFeamaS8MZzhBtCvgT2TP4BXhyZaNNdPNYTJT6hkqBOMYxTv7QPwyCqkpKO4YF3wD12wNEum0D8wsnF7K6FSt57MSSaG9lh5SdoN+c4Pklorz81l293Z5EPI5saLtxQW2uET7rrcX7qrp9tGgvrnzi+pFPNwdkpodqqJPu/Cd2VohG4k9Em+Rkhu8VP5okmIlQXVC0ojTxuLhNlN3v1XZ2dsa/RwuVQZwHxmbbdGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzF+8UOK3Q8Z1CVjW2AKKJdlBxKeBGOtsVBkEvANQiI=;
 b=dLS017DnEt9eYpH+kIoAzFpwTuwcn6kMyZrAHiebyvRWkGfQpNvbL/qBU7odFI+qvB6Shu1S+gQ/4huuqqgMFnwqyMmGtyjdPqyEv1ZfF9KjO8hdJ17J0Gs14u4DM8Txkp4hUyopjn9n6S8rAaFUU/Vv/1Jhrxwn6I0BPu+M65A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5595.eurprd08.prod.outlook.com (2603:10a6:102:83::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Mon, 13 Dec
 2021 12:38:49 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%8]) with mapi id 15.20.4734.032; Mon, 13 Dec 2021
 12:38:49 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 1/3] recipetool: Separate licenses with & operator
Date: Mon, 13 Dec 2021 13:38:24 +0100
Message-ID: 
 <20211213123826.31605-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0349.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::24) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (89.247.126.92) by
 AS9PR06CA0349.eurprd06.prod.outlook.com (2603:10a6:20b:466::24) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 13 Dec 2021 12:38:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c53ffadc-6ee0-49d6-214d-08d9be35834f
X-MS-TrafficTypeDiagnostic: PR3PR08MB5595:EE_
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB559533023EED9E8962B4D01FD7749@PR3PR08MB5595.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	b3Ii4xI27JHUQ/I1xmjtJLkRALC6S7Xdj0HajbnWHeco2drNuicvboUeTnItc5D7REXKVlvUlDdcQDM9Fw+ne2Z0MnBC9ZuMfgAiCUq7lX5gt8JLvHEUpLu9xGQbU5GDhaK1aBdX+FA3ir/s7ZCKZNKMNx26adhZjWMawvs5sP5KPmC6b47yfzQl6Zzb8fRf50rHfuep5R4OGpgPMHJ1qdTSIp/CQ8VH19C2kz410OrQtNSBzrKUWDInImgpGr/QniSaSfj8OtTxkaWiYXvvFJXopJjCV5MR9M6m55S76KLhm2CLE0/keApQxC4H3+SNUfftFonPp9JnWL4i+4WvRcrUlcocBQzpnSUDcqjRMsGbxEkC6WFJkSzg/7O9aJQs69MhkddpyeTdMcc9LUt5xbkCzmEAmA30GSCUt3Bb17rQcEYSMWSrHgxKxJHfBwx4OCHesKmZbheFfHvC1MLaa7Q/1y/0iP3QVXOPJbrtzHpe9QxXd3adb7yQY+n8Yg8FR1qrS5KPVY0Qg9aJXFSrm3dKSfEV9UTJ1bee64tejwhv/iG9xlCO4Kn4bBeUTe4UZqFyIGyuOk5Qmv/F4orFSvilFPCo36vIpStKohTwN2DULwir1qXA/2TZPI7aTIVCk2Yh4lraF8F5ebvDlUrM/WXjIMkzzKcAX6G/pzpHJAk2FJqf6R+j3gjJo55hkHhHi5dmRqXwjUqZGRONkcKPJA+i54CPEafqtEWM6UUMkZJ6fEjvVjqGMGVwzNQTlnhBMWU6HT3ecCBIXlf9W7zMXg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(38350700002)(38100700002)(956004)(2616005)(26005)(83380400001)(186003)(86362001)(316002)(66946007)(52116002)(7696005)(6916009)(5660300002)(36756003)(2906002)(107886003)(8676002)(66556008)(508600001)(66476007)(1076003)(6666004)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+6n0KlJlJL1WETWcXw5xrdY784Jp1OLkhBfY6xd0yHzcpskodc0Yq+t4ZhsU?=
 =?us-ascii?Q?Q/VyNEj2XmU2dQ3lgA6L7GKDmOMdKvrhZ+cyUo1dpqZeEMRSZFCsugpXDUuS?=
 =?us-ascii?Q?QvEsN0v8mlGj6I+3aNbt790VcgBu7w7cCdw60VlCf7EYITZi9vaNgS4tSQ3f?=
 =?us-ascii?Q?sXSHAoEYRm3VtL0A5QRZh267g8XAW/HeJkH0DMM63eQL06zVDNFk3H9QF9NV?=
 =?us-ascii?Q?iyCjkhLw83usBbTwkebQQpv/IxaOnpH/eJvnFsiomE9xYt6DPE2voMxwlQA8?=
 =?us-ascii?Q?NM8XQpzwqCg8axIw9uklbRgS/o1vcK/wgSmPwWqRxcdmlEHNUL51d6xhUGdg?=
 =?us-ascii?Q?UuBfDMl79wI7r808cfThpu4o24k0EDCUx9U8gA2mZQMK9BJn+Za/0wZkJyxP?=
 =?us-ascii?Q?n2Q4iJ1UQB6tU6zRX6+rhK0mqZNDB7JH21z4CTXKYzFZHeOJz3ssMxkXQ1mn?=
 =?us-ascii?Q?vyCsMYnWBkN+gPROJsCqsloi4RMZgZfxSUKx6Qut2dJORj32qaCqNHpfvNtL?=
 =?us-ascii?Q?v1F9/xVYleWd2TO5na/j0OED4f6vQcdT1r0w2kbg509WQJM714eMi0CqWLQa?=
 =?us-ascii?Q?mWEPj1WQR7lvIicHTW9/kpeIF8XqILHoWb2oy/2xHjvsbYJiESPzIbAbpbsu?=
 =?us-ascii?Q?E3/CCaqSlc/+ipboegu/wsNelpl5usb6EnYcwwx0p/nMRIMFtTdOV/c39naf?=
 =?us-ascii?Q?7DoCoAs9Z1o0pAk4/PR2teJJsYH7UFi7BfzxRQJ7QrtfYjNpiU+HBTKQSZ58?=
 =?us-ascii?Q?xFabFogYSZgueofsxwDQs1mquB9eaJ/CRF6pNAeOcDBbfLT6IRubYYZO9fJG?=
 =?us-ascii?Q?yWayj5dYIvVOak1YcwdIDcQfnBkMb9dmFPbZtZE+HKft2Sugei7ZgtZjRJ25?=
 =?us-ascii?Q?MPbhdMCdyP6mljXODAjNchgbs1vpTyzHrgMV31cEBYAl1VqMeHZfrGUjvJi0?=
 =?us-ascii?Q?EuxvA8jmlE/MNbwvdDsssnaaPpbbxlcQUJ1PBP6dACdgeXTMERGmkDSruMIv?=
 =?us-ascii?Q?HCOypwSk+CWwYrb3nDHAbIs1v1dcpKrG/pkj2IjLR7xY5JhbqQolTO5eR0dV?=
 =?us-ascii?Q?KJ6UCOS1x3hOm8NmOvhHS1Y5C0A37hZQIr3tyHpxYAH4lFLazEZQ88R4TzQr?=
 =?us-ascii?Q?MSE/PvhJB0RYj6SyJmtE/MBlaM6W7qCHuCUBoGmrbdDEd7fG+TvkABphHPsx?=
 =?us-ascii?Q?tLqoLYjxjYjRFlo1yr41SxPoqseLh2IHBjAnz9x78ev1zGfMNYs8OUGIa5LO?=
 =?us-ascii?Q?xJqkfU0q8/x7PvjtYkDtqMP1z69lfuDipTlC9+TC/QwDevo7pKbrRzWCmu1Z?=
 =?us-ascii?Q?5rO9Pg2/Hmo75+He7GQYd124zkogqdkXnvZTwxUUhGmN0veKdQFpfu0r8RB0?=
 =?us-ascii?Q?ElPndU8eta0AGF/fo7xtFc5mbyLjtyGt1+cpcWP9cHcOb9UWCg0C1BWFCC6U?=
 =?us-ascii?Q?7Elln6ZU1nokVH7qMHyXyAu+3/2/gnFjs4VexRl/1eg5WM/SxGizQYJK9PWl?=
 =?us-ascii?Q?MpGt82SqpniZXlWStgfG2SLtddYt6e6IatUeFJrcSeLA2IgOgRPSFF8MfhqJ?=
 =?us-ascii?Q?ydOppM7+gPuyhodShOkCFojUpi3DrX1b8GiRLhDgkA3bBBob/k5xdotCUlTd?=
 =?us-ascii?Q?S/ZtdMypEGhObZLscQc//hY=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c53ffadc-6ee0-49d6-214d-08d9be35834f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 12:38:49.7072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cdVzpR658mBs2qXPh0cGEVnZc8LqYvvwESB3VSXwfugW0KV04lz05avpnRtKb2ebY5mFA/Fx6o/LKU/BSAHPaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5595
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 12:38:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159619

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Separate licenses with & operator since it should be satisfied most use
cases and it is a reasonable assumption that all the licenses apply.
Furthermore flat, split and sort the licenses to minimize license string
changes.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

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


