Return-Path: <Liam.Howlett@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 69D6F6067D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 18:24:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6MIO8pP018102
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 11:24:08 -0700 (PDT)
Received: from yow-lhowlett-d0.wrs.com (128.224.56.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 22 Jul 2016 11:24:07 -0700
From: "Liam R. Howlett" <Liam.Howlett@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Jul 2016 14:24:05 -0400
Message-ID: <1469211845-21125-2-git-send-email-Liam.Howlett@WindRiver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1469211845-21125-1-git-send-email-Liam.Howlett@WindRiver.com>
References: <1469211845-21125-1-git-send-email-Liam.Howlett@WindRiver.com>
MIME-Version: 1.0
Cc: Liam.Howlett@WindRiver.com
Subject: [PATCH] wget: Add --ssh-askpass support
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
X-List-Received-Date: Fri, 22 Jul 2016 18:24:09 -0000
Content-Type: text/plain

This adds the --ssh-askpass option which is disabled by default.

--ssh-askpass will request the username and password for a given URL by
executing the external program pointed to by the environment variable
SSH_ASKPASS.  If the environment variable is not set, an error is
returned.  If an error occurs requesting the username or password, wget
will exit.

Signed-off-by: Liam R. Howlett <Liam.Howlett@WindRiver.com>
---
 .../wget/0001-wget-Add-ssh-askpass-support.patch   | 221 +++++++++++++++++++++
 meta/recipes-extended/wget/wget_1.18.bb            |   1 +
 2 files changed, 222 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/0001-wget-Add-ssh-askpass-support.patch

diff --git a/meta/recipes-extended/wget/wget/0001-wget-Add-ssh-askpass-support.patch b/meta/recipes-extended/wget/wget/0001-wget-Add-ssh-askpass-support.patch
new file mode 100644
index 0000000..e402375
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/0001-wget-Add-ssh-askpass-support.patch
@@ -0,0 +1,221 @@
+From a3af68bfabd210c47f136544061e0d030c618d81 Mon Sep 17 00:00:00 2001
+From: "Liam R. Howlett" <Liam.Howlett@WindRiver.com>
+Date: Fri, 22 Jul 2016 14:10:41 -0400
+Subject: [PATCH] wget: Add --ssh-askpass support
+
+This adds the --ssh-askpass option which is disabled by default.
+
+--ssh-askpass will request the username and password for a given URL by
+executing the external program pointed to by the environment variable
+SSH_ASKPASS.  If the environment variable is not set, an error is
+returned.  If an error occurs requesting the username or password, wget
+will exit.
+
+Upstream-Status: Pending
+
+Signed-off-by: Liam R. Howlett <Liam.Howlett@WindRiver.com>
+---
+ src/init.c    |  3 ++
+ src/main.c    | 92 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ src/options.h |  2 ++
+ src/url.c     |  6 ++++
+ src/url.h     |  1 +
+ 5 files changed, 104 insertions(+)
+
+diff --git a/src/init.c b/src/init.c
+index d043d83..886d701 100644
+--- a/src/init.c
++++ b/src/init.c
+@@ -322,6 +322,7 @@ static const struct {
+   { "user",             &opt.user,              cmd_string },
+   { "useragent",        NULL,                   cmd_spec_useragent },
+   { "useservertimestamps", &opt.useservertimestamps, cmd_boolean },
++  { "usesshaskpass", &opt.use_ssh_askpass, cmd_boolean},
+   { "verbose",          NULL,                   cmd_spec_verbose },
+   { "wait",             &opt.wait,              cmd_time },
+   { "waitretry",        &opt.waitretry,         cmd_time },
+@@ -392,6 +393,8 @@ defaults (void)
+   tmp = getenv ("no_proxy");
+   if (tmp)
+     opt.no_proxy = sepstring (tmp);
++  opt.use_ssh_askpass = false;
++  opt.ssh_askpass = getenv ("SSH_ASKPASS");
+   opt.prefer_family = prefer_none;
+   opt.allow_cache = true;
+   opt.if_modified_since = true;
+diff --git a/src/main.c b/src/main.c
+index e7d5c66..cf82d3c 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -415,6 +415,7 @@ static struct cmdline_option option_data[] =
+     { "unlink", 0, OPT_BOOLEAN, "unlink", -1 },
+     { "trust-server-names", 0, OPT_BOOLEAN, "trustservernames", -1 },
+     { "use-server-timestamps", 0, OPT_BOOLEAN, "useservertimestamps", -1 },
++    { "ssh-askpass", 0, OPT_BOOLEAN, "usesshaskpass", -1 },
+     { "user", 0, OPT_VALUE, "user", -1 },
+     { "user-agent", 'U', OPT_VALUE, "useragent", -1 },
+     { "verbose", 'v', OPT_BOOLEAN, "verbose", -1 },
+@@ -691,6 +692,8 @@ Download:\n"),
+     N_("\
+        --ask-password              prompt for passwords\n"),
+     N_("\
++       --ssh-askpass               Use SSH_ASKPASS for credential requests\n"),
++    N_("\
+        --no-iri                    turn off IRI support\n"),
+     N_("\
+        --local-encoding=ENC        use ENC as the local encoding for IRIs\n"),
+@@ -1019,6 +1022,81 @@ prompt_for_password (void)
+   return getpass("");
+ }
+ 
++
++/* Execute external application SSH_ASKPASS which is stored in opt.ssh_askpass
++ */
++void
++run_ssh_askpass(const char *question, char **answer)
++{
++  char tmp[1024];
++  pid_t pid;
++  int com[2];
++
++  if (pipe(com) == -1)
++  {
++    fprintf(stderr, _("Cannot create pipe"));
++    exit (WGET_EXIT_GENERIC_ERROR);
++  }
++
++  pid = fork();
++  if (pid == -1)
++  {
++    fprintf(stderr, "Error forking SSH_ASKPASS");
++    exit (WGET_EXIT_GENERIC_ERROR);
++  }
++  else if (pid == 0)
++  {
++    /* Child */
++    dup2(com[1], STDOUT_FILENO);
++    close(com[0]);
++    close(com[1]);
++    fprintf(stdout, "test");
++    execlp("/usr/bin/strace", "-s256", "-otest.out", opt.ssh_askpass, question, (char*)NULL);
++    assert("Execlp failed!");
++  }
++  else
++  {
++    close(com[1]);
++    unsigned int bytes = read(com[0], tmp, sizeof(tmp));
++    if (!bytes)
++    {
++      fprintf(stderr,
++        _("Error reading response from SSH_ASKPASS %s %s\n"),
++        opt.ssh_askpass, question);
++      exit (WGET_EXIT_GENERIC_ERROR);
++    }
++    else if (bytes > 1)
++      *answer = strndup(tmp, bytes-1);
++  }
++}
++
++/* set the user name and password*/
++void
++ssh_askpass (struct url *u)
++{
++  static char question[1024];
++  
++  if (u->user == NULL || u->user[0] == '\0')
++  {
++    sprintf(question, "Username for '%s%s': ",
++        scheme_leading_string(u->scheme), u->host);
++    /* Prompt for username */
++    run_ssh_askpass(question, &u->user);
++    if (opt.recursive)
++      opt.user = strdup(u->user);
++  }
++
++  if (u->passwd == NULL || u->passwd[0] == '\0')
++  {
++    sprintf(question, "Password for '%s%s@%s': ",
++        scheme_leading_string(u->scheme), u->user,
++        u->host);
++    /* Prompt for password */
++    run_ssh_askpass(question, &u->passwd);
++    if (opt.recursive)
++      opt.passwd = strdup(u->passwd);
++  }
++}
+ /* Function that prints the line argument while limiting it
+    to at most line_length. prefix is printed on the first line
+    and an appropriate number of spaces are added on subsequent
+@@ -1702,6 +1780,16 @@ for details.\n\n"));
+         exit (WGET_EXIT_GENERIC_ERROR);
+     }
+ 
++  if (opt.use_ssh_askpass)
++  {
++    /* can't request credentials until the URL is known. */
++    if (opt.ssh_askpass == NULL || opt.ssh_askpass[0] == '\0')
++    {
++    fprintf(stderr, _("--ssh-askpass requires environment variable SSH_ASKPASS to be set.\n"));
++      exit(WGET_EXIT_GENERIC_ERROR);
++    }
++  }
++
+ #ifdef USE_WATT32
+   if (opt.wdebug)
+      dbug_init();
+@@ -1920,6 +2008,10 @@ only if outputting to a regular file.\n"));
+         }
+       else
+         {
++          if (opt.use_ssh_askpass)
++          {
++            ssh_askpass(url_parsed);
++          }
+           if ((opt.recursive || opt.page_requisites)
+               && ((url_scheme (*t) != SCHEME_FTP
+ #ifdef HAVE_SSL
+diff --git a/src/options.h b/src/options.h
+index a8c494b..977c150 100644
+--- a/src/options.h
++++ b/src/options.h
+@@ -130,6 +130,8 @@ struct options
+   char *user;                   /* Generic username */
+   char *passwd;                 /* Generic password */
+   bool ask_passwd;              /* Ask for password? */
++  bool use_ssh_askpass;         /* Use SSH_ASKPASS infrastructure */
++  char *ssh_askpass;            /* value of SSH_ASKPASS */
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
+index 7c77737..bf2e3f7 100644
+--- a/src/url.h
++++ b/src/url.h
+@@ -124,6 +124,7 @@ bool url_has_scheme (const char *);
+ bool url_valid_scheme (const char *);
+ int scheme_default_port (enum url_scheme);
+ void scheme_disable (enum url_scheme);
++const char *scheme_leading_string(enum url_scheme);
+ 
+ char *url_string (const struct url *, enum url_auth_mode);
+ char *url_file_name (const struct url *, char *);
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/wget/wget_1.18.bb b/meta/recipes-extended/wget/wget_1.18.bb
index c969b98..20ec503 100644
--- a/meta/recipes-extended/wget/wget_1.18.bb
+++ b/meta/recipes-extended/wget/wget_1.18.bb
@@ -1,5 +1,6 @@
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
+           file://0001-Add-ssh-askpass-support.patch \
           "
 
 SRC_URI[md5sum] = "fc2debd8399e3b933a9b226794e2a886"
-- 
1.9.1


