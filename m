Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 890FE60809
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 16:29:38 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id y10so1370889pdj.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 09:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=OG6PFJPEhzxv0q85nQ9X3Y26I3aXHZ8ucGK5qhOpGr4=;
	b=Gd5bwtzVFwektQvLQ24A8jFR2Qel7sj7bdI30hm7G8LNpS1Zd2A+I54CLA/2G22Lpz
	KDGK3JTas284DycLkE+94uBkSJuYGFI3ekf7UoVcRYIkR1eZY0pob1bei58X4LyIeoE2
	wwZv/YElH1FkgSoZ0ebOfycegsQX4w0SS5C1nkTCdiyttvN/DJjfLA9JKuo4kJ7DivJ0
	XlU/O+H7nYQqCcVxpnmKZLDtIn/nC0YeBOB5YI5zV9nNMqcULV7NJCQEkrvGeNJpKuYe
	fry02fWc7zRgLepOV5BCjnxiC0R+gphACJ3aA2QtEuqIT5nAu8cS+fIRTjQomlqMqjIf
	Sk/Q==
X-Received: by 10.68.132.105 with SMTP id ot9mr30447502pbb.76.1411748980287;
	Fri, 26 Sep 2014 09:29:40 -0700 (PDT)
Received: from haswell.localdomain (c-76-103-58-225.hsd1.ca.comcast.net.
	[76.103.58.225])
	by mx.google.com with ESMTPSA id ps7sm5317837pbb.73.2014.09.26.09.29.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Sep 2014 09:29:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Sep 2014 09:33:38 -0700
Message-Id: <1411749218-11056-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH V2] bash: Fix shellshock vulnerability
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
X-List-Received-Date: Fri, 26 Sep 2014 16:29:45 -0000

CVE-2014-6271

Change-Id: Ia6a9f7dab108f0ba40c84eef2d8a61dc2303f3f3
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../bash/bash-3.2.48/shellshock.patch              |  84 +++++++++++++++++
 meta/recipes-extended/bash/bash/shellshock.patch   | 101 +++++++++++++++++++++
 meta/recipes-extended/bash/bash_3.2.48.bb          |   1 +
 meta/recipes-extended/bash/bash_4.3.bb             |   1 +
 4 files changed, 187 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/shellshock.patch
 create mode 100644 meta/recipes-extended/bash/bash/shellshock.patch

