Return-Path: <Liam.Howlett@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E6376612C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 19:05:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7HJ5Dfq000594
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 12:05:13 -0700
Received: from yow-lhowlett-d0.corp.ad.wrs.com (128.224.56.234) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 17 Aug 2016 12:05:12 -0700
From: "Liam R. Howlett" <Liam.Howlett@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Aug 2016 15:05:11 -0400
Message-ID: <1471460711-6976-2-git-send-email-Liam.Howlett@WindRiver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1471460711-6976-1-git-send-email-Liam.Howlett@WindRiver.com>
References: <1471460711-6976-1-git-send-email-Liam.Howlett@WindRiver.com>
MIME-Version: 1.0
Cc: Liam.Howlett@WindRiver.com
Subject: [PATCH v2 1/1] wget: Add --ssh-askpass support
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
X-List-Received-Date: Wed, 17 Aug 2016 19:05:13 -0000
Content-Type: text/plain

This adds the --ssh-askpass=COMMAND option which is disabled by default.

--use-askpass=COMMAND will request the username and password for a given
URL by executing the external program COMMAND.  If COMMAND is left
blank, then the external program in the environment variable
WGET_ASKPASS will be used.  If WGET_ASKPASS is not set then the
environment variable SSH_ASKPASS is used.  If there is no value set, an
error is returned.  If an error occurs requesting the username or
password, wget will exit.

Signed-off-by: Liam R. Howlett <Liam.Howlett@WindRiver.com>
---
 .../0001-Add-use-askpass-COMMAND-support.patch     | 355 +++++++++++++++++++++
 meta/recipes-extended/wget/wget_1.18.bb            |   1 +
 2 files changed, 356 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/0001-Add-use-askpass-COMMAND-support.patch

