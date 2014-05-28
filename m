Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 002AF6FAC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 07:59:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4S7xjLZ026697
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 May 2014 00:59:45 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Wed, 28 May 2014 00:59:44 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 May 2014 15:59:36 +0800
Message-ID: <e7e8848880f4988a18f2a4e0a6be69a3b45c59f9.1401263535.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1401263535.git.hongxu.jia@windriver.com>
References: <cover.1401263535.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/2] socat: upgrade to 1.7.2.4
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
X-List-Received-Date: Wed, 28 May 2014 07:59:46 -0000
Content-Type: text/plain

Tweak compile.patch:
- add the explanation of 'AC_DEFINE' in the patch header;
- remove the t.c_ispeed assinged line for AC_TRY_COMPILE;
- remove the SHIFT_NAME line, use socat-enable-termios.patch to instead.

Drop fix-xxx-SHIFT-autoheader.patch, and add socat-enable-termios.patch to
instead;

Remove 'do_configure_prepend' task, use socat-enable-termios.patch to instead.

The license checksum changed, becuase the company address changed.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-connectivity/socat/socat/compile.patch | 191 +++++++++++----------
 .../socat/socat/socat-enable-termios.patch         |  39 +++++
 .../socat/{socat_1.7.2.3.bb => socat_1.7.2.4.bb}   |  17 +-
 3 files changed, 149 insertions(+), 98 deletions(-)
 create mode 100644 meta/recipes-connectivity/socat/socat/socat-enable-termios.patch
 rename meta/recipes-connectivity/socat/{socat_1.7.2.3.bb => socat_1.7.2.4.bb} (63%)

diff --git a/meta/recipes-connectivity/socat/socat/compile.patch b/meta/recipes-connectivity/socat/socat/compile.patch
index 4d1a0b6..0c4c110 100644
--- a/meta/recipes-connectivity/socat/socat/compile.patch
+++ b/meta/recipes-connectivity/socat/socat/compile.patch
@@ -1,15 +1,35 @@
-Upstream-Status: Inappropriate [configuration]
+configure.in: fix AC_DEFINE
+
+The 'AC_DEFINE (variable)' is older versions of Autoconf,
+but this usage is obsolescent and withdrawn in oe-core's
+Autoconf 2.69. Use 'AC_DEFINE (variable, value, [description])'
+to instead.
+
+The same reason for 'AC_DEFINE_UNQUOTED (variable)'.
+
+http://www.gnu.org/software/autoconf/manual/autoconf-2.69/html_node/Defining-Symbols.html
 
-The patch is from http://git.openembedded.org/openembedded/tree/recipes/socat/files/compile.patch
-and was rebased to socat-1.7.2.0.
+Upstream-Status: Inappropriate [configuration]
 
-Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
-Fri Dec 16 17:12:17 CST 2011
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.in | 292 +++++++++++++++++++++++++++++------------------------------
+ 1 file changed, 146 insertions(+), 146 deletions(-)
 
-diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
---- socat-1.7.2.0.orig/configure.in	2011-12-04 21:34:16.000000000 +0800
-+++ socat-1.7.2.0/configure.in	2011-12-16 17:08:59.698367071 +0800
-@@ -88,7 +88,7 @@
+diff --git a/configure.in b/configure.in
+index 549f929..b88c0c7 100644
+--- a/configure.in
++++ b/configure.in
+@@ -80,7 +80,7 @@ AC_HEADER_RESOLV()
+ AC_CHECK_HEADERS(termios.h linux/if_tun.h)
+ AC_CHECK_HEADERS(net/if_dl.h)
+ AC_CHECK_HEADERS(linux/types.h)
+-AC_CHECK_HEADER(linux/errqueue.h, AC_DEFINE(HAVE_LINUX_ERRQUEUE_H), [], [#include <linux/types.h>])
++AC_CHECK_HEADER(linux/errqueue.h, AC_DEFINE(HAVE_LINUX_ERRQUEUE_H, [1], [With linux errqueue header]), [], [#include <linux/types.h>])
+ AC_CHECK_HEADERS(sys/utsname.h sys/select.h sys/file.h)
+ AC_CHECK_HEADERS(util.h bsd/libutil.h libutil.h sys/stropts.h regex.h)
+ AC_CHECK_HEADERS(linux/fs.h linux/ext2_fs.h)
+@@ -95,7 +95,7 @@ AC_SEARCH_LIBS([res_9_init], [resolv])
  
  
  dnl Check for extra socket library (for Solaris)
@@ -18,7 +38,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  AC_CHECK_FUNC(gethostent, , AC_CHECK_LIB(nsl, gethostent))
  AC_CHECK_FUNC(setsockopt, , AC_CHECK_LIB(socket, setsockopt))
  
-@@ -102,7 +102,7 @@
+@@ -128,7 +128,7 @@ AC_CACHE_VAL(sc_cv_have_prototype_hstrerror,
   [sc_cv_have_prototype_hstrerror=yes]);
   CFLAGS="$CFLAGS1"])
  if test $sc_cv_have_prototype_hstrerror = yes; then
@@ -27,7 +47,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_have_prototype_hstrerror)
  
-@@ -111,83 +111,83 @@
+@@ -137,83 +137,83 @@ AC_MSG_CHECKING(whether to include help)
  AC_ARG_ENABLE(help, [  --disable-help          disable help],
  	      [case "$enableval" in
  	       no) AC_MSG_RESULT(no);;
@@ -131,7 +151,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  		*)
  		    AC_MSG_RESULT(no);;
  		esac])