diff --git a/meta/recipes-extended/bash/bash-3.2.48/shellshock.patch b/meta/recipes-extended/bash/bash-3.2.48/shellshock.patch
new file mode 100644
index 0000000..bed9cee
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-3.2.48/shellshock.patch
@@ -0,0 +1,84 @@
+Fix CVE-2014-6271
+
+specially-crafted environment variables can be used to inject shell commands
+taken from
+https://bugzilla.redhat.com/show_bug.cgi?id=1141597
+
+Upstream-Status: Submitted
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: bash-3.2.48/variables.c
+===================================================================
+--- bash-3.2.48.orig/variables.c	2008-11-18 05:14:57.000000000 -0800
++++ bash-3.2.48/variables.c	2014-09-26 09:12:58.700080056 -0700
+@@ -318,12 +318,10 @@
+ 	  temp_string[char_index] = ' ';
+ 	  strcpy (temp_string + char_index + 1, string);
+ 
+-	  parse_and_execute (temp_string, name, SEVAL_NONINT|SEVAL_NOHIST);
+-
+-	  /* Ancient backwards compatibility.  Old versions of bash exported
+-	     functions like name()=() {...} */
+-	  if (name[char_index - 1] == ')' && name[char_index - 2] == '(')
+-	    name[char_index - 2] = '\0';
++	  /* Don't import function names that are invalid identifiers from the
++	     environment. */
++	  if (legal_identifier (name))
++	    parse_and_execute (temp_string, name, SEVAL_NONINT|SEVAL_NOHIST|SEVAL_FUNCDEF|SEVAL_ONECMD);
+ 
+ 	  if (temp_var = find_function (name))
+ 	    {
+@@ -332,10 +330,6 @@
+ 	    }
+ 	  else
+ 	    report_error (_("error importing function definition for `%s'"), name);
+-
+-	  /* ( */
+-	  if (name[char_index - 1] == ')' && name[char_index - 2] == '\0')
+-	    name[char_index - 2] = '(';		/* ) */
+ 	}
+ #if defined (ARRAY_VARS)
+ #  if 0
+Index: bash-3.2.48/builtins/common.h
+===================================================================
+--- bash-3.2.48.orig/builtins/common.h	2006-03-06 06:38:44.000000000 -0800
++++ bash-3.2.48/builtins/common.h	2014-09-26 09:12:58.700080056 -0700
+@@ -33,6 +33,8 @@
+ #define SEVAL_RESETLINE	0x010
+ 
+ /* Flags for describe_command, shared between type.def and command.def */
++#define SEVAL_FUNCDEF	0x080		/* only allow function definitions */
++#define SEVAL_ONECMD	0x100		/* only allow a single command */
+ #define CDESC_ALL		0x001	/* type -a */
+ #define CDESC_SHORTDESC		0x002	/* command -V */
+ #define CDESC_REUSABLE		0x004	/* command -v */
+Index: bash-3.2.48/builtins/evalstring.c
+===================================================================
+--- bash-3.2.48.orig/builtins/evalstring.c	2008-11-18 05:15:12.000000000 -0800
++++ bash-3.2.48/builtins/evalstring.c	2014-09-26 09:12:58.700080056 -0700
+@@ -234,6 +234,14 @@
+ 	    {
+ 	      struct fd_bitmap *bitmap;
+ 
++	      if ((flags & SEVAL_FUNCDEF) && command->type != cm_function_def)
++		{
++		  internal_warning ("%s: ignoring function definition attempt", from_file);
++		  should_jump_to_top_level = 0;
++		  last_result = last_command_exit_value = EX_BADUSAGE;
++		  break;
++		}
++
+ 	      bitmap = new_fd_bitmap (FD_BITMAP_SIZE);
+ 	      begin_unwind_frame ("pe_dispose");
+ 	      add_unwind_protect (dispose_fd_bitmap, bitmap);
+@@ -291,6 +299,9 @@
+ 	      dispose_command (command);
+ 	      dispose_fd_bitmap (bitmap);
+ 	      discard_unwind_frame ("pe_dispose");
++
++	      if (flags & SEVAL_ONECMD)
++		break;
+ 	    }
+ 	}
+       else
diff --git a/meta/recipes-extended/bash/bash/shellshock.patch b/meta/recipes-extended/bash/bash/shellshock.patch
new file mode 100644
index 0000000..912e6ff
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/shellshock.patch
@@ -0,0 +1,101 @@
+Fix CVE-2014-6271
+
+specially-crafted environment variables can be used to inject shell commands
+taken from
+https://bugzilla.redhat.com/show_bug.cgi?id=1141597
+
+Upstream-Status: Submitted
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: bash-4.3/variables.c
+===================================================================
+--- bash-4.3.orig/variables.c	2014-02-14 08:55:12.000000000 -0800
++++ bash-4.3/variables.c	2014-09-26 08:40:24.704080056 -0700
+@@ -358,13 +358,11 @@
+ 	  temp_string[char_index] = ' ';
+ 	  strcpy (temp_string + char_index + 1, string);
+ 
+-	  if (posixly_correct == 0 || legal_identifier (name))
+-	    parse_and_execute (temp_string, name, SEVAL_NONINT|SEVAL_NOHIST);
+-
+-	  /* Ancient backwards compatibility.  Old versions of bash exported
+-	     functions like name()=() {...} */
+-	  if (name[char_index - 1] == ')' && name[char_index - 2] == '(')
+-	    name[char_index - 2] = '\0';
++	  /* Don't import function names that are invalid identifiers from the
++	     environment, though we still allow them to be defined as shell
++	     variables. */
++	  if (legal_identifier (name))
++	    parse_and_execute (temp_string, name, SEVAL_NONINT|SEVAL_NOHIST|SEVAL_FUNCDEF|SEVAL_ONECMD);
+ 
+ 	  if (temp_var = find_function (name))
+ 	    {
+@@ -381,10 +379,6 @@
+ 	      last_command_exit_value = 1;
+ 	      report_error (_("error importing function definition for `%s'"), name);
+ 	    }
+-
+-	  /* ( */
+-	  if (name[char_index - 1] == ')' && name[char_index - 2] == '\0')
+-	    name[char_index - 2] = '(';		/* ) */
+ 	}
+ #if defined (ARRAY_VARS)
+ #  if ARRAY_EXPORT
+Index: bash-4.3/subst.c
+===================================================================
+--- bash-4.3.orig/subst.c	2014-01-23 13:26:37.000000000 -0800
++++ bash-4.3/subst.c	2014-09-26 08:40:24.708080056 -0700
+@@ -8029,7 +8029,9 @@
+ 
+ 	  goto return0;
+ 	}
+-      else if (var = find_variable_last_nameref (temp1))
++      else if (var && (invisible_p (var) || var_isset (var) == 0))
++	temp = (char *)NULL;
++      else if ((var = find_variable_last_nameref (temp1)) && var_isset (var) && invisible_p (var) == 0)
+ 	{
+ 	  temp = nameref_cell (var);
+ #if defined (ARRAY_VARS)
+Index: bash-4.3/builtins/common.h
+===================================================================
+--- bash-4.3.orig/builtins/common.h	2013-07-08 13:54:47.000000000 -0700
++++ bash-4.3/builtins/common.h	2014-09-26 08:40:24.700080056 -0700
+@@ -33,6 +33,8 @@
+ #define SEVAL_RESETLINE	0x010
+ #define SEVAL_PARSEONLY	0x020
+ #define SEVAL_NOLONGJMP 0x040
++#define SEVAL_FUNCDEF	0x080		/* only allow function definitions */
++#define SEVAL_ONECMD	0x100		/* only allow a single command */
+ 
+ /* Flags for describe_command, shared between type.def and command.def */
+ #define CDESC_ALL		0x001	/* type -a */
+Index: bash-4.3/builtins/evalstring.c
+===================================================================
+--- bash-4.3.orig/builtins/evalstring.c	2014-02-11 06:42:10.000000000 -0800
++++ bash-4.3/builtins/evalstring.c	2014-09-26 08:40:24.700080056 -0700
+@@ -308,6 +308,14 @@
+ 	    {
+ 	      struct fd_bitmap *bitmap;
+ 
++	      if ((flags & SEVAL_FUNCDEF) && command->type != cm_function_def)
++		{
++		  internal_warning ("%s: ignoring function definition attempt", from_file);
++		  should_jump_to_top_level = 0;
++		  last_result = last_command_exit_value = EX_BADUSAGE;
++		  break;
++		}
++
+ 	      bitmap = new_fd_bitmap (FD_BITMAP_SIZE);
+ 	      begin_unwind_frame ("pe_dispose");
+ 	      add_unwind_protect (dispose_fd_bitmap, bitmap);
+@@ -368,6 +376,9 @@
+ 	      dispose_command (command);
+ 	      dispose_fd_bitmap (bitmap);
+ 	      discard_unwind_frame ("pe_dispose");
++
++	      if (flags & SEVAL_ONECMD)
++		break;
+ 	    }
+ 	}
+       else
diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index fe04b28..07c6540 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -12,6 +12,7 @@ SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
            file://mkbuiltins_have_stringize.patch \
            file://build-tests.patch \
            file://test-output.patch \
+           file://shellshock.patch \
            file://run-ptest \
           "
 
diff --git a/meta/recipes-extended/bash/bash_4.3.bb b/meta/recipes-extended/bash/bash_4.3.bb
index 25b7410..a01fcf1 100644
--- a/meta/recipes-extended/bash/bash_4.3.bb
+++ b/meta/recipes-extended/bash/bash_4.3.bb
@@ -9,6 +9,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            file://mkbuiltins_have_stringize.patch \
            file://build-tests.patch \
            file://test-output.patch \
+           file://shellshock.patch \
            file://run-ptest \
            "
 
-- 
2.1.0


