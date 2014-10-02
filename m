Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 4FAAE71759
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 14:28:46 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1; Thu, 2 Oct 2014
	16:28:46 +0200
Received: by sestofb10.enea.se (Postfix, from userid 2671)	id 34BA3288D4E;
	Thu,  2 Oct 2014 16:28:46 +0200 (CEST)
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Oct 2014 16:28:43 +0200
Message-ID: <1412260123-56944-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] Fix for CVE-2014-6277 and CVE-2014-6278
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
X-List-Received-Date: Thu, 02 Oct 2014 14:28:48 -0000
Content-Type: text/plain

This is a followup patch to incomplete CVE-2014-6271 fix code execution via
specially-crafted environment.

CVE-2014-6277: bash: untrusted pointer use issue leading to code execution
CVE-2014-6278: bash: code execution via specially crafted environment variables

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../bash-3.2.48/cve-2014-6277_cve-2014-6278.patch  | 146 ++++++++++++++++++
 .../bash/bash/cve-2014-6277_cve-2014-6278.patch    | 163 +++++++++++++++++++++
 meta/recipes-extended/bash/bash_3.2.48.bb          |   1 +
 meta/recipes-extended/bash/bash_4.3.bb             |   1 +
 4 files changed, 311 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-6277_cve-2014-6278.patch
 create mode 100644 meta/recipes-extended/bash/bash/cve-2014-6277_cve-2014-6278.patch

