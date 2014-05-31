Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id E8A156FD1A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 May 2014 00:12:02 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id z12so2732023wgg.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 17:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=E+jcMPw/HkDgzpK1uyzhV8IZAPwATFNUFvQH876ImtA=;
	b=Pj8teSKW3fn4pU51knxz7xIV5bq+ORZOgcPqzq08PbNhnX/YiKQC8CFPIUKkgEvzPz
	p9z/HTrYvb1VUXkz4xfptgLVpXHfferFOFqfO7vIon3EmDSi3EdrRi7p5UPKRHdLiDJG
	1Q72SiFFmP3krzq3enTjkPBa58+xMN4gvMJA2J0KLJdeLkHvModdqHEWCa3NwAwzPT3t
	bx5FaoPDp56jfinBfwiwRJsiF90DabNo1gcz1i8C+h0GtNMM5ikXiMXwYavwyWHktRyT
	iO/M8Jhj22auJmA8olOLRpYQ+nMcuUFFK9O51pU10l8xK3DIsakwinWlsFHRwQMwaYu2
	tXFQ==
X-Gm-Message-State: ALoCoQmfi6FDyRKSZt1imKvAaC2CO+Wv1p+L3hzbYneDOvGiJlAyDNRs0IvPGMSTPzh/43OtRmFc
X-Received: by 10.194.84.101 with SMTP id x5mr27151785wjy.52.1401495122949;
	Fri, 30 May 2014 17:12:02 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id c2sm13963166wja.18.2014.05.30.17.12.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 May 2014 17:12:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 May 2014 01:11:55 +0100
Message-Id: <1401495115-25542-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401495115-25542-1-git-send-email-ross.burton@intel.com>
References: <1401495115-25542-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] socat: upgrade to 1.7.2.4
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
X-List-Received-Date: Sat, 31 May 2014 00:12:08 -0000

socat manually maintains config.h.in instead of using autoheader, so exclude
autoheader from autoreconf and remove all patches that are intended to enable
use of autoheader.

The license checksum changed, because the company address changed.

Based on a upgrade by Hongxu Jia <hongxu.jia@windriver.com>, with cleanup after
noticing that config.h.in was hand-maintained.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-connectivity/socat/socat/compile.patch |  946 --------------------
 .../socat/socat/fix-cross-compiling-failed.patch   |   36 +
 .../socat/socat/fix-xxx_SHIFT-autoheader.patch     |   40 -
 .../socat/{socat_1.7.2.3.bb => socat_1.7.2.4.bb}   |   25 +-
 4 files changed, 47 insertions(+), 1000 deletions(-)
 delete mode 100644 meta/recipes-connectivity/socat/socat/compile.patch
 create mode 100644 meta/recipes-connectivity/socat/socat/fix-cross-compiling-failed.patch
 delete mode 100644 meta/recipes-connectivity/socat/socat/fix-xxx_SHIFT-autoheader.patch
 rename meta/recipes-connectivity/socat/{socat_1.7.2.3.bb => socat_1.7.2.4.bb} (61%)