-@@ -196,9 +196,9 @@
+@@ -222,9 +222,9 @@ AC_MSG_CHECKING(whether to include IPv4 support)
  AC_ARG_ENABLE(ip4, [  --disable-ip4           disable IPv4 support],
  	      [case "$enableval" in
  	       no) AC_MSG_RESULT(no);;
@@ -143,7 +163,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  
  AC_MSG_CHECKING(whether to include IPv6 support)
  AC_ARG_ENABLE(ip6, [  --disable-ip6           disable IPv6 support],
-@@ -209,7 +209,7 @@
+@@ -235,7 +235,7 @@ AC_ARG_ENABLE(ip6, [  --disable-ip6           disable IPv6 support],
  	      [ AC_MSG_RESULT(yes);  WITH_IP6=1 ])
  if test "$WITH_IP6"; then
    AC_CHECK_HEADERS([netinet/ip6.h],
@@ -152,7 +172,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
      [AC_MSG_WARN([include file netinet/ip6.h not found, disabling IP6])],
      [AC_INCLUDES_DEFAULT
       #ifdef HAVE_NETINET_IN_H
-@@ -242,17 +242,17 @@
+@@ -268,17 +268,17 @@ AC_MSG_CHECKING(whether to include raw IP support)
  AC_ARG_ENABLE(rawip, [  --disable-rawip         disable raw IP support],
  	      [case "$enableval" in
  	       no) AC_MSG_RESULT(no);;
@@ -163,7 +183,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
 +	       [AC_DEFINE(WITH_RAWIP, [1], [With rawip]) AC_MSG_RESULT(yes)])
  
  AC_MSG_CHECKING(whether to include generic socket support)
- AC_ARG_ENABLE(rawsocket, [  --disable-genericsocket disable generic socket support],
+ AC_ARG_ENABLE(genericsocket, [  --disable-genericsocket disable generic socket support],
  	      [case "$enableval" in
  	       no) AC_MSG_RESULT(no);;
 -	       *) AC_DEFINE(WITH_GENERICSOCKET) AC_MSG_RESULT(yes);;
@@ -171,10 +191,10 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  	       esac],
 -	       [AC_DEFINE(WITH_GENERICSOCKET) AC_MSG_RESULT(yes)])
 +	       [AC_DEFINE(WITH_GENERICSOCKET, [1], [With genericsocket]) AC_MSG_RESULT(yes)])
- AC_MSG_CHECKING(whether to include raw network interface support)
+ AC_MSG_CHECKING(whether to include generic network interface support)
  AC_ARG_ENABLE(interface, [  --disable-interface  disable network interface support],
  	      [case "$enableval" in
-@@ -262,35 +262,35 @@
+@@ -288,35 +288,35 @@ AC_ARG_ENABLE(interface, [  --disable-interface  disable network interface suppo
  	       [AC_MSG_RESULT(yes);  WITH_INTERFACE=1 ])
  if test "$WITH_INTERFACE"; then
    AC_CHECK_HEADER(netpacket/packet.h,
@@ -217,7 +237,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  
  AC_MSG_CHECKING(whether to include SCTP support)
  AC_ARG_ENABLE(sctp, [  --disable-sctp           disable SCTP support],
-@@ -310,7 +310,7 @@
+@@ -336,7 +336,7 @@ AC_CACHE_VAL(sc_cv_define_ipproto_sctp,
  [sc_cv_define_ipproto_sctp=no])])
  AC_MSG_RESULT($sc_cv_define_ipproto_sctp)
  if test $sc_cv_define_ipproto_sctp = yes; then
@@ -226,7 +246,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  else
     AC_MSG_WARN([IPPROTO_SCTP undefined, disabling SCTP support])
  fi
-@@ -320,65 +320,65 @@
+@@ -346,65 +346,65 @@ AC_MSG_CHECKING(whether to include listen support)
  AC_ARG_ENABLE(listen, [  --disable-listen        disable listen support],
  	      [case "$enableval" in
  	       no) AC_MSG_RESULT(no);;
@@ -308,7 +328,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  
  AC_MSG_CHECKING(whether to include readline support)
  AC_ARG_ENABLE(readline, [  --disable-readline      disable readline support],
-@@ -423,10 +423,10 @@
+@@ -449,10 +449,10 @@ if test -n "$WITH_READLINE"; then
      
      if test -n "$sc_usable_readline_found"; then
        AC_MSG_RESULT(yes)
@@ -323,7 +343,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
        break
      else
        AC_MSG_RESULT(no)
-@@ -469,7 +469,7 @@
+@@ -495,7 +495,7 @@ if test -n "$WITH_OPENSSL"; then
        done])
    ])
    if test "$sc_cv_have_openssl_ssl_h" = "yes"; then
@@ -332,7 +352,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
    fi
    AC_MSG_NOTICE(checked for openssl/ssl.h... $sc_cv_have_openssl_ssl_h)
  fi	# end checking for openssl/ssl.h
-@@ -501,7 +501,7 @@
+@@ -527,7 +527,7 @@ if test -n "$WITH_OPENSSL" -a "$sc_cv_have_openssl_ssl_h" = 'yes'; then
      ]
    )
    if test "$sc_cv_have_libssl" = 'yes'; then
@@ -341,7 +361,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
    fi
    AC_MSG_RESULT($sc_cv_have_libssl)
  fi
-@@ -529,7 +529,7 @@
+@@ -555,7 +555,7 @@ fi
  #fi
  if test -n "$WITH_OPENSSL"; then
    if test "$sc_cv_have_openssl_ssl_h" = "yes" -a "$sc_cv_have_libssl" = "yes"; then
@@ -350,7 +370,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
    else
      AC_MSG_WARN([not all components of OpenSSL found, disabling it]);
    fi
-@@ -577,7 +577,7 @@
+@@ -604,7 +604,7 @@ if test -n "$WITH_FIPS"; then
      )]
    )
    if test "$sv_cv_have_openssl_fips_h" = "yes"; then
