Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE995C41513
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 16:55:42 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.20204.1721321740078842407
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 09:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ckpD2hAT;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-367990aaef3so45270f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 09:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721321738; x=1721926538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ma13U2PDpaMDqiWO2SEphqejGUQVyt1/jRM6a3iUYMo=;
        b=ckpD2hATKse8nltxfY5FaAbOZdCfical+uIvkL2lxPFS1mPDRrWxtkzltJfXabED6z
         sUeVawZdQrSY6KQ+9+nty0BkPgmkCu3EGKVd+Lt3QUSJPCTvyR6/ZoDUPbMg4zr1BExg
         vUAtrGXG0S9C/V8y1SzHhUXOJHd1PbQeBjWLy82NYIFRbLR3Ccu4cm1/D+xPIDrZyv9G
         xPmtbP8eY4lXjXR2hGTbvB+QwFslbTrMY2cTVedU0UHQfox1iRv21AL++x8zDghk8cN0
         UXtYinAQIyiODDOCtMhSociRuYhBAgKJA1XoFznycMU1srChciLmjz+46JCT7KmStGha
         xtgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721321738; x=1721926538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ma13U2PDpaMDqiWO2SEphqejGUQVyt1/jRM6a3iUYMo=;
        b=kDpbSENPRU6XJL8BqJ7DQlGAzpBmvlzoRu8oCMBxijNYyI7LQZhCmRMvNGujB4nbVD
         pUMhOvfhp0qWMsKuyhyCwqgRAm26OTIwg5/zEnECSe9O01c1e04Rc5onpPqtjrFkGFaL
         5lPdvAxfsgAFcKK3gd3h2moqHAJ6ekdUx60ohovLN6TiQnNniVcvxMhuta9O+qgwbcfI
         i83W+3779xmLpDGT76aY4yfFtuLesxwy09X+75pcU8LvLQ2yHBYkRZEsflOjKQAwRrMR
         7bRZgN6vDnpTQCaKkUQMiHcDflRpABbZSTPrGDLayiDPBrht1XCtA5Ew1UaANjXA0pSI
         npww==
X-Gm-Message-State: AOJu0YwOuo1LTvGCDLVyuQKN+Naw26B3cPRcjvG7bn8LaKtcyx9o53Xf
	KyxQj8zi50PvAjKnZpul6c8IMycoa9ZNU6Ct9yL9N4lkFcIhuTgR/kzQLA==
X-Google-Smtp-Source: AGHT+IFKKCI/XeEVDFUcUGXd73e8k6jIzoH/8Opvzs8M5wr4lT3THLHkzYWvOEAgHmlpNWU1BZrPow==
X-Received: by 2002:a5d:4211:0:b0:366:ed80:d045 with SMTP id ffacd0b85a97d-3683171fe8fmr3511014f8f.47.1721321737603;
        Thu, 18 Jul 2024 09:55:37 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a6e91fsm22014035e9.23.2024.07.18.09.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 09:55:37 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v7 2/2] openssh: upgrade 9.7p1 -> 9.8p1
Date: Thu, 18 Jul 2024 17:54:48 +0100
Message-ID: <20240718165448.1164-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718165448.1164-1-jose.quaresma@foundries.io>
References: <20240718165448.1164-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 16:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202231

- drop the CVE-2024-6387
- fix musl build [backported patch]
- fix ptest regression [submited patch]
- sshd now had the sshd-session

Release notes at https://www.openssh.com/txt/release-9.8

Security
========

This release contains fixes for two security problems, one critical
and one minor.

1) Race condition in sshd(8)

A critical vulnerability in sshd(8) was present in Portable OpenSSH
versions between 8.5p1 and 9.7p1 (inclusive) that may allow arbitrary
code execution with root privileges.

Successful exploitation has been demonstrated on 32-bit Linux/glibc
systems with ASLR. Under lab conditions, the attack requires on
average 6-8 hours of continuous connections up to the maximum the
server will accept. Exploitation on 64-bit systems is believed to be
possible but has not been demonstrated at this time. It's likely that
these attacks will be improved upon.

Exploitation on non-glibc systems is conceivable but has not been
examined. Systems that lack ASLR or users of downstream Linux
distributions that have modified OpenSSH to disable per-connection
ASLR re-randomisation (yes - this is a thing, no - we don't
understand why) may potentially have an easier path to exploitation.
OpenBSD is not vulnerable.