diff --git a/meta/recipes-connectivity/socat/socat/compile.patch b/meta/recipes-connectivity/socat/socat/compile.patch
deleted file mode 100644
index 4d1a0b6..0000000
--- a/meta/recipes-connectivity/socat/socat/compile.patch
+++ /dev/null
@@ -1,946 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-The patch is from http://git.openembedded.org/openembedded/tree/recipes/socat/files/compile.patch
-and was rebased to socat-1.7.2.0.
-
-Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
-Fri Dec 16 17:12:17 CST 2011
-
-diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
---- socat-1.7.2.0.orig/configure.in	2011-12-04 21:34:16.000000000 +0800
-+++ socat-1.7.2.0/configure.in	2011-12-16 17:08:59.698367071 +0800
-@@ -88,7 +88,7 @@
- 
- 
- dnl Check for extra socket library (for Solaris)
--AC_CHECK_FUNC(hstrerror,  , AC_CHECK_LIB(resolv, hstrerror, [LIBS="$LIBS -lresolv"; AC_DEFINE(HAVE_HSTRERROR)]))
-+AC_CHECK_FUNC(hstrerror,  , AC_CHECK_LIB(resolv, hstrerror, [LIBS="$LIBS -lresolv"; AC_DEFINE(HAVE_HSTRERROR, [1], [STRERROR])]))
- AC_CHECK_FUNC(gethostent, , AC_CHECK_LIB(nsl, gethostent))
- AC_CHECK_FUNC(setsockopt, , AC_CHECK_LIB(socket, setsockopt))
- 
-@@ -102,7 +102,7 @@
-  [sc_cv_have_prototype_hstrerror=yes]);
-  CFLAGS="$CFLAGS1"])
- if test $sc_cv_have_prototype_hstrerror = yes; then
--   AC_DEFINE(HAVE_PROTOTYPE_HSTRERROR)
-+   AC_DEFINE(HAVE_PROTOTYPE_HSTRERROR, [1], [Has Strerror])
- fi
- AC_MSG_RESULT($sc_cv_have_prototype_hstrerror)
- 
-@@ -111,83 +111,83 @@
- AC_ARG_ENABLE(help, [  --disable-help          disable help],
- 	      [case "$enableval" in
- 	       no) AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_HELP) AC_MSG_RESULT(yes);;
-+	       *) AC_DEFINE(WITH_HELP, [1], [With help]) AC_MSG_RESULT(yes);;
- 	       esac],
--	       [AC_DEFINE(WITH_HELP) AC_MSG_RESULT(yes)])
-+	       [AC_DEFINE(WITH_HELP, [1], [With help]) AC_MSG_RESULT(yes)])
- 
- AC_MSG_CHECKING(whether to include STDIO support)
- AC_ARG_ENABLE(stdio, [  --disable-stdio         disable STDIO support],
- 	      [case "$enableval" in
- 	       no) AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_STDIO) AC_MSG_RESULT(yes);;
-+	       *) AC_DEFINE(WITH_STDIO, [1], [With stdio]) AC_MSG_RESULT(yes);;
- 	       esac],
--	       [AC_DEFINE(WITH_STDIO) AC_MSG_RESULT(yes)])
-+	       [AC_DEFINE(WITH_STDIO, [1], [With stdio]) AC_MSG_RESULT(yes)])
- 
- AC_MSG_CHECKING(whether to include FD-number support)
- AC_ARG_ENABLE(fdnum, [  --disable-fdnum         disable FD-number support],
- 	      [case "$enableval" in
- 	       no) AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_FDNUM) AC_MSG_RESULT(yes);;
-+	       *) AC_DEFINE(WITH_FDNUM, [1], [With fdnum]) AC_MSG_RESULT(yes);;
- 	       esac],
--	       [AC_DEFINE(WITH_FDNUM) AC_MSG_RESULT(yes)])
-+	       [AC_DEFINE(WITH_FDNUM, [1], [With fdnum]) AC_MSG_RESULT(yes)])
- 
- AC_MSG_CHECKING(whether to include direct file support)
- AC_ARG_ENABLE(file, [  --disable-file          disable direct file support],
- 	      [case "$enableval" in
- 	       no) AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_FILE) AC_MSG_RESULT(yes);;
-+	       *) AC_DEFINE(WITH_FILE, [1], [With file]) AC_MSG_RESULT(yes);;
- 	       esac],
--	       [AC_DEFINE(WITH_FILE) AC_MSG_RESULT(yes)])
-+	       [AC_DEFINE(WITH_FILE, [1], [With file]) AC_MSG_RESULT(yes)])
- 
- AC_MSG_CHECKING(whether to include direct create support)
- AC_ARG_ENABLE(creat, [  --disable-creat         disable direct create support],
- 	      [case "$enableval" in
- 	       no) AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_CREAT) AC_MSG_RESULT(yes);;
-+	       *) AC_DEFINE(WITH_CREAT, [1], [With creat]) AC_MSG_RESULT(yes);;
- 	       esac],
--	       [AC_DEFINE(WITH_CREAT) AC_MSG_RESULT(yes)])
-+	       [AC_DEFINE(WITH_CREAT, [1], [With creat]) AC_MSG_RESULT(yes)])
- 
- AC_MSG_CHECKING(whether to include gopen support)
- AC_ARG_ENABLE(gopen, [  --disable-gopen         disable open for UNIX socket support],
- 	      [case "$enableval" in
- 	       no) AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_GOPEN) AC_MSG_RESULT(yes);;
-+	       *) AC_DEFINE(WITH_GOPEN, [1], [With gopen]) AC_MSG_RESULT(yes);;
- 	       esac],
--	       [AC_DEFINE(WITH_GOPEN) AC_MSG_RESULT(yes)])
-+	       [AC_DEFINE(WITH_GOPEN, [1], [With gopen]) AC_MSG_RESULT(yes)])
- 
- AC_MSG_CHECKING(whether to include explicit pipe support)
- AC_ARG_ENABLE(pipe, [  --disable-pipe          disable pipe support],
- 	      [case "$enableval" in
- 	       no) AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_PIPE) AC_MSG_RESULT(yes);;
-+	       *) AC_DEFINE(WITH_PIPE, [1], [With pipe]) AC_MSG_RESULT(yes);;
- 	       esac],
--	       [AC_DEFINE(WITH_PIPE) AC_MSG_RESULT(yes)])
-+	       [AC_DEFINE(WITH_PIPE, [1], [With pipe]) AC_MSG_RESULT(yes)])
- 
- AC_MSG_CHECKING(whether to include explicit termios support)
- AC_ARG_ENABLE(termios, [  --disable-termios       disable termios support],
- 	      [case "$enableval" in
- 	       no) AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_TERMIOS) AC_MSG_RESULT(yes);;
-+	       *) AC_DEFINE(WITH_TERMIOS, [1], [With termios]) AC_MSG_RESULT(yes);;
- 	       esac],
--	       [AC_DEFINE(WITH_TERMIOS) AC_MSG_RESULT(yes)])
-+	       [AC_DEFINE(WITH_TERMIOS, [1], [With termios]) AC_MSG_RESULT(yes)])
- 
- AC_MSG_CHECKING(whether to include UNIX socket support)
- AC_ARG_ENABLE(unix, [  --disable-unix          disable UNIX domain socket support],
- 	      [case "$enableval" in
- 	       no) AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_UNIX) AC_MSG_RESULT(yes);;
-+	       *) AC_DEFINE(WITH_UNIX, [1], [With unix]) AC_MSG_RESULT(yes);;
- 	       esac],
--	       [AC_DEFINE(WITH_UNIX) AC_MSG_RESULT(yes)])
-+	       [AC_DEFINE(WITH_UNIX, [1], [With unix]) AC_MSG_RESULT(yes)])
- 
- AC_MSG_CHECKING(whether to include abstract UNIX socket support)
- AC_ARG_ENABLE(abstract_unixsocket, [  --disable-abstract-unixsocket   disable abstract UNIX domain socket support],
- 	      [case "$enableval" in
- 	       no) AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_ABSTRACT_UNIXSOCKET) AC_MSG_RESULT(yes);;
-+	       *) AC_DEFINE(WITH_ABSTRACT_UNIXSOCKET, [1], [With abstract unix socket]) AC_MSG_RESULT(yes);;
- 	       esac],
- 	      [ case "`uname`" in
- 	        Linux)
--		    AC_DEFINE(WITH_ABSTRACT_UNIXSOCKET) AC_MSG_RESULT(yes);;
-+		    AC_DEFINE(WITH_ABSTRACT_UNIXSOCKET, [1], [With abstract unix socket]) AC_MSG_RESULT(yes);;
- 		*)
- 		    AC_MSG_RESULT(no);;
- 		esac])
-@@ -196,9 +196,9 @@
- AC_ARG_ENABLE(ip4, [  --disable-ip4           disable IPv4 support],
- 	      [case "$enableval" in
- 	       no) AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_IP4) AC_MSG_RESULT(yes);;
-+	       *) AC_DEFINE(WITH_IP4, [1], [with ipv4]) AC_MSG_RESULT(yes);;
- 	       esac],
--	       [AC_DEFINE(WITH_IP4) AC_MSG_RESULT(yes)])
-+	       [AC_DEFINE(WITH_IP4, [1], [with ipv4]) AC_MSG_RESULT(yes)])
- 
- AC_MSG_CHECKING(whether to include IPv6 support)
- AC_ARG_ENABLE(ip6, [  --disable-ip6           disable IPv6 support],
-@@ -209,7 +209,7 @@
- 	      [ AC_MSG_RESULT(yes);  WITH_IP6=1 ])
- if test "$WITH_IP6"; then
-   AC_CHECK_HEADERS([netinet/ip6.h],
--    [AC_DEFINE(HAVE_NETINET_IP6_H) AC_DEFINE(WITH_IP6)],
-+    [AC_DEFINE(HAVE_NETINET_IP6_H) AC_DEFINE(WITH_IP6, [1], [with ipv6])],
-     [AC_MSG_WARN([include file netinet/ip6.h not found, disabling IP6])],
-     [AC_INCLUDES_DEFAULT
-      #ifdef HAVE_NETINET_IN_H
-@@ -242,17 +242,17 @@
- AC_ARG_ENABLE(rawip, [  --disable-rawip         disable raw IP support],
- 	      [case "$enableval" in
- 	       no) AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_RAWIP) AC_MSG_RESULT(yes);;
-+	       *) AC_DEFINE(WITH_RAWIP, [1], [With reawip]) AC_MSG_RESULT(yes);;
- 	       esac],
--	       [AC_DEFINE(WITH_RAWIP) AC_MSG_RESULT(yes)])
-+	       [AC_DEFINE(WITH_RAWIP, [1], [With rawip]) AC_MSG_RESULT(yes)])
- 
- AC_MSG_CHECKING(whether to include generic socket support)
- AC_ARG_ENABLE(rawsocket, [  --disable-genericsocket disable generic socket support],
- 	      [case "$enableval" in
- 	       no) AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_GENERICSOCKET) AC_MSG_RESULT(yes);;
-+	       *) AC_DEFINE(WITH_GENERICSOCKET, [1], [With genericsocket]) AC_MSG_RESULT(yes);;
- 	       esac],
--	       [AC_DEFINE(WITH_GENERICSOCKET) AC_MSG_RESULT(yes)])
-+	       [AC_DEFINE(WITH_GENERICSOCKET, [1], [With genericsocket]) AC_MSG_RESULT(yes)])
- AC_MSG_CHECKING(whether to include raw network interface support)
- AC_ARG_ENABLE(interface, [  --disable-interface  disable network interface support],
- 	      [case "$enableval" in
-@@ -262,35 +262,35 @@
- 	       [AC_MSG_RESULT(yes);  WITH_INTERFACE=1 ])
- if test "$WITH_INTERFACE"; then
-   AC_CHECK_HEADER(netpacket/packet.h,
--    AC_DEFINE(HAVE_NETPACKET_PACKET_H),
-+    AC_DEFINE(HAVE_NETPACKET_PACKET_H, [1], [Has packet.h]),
-     [WITH_INTERFACE=;
-      AC_MSG_WARN([include file netpacket/packet.h not found, disabling interface])])
- fi
- if test "$WITH_INTERFACE"; then
-   AC_CHECK_HEADER(netinet/if_ether.h,
--    AC_DEFINE(HAVE_NETINET_IF_ETHER_H),
-+    AC_DEFINE(HAVE_NETINET_IF_ETHER_H, [1], [Has if_ether.h]),
-     [WITH_INTERFACE=;
-      AC_MSG_WARN([include file netinet/if_ether.h not found, disabling interface])])
- fi
- if test "$WITH_INTERFACE"; then
--   AC_DEFINE(WITH_INTERFACE)
-+   AC_DEFINE(WITH_INTERFACE, [1], [Wither interface])
- fi
- 
- AC_MSG_CHECKING(whether to include TCP support)
- AC_ARG_ENABLE(tcp, [  --disable-tcp           disable TCP support],
- 	      [case "$enableval" in
- 	       no) AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_TCP) AC_MSG_RESULT(yes);;
-+	       *) AC_DEFINE(WITH_TCP, [1], [With TCP]) AC_MSG_RESULT(yes);;
- 	       esac],
--	       [AC_DEFINE(WITH_TCP) AC_MSG_RESULT(yes)])
-+	       [AC_DEFINE(WITH_TCP, [1], [With TCP]) AC_MSG_RESULT(yes)])
- 
- AC_MSG_CHECKING(whether to include UDP support)
- AC_ARG_ENABLE(udp, [  --disable-udp           disable UDP support],
- 	      [case "$enableval" in
- 	       no) AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_UDP) AC_MSG_RESULT(yes);;
-+	       *) AC_DEFINE(WITH_UDP, [1], [With UDP]) AC_MSG_RESULT(yes);;
- 	       esac],
--	       [AC_DEFINE(WITH_UDP) AC_MSG_RESULT(yes)])
-+	       [AC_DEFINE(WITH_UDP, [1], [With UDP]) AC_MSG_RESULT(yes)])
- 
- AC_MSG_CHECKING(whether to include SCTP support)
- AC_ARG_ENABLE(sctp, [  --disable-sctp           disable SCTP support],
-@@ -310,7 +310,7 @@
- [sc_cv_define_ipproto_sctp=no])])
- AC_MSG_RESULT($sc_cv_define_ipproto_sctp)
- if test $sc_cv_define_ipproto_sctp = yes; then
--   AC_DEFINE(WITH_SCTP)
-+   AC_DEFINE(WITH_SCTP, [1], [With SCTP])
- else
-    AC_MSG_WARN([IPPROTO_SCTP undefined, disabling SCTP support])
- fi
-@@ -320,65 +320,65 @@
- AC_ARG_ENABLE(listen, [  --disable-listen        disable listen support],
- 	      [case "$enableval" in
- 	       no) AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_LISTEN) AC_MSG_RESULT(yes);;
-+	       *) AC_DEFINE(WITH_LISTEN, [1], [With listen]) AC_MSG_RESULT(yes);;
- 	       esac],
--	       [AC_DEFINE(WITH_LISTEN) AC_MSG_RESULT(yes)])
-+	       [AC_DEFINE(WITH_LISTEN, [1], [With listen]) AC_MSG_RESULT(yes)])
- 
- AC_MSG_CHECKING(whether to include socks4 support)
- AC_ARG_ENABLE(socks4, [  --disable-socks4        disable socks4 support],
- 	      [case "$enableval" in
- 	       no) AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_SOCKS4) AC_MSG_RESULT(yes);;
-+	       *) AC_DEFINE(WITH_SOCKS4, [1], [With socks]) AC_MSG_RESULT(yes);;
- 	       esac],
--	       [AC_DEFINE(WITH_SOCKS4) AC_MSG_RESULT(yes)])
-+	       [AC_DEFINE(WITH_SOCKS4, [1], [With socks]) AC_MSG_RESULT(yes)])
- 
- AC_MSG_CHECKING(whether to include socks4a support)
- AC_ARG_ENABLE(socks4a, [  --disable-socks4a       disable socks4a support],
- 	      [case "$enableval" in
- 	       no) AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_SOCKS4A) AC_MSG_RESULT(yes);;
-+	       *) AC_DEFINE(WITH_SOCKS4A, [1], [With socks4a]) AC_MSG_RESULT(yes);;
- 	       esac],
--	       [AC_DEFINE(WITH_SOCKS4A) AC_MSG_RESULT(yes)])
-+	       [AC_DEFINE(WITH_SOCKS4A, [1], [With socks4a]) AC_MSG_RESULT(yes)])
- 
- AC_MSG_CHECKING(whether to include proxy connect support)
- AC_ARG_ENABLE(proxy, [  --disable-proxy         disable proxy connect support],
- 	      [case "$enableval" in
- 	       no) AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_PROXY) AC_MSG_RESULT(yes);;
-+	       *) AC_DEFINE(WITH_PROXY, [1], [With proxy]) AC_MSG_RESULT(yes);;
- 	       esac],
--	       [AC_DEFINE(WITH_PROXY) AC_MSG_RESULT(yes)])
-+	       [AC_DEFINE(WITH_PROXY, [1], [With proxy]) AC_MSG_RESULT(yes)])
- 
- AC_MSG_CHECKING(whether to include exec support)
- AC_ARG_ENABLE(exec, [  --disable-exec          disable exec support],
- 	      [case "$enableval" in
- 	       no) AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_EXEC) AC_MSG_RESULT(yes);;
-+	       *) AC_DEFINE(WITH_EXEC, [1], [With exec]) AC_MSG_RESULT(yes);;
- 	       esac],
--	       [AC_DEFINE(WITH_EXEC) AC_MSG_RESULT(yes)])
-+	       [AC_DEFINE(WITH_EXEC, [1], [With exec]) AC_MSG_RESULT(yes)])
- 
- AC_MSG_CHECKING([whether to include system (shell) support])
- AC_ARG_ENABLE(system, [  --disable-system        disable system (shell) support],
- 	      [case "$enableval" in
- 	       no) AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_SYSTEM) AC_MSG_RESULT(yes);;
-+	       *) AC_DEFINE(WITH_SYSTEM, [1], [With system]) AC_MSG_RESULT(yes);;
- 	       esac],
--	       [AC_DEFINE(WITH_SYSTEM) AC_MSG_RESULT(yes)])
-+	       [AC_DEFINE(WITH_SYSTEM, [1], [With system]) AC_MSG_RESULT(yes)])
- 
- AC_MSG_CHECKING(whether to include pty address support)
- AC_ARG_ENABLE(pty, [  --disable-pty           disable pty support],
- 	      [case "$enableval" in
- 	       no) AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_PTY) AC_MSG_RESULT(yes);;
-+	       *) AC_DEFINE(WITH_PTY, [1], [With pty]) AC_MSG_RESULT(yes);;
- 	       esac],
--	       [AC_DEFINE(WITH_PTY) AC_MSG_RESULT(yes)])
-+	       [AC_DEFINE(WITH_PTY, [1], [With pty]) AC_MSG_RESULT(yes)])
- 
- AC_MSG_CHECKING(whether to include ext2 fs attributes support)
- AC_ARG_ENABLE(ext2, [  --disable-ext2          disable ext2 fs attributes support],
- 	      [case "$enableval" in
- 	       no) AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_EXT2) AC_MSG_RESULT(yes);;
-+	       *) AC_DEFINE(WITH_EXT2, [1], [With ext2]) AC_MSG_RESULT(yes);;
- 	       esac],
--	       [AC_DEFINE(WITH_EXT2) AC_MSG_RESULT(yes)])
-+	       [AC_DEFINE(WITH_EXT2, [1], [With ext2]) AC_MSG_RESULT(yes)])
- 
- AC_MSG_CHECKING(whether to include readline support)
- AC_ARG_ENABLE(readline, [  --disable-readline      disable readline support],
-@@ -423,10 +423,10 @@
-     
-     if test -n "$sc_usable_readline_found"; then
-       AC_MSG_RESULT(yes)
--      AC_DEFINE(HAVE_READLINE_READLINE_H,1)
--      AC_DEFINE(HAVE_READLINE_HISTORY_H,1)
--      AC_DEFINE(HAVE_LIBREADLINE,1)
--      AC_DEFINE(WITH_READLINE,1)
-+      AC_DEFINE(HAVE_READLINE_READLINE_H,1, [have readline])
-+      AC_DEFINE(HAVE_READLINE_HISTORY_H,1, [have history])
-+      AC_DEFINE(HAVE_LIBREADLINE,1, [have readline])
-+      AC_DEFINE(WITH_READLINE,1, [with readline])
-       break
-     else
-       AC_MSG_RESULT(no)
-@@ -469,7 +469,7 @@
-       done])
-   ])
-   if test "$sc_cv_have_openssl_ssl_h" = "yes"; then
--    AC_DEFINE(HAVE_OPENSSL_SSL_H)
-+    AC_DEFINE(HAVE_OPENSSL_SSL_H, [1], [have openssl.h])
-   fi
-   AC_MSG_NOTICE(checked for openssl/ssl.h... $sc_cv_have_openssl_ssl_h)
- fi	# end checking for openssl/ssl.h
-@@ -501,7 +501,7 @@
-     ]
-   )
-   if test "$sc_cv_have_libssl" = 'yes'; then
--    AC_DEFINE(HAVE_LIBSSL)
-+    AC_DEFINE(HAVE_LIBSSL, [1], [libssl])
-   fi
-   AC_MSG_RESULT($sc_cv_have_libssl)
- fi
-@@ -529,7 +529,7 @@
- #fi
- if test -n "$WITH_OPENSSL"; then
-   if test "$sc_cv_have_openssl_ssl_h" = "yes" -a "$sc_cv_have_libssl" = "yes"; then
--    AC_DEFINE(WITH_OPENSSL)
-+    AC_DEFINE(WITH_OPENSSL, [1], [With openssl])
-   else
-     AC_MSG_WARN([not all components of OpenSSL found, disabling it]);
-   fi
-@@ -577,7 +577,7 @@
-     )]
-   )
-   if test "$sv_cv_have_openssl_fips_h" = "yes"; then
--    AC_DEFINE(HAVE_OPENSSL_FIPS_H)
-+    AC_DEFINE(HAVE_OPENSSL_FIPS_H, [1], [OpenSSL fips.h])
-   fi
-   AC_MSG_NOTICE(checked for openssl/fips.h... $sc_cv_have_openssl_ssl_h)
- fi
-@@ -608,15 +608,15 @@
-     ]
-   )
-   if test "$sc_cv_have_libcrypto" = 'yes'; then
--    AC_DEFINE(HAVE_LIBCRYPTO)
-+    AC_DEFINE(HAVE_LIBCRYPTO, [1], [libcrypto])
-   fi
-   AC_MSG_RESULT($sc_cv_have_libcrypto)
- fi
- 
- if test -n "$WITH_FIPS"; then
-   if test "$sc_cv_have_openssl_fips_h" = 'yes' -a "$sc_cv_have_libcrypto" = 'yes'; then
--    AC_DEFINE(WITH_FIPS)
--    AC_DEFINE(OPENSSL_FIPS)
-+    AC_DEFINE(WITH_FIPS, [1], [With fips])
-+    AC_DEFINE(OPENSSL_FIPS, [1], [openssl fips])
-   else
-     AC_MSG_WARN([not all components of OpenSSL FIPS found, disabling it]);
-   fi
-@@ -637,17 +637,17 @@
- fi
- #
- if test -n "$WITH_TUN"; then
--  AC_DEFINE(WITH_TUN)
-+  AC_DEFINE(WITH_TUN, [1], [with tun])
- fi
- 
- AC_MSG_CHECKING(whether to include system call tracing)
- AC_ARG_ENABLE(sycls, [  --disable-sycls         disable system call tracing],
- 	      [case "$enableval" in
- 	       no) SYCLS=""; SSLCLS=""; AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_SYCLS)
-+	       *) AC_DEFINE(WITH_SYCLS, [1], [syscls])
- 		 SYCLS="sycls.c"; SSLCLS="sslcls.c"; AC_MSG_RESULT(yes);;
- 	       esac],
--	       [AC_DEFINE(WITH_SYCLS)
-+	       [AC_DEFINE(WITH_SYCLS, [1], [syscls])
- 		 SYCLS="sycls.c"; SSLCLS="sslcls.c"; AC_MSG_RESULT(yes)])
- AC_SUBST(SYCLS)
- AC_SUBST(SSLCLS)
-@@ -656,31 +656,31 @@
- AC_ARG_ENABLE(filan, [  --disable-filan         disable file descriptor analyzer],
- 	      [case "$enableval" in
- 	       no) FILAN=""; AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_FILAN) FILAN="filan.c"; AC_MSG_RESULT(yes);;
-+	       *) AC_DEFINE(WITH_FILAN, [1], [filan]) FILAN="filan.c"; AC_MSG_RESULT(yes);;
- 	       esac],
--	       [AC_DEFINE(WITH_FILAN) FILAN="filan.c"; AC_MSG_RESULT(yes)])
-+	       [AC_DEFINE(WITH_FILAN, [1], [filan]) FILAN="filan.c"; AC_MSG_RESULT(yes)])
- AC_SUBST(FILAN)
- 
- AC_MSG_CHECKING(whether to include retry support)
- AC_ARG_ENABLE(retry, [  --disable-retry         disable retry support],
- 	      [case "$enableval" in
- 	       no) AC_MSG_RESULT(no);;
--	       *) AC_DEFINE(WITH_RETRY) AC_MSG_RESULT(yes);;
-+	       *) AC_DEFINE(WITH_RETRY, [1], [retry]) AC_MSG_RESULT(yes);;
- 	       esac],
--	       [AC_DEFINE(WITH_RETRY) AC_MSG_RESULT(yes)])
-+	       [AC_DEFINE(WITH_RETRY, [1], [retry]) AC_MSG_RESULT(yes)])
- 
- AC_MSG_CHECKING(included message level)
- AC_ARG_ENABLE(msglevel, [  --enable-msglevel=N     set max verbosity to debug,info,notice,warn,error,fatal],
- 	      [case "$enableval" in
--	       debug) AC_DEFINE(WITH_MSGLEVEL,0) AC_MSG_RESULT(debug);;
--	       info)  AC_DEFINE(WITH_MSGLEVEL,1) AC_MSG_RESULT(info);;
--	       notice) AC_DEFINE(WITH_MSGLEVEL,2) AC_MSG_RESULT(notice);;
--	       warn) AC_DEFINE(WITH_MSGLEVEL,3) AC_MSG_RESULT(warn);;
--	       error) AC_DEFINE(WITH_MSGLEVEL,4) AC_MSG_RESULT(error);;
--	       fatal) AC_DEFINE(WITH_MSGLEVEL,5) AC_MSG_RESULT(fatal);;
--	       *) AC_DEFINE(WITH_MSGLEVEL,0) AC_MSG_RESULT(debug);;
-+	       debug) AC_DEFINE(WITH_MSGLEVEL,0, [msglevel]) AC_MSG_RESULT(debug);;
-+	       info)  AC_DEFINE(WITH_MSGLEVEL,1, [msglevel]) AC_MSG_RESULT(info);;
-+	       notice) AC_DEFINE(WITH_MSGLEVEL,2, [msglevel]) AC_MSG_RESULT(notice);;
-+	       warn) AC_DEFINE(WITH_MSGLEVEL,3, [msglevel]) AC_MSG_RESULT(warn);;
-+	       error) AC_DEFINE(WITH_MSGLEVEL,4, [msglevel]) AC_MSG_RESULT(error);;
-+	       fatal) AC_DEFINE(WITH_MSGLEVEL,5, [msglevel]) AC_MSG_RESULT(fatal);;
-+	       *) AC_DEFINE(WITH_MSGLEVEL,0, [msglevel]) AC_MSG_RESULT(debug);;
- 	       esac],
--	       [AC_DEFINE(WITH_MSGLEVEL,0) AC_MSG_RESULT(debug)])
-+	       [AC_DEFINE(WITH_MSGLEVEL,0, [msglevel]) AC_MSG_RESULT(debug)])
- 
- #AC_SUBST(V_INCL)
- 
-@@ -697,7 +697,7 @@
- AC_HEADER_TIME
- 
- dnl Check for extra realtime library (for Solaris)
--AC_CHECK_FUNC(nanosleep, AC_DEFINE(HAVE_NANOSLEEP), AC_CHECK_LIB(rt, nanosleep, [LIBS="-lrt $LIBS"; AC_DEFINE(HAVE_NANOSLEEP)]))
-+AC_CHECK_FUNC(nanosleep, AC_DEFINE(HAVE_NANOSLEEP, [1], [have nanosleep]), AC_CHECK_LIB(rt, nanosleep, [LIBS="-lrt $LIBS"; AC_DEFINE(HAVE_NANOSLEEP, [1], [have nanosleep])]))
- #AC_CHECK_FUNC(nanosleep, , AC_CHECK_LIB(rt, nanosleep))
- 
- dnl Checks for library functions.
-@@ -719,7 +719,7 @@
- [sc_cv_type_longlong=yes],
- [sc_cv_type_longlong=no])])
- if test $sc_cv_type_longlong = yes; then
--   AC_DEFINE(HAVE_TYPE_LONGLONG)
-+   AC_DEFINE(HAVE_TYPE_LONGLONG, [1], [have type long long])
- fi
- AC_MSG_RESULT($sc_cv_type_longlong)
- 
-@@ -735,7 +735,7 @@
- [sc_cv_type_socklen=yes],
- [sc_cv_type_socklen=no])])
- if test $sc_cv_type_socklen = yes; then
--   AC_DEFINE(HAVE_TYPE_SOCKLEN)
-+   AC_DEFINE(HAVE_TYPE_SOCKLEN, [1], [Has Socklen])
- fi
- AC_MSG_RESULT($sc_cv_type_socklen)
- 
-@@ -745,7 +745,7 @@
- [sc_cv_type_stat64=yes],
- [sc_cv_type_stat64=no])])
- if test $sc_cv_type_stat64 = yes; then
--   AC_DEFINE(HAVE_TYPE_STAT64)
-+   AC_DEFINE(HAVE_TYPE_STAT64, [1], [Has stat64])
- fi
- AC_MSG_RESULT($sc_cv_type_stat64)
- 
-@@ -755,7 +755,7 @@
- [sc_cv_type_off64=yes],
- [sc_cv_type_off64=no])])
- if test $sc_cv_type_off64 = yes; then
--   AC_DEFINE(HAVE_TYPE_OFF64)
-+   AC_DEFINE(HAVE_TYPE_OFF64, [1], [have off64])
- fi
- AC_MSG_RESULT($sc_cv_type_off64)
- 
-@@ -765,7 +765,7 @@
- [sc_cv_type_sighandler=yes],
- [sc_cv_type_sighandler=no])])
- if test $sc_cv_type_sighandler = yes; then
--   AC_DEFINE(HAVE_TYPE_SIGHANDLER)
-+   AC_DEFINE(HAVE_TYPE_SIGHANDLER, [1], [have type sighandler])
- fi
- AC_MSG_RESULT($sc_cv_type_socklen)
- 
-@@ -783,7 +783,7 @@
- [sc_cv_type_uint8=yes],
- [sc_cv_type_uint8=no])])
- if test $sc_cv_type_uint8 = yes; then
--   AC_DEFINE(HAVE_TYPE_UINT8)
-+   AC_DEFINE(HAVE_TYPE_UINT8, [1], [have uint8])
- fi
- AC_MSG_RESULT($sc_cv_type_uint8)
- 
-@@ -801,7 +801,7 @@
- [sc_cv_type_uint16=yes],
- [sc_cv_type_uint16=no])])
- if test $sc_cv_type_uint16 = yes; then
--   AC_DEFINE(HAVE_TYPE_UINT16)
-+   AC_DEFINE(HAVE_TYPE_UINT16, [1], [have uint16t])
- fi
- AC_MSG_RESULT($sc_cv_type_uint16)
- 
-@@ -819,7 +819,7 @@
- [sc_cv_type_uint32=yes],
- [sc_cv_type_uint32=no])])
- if test $sc_cv_type_uint32 = yes; then
--   AC_DEFINE(HAVE_TYPE_UINT32)
-+   AC_DEFINE(HAVE_TYPE_UINT32, [1], [have uint32])
- fi
- AC_MSG_RESULT($sc_cv_type_uint32)
- 
-@@ -837,7 +837,7 @@
- [sc_cv_type_uint64=yes],
- [sc_cv_type_uint64=no])])
- if test $sc_cv_type_uint64 = yes; then
--   AC_DEFINE(HAVE_TYPE_UINT64)
-+   AC_DEFINE(HAVE_TYPE_UINT64, [1], [have uint64] )
- fi
- AC_MSG_RESULT($sc_cv_type_uint64)
- 
-@@ -859,7 +859,7 @@
- #include <sys/select.h>
- #endif],
- [fd_set s; s.fds_bits[0]=0;],
--[AC_MSG_RESULT(yes); AC_DEFINE(HAVE_FDS_BITS)],
-+[AC_MSG_RESULT(yes); AC_DEFINE(HAVE_FDS_BITS, [1], [have fds bits])],
- [AC_MSG_RESULT(no);])
- 
- AC_MSG_CHECKING(for sa_family_t)
-@@ -870,7 +870,7 @@
- [sc_cv_type_sa_family_t=yes],
- [sc_cv_type_sa_family_t=no])])
- if test $sc_cv_type_sa_family_t = yes; then
--   AC_DEFINE(HAVE_TYPE_SA_FAMILY_T)
-+   AC_DEFINE(HAVE_TYPE_SA_FAMILY_T, [1], [have sa family_t type])
- fi
- AC_MSG_RESULT($sc_cv_type_sa_family_t)
- 
-@@ -880,7 +880,7 @@
- [sc_cv_struct_sigaction_sa_sigaction=yes],
- [sc_cv_struct_sigaction_sa_sigaction=no])])
- if test $sc_cv_struct_sigaction_sa_sigaction = yes; then
--   AC_DEFINE(HAVE_STRUCT_SIGACTION_SA_SIGACTION)
-+   AC_DEFINE(HAVE_STRUCT_SIGACTION_SA_SIGACTION, [1], [sigaction])
- fi
- AC_MSG_RESULT($sc_cv_struct_sigaction_sa_sigaction)
- 
-@@ -888,11 +888,11 @@
- AC_MSG_CHECKING(for termios.c_ispeed)
- AC_CACHE_VAL(sc_cv_termios_ispeed,
- [AC_TRY_COMPILE([#include <termios.h>],
--[struct termios t; t.c_ispeed=0;],
-+[struct termios t; t.c_ispeed=ISPEED_OFFSET; t.c_ospeed=OSPEED_OFFSET;],
- [sc_cv_termios_ispeed=yes],
- [sc_cv_termios_ispeed=no])])
- if test $sc_cv_termios_ispeed = yes; then
--   AC_DEFINE(HAVE_TERMIOS_ISPEED)
-+   AC_DEFINE(HAVE_TERMIOS_ISPEED, [1], [have ispeed])
- fi
- AC_MSG_RESULT($sc_cv_termios_ispeed)
- 
-@@ -923,7 +923,7 @@
- LIBS="$LIBS1"
- AC_MSG_RESULT($ac_cv_ispeed_offset)
-  if test $ac_cv_ispeed_offset -ge 0; then
--   AC_DEFINE_UNQUOTED(ISPEED_OFFSET, $ac_cv_ispeed_offset)
-+   AC_DEFINE_UNQUOTED(ISPEED_OFFSET, $ac_cv_ispeed_offset, [have ispeed])
-  fi
- fi
- 
-@@ -942,7 +942,7 @@
-  )]
- )])
- if test $ac_cv_svid3 = yes; then
--  AC_DEFINE(_SVID3)
-+  AC_DEFINE(_SVID3, [1], [svid3])
- fi
- AC_MSG_RESULT($ac_cv_svid3)
- 
-@@ -957,7 +957,7 @@
- [sc_cv_struct_timespec=yes],
- [sc_cv_struct_timespec=no])])
- if test $sc_cv_struct_timespec = yes; then
--   AC_DEFINE(HAVE_STRUCT_TIMESPEC)
-+   AC_DEFINE(HAVE_STRUCT_TIMESPEC, [1], [struct timespec])
- fi
- AC_MSG_RESULT($sc_cv_struct_timespec)
- 
-@@ -970,7 +970,7 @@
- [sc_cv_struct_linger=yes],
- [sc_cv_struct_linger=no])])
- if test $sc_cv_struct_linger = yes; then
--   AC_DEFINE(HAVE_STRUCT_LINGER)
-+   AC_DEFINE(HAVE_STRUCT_LINGER, [1], [struct linger])
- fi
- AC_MSG_RESULT($sc_cv_struct_linger)
- 
-@@ -984,7 +984,7 @@
- [sc_cv_struct_ip_mreq=yes],
- [sc_cv_struct_ip_mreq=no])])
- if test $sc_cv_struct_ip_mreq = yes; then
--   AC_DEFINE(HAVE_STRUCT_IP_MREQ)
-+   AC_DEFINE(HAVE_STRUCT_IP_MREQ, [1], [have struct ip mreq])
- fi
- AC_MSG_RESULT($sc_cv_struct_ip_mreq)
- 
-@@ -997,7 +997,7 @@
- [sc_cv_struct_ip_mreqn=yes],
- [sc_cv_struct_ip_mreqn=no])])
- if test $sc_cv_struct_ip_mreqn = yes; then
--   AC_DEFINE(HAVE_STRUCT_IP_MREQN)
-+   AC_DEFINE(HAVE_STRUCT_IP_MREQN, [1], [have struct ip mreqn])
- fi
- AC_MSG_RESULT($sc_cv_struct_ip_mreqn)
- 
-@@ -1010,7 +1010,7 @@
- [sc_cv_struct_ipv6_mreq=yes],
- [sc_cv_struct_ipv6_mreq=no])])
- if test $sc_cv_struct_ipv6_mreq = yes; then
--   AC_DEFINE(HAVE_STRUCT_IPV6_MREQ)
-+   AC_DEFINE(HAVE_STRUCT_IPV6_MREQ, [1], [have struct ipv5 mreq])
- fi
- AC_MSG_RESULT($sc_cv_struct_ipv6_mreq)
- 
-@@ -1024,7 +1024,7 @@
- [sc_cv_struct_ifreq=yes],
- [sc_cv_struct_ifreq=no])])
- if test $sc_cv_struct_ifreq = yes; then
--   AC_DEFINE(HAVE_STRUCT_IFREQ)
-+   AC_DEFINE(HAVE_STRUCT_IFREQ, [1], [have struct ifreq])
- fi
- AC_MSG_RESULT($sc_cv_struct_ifreq)
- 
-@@ -1039,7 +1039,7 @@
- [sc_cv_struct_ifreq_ifr_index=yes],
- [sc_cv_struct_ifreq_ifr_index=no])])
- if test $sc_cv_struct_ifreq_ifr_index = yes; then
--   AC_DEFINE(HAVE_STRUCT_IFREQ_IFR_INDEX)
-+   AC_DEFINE(HAVE_STRUCT_IFREQ_IFR_INDEX, [1], [have struct ifreq ifr])
- fi
- AC_MSG_RESULT($sc_cv_struct_ifreq_ifr_index)
- 
-@@ -1054,7 +1054,7 @@
- [sc_cv_struct_ifreq_ifr_ifindex=yes],
- [sc_cv_struct_ifreq_ifr_ifindex=no])])
- if test $sc_cv_struct_ifreq_ifr_ifindex = yes; then
--   AC_DEFINE(HAVE_STRUCT_IFREQ_IFR_IFINDEX)
-+   AC_DEFINE(HAVE_STRUCT_IFREQ_IFR_IFINDEX, [1], [have struct ifreq ifindex])
- fi
- AC_MSG_RESULT($sc_cv_struct_ifreq_ifr_ifindex)
- 
-@@ -1069,7 +1069,7 @@
- [sc_cv_struct_sockaddr_salen=yes],
- [sc_cv_struct_sockaddr_salen=no])])
- if test $sc_cv_struct_sockaddr_salen = yes; then
--   AC_DEFINE(HAVE_STRUCT_SOCKADDR_SALEN)
-+   AC_DEFINE(HAVE_STRUCT_SOCKADDR_SALEN, [1], [sockaddr salen])
- fi
- AC_MSG_RESULT($sc_cv_struct_sockaddr_salen)
- 
-@@ -1080,31 +1080,31 @@
- #include <netinet/in.h>],
- [struct sockaddr_in6 sa6;sa6.sin6_addr.s6_addr[0]=0;],
- [AC_MSG_RESULT(s6_addr);
-- AC_DEFINE(HAVE_IP6_SOCKADDR, 0)],
-+ AC_DEFINE(HAVE_IP6_SOCKADDR, 0, [ip6 sockaddr])],
- [AC_TRY_COMPILE([#include <sys/types.h>
- #include <netinet/in.h>],
-  [struct sockaddr_in6 sa6;sa6.sin6_addr.u6_addr.u6_addr16[0]=0;],
-  [AC_MSG_RESULT(u6_addr.u6_addr16);
--  AC_DEFINE(HAVE_IP6_SOCKADDR, 1)],
-+  AC_DEFINE(HAVE_IP6_SOCKADDR, 1, [ip6 sockaddr])],
-  [AC_TRY_COMPILE([#include <sys/types.h>
- #include <netinet/in.h>],
-   [struct sockaddr_in6 sa6;sa6.sin6_addr.u6_addr16[0]=0;],
--  [AC_MSG_RESULT(u6_addr16); AC_DEFINE(HAVE_IP6_SOCKADDR, 2)],
-+  [AC_MSG_RESULT(u6_addr16); AC_DEFINE(HAVE_IP6_SOCKADDR, 2, [ip6 sockaddr])],
-   [AC_TRY_COMPILE([#include <sys/types.h>
- #include <netinet/in.h>],
-    [struct sockaddr_in6 sa6;sa6.sin6_addr.in6_u.u6_addr16[0]=0;],
-    [AC_MSG_RESULT(in6_u.u6_addr16);
--    AC_DEFINE(HAVE_IP6_SOCKADDR, 3)],
-+    AC_DEFINE(HAVE_IP6_SOCKADDR, 3, [ip6 sockaddr])],
-    [AC_TRY_COMPILE([#include <sys/types.h>
- #include <netinet/in.h>],
-     [struct sockaddr_in6 sa6;sa6.sin6_addr._S6_un._S6_u32[0]=0;],
-     [AC_MSG_RESULT(_S6_un._S6_u32);
--     AC_DEFINE(HAVE_IP6_SOCKADDR, 4)],
-+     AC_DEFINE(HAVE_IP6_SOCKADDR, 4, [ip6 sockaddr])],
-     [AC_TRY_COMPILE([#include <sys/types.h>
- #include <netinet/in.h>],
-      [struct sockaddr_in6 sa6;sa6.sin6_addr.__u6_addr.__u6_addr32[0]=0;],
-      [AC_MSG_RESULT(__u6_addr.__u6_addr32);
--      AC_DEFINE(HAVE_IP6_SOCKADDR, 5)],
-+      AC_DEFINE(HAVE_IP6_SOCKADDR, 5, [ip6 sockaddr])],
- 
-     [AC_MSG_RESULT([none or unknown])]
- )])])])])])
-@@ -1116,7 +1116,7 @@
- [sc_cv_struct_iovec=yes],
- [sc_cv_struct_iovec=no])])
- if test $sc_cv_struct_iovec = yes; then
--   AC_DEFINE(HAVE_STRUCT_IOVEC)
-+   AC_DEFINE(HAVE_STRUCT_IOVEC, [1], [have struct iovec])
- fi
- AC_MSG_RESULT($sc_cv_struct_iovec)
- 
-@@ -1129,7 +1129,7 @@
- [sc_cv_struct_msghdr_msgcontrol=yes],
- [sc_cv_struct_msghdr_msgcontrol=no])])
- if test $sc_cv_struct_msghdr_msgcontrol = yes; then
--   AC_DEFINE(HAVE_STRUCT_MSGHDR_MSGCONTROL)
-+   AC_DEFINE(HAVE_STRUCT_MSGHDR_MSGCONTROL, [1], [have struct msgcontrol])
- fi
- AC_MSG_RESULT($sc_cv_struct_msghdr_msgcontrol)
- 
-@@ -1142,7 +1142,7 @@
- [sc_cv_struct_msghdr_msgcontrollen=yes],
- [sc_cv_struct_msghdr_msgcontrollen=no])])
- if test $sc_cv_struct_msghdr_msgcontrollen = yes; then
--   AC_DEFINE(HAVE_STRUCT_MSGHDR_MSGCONTROLLEN)
-+   AC_DEFINE(HAVE_STRUCT_MSGHDR_MSGCONTROLLEN, [1], [have struct msghdr msgcontrollen])
- fi
- AC_MSG_RESULT($sc_cv_struct_msghdr_msgcontrollen)
- 
-@@ -1155,7 +1155,7 @@
- [sc_cv_struct_msghdr_msgflags=yes],
- [sc_cv_struct_msghdr_msgflags=no])])
- if test $sc_cv_struct_msghdr_msgflags = yes; then
--   AC_DEFINE(HAVE_STRUCT_MSGHDR_MSGFLAGS)
-+   AC_DEFINE(HAVE_STRUCT_MSGHDR_MSGFLAGS, [1], [msgflags])
- fi
- AC_MSG_RESULT($sc_cv_struct_msghdr_msgflags)
- 
-@@ -1168,7 +1168,7 @@
- [sc_cv_struct_cmsghdr=yes],
- [sc_cv_struct_cmsghdr=no])])
- if test $sc_cv_struct_cmsghdr = yes; then
--   AC_DEFINE(HAVE_STRUCT_CMSGHDR)
-+   AC_DEFINE(HAVE_STRUCT_CMSGHDR, [1], [have cmshdr])
- fi
- AC_MSG_RESULT($sc_cv_struct_cmsghdr)
- 
-@@ -1181,7 +1181,7 @@
- [sc_cv_struct_in_pktinfo=yes],
- [sc_cv_struct_in_pktinfo=no])])
- if test $sc_cv_struct_in_pktinfo = yes; then
--   AC_DEFINE(HAVE_STRUCT_IN_PKTINFO)
-+   AC_DEFINE(HAVE_STRUCT_IN_PKTINFO, [1], [pktinfo])
- fi
- AC_MSG_RESULT($sc_cv_struct_in_pktinfo)
- 
-@@ -1211,7 +1211,7 @@
- [sc_cv_struct_ip_ip_hl=yes],
- [sc_cv_struct_ip_ip_hl=no])])
- if test $sc_cv_struct_ip_ip_hl = yes; then
--   AC_DEFINE(HAVE_STRUCT_IP_IP_HL)
-+   AC_DEFINE(HAVE_STRUCT_IP_IP_HL, [1], [foo])
- fi
- AC_MSG_RESULT($sc_cv_struct_ip_ip_hl)
- 
-@@ -1219,19 +1219,19 @@
- dnl Library function checks
- 
- dnl Check sigaction()
--AC_CHECK_FUNC(sigaction, AC_DEFINE(HAVE_SIGACTION))
-+AC_CHECK_FUNC(sigaction, AC_DEFINE(HAVE_SIGACTION, [1], [foo]))
- 
- dnl Check for 64bit versions of system calls
--AC_CHECK_FUNC(stat64, AC_DEFINE(HAVE_STAT64))
--AC_CHECK_FUNC(fstat64, AC_DEFINE(HAVE_FSTAT64))
--AC_CHECK_FUNC(lstat64, AC_DEFINE(HAVE_LSTAT64))
--AC_CHECK_FUNC(lseek64, AC_DEFINE(HAVE_LSEEK64))
--AC_CHECK_FUNC(truncate64, AC_DEFINE(HAVE_TRUNCATE64))
--AC_CHECK_FUNC(ftruncate64, AC_DEFINE(HAVE_FTRUNCATE64))
--
--AC_CHECK_FUNC(strtoll, AC_DEFINE(HAVE_STRTOLL))
--AC_CHECK_FUNC(hstrerror, AC_DEFINE(HAVE_HSTRERROR))
--AC_CHECK_FUNC(inet_ntop, AC_DEFINE(HAVE_INET_NTOP))
-+AC_CHECK_FUNC(stat64, AC_DEFINE(HAVE_STAT64, [1], [foo]))
-+AC_CHECK_FUNC(fstat64, AC_DEFINE(HAVE_FSTAT64, [1], [foo]))
-+AC_CHECK_FUNC(lstat64, AC_DEFINE(HAVE_LSTAT64, [1], [foo]))
-+AC_CHECK_FUNC(lseek64, AC_DEFINE(HAVE_LSEEK64, [1], [foo]))
-+AC_CHECK_FUNC(truncate64, AC_DEFINE(HAVE_TRUNCATE64, [1], [foo]))
-+AC_CHECK_FUNC(ftruncate64, AC_DEFINE(HAVE_FTRUNCATE64, [1], [foo]))
-+
-+AC_CHECK_FUNC(strtoll, AC_DEFINE(HAVE_STRTOLL, [1], [foo]))
-+AC_CHECK_FUNC(hstrerror, AC_DEFINE(HAVE_HSTRERROR, [1], [foo]))
-+AC_CHECK_FUNC(inet_ntop, AC_DEFINE(HAVE_INET_NTOP, [1], [foo]))
- 
- #if test "$ac_cv_func_hstrerror" = "yes"; then
- #  AC_MSG_CHECKING(if _XOPEN_SOURCE_EXTENDED is helpful)
-@@ -1254,25 +1254,26 @@
- 
- dnl Search for openpty()
- # MacOS
--AC_CHECK_FUNC(openpty, AC_DEFINE(HAVE_OPENPTY))
-+AC_CHECK_FUNC(openpty, AC_DEFINE(HAVE_OPENPTY, [1], [foo]))
- # AIX
- AC_CHECK_LIB(bsd, openpty,
--  [LIBS="-lbsd $LIBS"; AC_DEFINE(HAVE_OPENPTY)])
-+  [LIBS="-lbsd $LIBS"; AC_DEFINE(HAVE_OPENPTY, [1], [foo])])
- # Linux 2.4
- AC_CHECK_LIB(util, openpty,
--  [LIBS="-lutil $LIBS"; AC_DEFINE(HAVE_OPENPTY)])
-+  [LIBS="-lutil $LIBS"; AC_DEFINE(HAVE_OPENPTY, [1], [foo])])
-+
- 
- dnl Search for flock()
- # with Linux it's in libc, with AIX in libbsd
--AC_CHECK_FUNC(flock, AC_DEFINE(HAVE_FLOCK),
-+AC_CHECK_FUNC(flock, AC_DEFINE(HAVE_FLOCK, [1], [have flock]),
- 	AC_CHECK_LIB(bsd, flock, [LIBS="-lbsd $LIBS"]))
- 
- dnl Search for setenv()
--AC_CHECK_FUNC(setenv, AC_DEFINE(HAVE_SETENV),
-+AC_CHECK_FUNC(setenv, AC_DEFINE(HAVE_SETENV, [1], [have setenv]),
- 	AC_CHECK_LIB(isode, setenv, [LIBS="-lisode $LIBS"]))
- 
- dnl Search for unsetenv()
--AC_CHECK_FUNC(unsetenv, AC_DEFINE(HAVE_UNSETENV))
-+AC_CHECK_FUNC(unsetenv, AC_DEFINE(HAVE_UNSETENV, [1], [have unsetenv]))
- 
- dnl Search for SSLv2_client_method, SSLv2_server_method
- AC_CHECK_FUNC(SSLv3_client_method, AC_DEFINE(HAVE_SSLv3_client_method), AC_CHECK_LIB(crypt, SSLv3_client_method, [LIBS=-lcrypt $LIBS]))
-@@ -1295,7 +1296,7 @@
- [ac_cv_have_z_modifier=no],
- [ac_cv_have_z_modifier=no])])
- if test $ac_cv_have_z_modifier = yes; then
--   AC_DEFINE(HAVE_FORMAT_Z)
-+   AC_DEFINE(HAVE_FORMAT_Z, [1], [have format z])
- fi
- AC_MSG_RESULT($ac_cv_have_z_modifier)
- 
-@@ -1334,7 +1335,8 @@
-  [$2=-1]
- )
-  LIBS="$LIBS1"])
--AC_DEFINE_UNQUOTED($1_SHIFT, ${$2})
-+SHIFT_NAME="$1"_SHIFT
-+AC_DEFINE_UNQUOTED($SHIFT_NAME, ${$2}, [foo])
- if test "$2" = -1; then
- AC_MSG_WARN(please determine $1_SHIFT manually)
- fi
-@@ -1374,7 +1376,7 @@
-         [$4="0 /* unknown, taking default */"
- ]) ]) ]) ]) ]) ]) ]) ])
-  CFLAGS="$CFLAGS1" ])
--AC_DEFINE_UNQUOTED($3, ${$4})
-+AC_DEFINE_UNQUOTED($3, ${$4}, [foo])
- ])
- 
- dnl find what physical type (basic C type) describes the given struct or union
-@@ -1406,7 +1408,7 @@
-        [$5="0 /* unknown, taking default */"
- ]) ]) ]) ]) ]) ]) ]) ])
-  CFLAGS="$CFLAGS1" ])
--AC_DEFINE_UNQUOTED($4, ${$5})
-+AC_DEFINE_UNQUOTED($4, ${$5}, [foo])
- ])
- 
- AC_BASIC_TYPE([#include <stdlib.h>], size_t, HAVE_BASIC_SIZE_T, sc_cv_type_sizet_basic)
-@@ -1465,13 +1467,13 @@
- 
- AC_MSG_CHECKING(for /dev/ptmx)
- if test -c /dev/ptmx; then
--  AC_DEFINE(HAVE_DEV_PTMX, 1)
-+  AC_DEFINE(HAVE_DEV_PTMX, 1, [ptmx])
-   AC_MSG_RESULT(yes)
- else
-   AC_MSG_RESULT(no)
-   AC_MSG_CHECKING(for /dev/ptc)
-   if test -c /dev/ptc; then
--    AC_DEFINE(HAVE_DEV_PTC)
-+    AC_DEFINE(HAVE_DEV_PTC, 1, [ptc])
-     AC_MSG_RESULT(yes)
-   else
-     AC_MSG_RESULT(no)
-@@ -1480,7 +1482,7 @@
- 
- AC_MSG_CHECKING(for /proc)
- if test -d /proc; then
--  AC_DEFINE(HAVE_PROC_DIR, 1)
-+  AC_DEFINE(HAVE_PROC_DIR, 1, [procdir])
-   AC_MSG_RESULT(yes)
- else
-   AC_MSG_RESULT(no)
-@@ -1488,7 +1490,7 @@
- 
- AC_MSG_CHECKING(for /proc/*/fd)
- if test -d /proc/$$/fd; then
--  AC_DEFINE(HAVE_PROC_DIR_FD, 1)
-+  AC_DEFINE(HAVE_PROC_DIR_FD, 1, [procdir fd])
-   AC_MSG_RESULT(yes)
- else
-   AC_MSG_RESULT(no)
-@@ -1528,7 +1530,7 @@
-       done])
-   ])
-   if test "$sc_cv_have_tcpd_h" = "yes"; then
--    AC_DEFINE(HAVE_TCPD_H)
-+    AC_DEFINE(HAVE_TCPD_H, [1], [have tcpd])
-   fi
-   AC_MSG_NOTICE(checked for tcpd.h... $sc_cv_have_tcpd_h)
- fi	# end checking for tcpd.h
-@@ -1561,14 +1563,14 @@
-     ]
-   )
-   if test "$sc_cv_have_libwrap" = 'yes'; then
--    AC_DEFINE(HAVE_LIBWRAP)
-+    AC_DEFINE(HAVE_LIBWRAP, [1], [libwrap])
-   fi
-   AC_MSG_RESULT($sc_cv_have_libwrap)
- fi
- #
- if test -n "$WITH_LIBWRAP"; then
-   if test "$sc_cv_have_tcpd_h" = "yes" -a "$sc_cv_have_libwrap" = "yes"; then
--    AC_DEFINE(WITH_LIBWRAP)
-+    AC_DEFINE(WITH_LIBWRAP, [1], [libwrap])
-   else
-     AC_MSG_WARN([not all components of tcp wrappers found, disabling it]);
-   fi
-@@ -1583,7 +1585,7 @@
-       [sc_cv_have_hosts_allow_table=yes],
-       [sc_cv_have_hosts_allow_table=no])])
-   if test $sc_cv_have_hosts_allow_table = yes; then
--    AC_DEFINE(HAVE_HOSTS_ALLOW_TABLE)
-+    AC_DEFINE(HAVE_HOSTS_ALLOW_TABLE, [1], [hosts allow table])
-   fi
-   AC_MSG_RESULT($sc_cv_have_hosts_allow_table)
- fi # test -n "$WITH_LIBWRAP"
diff --git a/meta/recipes-connectivity/socat/socat/fix-cross-compiling-failed.patch b/meta/recipes-connectivity/socat/socat/fix-cross-compiling-failed.patch
new file mode 100644
index 0000000..b9d3ca3
--- /dev/null
+++ b/meta/recipes-connectivity/socat/socat/fix-cross-compiling-failed.patch
@@ -0,0 +1,36 @@
+Fix build during cross-compilation as it fails to detect that our prefixed
+compiler is gcc, and falls back to executing code to determine type sizes:
+
+| configure: using code run method to find basic types
+| checking for equivalent simple type of size_t...
+| configure: error: in `/data/poky-master/tmp/work/core2-32-poky-linux/socat/1.7.2.4-r0/build':
+| configure: error: cannot run test program while cross compiling
+
+This is caused by configure.in assuming that $CC can be literally compared with
+"gcc" to determine if the compiler is GCC.  Our gcc is host-prefixed so this
+test fails, however autoconf provides $GCC for this purpose (which was used up
+to 1.7.2.3).
+
+Upstream-Status: Submitted (via email)
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+---
+ configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+--- a/configure.in
++++ b/configure.in
+@@ -41,7 +41,7 @@ AC_CHECK_PROG(AR, ar, ar, gar)
+ # fail
+ AC_LANG_COMPILER_REQUIRE()
+ 
+-if test "$CC" = "gcc"; then
++if test "$GCC" = yes; then
+    CFLAGS="$CFLAGS -D_GNU_SOURCE -Wall -Wno-parentheses"
+    ERRONWARN="-Werror -O0"
+ elif test "$CC" = "clang"; then
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-connectivity/socat/socat/fix-xxx_SHIFT-autoheader.patch b/meta/recipes-connectivity/socat/socat/fix-xxx_SHIFT-autoheader.patch
deleted file mode 100644
index 44659a0..0000000
--- a/meta/recipes-connectivity/socat/socat/fix-xxx_SHIFT-autoheader.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Subject: [PATCH] fix autoheader for *_SHIFT values.
-
-Upstream-Status: Pending
-
-autoheader would not generate C `#define' statements if
-the first param of AC_DEFINE_UNQUOTED is a shell variable.
-This will cause build failures while enable termios, so
-expand these AC_DEFINE_UNQUOTED from the macro.
-
-Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
----
- configure.in |    5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index c54e4c4..13bae64 100644
---- a/configure.in
-+++ b/configure.in
-@@ -1335,8 +1335,6 @@ AC_CACHE_CHECK(shift offset of $1, $2,
-  [$2=-1]
- )
-  LIBS="$LIBS1"])
--SHIFT_NAME="$1"_SHIFT
--AC_DEFINE_UNQUOTED($SHIFT_NAME, ${$2}, [foo])
- if test "$2" = -1; then
- AC_MSG_WARN(please determine $1_SHIFT manually)
- fi
-@@ -1346,6 +1344,9 @@ AC_SHIFT_OFFSET(CRDLY,  sc_cv_sys_crdly_shift)
- AC_SHIFT_OFFSET(TABDLY, sc_cv_sys_tabdly_shift)
- AC_SHIFT_OFFSET(CSIZE,  sc_cv_sys_csize_shift)
- 
-+AC_DEFINE_UNQUOTED(CRDLY_SHIFT, ${sc_cv_sys_crdly_shift}, [shift for CRDLY, carriage return delay])
-+AC_DEFINE_UNQUOTED(TABDLY_SHIFT, ${sc_cv_sys_tabdly_shift}, [shift for TABDLY, horizontal tab delay])
-+AC_DEFINE_UNQUOTED(CSIZE_SHIFT, ${sc_cv_sys_csize_shift}, [shift for CSIZE, character size])
- 
- dnl find what physical type (basic C type) is equivalent to the given type.
- dnl arg1: include file(s)
--- 
-1.7.9.5
-
diff --git a/meta/recipes-connectivity/socat/socat_1.7.2.3.bb b/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
similarity index 61%
rename from meta/recipes-connectivity/socat/socat_1.7.2.3.bb
rename to meta/recipes-connectivity/socat/socat_1.7.2.4.bb
index 99060b1..efa3b91 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.2.3.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
@@ -8,31 +8,28 @@ SECTION = "console/network"
 DEPENDS = "openssl readline"
 
 LICENSE = "GPL-2.0+-with-OpenSSL-exception"
-LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760 \
-                    file://README;beginline=252;endline=282;md5=79246f11a1db0b6ccec54d1fb711c01e"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://README;beginline=257;endline=287;md5=79246f11a1db0b6ccec54d1fb711c01e"
 
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
-           file://compile.patch \
-           file://fix-xxx_SHIFT-autoheader.patch"
+           file://fix-cross-compiling-failed.patch \
+"
 
-SRC_URI[md5sum] = "75008d8baf7c6c9e27aa7afb34a622de"
-SRC_URI[sha256sum] = "0598ac54af7b138cda9e3c141bcf0cc63eeb2ab31f468a772dc3f7eb3896aad0"
+SRC_URI[md5sum] = "69b8155dd442a6f24e28ef5407d868eb"
+SRC_URI[sha256sum] = "4b7739901c6fad1e460f3e5b1868fb4c2a1427febbba7a510cd2e42fd4941e09"
 
-PACKAGECONFIG ??= "tcp-wrappers"
-PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
+inherit autotools
+
+EXTRA_AUTORECONF += "--exclude=autoheader"
 
 EXTRA_OECONF += "ac_cv_have_z_modifier=yes sc_cv_sys_crdly_shift=9 \
         sc_cv_sys_tabdly_shift=11 sc_cv_sys_csize_shift=4 \
         ac_cv_ispeed_offset=13 \
 "
 
-inherit autotools
-
-do_configure_prepend() {
-    sed '/AC_DEFINE_UNQUOTED(ISPEED_OFFSET/a\AC_DEFINE(OSPEED_OFFSET,\
-(ISPEED_OFFSET+1)\ ,\ [have\ ospeed\ offset])' -i ${S}/configure.in
-}
+PACKAGECONFIG ??= "tcp-wrappers"
+PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
 
 do_install_prepend () {
     mkdir -p ${D}${bindir}
-- 
1.7.10.4