@@ -359,7 +379,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
    fi
    AC_MSG_NOTICE(checked for openssl/fips.h... $sc_cv_have_openssl_ssl_h)
  fi
-@@ -608,15 +608,15 @@
+@@ -635,15 +635,15 @@ if test -n "$WITH_FIPS" -a "$sc_cv_have_openssl_fips_h" = 'yes'; then
      ]
    )
    if test "$sc_cv_have_libcrypto" = 'yes'; then
@@ -378,7 +398,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
    else
      AC_MSG_WARN([not all components of OpenSSL FIPS found, disabling it]);
    fi
-@@ -637,17 +637,17 @@
+@@ -664,17 +664,17 @@ if ! test "$ac_cv_header_linux_if_tun_h" = 'yes'; then
  fi
  #
  if test -n "$WITH_TUN"; then
@@ -399,7 +419,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  		 SYCLS="sycls.c"; SSLCLS="sslcls.c"; AC_MSG_RESULT(yes)])
  AC_SUBST(SYCLS)
  AC_SUBST(SSLCLS)
-@@ -656,31 +656,31 @@
+@@ -683,31 +683,31 @@ AC_MSG_CHECKING(whether to include file descriptor analyzer)
  AC_ARG_ENABLE(filan, [  --disable-filan         disable file descriptor analyzer],
  	      [case "$enableval" in
  	       no) FILAN=""; AC_MSG_RESULT(no);;
@@ -443,7 +463,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  
  #AC_SUBST(V_INCL)
  
-@@ -697,7 +697,7 @@
+@@ -724,7 +724,7 @@ AC_STRUCT_ST_RDEV
  AC_HEADER_TIME
  
  dnl Check for extra realtime library (for Solaris)
@@ -452,7 +472,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  #AC_CHECK_FUNC(nanosleep, , AC_CHECK_LIB(rt, nanosleep))
  
  dnl Checks for library functions.
-@@ -719,7 +719,7 @@
+@@ -760,7 +760,7 @@ AC_CACHE_VAL(sc_cv_type_longlong,
  [sc_cv_type_longlong=yes],
  [sc_cv_type_longlong=no])])
  if test $sc_cv_type_longlong = yes; then
@@ -461,7 +481,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_type_longlong)
  
-@@ -735,7 +735,7 @@
+@@ -776,7 +776,7 @@ AC_CACHE_VAL(sc_cv_type_socklen,
  [sc_cv_type_socklen=yes],
  [sc_cv_type_socklen=no])])
  if test $sc_cv_type_socklen = yes; then
@@ -470,7 +490,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_type_socklen)
  
-@@ -745,7 +745,7 @@
+@@ -786,7 +786,7 @@ AC_CACHE_VAL(sc_cv_type_stat64,
  [sc_cv_type_stat64=yes],
  [sc_cv_type_stat64=no])])
  if test $sc_cv_type_stat64 = yes; then
@@ -479,7 +499,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_type_stat64)
  
-@@ -755,7 +755,7 @@
+@@ -796,7 +796,7 @@ AC_CACHE_VAL(sc_cv_type_off64,
  [sc_cv_type_off64=yes],
  [sc_cv_type_off64=no])])
  if test $sc_cv_type_off64 = yes; then
