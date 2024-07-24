Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B89FC3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 14:19:40 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web11.11737.1721830779328287540
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 07:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UZkICUWA;
 spf=pass (domain: gmail.com, ip: 209.85.221.177, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-4f51af903a7so584522e0c.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 07:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721830778; x=1722435578; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E8n192PxBEEG5MmKze/XWnr2sE0MZeJ4ki8fAeLoGYw=;
        b=UZkICUWAde1LXN7fYjSVy+P571Db6kp+vdpVwbBnVS5Qm1Sum5LBqs1I8lSee2fzkN
         bezn39E8ytgifefcMffRxB2ng20q9a6pnJj+W67CcQn7dIThNh2hro5Hyd4KcvM/Ltdx
         CROFjyr9sKVrESjO1Zq6ZPDhRc85d6Bs3vQgWv7hKKRER82McXky8s6a+WIBnc1NVOPR
         +1LeGSQlvlkDSKCSHJm4HeUnCkGKtaX0A+VOWQW537hqYYckbuXdFEbji+GGAEgaKRzp
         tKN8l9vOGDpXUOp/pwGl55B5lMV5xgX4xrQkW7QTCKJjUaCdocd0VZvDZMaH1MkVj1WS
         mEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721830778; x=1722435578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8n192PxBEEG5MmKze/XWnr2sE0MZeJ4ki8fAeLoGYw=;
        b=Acm9uprMtaabge0J78WXIOdAA2Baj4tiWav5HEfu95my05Z5u+/aRvGv00/FaV78p9
         M4pK+0h8Pp0EIRVpHoy4lHuhjKsVgy9igqEhJovc1KM6nfDnpOD6pBR9T/09BbV+fkVq
         dCxwpVOYNF65bbu6+WyxXjuQNElSX3AK0LLKpAknqKNvEdaMoKW7AW08vvRNUWmAPL5H
         gAZz99MySD8tW2I3f+kYleRj9J3rpJ9tAVkXNX99JxwD4M/9A3xmFndWr+Nnp3Y1FYvL
         fDuETTqUBQ3zas2GOqBdLsB4XOShamgd8YXb93Eg8UtPHsWEHLwPQHw23sT8JmfjzrdN
         FXOw==
X-Gm-Message-State: AOJu0YxOFtAGbcSortdBdnvBqD01aIAgHCJXW/Sifryf0Up0OJoo2oVK
	LDBXHG7lC5HhBfmzE81OZoWTcIMWd5VWEC/18zZWKNFHOoW6SlAlqie8kvdUktvcrQqOn3NfHM1
	OD/U7ofsMrtVuPV4rzT+qNehRZUFwxuOS
X-Google-Smtp-Source: AGHT+IGXQ/CSXxs26e6EI4G+L2WU0Kc7NdE840s16+T75wpJMCZNHtUjjFZ82Ztj8nYlxnRH4nCE4OYINwZ8lpSWuuQ=
X-Received: by 2002:a05:6122:319:b0:4f5:2849:598d with SMTP id
 71dfb90a1353d-4f6b850b2c7mr1030318e0c.4.1721830777894; Wed, 24 Jul 2024
 07:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240718165448.1164-1-jose.quaresma@foundries.io> <17E35D00CCAB404F.25516@lists.openembedded.org>
In-Reply-To: <17E35D00CCAB404F.25516@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 24 Jul 2024 15:19:26 +0100
Message-ID: <CANPvuRngsusxijoCZ9czY84KqDPEX6cSm8SZnho-zo-V5iX4bA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v7 2/2] openssh: upgrade 9.7p1 -> 9.8p1
To: quaresma.jose@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000e13e07061dfef73c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 14:19:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202445

--000000000000e13e07061dfef73c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gentle ping.

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu (quinta, 18/07/2024 =C3=A0(s) 17=
:55):

