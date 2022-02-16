Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28261C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 11:08:53 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.122])
 by mx.groups.io with SMTP id smtpd.web10.10494.1645009728579226865
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 03:08:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=ZUwFQ8L3;
 spf=pass (domain: arri.de, ip: 40.107.15.122, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jz3QwlSPUSjYJNtCoGYMA1QgXihXtAtQsRCEpaEdT2HQyyaZBU4Q4KthUnahCtsjfrVO/c1h6O6zXsNp3VYMQS38UKvr4JmJLCo7Qbg/woKyLmLIBItITNwdT9cBCr2vraNrzJH7xXwE/wjt6heLpkDsdVs+OMAhf33EdnSCbjXW1ujOqd8vynMZPxIlSW4KlMnvMYkMnLW5PqAN1ki2enA8tXNODw/2HsXTkwg+StsbsnOT1SXg1pbvaNPdeqB+20v8xHpBiPkvjwUfcIjvje8MzOWw5LWgytKbXxHfRX3YQnKIj5O5et1L0497OXT5+ir/1X/B41jztfjzK8LQww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6auJ1D1faLqlqlDkvxepGV0tVaDaWAYhEksWycLlSXs=;
 b=A8eetzzapyF93ponmTpTMwHOx/MIqDoynJz6Z3mmVP+F3skEOoZS7IDXinVVoeccxRLX1xSUILoiU2ZYaB2mmHLj0FIoJEURR2Mncg3ELjWy4sXYoeG4DPOgK5tH4DAcL1V6XUaSVTy/bG0qXc3VxsaYtp+8zCdDwShf3VIUUqQrhDFcUc/obVh5AYqltMMy4q3cmJzi0XEkiY6eYagEeQbLJ2TH4/Fruv41zA8tV+JI/zXWg75OhRCgz2moPxxeiXxPCtLKCP/GFdJLlbjuuibWbkrsKuXKz8kT9uRPlhkuV1vFiR/27Ip0oFB48SIviIViwMjeJLuw4AvB2/r0Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6auJ1D1faLqlqlDkvxepGV0tVaDaWAYhEksWycLlSXs=;
 b=ZUwFQ8L3iJxEJ/7KnomJjaSPR9defSGouu0HxhrIjSkil3M/KnuL5u9bHM6tFfiraHi4tYplm9c9F7qbiPRCVdBfipsSjvNVFuj1wQFXulGcnBodtMq41dgljoose2uG2AgxN6VpLorYm8fpjTPU5hSEJTy2QY5Te1icFITrhHg=
Received: from SV0P279CA0064.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:14::15)
 by DU2PR07MB8064.eurprd07.prod.outlook.com (2603:10a6:10:23b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Wed, 16 Feb
 2022 11:08:45 +0000
Received: from HE1EUR02FT018.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:f10:14:cafe::e7) by SV0P279CA0064.outlook.office365.com
 (2603:10a6:f10:14::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14 via Frontend
 Transport; Wed, 16 Feb 2022 11:08:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 HE1EUR02FT018.mail.protection.outlook.com (10.152.10.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 11:08:44 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Wed, 16 Feb
 2022 12:08:44 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Wed, 16 Feb 2022 12:08:44 +0100
Received: from localhost.de (192.168.54.102) by mta.arri.de (192.168.100.104)
 with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 16 Feb 2022 12:08:43
 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [honister][PATCH] mc: fix build if ncurses have been configured
 without wide characters
Date: Wed, 16 Feb 2022 12:08:33 +0100
Message-ID: <20220216110833.378-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.102]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fc370f4-2779-41f9-fdfb-08d9f13cb2ba
X-MS-TrafficTypeDiagnostic: DU2PR07MB8064:EE_
X-Microsoft-Antispam-PRVS: 
	<DU2PR07MB80644CE453D39EA8D4AB9757BF359@DU2PR07MB8064.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p0rgULl+WVjtmNjYqQx0MaPpbXSovRl1JXKSPd7ipXa8Q6z+Wau37x9q3TzDP3C+VfWite/G7pPkrzWnyTz4dcE/va2VAr91P3w+V7RNNWZKebjrO/6kiGLS+lCvFkBBz5NpbVDjZlQEBKGcGeRmcQ1OX5r+9dqhFIQYwQBQSd0uHn+q/dews8Fuzbzp/kzn2WiTmUi7ufmknymgX2poD4hHfcZhPIy//eitLUtlVxI5PBrKaCcdlSeRDAt6RTlqWRedFBOlSKQDzUv9BQXPt0V/twdo89DOsXwOP+bILfa29BYQQyejNmjxD3ENMj6cWn0dUDRQYtYTpoTer/9hezHifXI1bfTaa9TM5lhF0YQfZRhdILQSf6/KjqDdRAY0yYBmjHSJeQbSYO0M/qy1/v/14BHX3vJ/aWyRQtapInzbl2jIuA06J4M43A2K+NrFwxZ4RNlKQ9ZAT+8uOpt1xNfXoCBGavYBTcgNdVt8Ttq0Blo2zGqivnuYxCSRaLx+Mh7VKL747TkxkJMz/+zfAtZsGPJd1nOrnYo+JPMw/neLWpnlw69z//fjDAryuv1aPkHB5lx+F3LKAn4C6+wBtCNgHqF2J7viyp+N2bB6pI2RyXwmYCB+Gb6GmwPTu5QTl5mVaRwvs+SUkPP6fAPy2A3JAhRpaDXDw7R4cPAlXlddZneQ5FM1njbY2gLRbXC/OvF88uDvkL5ik1ZxiHdQVln/8n6BT9UIuqoaCsFQlaTzOgCDjEv+sJS/0/4C/a5FxliF69txglrEUuRu+1y49J1kl8/WNmn5jOdqE04DxLs=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(26005)(36756003)(40460700003)(86362001)(426003)(6666004)(186003)(336012)(2616005)(1076003)(16526019)(47076005)(508600001)(5660300002)(83380400001)(8676002)(4326008)(54906003)(2906002)(70206006)(8936002)(81166007)(356005)(70586007)(82310400004)(6916009)(36860700001)(316002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 11:08:44.7785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5fc370f4-2779-41f9-fdfb-08d9f13cb2ba
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR02FT018.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 11:08:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161774

Some distros like poky-tiny set ENABLE_WIDEC=3Dfalse, which disables wide
character support for ncurses. The new patch fixes the build of mc for
this case.

Since 9000f8033662, NCURSES_WIDECHAR is set explicitly to 1 for musl.
This doesn't work for ENABLE_WIDEC=3D=3Dfalse. In this case,
NCURSES_WIDECHAR must be set explicitly to 0, as curses.h does not
record whether the ncurses library has actually been built with or
without wide characters.

Fixes: 9000f8033662 ("mc: upgrade 4.8.25 -> 4.8.26")
Signed-off-by: Christian Eggers <ceggers@arri.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...FTBFS-with-ncurses-build-with-disabl.patch | 87 +++++++++++++++++++
 meta/recipes-extended/mc/mc_4.8.27.bb         |  5 +-
 2 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/mc/files/0001-Ticket-4200-fix-FTB=
FS-with-ncurses-build-with-disabl.patch

diff --git a/meta/recipes-extended/mc/files/0001-Ticket-4200-fix-FTBFS-with=
-ncurses-build-with-disabl.patch b/meta/recipes-extended/mc/files/0001-Tick=
et-4200-fix-FTBFS-with-ncurses-build-with-disabl.patch
new file mode 100644
index 000000000000..408473664f5d
--- /dev/null
+++ b/meta/recipes-extended/mc/files/0001-Ticket-4200-fix-FTBFS-with-ncurse=
s-build-with-disabl.patch
@@ -0,0 +1,87 @@
+From e7bbf72544ab62db9c92bfe7bd1155227e78c621 Mon Sep 17 00:00:00 2001
+From: Andrew Borodin <aborodin@vmail.ru>
+Date: Sat, 28 Aug 2021 11:46:53 +0300
+Subject: [PATCH] Ticket #4200: fix FTBFS with ncurses build with
+ --disable-widec.
+
+Upstream-Status: Accepted [https://github.com/MidnightCommander/mc/commit/=
e7bbf72544]
+Signed-off-by: Andrew Borodin <aborodin@vmail.ru>
+---
+ lib/tty/tty-ncurses.c   | 8 ++++++++
+ lib/tty/tty-ncurses.h   | 5 +++++
+ lib/tty/tty-slang.h     | 2 ++
+ src/filemanager/boxes.c | 2 ++
+ 4 files changed, 17 insertions(+)
+
+diff --git a/lib/tty/tty-ncurses.c b/lib/tty/tty-ncurses.c
+index f619c0a7bf31..13058a624208 100644
+--- a/lib/tty/tty-ncurses.c
++++ b/lib/tty/tty-ncurses.c
+@@ -560,6 +560,7 @@ tty_fill_region (int y, int x, int rows, int cols, uns=
igned char ch)
+ void
+ tty_colorize_area (int y, int x, int rows, int cols, int color)
+ {
++#ifdef ENABLE_SHADOWS
+     cchar_t *ctext;
+     wchar_t wch[10];            /* TODO not sure if the length is correct=
 */
+     attr_t attrs;
+@@ -585,6 +586,13 @@ tty_colorize_area (int y, int x, int rows, int cols, =
int color)
+     }
+=20
+     g_free (ctext);
++#else
++    (void) y;
++    (void) x;
++    (void) rows;
++    (void) cols;
++    (void) color;
++#endif /* ENABLE_SHADOWS */
+ }
+=20
+ /* ----------------------------------------------------------------------=
----------------------- */
+diff --git a/lib/tty/tty-ncurses.h b/lib/tty/tty-ncurses.h
+index d75df9533ab9..8feb17ccd045 100644
+--- a/lib/tty/tty-ncurses.h
++++ b/lib/tty/tty-ncurses.h
+@@ -30,6 +30,11 @@
+ #define NCURSES_CONST const
+ #endif
+=20
++/* do not draw shadows if NCurses is built with --disable-widec */
++#if defined(NCURSES_WIDECHAR) && NCURSES_WIDECHAR
++#define ENABLE_SHADOWS 1
++#endif
++
+ /*** typedefs(not structures) and defined constants *********************=
*************************/
+=20
+ /*** enums **************************************************************=
*************************/
+diff --git a/lib/tty/tty-slang.h b/lib/tty/tty-slang.h
+index 5b12c6512853..eeaade388af4 100644
+--- a/lib/tty/tty-slang.h
++++ b/lib/tty/tty-slang.h
+@@ -23,6 +23,8 @@
+ #define COLS  SLtt_Screen_Cols
+ #define LINES SLtt_Screen_Rows
+=20
++#define ENABLE_SHADOWS 1
++
+ /*** enums **************************************************************=
*************************/
+=20
+ enum
+diff --git a/src/filemanager/boxes.c b/src/filemanager/boxes.c
+index 3eb525be4a9b..98df5ff2ed9a 100644
+--- a/src/filemanager/boxes.c
++++ b/src/filemanager/boxes.c
+@@ -280,7 +280,9 @@ appearance_box_callback (Widget * w, Widget * sender, =
widget_msg_t msg, int parm
+     switch (msg)
+     {
+     case MSG_INIT:
++#ifdef ENABLE_SHADOWS
+         if (!tty_use_colors ())
++#endif
+         {
+             Widget *shadow;
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-extended/mc/mc_4.8.27.bb b/meta/recipes-extended/=
mc/mc_4.8.27.bb
index 546e615d1d1c..e877780ea051 100644
--- a/meta/recipes-extended/mc/mc_4.8.27.bb
+++ b/meta/recipes-extended/mc/mc_4.8.27.bb
@@ -11,6 +11,7 @@ RRECOMMENDS:${PN} =3D "ncurses-terminfo"
 SRC_URI =3D "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.=
bz2 \
            file://0001-mc-replace-perl-w-with-use-warnings.patch \
            file://nomandate.patch \
+           file://0001-Ticket-4200-fix-FTBFS-with-ncurses-build-with-disab=
l.patch \
            "
 SRC_URI[sha256sum] =3D "2f52dd9c75c20d8eac7701bd3a8c6c125aaf8cdd9cf12b78ca=
50a0102b543407"
=20
@@ -27,7 +28,9 @@ PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[smb] =3D "--enable-vfs-smb,--disable-vfs-smb,samba,"
 PACKAGECONFIG[sftp] =3D "--enable-vfs-sftp,--disable-vfs-sftp,libssh2,"
=20
-CFLAGS:append:libc-musl =3D ' -DNCURSES_WIDECHAR=3D1 '
+# enable NCURSES_WIDECHAR=3D1 only if ENABLE_WIDEC has not been explicitly=
 disabled (e.g. by the distro config).
+# When compiling against the ncurses library, NCURSES_WIDECHAR needs to ex=
plicitly set to 0 in this case.
+CFLAGS:append:libc-musl =3D "${@' -DNCURSES_WIDECHAR=3D1' if bb.utils.to_b=
oolean((d.getVar('ENABLE_WIDEC') or 'True')) else ' -DNCURSES_WIDECHAR=3D0'=
}"
 EXTRA_OECONF =3D "--with-screen=3Dncurses --without-gpm-mouse --without-x =
--disable-configure-args"
 EXTRANATIVEPATH +=3D "file-native"
=20
--=20
2.34.1


