Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD634C3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 16:55:42 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.20230.1721321738931619911
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 09:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iwO23lMC;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4266f3e0df8so4564825e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 09:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721321737; x=1721926537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ypqff8RIE4mNzKTsmTUdVFrD5iuv6IIC2ohuSHjNPro=;
        b=iwO23lMCXNZhtnhBGuFdO+RomHzBUTyvj0tQw/PcN4d/O3e+ox0w/Wa4qFt0Sjhqkk
         nUA+J0jNHJ8Zolvp0guxh5b8L/ynYa9HpuJYwQLDYVgv5F5AfI/+vc78wHnX45ttS+i7
         R9fHQlO2JwUHQlwNrzzWz9SR39v+Kf0fdV4K6h90oRaEiiFkxwtXlmTfvhj6JZ+sE9K4
         8HAcRPpeeP3FqaDTfiKj3bP6w6qb8PISwgr/Akb2fTHfdcaSEVh/Azvcn2eHlKG7qGvv
         2NaC0bil10Y6rP5k6zqk5e+CKHc8LtIpjEQKL8cbRpKQECnFYZsgJHCH8hI+va/fD/uj
         PfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721321737; x=1721926537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ypqff8RIE4mNzKTsmTUdVFrD5iuv6IIC2ohuSHjNPro=;
        b=aJJN28Y5vvjal+l1jOYBRTTWPZwmqoI/PfnSa0v4L3mAPQnYGGQxLRXut7erA0B4ha
         JzgOS/xfWV8pIY2Zzd0hM1v9zBrKdacMG2dXBlQ/5YitnvB/lZahEIkfyH9yqxYe61Ve
         mp58IS9WvpckD4J7GYozk0gHTdeWSDxlCV/SyXBOcBWb91+DQUkR+Dne+lEpf3ovQeD3
         CnwPNyTYLjHVRtxiM17iiXRn8WypqubFOn5uL9TWfOZNWPcRagh2rBtTaNiIy2cbSltH
         XkJMgN0LGXlbffqLAuC8leIVJHVdDKTCEEyz0yqK4s0fpFtIB/Hrqk7MTPPfXbYJJeHU
         z0HQ==
X-Gm-Message-State: AOJu0YyPEqW3yEGPcH5ytefpoxx1WMJ7IXS9B5pSiLXTJECpnAmaEWFu
	8/8vba2FfYJhTEs4BrfPuiW0v90JnRufz9B+E4w+Eb+VAcNO8q6Sl7qyGw==
X-Google-Smtp-Source: AGHT+IEaF7Tiye9ShWIvLroAaNzXgOIkpMR/3sglEN6zJQD2jI6ECsZK8yXnoJq3WzHM0m6MYZdG7g==
X-Received: by 2002:a05:600c:45c8:b0:426:6389:94c4 with SMTP id 5b1f17b1804b1-427c2d0d669mr38063455e9.37.1721321736767;
        Thu, 18 Jul 2024 09:55:36 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a6e91fsm22014035e9.23.2024.07.18.09.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 09:55:36 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v7 1/2] openssh: systemd notification was implemented upstream
Date: Thu, 18 Jul 2024 17:54:47 +0100
Message-ID: <20240718165448.1164-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 16:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202230

Drop our rejected sd-notify patch and switch to the upstream standalone
implementation that does not depend on libsystemd.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

v4:
 - split update of Upstream-Status in new patches in the serie

v5:
 - use the upstream solution

v6:
 - sshd socket service runs with '-i' and don't support systemd notification

