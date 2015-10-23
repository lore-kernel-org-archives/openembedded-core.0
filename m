Return-Path: <Wenzong.Fan@windriver.com>
X-Greylist: delayed 2695 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 23 Oct 2015 08:19:43 UTC
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by mail.openembedded.org (Postfix) with ESMTP id 757A46013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 08:19:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9N7YmBo025127
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 00:34:48 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 23 Oct 2015 00:34:46 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Oct 2015 03:34:46 -0400
Message-ID: <1445585686-41410-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
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
X-List-Received-Date: Fri, 23 Oct 2015 08:19:43 -0000
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
---
 .../openssh/openssh/restore-tcp-wrappers.patch     | 174 +++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_7.1p1.bb |   4 +
 2 files changed, 178 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/restore-tcp-wrappers.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/restore-tcp-wrappers.patch b/meta/recipes-connectivity/openssh/openssh/restore-tcp-wrappers.patch
new file mode 100644
index 0000000..1d819fa
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/restore-tcp-wrappers.patch
@@ -0,0 +1,174 @@
+From 1850a2c93f3dcfa3d682eaa85d1593c01d170429 Mon Sep 17 00:00:00 2001
+From: Colin Watson <cjwatson@debian.org>
+Date: Tue, 7 Oct 2014 13:22:41 +0100
+Subject: Restore TCP wrappers support
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
+---
+ configure.ac | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ sshd.8       |  7 +++++++
+ sshd.c       | 25 +++++++++++++++++++++++++
+ 3 files changed, 89 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index df21693..4d55c46 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1448,6 +1448,62 @@ AC_ARG_WITH([skey],
+ 	]
+ )
+ 
++# Check whether user wants TCP wrappers support
++TCPW_MSG="no"
++AC_ARG_WITH([tcp-wrappers],
++	[  --with-tcp-wrappers[[=PATH]] Enable tcpwrappers support (optionally in PATH)],
++	[
++		if test "x$withval" != "xno" ; then
++			saved_LIBS="$LIBS"
++			saved_LDFLAGS="$LDFLAGS"
++			saved_CPPFLAGS="$CPPFLAGS"
++			if test -n "${withval}" && \
++			    test "x${withval}" != "xyes"; then
++				if test -d "${withval}/lib"; then
++					if test -n "${need_dash_r}"; then
++						LDFLAGS="-L${withval}/lib -R${withval}/lib ${LDFLAGS}"
++					else
++						LDFLAGS="-L${withval}/lib ${LDFLAGS}"
++					fi
++				else
++					if test -n "${need_dash_r}"; then
++						LDFLAGS="-L${withval} -R${withval} ${LDFLAGS}"
++					else
++						LDFLAGS="-L${withval} ${LDFLAGS}"
++					fi
++				fi
++				if test -d "${withval}/include"; then
++					CPPFLAGS="-I${withval}/include ${CPPFLAGS}"
++				else
++					CPPFLAGS="-I${withval} ${CPPFLAGS}"
++				fi
++			fi
++			LIBS="-lwrap $LIBS"
++			AC_MSG_CHECKING([for libwrap])
++			AC_LINK_IFELSE([AC_LANG_PROGRAM([[
++#include <sys/types.h>
++#include <sys/socket.h>
++#include <netinet/in.h>
++#include <tcpd.h>
++int deny_severity = 0, allow_severity = 0;
++				]], [[
++	hosts_access(0);
++				]])], [
++					AC_MSG_RESULT([yes])
++					AC_DEFINE([LIBWRAP], [1],
++						[Define if you want
++						TCP Wrappers support])
++					SSHDLIBS="$SSHDLIBS -lwrap"
++					TCPW_MSG="yes"
++				], [
++					AC_MSG_ERROR([*** libwrap missing])
++				
++			])
++			LIBS="$saved_LIBS"
++		fi
++	]
++)
++
+ # Check whether user wants to use ldns
+ LDNS_MSG="no"
+ AC_ARG_WITH(ldns,
+@@ -4928,6 +4984,7 @@ echo "                 KerberosV support: $KRB5_MSG"
+ echo "                   SELinux support: $SELINUX_MSG"
+ echo "                 Smartcard support: $SCARD_MSG"
+ echo "                     S/KEY support: $SKEY_MSG"
++echo "              TCP Wrappers support: $TCPW_MSG"
+ echo "              MD5 password support: $MD5_MSG"
+ echo "                   libedit support: $LIBEDIT_MSG"
+ echo "  Solaris process contract support: $SPC_MSG"
+diff --git a/sshd.8 b/sshd.8
+index dcf20f0..5afd10f 100644
+--- a/sshd.8
++++ b/sshd.8
+@@ -853,6 +853,12 @@ the user's home directory becomes accessible.
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
+@@ -956,6 +962,7 @@ The content of this file is not sensitive; it can be world-readable.
+ .Xr ssh-keygen 1 ,
+ .Xr ssh-keyscan 1 ,
+ .Xr chroot 2 ,
++.Xr hosts_access 5 ,
+ .Xr login.conf 5 ,
+ .Xr moduli 5 ,
+ .Xr sshd_config 5 ,
+diff --git a/sshd.c b/sshd.c
+index 6b85e6c..186ad55 100644
+--- a/sshd.c
++++ b/sshd.c
+@@ -129,6 +129,13 @@
+ #include <Security/AuthSession.h>
+ #endif
+ 
++#ifdef LIBWRAP
++#include <tcpd.h>
++#include <syslog.h>
++int allow_severity;
++int deny_severity;
++#endif /* LIBWRAP */
++
+ #ifndef O_NOCTTY
+ #define O_NOCTTY	0
+ #endif
+@@ -2141,6 +2148,24 @@ main(int ac, char **av)
+ #ifdef SSH_AUDIT_EVENTS
+ 	audit_connection_from(remote_ip, remote_port);
+ #endif
++#ifdef LIBWRAP
++	allow_severity = options.log_facility|LOG_INFO;
++	deny_severity = options.log_facility|LOG_WARNING;
++	/* Check whether logins are denied from this host. */
++	if (packet_connection_is_on_socket()) {
++		struct request_info req;
++
++		request_init(&req, RQ_DAEMON, __progname, RQ_FILE, sock_in, 0);
++		fromhost(&req);
++
++		if (!hosts_access(&req)) {
++			debug("Connection refused by tcp wrapper");
++			refuse(&req);
++			/* NOTREACHED */
++			fatal("libwrap refuse returns");
++		}
++	}
++#endif /* LIBWRAP */
+ 
+ 	/* Log the connection. */
+ 	laddr = get_local_ipaddr(sock_in);
diff --git a/meta/recipes-connectivity/openssh/openssh_7.1p1.bb b/meta/recipes-connectivity/openssh/openssh_7.1p1.bb
index 40938cc..b621f62 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.1p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.1p1.bb
@@ -20,6 +20,7 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://sshdgenkeys.service \
            file://volatiles.99_sshd \
            file://add-test-support-for-busybox.patch \
+           file://restore-tcp-wrappers.patch \
            file://run-ptest"
 
 PAM_SRC_URI = "file://sshd"
@@ -53,6 +54,9 @@ EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
                 --disable-strip \
                 "
 
+PACKAGECONFIG ??= "tcp-wrappers"
+PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,,tcp-wrappers"
+
 # Since we do not depend on libbsd, we do not want configure to use it
 # just because it finds libutil.h.  But, specifying --disable-libutil
 # causes compile errors, so...
-- 
1.9.1


