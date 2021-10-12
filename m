Return-Path: <randy.li@synaptics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D5CC433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 10:13:03 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.74])
 by mx.groups.io with SMTP id smtpd.web08.11611.1634033582324819590
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 03:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@synaptics.onmicrosoft.com
 header.s=selector2-synaptics-onmicrosoft-com header.b=VpOR8OPC;
 spf=pass (domain: synaptics.com, ip: 40.107.223.74,
 mailfrom: randy.li@synaptics.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EixtoDfmNEBqCZdmJq2WCox1BjjbZs8br3ArZnXOeASJ2VSxeqPplqNbmJtKp5M9LrcR+Nq/pWgxzvvxY6qs+E8dq6A4ZIrHZd+yLajTKZhNp4Xk0Cg2ofjNWmsCd+ZN3bIwn00jIp18qfz8+SDw28LJyshbna9uHIUusG8GyS7EYR5s+sXyTEyICYdltwrJo+NVr58GiELMoVvvCNvu8b0ltRon6faPg6eVWFFumYWJi5IdYKpqamsudSIelzTZbbRagoYlVHej7yudRk+sTqsKIc6Uq94i/65yTkkujF7PSJt8/iljjWrROyGa87gmZWoRE8w766es/lybMvmg3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPMLut8y6sFim5NciRCY80tf4TsTuiLaRF3ZHqYtduc=;
 b=VK9KPh2IqcImkWR/P72TBA5JrNqUikfUmzP8YJS/mKWeC25QSGkhVIVKdZRyey5UwP/5J/pYiyT+KNpDecD6QFLesbLaVJ96Tt8VXFAhaZQNXQ4jAUUrNe7wFSuPnR86GESqrvnVkUp5fj6WcGhxChnemT/iipD6fUiAZSCXqhCa+xRjcpoNeZY7pUzGaotVIeD7/vOSzvI4McxDVVCWFfaLco+Ry4fejPbNOCs8oFsRdemBaMQvFsMIzNB0fBWxsi71zsoc8OtcDXpH6JEcsP1W/W9jt1Fipdr4ucTwLHkto68wNAW1EKnHL2ZorwSUIbU5j+QTqZgqNQr/y8FCNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPMLut8y6sFim5NciRCY80tf4TsTuiLaRF3ZHqYtduc=;
 b=VpOR8OPCG2/vD0PUxDr9vutbygBmlC+MSB/O5UVdvqXrWLl/UYqC4ybxJWNSsbXXG3dCSb2pwAxawDZCYwM/RzAmCCZ1VmDHYMsFiku6/2T1xu4ErcLurXVYC0R/uiWi6YoSPMF3S9upTVxCT5JFsz3CqFbu8tKNJDjhS1Ka0Tw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DM6PR03MB4025.namprd03.prod.outlook.com (2603:10b6:5:56::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Tue, 12 Oct
 2021 10:13:01 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::1994:3844:6596:1d13]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::1994:3844:6596:1d13%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 10:13:01 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: openembedded-core@lists.openembedded.org
CC: alex.kanavin@gmail.com,
	"Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
Subject: [PATCH 2/2] [WIP]: meson: install native file in sdk
Date: Tue, 12 Oct 2021 18:12:33 +0800
Message-ID: <20211012101233.49978-3-randy.li@synaptics.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012101233.49978-1-randy.li@synaptics.com>
References: <20211012101233.49978-1-randy.li@synaptics.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0048.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::23) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
Received: from randy-t14s.synaptics.com (192.147.44.15) by
 SJ0PR13CA0048.namprd13.prod.outlook.com (2603:10b6:a03:2c2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.5 via Frontend
 Transport; Tue, 12 Oct 2021 10:12:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60af70af-079b-403b-ee1a-08d98d68df04
X-MS-TrafficTypeDiagnostic: DM6PR03MB4025:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR03MB4025B636ACEE78864FCF068786B69@DM6PR03MB4025.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p9tJkaFapK9aKMVqVfUzGJ5lpuzgNUfAtwu/h1Rqer2qoZROI8w+ez6l40hSlPB/ouxhvm1ToMRfIySwzYyNiARHMZ7XQpkyWjRwmBu1Nb3FJWkuGoD/N0E8qaFF2g8U8iKVKAwtYSSM4yiGipf3FvqGp/Fogl+hrJxJxKG+VbjfkgwZutjvkUUHBNpX82EnPZFomMF5EaC4P3n9dwN2YTAPANQaH0RR7eALU/rm32en8+5fLlx4khE7I8jJVbeikl5NQkEJ2hxqhVxMn6naxowE4Z+F92tiPF9uVnqFmIP8UtX4mou3EQcnZUQz3QF+UYqRXsR5Cyxu16O1ByUZ96/wKMa6zVA6PMKWtScYm2xvnFVgQpWpNhF3Uffh06QSWnPp6+h/nvKXuPoKUqjh1XHRMR70s/z8GtYcRFO4+uJKaSsbzNLkY0hPePVVMluRturrAHWI1z2WDpqCRrZIktTWDlF5KgaHg+Wk9a8PT13xp8tIoRCKHCGfpOZCfwXUvr1I6MtteAZz2gjEAfVFZCmIyCdM9HHAXJuTC/5feyHo3iAWv0KkzLxnSZ6L5um6p965E/hYlUEoKOigaRPa09zz7sVxGA95HC8xOJc2H2nULvoPqllB9Zm8RQiQOI7mYDv6RU/0GGUVpvAbtMO/6IWRrY4IDdYUZ720Pm3t8OQzdjd6afidCv6OUPYHAN/bndf4iZdSIjxGyJwUdajhc2dlQ5mVrq6HIkhTfJoKwUIPx9+zFAIjA4ay3QAW4aDXhXG476ju8/I8++FGF87YxdobIzcEGNvZoLG/HbEZlI8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(6666004)(966005)(66476007)(107886003)(6486002)(1076003)(66946007)(38350700002)(38100700002)(2906002)(8676002)(7696005)(508600001)(8936002)(4326008)(86362001)(186003)(26005)(2616005)(316002)(6916009)(36756003)(52116002)(5660300002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Sn2HaFJu5rp+7RqGPaQTqV/GjJE92C8AXJa74lKsvCi1f3u9z7T7uGNriZ8K?=
 =?us-ascii?Q?ubyuA4h7Djl91iPusGXBpEOOzSFcJOU3XdHqFuKwRK8rbJg5aGTkjJvqYpS6?=
 =?us-ascii?Q?afqAV/+RYYA+8bfoKbYlvmDpTLl3cUQJZkhTt40Sg6IuL0fMxqxxUHWDw2xh?=
 =?us-ascii?Q?pr+UyudkHS+Oop9n4fJ2hyIE8/NY+Ps1CqcV26X20hNDNgqHXT5LlL1jn2Vm?=
 =?us-ascii?Q?DIPES98/JCCf2+Gv5qGXu1fPcCdQxIp3703uSRhpW2kmtRi1SeEDjgrgGXjA?=
 =?us-ascii?Q?e+wljkWUEuDlahl49iqtt4C1DGiGh1/iBiO08SDoy4P7lj4wN74Tz84I+W6R?=
 =?us-ascii?Q?4oSGzU+qQjwCDjsz0UOVy7u0tmPLJRdRzacYa2sARtvH0zytvG27ra3hDucB?=
 =?us-ascii?Q?b/Vkua9AVzwIK2rmX0+PYjwDnnH/uZmDDlHcYTF+73rlkfOatXhQb1Zr/+0o?=
 =?us-ascii?Q?pv65+OQcImYP45byZBO1w00UtIDs9g+31A+d5KtH3dLPreqYg2pQR4IV9cBw?=
 =?us-ascii?Q?O1vRpOaph/iHxPAbN+HDUw1J8viEW973E3Ggvo3KLp5l5BQw4VMHh7Wy8rdO?=
 =?us-ascii?Q?CAGwpBmTwOOOSrE7Y1JHqe+CY1+wMb7Bh7dlWeIJ2zMxFz7PWCPpP5f9ztrZ?=
 =?us-ascii?Q?riAu4EKKEBT5i9mDLD/QZKXQfQlEj9Z/C9gSokdgLeofiUa8azECxPrT+4wY?=
 =?us-ascii?Q?riCxKr1iSiblq/Yq+e5hfw4HFLaaMF4Vt6Irz3Er8GbgQSVQrFB8AEGB+kzJ?=
 =?us-ascii?Q?9JTilsG4YPpcoWYectwEblVYUFlNVxg8HGYoGSytqJ/NMdhv3UrgrgxdhfAw?=
 =?us-ascii?Q?ibwuru0aQGFUIj1BkhAL+G2KFxaa2BeuVZcX++CwYc4KHCUxWwc/XtDOiF40?=
 =?us-ascii?Q?aO95HqhcSxD1UwBJltaL24wN8YB8yx7MloQGQsWAQpm9oOlTawCQ7MN5OigV?=
 =?us-ascii?Q?3aYU7LZ3DLjz9dKforHxsD5p4achUBZ3BgoTGLX3XOYOmF8i4Eiki4PXkDj3?=
 =?us-ascii?Q?trmTtEBkmxq5IrYv1EaToLl4CLtwlazEqVEL3WyXVTyE5SPaHAODphYtlJNX?=
 =?us-ascii?Q?CzCVGK5krSkL3U/Xky0aLmqiFW46aCxYZ/+AEm3BVDh57CuhL8PmBpfe+LKb?=
 =?us-ascii?Q?GUaux5qph1/GZdiJuzAZhqnWaj1wxcY0mOU8zWbfUJ3pbdaw+I4I5aEEyoHy?=
 =?us-ascii?Q?b5F2F1h5EUA1t1XFavUDAJHc4GLfNUlJ3X8DsUNRIfuiOACj43wUftHrmZy3?=
 =?us-ascii?Q?ZvmIz4W4JygHnraWUlZB23s28W/P024Gt2RRGT6y6tijjz9n7U6cepJ8gbkZ?=
 =?us-ascii?Q?FpYDIGMG4iowCgPC0BZXbM1F?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 60af70af-079b-403b-ee1a-08d98d68df04
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 10:13:01.0559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kyvi8/LuGZ64tBhn0PdTqb2wygu4yxkHO0c2LacBwePs6UqxA5DKeFzcQn0iGG6+4sbC6HlUy6q3nmXFGgTFjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 10:13:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156866

From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>

Without a native environment file, find_program() can't
locate the native program inside SDK.

That stops wayland compositor using wayland scanner.

Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
---
 meta/classes/meson-routines.bbclass           |  4 ++
 .../meson/meson/meson-setup.py                |  2 +
 .../meson/meson/meson-wrapper                 |  1 +
 .../meson/nativesdk-meson_0.59.1.bb           | 38 +++++++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/meta/classes/meson-routines.bbclass b/meta/classes/meson-routi=
nes.bbclass
index be3aeedeba..a74a9916d8 100644
--- a/meta/classes/meson-routines.bbclass
+++ b/meta/classes/meson-routines.bbclass
@@ -4,6 +4,10 @@ def meson_array(var, d):
     items =3D d.getVar(var).split()
     return repr(items[0] if len(items) =3D=3D 1 else items)
=20
+def meson_list_str(var, d):
+    items =3D d.getVar(var).split()
+    return repr(items[0]) if len(items) =3D=3D 1 else ', '.join(repr(s) fo=
r s in items)
+
 # Map our ARCH values to what Meson expects:
 # http://mesonbuild.com/Reference-tables.html#cpu-families
 def meson_cpu_family(var, d):
diff --git a/meta/recipes-devtools/meson/meson/meson-setup.py b/meta/recipe=
s-devtools/meson/meson/meson-setup.py
index 7ac4e3ad47..4a0a967fef 100755
--- a/meta/recipes-devtools/meson/meson/meson-setup.py
+++ b/meta/recipes-devtools/meson/meson/meson-setup.py
@@ -27,6 +27,8 @@ except KeyError:
=20
 template_file =3D os.path.join(sysroot, 'usr/share/meson/meson.cross.templ=
ate')
 cross_file =3D os.path.join(sysroot, 'usr/share/meson/%smeson.cross' % os.=
environ["TARGET_PREFIX"])
+native_template_file =3D os.path.join(sysroot, 'usr/share/meson/meson.nati=
ve.template')
+native_file =3D os.path.join(sysroot, 'usr/share/meson/meson.native')
=20
 with open(template_file) as in_file:
     template =3D in_file.read()
diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes=
-devtools/meson/meson/meson-wrapper
index d4ffe60f9a..d4b5187f8d 100755
--- a/meta/recipes-devtools/meson/meson/meson-wrapper
+++ b/meta/recipes-devtools/meson/meson/meson-wrapper
@@ -11,4 +11,5 @@ unset CC CXX CPP LD AR NM STRIP
=20
 exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
      --cross-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/${TARGET_PREFI=
X}meson.cross" \
+     --native-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/meson.native"=
 \
      "$@"
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.59.1.bb b/meta/r=
ecipes-devtools/meson/nativesdk-meson_0.59.1.bb
index 5657397ddc..f537204a2d 100644
--- a/meta/recipes-devtools/meson/nativesdk-meson_0.59.1.bb
+++ b/meta/recipes-devtools/meson/nativesdk-meson_0.59.1.bb
@@ -15,6 +15,44 @@ SRC_URI +=3D "file://meson-setup.py \
 #   them.
 do_install:append() {
     install -d ${D}${datadir}/meson
+
+    cat >${D}${datadir}/meson/meson.native.template <<EOF
+[binaries]
+c =3D ${@meson_array('BUILD_CC', d)}
+cpp =3D ${@meson_array('BUILD_CXX', d)}
+ar =3D ${@meson_array('BUILD_AR', d)}
+nm =3D ${@meson_array('BUILD_NM', d)}
+strip =3D ${@meson_array('BUILD_STRIP', d)}
+readelf =3D ${@meson_array('BUILD_READELF', d)}
+pkgconfig =3D 'pkg-config-native'
+
+[built-in options]
+c_args =3D ['-isystem' @OECORE_NATIVE_SYSROOT '${includedir_native}' , ${@=
meson_list_str('BUILD_OPTIMIZATION', d)}]
+c_link_args =3D ['-L' @OECORE_NATIVE_SYSROOT '${libdir_native}',
+               '-L' @@OECORE_NATIVE_SYSROOT '${base_libdir_native}',
+               '-Wl,-rpath-link,' @OECORE_NATIVE_SYSROOT '${libdir_native}=
',
+               '-Wl,-rpath-link,' @OECORE_NATIVE_SYSROOT '${base_libdir_na=
tive}',
+               '-Wl,--allow-shlib-undefined',
+               '-Wl,--dynamic-linker=3D' @OECORE_NATIVE_SYSROOT '${base_li=
bdir_native}'
+               '${@bb.utils.contains('BUILD_ARCH', 'x86_64', 'ld-linux-x86=
-64.so.2', '', d)}
+                ${@bb.utils.contains('BUILD_ARCH', 'i686', 'ld-linux.so.2'=
, '', d)}
+                ${@bb.utils.contains('BUILD_ARCH', 'aarch64', 'ld-linux-aa=
rch64.so.1', '', d)}'
+]
+cpp_args =3D ['-isystem@OECORE_NATIVE_SYSROOT' 'usr/include', ${@meson_lis=
t_str('BUILD_OPTIMIZATION', d)}]
+cpp_link_args =3D ['-L' @OECORE_NATIVE_SYSROOT '${libdir_native}',
+               '-L' @@OECORE_NATIVE_SYSROOT '${base_libdir_native}',
+               '-Wl,-rpath-link,' @OECORE_NATIVE_SYSROOT '${libdir_native}=
',
+               '-Wl,-rpath-link,' @OECORE_NATIVE_SYSROOT '${base_libdir_na=
tive}',
+               '-Wl,--allow-shlib-undefined',
+               '-Wl,--dynamic-linker=3D' @OECORE_NATIVE_SYSROOT '${base_li=
bdir_native}'
+               '${@bb.utils.contains('BUILD_ARCH', 'x86_64', 'ld-linux-x86=
-64.so.2', '', d)}
+                ${@bb.utils.contains('BUILD_ARCH', 'i686', 'ld-linux.so.2'=
, '', d)}
+                ${@bb.utils.contains('BUILD_ARCH', 'aarch64', 'ld-linux-aa=
rch64.so.1', '', d)}'
+]
+[properties]
+sys_root =3D @OECORE_NATIVE_SYSROOT
+EOF
+
     cat >${D}${datadir}/meson/meson.cross.template <<EOF
 [binaries]
 c =3D @CC
--=20
2.17.1