v7:
 - rebase and rewrite the commit message

 ...-notify-systemd-on-listen-and-reload.patch | 225 ++++++++++++++++++
 ...tional-support-for-systemd-sd_notify.patch |  96 --------
 .../openssh/openssh/sshd.service              |   2 +-
 .../openssh/openssh_9.7p1.bb                  |   4 +-
 4 files changed, 227 insertions(+), 100 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-listen-and-reload.patch
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-listen-and-reload.patch b/meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-listen-and-reload.patch
new file mode 100644
index 0000000000..4925c969fe
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-listen-and-reload.patch
@@ -0,0 +1,225 @@
+From fc73e2405a8ca928465580b74a4d76112919367b Mon Sep 17 00:00:00 2001
+From: Damien Miller <djm@mindrot.org>
+Date: Wed, 3 Apr 2024 14:40:32 +1100
+Subject: [PATCH] notify systemd on listen and reload
+
+Standalone implementation that does not depend on libsystemd.
+With assistance from Luca Boccassi, and feedback/testing from Colin
+Watson. bz2641
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/08f579231cd38a1c657aaa6ddeb8ab57a1fd4f5c]
+
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
+---
+ configure.ac                |  1 +
+ openbsd-compat/port-linux.c | 97 ++++++++++++++++++++++++++++++++++++-
+ openbsd-compat/port-linux.h |  5 ++
+ platform.c                  | 11 +++++
+ platform.h                  |  1 +
+ sshd.c                      |  2 +
+ 6 files changed, 115 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 82e8bb7c1..854f92b5b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -915,6 +915,7 @@ int main(void) { if (NSVersionOfRunTimeLibrary("System") >= (60 << 16))
+ 	AC_DEFINE([_PATH_BTMP], ["/var/log/btmp"], [log for bad login attempts])
+ 	AC_DEFINE([USE_BTMP])
+ 	AC_DEFINE([LINUX_OOM_ADJUST], [1], [Adjust Linux out-of-memory killer])
++	AC_DEFINE([SYSTEMD_NOTIFY], [1], [Have sshd notify systemd on start/reload])
+ 	inet6_default_4in6=yes
+ 	case `uname -r` in
+ 	1.*|2.0.*)
+diff --git a/openbsd-compat/port-linux.c b/openbsd-compat/port-linux.c
+index 0457e28d0..df7290246 100644
+--- a/openbsd-compat/port-linux.c
++++ b/openbsd-compat/port-linux.c
+@@ -21,16 +21,23 @@
+ 
+ #include "includes.h"
+ 
+-#if defined(WITH_SELINUX) || defined(LINUX_OOM_ADJUST)
++#if defined(WITH_SELINUX) || defined(LINUX_OOM_ADJUST) || \
++    defined(SYSTEMD_NOTIFY)
++#include <sys/socket.h>
++#include <sys/un.h>
++
+ #include <errno.h>
++#include <inttypes.h>
+ #include <stdarg.h>
+ #include <string.h>
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <time.h>
+ 
+ #include "log.h"
+ #include "xmalloc.h"
+ #include "port-linux.h"
++#include "misc.h"
+ 
+ #ifdef WITH_SELINUX
+ #include <selinux/selinux.h>
+@@ -310,4 +317,90 @@ oom_adjust_restore(void)
+ 	return;
+ }
+ #endif /* LINUX_OOM_ADJUST */
+-#endif /* WITH_SELINUX || LINUX_OOM_ADJUST */
++
++#ifdef SYSTEMD_NOTIFY
++
++static void ssh_systemd_notify(const char *, ...)
++    __attribute__((__format__ (printf, 1, 2))) __attribute__((__nonnull__ (1)));
++
++static void
++ssh_systemd_notify(const char *fmt, ...)
++{
++	char *s = NULL;
++	const char *path;
++	struct stat sb;
++	struct sockaddr_un addr;
++	int fd = -1;
++	va_list ap;
++
++	if ((path = getenv("NOTIFY_SOCKET")) == NULL || strlen(path) == 0)
++		return;
++
++	va_start(ap, fmt);
++	xvasprintf(&s, fmt, ap);
++	va_end(ap);
++
++	/* Only AF_UNIX is supported, with path or abstract sockets */
++	if (path[0] != '/' && path[0] != '@') {
++		error_f("socket \"%s\" is not compatible with AF_UNIX", path);
++		goto out;
++	}
++
++	if (path[0] == '/' && stat(path, &sb) != 0) {
++		error_f("socket \"%s\" stat: %s", path, strerror(errno));
++		goto out;
++	}
++
++	memset(&addr, 0, sizeof(addr));
++	addr.sun_family = AF_UNIX;
++	if (strlcpy(addr.sun_path, path,
++	    sizeof(addr.sun_path)) >= sizeof(addr.sun_path)) {
++		error_f("socket path \"%s\" too long", path);
++		goto out;
++	}
++	/* Support for abstract socket */
++	if (addr.sun_path[0] == '@')
++		addr.sun_path[0] = 0;
++	if ((fd = socket(PF_UNIX, SOCK_DGRAM, 0)) == -1) {
++		error_f("socket \"%s\": %s", path, strerror(errno));
++		goto out;
++	}
++	if (connect(fd, &addr, sizeof(addr)) != 0) {
++		error_f("socket \"%s\" connect: %s", path, strerror(errno));
++		goto out;
++	}
++	if (write(fd, s, strlen(s)) != (ssize_t)strlen(s)) {
++		error_f("socket \"%s\" write: %s", path, strerror(errno));
++		goto out;
++	}
++	debug_f("socket \"%s\" notified %s", path, s);
++ out:
++	if (fd != -1)
++		close(fd);
++	free(s);
++}
++
++void
++ssh_systemd_notify_ready(void)
++{
++	ssh_systemd_notify("READY=1");
++}
++
++void
++ssh_systemd_notify_reload(void)
++{
++	struct timespec now;
++
++	monotime_ts(&now);
++	if (now.tv_sec < 0 || now.tv_nsec < 0) {
++		error_f("monotime returned negative value");
++		ssh_systemd_notify("RELOADING=1");
++	} else {
++		ssh_systemd_notify("RELOADING=1\nMONOTONIC_USEC=%llu",
++		    ((uint64_t)now.tv_sec * 1000000ULL) +
++		    ((uint64_t)now.tv_nsec / 1000ULL));
++	}
++}
++#endif /* SYSTEMD_NOTIFY */
++
++#endif /* WITH_SELINUX || LINUX_OOM_ADJUST || SYSTEMD_NOTIFY */
+diff --git a/openbsd-compat/port-linux.h b/openbsd-compat/port-linux.h
+index 3c22a854d..14064f87d 100644
+--- a/openbsd-compat/port-linux.h
++++ b/openbsd-compat/port-linux.h
+@@ -30,4 +30,9 @@ void oom_adjust_restore(void);
+ void oom_adjust_setup(void);
+ #endif
+ 
++#ifdef SYSTEMD_NOTIFY
++void ssh_systemd_notify_ready(void);
++void ssh_systemd_notify_reload(void);
++#endif
++
+ #endif /* ! _PORT_LINUX_H */
+diff --git a/platform.c b/platform.c
+index 4fe8744ee..9cf818153 100644
+--- a/platform.c
++++ b/platform.c
+@@ -44,6 +44,14 @@ platform_pre_listen(void)
+ #endif
+ }
+ 
++void
++platform_post_listen(void)
++{
++#ifdef SYSTEMD_NOTIFY
++	ssh_systemd_notify_ready();
++#endif
++}
++
+ void
+ platform_pre_fork(void)
+ {
+@@ -55,6 +63,9 @@ platform_pre_fork(void)
+ void
+ platform_pre_restart(void)
+ {
++#ifdef SYSTEMD_NOTIFY
++	ssh_systemd_notify_reload();
++#endif
+ #ifdef LINUX_OOM_ADJUST
+ 	oom_adjust_restore();
+ #endif
+diff --git a/platform.h b/platform.h
+index 7fef8c983..5dec23276 100644
+--- a/platform.h
++++ b/platform.h
+@@ -21,6 +21,7 @@
+ void platform_pre_listen(void);
+ void platform_pre_fork(void);
+ void platform_pre_restart(void);
++void platform_post_listen(void);
+ void platform_post_fork_parent(pid_t child_pid);
+ void platform_post_fork_child(void);
+ int  platform_privileged_uidswap(void);
+diff --git a/sshd.c b/sshd.c
+index b4f2b9742..865331b46 100644
+--- a/sshd.c
++++ b/sshd.c
+@@ -2077,6 +2077,8 @@ main(int ac, char **av)
+ 		ssh_signal(SIGTERM, sigterm_handler);
+ 		ssh_signal(SIGQUIT, sigterm_handler);
+ 
++		platform_post_listen();
++
+ 		/*
+ 		 * Write out the pid file after the sigterm handler
+ 		 * is setup and the listen sockets are bound
+-- 
+2.45.2
+
diff --git a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
deleted file mode 100644
index a0fe5a2773..0000000000
--- a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From b02ef7621758f06eb686ef4f620636dbad086eda Mon Sep 17 00:00:00 2001
-From: Matt Jolly <Matt.Jolly@footclan.ninja>
-Date: Thu, 2 Feb 2023 21:05:40 +1100
-Subject: [PATCH] systemd: Add optional support for systemd `sd_notify`
-
-This is a rebase of Dennis Lamm's <expeditioneer@gentoo.org>
-patch based on Jakub Jelen's <jjelen@redhat.com> original patch
-
-Upstream-Status: Denied [https://github.com/openssh/openssh-portable/pull/375/commits/be187435911cde6cc3cef6982a508261074f1e56]
-
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
----
- configure.ac | 24 ++++++++++++++++++++++++
- sshd.c       | 13 +++++++++++++
- 2 files changed, 37 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 82e8bb7..d1145d3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4870,6 +4870,29 @@ AC_SUBST([GSSLIBS])
- AC_SUBST([K5LIBS])
- AC_SUBST([CHANNELLIBS])
- 
-+# Check whether user wants systemd support
-+SYSTEMD_MSG="no"
-+AC_ARG_WITH(systemd,
-+	[  --with-systemd          Enable systemd support],
-+	[ if test "x$withval" != "xno" ; then
-+		AC_PATH_TOOL([PKGCONFIG], [pkg-config], [no])
-+		if test "$PKGCONFIG" != "no"; then
-+			AC_MSG_CHECKING([for libsystemd])
-+			if $PKGCONFIG --exists libsystemd; then
-+				SYSTEMD_CFLAGS=`$PKGCONFIG --cflags libsystemd`
-+				SYSTEMD_LIBS=`$PKGCONFIG --libs libsystemd`
-+				CPPFLAGS="$CPPFLAGS $SYSTEMD_CFLAGS"
-+				SSHDLIBS="$SSHDLIBS $SYSTEMD_LIBS"
-+				AC_MSG_RESULT([yes])
-+				AC_DEFINE(HAVE_SYSTEMD, 1, [Define if you want systemd support.])
-+				SYSTEMD_MSG="yes"
-+			else
-+				AC_MSG_RESULT([no])
-+			fi
-+		fi
-+	fi ]
-+)
-+
- # Looking for programs, paths and files
- 
- PRIVSEP_PATH=/var/empty
-@@ -5688,6 +5711,7 @@ echo "                   libldns support: $LDNS_MSG"
- echo "  Solaris process contract support: $SPC_MSG"
- echo "           Solaris project support: $SP_MSG"
- echo "         Solaris privilege support: $SPP_MSG"
-+echo "                   systemd support: $SYSTEMD_MSG"
- echo "       IP address in \$DISPLAY hack: $DISPLAY_HACK_MSG"
- echo "           Translate v4 in v6 hack: $IPV4_IN6_HACK_MSG"
- echo "                  BSD Auth support: $BSD_AUTH_MSG"
-diff --git a/sshd.c b/sshd.c
-index b4f2b97..6820a41 100644
---- a/sshd.c
-+++ b/sshd.c
-@@ -88,6 +88,10 @@
- #include <prot.h>
- #endif
- 
-+#ifdef HAVE_SYSTEMD
-+#include <systemd/sd-daemon.h>
-+#endif
-+
- #include "xmalloc.h"
- #include "ssh.h"
- #include "ssh2.h"
-@@ -308,6 +312,10 @@ static void
- sighup_restart(void)
- {
- 	logit("Received SIGHUP; restarting.");
-+#ifdef HAVE_SYSTEMD
-+	/* Signal systemd that we are reloading */
-+	sd_notify(0, "RELOADING=1");
-+#endif
- 	if (options.pid_file != NULL)
- 		unlink(options.pid_file);
- 	platform_pre_restart();
-@@ -2093,6 +2101,11 @@ main(int ac, char **av)
- 			}
- 		}
- 
-+#ifdef HAVE_SYSTEMD
-+		/* Signal systemd that we are ready to accept connections */
-+		sd_notify(0, "READY=1");
-+#endif
-+
- 		/* Accept a connection and return in a forked child */
- 		server_accept_loop(&sock_in, &sock_out,
- 		    &newsock, config_s);
diff --git a/meta/recipes-connectivity/openssh/openssh/sshd.service b/meta/recipes-connectivity/openssh/openssh/sshd.service
index 3e570ab1e5..c71fff1cc1 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd.service
+++ b/meta/recipes-connectivity/openssh/openssh/sshd.service
@@ -5,11 +5,11 @@ After=sshdgenkeys.service
 After=nss-user-lookup.target
 
 [Service]
