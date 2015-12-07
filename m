Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7F1DE6FF77
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 18:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tB7ISef5021453 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Dec 2015 18:29:12 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RbL6d0eyIYot
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 18:29:11 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tB7ISuDN021513
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Dec 2015 18:29:07 GMT
Message-ID: <1449512936.19730.15.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 07 Dec 2015 18:28:56 +0000
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] autoconf: Disable macro which causes excessive delays when using dash as sh
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
X-List-Received-Date: Mon, 07 Dec 2015 18:29:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

At the start of every configure script, the check for solaris 'print' causes
significant problems on a linux machine with dash as /bin/sh since it triggers
the execution of "print" which on some linux systems is a perl script which is
part of mailcap. Worse, this perl script calls "which file" and if successful
ignores the path file was found in and just runs "file" without a path. Each
execution causes PATH to be searched. In something like gettext with multiple
configure scripts, this is worth something like 30,000 syscalls of which 3,000
are execs.

Simply assuming the shell's printf function works cuts out all the fork overhead
and when parallel tasks are running, this overhead appears to be significant.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/autoconf/autoconf/performance.patch b/meta/recipes-devtools/autoconf/autoconf/performance.patch
new file mode 100644
index 0000000..e8bbe8c
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/performance.patch
@@ -0,0 +1,59 @@
+The check for solaris 'print' causes significant problems on a linux machine
+with dash as /bin/sh since it triggers the execution of "print" which on some 
+linux systems is a perl script which is part of mailcap. Worse, this perl 
+script calls "which file" and if successful ignores the path file was found 
+in and just runs "file" without a path. Each exection causes PATH to be searched.
+
+Simply assuming the shell's printf function works cuts out all the fork overhead
+and when parallel tasks are running, this overhead appears to be significant.
+
+RP
+2015/11/28
+
+Index: autoconf-2.69/lib/m4sugar/m4sh.m4
+===================================================================
+--- autoconf-2.69.orig/lib/m4sugar/m4sh.m4
++++ autoconf-2.69/lib/m4sugar/m4sh.m4
+@@ -1045,40 +1045,8 @@ m4_defun([_AS_ECHO_PREPARE],
+ [[as_nl='
+ '
+ export as_nl
+-# Printing a long string crashes Solaris 7 /usr/bin/printf.
+-as_echo='\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'
+-as_echo=$as_echo$as_echo$as_echo$as_echo$as_echo
+-as_echo=$as_echo$as_echo$as_echo$as_echo$as_echo$as_echo
+-# Prefer a ksh shell builtin over an external printf program on Solaris,
+-# but without wasting forks for bash or zsh.
+-if test -z "$BASH_VERSION$ZSH_VERSION" \
+-    && (test "X`print -r -- $as_echo`" = "X$as_echo") 2>/dev/null; then
+-  as_echo='print -r --'
+-  as_echo_n='print -rn --'
+-elif (test "X`printf %s $as_echo`" = "X$as_echo") 2>/dev/null; then
+-  as_echo='printf %s\n'
+-  as_echo_n='printf %s'
+-else
+-  if test "X`(/usr/ucb/echo -n -n $as_echo) 2>/dev/null`" = "X-n $as_echo"; then
+-    as_echo_body='eval /usr/ucb/echo -n "$][1$as_nl"'
+-    as_echo_n='/usr/ucb/echo -n'
+-  else
+-    as_echo_body='eval expr "X$][1" : "X\\(.*\\)"'
+-    as_echo_n_body='eval
+-      arg=$][1;
+-      case $arg in @%:@(
+-      *"$as_nl"*)
+-	expr "X$arg" : "X\\(.*\\)$as_nl";
+-	arg=`expr "X$arg" : ".*$as_nl\\(.*\\)"`;;
+-      esac;
+-      expr "X$arg" : "X\\(.*\\)" | tr -d "$as_nl"
+-    '
+-    export as_echo_n_body
+-    as_echo_n='sh -c $as_echo_n_body as_echo'
+-  fi
+-  export as_echo_body
+-  as_echo='sh -c $as_echo_body as_echo'
+-fi
++as_echo='printf %s\n'
++as_echo_n='printf %s'
+ ]])# _AS_ECHO_PREPARE
+ 
+ 
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.69.bb b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
index 809007f..eae47b8 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.69.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
@@ -13,6 +13,7 @@ SRC_URI += "file://autoreconf-include.patch \
             file://remove-usr-local-lib-from-m4.patch \
             file://preferbash.patch \
             file://autotest-automake-result-format.patch \
+            file://performance.patch \
            "
 
 SRC_URI[md5sum] = "82d05e03b93e45f5a39b828dc9c6c29b"