@@ -488,7 +508,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_type_off64)
  
-@@ -765,7 +765,7 @@
+@@ -806,7 +806,7 @@ AC_CACHE_VAL(sc_cv_type_sighandler,
  [sc_cv_type_sighandler=yes],
  [sc_cv_type_sighandler=no])])
  if test $sc_cv_type_sighandler = yes; then
@@ -497,7 +517,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_type_socklen)
  
-@@ -783,7 +783,7 @@
+@@ -824,7 +824,7 @@ AC_CACHE_VAL(sc_cv_type_uint8,
  [sc_cv_type_uint8=yes],
  [sc_cv_type_uint8=no])])
  if test $sc_cv_type_uint8 = yes; then
@@ -506,7 +526,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_type_uint8)
  
-@@ -801,7 +801,7 @@
+@@ -842,7 +842,7 @@ AC_CACHE_VAL(sc_cv_type_uint16,
  [sc_cv_type_uint16=yes],
  [sc_cv_type_uint16=no])])
  if test $sc_cv_type_uint16 = yes; then
@@ -515,7 +535,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_type_uint16)
  
-@@ -819,7 +819,7 @@
+@@ -860,7 +860,7 @@ AC_CACHE_VAL(sc_cv_type_uint32,
  [sc_cv_type_uint32=yes],
  [sc_cv_type_uint32=no])])
  if test $sc_cv_type_uint32 = yes; then
@@ -524,7 +544,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_type_uint32)
  
-@@ -837,7 +837,7 @@
+@@ -878,7 +878,7 @@ AC_CACHE_VAL(sc_cv_type_uint64,
  [sc_cv_type_uint64=yes],
  [sc_cv_type_uint64=no])])
  if test $sc_cv_type_uint64 = yes; then
@@ -533,7 +553,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_type_uint64)
  
-@@ -859,7 +859,7 @@
+@@ -900,7 +900,7 @@ AC_TRY_COMPILE([#include <sys/types.h>
  #include <sys/select.h>
  #endif],
  [fd_set s; s.fds_bits[0]=0;],
@@ -542,7 +562,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  [AC_MSG_RESULT(no);])
  
  AC_MSG_CHECKING(for sa_family_t)
-@@ -870,7 +870,7 @@
+@@ -911,7 +911,7 @@ AC_CACHE_VAL(sc_cv_type_sa_family_t,
  [sc_cv_type_sa_family_t=yes],
  [sc_cv_type_sa_family_t=no])])
  if test $sc_cv_type_sa_family_t = yes; then
@@ -551,7 +571,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_type_sa_family_t)
  
-@@ -880,7 +880,7 @@
+@@ -921,7 +921,7 @@ AC_CACHE_VAL(sc_cv_struct_sigaction_sa_sigaction,
  [sc_cv_struct_sigaction_sa_sigaction=yes],
  [sc_cv_struct_sigaction_sa_sigaction=no])])
  if test $sc_cv_struct_sigaction_sa_sigaction = yes; then
@@ -560,12 +580,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_struct_sigaction_sa_sigaction)
  
-@@ -888,11 +888,11 @@
- AC_MSG_CHECKING(for termios.c_ispeed)
- AC_CACHE_VAL(sc_cv_termios_ispeed,
- [AC_TRY_COMPILE([#include <termios.h>],
--[struct termios t; t.c_ispeed=0;],
-+[struct termios t; t.c_ispeed=ISPEED_OFFSET; t.c_ospeed=OSPEED_OFFSET;],
+@@ -933,7 +933,7 @@ AC_CACHE_VAL(sc_cv_termios_ispeed,
  [sc_cv_termios_ispeed=yes],
  [sc_cv_termios_ispeed=no])])
  if test $sc_cv_termios_ispeed = yes; then
@@ -574,7 +589,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_termios_ispeed)
  
-@@ -923,7 +923,7 @@
+@@ -965,7 +965,7 @@ AC_CACHE_VAL(ac_cv_ispeed_offset,
  LIBS="$LIBS1"
  AC_MSG_RESULT($ac_cv_ispeed_offset)
   if test $ac_cv_ispeed_offset -ge 0; then
@@ -583,7 +598,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
   fi
  fi
  
-@@ -942,7 +942,7 @@
+@@ -984,7 +984,7 @@ AC_CACHE_VAL(ac_cv_svid3,
   )]
  )])
  if test $ac_cv_svid3 = yes; then
@@ -592,7 +607,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($ac_cv_svid3)
  
-@@ -957,7 +957,7 @@
+@@ -999,7 +999,7 @@ AC_CACHE_VAL(sc_cv_struct_timespec,
  [sc_cv_struct_timespec=yes],
  [sc_cv_struct_timespec=no])])
  if test $sc_cv_struct_timespec = yes; then
