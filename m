Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC65C98321
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 16:57:09 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2945.1790355422005019527
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2026 09:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=mWIf51Wx;
 spf=pass (domain: axis.com, ip: 52.101.66.55, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uz6BB5IhWALPh8Z7BWX3hOaeJgLCyyTGdGYgkBduGv9iA7iaIksblaszx7y+WvAd/f1+WbeyefgYtFzkQklgIv0opgn9e64VZkezGFdwauNxAnzkueCA2ZnJ5iQ7WVw9JzFJlR3DHNIu+5A2lViKaFMEGVXLdg76XBqt/lBn01Rnu28/okSYgLDMmsHsSfrg5Nj2xmj/NWRblXtgqP/Rnb0DkY6y1ixrPnzNZxnoKdclDS0BzfHyDh7gACIL8TLOtaw03RllXyLlE4vYn99LocOAVesGqYrF5pUri13prkT7hYQ52uQzPNBKtfU58Ep+CO0A+a7rf5Q0aTWr3v044A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byDeBlUedmyr3K+vZ3XJNM26Zv+b1Lg/g20aJ/jtJmg=;
 b=qtXi7/5yO36jEKihNp2bpG+FiVqvOk7BPm7h8gW71qf2zt64R9TKaVgkT/C8ogGFfOL2axGwMG/KW6HNfRDi9Wfo4OEzjsZJPA7eZ4qTXdchUJpdCokv5cP4EIfsb92BEhOfbgYec6tO93LijuPNdqzjZnQPb+woVW9OUatDJ4vKHuKVzA4c96xeJda7ocHWFYW1et2nKu9tGB17q6COToXYTM86vW6sBRz1SNS1kKXUqHtv/h4/wo+ebymeXK5uybRPnywZ9y4GB+Q7EuKGzlPC4hBT6GC1NRGwT2qlrCoGlJewgeOKeEDTeXP571rnoy7q63w77EFcWKc1kzUIhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byDeBlUedmyr3K+vZ3XJNM26Zv+b1Lg/g20aJ/jtJmg=;
 b=mWIf51Wxzy8XgeGp7QwayRQP+Z08lTff7dtGNahrZaAZABdPHrkW4SdldwFgorPY8TD8+j3dSHUx4kJMMICLog+TYWuxq8lNf0xPY212lQo+68E1E6l87kJRUJphFLfGaJ9UU7u6lvolsHkD7+X4gX3z/wIkao651hmIMOaV+pE=
Received: from AS4PR10CA0029.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::18)
 by AS4PR02MB8209.eurprd02.prod.outlook.com (2603:10a6:20b:4cc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 16:56:57 +0000
Received: from AMS1EPF0000009C.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::a7) by AS4PR10CA0029.outlook.office365.com
 (2603:10a6:20b:5d8::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Fri,
 25 Sep 2026 16:56:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF0000009C.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 16:56:56 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Fri, 25 Sep
 2026 18:56:52 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Fri, 25 Sep
 2026 18:56:52 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Fri, 25 Sep 2026 18:56:52 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 31BFD41A9
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 18:56:52 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 2B13B12B514; Fri, 25 Sep 2026 18:56:52 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] sqlite3: Squash sqlite3.inc into the recipe
Date: Fri, 25 Sep 2026 18:56:49 +0200
Message-ID: <20260925165650.220663-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000009C:EE_|AS4PR02MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: 148293ff-d1eb-4181-7fa6-08df1b26023b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|260925021311599003|13003099007|260925021911599003|10067099003|56012099006|11063799006|12006099003|18002099003|260925022911599003;
X-Microsoft-Antispam-Message-Info: 
	Y1waepCpGHbHBbI18hodfc9Tiagagg6lGxiaPVnCW4VQAIPIQMRpIQ+G/0z2kdfDmPSUUVtM4UnRTGEqUdPDpPDQCOJ68mLXWeEWXVk41wrtzyjr5o+oHhhX9EPtVaX1T2Pi0dftUK0wZ0JRvc0nZ43DpXI0qvnpmtbh6VNo9DWDUkp7q5hUTjJLWhts522g9ieigEpAGTDro3dBmZtGDskbDpl3sRPPUkuKE3b0iXX4hXAgyViQ59TCvQCGjRhepK8rXAva92yKYJL11HS9VBF0kd0bT1J5ZicEeHMNwQFBTzHIQEebVR/QjIi4YFPVq0U1JOrwiHETIrQQYz/E1pjmjZOvH2S/bsl1vMoa096GOUwvlyl7x4rBYoF4Slyh4lIOhhn94Z4gHtCC7Kd25BwYuxKR1/e5EIwGB1EMV1/Gea+/24SRJR9GuncryOSkatWQWCXlS+ss93FJoaz8bDqXhqpmZif2NlgSNaGyAOEyWayOufLJh9VuQ9nsAqoZ7q2dP2RMgTzDjem6mA/Xz8yo3t69wx5BUzJ2LmNx9OiJz4zWg8q0wMXw2RfbokM/jwN8qUdcHmg5nNpCgSVHUdiT72vln4vfawAvKloop+C/nACDbnPqM6yB3xNPg0FGHz3YdBRaRuDhjDuqxHNsyQ==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(260925021311599003)(13003099007)(260925021911599003)(10067099003)(56012099006)(11063799006)(12006099003)(18002099003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	IHNtE+0kF8L8HFF/Oz3lQPzZ9K/DwmLgxRp901LbDe58n0V0AGRKPJNvJPvE6esX4f6Rnynx2xIhpLQx4aHJ7LoO6Utq+ocRK8dAalnEnBcud/BNaN+zNccdP0hMmuLnfSUEhjnhMVi1pCHl06gRGaf6c9fLDrgHgWsMJHicy8mPMszcdtxAIfGapZ1jlGHEuJ/5rfulDQCL562SWODzLhe6kmpr8kK1QkLPjX+LnaKfOGX/t5R6ZKctlOIlWetHuVCOHH54NsITJNKXYTBFLjiurwtxLuqu5WoTEI7OmqEFd5AV8/xybQgSHgwCMe5UMcWoL+f45tuDEzZxGUMzZg5OeNBJPD/a6eRcMeAnc6FwK8t6ZSn7fZ23Hn8NRujTcrCnCEhunPj+CQNYF+droMeYJHOMf98mD5YR0B85DEEjmnxE/Fm9EtsshYl4ffh4
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 16:56:56.9704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 148293ff-d1eb-4181-7fa6-08df1b26023b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000009C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8209
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 16:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246625

It was only used by this recipe.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-support/sqlite/sqlite3.inc       | 87 ------------------
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb | 90 ++++++++++++++++++-
 2 files changed, 88 insertions(+), 89 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3.inc

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support=
/sqlite/sqlite3.inc
deleted file mode 100644
index 8791749dc8..0000000000
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ /dev/null
@@ -1,87 +0,0 @@
-SUMMARY =3D "Embeddable SQL database engine"
-DESCRIPTION =3D "A library that implements a small, fast, self-contained, =
high-reliability, full-featured, SQL database engine. SQLite is the most us=
ed database engine in the world. SQLite is built into all mobile phones and=
 most computers and comes bundled inside countless other applications that =
people use every day"
-HOMEPAGE =3D "http://www.sqlite.org"
-SECTION =3D "libs"
-
-PE =3D "3"
-
-def sqlite_download_version(d):
-    pvsplit =3D d.getVar('PV').split('.')
-    if len(pvsplit) < 4:
-        pvsplit.append('0')
-    return pvsplit[0] + ''.join([part.rjust(2,'0') for part in pvsplit[1:]=
])
-
-SQLITE_PV =3D "${@sqlite_download_version(d)}"
-
-S =3D "${UNPACKDIR}/sqlite-autoconf-${SQLITE_PV}"
-B =3D "${WORKDIR}/build"
-
-UPSTREAM_CHECK_URI =3D "http://www.sqlite.org/"
-UPSTREAM_CHECK_REGEX =3D "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
-
-CVE_PRODUCT =3D "sqlite"
-
-inherit pkgconfig siteinfo upstream-stable-release-point
-
-# enable those which are enabled by default in configure
-PACKAGECONFIG ?=3D "fts4 fts5 rtree dyn_ext"
-PACKAGECONFIG:class-native ?=3D "fts4 fts5 rtree dyn_ext"
-
-PACKAGECONFIG[editline] =3D "--enable-editline --with-readline-header=3D${=
includedir}/editline/readline.h,--disable-editline,libedit ncurses"
-PACKAGECONFIG[readline] =3D "--enable-readline --with-readline-header=3D${=
includedir}/readline/readline.h,--disable-readline,readline ncurses"
-PACKAGECONFIG[fts3] =3D "--enable-fts3,--disable-fts3"
-PACKAGECONFIG[fts4] =3D "--enable-fts4,--disable-fts4"
-PACKAGECONFIG[fts5] =3D "--enable-fts5,--disable-fts5"
-PACKAGECONFIG[rtree] =3D "--enable-rtree,--disable-rtree"
-PACKAGECONFIG[session] =3D "--enable-session,--disable-session"
-PACKAGECONFIG[zlib] =3D "--enable-zlib,--disable-zlib,zlib"
-PACKAGECONFIG[dyn_ext] =3D "--enable-load-extension,--disable-load-extensi=
on"
-
-EXTRA_OECONF =3D " \
-    --enable-shared \
-    --enable-threadsafe \
-    --disable-static-shell \
-    --disable-rpath \
-    --soname=3Dlegacy \
-"
-
-# pread() is in POSIX.1-2001 so any reasonable system must surely support =
it
-CFLAGS +=3D "-DUSE_PREAD"
-
-# Provide column meta-data API
-CFLAGS +=3D "-DSQLITE_ENABLE_COLUMN_METADATA"
-
-# Unless SQLITE_BYTEORDER is predefined, the code falls back to build time
-# huristics, which are not always correct
-CFLAGS +=3D "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-DSQLIT=
E_BYTEORDER=3D1234', '-DSQLITE_BYTEORDER=3D4321', d)}"
-
-PACKAGES =3D "lib${BPN} lib${BPN}-dev lib${BPN}-doc ${PN}-dbg lib${BPN}-st=
aticdev ${PN}"
-
-FILES:${PN} =3D "${bindir}/*"
-FILES:lib${BPN} =3D "${libdir}/*.so.*"
-FILES:lib${BPN}-dev =3D "${libdir}/*.la ${libdir}/*.so \
-                       ${libdir}/pkgconfig ${includedir}"
-FILES:lib${BPN}-doc =3D "${docdir} ${mandir} ${infodir}"
-FILES:lib${BPN}-staticdev =3D "${libdir}/lib*.a"
-
-AUTO_LIBNAME_PKGS =3D "${MLPREFIX}lib${BPN}"
-
-do_configure() {
-    ${S}/configure \
-        --build=3D${BUILD_SYS} \
-        --host=3D${TARGET_SYS} \
-        --prefix=3D${prefix} \
-        --bindir=3D${bindir} \
-        --libdir=3D${libdir} \
-        --includedir=3D${includedir} \
-        --mandir=3D${mandir} \
-        ${EXTRA_OECONF} \
-        ${PACKAGECONFIG_CONFARGS}
-}
-do_configure[cleandirs] =3D "${B}"
-
-do_install() {
-    oe_runmake DESTDIR=3D${D} install
-}
-
-BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb b/meta/recipes-s=
upport/sqlite/sqlite3_3.53.4.bb
index 66132158e0..dcd8acf538 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -1,9 +1,95 @@
-require sqlite3.inc
+SUMMARY =3D "Embeddable SQL database engine"
+DESCRIPTION =3D "A library that implements a small, fast, self-contained, =
high-reliability, full-featured, SQL database engine. SQLite is the most us=
ed database engine in the world. SQLite is built into all mobile phones and=
 most computers and comes bundled inside countless other applications that =
