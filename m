Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A3793718F0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Oct 2014 20:31:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Oct 2014 13:31:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,705,1406617200"; d="scan'208";a="604214973"
Received: from ohreyal-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.245])
	by fmsmga001.fm.intel.com with ESMTP; 12 Oct 2014 13:31:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Oct 2014 21:31:28 +0100
Message-Id: <998cd2c6dd3709ae0d47c845dff227680bda96f5.1413145831.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1413145831.git.paul.eggleton@linux.intel.com>
References: <cover.1413145831.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1413145831.git.paul.eggleton@linux.intel.com>
References: <cover.1413145831.git.paul.eggleton@linux.intel.com>
Subject: [dylan][PATCH 3/6] bash: Fix for exported function namespace change
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
X-List-Received-Date: Sun, 12 Oct 2014 20:31:54 -0000

From: Catalin Popeanga <Catalin.Popeanga@enea.com>

This is a followup patch to incomplete CVE-2014-6271 fix code execution via
specially-crafted environment

This patch changes the encoding bash uses for exported functions to avoid
clashes with shell variables and to avoid depending only on an environment
variable's contents to determine whether or not to interpret it as a shell
function.

(From OE-Core daisy rev: 6c51cc96d03df26d1c10867633e7a10dfbec7c45)

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 ...r-bash-exported-function-namespace-change.patch | 158 +++++++++++++++
 ...r-bash-exported-function-namespace-change.patch | 212 +++++++++++++++++++++
 meta/recipes-extended/bash/bash_3.2.48.bb          |   1 +
 meta/recipes-extended/bash/bash_4.2.bb             |   1 +
 4 files changed, 372 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/Fix-for-bash-exported-function-namespace-change.patch
 create mode 100644 meta/recipes-extended/bash/bash-4.2/Fix-for-bash-exported-function-namespace-change.patch