@@ -601,7 +616,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_struct_timespec)
  
-@@ -970,7 +970,7 @@
+@@ -1012,7 +1012,7 @@ AC_CACHE_VAL(sc_cv_struct_linger,
  [sc_cv_struct_linger=yes],
  [sc_cv_struct_linger=no])])
  if test $sc_cv_struct_linger = yes; then
@@ -610,7 +625,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_struct_linger)
  
-@@ -984,7 +984,7 @@
+@@ -1026,7 +1026,7 @@ AC_CACHE_VAL(sc_cv_struct_ip_mreq,
  [sc_cv_struct_ip_mreq=yes],
  [sc_cv_struct_ip_mreq=no])])
  if test $sc_cv_struct_ip_mreq = yes; then
@@ -619,7 +634,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_struct_ip_mreq)
  
-@@ -997,7 +997,7 @@
+@@ -1039,7 +1039,7 @@ AC_CACHE_VAL(sc_cv_struct_ip_mreqn,
  [sc_cv_struct_ip_mreqn=yes],
  [sc_cv_struct_ip_mreqn=no])])
  if test $sc_cv_struct_ip_mreqn = yes; then
@@ -628,7 +643,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_struct_ip_mreqn)
  
-@@ -1010,7 +1010,7 @@
+@@ -1052,7 +1052,7 @@ AC_CACHE_VAL(sc_cv_struct_ipv6_mreq,
  [sc_cv_struct_ipv6_mreq=yes],
  [sc_cv_struct_ipv6_mreq=no])])
  if test $sc_cv_struct_ipv6_mreq = yes; then
@@ -637,7 +652,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_struct_ipv6_mreq)
  
-@@ -1024,7 +1024,7 @@
+@@ -1066,7 +1066,7 @@ AC_CACHE_VAL(sc_cv_struct_ifreq,
  [sc_cv_struct_ifreq=yes],
  [sc_cv_struct_ifreq=no])])
  if test $sc_cv_struct_ifreq = yes; then
@@ -646,7 +661,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_struct_ifreq)
  
-@@ -1039,7 +1039,7 @@
+@@ -1081,7 +1081,7 @@ AC_CACHE_VAL(sc_cv_struct_ifreq_ifr_index,
  [sc_cv_struct_ifreq_ifr_index=yes],
  [sc_cv_struct_ifreq_ifr_index=no])])
  if test $sc_cv_struct_ifreq_ifr_index = yes; then
@@ -655,7 +670,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_struct_ifreq_ifr_index)
  
-@@ -1054,7 +1054,7 @@
+@@ -1096,7 +1096,7 @@ AC_CACHE_VAL(sc_cv_struct_ifreq_ifr_ifindex,
  [sc_cv_struct_ifreq_ifr_ifindex=yes],
  [sc_cv_struct_ifreq_ifr_ifindex=no])])
  if test $sc_cv_struct_ifreq_ifr_ifindex = yes; then
@@ -664,7 +679,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_struct_ifreq_ifr_ifindex)
  
-@@ -1069,7 +1069,7 @@
+@@ -1111,7 +1111,7 @@ AC_CACHE_VAL(sc_cv_struct_sockaddr_salen,
  [sc_cv_struct_sockaddr_salen=yes],
  [sc_cv_struct_sockaddr_salen=no])])
  if test $sc_cv_struct_sockaddr_salen = yes; then
@@ -673,7 +688,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_struct_sockaddr_salen)
  
-@@ -1080,31 +1080,31 @@
+@@ -1122,31 +1122,31 @@ AC_TRY_COMPILE([#include <sys/types.h>
  #include <netinet/in.h>],
  [struct sockaddr_in6 sa6;sa6.sin6_addr.s6_addr[0]=0;],
  [AC_MSG_RESULT(s6_addr);
@@ -711,7 +726,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  
      [AC_MSG_RESULT([none or unknown])]
  )])])])])])
-@@ -1116,7 +1116,7 @@
+@@ -1158,7 +1158,7 @@ AC_CACHE_VAL(sc_cv_struct_iovec,
  [sc_cv_struct_iovec=yes],
  [sc_cv_struct_iovec=no])])
  if test $sc_cv_struct_iovec = yes; then
@@ -720,7 +735,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_struct_iovec)
  
-@@ -1129,7 +1129,7 @@
+@@ -1171,7 +1171,7 @@ AC_CACHE_VAL(sc_cv_struct_msghdr_msgcontrol,
  [sc_cv_struct_msghdr_msgcontrol=yes],
  [sc_cv_struct_msghdr_msgcontrol=no])])
  if test $sc_cv_struct_msghdr_msgcontrol = yes; then
@@ -729,7 +744,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_struct_msghdr_msgcontrol)
  
