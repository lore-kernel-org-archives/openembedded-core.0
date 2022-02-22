Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D85BC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:30 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.13723.1645542509609922511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=EAeSy8FA;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542509; x=1677078509;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=bV3Px0mQh+CK2j8r+MHeBq6j0FphvZLoV1ycKiAUsfI=;
  b=EAeSy8FAyKbVJm0wIbu+DMrBRFtWoBAcw+W4J9KIUXXoDr4ExmC80Hnk
   9TEXQ9xxuNERWw2+/SH8ZYnVwnjRz6x1+ErpKoHMa9sNBjNbttKNtS0kn
   tbvCHK6HCVfCrcCYq07nMyVZ4eWLH7OuCeXXbfVDMKyiYD4B1g2Ne1qqA
   OPs1fsvNCiN3v7Mx67CX8MH8Ul4Q/jwtl6W/EPO1wpsAEJSNIPpT8lKLH
   11oxZ1bUc78I0BbAcsszOrDGM9Cl9ilFmAWba872gr8uT8H+IhePuZfV4
   /GtfhqJ4BiEB49495nd4MUO05/zPMjG9GSPkLvPrINvU5qR0VVJEF0+Zi
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249305073"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="249305073"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258581"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:08 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 13/38] mc: fix build if ncurses have been configured
 without wide characters
Date: Tue, 22 Feb 2022 23:07:14 +0800
Message-Id: 
 <9a3a1a806f0c6963c671f0a46f6e910c6206e681.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162148

From: Christian Eggers <ceggers@arri.de>

Some distros like poky-tiny set ENABLE_WIDEC=false, which disables wide
character support for ncurses. The new patch fixes the build of mc for
this case.

Since 9000f8033662, NCURSES_WIDECHAR is set explicitly to 1 for musl.
This doesn't work for ENABLE_WIDEC==false. In this case,
NCURSES_WIDECHAR must be set explicitly to 0, as curses.h does not
record whether the ncurses library has actually been built with or
without wide characters.

Fixes: 9000f8033662 ("mc: upgrade 4.8.25 -> 4.8.26")
Signed-off-by: Christian Eggers <ceggers@arri.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...FTBFS-with-ncurses-build-with-disabl.patch | 87 +++++++++++++++++++
 meta/recipes-extended/mc/mc_4.8.27.bb         |  5 +-
 2 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/mc/files/0001-Ticket-4200-fix-FTBFS-with-ncurses-build-with-disabl.patch

