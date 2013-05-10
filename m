Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UalEP-00086g-Tb
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 13:11:24 +0200
Received: by mail-ea0-f182.google.com with SMTP id z16so2180798ead.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2013 03:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=mG0VuEijqa07wohvbwYevcHhJSXMyvEwjIbUYaC95tc=;
	b=N5yy20JKTQtoXr/wjzSdLTQm6dFD9rTxlT7ZOng5tnNH6s08UiWThX74qaDpgx0Idl
	meYyOifwdeIUlSwWDKFFljxaZ7TGjs9y9IKlIGFwAImpIN/BwHZlxGDcihWesT77f9WV
	di7X57qV14rsxh6mrsgCSqvAIQOO3FY0isXIxcubeA0CBpEbGS/6YVxRD4t2UQ8bjs9i
	f2XX+JBOxxYKmQ3QgRXDbeFeduT9nSLjzrZoFEolyh4/QrwQPx6bgBA8DFWTJc7tHzgB
	aKDCWHgWDVfMiCRUf/dxVs9tlGujTYwJMJarYfo/0UqqgzBwA5DjmNLy6m+gKj68AznF
	SfrA==
X-Received: by 10.14.108.1 with SMTP id p1mr40262790eeg.31.1368183196598;
	Fri, 10 May 2013 03:53:16 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id n7sm2870748eeo.0.2013.05.10.03.53.15
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 10 May 2013 03:53:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2013 12:53:10 +0200
Message-Id: <1368183192-26634-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH 1/3] tcp-wrappers: Rename conflicting variable STRINGS in Makefile
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 May 2013 11:11:27 -0000
X-List-Received-Date: Fri, 10 May 2013 11:11:27 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../tcp-wrappers-7.6/rename_strings_variable.patch | 35 ++++++++++++++++++++++
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rename_strings_variable.patch

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rename_strings_variable.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rename_strings_variable.patch
new file mode 100644
index 0000000..7650600
--- /dev/null
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rename_strings_variable.patch
@@ -0,0 +1,35 @@
+STRINGS name conflicts with variable for strings tools (e.g. i586-oe-linux-strings)
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+--- tcp_wrappers_7.6/Makefile.orig	2013-04-18 23:41:58.277981740 +0200
++++ tcp_wrappers_7.6/Makefile	2013-04-18 23:42:42.513978966 +0200
+@@ -309,7 +309,7 @@
+ pyramid:
+ 	@make REAL_DAEMON_DIR=$(REAL_DAEMON_DIR) STYLE=$(STYLE) \
+ 	LIBS= RANLIB=ranlib ARFLAGS=rv AUX_OBJ="environ.o vfprintf.o" \
+-	STRINGS="-Dstrchr=index -Dstrrchr=rindex -Dmemcmp=bcmp -Dno_memcpy" \
++	STRINGS_FLAGS="-Dstrchr=index -Dstrrchr=rindex -Dmemcmp=bcmp -Dno_memcpy" \
+ 	NETGROUP="-DNETGROUP -DUSE_GETDOMAIN" TLI= all
+ 
+ # Untested.
+@@ -419,7 +419,7 @@
+ # Uncomment the following if your C library does not provide the
+ # strchr/strrchr/memcmp routines, but comes with index/rindex/bcmp.
+ #
+-#STRINGS= -Dstrchr=index -Dstrrchr=rindex -Dmemcmp=bcmp -Dno_memcpy
++#STRINGS_FLAGS= -Dstrchr=index -Dstrrchr=rindex -Dmemcmp=bcmp -Dno_memcpy
+ 
+ #################################################################
+ # System dependencies: selection of non-default object libraries.
+@@ -690,7 +690,7 @@
+ 	$(BUGS) $(SYSTYPE) $(AUTH) $(UMASK) \
+ 	-DREAL_DAEMON_DIR=\"$(REAL_DAEMON_DIR)\" $(STYLE) $(KILL_OPT) \
+ 	-DSEVERITY=$(SEVERITY) -DRFC931_TIMEOUT=$(RFC931_TIMEOUT) \
+-	$(UCHAR) $(TABLES) $(STRINGS) $(TLI) $(EXTRA_CFLAGS) $(DOT) \
++	$(UCHAR) $(TABLES) $(STRINGS_FLAGS) $(TLI) $(EXTRA_CFLAGS) $(DOT) \
+ 	$(VSYSLOG) $(HOSTNAME)
+ 
+ LIB_OBJ= hosts_access.o options.o shell_cmd.o rfc931.o eval.o \
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index ba94008..3586a35 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -39,6 +39,7 @@ SRC_URI = "ftp://ftp.porcupine.org/pub/security/tcp_wrappers_${PV}.tar.gz \
            file://socklen_t.patch \
            file://tcpdchk_libwrapped.patch \
            file://ldflags.patch \
+           file://rename_strings_variable.patch \
            \
            file://try-from.8 \
            file://safe_finger.8"
-- 
1.8.2.1