-@@ -1142,7 +1142,7 @@
+@@ -1184,7 +1184,7 @@ AC_CACHE_VAL(sc_cv_struct_msghdr_msgcontrollen,
  [sc_cv_struct_msghdr_msgcontrollen=yes],
  [sc_cv_struct_msghdr_msgcontrollen=no])])
  if test $sc_cv_struct_msghdr_msgcontrollen = yes; then
@@ -738,7 +753,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_struct_msghdr_msgcontrollen)
  
-@@ -1155,7 +1155,7 @@
+@@ -1197,7 +1197,7 @@ AC_CACHE_VAL(sc_cv_struct_msghdr_msgflags,
  [sc_cv_struct_msghdr_msgflags=yes],
  [sc_cv_struct_msghdr_msgflags=no])])
  if test $sc_cv_struct_msghdr_msgflags = yes; then
@@ -747,7 +762,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_struct_msghdr_msgflags)
  
-@@ -1168,7 +1168,7 @@
+@@ -1210,7 +1210,7 @@ AC_CACHE_VAL(sc_cv_struct_cmsghdr,
  [sc_cv_struct_cmsghdr=yes],
  [sc_cv_struct_cmsghdr=no])])
  if test $sc_cv_struct_cmsghdr = yes; then
@@ -756,7 +771,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_struct_cmsghdr)
  
-@@ -1181,7 +1181,7 @@
+@@ -1223,7 +1223,7 @@ AC_CACHE_VAL(sc_cv_struct_in_pktinfo,
  [sc_cv_struct_in_pktinfo=yes],
  [sc_cv_struct_in_pktinfo=no])])
  if test $sc_cv_struct_in_pktinfo = yes; then
@@ -765,7 +780,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_struct_in_pktinfo)
  
-@@ -1211,7 +1211,7 @@
+@@ -1265,7 +1265,7 @@ AC_CACHE_VAL(sc_cv_struct_ip_ip_hl,
  [sc_cv_struct_ip_ip_hl=yes],
  [sc_cv_struct_ip_ip_hl=no])])
  if test $sc_cv_struct_ip_ip_hl = yes; then
@@ -774,7 +789,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  fi
  AC_MSG_RESULT($sc_cv_struct_ip_ip_hl)
  
-@@ -1219,19 +1219,19 @@
+@@ -1273,19 +1273,19 @@ AC_MSG_RESULT($sc_cv_struct_ip_ip_hl)
  dnl Library function checks
  
  dnl Check sigaction()
@@ -788,24 +803,23 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
 -AC_CHECK_FUNC(lseek64, AC_DEFINE(HAVE_LSEEK64))
 -AC_CHECK_FUNC(truncate64, AC_DEFINE(HAVE_TRUNCATE64))
 -AC_CHECK_FUNC(ftruncate64, AC_DEFINE(HAVE_FTRUNCATE64))
--
--AC_CHECK_FUNC(strtoll, AC_DEFINE(HAVE_STRTOLL))
--AC_CHECK_FUNC(hstrerror, AC_DEFINE(HAVE_HSTRERROR))
--AC_CHECK_FUNC(inet_ntop, AC_DEFINE(HAVE_INET_NTOP))
 +AC_CHECK_FUNC(stat64, AC_DEFINE(HAVE_STAT64, [1], [foo]))
 +AC_CHECK_FUNC(fstat64, AC_DEFINE(HAVE_FSTAT64, [1], [foo]))
 +AC_CHECK_FUNC(lstat64, AC_DEFINE(HAVE_LSTAT64, [1], [foo]))
 +AC_CHECK_FUNC(lseek64, AC_DEFINE(HAVE_LSEEK64, [1], [foo]))
 +AC_CHECK_FUNC(truncate64, AC_DEFINE(HAVE_TRUNCATE64, [1], [foo]))
 +AC_CHECK_FUNC(ftruncate64, AC_DEFINE(HAVE_FTRUNCATE64, [1], [foo]))
-+
+ 
+-AC_CHECK_FUNC(strtoll, AC_DEFINE(HAVE_STRTOLL))
+-AC_CHECK_FUNC(hstrerror, AC_DEFINE(HAVE_HSTRERROR))
+-AC_CHECK_FUNC(inet_ntop, AC_DEFINE(HAVE_INET_NTOP))
 +AC_CHECK_FUNC(strtoll, AC_DEFINE(HAVE_STRTOLL, [1], [foo]))
 +AC_CHECK_FUNC(hstrerror, AC_DEFINE(HAVE_HSTRERROR, [1], [foo]))
 +AC_CHECK_FUNC(inet_ntop, AC_DEFINE(HAVE_INET_NTOP, [1], [foo]))
  
  #if test "$ac_cv_func_hstrerror" = "yes"; then
  #  AC_MSG_CHECKING(if _XOPEN_SOURCE_EXTENDED is helpful)
-@@ -1254,25 +1254,26 @@
+@@ -1308,25 +1308,26 @@ AC_CHECK_FUNC(inet_ntop, AC_DEFINE(HAVE_INET_NTOP))
  
  dnl Search for openpty()
  # MacOS
