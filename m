Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD61DC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 10:18:37 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.111])
 by mx.groups.io with SMTP id smtpd.web10.32140.1644833913475347285
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 02:18:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=E1zPLXfC;
 spf=pass (domain: arri.de, ip: 40.107.22.111, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWr0ug2uU/MyaZAHP2HRD9ZFI66cuV01TmzuQtyf96aFd6zmrKfAhMowzZ4ysTPYbntiOotlgnxx/tzSvI0aTIvc6kC7HJ2LinvRUHNvbqWK9LQ8UP+BrnBmU2wdQiu8BhlbbPbW9z8Tu2NbOIH7Q/raXtXOoV2YISQ9vzyCxeM4fdI5mhYYDrYyf8YBldgpljUvbN7z7qbfhd+0LBRTIZW6A1WRiGgo+nZ5VFUtre0PkCRezoV3lVBvS5wIFPefEe6rtZVK9XrjeLSVoYl5CLOCjnnRWaPQJ332gDvpttKBMhgI6egQXOTgBW6ELHidV+iUxFJ3RvDkeAPO82KjLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKjgcjh2Dzq60mJnNIp2cBr3vNNRZczv5Vle95kbIjA=;
 b=mOx4rcHYRcM5XdHF/dUPSPQAvYOv3ZhJmg7Ax0opABGTVrdQ1aHZqBrIpguVvcb3Ub8WOLglgj8t/fIcKu4DiO7yE22IEu3OoKsfaCwyQzEVP+UdxaqsTWjjwHq5HhPB1jhqTVvDQ/X6QMLL6flWJKODoMr+lTtsgmcJSjRdz1pu+A5OjOf8YqgETvgL/P7ij/KJLPC21HQKExX/O7c5c3BYzVT1nh7xG6ZZIg/vwd4xhua9+X1dRyeYxcLCwFffRT3XSzwIF27oOqQiqe4/j05GdVR858CqIig1P774UVi7ISOaQNnQJjAvJ/QQ8/x0/j0YI237B5qukegHLm6bPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKjgcjh2Dzq60mJnNIp2cBr3vNNRZczv5Vle95kbIjA=;
 b=E1zPLXfCnT/1YOkPsuxWSng9x1NoMdmcIMo5l6sZ1VUZQhi3WyYsGhegl3418Q4S0UnNTJ/W6uggaCIgMEoInqVoiJ892JPOBDRu8cZSo3y2cWfNDwLNulkLQUVdpbPaWwq7zhtUglabwGKPWz8VpMIfPsL7hrYByVdDcKXFDSQ=
Received: from AM5PR1001CA0041.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::18) by PAXPR07MB8493.eurprd07.prod.outlook.com
 (2603:10a6:102:2b8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.13; Mon, 14 Feb
 2022 10:18:29 +0000
Received: from AM5EUR02FT058.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::4b) by AM5PR1001CA0041.outlook.office365.com
 (2603:10a6:206:15::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Mon, 14 Feb 2022 10:18:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM5EUR02FT058.mail.protection.outlook.com (10.152.9.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 10:18:28 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 14 Feb
 2022 11:18:28 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Mon, 14 Feb 2022 11:18:28 +0100
Received: from dhcp-192-168-0-28.wgnetz.xx.de (192.168.54.144) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 14 Feb
 2022 11:18:27 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [PATCH] mc: fix build if ncurses have been configured without wide
 characters
Date: Mon, 14 Feb 2022 11:18:14 +0100
Message-ID: <20220214101814.15209-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.144]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1a701c9-8c02-48b5-8609-08d9efa3584c
X-MS-TrafficTypeDiagnostic: PAXPR07MB8493:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR07MB8493EF52C5CA79364D78F970BF339@PAXPR07MB8493.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wWh6nCONBnIiH8qnbL//SqxbJWjLo0a/9Gk619qFOW9IWvZCDanyYucqlOEHc/7nsFRFVmA6V4EA3kzH4cXt9uQaCVlBhyGkBFkG3lipkz3YTgrUZhrPZGf+x9ena/+wAaM574+elx/wG1o8kKLB0T0OgOfkpKYTFXG34i+OrSHxoeOVXsxpyES2fIfy1ZouRrddp9hBtAF+Qdce+cgEF/atq3C+ySgj2S3UpcvWWNlA+GmSDkDgWWrAimCLRjKrxq6KxwbXtk3Iw+Msz1Pqacx8UtLty6Eti4vDpcZIY9qbNmQGHZwbNgxkl0MNK4N13JGzxQO3P1AegpgpCsRcQwvhGXR3DJwueNPqw4HxtqKzfLHyxxLFjlhKqbuWDfPiNjvUHoDYJ+6DDSYI/GTSy5w89JZfnDQEA29M60RvvcY33e7O8SwB24MW3ZtMppK3E+jQ0Mg4OAVafLXC5DyjWv2SKxrZU4b5KWJoaze1ekDr8f9IhOw8mpoS9vo6jBkWH0SeFIUeIIWl15dR8mrUQiFMBkUk/F3V3UwUsmTqaxOutM9mSbkAgQKiJQPVnrag/RPR1IIsxmgD1Qfp/wpQTrP8lxfVkhDsBOBwENx15205obyZGd9QXCNC0Be7yheGMAHUqSZJrCKgaGwkj8r+A2hWV/nW1oRfFHaMLY+eRSdRANmKH3nzeh/VOabPM8qw0ZUasO6fX1A3jDjtwd6IV3jhynT6lnpefkdZAbn8fyfEBOo6AHyYP9E0KrI7kThsJrlGAV24G0o0kN/LasYG1shNxzzWL7bHHJd48SuEhwc=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(8936002)(4326008)(186003)(70206006)(2906002)(5660300002)(82310400004)(8676002)(70586007)(86362001)(36756003)(356005)(81166007)(16526019)(83380400001)(26005)(36860700001)(336012)(508600001)(40460700003)(107886003)(2616005)(47076005)(1076003)(316002)(6916009)(426003)(6666004)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 10:18:28.9284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d1a701c9-8c02-48b5-8609-08d9efa3584c
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR02FT058.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB8493
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 10:18:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161698

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


