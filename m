Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 701096F898
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 07:52:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s337qRYo003071
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Apr 2014 00:52:27 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Thu, 3 Apr 2014 00:52:26 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Apr 2014 15:52:22 +0800
Message-ID: <15a4e980f4a7b47e36800c3cedbe44071d63bf20.1396511450.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1396511450.git.Chong.Lu@windriver.com>
References: <cover.1396511450.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] python: fix build error with Readline 6.3
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
X-List-Received-Date: Thu, 03 Apr 2014 07:52:26 -0000
Content-Type: text/plain

Backport two patches from upstream:

use new readline function types (closes #20374)
Issue #20374: Avoid compiler warnings when compiling readline with libedit.

[YOCTO #6107]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../recipes-devtools/python/python-native_2.7.3.bb |  1 +
 .../python-fix-build-error-with-Readline-6.3.patch | 62 ++++++++++++++++++++++
 .../python/python3-native_3.3.3.bb                 |  1 +
 ...python3-fix-build-error-with-Readline-6.3.patch | 62 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.3.3.bb      |  1 +
 meta/recipes-devtools/python/python_2.7.3.bb       |  1 +
 6 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/python-fix-build-error-with-Readline-6.3.patch
 create mode 100644 meta/recipes-devtools/python/python3/python3-fix-build-error-with-Readline-6.3.patch

diff --git a/meta/recipes-devtools/python/python-native_2.7.3.bb b/meta/recipes-devtools/python/python-native_2.7.3.bb
index 6b87a16..0c66d27 100644
--- a/meta/recipes-devtools/python/python-native_2.7.3.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.3.bb
@@ -17,6 +17,7 @@ SRC_URI += "\
            file://add-md5module-support.patch \
            file://builddir.patch \
            file://parallel-makeinst-create-bindir.patch \
+           file://python-fix-build-error-with-Readline-6.3.patch \
            "
 S = "${WORKDIR}/Python-${PV}"
 
diff --git a/meta/recipes-devtools/python/python/python-fix-build-error-with-Readline-6.3.patch b/meta/recipes-devtools/python/python/python-fix-build-error-with-Readline-6.3.patch
new file mode 100644
index 0000000..b84f8c3
--- /dev/null
+++ b/meta/recipes-devtools/python/python/python-fix-build-error-with-Readline-6.3.patch
@@ -0,0 +1,62 @@
+python: fix build error with Readline 6.3
+
+Backport two patches from upstream:
+
+use new readline function types (closes #20374)
+Issue #20374: Avoid compiler warnings when compiling readline with libedit.
+
+Upstream-Status: Backport
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ Modules/readline.c |   15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/Modules/readline.c b/Modules/readline.c
+index b5e258d..d3f52aa 100644
+--- a/Modules/readline.c
++++ b/Modules/readline.c
+@@ -735,15 +735,24 @@ on_hook(PyObject *func)
+     return result;
+ }
+ 
++
+ static int
++#if defined(_RL_FUNCTION_TYPEDEF)
+ on_startup_hook(void)
++#else
++on_startup_hook()
++#endif
+ {
+     return on_hook(startup_hook);
+ }
+ 
+ #ifdef HAVE_RL_PRE_INPUT_HOOK
+ static int
++#if defined(_RL_FUNCTION_TYPEDEF)
+ on_pre_input_hook(void)
++#else
++on_pre_input_hook()
++#endif
+ {
+     return on_hook(pre_input_hook);
+ }
+@@ -886,12 +895,12 @@ setup_readline(void)
+     rl_bind_key_in_map ('\t', rl_complete, emacs_meta_keymap);
+     rl_bind_key_in_map ('\033', rl_complete, emacs_meta_keymap);
+     /* Set our hook functions */
+-    rl_startup_hook = (Function *)on_startup_hook;
++    rl_startup_hook = (rl_hook_func_t *)on_startup_hook;
+ #ifdef HAVE_RL_PRE_INPUT_HOOK
+-    rl_pre_input_hook = (Function *)on_pre_input_hook;
++    rl_pre_input_hook = (rl_hook_func_t *)on_pre_input_hook;
+ #endif
+     /* Set our completion function */
+-    rl_attempted_completion_function = (CPPFunction *)flex_complete;
++    rl_attempted_completion_function = (rl_completion_func_t *)flex_complete;
+     /* Set Python word break characters */
+     rl_completer_word_break_characters =
+         strdup(" \t\n`~!@#$%^&*()-=+[{]}\\|;:'\",<>/?");
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/python/python3-native_3.3.3.bb b/meta/recipes-devtools/python/python3-native_3.3.3.bb
index df8f28b..7238eaf 100644
--- a/meta/recipes-devtools/python/python3-native_3.3.3.bb
+++ b/meta/recipes-devtools/python/python3-native_3.3.3.bb
@@ -25,6 +25,7 @@ file://unixccompiler.patch \
 file://fix-ast.h-dependency.patch \
 file://makerace.patch \
 ${DISTRO_SRC_URI} \
+file://python3-fix-build-error-with-Readline-6.3.patch \
 "
 SRC_URI[md5sum] = "f3ebe34d4d8695bf889279b54673e10c"
 SRC_URI[sha256sum] = "e526e9b612f623888364d30cc9f3dfc34dcef39065c713bdbcddf47df84d8dcb"
diff --git a/meta/recipes-devtools/python/python3/python3-fix-build-error-with-Readline-6.3.patch b/meta/recipes-devtools/python/python3/python3-fix-build-error-with-Readline-6.3.patch
new file mode 100644
index 0000000..44e2b7e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/python3-fix-build-error-with-Readline-6.3.patch
@@ -0,0 +1,62 @@
+python3: fix build error with Readline 6.3
+
+Backport two patches from upstream:
+
+use new readline function types (closes #20374)
+Issue #20374: Avoid compiler warnings when compiling readline with libedit.
+
+Upstream-Status: Backport
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ Modules/readline.c |   15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/Modules/readline.c b/Modules/readline.c
+index 096c6d1..1646ef8 100644
+--- a/Modules/readline.c
++++ b/Modules/readline.c
+@@ -773,15 +773,24 @@ on_hook(PyObject *func)
+     return result;
+ }
+ 
++
+ static int
++#if defined(_RL_FUNCTION_TYPEDEF)
+ on_startup_hook(void)
++#else
++on_startup_hook()
++#endif
+ {
+     return on_hook(startup_hook);
+ }
+ 
+ #ifdef HAVE_RL_PRE_INPUT_HOOK
+ static int
++#if defined(_RL_FUNCTION_TYPEDEF)
+ on_pre_input_hook(void)
++#else
++on_pre_input_hook()
++#endif
+ {
+     return on_hook(pre_input_hook);
+ }
+@@ -936,12 +945,12 @@ setup_readline(void)
+     rl_bind_key_in_map ('\t', rl_complete, emacs_meta_keymap);
+     rl_bind_key_in_map ('\033', rl_complete, emacs_meta_keymap);
+     /* Set our hook functions */
+-    rl_startup_hook = (Function *)on_startup_hook;
++    rl_startup_hook = (rl_hook_func_t *)on_startup_hook;
+ #ifdef HAVE_RL_PRE_INPUT_HOOK
+-    rl_pre_input_hook = (Function *)on_pre_input_hook;
++    rl_pre_input_hook = (rl_hook_func_t *)on_pre_input_hook;
+ #endif
+     /* Set our completion function */
+-    rl_attempted_completion_function = (CPPFunction *)flex_complete;
++    rl_attempted_completion_function = (rl_completion_func_t *)flex_complete;
+     /* Set Python word break characters */
+     completer_word_break_characters =
+         rl_completer_word_break_characters =
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/python/python3_3.3.3.bb b/meta/recipes-devtools/python/python3_3.3.3.bb
index b6f6def..c357bbb 100644
--- a/meta/recipes-devtools/python/python3_3.3.3.bb
+++ b/meta/recipes-devtools/python/python3_3.3.3.bb
@@ -20,6 +20,7 @@ file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
 file://fix-ast.h-dependency.patch \
 file://makerace.patch \
 ${DISTRO_SRC_URI} \
+file://python3-fix-build-error-with-Readline-6.3.patch \
 "
 
 SRC_URI += "\
diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index aaa72e5..c7bb9b4 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -34,6 +34,7 @@ SRC_URI += "\
   file://pypirc-secure.patch \
   file://parallel-makeinst-create-bindir.patch \
   file://python-2.7.3-CVE-2013-1752-smtplib-fix.patch \
+  file://python-fix-build-error-with-Readline-6.3.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.8.1.2


