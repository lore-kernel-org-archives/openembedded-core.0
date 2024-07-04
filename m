Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1480C30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:49:16 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.9424.1720097346904326541
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kxgsFU59;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-424acfff613so5180935e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720097345; x=1720702145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tyYPRFM//mmsm+cC+1kOvYPdeobn2DwPEIZZHhW1AZ0=;
        b=kxgsFU59QTTLrSn5+pXz4tGQluY++SYqZ9hwAi5Ael/m/aT2N1aFQ2fHF9pKK1sXSy
         5fH5ItC7vvkEgTtq1Bk0cESQQ6eM+HhWaDkmuh+lVDdLfAK48noi9D9xkOYdZ3+jLM2N
         iX3CtG9EiIVPkOAC//cIgm9I9BWOEinH6OlBXkdHcfs1oDj9i/8GXJ0pF3jRur1tQyPU
         b9WyTGiHHV5J7z8njYF04iKNA2DHU8e4OVG9mdsvpNaq3/etCEBNLWq3cMhJdEIfqqgY
         +UovaFPJ0t7kMo6/9jjUBPi7nnLz7kOhJuXGqWSi9ZqyQdXH4njAiIja6c9oV56qDplP
         lowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720097345; x=1720702145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tyYPRFM//mmsm+cC+1kOvYPdeobn2DwPEIZZHhW1AZ0=;
        b=p0ToNhaOdmdTxsm3oxkXvcvlCP3JV+4ovhijCc7PtGPr/CHFIU2XOHLMtXaO56hy2n
         yItvxgXzyH9lxWODgLzHdwQ3ZX/mP+RBvc+Hp1xp382Tx9mn2FHCQ0lzbLhuGvq1kkov
         LomfUT8u9D+b4mQWWabO/OhbC97JY5xbz8lHPsoABkEZOw4jKazEm9RUXB9qAom7ubHv
         9+aU3dlM/uGeu7mShvye2QU3oLYRAL7oFZa0/BcW0Z6y3Z5PmdOFPDgJpLjwWAa+s9Hp
         RqJ2lbWHTxfSw2nYtS1XLUth/TRK7NMwJYZDiNGTHM3ia0yMkzt22vjy0ZtZDYjbezee
         bYgw==
X-Gm-Message-State: AOJu0YzGop6zqj0QLrgWSGQUefTiXEn6GD355ydpXt9SkA0w0p1947Sl
	NfU9RUpCl2TQQKwhcw7IinHDsESLSkN0XdedG5dk04fbFlzIkrl07FMtUQ==
X-Google-Smtp-Source: AGHT+IFWqtHBos0obbAslhqRQa7vdtxgKaKA9UbPsqT8QNFKyiF4h1ODIiVVJw3ZYoVijtwoiNI9gg==
X-Received: by 2002:adf:e552:0:b0:367:92c7:3ac0 with SMTP id ffacd0b85a97d-3679dd2761dmr1487853f8f.22.1720097344492;
        Thu, 04 Jul 2024 05:49:04 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3678ec6ff64sm5661183f8f.3.2024.07.04.05.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:49:03 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v2] openssh: upgrade 9.7p1 -> 9.8p1
Date: Thu,  4 Jul 2024 13:46:00 +0100
Message-ID: <20240704124559.194237-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201574

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

 ...h-log-input-and-output-files-on-erro.patch |  8 +++---
 ...tional-support-for-systemd-sd_notify.patch | 21 ++++++++-------
 .../openssh/openssh/CVE-2024-6387.patch       | 27 -------------------
 ...igned-overflow-in-pointer-arithmatic.patch |  6 ++---
 .../{openssh_9.7p1.bb => openssh_9.8p1.bb}    |  8 +++---
 5 files changed, 21 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch
 rename meta/recipes-connectivity/openssh/{openssh_9.7p1.bb => openssh_9.8p1.bb} (95%)

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
diff --git a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
index f079d936a4..115938bcff 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
@@ -1,4 +1,4 @@
-From b02ef7621758f06eb686ef4f620636dbad086eda Mon Sep 17 00:00:00 2001
+From 6a25ee9627cd91de9d9c66630548e91378875b05 Mon Sep 17 00:00:00 2001
 From: Matt Jolly <Matt.Jolly@footclan.ninja>
 Date: Thu, 2 Feb 2023 21:05:40 +1100
 Subject: [PATCH] systemd: Add optional support for systemd `sd_notify`
