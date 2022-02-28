Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C23CCC433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:01:26 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.19879.1646056878394925946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:01:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=YpFlvHEE;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056886; x=1677592886;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=jxNOa7ZrCQSaqKjx5etPzpAP0CAQj6UyKQmVzPiUvXw=;
  b=YpFlvHEEmZU8h1jE+Pkd07f7BjDcB0mSpB8ZH5yr0tWqp3gKcwUMXKj/
   JNOWJ6AOX53TlNw7nlOKZyTlhshfJIShKbR0+6zoMopiSl53RQtkRW/Ti
   U5oQ1K1i8PwRVxmaF0FvDSb/zq4p9X6EY9FmWLT+XlHZQEAGF5KnqI5OV
   ppkHIrX9abt8p+uk2OS7eDiVsHV10gxS1AUYIKbGHkdNske35bsQhunU8
   SnkkhvbMrzKukMWnaRUiqyTI6Voh2LIO/YYFDSN7WKkSqU84Cluq/TdMp
   r2+ZwKquXeU29mNVRYLL2lBsXIktrcyZ78WqtmEjOMuduDEdH5U1hn58/
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857327"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857327"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:22 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092687"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:20 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 28/39] mc: fix build if ncurses have been
 configured without wide characters
Date: Mon, 28 Feb 2022 22:00:18 +0800
Message-Id: 
 <1d9dbc540a23a77f6ddfbdf34a81a639f2ff82f5.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:01:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162484

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
 meta/recipes-extended/mc/mc_4.8.26.bb         |  5 +-
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
diff --git a/meta/recipes-extended/mc/mc_4.8.26.bb b/meta/recipes-extended/mc/mc_4.8.26.bb
index 6bc7e6e8e1..906778400e 100644
--- a/meta/recipes-extended/mc/mc_4.8.26.bb
+++ b/meta/recipes-extended/mc/mc_4.8.26.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://0001-mc-replace-perl-w-with-use-warnings.patch \
            file://nomandate.patch \
            file://CVE-2021-36370.patch \
+           file://0001-Ticket-4200-fix-FTBFS-with-ncurses-build-with-disabl.patch \
            "
 SRC_URI[sha256sum] = "9d6358d0a351a455a1410aab57f33b6b48b0fcf31344b9a10b0ff497595979d1"
 
@@ -24,7 +25,9 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[smb] = "--enable-vfs-smb,--disable-vfs-smb,samba,"
 PACKAGECONFIG[sftp] = "--enable-vfs-sftp,--disable-vfs-sftp,libssh2,"
 
-CFLAGS_append_libc-musl = ' -DNCURSES_WIDECHAR=1 '
+# enable NCURSES_WIDECHAR=1 only if ENABLE_WIDEC has not been explicitly disabled (e.g. by the distro config).
+# When compiling against the ncurses library, NCURSES_WIDECHAR needs to explicitly set to 0 in this case.
+CFLAGS_append_libc-musl = "${@' -DNCURSES_WIDECHAR=1' if bb.utils.to_boolean((d.getVar('ENABLE_WIDEC') or 'True')) else ' -DNCURSES_WIDECHAR=0'}"
 EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x --disable-configure-args"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
-- 
2.35.1