@@ -838,26 +852,24 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
  
  dnl Search for SSLv2_client_method, SSLv2_server_method
  AC_CHECK_FUNC(SSLv3_client_method, AC_DEFINE(HAVE_SSLv3_client_method), AC_CHECK_LIB(crypt, SSLv3_client_method, [LIBS=-lcrypt $LIBS]))
-@@ -1295,7 +1296,7 @@
- [ac_cv_have_z_modifier=no],
- [ac_cv_have_z_modifier=no])])
+@@ -1372,7 +1373,7 @@ else ac_cv_have_z_modifier=no
+ fi
+ )
  if test $ac_cv_have_z_modifier = yes; then
 -   AC_DEFINE(HAVE_FORMAT_Z)
 +   AC_DEFINE(HAVE_FORMAT_Z, [1], [have format z])
  fi
  AC_MSG_RESULT($ac_cv_have_z_modifier)
  
-@@ -1334,7 +1335,8 @@
+@@ -1412,7 +1413,6 @@ AC_CACHE_CHECK(shift offset of $1, $2,
   [$2=-1]
  )
   LIBS="$LIBS1"])
 -AC_DEFINE_UNQUOTED($1_SHIFT, ${$2})
-+SHIFT_NAME="$1"_SHIFT
-+AC_DEFINE_UNQUOTED($SHIFT_NAME, ${$2}, [foo])
  if test "$2" = -1; then
  AC_MSG_WARN(please determine $1_SHIFT manually)
  fi
-@@ -1374,7 +1376,7 @@
+@@ -1479,7 +1479,7 @@ AC_CACHE_CHECK(for equivalent simple type of $2, $4,
          [$4="0 /* unknown, taking default */"
  ]) ]) ]) ]) ]) ]) ]) ])
   CFLAGS="$CFLAGS1" ])
@@ -865,8 +877,8 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
 +AC_DEFINE_UNQUOTED($3, ${$4}, [foo])
  ])
  
- dnl find what physical type (basic C type) describes the given struct or union
-@@ -1406,7 +1408,7 @@
+ dnl see AC_BASIC_TYPE
+@@ -1573,7 +1573,7 @@ AC_TRY_COMPILE([$1],[$2 u;short v; return(&u.$3==&v);],
         [$5="0 /* unknown, taking default */"
  ]) ]) ]) ]) ]) ]) ]) ])
   CFLAGS="$CFLAGS1" ])
@@ -874,8 +886,8 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
 +AC_DEFINE_UNQUOTED($4, ${$5}, [foo])
  ])
  