@@ -9,16 +9,17 @@ patch based on Jakub Jelen's <jjelen@redhat.com> original patch
 Upstream-Status: Submitted [https://github.com/openssh/openssh-portable/pull/375/commits/be187435911cde6cc3cef6982a508261074f1e56]
 
 Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
 ---
  configure.ac | 24 ++++++++++++++++++++++++
  sshd.c       | 13 +++++++++++++
  2 files changed, 37 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 82e8bb7..d1145d3 100644
+index 5a865f8..501d81b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4870,6 +4870,29 @@ AC_SUBST([GSSLIBS])
+@@ -4886,6 +4886,29 @@ AC_SUBST([GSSLIBS])
  AC_SUBST([K5LIBS])
  AC_SUBST([CHANNELLIBS])
  
@@ -48,7 +49,7 @@ index 82e8bb7..d1145d3 100644
  # Looking for programs, paths and files
  
  PRIVSEP_PATH=/var/empty
-@@ -5688,6 +5711,7 @@ echo "                   libldns support: $LDNS_MSG"
+@@ -5704,6 +5727,7 @@ echo "                   libldns support: $LDNS_MSG"
  echo "  Solaris process contract support: $SPC_MSG"
  echo "           Solaris project support: $SP_MSG"
  echo "         Solaris privilege support: $SPP_MSG"
@@ -57,10 +58,10 @@ index 82e8bb7..d1145d3 100644
  echo "           Translate v4 in v6 hack: $IPV4_IN6_HACK_MSG"
  echo "                  BSD Auth support: $BSD_AUTH_MSG"
 diff --git a/sshd.c b/sshd.c
-index b4f2b97..6820a41 100644
+index ed54fc6..da396bf 100644
 --- a/sshd.c
 +++ b/sshd.c
-@@ -88,6 +88,10 @@
+@@ -69,6 +69,10 @@
  #include <prot.h>
  #endif
  
@@ -70,8 +71,8 @@ index b4f2b97..6820a41 100644
 +
  #include "xmalloc.h"
  #include "ssh.h"
- #include "ssh2.h"
-@@ -308,6 +312,10 @@ static void
+ #include "sshpty.h"
+@@ -484,6 +488,10 @@ static void
  sighup_restart(void)
  {
  	logit("Received SIGHUP; restarting.");
@@ -82,7 +83,7 @@ index b4f2b97..6820a41 100644
  	if (options.pid_file != NULL)
  		unlink(options.pid_file);
  	platform_pre_restart();
-@@ -2093,6 +2101,11 @@ main(int ac, char **av)
+@@ -1734,6 +1742,11 @@ main(int ac, char **av)
  			}
  		}
  
@@ -93,4 +94,4 @@ index b4f2b97..6820a41 100644
 +
  		/* Accept a connection and return in a forked child */
  		server_accept_loop(&sock_in, &sock_out,
- 		    &newsock, config_s);
+ 		    &newsock, config_s, log_stderr);
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
diff --git a/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch b/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
index 20036da931..2c73196eb8 100644
--- a/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
+++ b/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
@@ -1,4 +1,4 @@
-From 3328e98bcbf2930cd7eea3e6c92ad5dcbdf4794f Mon Sep 17 00:00:00 2001
+From 90bbf404520e90f74dfb6c8eb6fd7cfd3a0eb68f Mon Sep 17 00:00:00 2001
 From: Yuanjie Huang <yuanjie.huang@windriver.com>
 Date: Wed, 24 Aug 2016 03:15:43 +0000
 Subject: [PATCH] Fix potential signed overflow in pointer arithmatic
@@ -14,6 +14,7 @@ Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
 
 Complete the fix
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
 ---
  openbsd-compat/strlcat.c | 10 +++++++---
  openbsd-compat/strlcpy.c |  8 ++++++--
@@ -106,6 +107,3 @@ index 7ad3573..7040f1f 100644
 +	return (size_t)((uintptr_t)cp - (uintptr_t)str);
  }
  #endif
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb b/meta/recipes-connectivity/openssh/openssh_9.8p1.bb
similarity index 95%
rename from meta/recipes-connectivity/openssh/openssh_9.7p1.bb
rename to meta/recipes-connectivity/openssh/openssh_9.8p1.bb
index 69eade3ee7..d3d12879d7 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.8p1.bb
@@ -26,9 +26,8 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshd_check_keys \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patch \
-           file://CVE-2024-6387.patch \
            "
-SRC_URI[sha256sum] = "490426f766d82a2763fcacd8d83ea3d70798750c7bd2aff2e57dc5660f773ffd"
+SRC_URI[sha256sum] = "dd8bd002a379b5d499dfb050dd1fa9af8029e80461f4bb6c523c49973f5a39f3"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
@@ -84,6 +83,9 @@ EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
 
 # musl doesn't implement wtmp/utmp and logwtmp
 EXTRA_OECONF:append:libc-musl = " --disable-wtmp --disable-lastlog"
+# https://valkyrie.yoctoproject.org/#/builders/3/builds/68
+# port-linux.c:369:25: error: passing argument 2 of 'connect' from incompatible pointer type [-Wincompatible-pointer-types]
+CFLAGS:append:libc-musl = " -Wno-error=incompatible-pointer-types"
 
 # Work around ICE on mips/mips64 starting in 9.6p1
 EXTRA_OECONF:append:mips = " --without-hardening"
@@ -194,7 +196,7 @@ ALLOW_EMPTY:${PN} = "1"
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