We thank the Qualys Security Advisory Team for discovering, reporting
and demonstrating exploitability of this problem, and for providing
detailed feedback on additional mitigation measures.

2) Logic error in ssh(1) ObscureKeystrokeTiming

In OpenSSH version 9.5 through 9.7 (inclusive), when connected to an
OpenSSH server version 9.5 or later, a logic error in the ssh(1)
ObscureKeystrokeTiming feature (on by default) rendered this feature
ineffective - a passive observer could still detect which network
packets contained real keystrokes when the countermeasure was active
because both fake and real keystroke packets were being sent
unconditionally.

This bug was found by Philippos Giavridis and also independently by
Jacky Wei En Kung, Daniel Hugenroth and Alastair Beresford of the
University of Cambridge Computer Lab.

Worse, the unconditional sending of both fake and real keystroke
packets broke another long-standing timing attack mitigation. Since
OpenSSH 2.9.9 sshd(8) has sent fake keystoke echo packets for
traffic received on TTYs in echo-off mode, such as when entering a
password into su(8) or sudo(8). This bug rendered these fake
keystroke echoes ineffective and could allow a passive observer of
a SSH session to once again detect when echo was off and obtain
fairly limited timing information about keystrokes in this situation
(20ms granularity by default).

This additional implication of the bug was identified by Jacky Wei
En Kung, Daniel Hugenroth and Alastair Beresford and we thank them
for their detailed analysis.

This bug does not affect connections when ObscureKeystrokeTiming
was disabled or sessions where no TTY was requested.

Future deprecation notice
=========================

OpenSSH plans to remove support for the DSA signature algorithm in
early 2025. This release disables DSA by default at compile time.

DSA, as specified in the SSHv2 protocol, is inherently weak - being
limited to a 160 bit private key and use of the SHA1 digest. Its
estimated security level is only 80 bits symmetric equivalent.

OpenSSH has disabled DSA keys by default since 2015 but has retained
run-time optional support for them. DSA was the only mandatory-to-
implement algorithm in the SSHv2 RFCs, mostly because alternative
algorithms were encumbered by patents when the SSHv2 protocol was
specified.

This has not been the case for decades at this point and better
algorithms are well supported by all actively-maintained SSH
implementations. We do not consider the costs of maintaining DSA
in OpenSSH to be justified and hope that removing it from OpenSSH
can accelerate its wider deprecation in supporting cryptography
libraries.

This release, and its deactivation of DSA by default at compile-time,
marks the second step in our timeline to finally deprecate DSA. The
final step of removing DSA support entirely is planned for the first
OpenSSH release of 2025.

DSA support may be re-enabled in OpenBSD by setting "DSAKEY=yes"
in Makefile.inc. To enable DSA support in portable OpenSSH, pass
the "--enable-dsa-keys" option to configure.

Potentially-incompatible changes
--------------------------------

 * all: as mentioned above, the DSA signature algorithm is now
   disabled at compile time.

 * sshd(8): the server will now block client addresses that
   repeatedly fail authentication, repeatedly connect without ever
   completing authentication or that crash the server. See the
   discussion of PerSourcePenalties below for more information.
   Operators of servers that accept connections from many users, or
   servers that accept connections from addresses behind NAT or
   proxies may need to consider these settings.

 * sshd(8): the server has been split into a listener binary, sshd(8),
   and a per-session binary "sshd-session". This allows for a much
   smaller listener binary, as it no longer needs to support the SSH
   protocol. As part of this work, support for disabling privilege
   separation (which previously required code changes to disable) and
   disabling re-execution of sshd(8) has been removed. Further
   separation of sshd-session into additional, minimal binaries is
   planned for the future.

 * sshd(8): several log messages have changed. In particular, some
   log messages will be tagged with as originating from a process
   named "sshd-session" rather than "sshd".

 * ssh-keyscan(1): this tool previously emitted comment lines
   containing the hostname and SSH protocol banner to standard error.
   This release now emits them to standard output, but adds a new
   "-q" flag to silence them altogether.

 * sshd(8): (portable OpenSSH only) sshd will no longer use argv[0]
   as the PAM service name. A new "PAMServiceName" sshd_config(5)
   directive allows selecting the service name at runtime. This
   defaults to "sshd". bz2101

 * (portable OpenSSH only) Automatically-generated files, such as
   configure, config.h.in, etc will now be checked in to the portable
   OpenSSH git release branch (e.g. V_9_8). This should ensure that
   the contents of the signed release branch exactly match the
   contents of the signed release tarball.

