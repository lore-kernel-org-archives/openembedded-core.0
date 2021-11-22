X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Anuj Mittal" <anuj.mittal@intel.com>
Subject: [hardknott][PATCH 12/16] vim: fix CVE-2021-3872 and CVE-2021-3903
Date: Mon, 22 Nov 2021 10:20:16 +0800
Message-Id: <baa351293ed036e63d0e3253f58ad4f2e448852c.1637546583.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1637546583.git.anuj.mittal@intel.com>
References: <cover.1637546583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Mingli Yu <mingli.yu@windriver.com>

Backport 2 patches to fix below CVEs:
 - CVE-2021-3872
 - CVE-2021-3903

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../vim/files/CVE-2021-3872.patch             | 57 +++++++++++++++++++
 .../vim/files/CVE-2021-3903.patch             | 38 +++++++++++++
 meta/recipes-support/vim/vim.inc              |  2 +
 3 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-3872.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-3903.patch

diff --git a/meta/recipes-support/vim/files/CVE-2021-3872.patch b/meta/recipes-support/vim/files/CVE-2021-3872.patch
new file mode 100644
index 0000000000..f0f30933fa
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2021-3872.patch
@@ -0,0 +1,57 @@
+From 132d060ffbb9651f0d79bd0b6d80cab460235a99 Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Fri, 12 Nov 2021 02:56:51 +0000
+Subject: [PATCH] patch 8.2.3487: illegal memory access if buffer name is very
+ long
+
+Problem:    Illegal memory access if buffer name is very long.
+Solution:   Make sure not to go over the end of the buffer.
+
+CVE: CVE-2021-3872
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/826bfe4bbd7594188e3d74d2539d9707b1c6a14b]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/drawscreen.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/drawscreen.c b/src/drawscreen.c
+index 3a88ee979..9acb70552 100644
+--- a/src/drawscreen.c
++++ b/src/drawscreen.c
+@@ -446,13 +446,13 @@ win_redr_status(win_T *wp, int ignore_pum UNUSED)
+ 	    *(p + len++) = ' ';
+ 	if (bt_help(wp->w_buffer))
+ 	{
+-	    STRCPY(p + len, _("[Help]"));
++	    vim_snprintf((char *)p + len, MAXPATHL - len, "%s", _("[Help]"));
+ 	    len += (int)STRLEN(p + len);
+ 	}
+ #ifdef FEAT_QUICKFIX
+ 	if (wp->w_p_pvw)
+ 	{
+-	    STRCPY(p + len, _("[Preview]"));
++	    vim_snprintf((char *)p + len, MAXPATHL - len, "%s", _("[Preview]"));
+ 	    len += (int)STRLEN(p + len);
+ 	}
+ #endif
+@@ -462,12 +462,12 @@ win_redr_status(win_T *wp, int ignore_pum UNUSED)
+ #endif
+ 		)
+ 	{
+-	    STRCPY(p + len, "[+]");
+-	    len += 3;
++	    vim_snprintf((char *)p + len, MAXPATHL - len, "%s", "[+]");
++	    len += (int)STRLEN(p + len);
+ 	}
+ 	if (wp->w_buffer->b_p_ro)
+ 	{
+-	    STRCPY(p + len, _("[RO]"));
++	    vim_snprintf((char *)p + len, MAXPATHL - len, "%s", _("[RO]"));
+ 	    len += (int)STRLEN(p + len);
+ 	}
+ 
+-- 
+2.31.1
+
diff --git a/meta/recipes-support/vim/files/CVE-2021-3903.patch b/meta/recipes-support/vim/files/CVE-2021-3903.patch
new file mode 100644
index 0000000000..fb45857de8
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2021-3903.patch
@@ -0,0 +1,38 @@
+From a366598006f4d7bf9b4fbcd334a2e5078dcb6ad8 Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Fri, 12 Nov 2021 02:23:38 +0000
+Subject: [PATCH] =?UTF-8?q?patch=208.2.3564:=20invalid=20memory=20access?=
+ =?UTF-8?q?=20when=20scrolling=20without=20valid=20sc=E2=80=A6?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+…reen
+
+Problem:    Invalid memory access when scrolling without a valid screen.
+Solution:   Do not set VALID_BOTLINE in w_valid.
+
+CVE: CVE-2021-3903
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/777e7c21b7627be80961848ac560cb0a9978ff43]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/move.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/move.c b/src/move.c
+index 8e53d8bcb..10165ef4d 100644
+--- a/src/move.c
++++ b/src/move.c
+@@ -198,7 +198,6 @@ update_topline(void)
+     {
+ 	curwin->w_topline = curwin->w_cursor.lnum;
+ 	curwin->w_botline = curwin->w_topline;
+-	curwin->w_valid |= VALID_BOTLINE|VALID_BOTLINE_AP;
+ 	curwin->w_scbind_pos = 1;
+ 	return;
+     }
+-- 
+2.31.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index db4741ba4f..1841498b74 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,6 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2021-3778.patch \
            file://CVE-2021-3796.patch \
            file://b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch \
+           file://CVE-2021-3903.patch \
+           file://CVE-2021-3872.patch \
 "
 
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
-- 
2.33.1

