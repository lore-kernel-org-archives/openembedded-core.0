Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DFC527843C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 07:15:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7H7F9Le008934
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 17 Aug 2017 00:15:10 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 17 Aug 2017 00:15:09 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 17 Aug 2017 03:15:07 -0400
Message-ID: <1502954107-9252-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] mc: unify curses initialization
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
X-List-Received-Date: Thu, 17 Aug 2017 07:15:11 -0000
Content-Type: text/plain

Since ncurses upgraded to 6.0+20170715, it compile failed
...
| ../../../mc-4.8.19/lib/tty/tty-ncurses.c:199:13: error: dereferencing
pointer to incomplete type 'TERMINAL {aka struct term}'
|      cur_term->Nttyb.c_cc[VINTR] = CTRL ('g');   /* ^g */
|              ^~
...

Backport a patch from upstream fixed the issue.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...3697-tty_init-unify-curses-initialization.patch | 66 ++++++++++++++++++++++
 meta/recipes-extended/mc/mc_4.8.19.bb              |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-extended/mc/files/0002-Ticket-3697-tty_init-unify-curses-initialization.patch

diff --git a/meta/recipes-extended/mc/files/0002-Ticket-3697-tty_init-unify-curses-initialization.patch b/meta/recipes-extended/mc/files/0002-Ticket-3697-tty_init-unify-curses-initialization.patch
new file mode 100644
index 0000000..c54d4d0
--- /dev/null
+++ b/meta/recipes-extended/mc/files/0002-Ticket-3697-tty_init-unify-curses-initialization.patch
@@ -0,0 +1,66 @@
+From 4d46a108629beb66a293672db7b44f863b6598ba Mon Sep 17 00:00:00 2001
+From: Thomas Dickey <dickey@his.com>
+Date: Fri, 14 Apr 2017 14:06:13 +0300
+Subject: [PATCH] Ticket #3697: (tty_init): unify curses initialization
+
+...for various curses implementations.
+
+Signed-off-by: Andrew Borodin <aborodin@vmail.ru>
+
+Upstream-Status: Backport [https://github.com/MidnightCommander/mc.git]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+---
+ lib/tty/tty-ncurses.c | 26 +++++++++-----------------
+ 1 file changed, 9 insertions(+), 17 deletions(-)
+
+diff --git a/lib/tty/tty-ncurses.c b/lib/tty/tty-ncurses.c
+index a7a11f3..8e69b39 100644
+--- a/lib/tty/tty-ncurses.c
++++ b/lib/tty/tty-ncurses.c
+@@ -179,6 +179,8 @@ mc_tty_normalize_lines_char (const char *ch)
+ void
+ tty_init (gboolean mouse_enable, gboolean is_xterm)
+ {
++    struct termios mode;
++
+     initscr ();
+ 
+ #ifdef HAVE_ESCDELAY
+@@ -194,25 +196,15 @@ tty_init (gboolean mouse_enable, gboolean is_xterm)
+     ESCDELAY = 200;
+ #endif /* HAVE_ESCDELAY */
+ 
+-#ifdef NCURSES_VERSION
++    tcgetattr (STDIN_FILENO, &mode);
+     /* use Ctrl-g to generate SIGINT */
+-    cur_term->Nttyb.c_cc[VINTR] = CTRL ('g');   /* ^g */
++    mode.c_cc[VINTR] = CTRL ('g');  /* ^g */
+     /* disable SIGQUIT to allow use Ctrl-\ key */
+-    cur_term->Nttyb.c_cc[VQUIT] = NULL_VALUE;
+-    tcsetattr (cur_term->Filedes, TCSANOW, &cur_term->Nttyb);
+-#else
+-    /* other curses implementation (bsd curses, ...) */
+-    {
+-        struct termios mode;
+-
+-        tcgetattr (STDIN_FILENO, &mode);
+-        /* use Ctrl-g to generate SIGINT */
+-        mode.c_cc[VINTR] = CTRL ('g');  /* ^g */
+-        /* disable SIGQUIT to allow use Ctrl-\ key */
+-        mode.c_cc[VQUIT] = NULL_VALUE;
+-        tcsetattr (STDIN_FILENO, TCSANOW, &mode);
+-    }
+-#endif /* NCURSES_VERSION */
++    mode.c_cc[VQUIT] = NULL_VALUE;
++    tcsetattr (STDIN_FILENO, TCSANOW, &mode);
++
++    /* curses remembers the "in-program" modes after this call */
++    def_prog_mode ();
+ 
+     tty_start_interrupt_key ();
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/mc/mc_4.8.19.bb b/meta/recipes-extended/mc/mc_4.8.19.bb
index 20ef9dd..b3a156c 100644
--- a/meta/recipes-extended/mc/mc_4.8.19.bb
+++ b/meta/recipes-extended/mc/mc_4.8.19.bb
@@ -8,6 +8,7 @@ RDEPENDS_${PN} = "ncurses-terminfo"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://0001-mc-replace-perl-w-with-use-warnings.patch \
+           file://0002-Ticket-3697-tty_init-unify-curses-initialization.patch \
            "
 SRC_URI[md5sum] = "ef423f5b6f80a1a5a5fc53b8324cab70"
 SRC_URI[sha256sum] = "d0dddfae7149fac903f74ef55cfcb2a198e0f7004346c7bded43669d61ba436f"
-- 
2.8.1