diff --git a/meta/recipes-extended/bash/bash-3.2.48/Fix-for-bash-exported-function-namespace-change.patch b/meta/recipes-extended/bash/bash-3.2.48/Fix-for-bash-exported-function-namespace-change.patch
new file mode 100644
index 0000000..c087016
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-3.2.48/Fix-for-bash-exported-function-namespace-change.patch
@@ -0,0 +1,158 @@
+Fix for exported function namespace change
+
+Upstream-Status: Backport
+
+Downloaded from: http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-054
+
+Author: Chet Ramey <chet.ramey@case.edu>
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release: 3.2
+Patch-ID: bash32-054
+
+Bug-Reported-by:	Florian Weimer <fweimer@redhat.com>
+Bug-Reference-ID:
+Bug-Reference-URL:
+
+Bug-Description:
+
+This patch changes the encoding bash uses for exported functions to avoid
+clashes with shell variables and to avoid depending only on an environment
+variable's contents to determine whether or not to interpret it as a shell
+function.
+---
+--- a/variables.c	2014-09-16 19:10:39.000000000 -0400
++++ b/variables.c	2014-09-27 21:02:08.000000000 -0400
+@@ -75,4 +75,9 @@
+ #define ifsname(s)	((s)[0] == 'I' && (s)[1] == 'F' && (s)[2] == 'S' && (s)[3] == '\0')
+ 
++#define BASHFUNC_PREFIX		"BASH_FUNC_"
++#define BASHFUNC_PREFLEN	10	/* == strlen(BASHFUNC_PREFIX */
++#define BASHFUNC_SUFFIX		"%%"
++#define BASHFUNC_SUFFLEN	2	/* == strlen(BASHFUNC_SUFFIX) */
++
+ extern char **environ;
+ 
+@@ -242,5 +247,5 @@
+ static void dispose_temporary_env __P((sh_free_func_t *));
+ 
+-static inline char *mk_env_string __P((const char *, const char *));
++static inline char *mk_env_string __P((const char *, const char *, int));
+ static char **make_env_array_from_var_list __P((SHELL_VAR **));
+ static char **make_var_export_array __P((VAR_CONTEXT *));
+@@ -310,19 +315,30 @@
+       /* If exported function, define it now.  Don't import functions from
+ 	 the environment in privileged mode. */
+-      if (privmode == 0 && read_but_dont_execute == 0 && STREQN ("() {", string, 4))
++      if (privmode == 0 && read_but_dont_execute == 0 &&
++	  STREQN (BASHFUNC_PREFIX, name, BASHFUNC_PREFLEN) &&
++	  STREQ (BASHFUNC_SUFFIX, name + char_index - BASHFUNC_SUFFLEN) &&
++	  STREQN ("() {", string, 4))
+ 	{
++	  size_t namelen;
++	  char *tname;		/* desired imported function name */
++
++	  namelen = char_index - BASHFUNC_PREFLEN - BASHFUNC_SUFFLEN;
++
++	  tname = name + BASHFUNC_PREFLEN;	/* start of func name */
++	  tname[namelen] = '\0';		/* now tname == func name */
++
+ 	  string_length = strlen (string);
+-	  temp_string = (char *)xmalloc (3 + string_length + char_index);
++	  temp_string = (char *)xmalloc (namelen + string_length + 2);
+ 
+-	  strcpy (temp_string, name);
+-	  temp_string[char_index] = ' ';
+-	  strcpy (temp_string + char_index + 1, string);
++	  memcpy (temp_string, tname, namelen);
++	  temp_string[namelen] = ' ';
++	  memcpy (temp_string + namelen + 1, string, string_length + 1);
+ 
+ 	  /* Don't import function names that are invalid identifiers from the
+ 	     environment. */
+-	  if (legal_identifier (name))
+-	    parse_and_execute (temp_string, name, SEVAL_NONINT|SEVAL_NOHIST|SEVAL_FUNCDEF|SEVAL_ONECMD);
++	  if (absolute_program (tname) == 0 && (posixly_correct == 0 || legal_identifier (tname)))
++	    parse_and_execute (temp_string, tname, SEVAL_NONINT|SEVAL_NOHIST|SEVAL_FUNCDEF|SEVAL_ONECMD);
+ 
+-	  if (temp_var = find_function (name))
++	  if (temp_var = find_function (tname))
+ 	    {
+ 	      VSETATTR (temp_var, (att_exported|att_imported));
+@@ -330,5 +346,8 @@
+ 	    }
+ 	  else
+-	    report_error (_("error importing function definition for `%s'"), name);
++	    report_error (_("error importing function definition for `%s'"), tname);
++
++	  /* Restore original suffix */
++	  tname[namelen] = BASHFUNC_SUFFIX[0];
+ 	}
+ #if defined (ARRAY_VARS)
+@@ -2208,5 +2227,5 @@
+ 
+   INVALIDATE_EXPORTSTR (var);
+-  var->exportstr = mk_env_string (name, value);
++  var->exportstr = mk_env_string (name, value, 0);
+ 
+   array_needs_making = 1;
+@@ -2999,19 +3018,40 @@
+ 
+ static inline char *
+-mk_env_string (name, value)
++mk_env_string (name, value, isfunc)
+      const char *name, *value;
++     int isfunc;
+ {
+-  int name_len, value_len;
+-  char	*p;
++  size_t name_len, value_len;
++  char	*p, *q;
+ 
+   name_len = strlen (name);
+   value_len = STRLEN (value);
+-  p = (char *)xmalloc (2 + name_len + value_len);
+-  strcpy (p, name);
+-  p[name_len] = '=';
++
++  /* If we are exporting a shell function, construct the encoded function
++     name. */
++  if (isfunc && value)
++    {
++      p = (char *)xmalloc (BASHFUNC_PREFLEN + name_len + BASHFUNC_SUFFLEN + value_len + 2);
++      q = p;
++      memcpy (q, BASHFUNC_PREFIX, BASHFUNC_PREFLEN);
++      q += BASHFUNC_PREFLEN;
++      memcpy (q, name, name_len);
++      q += name_len;
++      memcpy (q, BASHFUNC_SUFFIX, BASHFUNC_SUFFLEN);
++      q += BASHFUNC_SUFFLEN;
++    }
++  else
++    {
++      p = (char *)xmalloc (2 + name_len + value_len);
++      memcpy (p, name, name_len);
++      q = p + name_len;
++    }
++
++  q[0] = '=';
+   if (value && *value)
+-    strcpy (p + name_len + 1, value);
++    memcpy (q + 1, value, value_len + 1);
+   else
+-    p[name_len + 1] = '\0';
++    q[1] = '\0';
++
+   return (p);
+ }
+@@ -3088,5 +3128,5 @@
+ 	     using the cached exportstr... */
+ 	  list[list_index] = USE_EXPORTSTR ? savestring (value)
+-					   : mk_env_string (var->name, value);
++					   : mk_env_string (var->name, value, function_p (var));
+ 
+ 	  if (USE_EXPORTSTR == 0)
diff --git a/meta/recipes-extended/bash/bash-4.2/Fix-for-bash-exported-function-namespace-change.patch b/meta/recipes-extended/bash/bash-4.2/Fix-for-bash-exported-function-namespace-change.patch
new file mode 100644
index 0000000..0fb2ad5
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-4.2/Fix-for-bash-exported-function-namespace-change.patch
@@ -0,0 +1,212 @@
+Fix for exported function namespace change
+
+Upstream-Status: Backport
+
+Downloaded from: http://ftp.gnu.org/gnu/bash/bash-4.2-patches/bash42-050
+
+Author: Chet Ramey <chet.ramey@case.edu>
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-050
+
+Bug-Reported-by:	Florian Weimer <fweimer@redhat.com>
+Bug-Reference-ID:
+Bug-Reference-URL:
+
+Bug-Description:
+
+This patch changes the encoding bash uses for exported functions to avoid
+clashes with shell variables and to avoid depending only on an environment
+variable's contents to determine whether or not to interpret it as a shell
+function.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2.49/variables.c	2014-09-16 19:35:45.000000000 -0400
+--- variables.c	2014-09-27 20:54:00.000000000 -0400
+***************
+*** 80,83 ****
+--- 80,88 ----
+  #define ifsname(s)	((s)[0] == 'I' && (s)[1] == 'F' && (s)[2] == 'S' && (s)[3] == '\0')
+  
++ #define BASHFUNC_PREFIX		"BASH_FUNC_"
++ #define BASHFUNC_PREFLEN	10	/* == strlen(BASHFUNC_PREFIX */
++ #define BASHFUNC_SUFFIX		"%%"
++ #define BASHFUNC_SUFFLEN	2	/* == strlen(BASHFUNC_SUFFIX) */
++ 
+  extern char **environ;
+  
+***************
+*** 269,273 ****
+  static void dispose_temporary_env __P((sh_free_func_t *));     
+  
+! static inline char *mk_env_string __P((const char *, const char *));
+  static char **make_env_array_from_var_list __P((SHELL_VAR **));
+  static char **make_var_export_array __P((VAR_CONTEXT *));
+--- 274,278 ----
+  static void dispose_temporary_env __P((sh_free_func_t *));     
+  
+! static inline char *mk_env_string __P((const char *, const char *, int));
+  static char **make_env_array_from_var_list __P((SHELL_VAR **));
+  static char **make_var_export_array __P((VAR_CONTEXT *));
+***************
+*** 339,357 ****
+        /* If exported function, define it now.  Don't import functions from
+  	 the environment in privileged mode. */
+!       if (privmode == 0 && read_but_dont_execute == 0 && STREQN ("() {", string, 4))
+  	{
+  	  string_length = strlen (string);
+! 	  temp_string = (char *)xmalloc (3 + string_length + char_index);
+  
+! 	  strcpy (temp_string, name);
+! 	  temp_string[char_index] = ' ';
+! 	  strcpy (temp_string + char_index + 1, string);
+  
+  	  /* Don't import function names that are invalid identifiers from the
+  	     environment. */
+! 	  if (legal_identifier (name))
+! 	    parse_and_execute (temp_string, name, SEVAL_NONINT|SEVAL_NOHIST|SEVAL_FUNCDEF|SEVAL_ONECMD);
+  
+! 	  if (temp_var = find_function (name))
+  	    {
+  	      VSETATTR (temp_var, (att_exported|att_imported));
+--- 344,373 ----
+        /* If exported function, define it now.  Don't import functions from
+  	 the environment in privileged mode. */
+!       if (privmode == 0 && read_but_dont_execute == 0 &&
+! 	  STREQN (BASHFUNC_PREFIX, name, BASHFUNC_PREFLEN) &&
+! 	  STREQ (BASHFUNC_SUFFIX, name + char_index - BASHFUNC_SUFFLEN) &&
+! 	  STREQN ("() {", string, 4))
+  	{
++ 	  size_t namelen;
++ 	  char *tname;		/* desired imported function name */
++ 
++ 	  namelen = char_index - BASHFUNC_PREFLEN - BASHFUNC_SUFFLEN;
++ 
++ 	  tname = name + BASHFUNC_PREFLEN;	/* start of func name */
++ 	  tname[namelen] = '\0';		/* now tname == func name */
++ 
+  	  string_length = strlen (string);
+! 	  temp_string = (char *)xmalloc (namelen + string_length + 2);
+  
+! 	  memcpy (temp_string, tname, namelen);
+! 	  temp_string[namelen] = ' ';
+! 	  memcpy (temp_string + namelen + 1, string, string_length + 1);
+  
+  	  /* Don't import function names that are invalid identifiers from the
+  	     environment. */
+! 	  if (absolute_program (tname) == 0 && (posixly_correct == 0 || legal_identifier (tname)))
+! 	    parse_and_execute (temp_string, tname, SEVAL_NONINT|SEVAL_NOHIST|SEVAL_FUNCDEF|SEVAL_ONECMD);
+  
+! 	  if (temp_var = find_function (tname))
+  	    {
+  	      VSETATTR (temp_var, (att_exported|att_imported));
+***************
+*** 359,363 ****
+  	    }
+  	  else
+! 	    report_error (_("error importing function definition for `%s'"), name);
+  	}
+  #if defined (ARRAY_VARS)
+--- 375,382 ----
+  	    }
+  	  else
+! 	    report_error (_("error importing function definition for `%s'"), tname);
+! 
+! 	  /* Restore original suffix */
+! 	  tname[namelen] = BASHFUNC_SUFFIX[0];
+  	}
+  #if defined (ARRAY_VARS)
+***************
+*** 2538,2542 ****
+  
+    INVALIDATE_EXPORTSTR (var);
+!   var->exportstr = mk_env_string (name, value);
+  
+    array_needs_making = 1;
+--- 2557,2561 ----
+  
+    INVALIDATE_EXPORTSTR (var);
+!   var->exportstr = mk_env_string (name, value, 0);
+  
+    array_needs_making = 1;
+***************
+*** 3390,3408 ****
+  
+  static inline char *
+! mk_env_string (name, value)
+       const char *name, *value;
+  {
+!   int name_len, value_len;
+!   char	*p;
+  
+    name_len = strlen (name);
+    value_len = STRLEN (value);
+!   p = (char *)xmalloc (2 + name_len + value_len);
+!   strcpy (p, name);
+!   p[name_len] = '=';
+    if (value && *value)
+!     strcpy (p + name_len + 1, value);
+    else
+!     p[name_len + 1] = '\0';
+    return (p);
+  }
+--- 3409,3448 ----
+  
+  static inline char *
+! mk_env_string (name, value, isfunc)
+       const char *name, *value;
++      int isfunc;
+  {
+!   size_t name_len, value_len;
+!   char	*p, *q;
+  
+    name_len = strlen (name);
+    value_len = STRLEN (value);
+! 
+!   /* If we are exporting a shell function, construct the encoded function
+!      name. */
+!   if (isfunc && value)
+!     {
+!       p = (char *)xmalloc (BASHFUNC_PREFLEN + name_len + BASHFUNC_SUFFLEN + value_len + 2);
+!       q = p;
+!       memcpy (q, BASHFUNC_PREFIX, BASHFUNC_PREFLEN);
+!       q += BASHFUNC_PREFLEN;
+!       memcpy (q, name, name_len);
+!       q += name_len;
+!       memcpy (q, BASHFUNC_SUFFIX, BASHFUNC_SUFFLEN);
+!       q += BASHFUNC_SUFFLEN;
+!     }
+!   else
+!     {
+!       p = (char *)xmalloc (2 + name_len + value_len);
+!       memcpy (p, name, name_len);
+!       q = p + name_len;
+!     }
+! 
+!   q[0] = '=';
+    if (value && *value)
+!     memcpy (q + 1, value, value_len + 1);
+    else
+!     q[1] = '\0';
+! 
+    return (p);
+  }
+***************
+*** 3490,3494 ****
+  	     using the cached exportstr... */
+  	  list[list_index] = USE_EXPORTSTR ? savestring (value)
+! 					   : mk_env_string (var->name, value);
+  
+  	  if (USE_EXPORTSTR == 0)
+--- 3530,3534 ----
+  	     using the cached exportstr... */
+  	  list[list_index] = USE_EXPORTSTR ? savestring (value)
+! 					   : mk_env_string (var->name, value, function_p (var));
+  
+  	  if (USE_EXPORTSTR == 0)
diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index 8362c27..1e6e3f3 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -12,6 +12,7 @@ SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
            file://mkbuiltins_have_stringize.patch \
            file://cve-2014-6271.patch;striplevel=0 \
            file://cve-2014-7169.patch \
+           file://Fix-for-bash-exported-function-namespace-change.patch \
           "
 
 SRC_URI[tarball.md5sum] = "338dcf975a93640bb3eaa843ca42e3f8"
diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended/bash/bash_4.2.bb
index 67b1924..515bdc9 100644
--- a/meta/recipes-extended/bash/bash_4.2.bb
+++ b/meta/recipes-extended/bash/bash_4.2.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            file://cve-2014-7169.patch \
            file://build-tests.patch \
            file://test-output.patch \
+           file://Fix-for-bash-exported-function-namespace-change.patch;striplevel=0 \
            file://run-ptest \
            "
 
-- 
1.9.3


