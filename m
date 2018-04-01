Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2E59C74725
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Apr 2018 07:19:59 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id i194so7331782pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Apr 2018 00:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=I0yvKaTQuL8w55wWTnMit9hECCDWKCjxqmDi1xVx7z4=;
	b=ZVz8CEbYo50PZe+3+aXDg/Y7s1H8Jw6cTrMp2YVQXHyxw8m0XHGb/5GLGIe0YyQ2VK
	Za+9i3kQP11IbliwMoO94fcXJfHuTGvgyu2PE7vGeyN0KfFj1vtU01xcKZJCj3IoKWBM
	b59szOwtTh04bOXmeFDmmJsyEYe41JQT2XHF2Y4Mlz5aqenCnryp9wf4hjCpnQFW9Rlb
	F23vGMLB1W6k30r+GP1kYzPasw7tGmPdLG2+U2OyEqfI8aUcLY/vhKPw3+tAZ8Opit2t
	dq064ygpqSfTleBLxTcAq8y0a8SMNZLrnLwfV05dKL41Vnj71Od91FwRuZAHD2gw8uMS
	h0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=I0yvKaTQuL8w55wWTnMit9hECCDWKCjxqmDi1xVx7z4=;
	b=fnmIkp98oZOjaecZVZijLXD8O1XLTeTT5dwP2CWbEFkydI5KDKk5s1cyGd4N9bap2c
	+0xqeD8WA3eRv9hdDjH/iqzS6qVn3AsnE9+GcHtCczPpALHv11t8QspBVFv8GdqTBjgW
	Jvafov1pyJOyNdn239amcLa5PMU9RBdPo1tPWTxa0lIXZ3H4JhkU/4G01J9R688kBTIb
	ifRMJHDZY71XbuKZu+2qDkXtD5qNL8GrcZZPM8FDFjHEXBLBhETQOGoosmyZaSjJgCja
	TtITZwyL04E0aNZbVyqdnVzSteZeG8BCqatJTTcB6dkQH2C9kytgYkbbJi5j9Gh77l/x
	rUMw==
X-Gm-Message-State: AElRT7FyopzxTbWKkVQxJINdvIpuTZGnS5ifnJR0+Qq8ODhffV2E31Yn
	GeppLcxsIulDSnWcggpvjAgIMg==
X-Google-Smtp-Source: AIpwx48DUs0C6KojjfrKytbKBcYpVw/ZzVz3u5q0ua7Z301cQLr5CqRtiSLb5Z6J11aMfrZUKEZjIQ==
X-Received: by 10.99.167.78 with SMTP id w14mr3406012pgo.408.1522567200575;
	Sun, 01 Apr 2018 00:20:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	x128sm21481749pgb.31.2018.04.01.00.19.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 Apr 2018 00:19:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Apr 2018 00:19:45 -0700
Message-Id: <9aee9a2a563b21c28585e8622a3af5cf10de4e57.1522567040.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.3
In-Reply-To: <cover.1522567040.git.raj.khem@gmail.com>
References: <cover.1522567040.git.raj.khem@gmail.com>
Subject: [PATCH 3/4] systemtap: Backport a fix for build with gcc8
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
X-List-Received-Date: Sun, 01 Apr 2018 07:20:00 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../systemtap/systemtap/0001-Fixes-for-gcc-8.patch | 215 +++++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.inc    |   1 +
 2 files changed, 216 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Fixes-for-gcc-8.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Fixes-for-gcc-8.patch b/meta/recipes-kernel/systemtap/systemtap/0001-Fixes-for-gcc-8.patch