Changes since OpenSSH 9.7
=========================

This release contains mostly bugfixes.

New features
------------

 * sshd(8): as described above, sshd(8) will now penalise client
   addresses that, for various reasons, do not successfully complete
   authentication. This feature is controlled by a new sshd_config(5)
   PerSourcePenalties option and is on by default.

   sshd(8) will now identify situations where the session did not
   authenticate as expected. These conditions include when the client
   repeatedly attempted authentication unsucessfully (possibly
   indicating an attack against one or more accounts, e.g. password
   guessing), or when client behaviour caused sshd to crash (possibly
   indicating attempts to exploit bugs in sshd).

   When such a condition is observed, sshd will record a penalty of
   some duration (e.g. 30 seconds) against the client's address. If
   this time is above a minimum configurable threshold, then all
   connections from the client address will be refused (along with any
   others in the same PerSourceNetBlockSize CIDR range) until the
   penalty expire.

   Repeated offenses by the same client address will accrue greater
   penalties, up to a configurable maximum. Address ranges may be
   fully exempted from penalties, e.g. to guarantee access from a set
   of trusted management addresses, using the new sshd_config(5)
   PerSourcePenaltyExemptList option.

   We hope these options will make it significantly more difficult for
   attackers to find accounts with weak/guessable passwords or exploit
   bugs in sshd(8) itself. This option is enabled by default.

 * ssh(8): allow the HostkeyAlgorithms directive to disable the
   implicit fallback from certificate host key to plain host keys.

Bugfixes
--------

 * misc: fix a number of inaccuracies in the PROTOCOL.*
   documentation files. GHPR430 GHPR487

 * all: switch to strtonum(3) for more robust integer parsing in most
   places.

 * ssh(1), sshd(8): correctly restore sigprocmask around ppoll()

 * ssh-keysign(8): stricter validation of messaging socket fd GHPR492

 * sftp(1): flush stdout after writing "sftp>" prompt when not using
   editline. GHPR480

 * sftp-server(8): fix home-directory extension implementation, it
   previously always returned the current user's home directory
   contrary to the spec. GHPR477

 * ssh-keyscan(1): do not close stdin to prevent error messages when
   stdin is read multiple times. E.g.
   echo localhost | ssh-keyscan -f - -f -

 * regression tests: fix rekey test that was testing the same KEX
   algorithm repeatedly instead of testing all of them. bz3692

 * ssh_config(5), sshd_config(5): clarify the KEXAlgorithms directive
   documentation, especially around what is supported vs available.
   bz3701.

Portability
-----------

 * sshd(8): expose SSH_AUTH_INFO_0 always to PAM auth modules
   unconditionally. The previous behaviour was to expose it only when
   particular authentication methods were in use.

 * build: fix OpenSSL ED25519 support detection. An incorrect function
   signature in configure.ac previously prevented enabling the recently
   added support for ED25519 private keys in PEM PKCS8 format.

 * ssh(1), ssh-agent(8): allow the presence of the WAYLAND_DISPLAY
   environment variable to enable SSH_ASKPASS, similarly to the X11
   DISPLAY environment variable. GHPR479

 * build: improve detection of the -fzero-call-used-regs compiler
   flag. bz3673.

 * build: relax OpenSSL version check to accept all OpenSSL 3.x
   versions.

 * sshd(8): add support for notifying systemd on server listen and
   reload, using a standalone implementation that doesn't depend on
   libsystemd. bz2641

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

v2:
 - fix musl build
 - fix sshd-session packing on openssh-sshd
 - rebase on top of the CVE-2024-6387 fix sent

v3:
 - fix the ptest fail
 - update upstream status of the systemd sd-notify patch

v4:
 - split update of Upstream-Status in new patches in the serie
 - submit the the ptest fix upstream

v5:
 - backport upstream fix for musl build
 - drop the backported systemd notify

