Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 32D507F117
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 04:47:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Jul 2019 21:47:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,309,1559545200"; d="scan'208";a="172069554"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga007.fm.intel.com with ESMTP; 25 Jul 2019 21:47:37 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2019 12:47:24 +0800
Message-Id: <1564116449-69248-2-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564116449-69248-1-git-send-email-anuj.mittal@intel.com>
References: <1564116449-69248-1-git-send-email-anuj.mittal@intel.com>
Subject: [warrior][PATCH 2/7] vim: fix CVE-2019-12735
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
X-List-Received-Date: Fri, 26 Jul 2019 04:47:37 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-support/vim/files/CVE-2019-12735.patch | 64 ++++++++++++++++++++++
 meta/recipes-support/vim/vim_8.1.1017.bb           |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2019-12735.patch

diff --git a/meta/recipes-support/vim/files/CVE-2019-12735.patch b/meta/recipes-support/vim/files/CVE-2019-12735.patch
new file mode 100644
index 0000000..d8afa18
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2019-12735.patch
@@ -0,0 +1,64 @@
+From e8197acdd091881fdbf9ed6ca8318f3c96465f0a Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Wed, 22 May 2019 22:38:25 +0200
+Subject: [PATCH] patch 8.1.1365: source command doesn't check for the sandbox
+
+Problem:    Source command doesn't check for the sandbox. (Armin Razmjou)
+Solution:   Check for the sandbox when sourcing a file.
+
+Upstream-Status: Backport
+CVE: CVE-2019-12735
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ src/getchar.c               | 6 ++++++
+ src/testdir/test_source.vim | 9 +++++++++
+ src/version.c               | 2 ++
+ 3 files changed, 17 insertions(+)
+
+diff --git a/src/getchar.c b/src/getchar.c
+index 0e9942b..475f644 100644
+--- a/src/getchar.c
++++ b/src/getchar.c
+@@ -1407,6 +1407,12 @@ openscript(
+ 	emsg(_(e_nesting));
+ 	return;
+     }
++
++    // Disallow sourcing a file in the sandbox, the commands would be executed
++    // later, possibly outside of the sandbox.
++    if (check_secure())
++	return;
++
+ #ifdef FEAT_EVAL
+     if (ignore_script)
+ 	/* Not reading from script, also don't open one.  Warning message? */
+diff --git a/src/testdir/test_source.vim b/src/testdir/test_source.vim
+index a33d286..5166baf 100644
+--- a/src/testdir/test_source.vim
++++ b/src/testdir/test_source.vim
+@@ -36,3 +36,12 @@ func Test_source_cmd()
+   au! SourcePre
+   au! SourcePost
+ endfunc
++
++func Test_source_sandbox()
++  new
++  call writefile(["Ohello\<Esc>"], 'Xsourcehello')
++  source! Xsourcehello | echo
++  call assert_equal('hello', getline(1))
++  call assert_fails('sandbox source! Xsourcehello', 'E48:')
++  bwipe!
++endfunc
+diff --git a/src/version.c b/src/version.c
+index a49f6fb..e4f74be 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -780,6 +780,8 @@ static char *(features[]) =
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
+ /**/
++    1365,
++/**/
+     1017,
+ /**/
+     1016,
diff --git a/meta/recipes-support/vim/vim_8.1.1017.bb b/meta/recipes-support/vim/vim_8.1.1017.bb
index 7627d28..e161e12 100644
--- a/meta/recipes-support/vim/vim_8.1.1017.bb
+++ b/meta/recipes-support/vim/vim_8.1.1017.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://disable_acl_header_check.patch;patchdir=.. \
            file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
            file://0001-src-Makefile-improve-reproducibility.patch;patchdir=.. \
+           file://CVE-2019-12735.patch;patchdir=.. \
 "
 SRCREV = "493fbe4abee660d30b4f2aef87b754b0a720213c"
 
-- 
2.7.4