new file mode 100644
index 0000000000..a1b0bff02a
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-Fixes-for-gcc-8.patch
@@ -0,0 +1,215 @@
+From 4ffe00f1d9eac332d928f7dc01fe250dc32b1bb8 Mon Sep 17 00:00:00 2001
+From: Stan Cox <scox@redhat.com>
+Date: Tue, 13 Feb 2018 22:38:03 -0500
+Subject: [PATCH] Fixes for gcc 8
+
+* includes/sys/sdt.h (__SDT_COND_SIGNED):  Add CT, cast type argument
+
+Author: Will Cohen <wcohen.redhat.com>
+
+* stap-serverd.cxx (generate_mok, handleRequest, handle_connection):
+  Catch format overflow
+
+* translate.cxx (translate_pass): Use ref in catch.
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ includes/sys/sdt.h | 20 ++++++++--------
+ stap-serverd.cxx   | 67 +++++++++++++++++++++++++++++++++++++++++++++++-------
+ translate.cxx      |  2 +-
+ 3 files changed, 70 insertions(+), 19 deletions(-)
+
+diff --git a/includes/sys/sdt.h b/includes/sys/sdt.h
+index 940f74483..c0c5a492c 100644
+--- a/includes/sys/sdt.h
++++ b/includes/sys/sdt.h
+@@ -119,8 +119,8 @@ struct __sdt_type
+   
+ #define __SDT_ALWAYS_SIGNED(T) \
+ template<> struct __sdt_type<T> { static const bool __sdt_signed = true; };
+-#define __SDT_COND_SIGNED(T) \
+-template<> struct __sdt_type<T> { static const bool __sdt_signed = ((T)(-1) < 1); };
++#define __SDT_COND_SIGNED(T,CT)						\
++template<> struct __sdt_type<T> { static const bool __sdt_signed = ((CT)(-1) < 1); };
+ __SDT_ALWAYS_SIGNED(signed char)
+ __SDT_ALWAYS_SIGNED(short)
+ __SDT_ALWAYS_SIGNED(int)
+@@ -141,14 +141,14 @@ __SDT_ALWAYS_SIGNED(const volatile short)
+ __SDT_ALWAYS_SIGNED(const volatile int)
+ __SDT_ALWAYS_SIGNED(const volatile long)
+ __SDT_ALWAYS_SIGNED(const volatile long long)
+-__SDT_COND_SIGNED(char)
+-__SDT_COND_SIGNED(wchar_t)
+-__SDT_COND_SIGNED(volatile char)
+-__SDT_COND_SIGNED(volatile wchar_t)
+-__SDT_COND_SIGNED(const char)
+-__SDT_COND_SIGNED(const wchar_t)
+-__SDT_COND_SIGNED(const volatile char)
+-__SDT_COND_SIGNED(const volatile wchar_t)
++__SDT_COND_SIGNED(char, char)
++__SDT_COND_SIGNED(wchar_t, wchar_t)
++__SDT_COND_SIGNED(volatile char, char)
++__SDT_COND_SIGNED(volatile wchar_t, wchar_t)
++__SDT_COND_SIGNED(const char, char)
++__SDT_COND_SIGNED(const wchar_t, wchar_t)
++__SDT_COND_SIGNED(const volatile char, char)
++__SDT_COND_SIGNED(const volatile wchar_t, wchar_t)
+ #if defined (__GNUC__) && (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 4))
+ /* __SDT_COND_SIGNED(char16_t) */
+ /* __SDT_COND_SIGNED(char32_t) */
+diff --git a/stap-serverd.cxx b/stap-serverd.cxx
+index 7cf76c617..41f77ee9e 100644
+--- a/stap-serverd.cxx
++++ b/stap-serverd.cxx
+@@ -1607,6 +1607,7 @@ generate_mok(string &mok_fingerprint)
+   char tmpdir[PATH_MAX] = { '\0' };
+   string public_cert_path, private_cert_path, destdir;
+   mode_t old_umask;
++  int retlen;
+ 
+   mok_fingerprint.clear ();
+ 
+@@ -1631,7 +1632,14 @@ generate_mok(string &mok_fingerprint)
+     }
+ 
+   // Make a temporary directory to store results in.
+-  snprintf (tmpdir, PATH_MAX, "%s/stap-server.XXXXXX", mok_path.c_str ());
++  retlen = snprintf (tmpdir, PATH_MAX, "%s/stap-server.XXXXXX", mok_path.c_str ());
++  if (retlen < 0 || retlen >= PATH_MAX)
++    {
++      server_error (_F("Could not create %s name", "temporary directory"));
++      tmpdir[0] = '\0';
++      goto cleanup;
++    }
++
+   if (mkdtemp (tmpdir) == NULL)
+     {
+       server_error (_F("Could not create temporary directory %s: %s", tmpdir, 
+@@ -1704,6 +1712,7 @@ handleRequest (const string &requestDirName, const string &responseDirName, stri
+   unsigned u;
+   unsigned i;
+   FILE* f;
++  int retlen;
+ 
+   // Save the server version. Do this early, so the client knows what version of the server
+   // it is dealing with, even if the request is not fully completed.
+@@ -1782,7 +1791,12 @@ handleRequest (const string &requestDirName, const string &responseDirName, stri
+       struct stat st;
+       char *arg;
+ 
+-      snprintf (stapargfile, PATH_MAX, "%s/argv%d", requestDirName.c_str (), i);
++      retlen = snprintf (stapargfile, PATH_MAX, "%s/argv%d", requestDirName.c_str (), i);
++      if (retlen < 0 || retlen >= PATH_MAX)
++        {
++          server_error (_F("Error creating %s name", "path"));
++          return;
++        }
+ 
+       rc = stat(stapargfile, & st);
+       if (rc) break;
+@@ -1888,7 +1902,15 @@ handleRequest (const string &requestDirName, const string &responseDirName, stri
+     {
+       glob_t globber;
+       char pattern[PATH_MAX];
+-      snprintf (pattern, PATH_MAX, "%s/*.ko", new_staptmpdir.c_str());
++      int retlen;
++
++      retlen = snprintf (pattern, PATH_MAX, "%s/*.ko", new_staptmpdir.c_str());
++      if (retlen < 0 || retlen >= PATH_MAX)
++        {
++          server_error (_F("Error creating %s name", "pattern"));
++          return;
++        }
++
+       rc = glob (pattern, GLOB_ERR, NULL, &globber);
+       if (rc)
+         server_error (_F("Unable to find a module in %s", new_staptmpdir.c_str()));
+@@ -2164,6 +2186,7 @@ handle_connection (void *arg)
+                         copy for each connection.*/
+   vector<string>     argv;
+   PRInt32            bytesRead;
++  int		     retlen;
+ 
+   /* Detatch to avoid a memory leak */
+   if(max_threads > 0)
+@@ -2213,7 +2236,13 @@ handle_connection (void *arg)
+ #endif
+ 
+   secStatus = SECFailure;
+-  snprintf(tmpdir, PATH_MAX, "%s/stap-server.XXXXXX", getenv("TMPDIR") ?: "/tmp");
++  retlen = snprintf(tmpdir, PATH_MAX, "%s/stap-server.XXXXXX", getenv("TMPDIR") ?: "/tmp");
++  if (retlen < 0 || retlen >= PATH_MAX)
++    {
++      server_error (_F("Error creating %s name", "temporary directory"));
++      tmpdir[0]=0; /* prevent /bin/rm */
++      goto cleanup;
++    }
+   rc1 = mkdtemp(tmpdir);
+   if (! rc1)
+     {
+@@ -2223,9 +2252,20 @@ handle_connection (void *arg)
+     }
+ 
+   /* Create a temporary files names and directories.  */
+-  snprintf (requestFileName, PATH_MAX, "%s/request.zip", tmpdir);
++  retlen = snprintf (requestFileName, PATH_MAX, "%s/request.zip", tmpdir);
++  if (retlen < 0 || retlen >= PATH_MAX)
++    {
++      server_error (_F("Error creating %s name", "request.zip path"));
++      goto cleanup;
++    }
++
++  retlen = snprintf (requestDirName, PATH_MAX, "%s/request", tmpdir);
++  if (retlen < 0 || retlen >= PATH_MAX)
++    {
++      server_error (_F("Error creating %s name", "request directory path"));
++      goto cleanup;
++    }
+ 
+-  snprintf (requestDirName, PATH_MAX, "%s/request", tmpdir);
+   rc = mkdir(requestDirName, 0700);
+   if (rc)
+     {
+@@ -2233,7 +2273,13 @@ handle_connection (void *arg)
+       goto cleanup;
+     }
+ 
+-  snprintf (responseDirName, PATH_MAX, "%s/response", tmpdir);
++  retlen = snprintf (responseDirName, PATH_MAX, "%s/response", tmpdir);
++  if (retlen < 0 || retlen >= PATH_MAX)
++    {
++      server_error (_F("Error creating %s name", "response directory path"));
++      goto cleanup;
++    }
++
+   rc = mkdir(responseDirName, 0700);
+   if (rc)
+     {
+@@ -2243,7 +2289,12 @@ handle_connection (void *arg)
+   // Set this early, since it gets used for errors to be returned to the client.
+   stapstderr = string(responseDirName) + "/stderr";
+ 
+-  snprintf (responseFileName, PATH_MAX, "%s/response.zip", tmpdir);
++  retlen = snprintf (responseFileName, PATH_MAX, "%s/response.zip", tmpdir);
++  if (retlen < 0 || retlen >= PATH_MAX)
++    {
++      server_error (_F("Error creating %s name", "response.zip path"));
++      goto cleanup;
++    }
+ 
+   /* Read data from the socket.
+    * If the user is requesting/requiring authentication, authenticate
+diff --git a/translate.cxx b/translate.cxx
+index 1240a80ec..4ade06fdd 100644
+--- a/translate.cxx
++++ b/translate.cxx
+@@ -7860,7 +7860,7 @@ translate_pass (systemtap_session& s)
+ 	  if (versions.size() >= 3 && s.verbose > 1)
+ 	    clog << _F("ignoring extra parts of compat version: %s", s.compatible.c_str()) << endl;
+ 	}
+-      catch (const runtime_error)
++      catch (const runtime_error&)
+ 	{
+ 	  throw SEMANTIC_ERROR(_F("parse error in compatibility version: %s", s.compatible.c_str()));
+ 	}
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index f51bd28fd8..4d887ed4d2 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -14,6 +14,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://0001-buildrun-remove-quotes-around-I-include-line.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
            file://0001-Fix-PR22551-by-updating-the-use-of-timers-for-the-4..patch \
+           file://0001-Fixes-for-gcc-8.patch \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips).*-linux'
-- 
2.16.3


