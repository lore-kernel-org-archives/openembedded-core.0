Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B1DE271993
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 11:51:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Dec 2017 03:51:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,363,1508828400"; d="scan'208";a="13243027"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 05 Dec 2017 03:51:51 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id D7FB55802E2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 03:51:50 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 13:51:44 +0200
Message-Id: <1512474706-9286-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/3] mc: upgrade to 4.8.20
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Dec 2017 11:51:50 -0000

Remove backported patch:
        0002-Ticket-3697-tty_init-unify-curses-initialization.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...3697-tty_init-unify-curses-initialization.patch | 66 ----------------------
 .../mc/{mc_4.8.19.bb => mc_4.8.20.bb}              |  5 +-
 2 files changed, 2 insertions(+), 69 deletions(-)
 delete mode 100644 meta/recipes-extended/mc/files/0002-Ticket-3697-tty_init-unify-curses-initialization.patch
 rename meta/recipes-extended/mc/{mc_4.8.19.bb => mc_4.8.20.bb} (90%)

diff --git a/meta/recipes-extended/mc/files/0002-Ticket-3697-tty_init-unify-curses-initialization.patch b/meta/recipes-extended/mc/files/0002-Ticket-3697-tty_init-unify-curses-initialization.patch
deleted file mode 100644
index c54d4d0..0000000
--- a/meta/recipes-extended/mc/files/0002-Ticket-3697-tty_init-unify-curses-initialization.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 4d46a108629beb66a293672db7b44f863b6598ba Mon Sep 17 00:00:00 2001
-From: Thomas Dickey <dickey@his.com>
-Date: Fri, 14 Apr 2017 14:06:13 +0300
-Subject: [PATCH] Ticket #3697: (tty_init): unify curses initialization
-
-...for various curses implementations.
-
-Signed-off-by: Andrew Borodin <aborodin@vmail.ru>
-
-Upstream-Status: Backport [https://github.com/MidnightCommander/mc.git]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- lib/tty/tty-ncurses.c | 26 +++++++++-----------------
- 1 file changed, 9 insertions(+), 17 deletions(-)
-
-diff --git a/lib/tty/tty-ncurses.c b/lib/tty/tty-ncurses.c
-index a7a11f3..8e69b39 100644
---- a/lib/tty/tty-ncurses.c
-+++ b/lib/tty/tty-ncurses.c
-@@ -179,6 +179,8 @@ mc_tty_normalize_lines_char (const char *ch)
- void
- tty_init (gboolean mouse_enable, gboolean is_xterm)
- {
-+    struct termios mode;
-+
-     initscr ();
- 
- #ifdef HAVE_ESCDELAY
-@@ -194,25 +196,15 @@ tty_init (gboolean mouse_enable, gboolean is_xterm)
-     ESCDELAY = 200;
- #endif /* HAVE_ESCDELAY */
- 
--#ifdef NCURSES_VERSION
-+    tcgetattr (STDIN_FILENO, &mode);
-     /* use Ctrl-g to generate SIGINT */
--    cur_term->Nttyb.c_cc[VINTR] = CTRL ('g');   /* ^g */
-+    mode.c_cc[VINTR] = CTRL ('g');  /* ^g */
-     /* disable SIGQUIT to allow use Ctrl-\ key */
--    cur_term->Nttyb.c_cc[VQUIT] = NULL_VALUE;
--    tcsetattr (cur_term->Filedes, TCSANOW, &cur_term->Nttyb);
--#else
--    /* other curses implementation (bsd curses, ...) */
--    {
--        struct termios mode;
--
--        tcgetattr (STDIN_FILENO, &mode);
--        /* use Ctrl-g to generate SIGINT */
--        mode.c_cc[VINTR] = CTRL ('g');  /* ^g */
--        /* disable SIGQUIT to allow use Ctrl-\ key */
--        mode.c_cc[VQUIT] = NULL_VALUE;
--        tcsetattr (STDIN_FILENO, TCSANOW, &mode);
--    }
--#endif /* NCURSES_VERSION */
-+    mode.c_cc[VQUIT] = NULL_VALUE;
-+    tcsetattr (STDIN_FILENO, TCSANOW, &mode);
-+
-+    /* curses remembers the "in-program" modes after this call */
-+    def_prog_mode ();
- 
-     tty_start_interrupt_key ();
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/mc/mc_4.8.19.bb b/meta/recipes-extended/mc/mc_4.8.20.bb
similarity index 90%
rename from meta/recipes-extended/mc/mc_4.8.19.bb
rename to meta/recipes-extended/mc/mc_4.8.20.bb
index b3a156c..70d1b5e 100644
--- a/meta/recipes-extended/mc/mc_4.8.19.bb
+++ b/meta/recipes-extended/mc/mc_4.8.20.bb
@@ -8,10 +8,9 @@ RDEPENDS_${PN} = "ncurses-terminfo"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://0001-mc-replace-perl-w-with-use-warnings.patch \
-           file://0002-Ticket-3697-tty_init-unify-curses-initialization.patch \
            "
-SRC_URI[md5sum] = "ef423f5b6f80a1a5a5fc53b8324cab70"
-SRC_URI[sha256sum] = "d0dddfae7149fac903f74ef55cfcb2a198e0f7004346c7bded43669d61ba436f"
+SRC_URI[md5sum] = "dcfc7aa613c62291a0f71f6b698d8267"
+SRC_URI[sha256sum] = "2d85daaa6ab26e524946df4823ac2f69802bc16bc967781b5e28d5b86fc3b979"
 
 inherit autotools gettext pkgconfig
 
-- 
2.4.0