- AC_BASIC_TYPE([#include <stdlib.h>], size_t, HAVE_BASIC_SIZE_T, sc_cv_type_sizet_basic)
-@@ -1465,13 +1467,13 @@
+ dnl See AC_TYPEOF_COMPONENT
+@@ -1701,13 +1701,13 @@ AC_TYPEOF_COMPONENT([#include "sysincludes.h"], struct cmsghdr, cmsg_len, HAVE_T
  
  AC_MSG_CHECKING(for /dev/ptmx)
  if test -c /dev/ptmx; then
@@ -891,7 +903,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
      AC_MSG_RESULT(yes)
    else
      AC_MSG_RESULT(no)
-@@ -1480,7 +1482,7 @@
+@@ -1716,7 +1716,7 @@ fi
  
  AC_MSG_CHECKING(for /proc)
  if test -d /proc; then
@@ -900,7 +912,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
    AC_MSG_RESULT(yes)
  else
    AC_MSG_RESULT(no)
-@@ -1488,7 +1490,7 @@
+@@ -1724,7 +1724,7 @@ fi
  
  AC_MSG_CHECKING(for /proc/*/fd)
  if test -d /proc/$$/fd; then
@@ -909,7 +921,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
    AC_MSG_RESULT(yes)
  else
    AC_MSG_RESULT(no)
-@@ -1528,7 +1530,7 @@
+@@ -1764,7 +1764,7 @@ if test -n "$WITH_LIBWRAP"; then
        done])
    ])
    if test "$sc_cv_have_tcpd_h" = "yes"; then
@@ -918,7 +930,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
    fi
    AC_MSG_NOTICE(checked for tcpd.h... $sc_cv_have_tcpd_h)
  fi	# end checking for tcpd.h
-@@ -1561,14 +1563,14 @@
+@@ -1797,14 +1797,14 @@ int allow_severity,deny_severity;],[hosts_access(0)],
      ]
    )
    if test "$sc_cv_have_libwrap" = 'yes'; then
@@ -935,7 +947,7 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
    else
      AC_MSG_WARN([not all components of tcp wrappers found, disabling it]);
    fi
-@@ -1583,7 +1585,7 @@
+@@ -1819,7 +1819,7 @@ if test -n "$WITH_LIBWRAP"; then
        [sc_cv_have_hosts_allow_table=yes],
        [sc_cv_have_hosts_allow_table=no])])
    if test $sc_cv_have_hosts_allow_table = yes; then
@@ -944,3 +956,6 @@ diff -Nru socat-1.7.2.0.orig/configure.in socat-1.7.2.0/configure.in
    fi
    AC_MSG_RESULT($sc_cv_have_hosts_allow_table)
  fi # test -n "$WITH_LIBWRAP"
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-connectivity/socat/socat/socat-enable-termios.patch b/meta/recipes-connectivity/socat/socat/socat-enable-termios.patch
new file mode 100644
index 0000000..e82ea72
--- /dev/null
+++ b/meta/recipes-connectivity/socat/socat/socat-enable-termios.patch
@@ -0,0 +1,39 @@
+socat: enable termios
+
+While enable termios:
+- Add AC_DEFINE_UNQUOTED to define 'CRDLY_SHIFT', 'TABDLY_SHIFT'
+  and 'CSIZE_SHIFT'.
+- Add AC_DEFINE to define 'OSPEED_OFFSET'.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.in | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/configure.in b/configure.in
+index 205c9a0..da3890d 100644
+--- a/configure.in
++++ b/configure.in
+@@ -966,6 +966,7 @@ LIBS="$LIBS1"
+ AC_MSG_RESULT($ac_cv_ispeed_offset)
+  if test $ac_cv_ispeed_offset -ge 0; then
+    AC_DEFINE_UNQUOTED(ISPEED_OFFSET, $ac_cv_ispeed_offset, [have ispeed])
++   AC_DEFINE(OSPEED_OFFSET, (ISPEED_OFFSET+1), [have ospeed offset])
+  fi
+ fi
+ 
+@@ -1422,6 +1423,9 @@ AC_SHIFT_OFFSET(CRDLY,  sc_cv_sys_crdly_shift)
+ AC_SHIFT_OFFSET(TABDLY, sc_cv_sys_tabdly_shift)
+ AC_SHIFT_OFFSET(CSIZE,  sc_cv_sys_csize_shift)
+ 
++AC_DEFINE_UNQUOTED(CRDLY_SHIFT, ${sc_cv_sys_crdly_shift}, [shift for CRDLY, carriage return delay])
++AC_DEFINE_UNQUOTED(TABDLY_SHIFT, ${sc_cv_sys_tabdly_shift}, [shift for TABDLY, horizontal tab delay])
++AC_DEFINE_UNQUOTED(CSIZE_SHIFT, ${sc_cv_sys_csize_shift}, [shift for CSIZE, character size])
+ 
+ dnl Find what physical type (basic C type) is equivalent to the given type.
+ dnl If possible we try to compile simple test code and get no warning only with
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-connectivity/socat/socat_1.7.2.3.bb b/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
similarity index 63%
rename from meta/recipes-connectivity/socat/socat_1.7.2.3.bb
rename to meta/recipes-connectivity/socat/socat_1.7.2.4.bb
index 99060b1..185dd44 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.2.3.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
@@ -8,16 +8,18 @@ SECTION = "console/network"
 DEPENDS = "openssl readline"
 
 LICENSE = "GPL-2.0+-with-OpenSSL-exception"
-LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760 \
-                    file://README;beginline=252;endline=282;md5=79246f11a1db0b6ccec54d1fb711c01e"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://README;beginline=257;endline=287;md5=79246f11a1db0b6ccec54d1fb711c01e"
 
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://compile.patch \
-           file://fix-xxx_SHIFT-autoheader.patch"
+           file://socat-enable-termios.patch \
+"
+
 
-SRC_URI[md5sum] = "75008d8baf7c6c9e27aa7afb34a622de"
-SRC_URI[sha256sum] = "0598ac54af7b138cda9e3c141bcf0cc63eeb2ab31f468a772dc3f7eb3896aad0"
+SRC_URI[md5sum] = "69b8155dd442a6f24e28ef5407d868eb"
+SRC_URI[sha256sum] = "4b7739901c6fad1e460f3e5b1868fb4c2a1427febbba7a510cd2e42fd4941e09"
 
 PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
@@ -29,11 +31,6 @@ EXTRA_OECONF += "ac_cv_have_z_modifier=yes sc_cv_sys_crdly_shift=9 \
 
 inherit autotools
 
-do_configure_prepend() {
-    sed '/AC_DEFINE_UNQUOTED(ISPEED_OFFSET/a\AC_DEFINE(OSPEED_OFFSET,\
-(ISPEED_OFFSET+1)\ ,\ [have\ ospeed\ offset])' -i ${S}/configure.in
-}
-
 do_install_prepend () {
     mkdir -p ${D}${bindir}
     install -d ${D}${bindir} ${D}${mandir}/man1
-- 
1.8.1.2