v6:
v7:
 - nothing change

 ...ast-to-sockaddr-in-systemd-interface.patch |  30 +++
 ...-notify-systemd-on-listen-and-reload.patch | 225 ------------------
 ...h-log-input-and-output-files-on-erro.patch |   8 +-
 ...c-use-the-absolute-path-in-the-SSH-e.patch |  35 +++
 .../openssh/openssh/CVE-2024-6387.patch       |  27 ---
 .../openssh/openssh/run-ptest                 |   1 +
 .../{openssh_9.7p1.bb => openssh_9.8p1.bb}    |   8 +-
 7 files changed, 73 insertions(+), 261 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-Cast-to-sockaddr-in-systemd-interface.patch
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-listen-and-reload.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch
 rename meta/recipes-connectivity/openssh/{openssh_9.7p1.bb => openssh_9.8p1.bb} (96%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-Cast-to-sockaddr-in-systemd-interface.patch b/meta/recipes-connectivity/openssh/openssh/0001-Cast-to-sockaddr-in-systemd-interface.patch
new file mode 100644
index 0000000000..c41642ae10
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/0001-Cast-to-sockaddr-in-systemd-interface.patch
@@ -0,0 +1,30 @@
+From a3068c6edb81c0b0b9a2ced82e8632c79314e409 Mon Sep 17 00:00:00 2001
+From: Darren Tucker <dtucker@dtucker.net>
+Date: Sun, 7 Jul 2024 18:46:19 +1000
+Subject: [PATCH] Cast to sockaddr * in systemd interface.
+
+Fixes build with musl libx.  bz#3707.
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/8b664df75966e5aed8dabea00b8838303d3488b8]
+
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
+---
+ openbsd-compat/port-linux.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/openbsd-compat/port-linux.c b/openbsd-compat/port-linux.c
+index 4c024c6d2..8adfec5a7 100644
+--- a/openbsd-compat/port-linux.c
++++ b/openbsd-compat/port-linux.c
+@@ -366,7 +366,7 @@ ssh_systemd_notify(const char *fmt, ...)
+ 		error_f("socket \"%s\": %s", path, strerror(errno));
+ 		goto out;
+ 	}
+-	if (connect(fd, &addr, sizeof(addr)) != 0) {
++	if (connect(fd, (struct sockaddr *)&addr, sizeof(addr)) != 0) {
+ 		error_f("socket \"%s\" connect: %s", path, strerror(errno));
+ 		goto out;
+ 	}
+-- 
+2.45.2
+
diff --git a/meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-listen-and-reload.patch b/meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-listen-and-reload.patch
deleted file mode 100644
index 4925c969fe..0000000000
--- a/meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-listen-and-reload.patch
+++ /dev/null
@@ -1,225 +0,0 @@
-From fc73e2405a8ca928465580b74a4d76112919367b Mon Sep 17 00:00:00 2001
-From: Damien Miller <djm@mindrot.org>
-Date: Wed, 3 Apr 2024 14:40:32 +1100
-Subject: [PATCH] notify systemd on listen and reload
-
-Standalone implementation that does not depend on libsystemd.
-With assistance from Luca Boccassi, and feedback/testing from Colin
-Watson. bz2641
-
-Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/08f579231cd38a1c657aaa6ddeb8ab57a1fd4f5c]
-
-Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
----
- configure.ac                |  1 +
- openbsd-compat/port-linux.c | 97 ++++++++++++++++++++++++++++++++++++-
- openbsd-compat/port-linux.h |  5 ++
- platform.c                  | 11 +++++
- platform.h                  |  1 +
- sshd.c                      |  2 +
- 6 files changed, 115 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 82e8bb7c1..854f92b5b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -915,6 +915,7 @@ int main(void) { if (NSVersionOfRunTimeLibrary("System") >= (60 << 16))
- 	AC_DEFINE([_PATH_BTMP], ["/var/log/btmp"], [log for bad login attempts])
- 	AC_DEFINE([USE_BTMP])
- 	AC_DEFINE([LINUX_OOM_ADJUST], [1], [Adjust Linux out-of-memory killer])
-+	AC_DEFINE([SYSTEMD_NOTIFY], [1], [Have sshd notify systemd on start/reload])
- 	inet6_default_4in6=yes
- 	case `uname -r` in
- 	1.*|2.0.*)
-diff --git a/openbsd-compat/port-linux.c b/openbsd-compat/port-linux.c
-index 0457e28d0..df7290246 100644
---- a/openbsd-compat/port-linux.c
-+++ b/openbsd-compat/port-linux.c
-@@ -21,16 +21,23 @@
- 
- #include "includes.h"
- 
--#if defined(WITH_SELINUX) || defined(LINUX_OOM_ADJUST)
-+#if defined(WITH_SELINUX) || defined(LINUX_OOM_ADJUST) || \
-+    defined(SYSTEMD_NOTIFY)
-+#include <sys/socket.h>
-+#include <sys/un.h>
-+
- #include <errno.h>
-+#include <inttypes.h>
- #include <stdarg.h>
- #include <string.h>
- #include <stdio.h>
- #include <stdlib.h>
-+#include <time.h>
- 
- #include "log.h"
- #include "xmalloc.h"
- #include "port-linux.h"
-+#include "misc.h"
- 
- #ifdef WITH_SELINUX
- #include <selinux/selinux.h>
-@@ -310,4 +317,90 @@ oom_adjust_restore(void)
- 	return;
- }
- #endif /* LINUX_OOM_ADJUST */
--#endif /* WITH_SELINUX || LINUX_OOM_ADJUST */
-+
-+#ifdef SYSTEMD_NOTIFY
-+
-+static void ssh_systemd_notify(const char *, ...)
-+    __attribute__((__format__ (printf, 1, 2))) __attribute__((__nonnull__ (1)));
-+
-+static void
-+ssh_systemd_notify(const char *fmt, ...)
-+{
-+	char *s = NULL;
-+	const char *path;
-+	struct stat sb;
-+	struct sockaddr_un addr;
-+	int fd = -1;
-+	va_list ap;
-+
-+	if ((path = getenv("NOTIFY_SOCKET")) == NULL || strlen(path) == 0)
-+		return;
-+
-+	va_start(ap, fmt);
-+	xvasprintf(&s, fmt, ap);
-+	va_end(ap);
-+
-+	/* Only AF_UNIX is supported, with path or abstract sockets */
-+	if (path[0] != '/' && path[0] != '@') {
-+		error_f("socket \"%s\" is not compatible with AF_UNIX", path);
-+		goto out;
-+	}
-+
-+	if (path[0] == '/' && stat(path, &sb) != 0) {
-+		error_f("socket \"%s\" stat: %s", path, strerror(errno));
-+		goto out;
-+	}
-+
-+	memset(&addr, 0, sizeof(addr));
-+	addr.sun_family = AF_UNIX;
-+	if (strlcpy(addr.sun_path, path,
-+	    sizeof(addr.sun_path)) >= sizeof(addr.sun_path)) {
-+		error_f("socket path \"%s\" too long", path);
-+		goto out;
-+	}
-+	/* Support for abstract socket */
-+	if (addr.sun_path[0] == '@')
-+		addr.sun_path[0] = 0;
-+	if ((fd = socket(PF_UNIX, SOCK_DGRAM, 0)) == -1) {
-+		error_f("socket \"%s\": %s", path, strerror(errno));
-+		goto out;
-+	}
-+	if (connect(fd, &addr, sizeof(addr)) != 0) {
-+		error_f("socket \"%s\" connect: %s", path, strerror(errno));
-+		goto out;
-+	}
-+	if (write(fd, s, strlen(s)) != (ssize_t)strlen(s)) {
-+		error_f("socket \"%s\" write: %s", path, strerror(errno));
-+		goto out;
-+	}
-+	debug_f("socket \"%s\" notified %s", path, s);
-+ out:
-+	if (fd != -1)
-+		close(fd);
-+	free(s);
-+}
-+
-+void
-+ssh_systemd_notify_ready(void)
-+{
-+	ssh_systemd_notify("READY=1");
-+}
-+
-+void
-+ssh_systemd_notify_reload(void)
-+{
-+	struct timespec now;
-+
-+	monotime_ts(&now);
-+	if (now.tv_sec < 0 || now.tv_nsec < 0) {
-+		error_f("monotime returned negative value");
-+		ssh_systemd_notify("RELOADING=1");
-+	} else {
-+		ssh_systemd_notify("RELOADING=1\nMONOTONIC_USEC=%llu",
-+		    ((uint64_t)now.tv_sec * 1000000ULL) +
-+		    ((uint64_t)now.tv_nsec / 1000ULL));
-+	}
-+}
-+#endif /* SYSTEMD_NOTIFY */
-+
-+#endif /* WITH_SELINUX || LINUX_OOM_ADJUST || SYSTEMD_NOTIFY */
-diff --git a/openbsd-compat/port-linux.h b/openbsd-compat/port-linux.h
-index 3c22a854d..14064f87d 100644
---- a/openbsd-compat/port-linux.h
-+++ b/openbsd-compat/port-linux.h
-@@ -30,4 +30,9 @@ void oom_adjust_restore(void);
- void oom_adjust_setup(void);
- #endif
- 
-+#ifdef SYSTEMD_NOTIFY
-+void ssh_systemd_notify_ready(void);
-+void ssh_systemd_notify_reload(void);
-+#endif
-+
- #endif /* ! _PORT_LINUX_H */
-diff --git a/platform.c b/platform.c
-index 4fe8744ee..9cf818153 100644
---- a/platform.c
-+++ b/platform.c
-@@ -44,6 +44,14 @@ platform_pre_listen(void)
- #endif
- }
- 
-+void
-+platform_post_listen(void)
-+{
-+#ifdef SYSTEMD_NOTIFY
-+	ssh_systemd_notify_ready();
-+#endif
-+}
-+
- void
- platform_pre_fork(void)
- {
-@@ -55,6 +63,9 @@ platform_pre_fork(void)
- void
- platform_pre_restart(void)
- {
-+#ifdef SYSTEMD_NOTIFY
-+	ssh_systemd_notify_reload();
-+#endif
- #ifdef LINUX_OOM_ADJUST
- 	oom_adjust_restore();
- #endif
-diff --git a/platform.h b/platform.h
-index 7fef8c983..5dec23276 100644
---- a/platform.h
-+++ b/platform.h
-@@ -21,6 +21,7 @@
- void platform_pre_listen(void);
- void platform_pre_fork(void);
- void platform_pre_restart(void);
-+void platform_post_listen(void);
- void platform_post_fork_parent(pid_t child_pid);
- void platform_post_fork_child(void);
- int  platform_privileged_uidswap(void);
-diff --git a/sshd.c b/sshd.c
-index b4f2b9742..865331b46 100644
---- a/sshd.c
-+++ b/sshd.c
-@@ -2077,6 +2077,8 @@ main(int ac, char **av)
- 		ssh_signal(SIGTERM, sigterm_handler);
- 		ssh_signal(SIGQUIT, sigterm_handler);
- 
-+		platform_post_listen();
-+
- 		/*
- 		 * Write out the pid file after the sigterm handler
- 		 * is setup and the listen sockets are bound
--- 
-2.45.2
-
diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
index 8763f30f4b..f424288e37 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
@@ -1,4 +1,4 @@
-From f5a4dacc987ca548fc86577c2dba121c86da3c34 Mon Sep 17 00:00:00 2001
+From 5cc897fe2effe549e1e280c2f606bce8b532b61e Mon Sep 17 00:00:00 2001
 From: Mikko Rapeli <mikko.rapeli@linaro.org>
 Date: Mon, 11 Sep 2023 09:55:21 +0100
 Subject: [PATCH] regress/banner.sh: log input and output files on error
@@ -37,12 +37,13 @@ See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15178
 Upstream-Status: Denied [https://github.com/openssh/openssh-portable/pull/437]
 
 Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
 ---
  regress/banner.sh | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/regress/banner.sh b/regress/banner.sh
-index a84feb5a..de84957a 100644
+index a84feb5..de84957 100644
 --- a/regress/banner.sh
 +++ b/regress/banner.sh
 @@ -32,7 +32,9 @@ for s in 0 10 100 1000 10000 100000 ; do
@@ -56,6 +57,3 @@ index a84feb5a..de84957a 100644
  done
  
  trace "test suppress banner (-q)"
--- 
-2.34.1
-
diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
new file mode 100644
index 0000000000..b90cd2e69d
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
@@ -0,0 +1,35 @@
+From fb762172fb678fe29327b667f8fe7380962a4540 Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <jose.quaresma@foundries.io>
+Date: Mon, 15 Jul 2024 18:43:08 +0100
+Subject: [PATCH] regress/test-exec: use the absolute path in the SSH env
+
+The SSHAGENT_BIN was changed in [1] to SSH_BIN but
+the last one don't use the absolute path and consequently
+the function increase_datafile_size can loops forever
+if the binary not found.
+
+[1] https://github.com/openssh/openssh-portable/commit/a68f80f2511f0e0c5cef737a8284cc2dfabad818
+
+Upstream-Status: Submitted [https://github.com/openssh/openssh-portable/pull/510]
+
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
+---
+ regress/test-exec.sh | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/regress/test-exec.sh b/regress/test-exec.sh
+index 7afc2807..175f554b 100644
+--- a/regress/test-exec.sh
++++ b/regress/test-exec.sh
+@@ -175,6 +175,11 @@ if [ "x$TEST_SSH_OPENSSL" != "x" ]; then
+ fi
+ 
+ # Path to sshd must be absolute for rexec
++case "$SSH" in
++/*) ;;
++*) SSH=`which $SSH` ;;
++esac
++
+ case "$SSHD" in
+ /*) ;;
+ *) SSHD=`which $SSHD` ;;
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch
deleted file mode 100644
index 3e7c707100..0000000000
--- a/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Description: fix signal handler race condition
-Bug-Ubuntu: https://bugs.launchpad.net/ubuntu/+source/openssh/+bug/2070497
-
-CVE: CVE-2024-6387
-
-Upstream-Status: Backport
-https://git.launchpad.net/ubuntu/+source/openssh/commit/?h=applied/ubuntu/jammy-devel&id=b059bcfa928df4ff2d103ae2e8f4e3136ee03efc
-
-Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
-
---- a/log.c
-+++ b/log.c
-@@ -452,12 +452,14 @@ void
- sshsigdie(const char *file, const char *func, int line, int showfunc,
-     LogLevel level, const char *suffix, const char *fmt, ...)
- {
-+#if 0
- 	va_list args;
- 
- 	va_start(args, fmt);
- 	sshlogv(file, func, line, showfunc, SYSLOG_LEVEL_FATAL,
- 	    suffix, fmt, args);
- 	va_end(args);
-+#endif
- 	_exit(1);
- }
- 
diff --git a/meta/recipes-connectivity/openssh/openssh/run-ptest b/meta/recipes-connectivity/openssh/openssh/run-ptest
index b2244d725a..c9100f9f37 100755
--- a/meta/recipes-connectivity/openssh/openssh/run-ptest
+++ b/meta/recipes-connectivity/openssh/openssh/run-ptest
@@ -1,5 +1,6 @@
 #!/bin/sh
 
+export TEST_SSH_SSH=ssh
 export TEST_SHELL=sh
 export SKIP_UNIT=1
 
diff --git a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb b/meta/recipes-connectivity/openssh/openssh_9.8p1.bb
similarity index 96%
rename from meta/recipes-connectivity/openssh/openssh_9.7p1.bb
rename to meta/recipes-connectivity/openssh/openssh_9.8p1.bb
index 4680d12be5..9554b4783f 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.8p1.bb
@@ -23,11 +23,11 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://volatiles.99_sshd \
            file://run-ptest \
            file://sshd_check_keys \
+           file://0001-Cast-to-sockaddr-in-systemd-interface.patch \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
-           file://0001-notify-systemd-on-listen-and-reload.patch \
-           file://CVE-2024-6387.patch \
+           file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch \
            "
-SRC_URI[sha256sum] = "490426f766d82a2763fcacd8d83ea3d70798750c7bd2aff2e57dc5660f773ffd"
+SRC_URI[sha256sum] = "dd8bd002a379b5d499dfb050dd1fa9af8029e80461f4bb6c523c49973f5a39f3"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
@@ -195,7 +195,7 @@ ALLOW_EMPTY:${PN} = "1"
 PACKAGES =+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp ${PN}-misc ${PN}-sftp-server"
 FILES:${PN}-scp = "${bindir}/scp.${BPN}"
 FILES:${PN}-ssh = "${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_config"
-FILES:${PN}-sshd = "${sbindir}/sshd ${sysconfdir}/init.d/sshd ${systemd_system_unitdir}"
+FILES:${PN}-sshd = "${sbindir}/sshd ${libexecdir}/sshd-session ${sysconfdir}/init.d/sshd ${systemd_system_unitdir}"
 FILES:${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_readonly ${sysconfdir}/default/volatiles/99_sshd ${sysconfdir}/pam.d/sshd"
 FILES:${PN}-sshd += "${libexecdir}/${BPN}/sshd_check_keys"
 FILES:${PN}-sftp = "${bindir}/sftp"
-- 
2.45.2