people use every day"
+HOMEPAGE =3D "http://www.sqlite.org"
+SECTION =3D "libs"
=20
 LICENSE =3D "blessing"
 LIC_FILES_CHKSUM =3D "file://sqlite3.h;endline=3D11;md5=3D786d3dc581eff03f=
4fd9e4a77ed00c66"
=20
+PE =3D "3"
+
+def sqlite_download_version(d):
+    pvsplit =3D d.getVar('PV').split('.')
+    if len(pvsplit) < 4:
+        pvsplit.append('0')
+    return pvsplit[0] + ''.join([part.rjust(2,'0') for part in pvsplit[1:]=
])
+
+SQLITE_PV =3D "${@sqlite_download_version(d)}"
+
+S =3D "${UNPACKDIR}/sqlite-autoconf-${SQLITE_PV}"
+B =3D "${WORKDIR}/build"
+
 SRC_URI =3D "http://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.tar.g=
z"
+SRC_URI +=3D "file://0001-Add-option-to-disable-zlib.patch"
+
 SRC_URI[sha256sum] =3D "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5a=
c81d8a9516eb9c"
=20
-SRC_URI +=3D "file://0001-Add-option-to-disable-zlib.patch"
+UPSTREAM_CHECK_URI =3D "http://www.sqlite.org/"
+UPSTREAM_CHECK_REGEX =3D "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
+
+CVE_PRODUCT =3D "sqlite"
+
+inherit pkgconfig siteinfo upstream-stable-release-point
+
+# enable those which are enabled by default in configure
+PACKAGECONFIG ?=3D "fts4 fts5 rtree dyn_ext"
+PACKAGECONFIG:class-native ?=3D "fts4 fts5 rtree dyn_ext"
+
+PACKAGECONFIG[editline] =3D "--enable-editline --with-readline-header=3D${=
includedir}/editline/readline.h,--disable-editline,libedit ncurses"
+PACKAGECONFIG[readline] =3D "--enable-readline --with-readline-header=3D${=
includedir}/readline/readline.h,--disable-readline,readline ncurses"
+PACKAGECONFIG[fts3] =3D "--enable-fts3,--disable-fts3"
+PACKAGECONFIG[fts4] =3D "--enable-fts4,--disable-fts4"
+PACKAGECONFIG[fts5] =3D "--enable-fts5,--disable-fts5"
+PACKAGECONFIG[rtree] =3D "--enable-rtree,--disable-rtree"
+PACKAGECONFIG[session] =3D "--enable-session,--disable-session"
+PACKAGECONFIG[zlib] =3D "--enable-zlib,--disable-zlib,zlib"
+PACKAGECONFIG[dyn_ext] =3D "--enable-load-extension,--disable-load-extensi=
on"
+
+EXTRA_OECONF =3D " \
+    --enable-shared \
+    --enable-threadsafe \
+    --disable-static-shell \
+    --disable-rpath \
+    --soname=3Dlegacy \
+"
+
+# pread() is in POSIX.1-2001 so any reasonable system must surely support =
it
+CFLAGS +=3D "-DUSE_PREAD"
+
+# Provide column meta-data API
+CFLAGS +=3D "-DSQLITE_ENABLE_COLUMN_METADATA"
+
+# Unless SQLITE_BYTEORDER is predefined, the code falls back to build time
+# heuristics, which are not always correct
+CFLAGS +=3D "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-DSQLIT=
E_BYTEORDER=3D1234', '-DSQLITE_BYTEORDER=3D4321', d)}"
+
+PACKAGES =3D "lib${BPN} lib${BPN}-dev lib${BPN}-doc ${PN}-dbg lib${BPN}-st=
aticdev ${PN}"
+
+FILES:${PN} =3D "${bindir}/*"
+FILES:lib${BPN} =3D "${libdir}/*.so.*"
+FILES:lib${BPN}-dev =3D "${libdir}/*.la ${libdir}/*.so \
+                       ${libdir}/pkgconfig ${includedir}"
+FILES:lib${BPN}-doc =3D "${docdir} ${mandir} ${infodir}"
+FILES:lib${BPN}-staticdev =3D "${libdir}/lib*.a"
+
+AUTO_LIBNAME_PKGS =3D "${MLPREFIX}lib${BPN}"
+
+do_configure() {
+	${S}/configure \
+		--build=3D${BUILD_SYS} \
+		--host=3D${TARGET_SYS} \
+		--prefix=3D${prefix} \
+		--bindir=3D${bindir} \
+		--libdir=3D${libdir} \
+		--includedir=3D${includedir} \
+		--mandir=3D${mandir} \
+		${EXTRA_OECONF} \
+		${PACKAGECONFIG_CONFARGS}
+}
+do_configure[cleandirs] =3D "${B}"
+
+do_install() {
+	oe_runmake DESTDIR=3D${D} install
+}
+
+BBCLASSEXTEND =3D "native nativesdk"

