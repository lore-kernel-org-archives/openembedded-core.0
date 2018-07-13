Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B295774BE5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 06:03:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6D63CdN028153
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 23:03:13 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 12 Jul 2018 23:03:12 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jul 2018 14:03:10 +0800
Message-ID: <1531461790-205233-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] openssh: Restore TCP wrappers support
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
X-List-Received-Date: Fri, 13 Jul 2018 06:03:12 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

From: Wenzong Fan <wenzong.fan@windriver.com>

The /etc/hosts.deny doesn't work for sshd without tcp-wrappers support,
apply below patch from Debian to fix it.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-Restore-TCP-wrappers-support.patch        | 171 +++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_7.7p1.bb |   4 +
 2 files changed, 175 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-Restore-TCP-wrappers-support.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-Restore-TCP-wrappers-support.patch b/meta/recipes-connectivity/openssh/openssh/0001-Restore-TCP-wrappers-support.patch
new file mode 100644
index 0000000..5f3efa6
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/0001-Restore-TCP-wrappers-support.patch
@@ -0,0 +1,171 @@
+From 03cdbc92adf763f9ff5bb89f7820f9e1734f745b Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 13 Jul 2018 12:16:18 +0800
+Subject: [PATCH] Restore TCP wrappers support
+
+Support for TCP wrappers was dropped in OpenSSH 6.7.  See this message
+and thread:
+
+  https://lists.mindrot.org/pipermail/openssh-unix-dev/2014-April/032497.html
+
+It is true that this reduces preauth attack surface in sshd.  On the
+other hand, this support seems to be quite widely used, and abruptly
+dropping it (from the perspective of users who don't read
+openssh-unix-dev) could easily cause more serious problems in practice.
+
+Upstream-Status: Inappropriate
+
+This patch was imported by wenzong firstly, the following sign is not
+the origin author, just adjust it to fit for new version of openssh.
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+---
+ configure.ac | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ sshd.8       |  7 +++++++
+ sshd.c       | 26 ++++++++++++++++++++++++++
+ 3 files changed, 89 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 663062b..a2accdd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1542,6 +1542,61 @@ AC_ARG_WITH([skey],
+ 	]
+ )
+ 
++#Check whether user wants TCP wrappers support
++TCPW_MSG="no"
++AC_ARG_WITH([tcp-wrappers],
++       [  --with-tcp-wrappers[[=PATH]] Enable tcpwrappers support (optionally in PATH)],
++       [
++               if test "x$withval" != "xno" ; then
++                       saved_LIBS="$LIBS"
++                       saved_LDFLAGS="$LDFLAGS"
++                       saved_CPPFLAGS="$CPPFLAGS"
++                       if test -n "${withval}" && \
++                           test "x${withval}" != "xyes"; then
++                               if test -d "${withval}/lib"; then
++                                       if test -n "${need_dash_r}"; then
++                                               LDFLAGS="-L${withval}/lib -R${withval}/lib ${LDFLAGS}"
++                                       else
++                                               LDFLAGS="-L${withval}/lib ${LDFLAGS}"
++                                       fi
++                               else
++                                       if test -n "${need_dash_r}"; then
++                                               LDFLAGS="-L${withval} -R${withval} ${LDFLAGS}"
++                                       else
++                                               LDFLAGS="-L${withval} ${LDFLAGS}"
++                                       fi
++                               fi
++                               if test -d "${withval}/include"; then
++                                       CPPFLAGS="-I${withval}/include ${CPPFLAGS}"
++                               else
++                                       CPPFLAGS="-I${withval} ${CPPFLAGS}"
++                               fi
++                       fi
++                       LIBS="-lwrap $LIBS"
++                       AC_MSG_CHECKING([for libwrap])
++                       AC_LINK_IFELSE([AC_LANG_PROGRAM([[
++#include <sys/types.h>
++#include <sys/socket.h>
++#include <netinet/in.h>
++#include <tcpd.h>
++int deny_severity = 0, allow_severity = 0;
++                               ]], [[
++       hosts_access(0);
++                               ]])], [
++                                       AC_MSG_RESULT([yes])
++                                       AC_DEFINE([LIBWRAP], [1],
++                                               [Define if you want
++                                               TCP Wrappers support])
++                                       SSHDLIBS="$SSHDLIBS -lwrap"
++                                       TCPW_MSG="yes"
++                               ], [
++                                       AC_MSG_ERROR([*** libwrap missing])
++                       ])
++                       LIBS="$saved_LIBS"
++               fi
++       ]
++)
++
+ # Check whether user wants to use ldns
+ LDNS_MSG="no"
+ AC_ARG_WITH(ldns,
+@@ -5216,6 +5271,7 @@ echo "                   OSF SIA support: $SIA_MSG"
+ echo "                 KerberosV support: $KRB5_MSG"
+ echo "                   SELinux support: $SELINUX_MSG"
+ echo "                     S/KEY support: $SKEY_MSG"
++echo "              TCP Wrappers support: $TCPW_MSG"
+ echo "              MD5 password support: $MD5_MSG"
+ echo "                   libedit support: $LIBEDIT_MSG"
+ echo "                   libldns support: $LDNS_MSG"
+diff --git a/sshd.8 b/sshd.8
+index 968ba66..c8299d5 100644
+--- a/sshd.8
++++ b/sshd.8
+@@ -845,6 +845,12 @@ the user's home directory becomes accessible.
+ This file should be writable only by the user, and need not be
+ readable by anyone else.
+ .Pp
++.It Pa /etc/hosts.allow
++.It Pa /etc/hosts.deny
++Access controls that should be enforced by tcp-wrappers are defined here.
++Further details are described in
++.Xr hosts_access 5 .
++.Pp
+ .It Pa /etc/hosts.equiv
+ This file is for host-based authentication (see
+ .Xr ssh 1 ) .
+@@ -947,6 +953,7 @@ The content of this file is not sensitive; it can be world-readable.
+ .Xr ssh-keygen 1 ,
+ .Xr ssh-keyscan 1 ,
+ .Xr chroot 2 ,
++.Xr hosts_access 5 ,
+ .Xr login.conf 5 ,
+ .Xr moduli 5 ,
+ .Xr sshd_config 5 ,
+diff --git a/sshd.c b/sshd.c
+index fd95b68..82607d8 100644
+--- a/sshd.c
++++ b/sshd.c
+@@ -123,6 +123,13 @@
+ #include "version.h"
+ #include "ssherr.h"
+ 
++#ifdef LIBWRAP
++#include <tcpd.h>
++#include <syslog.h>
++int allow_severity;
++int deny_severity;
++#endif /* LIBWRAP */
++
+ /* Re-exec fds */
+ #define REEXEC_DEVCRYPTO_RESERVED_FD	(STDERR_FILENO + 1)
+ #define REEXEC_STARTUP_PIPE_FD		(STDERR_FILENO + 2)
+@@ -2036,6 +2043,25 @@ main(int ac, char **av)
+ 	audit_connection_from(remote_ip, remote_port);
+ #endif
+ 
++#ifdef LIBWRAP
++       allow_severity = options.log_facility|LOG_INFO;
++       deny_severity = options.log_facility|LOG_WARNING;
++       /* Check whether logins are denied from this host. */
++       if (packet_connection_is_on_socket()) {
++               struct request_info req;
++
++               request_init(&req, RQ_DAEMON, __progname, RQ_FILE, sock_in, 0);
++               fromhost(&req);
++
++               if (!hosts_access(&req)) {
++                       debug("Connection refused by tcp wrapper");
++                       refuse(&req);
++                       /* NOTREACHED */
++                       fatal("libwrap refuse returns");
++               }
++       }
++#endif /* LIBWRAP */
++
+ 	rdomain = ssh_packet_rdomain_in(ssh);
+ 
+ 	/* Log the connection. */
diff --git a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
index b3da5f6..0696587 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
            file://disable-ciphers-not-supported-by-OpenSSL-DES.patch \
+           file://0001-Restore-TCP-wrappers-support.patch \
            "
 
 PAM_SRC_URI = "file://sshd"
@@ -61,6 +62,9 @@ EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
 # musl doesn't implement wtmp/utmp
 EXTRA_OECONF_append_libc-musl = " --disable-wtmp"
 
+PACKAGECONFIG ??= "tcp-wrappers"
+PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,,tcp-wrappers"
+
 # Since we do not depend on libbsd, we do not want configure to use it
 # just because it finds libutil.h.  But, specifying --disable-libutil
 # causes compile errors, so...
-- 
2.7.4


