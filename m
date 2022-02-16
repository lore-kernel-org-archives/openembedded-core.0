Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F00AC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 11:14:49 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.92])
 by mx.groups.io with SMTP id smtpd.web08.10583.1645010085046272024
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 03:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=baulLV9x;
 spf=pass (domain: arri.de, ip: 40.107.6.92, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPCMkktKv/49nb4xB0mtZXz0IAhdsr6TItDjJsvxO83PJdUyTJOwlmCa7Dp2YCnClZx9gfz2DHlU0MZZHLTqJtrnCWP8rUO6UM6nG8OUgDI3MKleizO/WGKyvp78UmOKaUBTJzt4+0nYG8T772kY9WxTK7jK+5XsViD9t+rwVse/diKeGdxU0wk2naaGRnTGgwgOKzUkkAz9WbLFvYBYLj/xPn5wYvQHklLvOTo7G4W2ONNfNF7apvdjj+pEftviuuqUeNVyyR0BVhXYqar6WRg6J0YScEXds69ZC88Pu1dpUh9AgEYPX06pVWR8Ou4klHQUmQqqqMdqjZsh0urQHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amT716/SXRF5CXbTDHrS/+TYhqp0Puf9RB2sAGRjujI=;
 b=KNwcKGcF2YgBIZnpucY/q3bybOz9lBHpkzevEIW50C+aHybcdpkbgA9gbxWRKJov5JtnZKFSqwOEsiX73CkjEO6YM0OxJQm9rLlnj9y5kYhi6FIKS+VxRq87j/zB50UwvUzZlOTXJlKraH29iqwkLvgQGYIHPXTSKT1/Jcl34vM2xv19ImYtPbF8i6ouCEk+7NYKBbsGY8aWdNBxgsgzpjK7NmZiTHxlLd1BIlvLAzUVags8GArOe/QboEr/VttkHfsBZ7hilP+zJBByHW1xhKDRrEqGOuGpm8BhiK1vsy6gg5kaksre7ezYxROilz0jLvzhRcxudt3w05/4tzb7kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amT716/SXRF5CXbTDHrS/+TYhqp0Puf9RB2sAGRjujI=;
 b=baulLV9xiNubcFcBTSJqxvHR4uDiDqatkjOVgE81bmtovKO3JXm1A1qkMDTz35dTdcEJuwz7vO7Q5szQp20XaeCJmr4PKS1rqD651hDfYpqMnDHR4IKJO2efwAZbrhcP7vuCRPMF95+qs+cR95nIe1/wP/KeybCKg6eYXUVyQV4=
Received: from AS9P194CA0024.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::29)
 by PR3PR07MB7003.eurprd07.prod.outlook.com (2603:10a6:102:5f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.6; Wed, 16 Feb
 2022 11:14:41 +0000
Received: from VE1EUR02FT062.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::fb) by AS9P194CA0024.outlook.office365.com
 (2603:10a6:20b:46d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Wed, 16 Feb 2022 11:14:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT062.mail.protection.outlook.com (10.152.13.178) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 11:14:41 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Wed, 16 Feb
 2022 12:14:40 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Wed, 16 Feb 2022 12:14:40 +0100
Received: from localhost.de (192.168.54.102) by mta.arri.de (192.168.100.104)
 with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 16 Feb 2022 12:14:40
 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [hardknott][PATCH] mc: fix build if ncurses have been configured
 without wide characters
Date: Wed, 16 Feb 2022 12:14:30 +0100
Message-ID: <20220216111430.979-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.102]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cac420c0-3fed-4693-aeeb-08d9f13d871f
X-MS-TrafficTypeDiagnostic: PR3PR07MB7003:EE_
X-Microsoft-Antispam-PRVS: 
	<PR3PR07MB7003CCE8E5A509A19B4DD1EBBF359@PR3PR07MB7003.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EWLDgyDcx39H+KPfEI3KhJ65JgDBPKTZ+W02rC1gbnLApYbXo7BL58kVWkpwyyrL83l1Wgdf3NILf2HG0Dc/VbiphrE0hzeexJ4cze6OzqnXQOS+RV6ZT3Bzajwh9Be5jST6dGx0H9fPoRoZgduD2++NVpTckeSp8qVV/dF2kVF/HWQlcoa98jTaojmpZViLkjgh+3zyRmWC1LVU4at3rkuSQHtpICBcpzyJHwnMeF34vdtEuq44jqZo7SrI/3VKX3lj9sceRYptFogrvGPNFaBeWcjbpxvBajIV536fqr+KnP/HnVLsSR/TE3lcZg8yT/V/Eku89t2EPoxi11Qwu5OEukBs1j/lCHcyT/2UN0oLbo05Vr3kT/lvxvM5aC7TNRUQ6QiVyWm2WZrFk6xOcZiVDcxVsJkei+QoJ0Zg9ctO3sVjwFxEPcWO2IFwROI/1G46pQSswc3VKUt14W+D7QjVqUG9JMsdm9mYuCkf1YxDkdpJon6WhY2r1TzhZF8DqPCfBq/9c6aSBlKT8gLABQVezUB4lMTJLfZeGhxR2UZcJedRaawu22WjT3yJqyFuRpuu7sm9D5mqtwgL+g/na9vWs941kMYN3gwlM9BST120sBP5y9oXpjPnsmr/hQVkDc9FgaAPzlUV4k6V79cYmrM/e3O1EYSEYj68nS2JKrxwPnOsHbVe3hw7LhbewWsKNwWzSh7/rkX+K7Ddzgp8Qhvq9rhlD53KTnpc7YNkpRymCcUgXRLYQ7AfUfIa327Y8sUoXq8SPosj+gwWElbHqO7yfdpzm9DY+pJdzo4TYrY=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(36860700001)(70206006)(4326008)(70586007)(47076005)(40460700003)(82310400004)(81166007)(186003)(356005)(6666004)(8676002)(8936002)(36756003)(86362001)(316002)(508600001)(6916009)(54906003)(2906002)(83380400001)(16526019)(2616005)(1076003)(336012)(5660300002)(26005)(426003)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 11:14:41.1466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cac420c0-3fed-4693-aeeb-08d9f13d871f
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT062.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB7003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 11:14:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161775

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
 meta/recipes-extended/mc/mc_4.8.26.bb         |  5 +-
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
diff --git a/meta/recipes-extended/mc/mc_4.8.26.bb b/meta/recipes-extended/=
mc/mc_4.8.26.bb
index 6bc7e6e8e159..906778400ec8 100644
--- a/meta/recipes-extended/mc/mc_4.8.26.bb
+++ b/meta/recipes-extended/mc/mc_4.8.26.bb
@@ -12,6 +12,7 @@ SRC_URI =3D "http://www.midnight-commander.org/downloads/=
${BPN}-${PV}.tar.bz2 \
            file://0001-mc-replace-perl-w-with-use-warnings.patch \
            file://nomandate.patch \
            file://CVE-2021-36370.patch \