diff --git a/meta/recipes-extended/mc/files/0001-Ticket-4200-fix-FTBFS-with-ncurses-build-with-disabl.patch b/meta/recipes-extended/mc/files/0001-Ticket-4200-fix-FTBFS-with-ncurses-build-with-disabl.patch
new file mode 100644
index 0000000000..408473664f
--- /dev/null
+++ b/meta/recipes-extended/mc/files/0001-Ticket-4200-fix-FTBFS-with-ncurses-build-with-disabl.patch
@@ -0,0 +1,87 @@
+From e7bbf72544ab62db9c92bfe7bd1155227e78c621 Mon Sep 17 00:00:00 2001
+From: Andrew Borodin <aborodin@vmail.ru>
+Date: Sat, 28 Aug 2021 11:46:53 +0300
+Subject: [PATCH] Ticket #4200: fix FTBFS with ncurses build with
+ --disable-widec.
+
+Upstream-Status: Accepted [https://github.com/MidnightCommander/mc/commit/e7bbf72544]
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
+@@ -560,6 +560,7 @@ tty_fill_region (int y, int x, int rows, int cols, unsigned char ch)
+ void
+ tty_colorize_area (int y, int x, int rows, int cols, int color)
+ {
++#ifdef ENABLE_SHADOWS
+     cchar_t *ctext;
+     wchar_t wch[10];            /* TODO not sure if the length is correct */
+     attr_t attrs;
+@@ -585,6 +586,13 @@ tty_colorize_area (int y, int x, int rows, int cols, int color)
+     }
+ 
+     g_free (ctext);
++#else
++    (void) y;
++    (void) x;
++    (void) rows;
++    (void) cols;
++    (void) color;
++#endif /* ENABLE_SHADOWS */
+ }
+ 
+ /* --------------------------------------------------------------------------------------------- */
+diff --git a/lib/tty/tty-ncurses.h b/lib/tty/tty-ncurses.h
+index d75df9533ab9..8feb17ccd045 100644
+--- a/lib/tty/tty-ncurses.h
++++ b/lib/tty/tty-ncurses.h
+@@ -30,6 +30,11 @@
+ #define NCURSES_CONST const
+ #endif
+ 
++/* do not draw shadows if NCurses is built with --disable-widec */
++#if defined(NCURSES_WIDECHAR) && NCURSES_WIDECHAR
++#define ENABLE_SHADOWS 1
++#endif
++
+ /*** typedefs(not structures) and defined constants **********************************************/
+ 
+ /*** enums ***************************************************************************************/
+diff --git a/lib/tty/tty-slang.h b/lib/tty/tty-slang.h
+index 5b12c6512853..eeaade388af4 100644
+--- a/lib/tty/tty-slang.h
++++ b/lib/tty/tty-slang.h
+@@ -23,6 +23,8 @@
+ #define COLS  SLtt_Screen_Cols
+ #define LINES SLtt_Screen_Rows
+ 
++#define ENABLE_SHADOWS 1
++
+ /*** enums ***************************************************************************************/
+ 
+ enum
+diff --git a/src/filemanager/boxes.c b/src/filemanager/boxes.c
+index 3eb525be4a9b..98df5ff2ed9a 100644
+--- a/src/filemanager/boxes.c
++++ b/src/filemanager/boxes.c
+@@ -280,7 +280,9 @@ appearance_box_callback (Widget * w, Widget * sender, widget_msg_t msg, int parm
+     switch (msg)
+     {
+     case MSG_INIT:
++#ifdef ENABLE_SHADOWS
+         if (!tty_use_colors ())
++#endif
+         {
+             Widget *shadow;
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/mc/mc_4.8.27.bb b/meta/recipes-extended/mc/mc_4.8.27.bb
index 546e615d1d..e877780ea0 100644
--- a/meta/recipes-extended/mc/mc_4.8.27.bb
+++ b/meta/recipes-extended/mc/mc_4.8.27.bb
@@ -11,6 +11,7 @@ RRECOMMENDS:${PN} = "ncurses-terminfo"
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://0001-mc-replace-perl-w-with-use-warnings.patch \
            file://nomandate.patch \
+           file://0001-Ticket-4200-fix-FTBFS-with-ncurses-build-with-disabl.patch \
            "
 SRC_URI[sha256sum] = "2f52dd9c75c20d8eac7701bd3a8c6c125aaf8cdd9cf12b78ca50a0102b543407"
 
@@ -27,7 +28,9 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[smb] = "--enable-vfs-smb,--disable-vfs-smb,samba,"
 PACKAGECONFIG[sftp] = "--enable-vfs-sftp,--disable-vfs-sftp,libssh2,"
 
-CFLAGS:append:libc-musl = ' -DNCURSES_WIDECHAR=1 '
+# enable NCURSES_WIDECHAR=1 only if ENABLE_WIDEC has not been explicitly disabled (e.g. by the distro config).
+# When compiling against the ncurses library, NCURSES_WIDECHAR needs to explicitly set to 0 in this case.
+CFLAGS:append:libc-musl = "${@' -DNCURSES_WIDECHAR=1' if bb.utils.to_boolean((d.getVar('ENABLE_WIDEC') or 'True')) else ' -DNCURSES_WIDECHAR=0'}"
 EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x --disable-configure-args"
 EXTRANATIVEPATH += "file-native"
 
-- 
2.35.1