> - drop the CVE-2024-6387
> - fix musl build [backported patch]
> - fix ptest regression [submited patch]
> - sshd now had the sshd-session
>
> Release notes at https://www.openssh.com/txt/release-9.8
>
> Security
> =3D=3D=3D=3D=3D=3D=3D=3D
>
> This release contains fixes for two security problems, one critical
> and one minor.
>
> 1) Race condition in sshd(8)
>
> A critical vulnerability in sshd(8) was present in Portable OpenSSH
> versions between 8.5p1 and 9.7p1 (inclusive) that may allow arbitrary
> code execution with root privileges.
>
> Successful exploitation has been demonstrated on 32-bit Linux/glibc
> systems with ASLR. Under lab conditions, the attack requires on
> average 6-8 hours of continuous connections up to the maximum the
> server will accept. Exploitation on 64-bit systems is believed to be
> possible but has not been demonstrated at this time. It's likely that
> these attacks will be improved upon.
>
> Exploitation on non-glibc systems is conceivable but has not been
> examined. Systems that lack ASLR or users of downstream Linux
> distributions that have modified OpenSSH to disable per-connection
> ASLR re-randomisation (yes - this is a thing, no - we don't
> understand why) may potentially have an easier path to exploitation.
> OpenBSD is not vulnerable.
>
> We thank the Qualys Security Advisory Team for discovering, reporting
> and demonstrating exploitability of this problem, and for providing
> detailed feedback on additional mitigation measures.
>
> 2) Logic error in ssh(1) ObscureKeystrokeTiming
>
> In OpenSSH version 9.5 through 9.7 (inclusive), when connected to an
> OpenSSH server version 9.5 or later, a logic error in the ssh(1)
> ObscureKeystrokeTiming feature (on by default) rendered this feature
> ineffective - a passive observer could still detect which network
> packets contained real keystrokes when the countermeasure was active
> because both fake and real keystroke packets were being sent
> unconditionally.
>
> This bug was found by Philippos Giavridis and also independently by
> Jacky Wei En Kung, Daniel Hugenroth and Alastair Beresford of the
> University of Cambridge Computer Lab.
>
> Worse, the unconditional sending of both fake and real keystroke
> packets broke another long-standing timing attack mitigation. Since
> OpenSSH 2.9.9 sshd(8) has sent fake keystoke echo packets for
> traffic received on TTYs in echo-off mode, such as when entering a
> password into su(8) or sudo(8). This bug rendered these fake
> keystroke echoes ineffective and could allow a passive observer of
> a SSH session to once again detect when echo was off and obtain
> fairly limited timing information about keystrokes in this situation
> (20ms granularity by default).
>
> This additional implication of the bug was identified by Jacky Wei
> En Kung, Daniel Hugenroth and Alastair Beresford and we thank them
> for their detailed analysis.
>
> This bug does not affect connections when ObscureKeystrokeTiming
> was disabled or sessions where no TTY was requested.
>
> Future deprecation notice
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>
> OpenSSH plans to remove support for the DSA signature algorithm in
> early 2025. This release disables DSA by default at compile time.
>
> DSA, as specified in the SSHv2 protocol, is inherently weak - being
> limited to a 160 bit private key and use of the SHA1 digest. Its
> estimated security level is only 80 bits symmetric equivalent.
>
> OpenSSH has disabled DSA keys by default since 2015 but has retained
> run-time optional support for them. DSA was the only mandatory-to-
> implement algorithm in the SSHv2 RFCs, mostly because alternative
> algorithms were encumbered by patents when the SSHv2 protocol was
> specified.
>
> This has not been the case for decades at this point and better
> algorithms are well supported by all actively-maintained SSH
> implementations. We do not consider the costs of maintaining DSA
> in OpenSSH to be justified and hope that removing it from OpenSSH
> can accelerate its wider deprecation in supporting cryptography
> libraries.
>
> This release, and its deactivation of DSA by default at compile-time,
> marks the second step in our timeline to finally deprecate DSA. The
> final step of removing DSA support entirely is planned for the first
> OpenSSH release of 2025.
>
> DSA support may be re-enabled in OpenBSD by setting "DSAKEY=3Dyes"
> in Makefile.inc. To enable DSA support in portable OpenSSH, pass
> the "--enable-dsa-keys" option to configure.
>
> Potentially-incompatible changes
> --------------------------------
>
>  * all: as mentioned above, the DSA signature algorithm is now
>    disabled at compile time.
>
>  * sshd(8): the server will now block client addresses that
>    repeatedly fail authentication, repeatedly connect without ever
>    completing authentication or that crash the server. See the
>    discussion of PerSourcePenalties below for more information.
>    Operators of servers that accept connections from many users, or
>    servers that accept connections from addresses behind NAT or
>    proxies may need to consider these settings.
>
>  * sshd(8): the server has been split into a listener binary, sshd(8),
>    and a per-session binary "sshd-session". This allows for a much
>    smaller listener binary, as it no longer needs to support the SSH
>    protocol. As part of this work, support for disabling privilege
>    separation (which previously required code changes to disable) and
>    disabling re-execution of sshd(8) has been removed. Further
>    separation of sshd-session into additional, minimal binaries is
>    planned for the future.
>
>  * sshd(8): several log messages have changed. In particular, some
>    log messages will be tagged with as originating from a process
>    named "sshd-session" rather than "sshd".
>
>  * ssh-keyscan(1): this tool previously emitted comment lines
>    containing the hostname and SSH protocol banner to standard error.
>    This release now emits them to standard output, but adds a new
>    "-q" flag to silence them altogether.
>
>  * sshd(8): (portable OpenSSH only) sshd will no longer use argv[0]
>    as the PAM service name. A new "PAMServiceName" sshd_config(5)
>    directive allows selecting the service name at runtime. This
>    defaults to "sshd". bz2101
>
>  * (portable OpenSSH only) Automatically-generated files, such as
>    configure, config.h.in, etc will now be checked in to the portable
>    OpenSSH git release branch (e.g. V_9_8). This should ensure that
>    the contents of the signed release branch exactly match the
>    contents of the signed release tarball.
>
> Changes since OpenSSH 9.7
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>
> This release contains mostly bugfixes.
>
> New features
> ------------
>
>  * sshd(8): as described above, sshd(8) will now penalise client
>    addresses that, for various reasons, do not successfully complete
>    authentication. This feature is controlled by a new sshd_config(5)
>    PerSourcePenalties option and is on by default.
>
>    sshd(8) will now identify situations where the session did not
>    authenticate as expected. These conditions include when the client
>    repeatedly attempted authentication unsucessfully (possibly
>    indicating an attack against one or more accounts, e.g. password
>    guessing), or when client behaviour caused sshd to crash (possibly
>    indicating attempts to exploit bugs in sshd).
>
>    When such a condition is observed, sshd will record a penalty of
>    some duration (e.g. 30 seconds) against the client's address. If
>    this time is above a minimum configurable threshold, then all
>    connections from the client address will be refused (along with any
>    others in the same PerSourceNetBlockSize CIDR range) until the
>    penalty expire.
>
>    Repeated offenses by the same client address will accrue greater
>    penalties, up to a configurable maximum. Address ranges may be
>    fully exempted from penalties, e.g. to guarantee access from a set
>    of trusted management addresses, using the new sshd_config(5)
>    PerSourcePenaltyExemptList option.
>
>    We hope these options will make it significantly more difficult for
>    attackers to find accounts with weak/guessable passwords or exploit
>    bugs in sshd(8) itself. This option is enabled by default.
>
>  * ssh(8): allow the HostkeyAlgorithms directive to disable the
>    implicit fallback from certificate host key to plain host keys.
>
> Bugfixes
> --------
>
>  * misc: fix a number of inaccuracies in the PROTOCOL.*
>    documentation files. GHPR430 GHPR487
>
>  * all: switch to strtonum(3) for more robust integer parsing in most
>    places.
>
>  * ssh(1), sshd(8): correctly restore sigprocmask around ppoll()
>
>  * ssh-keysign(8): stricter validation of messaging socket fd GHPR492
>
>  * sftp(1): flush stdout after writing "sftp>" prompt when not using
>    editline. GHPR480
>
>  * sftp-server(8): fix home-directory extension implementation, it
>    previously always returned the current user's home directory
>    contrary to the spec. GHPR477
>
>  * ssh-keyscan(1): do not close stdin to prevent error messages when
>    stdin is read multiple times. E.g.
>    echo localhost | ssh-keyscan -f - -f -
>
>  * regression tests: fix rekey test that was testing the same KEX
>    algorithm repeatedly instead of testing all of them. bz3692
>
>  * ssh_config(5), sshd_config(5): clarify the KEXAlgorithms directive
>    documentation, especially around what is supported vs available.
>    bz3701.
>
> Portability
> -----------
>
>  * sshd(8): expose SSH_AUTH_INFO_0 always to PAM auth modules
>    unconditionally. The previous behaviour was to expose it only when
>    particular authentication methods were in use.
>
>  * build: fix OpenSSL ED25519 support detection. An incorrect function
>    signature in configure.ac previously prevented enabling the recently
>    added support for ED25519 private keys in PEM PKCS8 format.
>
>  * ssh(1), ssh-agent(8): allow the presence of the WAYLAND_DISPLAY
>    environment variable to enable SSH_ASKPASS, similarly to the X11
>    DISPLAY environment variable. GHPR479
>
>  * build: improve detection of the -fzero-call-used-regs compiler
>    flag. bz3673.
>
>  * build: relax OpenSSL version check to accept all OpenSSL 3.x
>    versions.
>
>  * sshd(8): add support for notifying systemd on server listen and
>    reload, using a standalone implementation that doesn't depend on
>    libsystemd. bz2641
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>
> v2:
>  - fix musl build
>  - fix sshd-session packing on openssh-sshd
>  - rebase on top of the CVE-2024-6387 fix sent
>
> v3:
>  - fix the ptest fail
>  - update upstream status of the systemd sd-notify patch
>
> v4:
>  - split update of Upstream-Status in new patches in the serie
>  - submit the the ptest fix upstream
>
> v5:
>  - backport upstream fix for musl build
>  - drop the backported systemd notify
>
> v6:
> v7:
>  - nothing change
>
>  ...ast-to-sockaddr-in-systemd-interface.patch |  30 +++
>  ...-notify-systemd-on-listen-and-reload.patch | 225 ------------------
>  ...h-log-input-and-output-files-on-erro.patch |   8 +-
>  ...c-use-the-absolute-path-in-the-SSH-e.patch |  35 +++
>  .../openssh/openssh/CVE-2024-6387.patch       |  27 ---
>  .../openssh/openssh/run-ptest                 |   1 +
>  .../{openssh_9.7p1.bb =3D> openssh_9.8p1.bb}    |   8 +-
>  7 files changed, 73 insertions(+), 261 deletions(-)
>  create mode 100644
> meta/recipes-connectivity/openssh/openssh/0001-Cast-to-sockaddr-in-system=
d-interface.patch
>  delete mode 100644
> meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-listen-a=
nd-reload.patch
>  create mode 100644
> meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-=
absolute-path-in-the-SSH-e.patch
>  delete mode 100644
> meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch
>  rename meta/recipes-connectivity/openssh/{openssh_9.7p1.bb =3D>
> openssh_9.8p1.bb} (96%)
>
> diff --git
> a/meta/recipes-connectivity/openssh/openssh/0001-Cast-to-sockaddr-in-syst=
emd-interface.patch
> b/meta/recipes-connectivity/openssh/openssh/0001-Cast-to-sockaddr-in-syst=
emd-interface.patch
> new file mode 100644
> index 0000000000..c41642ae10
> --- /dev/null
> +++
> b/meta/recipes-connectivity/openssh/openssh/0001-Cast-to-sockaddr-in-syst=
emd-interface.patch
> @@ -0,0 +1,30 @@
> +From a3068c6edb81c0b0b9a2ced82e8632c79314e409 Mon Sep 17 00:00:00 2001
> +From: Darren Tucker <dtucker@dtucker.net>
> +Date: Sun, 7 Jul 2024 18:46:19 +1000
> +Subject: [PATCH] Cast to sockaddr * in systemd interface.
> +
> +Fixes build with musl libx.  bz#3707.
> +
> +Upstream-Status: Backport [
> https://github.com/openssh/openssh-portable/commit/8b664df75966e5aed8dabe=
a00b8838303d3488b8
> ]
> +
> +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> +---
> + openbsd-compat/port-linux.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/openbsd-compat/port-linux.c b/openbsd-compat/port-linux.c
> +index 4c024c6d2..8adfec5a7 100644
> +--- a/openbsd-compat/port-linux.c
> ++++ b/openbsd-compat/port-linux.c
> +@@ -366,7 +366,7 @@ ssh_systemd_notify(const char *fmt, ...)
> +               error_f("socket \"%s\": %s", path, strerror(errno));
> +               goto out;
> +       }
> +-      if (connect(fd, &addr, sizeof(addr)) !=3D 0) {
> ++      if (connect(fd, (struct sockaddr *)&addr, sizeof(addr)) !=3D 0) {
> +               error_f("socket \"%s\" connect: %s", path,
> strerror(errno));
> +               goto out;
> +       }
> +--
> +2.45.2
> +
> diff --git
> a/meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-listen=
-and-reload.patch
> b/meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-listen=
-and-reload.patch
> deleted file mode 100644
> index 4925c969fe..0000000000
> ---
> a/meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-listen=
-and-reload.patch
> +++ /dev/null
> @@ -1,225 +0,0 @@
> -From fc73e2405a8ca928465580b74a4d76112919367b Mon Sep 17 00:00:00 2001
> -From: Damien Miller <djm@mindrot.org>
> -Date: Wed, 3 Apr 2024 14:40:32 +1100
> -Subject: [PATCH] notify systemd on listen and reload
> -
> -Standalone implementation that does not depend on libsystemd.
> -With assistance from Luca Boccassi, and feedback/testing from Colin
> -Watson. bz2641
> -
> -Upstream-Status: Backport [
> https://github.com/openssh/openssh-portable/commit/08f579231cd38a1c657aaa=
6ddeb8ab57a1fd4f5c
> ]
> -
> -Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ----
> - configure.ac                |  1 +
> - openbsd-compat/port-linux.c | 97 ++++++++++++++++++++++++++++++++++++-
> - openbsd-compat/port-linux.h |  5 ++
> - platform.c                  | 11 +++++
> - platform.h                  |  1 +
> - sshd.c                      |  2 +
> - 6 files changed, 115 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 82e8bb7c1..854f92b5b 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -915,6 +915,7 @@ int main(void) { if
> (NSVersionOfRunTimeLibrary("System") >=3D (60 << 16))
> -       AC_DEFINE([_PATH_BTMP], ["/var/log/btmp"], [log for bad login
> attempts])
> -       AC_DEFINE([USE_BTMP])
> -       AC_DEFINE([LINUX_OOM_ADJUST], [1], [Adjust Linux out-of-memory
> killer])
> -+      AC_DEFINE([SYSTEMD_NOTIFY], [1], [Have sshd notify systemd on
> start/reload])
> -       inet6_default_4in6=3Dyes
> -       case `uname -r` in
> -       1.*|2.0.*)
> -diff --git a/openbsd-compat/port-linux.c b/openbsd-compat/port-linux.c
> -index 0457e28d0..df7290246 100644
> ---- a/openbsd-compat/port-linux.c
> -+++ b/openbsd-compat/port-linux.c
> -@@ -21,16 +21,23 @@
> -
> - #include "includes.h"
> -
> --#if defined(WITH_SELINUX) || defined(LINUX_OOM_ADJUST)
> -+#if defined(WITH_SELINUX) || defined(LINUX_OOM_ADJUST) || \
> -+    defined(SYSTEMD_NOTIFY)
> -+#include <sys/socket.h>
> -+#include <sys/un.h>
> -+
> - #include <errno.h>
> -+#include <inttypes.h>
> - #include <stdarg.h>
> - #include <string.h>
> - #include <stdio.h>
> - #include <stdlib.h>
> -+#include <time.h>
> -
> - #include "log.h"
> - #include "xmalloc.h"
> - #include "port-linux.h"
> -+#include "misc.h"
> -
> - #ifdef WITH_SELINUX
> - #include <selinux/selinux.h>
> -@@ -310,4 +317,90 @@ oom_adjust_restore(void)
> -       return;
> - }
> - #endif /* LINUX_OOM_ADJUST */
> --#endif /* WITH_SELINUX || LINUX_OOM_ADJUST */
> -+
> -+#ifdef SYSTEMD_NOTIFY
> -+
> -+static void ssh_systemd_notify(const char *, ...)
> -+    __attribute__((__format__ (printf, 1, 2)))
> __attribute__((__nonnull__ (1)));
> -+
> -+static void
> -+ssh_systemd_notify(const char *fmt, ...)
> -+{
> -+      char *s =3D NULL;
> -+      const char *path;
> -+      struct stat sb;
> -+      struct sockaddr_un addr;
> -+      int fd =3D -1;
> -+      va_list ap;
> -+
> -+      if ((path =3D getenv("NOTIFY_SOCKET")) =3D=3D NULL || strlen(path=
) =3D=3D 0)
> -+              return;
> -+
> -+      va_start(ap, fmt);
> -+      xvasprintf(&s, fmt, ap);
> -+      va_end(ap);
> -+
> -+      /* Only AF_UNIX is supported, with path or abstract sockets */
> -+      if (path[0] !=3D '/' && path[0] !=3D '@') {
> -+              error_f("socket \"%s\" is not compatible with AF_UNIX",
> path);
> -+              goto out;
> -+      }
> -+
> -+      if (path[0] =3D=3D '/' && stat(path, &sb) !=3D 0) {
> -+              error_f("socket \"%s\" stat: %s", path, strerror(errno));
> -+              goto out;
> -+      }
> -+
> -+      memset(&addr, 0, sizeof(addr));
> -+      addr.sun_family =3D AF_UNIX;
> -+      if (strlcpy(addr.sun_path, path,
> -+          sizeof(addr.sun_path)) >=3D sizeof(addr.sun_path)) {
> -+              error_f("socket path \"%s\" too long", path);
> -+              goto out;
> -+      }
> -+      /* Support for abstract socket */
> -+      if (addr.sun_path[0] =3D=3D '@')
> -+              addr.sun_path[0] =3D 0;
> -+      if ((fd =3D socket(PF_UNIX, SOCK_DGRAM, 0)) =3D=3D -1) {
> -+              error_f("socket \"%s\": %s", path, strerror(errno));
> -+              goto out;
> -+      }
> -+      if (connect(fd, &addr, sizeof(addr)) !=3D 0) {
> -+              error_f("socket \"%s\" connect: %s", path,
> strerror(errno));
> -+              goto out;
> -+      }
> -+      if (write(fd, s, strlen(s)) !=3D (ssize_t)strlen(s)) {
> -+              error_f("socket \"%s\" write: %s", path, strerror(errno))=
;
> -+              goto out;
> -+      }
> -+      debug_f("socket \"%s\" notified %s", path, s);
> -+ out:
> -+      if (fd !=3D -1)
> -+              close(fd);
> -+      free(s);
> -+}
> -+
> -+void
> -+ssh_systemd_notify_ready(void)
> -+{
> -+      ssh_systemd_notify("READY=3D1");
> -+}
> -+
> -+void
> -+ssh_systemd_notify_reload(void)
> -+{
> -+      struct timespec now;
> -+
> -+      monotime_ts(&now);
> -+      if (now.tv_sec < 0 || now.tv_nsec < 0) {
> -+              error_f("monotime returned negative value");
> -+              ssh_systemd_notify("RELOADING=3D1");
> -+      } else {
> -+              ssh_systemd_notify("RELOADING=3D1\nMONOTONIC_USEC=3D%llu"=
,
> -+                  ((uint64_t)now.tv_sec * 1000000ULL) +
> -+                  ((uint64_t)now.tv_nsec / 1000ULL));
> -+      }
> -+}
> -+#endif /* SYSTEMD_NOTIFY */
> -+
> -+#endif /* WITH_SELINUX || LINUX_OOM_ADJUST || SYSTEMD_NOTIFY */
> -diff --git a/openbsd-compat/port-linux.h b/openbsd-compat/port-linux.h
> -index 3c22a854d..14064f87d 100644
> ---- a/openbsd-compat/port-linux.h
> -+++ b/openbsd-compat/port-linux.h
> -@@ -30,4 +30,9 @@ void oom_adjust_restore(void);
> - void oom_adjust_setup(void);
> - #endif
> -
> -+#ifdef SYSTEMD_NOTIFY
> -+void ssh_systemd_notify_ready(void);
> -+void ssh_systemd_notify_reload(void);
> -+#endif
> -+
> - #endif /* ! _PORT_LINUX_H */
> -diff --git a/platform.c b/platform.c
> -index 4fe8744ee..9cf818153 100644
> ---- a/platform.c
> -+++ b/platform.c
> -@@ -44,6 +44,14 @@ platform_pre_listen(void)
> - #endif
> - }
> -
> -+void
> -+platform_post_listen(void)
> -+{
> -+#ifdef SYSTEMD_NOTIFY
> -+      ssh_systemd_notify_ready();
> -+#endif
> -+}
> -+
> - void
> - platform_pre_fork(void)
> - {
> -@@ -55,6 +63,9 @@ platform_pre_fork(void)
> - void
> - platform_pre_restart(void)
> - {
> -+#ifdef SYSTEMD_NOTIFY
> -+      ssh_systemd_notify_reload();
> -+#endif
> - #ifdef LINUX_OOM_ADJUST
> -       oom_adjust_restore();
> - #endif
> -diff --git a/platform.h b/platform.h
> -index 7fef8c983..5dec23276 100644
> ---- a/platform.h
> -+++ b/platform.h
> -@@ -21,6 +21,7 @@
> - void platform_pre_listen(void);
> - void platform_pre_fork(void);
> - void platform_pre_restart(void);
> -+void platform_post_listen(void);
> - void platform_post_fork_parent(pid_t child_pid);
> - void platform_post_fork_child(void);
> - int  platform_privileged_uidswap(void);
> -diff --git a/sshd.c b/sshd.c
> -index b4f2b9742..865331b46 100644
> ---- a/sshd.c
> -+++ b/sshd.c
> -@@ -2077,6 +2077,8 @@ main(int ac, char **av)
> -               ssh_signal(SIGTERM, sigterm_handler);
> -               ssh_signal(SIGQUIT, sigterm_handler);
> -
> -+              platform_post_listen();
> -+
> -               /*
> -                * Write out the pid file after the sigterm handler
> -                * is setup and the listen sockets are bound
> ---
> -2.45.2
> -
> diff --git
> a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-in=
put-and-output-files-on-erro.patch
> b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-in=
put-and-output-files-on-erro.patch
> index 8763f30f4b..f424288e37 100644
> ---
> a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-in=
put-and-output-files-on-erro.patch
> +++
> b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-in=
put-and-output-files-on-erro.patch
> @@ -1,4 +1,4 @@
> -From f5a4dacc987ca548fc86577c2dba121c86da3c34 Mon Sep 17 00:00:00 2001
> +From 5cc897fe2effe549e1e280c2f606bce8b532b61e Mon Sep 17 00:00:00 2001
>  From: Mikko Rapeli <mikko.rapeli@linaro.org>
>  Date: Mon, 11 Sep 2023 09:55:21 +0100
>  Subject: [PATCH] regress/banner.sh: log input and output files on error
> @@ -37,12 +37,13 @@ See:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15178
>  Upstream-Status: Denied [
> https://github.com/openssh/openssh-portable/pull/437]
>
>  Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>  ---
>   regress/banner.sh | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
>  diff --git a/regress/banner.sh b/regress/banner.sh
> -index a84feb5a..de84957a 100644
> +index a84feb5..de84957 100644
>  --- a/regress/banner.sh
>  +++ b/regress/banner.sh
>  @@ -32,7 +32,9 @@ for s in 0 10 100 1000 10000 100000 ; do
> @@ -56,6 +57,3 @@ index a84feb5a..de84957a 100644
>   done
>
>   trace "test suppress banner (-q)"
> ---
> -2.34.1
> -
> diff --git
> a/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-th=
e-absolute-path-in-the-SSH-e.patch
> b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-th=
e-absolute-path-in-the-SSH-e.patch
> new file mode 100644
> index 0000000000..b90cd2e69d
> --- /dev/null
> +++
> b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-th=
e-absolute-path-in-the-SSH-e.patch
> @@ -0,0 +1,35 @@
> +From fb762172fb678fe29327b667f8fe7380962a4540 Mon Sep 17 00:00:00 2001
> +From: Jose Quaresma <jose.quaresma@foundries.io>
> +Date: Mon, 15 Jul 2024 18:43:08 +0100
> +Subject: [PATCH] regress/test-exec: use the absolute path in the SSH env
> +
> +The SSHAGENT_BIN was changed in [1] to SSH_BIN but
> +the last one don't use the absolute path and consequently
> +the function increase_datafile_size can loops forever
> +if the binary not found.
> +
> +[1]
> https://github.com/openssh/openssh-portable/commit/a68f80f2511f0e0c5cef73=
7a8284cc2dfabad818
> +
> +Upstream-Status: Submitted [
> https://github.com/openssh/openssh-portable/pull/510]
> +
> +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> +---
> + regress/test-exec.sh | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/regress/test-exec.sh b/regress/test-exec.sh
> +index 7afc2807..175f554b 100644
> +--- a/regress/test-exec.sh
> ++++ b/regress/test-exec.sh
> +@@ -175,6 +175,11 @@ if [ "x$TEST_SSH_OPENSSL" !=3D "x" ]; then
> + fi
> +
> + # Path to sshd must be absolute for rexec
> ++case "$SSH" in
> ++/*) ;;
> ++*) SSH=3D`which $SSH` ;;
> ++esac
> ++
> + case "$SSHD" in
> + /*) ;;
> + *) SSHD=3D`which $SSHD` ;;
> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patc=
h
> b/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch
> deleted file mode 100644
> index 3e7c707100..0000000000
> --- a/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Description: fix signal handler race condition
> -Bug-Ubuntu:
> https://bugs.launchpad.net/ubuntu/+source/openssh/+bug/2070497
> -
> -CVE: CVE-2024-6387
> -
> -Upstream-Status: Backport
> -
> https://git.launchpad.net/ubuntu/+source/openssh/commit/?h=3Dapplied/ubun=
tu/jammy-devel&id=3Db059bcfa928df4ff2d103ae2e8f4e3136ee03efc
> -
> -Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> -
> ---- a/log.c
> -+++ b/log.c
> -@@ -452,12 +452,14 @@ void
> - sshsigdie(const char *file, const char *func, int line, int showfunc,
> -     LogLevel level, const char *suffix, const char *fmt, ...)
> - {
> -+#if 0
> -       va_list args;
> -
> -       va_start(args, fmt);
> -       sshlogv(file, func, line, showfunc, SYSLOG_LEVEL_FATAL,
> -           suffix, fmt, args);
> -       va_end(args);
> -+#endif
> -       _exit(1);
> - }
> -
> diff --git a/meta/recipes-connectivity/openssh/openssh/run-ptest
> b/meta/recipes-connectivity/openssh/openssh/run-ptest
> index b2244d725a..c9100f9f37 100755
> --- a/meta/recipes-connectivity/openssh/openssh/run-ptest
> +++ b/meta/recipes-connectivity/openssh/openssh/run-ptest
> @@ -1,5 +1,6 @@
>  #!/bin/sh
>
> +export TEST_SSH_SSH=3Dssh
>  export TEST_SHELL=3Dsh
>  export SKIP_UNIT=3D1
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
> b/meta/recipes-connectivity/openssh/openssh_9.8p1.bb
> similarity index 96%
> rename from meta/recipes-connectivity/openssh/openssh_9.7p1.bb
> rename to meta/recipes-connectivity/openssh/openssh_9.8p1.bb
> index 4680d12be5..9554b4783f 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.8p1.bb
> @@ -23,11 +23,11 @@ SRC_URI =3D "
> http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
>             file://volatiles.99_sshd \
>             file://run-ptest \
>             file://sshd_check_keys \
> +           file://0001-Cast-to-sockaddr-in-systemd-interface.patch \
>
> file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
> -           file://0001-notify-systemd-on-listen-and-reload.patch \
> -           file://CVE-2024-6387.patch \
> +
>  file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch \
>             "
> -SRC_URI[sha256sum] =3D
> "490426f766d82a2763fcacd8d83ea3d70798750c7bd2aff2e57dc5660f773ffd"
> +SRC_URI[sha256sum] =3D
> "dd8bd002a379b5d499dfb050dd1fa9af8029e80461f4bb6c523c49973f5a39f3"
>
>  CVE_STATUS[CVE-2007-2768] =3D "not-applicable-config: This CVE is specif=
ic
> to OpenSSH with the pam opie which we don't build/use here."
>
> @@ -195,7 +195,7 @@ ALLOW_EMPTY:${PN} =3D "1"
>  PACKAGES =3D+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp
> ${PN}-misc ${PN}-sftp-server"
>  FILES:${PN}-scp =3D "${bindir}/scp.${BPN}"
>  FILES:${PN}-ssh =3D "${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_config"
> -FILES:${PN}-sshd =3D "${sbindir}/sshd ${sysconfdir}/init.d/sshd
> ${systemd_system_unitdir}"
> +FILES:${PN}-sshd =3D "${sbindir}/sshd ${libexecdir}/sshd-session
> ${sysconfdir}/init.d/sshd ${systemd_system_unitdir}"
>  FILES:${PN}-sshd +=3D "${sysconfdir}/ssh/moduli
> ${sysconfdir}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_readonly
> ${sysconfdir}/default/volatiles/99_sshd ${sysconfdir}/pam.d/sshd"
>  FILES:${PN}-sshd +=3D "${libexecdir}/${BPN}/sshd_check_keys"
>  FILES:${PN}-sftp =3D "${bindir}/sftp"
> --
> 2.45.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202231):
> https://lists.openembedded.org/g/openembedded-core/message/202231
> Mute This Topic: https://lists.openembedded.org/mt/107420537/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000e13e07061dfef73c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span class=3D"gmail-il" style=3D"color:rgb(0,0,0)">Gentle=
</span><span style=3D"color:rgb(0,0,0)">=C2=A0</span><span class=3D"gmail-i=
l" style=3D"color:rgb(0,0,0)">ping</span><span style=3D"color:rgb(0,0,0)">.=
</span><br style=3D"color:rgb(0,0,0)"></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma via <a href=3D"http://l=
ists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;qua=
resma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"=
_blank">gmail.com@lists.openembedded.org</a>&gt; escreveu (quinta, 18/07/20=
24 =C3=A0(s) 17:55):<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">- drop the CVE-2024-6387<br>
- fix musl build [backported patch]<br>
- fix ptest regression [submited patch]<br>
- sshd now had the sshd-session<br>
<br>
Release notes at <a href=3D"https://www.openssh.com/txt/release-9.8" rel=3D=
"noreferrer" target=3D"_blank">https://www.openssh.com/txt/release-9.8</a><=
br>
<br>
Security<br>
=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
This release contains fixes for two security problems, one critical<br>
and one minor.<br>
<br>
1) Race condition in sshd(8)<br>
<br>
A critical vulnerability in sshd(8) was present in Portable OpenSSH<br>
versions between 8.5p1 and 9.7p1 (inclusive) that may allow arbitrary<br>
code execution with root privileges.<br>
<br>
Successful exploitation has been demonstrated on 32-bit Linux/glibc<br>
systems with ASLR. Under lab conditions, the attack requires on<br>
average 6-8 hours of continuous connections up to the maximum the<br>
server will accept. Exploitation on 64-bit systems is believed to be<br>
possible but has not been demonstrated at this time. It&#39;s likely that<b=
r>
these attacks will be improved upon.<br>
<br>
Exploitation on non-glibc systems is conceivable but has not been<br>
examined. Systems that lack ASLR or users of downstream Linux<br>
distributions that have modified OpenSSH to disable per-connection<br>
ASLR re-randomisation (yes - this is a thing, no - we don&#39;t<br>
understand why) may potentially have an easier path to exploitation.<br>
OpenBSD is not vulnerable.<br>
<br>
We thank the Qualys Security Advisory Team for discovering, reporting<br>
and demonstrating exploitability of this problem, and for providing<br>
detailed feedback on additional mitigation measures.<br>
<br>
2) Logic error in ssh(1) ObscureKeystrokeTiming<br>
<br>
In OpenSSH version 9.5 through 9.7 (inclusive), when connected to an<br>
OpenSSH server version 9.5 or later, a logic error in the ssh(1)<br>
ObscureKeystrokeTiming feature (on by default) rendered this feature<br>
ineffective - a passive observer could still detect which network<br>
packets contained real keystrokes when the countermeasure was active<br>
because both fake and real keystroke packets were being sent<br>
unconditionally.<br>
<br>
This bug was found by Philippos Giavridis and also independently by<br>
Jacky Wei En Kung, Daniel Hugenroth and Alastair Beresford of the<br>
University of Cambridge Computer Lab.<br>
<br>
Worse, the unconditional sending of both fake and real keystroke<br>
packets broke another long-standing timing attack mitigation. Since<br>
OpenSSH 2.9.9 sshd(8) has sent fake keystoke echo packets for<br>
traffic received on TTYs in echo-off mode, such as when entering a<br>
password into su(8) or sudo(8). This bug rendered these fake<br>
keystroke echoes ineffective and could allow a passive observer of<br>
a SSH session to once again detect when echo was off and obtain<br>
fairly limited timing information about keystrokes in this situation<br>
(20ms granularity by default).<br>
<br>
This additional implication of the bug was identified by Jacky Wei<br>
En Kung, Daniel Hugenroth and Alastair Beresford and we thank them<br>
for their detailed analysis.<br>
<br>
This bug does not affect connections when ObscureKeystrokeTiming<br>
was disabled or sessions where no TTY was requested.<br>
<br>
Future deprecation notice<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
<br>
<br>
OpenSSH plans to remove support for the DSA signature algorithm in<br>
early 2025. This release disables DSA by default at compile time.<br>
<br>
DSA, as specified in the SSHv2 protocol, is inherently weak - being<br>
limited to a 160 bit private key and use of the SHA1 digest. Its<br>
estimated security level is only 80 bits symmetric equivalent.<br>
<br>
OpenSSH has disabled DSA keys by default since 2015 but has retained<br>
run-time optional support for them. DSA was the only mandatory-to-<br>
implement algorithm in the SSHv2 RFCs, mostly because alternative<br>
algorithms were encumbered by patents when the SSHv2 protocol was<br>
specified.<br>
<br>
This has not been the case for decades at this point and better<br>
algorithms are well supported by all actively-maintained SSH<br>
implementations. We do not consider the costs of maintaining DSA<br>
in OpenSSH to be justified and hope that removing it from OpenSSH<br>
can accelerate its wider deprecation in supporting cryptography<br>
libraries.<br>
<br>
This release, and its deactivation of DSA by default at compile-time,<br>
marks the second step in our timeline to finally deprecate DSA. The<br>
final step of removing DSA support entirely is planned for the first<br>
OpenSSH release of 2025.<br>
<br>
DSA support may be re-enabled in OpenBSD by setting &quot;DSAKEY=3Dyes&quot=
;<br>
in Makefile.inc. To enable DSA support in portable OpenSSH, pass<br>
the &quot;--enable-dsa-keys&quot; option to configure.<br>
<br>
Potentially-incompatible changes<br>
--------------------------------<br>
<br>
=C2=A0* all: as mentioned above, the DSA signature algorithm is now<br>
=C2=A0 =C2=A0disabled at compile time.<br>
<br>
=C2=A0* sshd(8): the server will now block client addresses that<br>
=C2=A0 =C2=A0repeatedly fail authentication, repeatedly connect without eve=
r<br>
=C2=A0 =C2=A0completing authentication or that crash the server. See the<br=
>
=C2=A0 =C2=A0discussion of PerSourcePenalties below for more information.<b=
r>
=C2=A0 =C2=A0Operators of servers that accept connections from many users, =
or<br>
=C2=A0 =C2=A0servers that accept connections from addresses behind NAT or<b=
r>
=C2=A0 =C2=A0proxies may need to consider these settings.<br>
<br>
=C2=A0* sshd(8): the server has been split into a listener binary, sshd(8),=
<br>
=C2=A0 =C2=A0and a per-session binary &quot;sshd-session&quot;. This allows=
 for a much<br>
=C2=A0 =C2=A0smaller listener binary, as it no longer needs to support the =
SSH<br>
=C2=A0 =C2=A0protocol. As part of this work, support for disabling privileg=
e<br>
=C2=A0 =C2=A0separation (which previously required code changes to disable)=
 and<br>
=C2=A0 =C2=A0disabling re-execution of sshd(8) has been removed. Further<br=
>
=C2=A0 =C2=A0separation of sshd-session into additional, minimal binaries i=
s<br>
=C2=A0 =C2=A0planned for the future.<br>
<br>
=C2=A0* sshd(8): several log messages have changed. In particular, some<br>
=C2=A0 =C2=A0log messages will be tagged with as originating from a process=
<br>
=C2=A0 =C2=A0named &quot;sshd-session&quot; rather than &quot;sshd&quot;.<b=
r>
<br>
=C2=A0* ssh-keyscan(1): this tool previously emitted comment lines<br>
=C2=A0 =C2=A0containing the hostname and SSH protocol banner to standard er=
ror.<br>
=C2=A0 =C2=A0This release now emits them to standard output, but adds a new=
<br>
=C2=A0 =C2=A0&quot;-q&quot; flag to silence them altogether.<br>
<br>
=C2=A0* sshd(8): (portable OpenSSH only) sshd will no longer use argv[0]<br=
>
=C2=A0 =C2=A0as the PAM service name. A new &quot;PAMServiceName&quot; sshd=
_config(5)<br>
=C2=A0 =C2=A0directive allows selecting the service name at runtime. This<b=
r>
=C2=A0 =C2=A0defaults to &quot;sshd&quot;. bz2101<br>
<br>
=C2=A0* (portable OpenSSH only) Automatically-generated files, such as<br>
=C2=A0 =C2=A0configure, <a href=3D"http://config.h.in" rel=3D"noreferrer" t=
arget=3D"_blank">config.h.in</a>, etc will now be checked in to the portabl=
e<br>
=C2=A0 =C2=A0OpenSSH git release branch (e.g. V_9_8). This should ensure th=
at<br>
=C2=A0 =C2=A0the contents of the signed release branch exactly match the<br=
>
=C2=A0 =C2=A0contents of the signed release tarball.<br>
<br>
Changes since OpenSSH 9.7<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
<br>
<br>
This release contains mostly bugfixes.<br>
<br>
New features<br>
------------<br>
<br>
=C2=A0* sshd(8): as described above, sshd(8) will now penalise client<br>
=C2=A0 =C2=A0addresses that, for various reasons, do not successfully compl=
ete<br>
=C2=A0 =C2=A0authentication. This feature is controlled by a new sshd_confi=
g(5)<br>
=C2=A0 =C2=A0PerSourcePenalties option and is on by default.<br>
<br>
=C2=A0 =C2=A0sshd(8) will now identify situations where the session did not=
<br>
=C2=A0 =C2=A0authenticate as expected. These conditions include when the cl=
ient<br>
=C2=A0 =C2=A0repeatedly attempted authentication unsucessfully (possibly<br=
>
=C2=A0 =C2=A0indicating an attack against one or more accounts, e.g. passwo=
rd<br>
=C2=A0 =C2=A0guessing), or when client behaviour caused sshd to crash (poss=
ibly<br>
=C2=A0 =C2=A0indicating attempts to exploit bugs in sshd).<br>
<br>
=C2=A0 =C2=A0When such a condition is observed, sshd will record a penalty =
of<br>
=C2=A0 =C2=A0some duration (e.g. 30 seconds) against the client&#39;s addre=
ss. If<br>
=C2=A0 =C2=A0this time is above a minimum configurable threshold, then all<=
br>
=C2=A0 =C2=A0connections from the client address will be refused (along wit=
h any<br>
=C2=A0 =C2=A0others in the same PerSourceNetBlockSize CIDR range) until the=
<br>
=C2=A0 =C2=A0penalty expire.<br>
<br>
=C2=A0 =C2=A0Repeated offenses by the same client address will accrue great=
er<br>
=C2=A0 =C2=A0penalties, up to a configurable maximum. Address ranges may be=
<br>
=C2=A0 =C2=A0fully exempted from penalties, e.g. to guarantee access from a=
 set<br>
=C2=A0 =C2=A0of trusted management addresses, using the new sshd_config(5)<=
br>
=C2=A0 =C2=A0PerSourcePenaltyExemptList option.<br>
<br>
=C2=A0 =C2=A0We hope these options will make it significantly more difficul=
t for<br>
=C2=A0 =C2=A0attackers to find accounts with weak/guessable passwords or ex=
ploit<br>
=C2=A0 =C2=A0bugs in sshd(8) itself. This option is enabled by default.<br>
<br>
=C2=A0* ssh(8): allow the HostkeyAlgorithms directive to disable the<br>
=C2=A0 =C2=A0implicit fallback from certificate host key to plain host keys=
.<br>
<br>
Bugfixes<br>
--------<br>
<br>
=C2=A0* misc: fix a number of inaccuracies in the PROTOCOL.*<br>
=C2=A0 =C2=A0documentation files. GHPR430 GHPR487<br>
<br>
=C2=A0* all: switch to strtonum(3) for more robust integer parsing in most<=
br>
=C2=A0 =C2=A0places.<br>
<br>
=C2=A0* ssh(1), sshd(8): correctly restore sigprocmask around ppoll()<br>
<br>
=C2=A0* ssh-keysign(8): stricter validation of messaging socket fd GHPR492<=
br>
<br>
=C2=A0* sftp(1): flush stdout after writing &quot;sftp&gt;&quot; prompt whe=
n not using<br>
=C2=A0 =C2=A0editline. GHPR480<br>
<br>
=C2=A0* sftp-server(8): fix home-directory extension implementation, it<br>
=C2=A0 =C2=A0previously always returned the current user&#39;s home directo=
ry<br>
=C2=A0 =C2=A0contrary to the spec. GHPR477<br>
<br>
=C2=A0* ssh-keyscan(1): do not close stdin to prevent error messages when<b=
r>
=C2=A0 =C2=A0stdin is read multiple times. E.g.<br>
=C2=A0 =C2=A0echo localhost | ssh-keyscan -f - -f -<br>
<br>
=C2=A0* regression tests: fix rekey test that was testing the same KEX<br>
=C2=A0 =C2=A0algorithm repeatedly instead of testing all of them. bz3692<br=
>
<br>
=C2=A0* ssh_config(5), sshd_config(5): clarify the KEXAlgorithms directive<=
br>
=C2=A0 =C2=A0documentation, especially around what is supported vs availabl=
e.<br>
=C2=A0 =C2=A0bz3701.<br>
<br>
Portability<br>
-----------<br>
<br>
=C2=A0* sshd(8): expose SSH_AUTH_INFO_0 always to PAM auth modules<br>
=C2=A0 =C2=A0unconditionally. The previous behaviour was to expose it only =
when<br>
=C2=A0 =C2=A0particular authentication methods were in use.<br>
<br>
=C2=A0* build: fix OpenSSL ED25519 support detection. An incorrect function=
<br>
=C2=A0 =C2=A0signature in <a href=3D"http://configure.ac" rel=3D"noreferrer=
" target=3D"_blank">configure.ac</a> previously prevented enabling the rece=
ntly<br>
=C2=A0 =C2=A0added support for ED25519 private keys in PEM PKCS8 format.<br=
>
<br>
=C2=A0* ssh(1), ssh-agent(8): allow the presence of the WAYLAND_DISPLAY<br>
=C2=A0 =C2=A0environment variable to enable SSH_ASKPASS, similarly to the X=
11<br>
=C2=A0 =C2=A0DISPLAY environment variable. GHPR479<br>
<br>
=C2=A0* build: improve detection of the -fzero-call-used-regs compiler<br>
=C2=A0 =C2=A0flag. bz3673.<br>
<br>
=C2=A0* build: relax OpenSSL version check to accept all OpenSSL 3.x<br>
=C2=A0 =C2=A0versions.<br>
<br>
=C2=A0* sshd(8): add support for notifying systemd on server listen and<br>
=C2=A0 =C2=A0reload, using a standalone implementation that doesn&#39;t dep=
end on<br>
=C2=A0 =C2=A0libsystemd. bz2641<br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.=
io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
---<br>
<br>
v2:<br>
=C2=A0- fix musl build<br>
=C2=A0- fix sshd-session packing on openssh-sshd<br>
=C2=A0- rebase on top of the CVE-2024-6387 fix sent<br>
<br>
v3:<br>
=C2=A0- fix the ptest fail<br>
=C2=A0- update upstream status of the systemd sd-notify patch<br>
<br>
v4:<br>
=C2=A0- split update of Upstream-Status in new patches in the serie<br>
=C2=A0- submit the the ptest fix upstream<br>
<br>
v5:<br>
=C2=A0- backport upstream fix for musl build<br>
=C2=A0- drop the backported systemd notify<br>
<br>
v6:<br>
v7:<br>
=C2=A0- nothing change<br>
<br>
=C2=A0...ast-to-sockaddr-in-systemd-interface.patch |=C2=A0 30 +++<br>
=C2=A0...-notify-systemd-on-listen-and-reload.patch | 225 -----------------=
-<br>
=C2=A0...h-log-input-and-output-files-on-erro.patch |=C2=A0 =C2=A08 +-<br>
=C2=A0...c-use-the-absolute-path-in-the-SSH-e.patch |=C2=A0 35 +++<br>
=C2=A0.../openssh/openssh/CVE-2024-6387.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 27 ---<br>
=C2=A0.../openssh/openssh/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../{<a href=3D"http://openssh_9.7p1.bb" rel=3D"noreferrer" target=3D=
"_blank">openssh_9.7p1.bb</a> =3D&gt; <a href=3D"http://openssh_9.8p1.bb" r=
el=3D"noreferrer" target=3D"_blank">openssh_9.8p1.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A08 +-<br>
=C2=A07 files changed, 73 insertions(+), 261 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-Cas=
t-to-sockaddr-in-systemd-interface.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/openssh/openssh/0001-not=
ify-systemd-on-listen-and-reload.patch<br>
=C2=A0create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-reg=
ress-test-exec-use-the-absolute-path-in-the-SSH-e.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2024=
-6387.patch<br>
=C2=A0rename meta/recipes-connectivity/openssh/{<a href=3D"http://openssh_9=
.7p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.7p1.bb</a> =3D&gt; =
<a href=3D"http://openssh_9.8p1.bb" rel=3D"noreferrer" target=3D"_blank">op=
enssh_9.8p1.bb</a>} (96%)<br>
<br>
diff --git a/meta/recipes-connectivity/openssh/openssh/0001-Cast-to-sockadd=
r-in-systemd-interface.patch b/meta/recipes-connectivity/openssh/openssh/00=
01-Cast-to-sockaddr-in-systemd-interface.patch<br>
new file mode 100644<br>
index 0000000000..c41642ae10<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/openssh/openssh/0001-Cast-to-sockaddr-in-sy=
stemd-interface.patch<br>
@@ -0,0 +1,30 @@<br>
+From a3068c6edb81c0b0b9a2ced82e8632c79314e409 Mon Sep 17 00:00:00 2001<br>
+From: Darren Tucker &lt;<a href=3D"mailto:dtucker@dtucker.net" target=3D"_=
blank">dtucker@dtucker.net</a>&gt;<br>
+Date: Sun, 7 Jul 2024 18:46:19 +1000<br>
+Subject: [PATCH] Cast to sockaddr * in systemd interface.<br>
+<br>
+Fixes build with musl libx.=C2=A0 bz#3707.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/openssh/openssh-p=
ortable/commit/8b664df75966e5aed8dabea00b8838303d3488b8" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/openssh/openssh-portable/commit/8b664=
df75966e5aed8dabea00b8838303d3488b8</a>]<br>
+<br>
+Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries=
.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
+---<br>
+ openbsd-compat/port-linux.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/openbsd-compat/port-linux.c b/openbsd-compat/port-linux.c<br>
+index 4c024c6d2..8adfec5a7 100644<br>
+--- a/openbsd-compat/port-linux.c<br>
++++ b/openbsd-compat/port-linux.c<br>
+@@ -366,7 +366,7 @@ ssh_systemd_notify(const char *fmt, ...)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_f(&quot;socke=
t \&quot;%s\&quot;: %s&quot;, path, strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 if (connect(fd, &amp;addr, sizeof(addr)) !=3D 0) {<b=
r>
++=C2=A0 =C2=A0 =C2=A0 if (connect(fd, (struct sockaddr *)&amp;addr, sizeof=
(addr)) !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_f(&quot;socke=
t \&quot;%s\&quot; connect: %s&quot;, path, strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-- <br>
+2.45.2<br>
+<br>
diff --git a/meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-=
on-listen-and-reload.patch b/meta/recipes-connectivity/openssh/openssh/0001=
-notify-systemd-on-listen-and-reload.patch<br>
deleted file mode 100644<br>
index 4925c969fe..0000000000<br>
--- a/meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-list=
en-and-reload.patch<br>
+++ /dev/null<br>
@@ -1,225 +0,0 @@<br>
-From fc73e2405a8ca928465580b74a4d76112919367b Mon Sep 17 00:00:00 2001<br>
-From: Damien Miller &lt;<a href=3D"mailto:djm@mindrot.org" target=3D"_blan=
k">djm@mindrot.org</a>&gt;<br>
-Date: Wed, 3 Apr 2024 14:40:32 +1100<br>
-Subject: [PATCH] notify systemd on listen and reload<br>
-<br>
-Standalone implementation that does not depend on libsystemd.<br>
-With assistance from Luca Boccassi, and feedback/testing from Colin<br>
-Watson. bz2641<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/openssh/openssh-p=
ortable/commit/08f579231cd38a1c657aaa6ddeb8ab57a1fd4f5c" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/openssh/openssh-portable/commit/08f57=
9231cd38a1c657aaa6ddeb8ab57a1fd4f5c</a>]<br>
-<br>
-Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries=
.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
----<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 1 +<br>
- openbsd-compat/port-linux.c | 97 ++++++++++++++++++++++++++++++++++++-<br=
>
- openbsd-compat/port-linux.h |=C2=A0 5 ++<br>
- platform.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| 11 +++++<br>
- platform.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 1 +<br>
- sshd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 2 +<br>
- 6 files changed, 115 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index 82e8bb7c1..854f92b5b 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -915,6 +915,7 @@ int main(void) { if (NSVersionOfRunTimeLibrary(&quot;S=
ystem&quot;) &gt;=3D (60 &lt;&lt; 16))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_DEFINE([_PATH_BTMP], [&quot;/var/log/btmp&qu=
ot;], [log for bad login attempts])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_DEFINE([USE_BTMP])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_DEFINE([LINUX_OOM_ADJUST], [1], [Adjust Linu=
x out-of-memory killer])<br>
-+=C2=A0 =C2=A0 =C2=A0 AC_DEFINE([SYSTEMD_NOTIFY], [1], [Have sshd notify s=
ystemd on start/reload])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0inet6_default_4in6=3Dyes<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case `uname -r` in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A01.*|2.0.*)<br>
-diff --git a/openbsd-compat/port-linux.c b/openbsd-compat/port-linux.c<br>
-index 0457e28d0..df7290246 100644<br>
---- a/openbsd-compat/port-linux.c<br>
-+++ b/openbsd-compat/port-linux.c<br>
-@@ -21,16 +21,23 @@<br>
- <br>
- #include &quot;includes.h&quot;<br>
- <br>
--#if defined(WITH_SELINUX) || defined(LINUX_OOM_ADJUST)<br>
-+#if defined(WITH_SELINUX) || defined(LINUX_OOM_ADJUST) || \<br>
-+=C2=A0 =C2=A0 defined(SYSTEMD_NOTIFY)<br>
-+#include &lt;sys/socket.h&gt;<br>
-+#include &lt;sys/un.h&gt;<br>
-+<br>
- #include &lt;errno.h&gt;<br>
-+#include &lt;inttypes.h&gt;<br>
- #include &lt;stdarg.h&gt;<br>
- #include &lt;string.h&gt;<br>
- #include &lt;stdio.h&gt;<br>
- #include &lt;stdlib.h&gt;<br>
-+#include &lt;time.h&gt;<br>
- <br>
- #include &quot;log.h&quot;<br>
- #include &quot;xmalloc.h&quot;<br>
- #include &quot;port-linux.h&quot;<br>
-+#include &quot;misc.h&quot;<br>
- <br>
- #ifdef WITH_SELINUX<br>
- #include &lt;selinux/selinux.h&gt;<br>
-@@ -310,4 +317,90 @@ oom_adjust_restore(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
- }<br>
- #endif /* LINUX_OOM_ADJUST */<br>
--#endif /* WITH_SELINUX || LINUX_OOM_ADJUST */<br>
-+<br>
-+#ifdef SYSTEMD_NOTIFY<br>
-+<br>
-+static void ssh_systemd_notify(const char *, ...)<br>
-+=C2=A0 =C2=A0 __attribute__((__format__ (printf, 1, 2))) __attribute__((_=
_nonnull__ (1)));<br>
-+<br>
-+static void<br>
-+ssh_systemd_notify(const char *fmt, ...)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 char *s =3D NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 const char *path;<br>
-+=C2=A0 =C2=A0 =C2=A0 struct stat sb;<br>
-+=C2=A0 =C2=A0 =C2=A0 struct sockaddr_un addr;<br>
-+=C2=A0 =C2=A0 =C2=A0 int fd =3D -1;<br>
-+=C2=A0 =C2=A0 =C2=A0 va_list ap;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if ((path =3D getenv(&quot;NOTIFY_SOCKET&quot;)) =3D=
=3D NULL || strlen(path) =3D=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 va_start(ap, fmt);<br>
-+=C2=A0 =C2=A0 =C2=A0 xvasprintf(&amp;s, fmt, ap);<br>
-+=C2=A0 =C2=A0 =C2=A0 va_end(ap);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 /* Only AF_UNIX is supported, with path or abstract =
sockets */<br>
-+=C2=A0 =C2=A0 =C2=A0 if (path[0] !=3D &#39;/&#39; &amp;&amp; path[0] !=3D=
 &#39;@&#39;) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f(&quot;socket \&q=
uot;%s\&quot; is not compatible with AF_UNIX&quot;, path);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (path[0] =3D=3D &#39;/&#39; &amp;&amp; stat(path,=
 &amp;sb) !=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f(&quot;socket \&q=
uot;%s\&quot; stat: %s&quot;, path, strerror(errno));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 memset(&amp;addr, 0, sizeof(addr));<br>
-+=C2=A0 =C2=A0 =C2=A0 addr.sun_family =3D AF_UNIX;<br>
-+=C2=A0 =C2=A0 =C2=A0 if (strlcpy(addr.sun_path, path,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(addr.sun_path)) &gt;=3D sizeof(=
addr.sun_path)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f(&quot;socket pat=
h \&quot;%s\&quot; too long&quot;, path);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 /* Support for abstract socket */<br>
-+=C2=A0 =C2=A0 =C2=A0 if (addr.sun_path[0] =3D=3D &#39;@&#39;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr.sun_path[0] =3D 0;<=
br>
-+=C2=A0 =C2=A0 =C2=A0 if ((fd =3D socket(PF_UNIX, SOCK_DGRAM, 0)) =3D=3D -=
1) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f(&quot;socket \&q=
uot;%s\&quot;: %s&quot;, path, strerror(errno));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 if (connect(fd, &amp;addr, sizeof(addr)) !=3D 0) {<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f(&quot;socket \&q=
uot;%s\&quot; connect: %s&quot;, path, strerror(errno));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 if (write(fd, s, strlen(s)) !=3D (ssize_t)strlen(s))=
 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f(&quot;socket \&q=
uot;%s\&quot; write: %s&quot;, path, strerror(errno));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 debug_f(&quot;socket \&quot;%s\&quot; notified %s&qu=
ot;, path, s);<br>
-+ out:<br>
-+=C2=A0 =C2=A0 =C2=A0 if (fd !=3D -1)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
-+=C2=A0 =C2=A0 =C2=A0 free(s);<br>
-+}<br>
-+<br>
-+void<br>
-+ssh_systemd_notify_ready(void)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 ssh_systemd_notify(&quot;READY=3D1&quot;);<br>
-+}<br>
-+<br>
-+void<br>
-+ssh_systemd_notify_reload(void)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 struct timespec now;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 monotime_ts(&amp;now);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (now.tv_sec &lt; 0 || now.tv_nsec &lt; 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f(&quot;monotime r=
eturned negative value&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssh_systemd_notify(&quot=
;RELOADING=3D1&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssh_systemd_notify(&quot=
;RELOADING=3D1\nMONOTONIC_USEC=3D%llu&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t=
)now.tv_sec * 1000000ULL) +<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t=
)now.tv_nsec / 1000ULL));<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+}<br>
-+#endif /* SYSTEMD_NOTIFY */<br>
-+<br>
-+#endif /* WITH_SELINUX || LINUX_OOM_ADJUST || SYSTEMD_NOTIFY */<br>
-diff --git a/openbsd-compat/port-linux.h b/openbsd-compat/port-linux.h<br>
-index 3c22a854d..14064f87d 100644<br>
---- a/openbsd-compat/port-linux.h<br>
-+++ b/openbsd-compat/port-linux.h<br>
-@@ -30,4 +30,9 @@ void oom_adjust_restore(void);<br>
- void oom_adjust_setup(void);<br>
- #endif<br>
- <br>
-+#ifdef SYSTEMD_NOTIFY<br>
-+void ssh_systemd_notify_ready(void);<br>
-+void ssh_systemd_notify_reload(void);<br>
-+#endif<br>
-+<br>
- #endif /* ! _PORT_LINUX_H */<br>
-diff --git a/platform.c b/platform.c<br>
-index 4fe8744ee..9cf818153 100644<br>
---- a/platform.c<br>
-+++ b/platform.c<br>
-@@ -44,6 +44,14 @@ platform_pre_listen(void)<br>
- #endif<br>
- }<br>
- <br>
-+void<br>
-+platform_post_listen(void)<br>
-+{<br>
-+#ifdef SYSTEMD_NOTIFY<br>
-+=C2=A0 =C2=A0 =C2=A0 ssh_systemd_notify_ready();<br>
-+#endif<br>
-+}<br>
-+<br>
- void<br>
- platform_pre_fork(void)<br>
- {<br>
-@@ -55,6 +63,9 @@ platform_pre_fork(void)<br>
- void<br>
- platform_pre_restart(void)<br>
- {<br>
-+#ifdef SYSTEMD_NOTIFY<br>
-+=C2=A0 =C2=A0 =C2=A0 ssh_systemd_notify_reload();<br>
-+#endif<br>
- #ifdef LINUX_OOM_ADJUST<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oom_adjust_restore();<br>
- #endif<br>
-diff --git a/platform.h b/platform.h<br>
-index 7fef8c983..5dec23276 100644<br>
---- a/platform.h<br>
-+++ b/platform.h<br>
-@@ -21,6 +21,7 @@<br>
- void platform_pre_listen(void);<br>
- void platform_pre_fork(void);<br>
- void platform_pre_restart(void);<br>
-+void platform_post_listen(void);<br>
- void platform_post_fork_parent(pid_t child_pid);<br>
- void platform_post_fork_child(void);<br>
- int=C2=A0 platform_privileged_uidswap(void);<br>
-diff --git a/sshd.c b/sshd.c<br>
-index b4f2b9742..865331b46 100644<br>
---- a/sshd.c<br>
-+++ b/sshd.c<br>
-@@ -2077,6 +2077,8 @@ main(int ac, char **av)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssh_signal(SIGTERM,=
 sigterm_handler);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssh_signal(SIGQUIT,=
 sigterm_handler);<br>
- <br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 platform_post_listen();<=
br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Write out the pi=
d file after the sigterm handler<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * is setup and the=
 listen sockets are bound<br>
--- <br>
-2.45.2<br>
-<br>
diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.=
sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivity/ope=
nssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patc=
h<br>
index 8763f30f4b..f424288e37 100644<br>
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-=
input-and-output-files-on-erro.patch<br>
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-=
input-and-output-files-on-erro.patch<br>
@@ -1,4 +1,4 @@<br>
-From f5a4dacc987ca548fc86577c2dba121c86da3c34 Mon Sep 17 00:00:00 2001<br>
+From 5cc897fe2effe549e1e280c2f606bce8b532b61e Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org" tar=
get=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
=C2=A0Date: Mon, 11 Sep 2023 09:55:21 +0100<br>
=C2=A0Subject: [PATCH] regress/banner.sh: log input and output files on err=
or<br>
@@ -37,12 +37,13 @@ See: <a href=3D"https://bugzilla.yoctoproject.org/show_=
bug.cgi?id=3D15178" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.y=
octoproject.org/show_bug.cgi?id=3D15178</a><br>
=C2=A0Upstream-Status: Denied [<a href=3D"https://github.com/openssh/openss=
h-portable/pull/437" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/openssh/openssh-portable/pull/437</a>]<br>
<br>
=C2=A0Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro=
.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
+Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries=
.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
=C2=A0---<br>
=C2=A0 regress/banner.sh | 4 +++-<br>
=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/regress/banner.sh b/regress/banner.sh<br>
-index a84feb5a..de84957a 100644<br>
+index a84feb5..de84957 100644<br>
=C2=A0--- a/regress/banner.sh<br>
=C2=A0+++ b/regress/banner.sh<br>
=C2=A0@@ -32,7 +32,9 @@ for s in 0 10 100 1000 10000 100000 ; do<br>
@@ -56,6 +57,3 @@ index a84feb5a..de84957a 100644<br>
=C2=A0 done<br>
<br>
=C2=A0 trace &quot;test suppress banner (-q)&quot;<br>
--- <br>
-2.34.1<br>
-<br>
diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-test-ex=
ec-use-the-absolute-path-in-the-SSH-e.patch b/meta/recipes-connectivity/ope=
nssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patc=
h<br>
new file mode 100644<br>
index 0000000000..b90cd2e69d<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-=
the-absolute-path-in-the-SSH-e.patch<br>
@@ -0,0 +1,35 @@<br>
+From fb762172fb678fe29327b667f8fe7380962a4540 Mon Sep 17 00:00:00 2001<br>
+From: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.io" targ=
et=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
+Date: Mon, 15 Jul 2024 18:43:08 +0100<br>
+Subject: [PATCH] regress/test-exec: use the absolute path in the SSH env<b=
r>
+<br>
+The SSHAGENT_BIN was changed in [1] to SSH_BIN but<br>
+the last one don&#39;t use the absolute path and consequently<br>
+the function increase_datafile_size can loops forever<br>
+if the binary not found.<br>
+<br>
+[1] <a href=3D"https://github.com/openssh/openssh-portable/commit/a68f80f2=
511f0e0c5cef737a8284cc2dfabad818" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/openssh/openssh-portable/commit/a68f80f2511f0e0c5cef737a8284=
cc2dfabad818</a><br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/openssh/openssh-=
portable/pull/510" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
openssh/openssh-portable/pull/510</a>]<br>
+<br>
+Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries=
.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
+---<br>
+ regress/test-exec.sh | 5 +++++<br>
+ 1 file changed, 5 insertions(+)<br>
+<br>
+diff --git a/regress/test-exec.sh b/regress/test-exec.sh<br>
+index 7afc2807..175f554b 100644<br>
+--- a/regress/test-exec.sh<br>
++++ b/regress/test-exec.sh<br>
+@@ -175,6 +175,11 @@ if [ &quot;x$TEST_SSH_OPENSSL&quot; !=3D &quot;x&quot=
; ]; then<br>
+ fi<br>
+ <br>
+ # Path to sshd must be absolute for rexec<br>
++case &quot;$SSH&quot; in<br>
++/*) ;;<br>
++*) SSH=3D`which $SSH` ;;<br>
++esac<br>
++<br>
+ case &quot;$SSHD&quot; in<br>
+ /*) ;;<br>
+ *) SSHD=3D`which $SSHD` ;;<br>
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch =
b/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch<br>
deleted file mode 100644<br>
index 3e7c707100..0000000000<br>
--- a/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch<br>
+++ /dev/null<br>
@@ -1,27 +0,0 @@<br>
-Description: fix signal handler race condition<br>
-Bug-Ubuntu: <a href=3D"https://bugs.launchpad.net/ubuntu/+source/openssh/+=
bug/2070497" rel=3D"noreferrer" target=3D"_blank">https://bugs.launchpad.ne=
t/ubuntu/+source/openssh/+bug/2070497</a><br>
-<br>
-CVE: CVE-2024-6387<br>
-<br>
-Upstream-Status: Backport<br>
-<a href=3D"https://git.launchpad.net/ubuntu/+source/openssh/commit/?h=3Dap=
plied/ubuntu/jammy-devel&amp;id=3Db059bcfa928df4ff2d103ae2e8f4e3136ee03efc"=
 rel=3D"noreferrer" target=3D"_blank">https://git.launchpad.net/ubuntu/+sou=
rce/openssh/commit/?h=3Dapplied/ubuntu/jammy-devel&amp;id=3Db059bcfa928df4f=
f2d103ae2e8f4e3136ee03efc</a><br>
-<br>
-Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries=
.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
-<br>
---- a/log.c<br>
-+++ b/log.c<br>
-@@ -452,12 +452,14 @@ void<br>
- sshsigdie(const char *file, const char *func, int line, int showfunc,<br>
-=C2=A0 =C2=A0 =C2=A0LogLevel level, const char *suffix, const char *fmt, .=
..)<br>
- {<br>
-+#if 0<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0va_list args;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0va_start(args, fmt);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sshlogv(file, func, line, showfunc, SYSLOG_LEVE=
L_FATAL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0suffix, fmt, args);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0va_end(args);<br>
-+#endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0_exit(1);<br>
- }<br>
- <br>
diff --git a/meta/recipes-connectivity/openssh/openssh/run-ptest b/meta/rec=
ipes-connectivity/openssh/openssh/run-ptest<br>
index b2244d725a..c9100f9f37 100755<br>
--- a/meta/recipes-connectivity/openssh/openssh/run-ptest<br>
+++ b/meta/recipes-connectivity/openssh/openssh/run-ptest<br>
@@ -1,5 +1,6 @@<br>
=C2=A0#!/bin/sh<br>
<br>
+export TEST_SSH_SSH=3Dssh<br>
=C2=A0export TEST_SHELL=3Dsh<br>
=C2=A0export SKIP_UNIT=3D1<br>
<br>
diff --git a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.=
7p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.7p1.bb</a> b/meta/re=
cipes-connectivity/openssh/<a href=3D"http://openssh_9.8p1.bb" rel=3D"noref=
errer" target=3D"_blank">openssh_9.8p1.bb</a><br>
similarity index 96%<br>
rename from meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.7=
p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.7p1.bb</a><br>
rename to meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.8p1=
.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.8p1.bb</a><br>
index 4680d12be5..9554b4783f 100644<br>
--- a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.7p1.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssh_9.7p1.bb</a><br>
+++ b/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.8p1.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssh_9.8p1.bb</a><br>
@@ -23,11 +23,11 @@ SRC_URI =3D &quot;<a href=3D"http://ftp.openbsd.org/pub=
/OpenBSD/OpenSSH/portable/openssh-$%7BPV%7D.tar" rel=3D"noreferrer" target=
=3D"_blank">http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${P=
V}.tar</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://volatiles.99_sshd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sshd_check_keys \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Cast-to-sockaddr-in-s=
ystemd-interface.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-regress-banner.sh-log=
-input-and-output-files-on-erro.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-notify-systemd-on-lis=
ten-and-reload.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-6387.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-regress-test-exec-use=
-the-absolute-path-in-the-SSH-e.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;490426f766d82a2763fcacd8d83ea3d70798750c7bd2a=
ff2e57dc5660f773ffd&quot;<br>
+SRC_URI[sha256sum] =3D &quot;dd8bd002a379b5d499dfb050dd1fa9af8029e80461f4b=
b6c523c49973f5a39f3&quot;<br>
<br>
=C2=A0CVE_STATUS[CVE-2007-2768] =3D &quot;not-applicable-config: This CVE i=
s specific to OpenSSH with the pam opie which we don&#39;t build/use here.&=
quot;<br>
<br>
@@ -195,7 +195,7 @@ ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}=
-sftp ${PN}-misc ${PN}-sftp-server&quot;<br>
=C2=A0FILES:${PN}-scp =3D &quot;${bindir}/scp.${BPN}&quot;<br>
=C2=A0FILES:${PN}-ssh =3D &quot;${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_=
config&quot;<br>
-FILES:${PN}-sshd =3D &quot;${sbindir}/sshd ${sysconfdir}/init.d/sshd ${sys=
temd_system_unitdir}&quot;<br>
+FILES:${PN}-sshd =3D &quot;${sbindir}/sshd ${libexecdir}/sshd-session ${sy=
sconfdir}/init.d/sshd ${systemd_system_unitdir}&quot;<br>
=C2=A0FILES:${PN}-sshd +=3D &quot;${sysconfdir}/ssh/moduli ${sysconfdir}/ss=
h/sshd_config ${sysconfdir}/ssh/sshd_config_readonly ${sysconfdir}/default/=
volatiles/99_sshd ${sysconfdir}/pam.d/sshd&quot;<br>
=C2=A0FILES:${PN}-sshd +=3D &quot;${libexecdir}/${BPN}/sshd_check_keys&quot=
;<br>
=C2=A0FILES:${PN}-sftp =3D &quot;${bindir}/sftp&quot;<br>
-- <br>
2.45.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#202231): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/202231" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/202231</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107420537/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/107420537/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div>

--000000000000e13e07061dfef73c--