diff --git a/meta/recipes-extended/wget/wget/0001-Add-use-askpass-COMMAND-support.patch b/meta/recipes-extended/wget/wget/0001-Add-use-askpass-COMMAND-support.patch
new file mode 100644
index 0000000..1ae24e4
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/0001-Add-use-askpass-COMMAND-support.patch
@@ -0,0 +1,355 @@
+From c275d9f5743f22273dc9fa7b059ab4ccd0b2e244 Mon Sep 17 00:00:00 2001
+From: "Liam R. Howlett" <Liam.Howlett@WindRiver.com>
+Date: Wed, 17 Aug 2016 12:56:54 -0400
+Subject: [PATCH] Add --use-askpass=COMMAND support
+To: openembedded-core@lists.openembedded.org
+Cc: Liam.Howlett@WindRiver.com
+
+* doc/wget.texi: Add --use-askpass to documentation.
+* src/init.c: Add cmd_use_askpasss to set opt.use_askpass based on
+argument, WGET_ASKPASS, and SSH_ASKPASS environment variables.
+opt.wget-askpass is freed in cleanup ()
+* src/main.c: Update options & add spawn process of opt.use_askpass
+command.
+* src/options.h: Addition of string use_askpass.
+* src/url.c: Function scheme_leading_string to access the leading
+string of a parsed url.
+* src/url.h: Prototype for scheme_leading_string for returning the
+leading string.
+* bootstrap.conf: Add posix_spawn to gnulib_modules
+
+This adds the --use-askpass option which is disabled by default.
+
+--use-askpass=COMMAND will request the username and password for a given
+URL by executing the external program COMMAND.  If COMMAND is left
+blank, then the external program in the environment variable
+WGET_ASKPASS will be used.  If WGET_ASKPASS is not set then the
+environment variable SSH_ASKPASS is used.  If there is no value set, an
+error is returned.  If an error occurs requesting the username or
+password, wget will exit.
+
+Upstream-Status: Submitted [bug-wget@gnu.org]
+
+Signed-off-by: Liam R. Howlett <Liam.Howlett@WindRiver.com>
+---
+ doc/wget.texi |  17 ++++++---
+ src/init.c    |  44 +++++++++++++++++++++++
+ src/main.c    | 112 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ src/options.h |   1 +
+ src/url.c     |   6 ++++
+ src/url.h     |   1 +
+ 6 files changed, 177 insertions(+), 4 deletions(-)
+
+diff --git a/doc/wget.texi b/doc/wget.texi
+index 1e55e63..466e80f 100644
+--- a/doc/wget.texi
++++ b/doc/wget.texi
+@@ -1154,6 +1154,15 @@ options for @sc{http} connections.
+ Prompt for a password for each connection established. Cannot be specified
+ when @samp{--password} is being used, because they are mutually exclusive.
+ 
++@item --use-askpass=@var{command}
++Prompt for a user and password using the specified command.  If no command is
++specified then the command in the environment variable WGET_ASKPASS is used.
++If WGET_ASKPASS is not set then the command in the environment variable
++SSH_ASKPASS is used.
++
++You can set the default command for use-askpass in the @file{.wgetrc}.  That
++setting may be overridden from the command line.
++
+ @cindex iri support
+ @cindex idn support
+ @item --no-iri
+@@ -1327,10 +1336,10 @@ the @code{digest}, or the Windows @code{NTLM} authentication scheme.
+ Another way to specify username and password is in the @sc{url} itself
+ (@pxref{URL Format}).  Either method reveals your password to anyone who
+ bothers to run @code{ps}.  To prevent the passwords from being seen,
+-store them in @file{.wgetrc} or @file{.netrc}, and make sure to protect
+-those files from other users with @code{chmod}.  If the passwords are
+-really important, do not leave them lying in those files either---edit
+-the files and delete them after Wget has started the download.
++use the @samp{--use-askpass} or store them in @file{.wgetrc} or @file{.netrc},
++and make sure to protect those files from other users with @code{chmod}.  If
++the passwords are really important, do not leave them lying in those files
++either---edit the files and delete them after Wget has started the download.
+ 
+ @iftex
+ @xref{Security Considerations}, for more information about security
+diff --git a/src/init.c b/src/init.c
+index d043d83..c993822 100644
+--- a/src/init.c
++++ b/src/init.c
+@@ -97,6 +97,8 @@ CMD_DECLARE (cmd_directory);
+ CMD_DECLARE (cmd_time);
+ CMD_DECLARE (cmd_vector);
+ 
++CMD_DECLARE (cmd_use_askpass);
++
+ CMD_DECLARE (cmd_spec_dirstruct);
+ CMD_DECLARE (cmd_spec_header);
+ CMD_DECLARE (cmd_spec_warc_header);
+@@ -318,6 +320,7 @@ static const struct {
+   { "tries",            &opt.ntry,              cmd_number_inf },
+   { "trustservernames", &opt.trustservernames,  cmd_boolean },
+   { "unlink",           &opt.unlink,            cmd_boolean },
++  { "useaskpass" ,      &opt.use_askpass,       cmd_use_askpass },
+   { "useproxy",         &opt.use_proxy,         cmd_boolean },
+   { "user",             &opt.user,              cmd_string },
+   { "useragent",        NULL,                   cmd_spec_useragent },
+@@ -1371,6 +1374,46 @@ cmd_time (const char *com, const char *val, void *place)
+   return true;
+ }
+ 
++
++static bool
++cmd_use_askpass (const char *com _GL_UNUSED, const char *val, void *place)
++{
++  char *env_name = "WGET_ASKPASS";
++  char *env;
++
++  if (val && *val)
++    {
++      if (!file_exists_p (val))
++        {
++          fprintf (stderr, _("%s does not exist.\n"), val);
++          exit (WGET_EXIT_GENERIC_ERROR);
++        }
++      return cmd_string (com, val, place);
++    }
++
++  env = getenv (env_name);
++  if (!(env && *env))
++    {
++      env_name = "SSH_ASKPASS";
++      env = getenv (env_name);
++    }
++
++  if (!(env && *env))
++    {
++      fprintf (stderr, _("use-askpass requires a string or either environment variable WGET_ASKPASS or SSH_ASKPASS to be set.\n"));
++      exit (WGET_EXIT_GENERIC_ERROR);
++    }
++
++  if (!file_exists_p (env))
++    {
++      fprintf (stderr, _("%s points to %s, which does not exist.\n"),
++              env_name, env);
++      exit (WGET_EXIT_GENERIC_ERROR);
++    }
++
++  return cmd_string (com, env, place);
++}
++
+ #ifdef HAVE_SSL
+ static bool
+ cmd_cert_type (const char *com, const char *val, void *place)
+@@ -1930,6 +1973,7 @@ cleanup (void)
+   xfree (opt.body_data);
+   xfree (opt.body_file);
+   xfree (opt.rejected_log);
++  xfree (opt.use_askpass);
+ 
+ #ifdef HAVE_LIBCARES
+ #include <ares.h>
+diff --git a/src/main.c b/src/main.c
+index e7d5c66..c48be50 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -36,6 +36,7 @@ as that of the covered work.  */
+ #include <unistd.h>
+ #include <string.h>
+ #include <signal.h>
++#include <spawn.h>
+ #ifdef ENABLE_NLS
+ # include <locale.h>
+ #endif
+@@ -414,6 +415,7 @@ static struct cmdline_option option_data[] =
+     { "tries", 't', OPT_VALUE, "tries", -1 },
+     { "unlink", 0, OPT_BOOLEAN, "unlink", -1 },
+     { "trust-server-names", 0, OPT_BOOLEAN, "trustservernames", -1 },
++    { "use-askpass", 0, OPT_VALUE, "useaskpass", -1},
+     { "use-server-timestamps", 0, OPT_BOOLEAN, "useservertimestamps", -1 },
+     { "user", 0, OPT_VALUE, "user", -1 },
+     { "user-agent", 'U', OPT_VALUE, "useragent", -1 },
+@@ -691,6 +693,11 @@ Download:\n"),
+     N_("\
+        --ask-password              prompt for passwords\n"),
+     N_("\
++       --use-askpass=COMMAND       specify credential handler for requesting \n\
++                                     username and password.  If no COMMAND is \n\
++                                     specified the WGET_ASKPASS or the SSH_ASKPASS \n\
++                                     environment variable is used.\n"),
++    N_("\
+        --no-iri                    turn off IRI support\n"),
+     N_("\
+        --local-encoding=ENC        use ENC as the local encoding for IRIs\n"),
+@@ -1019,6 +1026,97 @@ prompt_for_password (void)
+   return getpass("");
+ }
+ 
++
++/* Execute external application opt.use_askpass */
++void
++run_use_askpass (char *question, char **answer)
++{
++  char tmp[1024];
++  pid_t pid;
++  int status;
++  int com[2];
++  ssize_t bytes = 0;
++  char * const argv[] = { opt.use_askpass, question, NULL };
++  posix_spawn_file_actions_t fa;
++
++  if (pipe (com) == -1)
++    {
++      fprintf (stderr, _("Cannot create pipe"));
++      exit (WGET_EXIT_GENERIC_ERROR);
++    }
++
++  status = posix_spawn_file_actions_init (&fa);
++  if (status)
++    {
++      fprintf (stderr,
++              _("Error initializing spawn file actions for use-askpass: %d"),
++              status);
++      exit (WGET_EXIT_GENERIC_ERROR);
++    }
++
++  status = posix_spawn_file_actions_adddup2 (&fa, com[1], STDOUT_FILENO);
++  if (status)
++    {
++      fprintf (stderr,
++              _("Error setting spawn file actions for use-askpass: %d"),
++              status);
++      exit (WGET_EXIT_GENERIC_ERROR);
++    }
++
++  status = posix_spawnp (&pid, opt.use_askpass, &fa, NULL, argv, environ);
++  if (status)
++    {
++      fprintf (stderr, "Error spawning %s: %d", opt.use_askpass, status);
++      exit (WGET_EXIT_GENERIC_ERROR);
++    }
++
++  /* Parent process reads from child. */
++  close (com[1]);
++  bytes = read (com[0], tmp, sizeof (tmp) - 1);
++  if (bytes <= 0)
++    {
++      fprintf (stderr,
++              _("Error reading response from command \"%s %s\": %s\n"),
++              opt.use_askpass, question, strerror (errno));
++      exit (WGET_EXIT_GENERIC_ERROR);
++    }
++  /* Set the end byte to \0, and decrement bytes */
++  tmp[bytes--] = '\0';
++
++  /* Remove a possible new line */
++  while (bytes >= 0 &&
++        (tmp[bytes] == '\0' || tmp[bytes] == '\n' || tmp[bytes] == '\r'))
++    tmp[bytes--] = '\0';
++
++  *answer = xmemdup (tmp, bytes + 2);
++}
++
++/* set the user name and password*/
++void
++use_askpass (struct url *u)
++{
++  static char question[1024];
++
++  if (u->user == NULL || u->user[0] == '\0')
++    {
++      snprintf (question, sizeof (question),  _("Username for '%s%s': "),
++                scheme_leading_string(u->scheme), u->host);
++      /* Prompt for username */
++      run_use_askpass (question, &u->user);
++      if (opt.recursive)
++        opt.user = xstrdup (u->user);
++    }
++
++  if (u->passwd == NULL || u->passwd[0] == '\0')
++    {
++      snprintf(question, sizeof (question), _("Password for '%s%s@%s': "),
++               scheme_leading_string (u->scheme), u->user, u->host);
++      /* Prompt for password */
++      run_use_askpass (question, &u->passwd);
++      if (opt.recursive)
++        opt.passwd = xstrdup (u->passwd);
++    }
++}
+ /* Function that prints the line argument while limiting it
+    to at most line_length. prefix is printed on the first line
+    and an appropriate number of spaces are added on subsequent
+@@ -1702,6 +1800,16 @@ for details.\n\n"));
+         exit (WGET_EXIT_GENERIC_ERROR);
+     }
+ 
++  if (opt.use_askpass)
++  {
++    if (opt.use_askpass[0] == '\0')
++      {
++        fprintf (stderr,
++                 _("use-askpass requires a string or either environment variable WGET_ASKPASS or SSH_ASKPASS to be set.\n"));
++        exit (WGET_EXIT_GENERIC_ERROR);
++      }
++  }
++
+ #ifdef USE_WATT32
+   if (opt.wdebug)
+      dbug_init();
+@@ -1920,6 +2028,10 @@ only if outputting to a regular file.\n"));
+         }
+       else
+         {
++          /* Request credentials if use_askpass is set. */
++          if (opt.use_askpass)
++            use_askpass (url_parsed);
++
+           if ((opt.recursive || opt.page_requisites)
+               && ((url_scheme (*t) != SCHEME_FTP
+ #ifdef HAVE_SSL
+diff --git a/src/options.h b/src/options.h
+index a8c494b..78bb17a 100644
+--- a/src/options.h
++++ b/src/options.h
+@@ -130,6 +130,7 @@ struct options
+   char *user;                   /* Generic username */
+   char *passwd;                 /* Generic password */
+   bool ask_passwd;              /* Ask for password? */
++  char *use_askpass;           /* value to use for use-askpass if WGET_ASKPASS is not set */
+ 
+   bool always_rest;             /* Always use REST. */
+   wgint start_pos;              /* Start position of a download. */
+diff --git a/src/url.c b/src/url.c
+index ec38d6f..c133d91 100644
+--- a/src/url.c
++++ b/src/url.c
+@@ -512,6 +512,12 @@ scheme_disable (enum url_scheme scheme)
+   supported_schemes[scheme].flags |= scm_disabled;
+ }
+ 
++const char *
++scheme_leading_string (enum url_scheme scheme)
++{
++  return supported_schemes[scheme].leading_string;
++}
++
+ /* Skip the username and password, if present in the URL.  The
+    function should *not* be called with the complete URL, but with the
+    portion after the scheme.
+diff --git a/src/url.h b/src/url.h
+index 7c77737..f4ffe20 100644
+--- a/src/url.h
++++ b/src/url.h
+@@ -124,6 +124,7 @@ bool url_has_scheme (const char *);
+ bool url_valid_scheme (const char *);
+ int scheme_default_port (enum url_scheme);
+ void scheme_disable (enum url_scheme);
++const char *scheme_leading_string (enum url_scheme);
+ 
+ char *url_string (const struct url *, enum url_auth_mode);
+ char *url_file_name (const struct url *, char *);
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/wget/wget_1.18.bb b/meta/recipes-extended/wget/wget_1.18.bb
index c969b98..6ea1575 100644
--- a/meta/recipes-extended/wget/wget_1.18.bb
+++ b/meta/recipes-extended/wget/wget_1.18.bb
@@ -1,5 +1,6 @@
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
+           file://0001-Add-use-askpass-COMMAND-support.patch \
           "
 
 SRC_URI[md5sum] = "fc2debd8399e3b933a9b226794e2a886"
-- 
1.9.1


