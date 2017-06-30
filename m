Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5452578232
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 05:11:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v5U5Bmn4025851
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 22:11:49 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 29 Jun 2017 22:11:48 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Jun 2017 01:11:45 -0400
Message-ID: <a32833cb31e850e5594191f93148720a5e54ab3d.1498799447.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1498799447.git.dengke.du@windriver.com>
References: <cover.1498799447.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] openssh: Restore TCP wrappers support
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
X-List-Received-Date: Fri, 30 Jun 2017 05:11:48 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

The /etc/hosts.deny doesn't work for sshd without tcp-wrappers support,
apply below patch from Debian to fix it:

  From 1850a2c93f3dcfa3d682eaa85d1593c01d170429 Mon Sep 17 00:00:00 2001
  From: Colin Watson <cjwatson@debian.org>
  Date: Tue, 7 Oct 2014 13:22:41 +0100
  Subject: Restore TCP wrappers support

  Support for TCP wrappers was dropped in OpenSSH 6.7.  See this message
  and thread:

    https://lists.mindrot.org/pipermail/openssh-unix-dev/2014-April/032497.html

  It is true that this reduces preauth attack surface in sshd.  On the
  other hand, this support seems to be quite widely used, and abruptly
  dropping it (from the perspective of users who don't read
  openssh-unix-dev) could easily cause more serious problems in practice.

Link to patch file:
  http://anonscm.debian.org/cgit/pkg-ssh/openssh.git/tree/debian/ \
    patches/restore-tcp-wrappers.patch

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../openssh/openssh/restore-tcp-wrappers.patch     | 183 +++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_7.5p1.bb |   4 +
 2 files changed, 187 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/restore-tcp-wrappers.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/restore-tcp-wrappers.patch b/meta/recipes-connectivity/openssh/openssh/restore-tcp-wrappers.patch
new file mode 100644
index 0000000..81d9b62
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/restore-tcp-wrappers.patch
@@ -0,0 +1,183 @@
+From 8a81eb8a57dda76b825556e6992073bd705d572e Mon Sep 17 00:00:00 2001
+From: Colin Watson <cjwatson@debian.org>
+Date: Tue, 7 Oct 2014 13:22:41 +0100
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
+It's not entirely clear what the right long-term answer for Debian is,
+but it at least probably doesn't involve dropping this feature shortly
+before a freeze.
+
+Forwarded: not-needed
+Last-Update: 2014-10-07
+
+Upstream-Status: Inappropriate
+
+Patch-Name: restore-tcp-wrappers.patch
+
+This patch was imported by wenzong firstly, the following sign is not
+the origin author, just adjust it to fit for new version of openssh.
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ configure.ac | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ sshd.8       |  7 +++++++
+ sshd.c       | 26 ++++++++++++++++++++++++++
+ 3 files changed, 90 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index c2878e3..8dc0701 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1470,6 +1470,62 @@ AC_ARG_WITH([skey],
+ 	]
+ )
+ 
++# Check whether user wants TCP wrappers support
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
++                               
++                       ])
++                       LIBS="$saved_LIBS"
++               fi
++       ]
++)
++
+ # Check whether user wants to use ldns
+ LDNS_MSG="no"
+ AC_ARG_WITH(ldns,
+@@ -5093,6 +5149,7 @@ echo "                 KerberosV support: $KRB5_MSG"
+ echo "                   SELinux support: $SELINUX_MSG"
+ echo "                 Smartcard support: $SCARD_MSG"
+ echo "                     S/KEY support: $SKEY_MSG"
++echo "              TCP Wrappers support: $TCPW_MSG"
+ echo "              MD5 password support: $MD5_MSG"
+ echo "                   libedit support: $LIBEDIT_MSG"
+ echo "                   libldns support: $LDNS_MSG"
+diff --git a/sshd.8 b/sshd.8
+index 7725a69..989dd4b 100644
+--- a/sshd.8
++++ b/sshd.8
+@@ -825,6 +825,12 @@ the user's home directory becomes accessible.
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
+@@ -929,6 +935,7 @@ The content of this file is not sensitive; it can be world-readable.
+ .Xr ssh-keygen 1 ,
+ .Xr ssh-keyscan 1 ,
+ .Xr chroot 2 ,
++.Xr hosts_access 5 ,
+ .Xr login.conf 5 ,
+ .Xr moduli 5 ,
+ .Xr sshd_config 5 ,
+diff --git a/sshd.c b/sshd.c
+index 010a2c3..4b16c64 100644
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
+@@ -1986,6 +1993,25 @@ main(int ac, char **av)
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
+ 	/* Log the connection. */
+ 	laddr = get_local_ipaddr(sock_in);
+ 	verbose("Connection from %s port %d on %s port %d",
+-- 
+2.11.0
+
diff --git a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
index 7bd313b..5a0303f 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://openssh-7.1p1-conditional-compile-des-in-cipher.patch \
            file://openssh-7.1p1-conditional-compile-des-in-pkcs11.patch \
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
+           file://restore-tcp-wrappers.patch \
            "
 
 PAM_SRC_URI = "file://sshd"
@@ -58,6 +59,9 @@ EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
                 --disable-strip \
                 "
 
+PACKAGECONFIG ??= "tcp-wrappers"
+PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,,tcp-wrappers"
+
 # Since we do not depend on libbsd, we do not want configure to use it
 # just because it finds libutil.h.  But, specifying --disable-libutil
 # causes compile errors, so...
-- 
2.8.1