diff --git a/meta/recipes-extended/bash/bash-3.2.48/cve-2014-6277_cve-2014-6278.patch b/meta/recipes-extended/bash/bash-3.2.48/cve-2014-6277_cve-2014-6278.patch
new file mode 100644
index 0000000..42b559a
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-3.2.48/cve-2014-6277_cve-2014-6278.patch
@@ -0,0 +1,146 @@
+Fix for CVE-2014-6277 and CVE-2014-6278
+
+Bug-Reported-by: Florian Weimer <fweimer@redhat.com>
+
+Bug-Description:
+
+This patch changes the encoding bash uses for exported functions to avoid
+clashes with shell variables and to avoid depending only on an environment
+variable's contents to determine whether or not to interpret it as a shell
+function.
+
+Upstream-Status: Backport {GNU Patch-ID: bash32-054}
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
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
diff --git a/meta/recipes-extended/bash/bash/cve-2014-6277_cve-2014-6278.patch b/meta/recipes-extended/bash/bash/cve-2014-6277_cve-2014-6278.patch
new file mode 100644
index 0000000..d346f25
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/cve-2014-6277_cve-2014-6278.patch
@@ -0,0 +1,163 @@
+Fix for CVE-2014-6277 and CVE-2014-6278
+
+Bug-Reported-by: Florian Weimer <fweimer@redhat.com>
+
+Bug-Description:
+
+This patch changes the encoding bash uses for exported functions to avoid
+clashes with shell variables and to avoid depending only on an environment
+variable's contents to determine whether or not to interpret it as a shell
+function.
+
+Upstream-Status: Backport {GNU Patch-ID: bash43-027}
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+diff -ruN a/variables.c b/variables.c
+--- a/variables.c	2014-09-30 10:21:12.481674914 +0200
++++ b/variables.c	2014-09-30 10:21:40.820459492 +0200
+@@ -83,6 +83,11 @@
+ 
+ #define ifsname(s)	((s)[0] == 'I' && (s)[1] == 'F' && (s)[2] == 'S' && (s)[3] == '\0')
+ 
++#define BASHFUNC_PREFIX		"BASH_FUNC_"
++#define BASHFUNC_PREFLEN	10	/* == strlen(BASHFUNC_PREFIX */
++#define BASHFUNC_SUFFIX		"%%"
++#define BASHFUNC_SUFFLEN	2	/* == strlen(BASHFUNC_SUFFIX) */
++
+ extern char **environ;
+ 
+ /* Variables used here and defined in other files. */
+@@ -279,7 +284,7 @@
+ static void propagate_temp_var __P((PTR_T));
+ static void dispose_temporary_env __P((sh_free_func_t *));     
+ 
+-static inline char *mk_env_string __P((const char *, const char *));
++static inline char *mk_env_string __P((const char *, const char *, int));
+ static char **make_env_array_from_var_list __P((SHELL_VAR **));
+ static char **make_var_export_array __P((VAR_CONTEXT *));
+ static char **make_func_export_array __P((void));
+@@ -349,22 +354,33 @@
+ 
+       /* If exported function, define it now.  Don't import functions from
+ 	 the environment in privileged mode. */
+-      if (privmode == 0 && read_but_dont_execute == 0 && STREQN ("() {", string, 4))
++      if (privmode == 0 && read_but_dont_execute == 0 && 
++          STREQN (BASHFUNC_PREFIX, name, BASHFUNC_PREFLEN) &&
++          STREQ (BASHFUNC_SUFFIX, name + char_index - BASHFUNC_SUFFLEN) &&
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
+ 	     environment, though we still allow them to be defined as shell
+ 	     variables. */
+-	  if (legal_identifier (name))
+-	    parse_and_execute (temp_string, name, SEVAL_NONINT|SEVAL_NOHIST|SEVAL_FUNCDEF|SEVAL_ONECMD);
++	  if (absolute_program (tname) == 0 && (posixly_correct == 0 || legal_identifier (tname)))
++	    parse_and_execute (temp_string, tname, SEVAL_NONINT|SEVAL_NOHIST|SEVAL_FUNCDEF|SEVAL_ONECMD);
+ 
+-	  if (temp_var = find_function (name))
++	  if (temp_var = find_function (tname))
+ 	    {
+ 	      VSETATTR (temp_var, (att_exported|att_imported));
+ 	      array_needs_making = 1;
+@@ -377,8 +393,11 @@
+ 		  array_needs_making = 1;
+ 		}
+ 	      last_command_exit_value = 1;
+-	      report_error (_("error importing function definition for `%s'"), name);
++	      report_error (_("error importing function definition for `%s'"), tname);
+ 	    }
++
++	  /* Restore original suffix */
++	  tname[namelen] = BASHFUNC_SUFFIX[0];
+ 	}
+ #if defined (ARRAY_VARS)
+ #  if ARRAY_EXPORT
+@@ -2957,7 +2976,7 @@
+   var->context = variable_context;	/* XXX */
+ 
+   INVALIDATE_EXPORTSTR (var);
+-  var->exportstr = mk_env_string (name, value);
++  var->exportstr = mk_env_string (name, value, 0);
+ 
+   array_needs_making = 1;
+ 
+@@ -3855,21 +3874,42 @@
+ /* **************************************************************** */
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
+ 
+@@ -3955,7 +3995,7 @@
+ 	  /* Gee, I'd like to get away with not using savestring() if we're
+ 	     using the cached exportstr... */
+ 	  list[list_index] = USE_EXPORTSTR ? savestring (value)
+-					   : mk_env_string (var->name, value);
++					   : mk_env_string (var->name, value, function_p (var));
+ 
+ 	  if (USE_EXPORTSTR == 0)
+ 	    SAVE_EXPORTSTR (var, list[list_index]);
diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index e6a04cd..94c81a4 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
            file://test-output.patch \
            file://cve-2014-6271.patch;striplevel=0 \
            file://cve-2014-7169.patch \
+	   file://cve-2014-6277_cve-2014-6278.patch \
            file://run-ptest \
           "
 
diff --git a/meta/recipes-extended/bash/bash_4.3.bb b/meta/recipes-extended/bash/bash_4.3.bb
index 69ddecc..915be68 100644
--- a/meta/recipes-extended/bash/bash_4.3.bb
+++ b/meta/recipes-extended/bash/bash_4.3.bb
@@ -11,6 +11,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            file://test-output.patch \
            file://cve-2014-6271.patch;striplevel=0 \
            file://cve-2014-7169.patch \
+	   file://cve-2014-6277_cve-2014-6278.patch \
            file://run-ptest \
            "
 
-- 
1.9.1