+Type=notify-reload
 Environment="SSHD_OPTS="
 EnvironmentFile=-/etc/default/ssh
 ExecStartPre=@BASE_BINDIR@/mkdir -p /var/run/sshd
 ExecStart=-@SBINDIR@/sshd -D $SSHD_OPTS
-ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
 KillMode=process
 Restart=on-failure
 RestartSec=42s
diff --git a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
index 4f20616295..4680d12be5 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
@@ -24,7 +24,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://run-ptest \
            file://sshd_check_keys \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
-           file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patch \
+           file://0001-notify-systemd-on-listen-and-reload.patch \
            file://CVE-2024-6387.patch \
            "
 SRC_URI[sha256sum] = "490426f766d82a2763fcacd8d83ea3d70798750c7bd2aff2e57dc5660f773ffd"
@@ -52,7 +52,6 @@ SYSTEMD_PACKAGES = "${PN}-sshd"
 SYSTEMD_SERVICE:${PN}-sshd = "${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-socket-mode','sshd.socket', '', d)} ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-service-mode','sshd.service', '', d)}"
 
 inherit autotools-brokensep ptest pkgconfig
-DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
 # systemd-sshd-socket-mode means installing sshd.socket
 # and systemd-sshd-service-mode corresponding to sshd.service
@@ -78,7 +77,6 @@ EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
                 --sysconfdir=${sysconfdir}/ssh \
                 --with-xauth=${bindir}/xauth \
                 --disable-strip \
-                ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemd', '--without-systemd', d)} \
                 "
 
 # musl doesn't implement wtmp/utmp and logwtmp
-- 
2.45.2