+           file://0001-Ticket-4200-fix-FTBFS-with-ncurses-build-with-disab=
l.patch \
            "
 SRC_URI[sha256sum] =3D "9d6358d0a351a455a1410aab57f33b6b48b0fcf31344b9a10b=
0ff497595979d1"
=20
@@ -24,7 +25,9 @@ PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[smb] =3D "--enable-vfs-smb,--disable-vfs-smb,samba,"
 PACKAGECONFIG[sftp] =3D "--enable-vfs-sftp,--disable-vfs-sftp,libssh2,"
=20
-CFLAGS_append_libc-musl =3D ' -DNCURSES_WIDECHAR=3D1 '
+# enable NCURSES_WIDECHAR=3D1 only if ENABLE_WIDEC has not been explicitly=
 disabled (e.g. by the distro config).
+# When compiling against the ncurses library, NCURSES_WIDECHAR needs to ex=
plicitly set to 0 in this case.
+CFLAGS_append_libc-musl =3D "${@' -DNCURSES_WIDECHAR=3D1' if bb.utils.to_b=
oolean((d.getVar('ENABLE_WIDEC') or 'True')) else ' -DNCURSES_WIDECHAR=3D0'=
}"
 EXTRA_OECONF =3D "--with-screen=3Dncurses --without-gpm-mouse --without-x =
--disable-configure-args"
=20
 CACHED_CONFIGUREVARS +=3D "ac_cv_path_PERL=3D'/usr/bin/env perl'"
--=20
2.34.1


