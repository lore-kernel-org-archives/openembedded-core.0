Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4A3C3DA4B
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 08:51:53 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web11.10682.1721206307414036375
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 01:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WwDgsIAg;
 spf=pass (domain: gmail.com, ip: 209.85.222.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-8100ff1cec5so368855241.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 01:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721206306; x=1721811106; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n+meoddPmsMzQ3HET7aE81s2R3vqc+5+whapZP9LpT8=;
        b=WwDgsIAgga4/ahoeCcJtlHdY+alsYdY2qHdaRedixJ23OQkcSIPifeTMQGzaI2wS+B
         RF0CfQnW0rgj8zr/wBfvb6S2+lWtODm7M5+AvBELL6Bdh4lrB7YaagyPlyzirjkUJpsg
         kUWYG757GqkZ5PUnP6aKGRrmB4J3kmkYj4RMZRWLTJuEvqy9kkS3gB6/9o5EcB2P1Lc8
         /nsuow/vt5gAGZqzOINFCBW+en0dA8qzFZyQMe5frvu9DTlRLQtVdqsjWd6QuQmKSIv3
         pD0WwThb5gGpn/wM5uDvdSYyNU5xgc3zirMOmVXsbXZvZ0ZwNpzW94BcgQRJXsnKb8w4
         c5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721206306; x=1721811106;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+meoddPmsMzQ3HET7aE81s2R3vqc+5+whapZP9LpT8=;
        b=Yhn6UUhwLon/uAQAApDsZDb45E7YQbHBgqNViVzWlg71JkuFYpyuHC4JE1xCyYFPGO
         sEaMP8LCcUpsJoimFtwLr+vnYvku6fVIRfjxUYEnhwEGCBIz2LXDfJJx472JbXpoU7uX
         tbnEyTYRpPTNEB6OeW7/CeJxA7g6m/R6HGS7j7p6w/VSWO8iNASbzDU1nJBF3IOzcc68
         SH4C2iXwIlp8WAvlS9efWOHDmuDMZG/Xs1IipITxo9g8Mql58sJIXuuYzCuzUKmoynbA
         Ag/VTzLFx613aGObTbX82oON0K3VyBPCjv/9tSjA7mXPpKTGVt2H6Qk1Wx8AFKvPjWNH
         3qFA==
X-Gm-Message-State: AOJu0YxdK/nzVHM4VV3R3dYghJYnEG3fT5Y2YzdAryrKWnzzd2MApw0O
	JwrviV7VOFtik8sjSfHw8OPVRVEAbmEBNUDE4oJpOMbh/VUTutuGvwHDFSU/eZEE9CDm9cbbqqv
	66sVGoKkyhYYaZvFKakkqfTU1V+CknIdb
X-Google-Smtp-Source: AGHT+IENB0CHv06nY27EjwaDvI7yDlf5hiM4M1kv9QeAZ2Yn6K3wEEPxnbW4Xqr7d6LQcU89kOis9KGYNlSuZ0USYTQ=
X-Received: by 2002:a05:6102:1524:b0:48f:df47:a4a5 with SMTP id
 ada2fe7eead31-491597a6557mr1459690137.11.1721206306069; Wed, 17 Jul 2024
 01:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240716141639.1564355-1-jose.quaresma@foundries.io>
 <20240716141639.1564355-3-jose.quaresma@foundries.io> <20240717075700774bd475@mail.local>
In-Reply-To: <20240717075700774bd475@mail.local>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 17 Jul 2024 09:51:35 +0100
Message-ID: <CANPvuRm5m8EdptzGb1EewxB_yFoVtoax0iSqJX2=TQvQQimg+g@mail.gmail.com>
Subject: Re: [OE-core][PATCH v5 3/3] openssh: upgrade 9.7p1 -> 9.8p1
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000075642d061d6d922d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 08:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202146

--00000000000075642d061d6d922d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexandre Belloni <alexandre.belloni@bootlin.com> escreveu (quarta,
17/07/2024 =C3=A0(s) 08:57):

> Hello,
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6812/st=
eps/13/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6636/st=
eps/12/logs/stdio
>
> This causes libssh2 ptest failures:
>
> https://autobuilder.yocto.io/pub/non-release/20240716-73/testresults/qemu=
x86-64-ptest/libssh2.log
>
> START: ptest-runner
> 2024-07-16T23:20
> PASS: mansyntax.sh
> PASS: test_simple
> FAIL: test_sshd.test
> DURATION: 14
>

I'll have to test libssh2 to see what's happening.

Thanks for the feedback.

Jose



>
>
> On 16/07/2024 15:16:39+0100, Jose Quaresma wrote:
> > - drop the CVE-2024-6387
> > - drop the backported systemd notify
> > - backported fix for musl build
> > - submited fix for ptest regression
> > - sshd now had the sshd-session
> >
> > Release notes at https://www.openssh.com/txt/release-9.8
> >
> > Security
> > =3D=3D=3D=3D=3D=3D=3D=3D
> >
> > This release contains fixes for two security problems, one critical
> > and one minor.
> >
> > 1) Race condition in sshd(8)
> >
> > A critical vulnerability in sshd(8) was present in Portable OpenSSH
> > versions between 8.5p1 and 9.7p1 (inclusive) that may allow arbitrary
> > code execution with root privileges.
> >
> > Successful exploitation has been demonstrated on 32-bit Linux/glibc
> > systems with ASLR. Under lab conditions, the attack requires on
> > average 6-8 hours of continuous connections up to the maximum the
> > server will accept. Exploitation on 64-bit systems is believed to be
> > possible but has not been demonstrated at this time. It's likely that
> > these attacks will be improved upon.
> >
> > Exploitation on non-glibc systems is conceivable but has not been
> > examined. Systems that lack ASLR or users of downstream Linux
> > distributions that have modified OpenSSH to disable per-connection
> > ASLR re-randomisation (yes - this is a thing, no - we don't
> > understand why) may potentially have an easier path to exploitation.
> > OpenBSD is not vulnerable.
> >
> > We thank the Qualys Security Advisory Team for discovering, reporting
> > and demonstrating exploitability of this problem, and for providing
> > detailed feedback on additional mitigation measures.
> >
> > 2) Logic error in ssh(1) ObscureKeystrokeTiming
> >
> > In OpenSSH version 9.5 through 9.7 (inclusive), when connected to an
> > OpenSSH server version 9.5 or later, a logic error in the ssh(1)
> > ObscureKeystrokeTiming feature (on by default) rendered this feature
> > ineffective - a passive observer could still detect which network
> > packets contained real keystrokes when the countermeasure was active
> > because both fake and real keystroke packets were being sent
> > unconditionally.
> >
> > This bug was found by Philippos Giavridis and also independently by
> > Jacky Wei En Kung, Daniel Hugenroth and Alastair Beresford of the
> > University of Cambridge Computer Lab.
> >
> > Worse, the unconditional sending of both fake and real keystroke
> > packets broke another long-standing timing attack mitigation. Since
> > OpenSSH 2.9.9 sshd(8) has sent fake keystoke echo packets for
> > traffic received on TTYs in echo-off mode, such as when entering a
> > password into su(8) or sudo(8). This bug rendered these fake
> > keystroke echoes ineffective and could allow a passive observer of
> > a SSH session to once again detect when echo was off and obtain
> > fairly limited timing information about keystrokes in this situation
> > (20ms granularity by default).
> >
> > This additional implication of the bug was identified by Jacky Wei
> > En Kung, Daniel Hugenroth and Alastair Beresford and we thank them
> > for their detailed analysis.
> >
> > This bug does not affect connections when ObscureKeystrokeTiming
> > was disabled or sessions where no TTY was requested.
> >
> > Future deprecation notice
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> >
> > OpenSSH plans to remove support for the DSA signature algorithm in
> > early 2025. This release disables DSA by default at compile time.
> >
> > DSA, as specified in the SSHv2 protocol, is inherently weak - being
> > limited to a 160 bit private key and use of the SHA1 digest. Its
> > estimated security level is only 80 bits symmetric equivalent.
> >
> > OpenSSH has disabled DSA keys by default since 2015 but has retained
> > run-time optional support for them. DSA was the only mandatory-to-
> > implement algorithm in the SSHv2 RFCs, mostly because alternative
> > algorithms were encumbered by patents when the SSHv2 protocol was
> > specified.
> >
> > This has not been the case for decades at this point and better
> > algorithms are well supported by all actively-maintained SSH
> > implementations. We do not consider the costs of maintaining DSA
> > in OpenSSH to be justified and hope that removing it from OpenSSH
> > can accelerate its wider deprecation in supporting cryptography
> > libraries.
> >
> > This release, and its deactivation of DSA by default at compile-time,
> > marks the second step in our timeline to finally deprecate DSA. The
> > final step of removing DSA support entirely is planned for the first
> > OpenSSH release of 2025.
> >
> > DSA support may be re-enabled in OpenBSD by setting "DSAKEY=3Dyes"
> > in Makefile.inc. To enable DSA support in portable OpenSSH, pass
> > the "--enable-dsa-keys" option to configure.
> >
> > Potentially-incompatible changes
> > --------------------------------
> >
> >  * all: as mentioned above, the DSA signature algorithm is now
> >    disabled at compile time.
> >
> >  * sshd(8): the server will now block client addresses that
> >    repeatedly fail authentication, repeatedly connect without ever
> >    completing authentication or that crash the server. See the
> >    discussion of PerSourcePenalties below for more information.
> >    Operators of servers that accept connections from many users, or
> >    servers that accept connections from addresses behind NAT or
> >    proxies may need to consider these settings.
> >
> >  * sshd(8): the server has been split into a listener binary, sshd(8),
> >    and a per-session binary "sshd-session". This allows for a much
> >    smaller listener binary, as it no longer needs to support the SSH
> >    protocol. As part of this work, support for disabling privilege
> >    separation (which previously required code changes to disable) and
> >    disabling re-execution of sshd(8) has been removed. Further
> >    separation of sshd-session into additional, minimal binaries is
> >    planned for the future.
> >
> >  * sshd(8): several log messages have changed. In particular, some
> >    log messages will be tagged with as originating from a process
> >    named "sshd-session" rather than "sshd".
> >
> >  * ssh-keyscan(1): this tool previously emitted comment lines
> >    containing the hostname and SSH protocol banner to standard error.
> >    This release now emits them to standard output, but adds a new
> >    "-q" flag to silence them altogether.
> >
> >  * sshd(8): (portable OpenSSH only) sshd will no longer use argv[0]
> >    as the PAM service name. A new "PAMServiceName" sshd_config(5)
> >    directive allows selecting the service name at runtime. This
> >    defaults to "sshd". bz2101
> >
> >  * (portable OpenSSH only) Automatically-generated files, such as
> >    configure, config.h.in, etc will now be checked in to the portable
> >    OpenSSH git release branch (e.g. V_9_8). This should ensure that
> >    the contents of the signed release branch exactly match the
> >    contents of the signed release tarball.
> >
> > Changes since OpenSSH 9.7
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> >
> > This release contains mostly bugfixes.
> >
> > New features
> > ------------
> >
> >  * sshd(8): as described above, sshd(8) will now penalise client
> >    addresses that, for various reasons, do not successfully complete
> >    authentication. This feature is controlled by a new sshd_config(5)
> >    PerSourcePenalties option and is on by default.
> >
> >    sshd(8) will now identify situations where the session did not
> >    authenticate as expected. These conditions include when the client
> >    repeatedly attempted authentication unsucessfully (possibly
> >    indicating an attack against one or more accounts, e.g. password
> >    guessing), or when client behaviour caused sshd to crash (possibly
> >    indicating attempts to exploit bugs in sshd).
> >
> >    When such a condition is observed, sshd will record a penalty of
> >    some duration (e.g. 30 seconds) against the client's address. If
> >    this time is above a minimum configurable threshold, then all
> >    connections from the client address will be refused (along with any
> >    others in the same PerSourceNetBlockSize CIDR range) until the
> >    penalty expire.
> >
> >    Repeated offenses by the same client address will accrue greater
> >    penalties, up to a configurable maximum. Address ranges may be
> >    fully exempted from penalties, e.g. to guarantee access from a set
> >    of trusted management addresses, using the new sshd_config(5)
> >    PerSourcePenaltyExemptList option.
> >
> >    We hope these options will make it significantly more difficult for
> >    attackers to find accounts with weak/guessable passwords or exploit
> >    bugs in sshd(8) itself. This option is enabled by default.
> >
> >  * ssh(8): allow the HostkeyAlgorithms directive to disable the
> >    implicit fallback from certificate host key to plain host keys.
> >
> > Bugfixes
> > --------
> >
> >  * misc: fix a number of inaccuracies in the PROTOCOL.*
> >    documentation files. GHPR430 GHPR487
> >
> >  * all: switch to strtonum(3) for more robust integer parsing in most
> >    places.
> >
> >  * ssh(1), sshd(8): correctly restore sigprocmask around ppoll()
> >
> >  * ssh-keysign(8): stricter validation of messaging socket fd GHPR492
> >
> >  * sftp(1): flush stdout after writing "sftp>" prompt when not using
> >    editline. GHPR480
> >
> >  * sftp-server(8): fix home-directory extension implementation, it
> >    previously always returned the current user's home directory
> >    contrary to the spec. GHPR477
> >
> >  * ssh-keyscan(1): do not close stdin to prevent error messages when
> >    stdin is read multiple times. E.g.
> >    echo localhost | ssh-keyscan -f - -f -
> >
> >  * regression tests: fix rekey test that was testing the same KEX
> >    algorithm repeatedly instead of testing all of them. bz3692
> >
> >  * ssh_config(5), sshd_config(5): clarify the KEXAlgorithms directive
> >    documentation, especially around what is supported vs available.
> >    bz3701.
> >
> > Portability
> > -----------
> >
> >  * sshd(8): expose SSH_AUTH_INFO_0 always to PAM auth modules
> >    unconditionally. The previous behaviour was to expose it only when
> >    particular authentication methods were in use.
> >
> >  * build: fix OpenSSL ED25519 support detection. An incorrect function
> >    signature in configure.ac previously prevented enabling the recently
> >    added support for ED25519 private keys in PEM PKCS8 format.
> >
> >  * ssh(1), ssh-agent(8): allow the presence of the WAYLAND_DISPLAY
> >    environment variable to enable SSH_ASKPASS, similarly to the X11
> >    DISPLAY environment variable. GHPR479
> >
> >  * build: improve detection of the -fzero-call-used-regs compiler
> >    flag. bz3673.
> >
> >  * build: relax OpenSSL version check to accept all OpenSSL 3.x
> >    versions.
> >
> >  * sshd(8): add support for notifying systemd on server listen and
> >    reload, using a standalone implementation that doesn't depend on
> >    libsystemd. bz2641
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >
> > v2:
> >  - fix musl build
> >  - fix sshd-session packing on openssh-sshd
> >  - rebase on top of the CVE-2024-6387 fix sent
> >
> > v3:
> >  - fix the ptest fail
> >  - update upstream status of the systemd sd-notify patch
> >
> > v4:
> >  - split update of Upstream-Status in new patches in the serie
> >  - submit the the ptest fix upstream
> >
> > v5:
> >  - backport upstream fix for musl build
> >  - drop the backported systemd notify
> >
> >  ...ast-to-sockaddr-in-systemd-interface.patch |  30 +++
> >  ...-notify-systemd-on-listen-and-reload.patch | 225 ------------------
> >  ...h-log-input-and-output-files-on-erro.patch |   8 +-
> >  ...c-use-the-absolute-path-in-the-SSH-e.patch |  35 +++
> >  .../openssh/openssh/CVE-2024-6387.patch       |  27 ---
> >  .../openssh/openssh/run-ptest                 |   1 +
> >  .../{openssh_9.7p1.bb =3D> openssh_9.8p1.bb}    |   8 +-
> >  7 files changed, 73 insertions(+), 261 deletions(-)
> >  create mode 100644
> meta/recipes-connectivity/openssh/openssh/0001-Cast-to-sockaddr-in-system=
d-interface.patch
> >  delete mode 100644
> meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-listen-a=
nd-reload.patch
> >  create mode 100644
> meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-the-=
absolute-path-in-the-SSH-e.patch
> >  delete mode 100644
> meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch
> >  rename meta/recipes-connectivity/openssh/{openssh_9.7p1.bb =3D>
> openssh_9.8p1.bb} (96%)
> >
> > diff --git
> a/meta/recipes-connectivity/openssh/openssh/0001-Cast-to-sockaddr-in-syst=
emd-interface.patch
> b/meta/recipes-connectivity/openssh/openssh/0001-Cast-to-sockaddr-in-syst=
emd-interface.patch
> > new file mode 100644
> > index 0000000000..c41642ae10
> > --- /dev/null
> > +++
> b/meta/recipes-connectivity/openssh/openssh/0001-Cast-to-sockaddr-in-syst=
emd-interface.patch
> > @@ -0,0 +1,30 @@
> > +From a3068c6edb81c0b0b9a2ced82e8632c79314e409 Mon Sep 17 00:00:00 2001
> > +From: Darren Tucker <dtucker@dtucker.net>
> > +Date: Sun, 7 Jul 2024 18:46:19 +1000
> > +Subject: [PATCH] Cast to sockaddr * in systemd interface.
> > +
> > +Fixes build with musl libx.  bz#3707.
> > +
> > +Upstream-Status: Backport [
> https://github.com/openssh/openssh-portable/commit/8b664df75966e5aed8dabe=
a00b8838303d3488b8
> ]
> > +
> > +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > +---
> > + openbsd-compat/port-linux.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/openbsd-compat/port-linux.c b/openbsd-compat/port-linux.c
> > +index 4c024c6d2..8adfec5a7 100644
> > +--- a/openbsd-compat/port-linux.c
> > ++++ b/openbsd-compat/port-linux.c
> > +@@ -366,7 +366,7 @@ ssh_systemd_notify(const char *fmt, ...)
> > +             error_f("socket \"%s\": %s", path, strerror(errno));
> > +             goto out;
> > +     }
> > +-    if (connect(fd, &addr, sizeof(addr)) !=3D 0) {
> > ++    if (connect(fd, (struct sockaddr *)&addr, sizeof(addr)) !=3D 0) {
> > +             error_f("socket \"%s\" connect: %s", path,
> strerror(errno));
> > +             goto out;
> > +     }
> > +--
> > +2.45.2
> > +
> > diff --git
> a/meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-listen=
-and-reload.patch
> b/meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-listen=
-and-reload.patch
> > deleted file mode 100644
> > index 4925c969fe..0000000000
> > ---
> a/meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-listen=
-and-reload.patch
> > +++ /dev/null
> > @@ -1,225 +0,0 @@
> > -From fc73e2405a8ca928465580b74a4d76112919367b Mon Sep 17 00:00:00 2001
> > -From: Damien Miller <djm@mindrot.org>
> > -Date: Wed, 3 Apr 2024 14:40:32 +1100
> > -Subject: [PATCH] notify systemd on listen and reload
> > -
> > -Standalone implementation that does not depend on libsystemd.
> > -With assistance from Luca Boccassi, and feedback/testing from Colin
> > -Watson. bz2641
> > -
> > -Upstream-Status: Backport [
> https://github.com/openssh/openssh-portable/commit/08f579231cd38a1c657aaa=
6ddeb8ab57a1fd4f5c
> ]
> > -
> > -Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ----
> > - configure.ac                |  1 +
> > - openbsd-compat/port-linux.c | 97 ++++++++++++++++++++++++++++++++++++=
-
> > - openbsd-compat/port-linux.h |  5 ++
> > - platform.c                  | 11 +++++
> > - platform.h                  |  1 +
> > - sshd.c                      |  2 +
> > - 6 files changed, 115 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/configure.ac b/configure.ac
> > -index 82e8bb7c1..854f92b5b 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -915,6 +915,7 @@ int main(void) { if
> (NSVersionOfRunTimeLibrary("System") >=3D (60 << 16))
> > -     AC_DEFINE([_PATH_BTMP], ["/var/log/btmp"], [log for bad login
> attempts])
> > -     AC_DEFINE([USE_BTMP])
> > -     AC_DEFINE([LINUX_OOM_ADJUST], [1], [Adjust Linux out-of-memory
> killer])
> > -+    AC_DEFINE([SYSTEMD_NOTIFY], [1], [Have sshd notify systemd on
> start/reload])
> > -     inet6_default_4in6=3Dyes
> > -     case `uname -r` in
> > -     1.*|2.0.*)
> > -diff --git a/openbsd-compat/port-linux.c b/openbsd-compat/port-linux.c
> > -index 0457e28d0..df7290246 100644
> > ---- a/openbsd-compat/port-linux.c
> > -+++ b/openbsd-compat/port-linux.c
> > -@@ -21,16 +21,23 @@
> > -
> > - #include "includes.h"
> > -
> > --#if defined(WITH_SELINUX) || defined(LINUX_OOM_ADJUST)
> > -+#if defined(WITH_SELINUX) || defined(LINUX_OOM_ADJUST) || \
> > -+    defined(SYSTEMD_NOTIFY)
> > -+#include <sys/socket.h>
> > -+#include <sys/un.h>
> > -+
> > - #include <errno.h>
> > -+#include <inttypes.h>
> > - #include <stdarg.h>
> > - #include <string.h>
> > - #include <stdio.h>
> > - #include <stdlib.h>
> > -+#include <time.h>
> > -
> > - #include "log.h"
> > - #include "xmalloc.h"
> > - #include "port-linux.h"
> > -+#include "misc.h"
> > -
> > - #ifdef WITH_SELINUX
> > - #include <selinux/selinux.h>
> > -@@ -310,4 +317,90 @@ oom_adjust_restore(void)
> > -     return;
> > - }
> > - #endif /* LINUX_OOM_ADJUST */
> > --#endif /* WITH_SELINUX || LINUX_OOM_ADJUST */
> > -+
> > -+#ifdef SYSTEMD_NOTIFY
> > -+
> > -+static void ssh_systemd_notify(const char *, ...)
> > -+    __attribute__((__format__ (printf, 1, 2)))
> __attribute__((__nonnull__ (1)));
> > -+
> > -+static void
> > -+ssh_systemd_notify(const char *fmt, ...)
> > -+{
> > -+    char *s =3D NULL;
> > -+    const char *path;
> > -+    struct stat sb;
> > -+    struct sockaddr_un addr;
> > -+    int fd =3D -1;
> > -+    va_list ap;
> > -+
> > -+    if ((path =3D getenv("NOTIFY_SOCKET")) =3D=3D NULL || strlen(path=
) =3D=3D 0)
> > -+            return;
> > -+
> > -+    va_start(ap, fmt);
> > -+    xvasprintf(&s, fmt, ap);
> > -+    va_end(ap);
> > -+
> > -+    /* Only AF_UNIX is supported, with path or abstract sockets */
> > -+    if (path[0] !=3D '/' && path[0] !=3D '@') {
> > -+            error_f("socket \"%s\" is not compatible with AF_UNIX",
> path);
> > -+            goto out;
> > -+    }
> > -+
> > -+    if (path[0] =3D=3D '/' && stat(path, &sb) !=3D 0) {
> > -+            error_f("socket \"%s\" stat: %s", path, strerror(errno));
> > -+            goto out;
> > -+    }
> > -+
> > -+    memset(&addr, 0, sizeof(addr));
> > -+    addr.sun_family =3D AF_UNIX;
> > -+    if (strlcpy(addr.sun_path, path,
> > -+        sizeof(addr.sun_path)) >=3D sizeof(addr.sun_path)) {
> > -+            error_f("socket path \"%s\" too long", path);
> > -+            goto out;
> > -+    }
> > -+    /* Support for abstract socket */
> > -+    if (addr.sun_path[0] =3D=3D '@')
> > -+            addr.sun_path[0] =3D 0;
> > -+    if ((fd =3D socket(PF_UNIX, SOCK_DGRAM, 0)) =3D=3D -1) {
> > -+            error_f("socket \"%s\": %s", path, strerror(errno));
> > -+            goto out;
> > -+    }
> > -+    if (connect(fd, &addr, sizeof(addr)) !=3D 0) {
> > -+            error_f("socket \"%s\" connect: %s", path,
> strerror(errno));
> > -+            goto out;
> > -+    }
> > -+    if (write(fd, s, strlen(s)) !=3D (ssize_t)strlen(s)) {
> > -+            error_f("socket \"%s\" write: %s", path, strerror(errno))=
;
> > -+            goto out;
> > -+    }
> > -+    debug_f("socket \"%s\" notified %s", path, s);
> > -+ out:
> > -+    if (fd !=3D -1)
> > -+            close(fd);
> > -+    free(s);
> > -+}
> > -+
> > -+void
> > -+ssh_systemd_notify_ready(void)
> > -+{
> > -+    ssh_systemd_notify("READY=3D1");
> > -+}
> > -+
> > -+void
> > -+ssh_systemd_notify_reload(void)
> > -+{
> > -+    struct timespec now;
> > -+
> > -+    monotime_ts(&now);
> > -+    if (now.tv_sec < 0 || now.tv_nsec < 0) {
> > -+            error_f("monotime returned negative value");
> > -+            ssh_systemd_notify("RELOADING=3D1");
> > -+    } else {
> > -+            ssh_systemd_notify("RELOADING=3D1\nMONOTONIC_USEC=3D%llu"=
,
> > -+                ((uint64_t)now.tv_sec * 1000000ULL) +
> > -+                ((uint64_t)now.tv_nsec / 1000ULL));
> > -+    }
> > -+}
> > -+#endif /* SYSTEMD_NOTIFY */
> > -+
> > -+#endif /* WITH_SELINUX || LINUX_OOM_ADJUST || SYSTEMD_NOTIFY */
> > -diff --git a/openbsd-compat/port-linux.h b/openbsd-compat/port-linux.h
> > -index 3c22a854d..14064f87d 100644
> > ---- a/openbsd-compat/port-linux.h
> > -+++ b/openbsd-compat/port-linux.h
> > -@@ -30,4 +30,9 @@ void oom_adjust_restore(void);
> > - void oom_adjust_setup(void);
> > - #endif
> > -
> > -+#ifdef SYSTEMD_NOTIFY
> > -+void ssh_systemd_notify_ready(void);
> > -+void ssh_systemd_notify_reload(void);
> > -+#endif
> > -+
> > - #endif /* ! _PORT_LINUX_H */
> > -diff --git a/platform.c b/platform.c
> > -index 4fe8744ee..9cf818153 100644
> > ---- a/platform.c
> > -+++ b/platform.c
> > -@@ -44,6 +44,14 @@ platform_pre_listen(void)
> > - #endif
> > - }
> > -
> > -+void
> > -+platform_post_listen(void)
> > -+{
> > -+#ifdef SYSTEMD_NOTIFY
> > -+    ssh_systemd_notify_ready();
> > -+#endif
> > -+}
> > -+
> > - void
> > - platform_pre_fork(void)
> > - {
> > -@@ -55,6 +63,9 @@ platform_pre_fork(void)
> > - void
> > - platform_pre_restart(void)
> > - {
> > -+#ifdef SYSTEMD_NOTIFY
> > -+    ssh_systemd_notify_reload();
> > -+#endif
> > - #ifdef LINUX_OOM_ADJUST
> > -     oom_adjust_restore();
> > - #endif
> > -diff --git a/platform.h b/platform.h
> > -index 7fef8c983..5dec23276 100644
> > ---- a/platform.h
> > -+++ b/platform.h
> > -@@ -21,6 +21,7 @@
> > - void platform_pre_listen(void);
> > - void platform_pre_fork(void);
> > - void platform_pre_restart(void);
> > -+void platform_post_listen(void);
> > - void platform_post_fork_parent(pid_t child_pid);
> > - void platform_post_fork_child(void);
> > - int  platform_privileged_uidswap(void);
> > -diff --git a/sshd.c b/sshd.c
> > -index b4f2b9742..865331b46 100644
> > ---- a/sshd.c
> > -+++ b/sshd.c
> > -@@ -2077,6 +2077,8 @@ main(int ac, char **av)
> > -             ssh_signal(SIGTERM, sigterm_handler);
> > -             ssh_signal(SIGQUIT, sigterm_handler);
> > -
> > -+            platform_post_listen();
> > -+
> > -             /*
> > -              * Write out the pid file after the sigterm handler
> > -              * is setup and the listen sockets are bound
> > ---
> > -2.45.2
> > -
> > diff --git
> a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-in=
put-and-output-files-on-erro.patch
> b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-in=
put-and-output-files-on-erro.patch
> > index 8763f30f4b..f424288e37 100644
> > ---
> a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-in=
put-and-output-files-on-erro.patch
> > +++
> b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-in=
put-and-output-files-on-erro.patch
> > @@ -1,4 +1,4 @@
> > -From f5a4dacc987ca548fc86577c2dba121c86da3c34 Mon Sep 17 00:00:00 2001
> > +From 5cc897fe2effe549e1e280c2f606bce8b532b61e Mon Sep 17 00:00:00 2001
> >  From: Mikko Rapeli <mikko.rapeli@linaro.org>
> >  Date: Mon, 11 Sep 2023 09:55:21 +0100
> >  Subject: [PATCH] regress/banner.sh: log input and output files on erro=
r
> > @@ -37,12 +37,13 @@ See:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15178
> >  Upstream-Status: Denied [
> https://github.com/openssh/openssh-portable/pull/437]
> >
> >  Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> >  ---
> >   regress/banner.sh | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> >  diff --git a/regress/banner.sh b/regress/banner.sh
> > -index a84feb5a..de84957a 100644
> > +index a84feb5..de84957 100644
> >  --- a/regress/banner.sh
> >  +++ b/regress/banner.sh
> >  @@ -32,7 +32,9 @@ for s in 0 10 100 1000 10000 100000 ; do
> > @@ -56,6 +57,3 @@ index a84feb5a..de84957a 100644
> >   done
> >
> >   trace "test suppress banner (-q)"
> > ---
> > -2.34.1
> > -
> > diff --git
> a/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-th=
e-absolute-path-in-the-SSH-e.patch
> b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-th=
e-absolute-path-in-the-SSH-e.patch
> > new file mode 100644
> > index 0000000000..b90cd2e69d
> > --- /dev/null
> > +++
> b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec-use-th=
e-absolute-path-in-the-SSH-e.patch
> > @@ -0,0 +1,35 @@
> > +From fb762172fb678fe29327b667f8fe7380962a4540 Mon Sep 17 00:00:00 2001
> > +From: Jose Quaresma <jose.quaresma@foundries.io>
> > +Date: Mon, 15 Jul 2024 18:43:08 +0100
> > +Subject: [PATCH] regress/test-exec: use the absolute path in the SSH e=
nv
> > +
> > +The SSHAGENT_BIN was changed in [1] to SSH_BIN but
> > +the last one don't use the absolute path and consequently
> > +the function increase_datafile_size can loops forever
> > +if the binary not found.
> > +
> > +[1]
> https://github.com/openssh/openssh-portable/commit/a68f80f2511f0e0c5cef73=
7a8284cc2dfabad818
> > +
> > +Upstream-Status: Submitted [
> https://github.com/openssh/openssh-portable/pull/510]
> > +
> > +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > +---
> > + regress/test-exec.sh | 5 +++++
> > + 1 file changed, 5 insertions(+)
> > +
> > +diff --git a/regress/test-exec.sh b/regress/test-exec.sh
> > +index 7afc2807..175f554b 100644
> > +--- a/regress/test-exec.sh
> > ++++ b/regress/test-exec.sh
> > +@@ -175,6 +175,11 @@ if [ "x$TEST_SSH_OPENSSL" !=3D "x" ]; then
> > + fi
> > +
> > + # Path to sshd must be absolute for rexec
> > ++case "$SSH" in
> > ++/*) ;;
> > ++*) SSH=3D`which $SSH` ;;
> > ++esac
> > ++
> > + case "$SSHD" in
> > + /*) ;;
> > + *) SSHD=3D`which $SSHD` ;;
> > diff --git
> a/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch
> b/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch
> > deleted file mode 100644
> > index 3e7c707100..0000000000
> > --- a/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch
> > +++ /dev/null
> > @@ -1,27 +0,0 @@
> > -Description: fix signal handler race condition
> > -Bug-Ubuntu:
> https://bugs.launchpad.net/ubuntu/+source/openssh/+bug/2070497
> > -
> > -CVE: CVE-2024-6387
> > -
> > -Upstream-Status: Backport
> > -
> https://git.launchpad.net/ubuntu/+source/openssh/commit/?h=3Dapplied/ubun=
tu/jammy-devel&id=3Db059bcfa928df4ff2d103ae2e8f4e3136ee03efc
> > -
> > -Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > -
> > ---- a/log.c
> > -+++ b/log.c
> > -@@ -452,12 +452,14 @@ void
> > - sshsigdie(const char *file, const char *func, int line, int showfunc,
> > -     LogLevel level, const char *suffix, const char *fmt, ...)
> > - {
> > -+#if 0
> > -     va_list args;
> > -
> > -     va_start(args, fmt);
> > -     sshlogv(file, func, line, showfunc, SYSLOG_LEVEL_FATAL,
> > -         suffix, fmt, args);
> > -     va_end(args);
> > -+#endif
> > -     _exit(1);
> > - }
> > -
> > diff --git a/meta/recipes-connectivity/openssh/openssh/run-ptest
> b/meta/recipes-connectivity/openssh/openssh/run-ptest
> > index b2244d725a..c9100f9f37 100755
> > --- a/meta/recipes-connectivity/openssh/openssh/run-ptest
> > +++ b/meta/recipes-connectivity/openssh/openssh/run-ptest
> > @@ -1,5 +1,6 @@
> >  #!/bin/sh
> >
> > +export TEST_SSH_SSH=3Dssh
> >  export TEST_SHELL=3Dsh
> >  export SKIP_UNIT=3D1
> >
> > diff --git a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
> b/meta/recipes-connectivity/openssh/openssh_9.8p1.bb
> > similarity index 96%
> > rename from meta/recipes-connectivity/openssh/openssh_9.7p1.bb
> > rename to meta/recipes-connectivity/openssh/openssh_9.8p1.bb
> > index 4680d12be5..9554b4783f 100644
> > --- a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
> > +++ b/meta/recipes-connectivity/openssh/openssh_9.8p1.bb
> > @@ -23,11 +23,11 @@ SRC_URI =3D "
> http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
> >             file://volatiles.99_sshd \
> >             file://run-ptest \
> >             file://sshd_check_keys \
> > +           file://0001-Cast-to-sockaddr-in-systemd-interface.patch \
> >
>  file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
> > -           file://0001-notify-systemd-on-listen-and-reload.patch \
> > -           file://CVE-2024-6387.patch \
> > +
>  file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch \
> >             "
> > -SRC_URI[sha256sum] =3D
> "490426f766d82a2763fcacd8d83ea3d70798750c7bd2aff2e57dc5660f773ffd"
> > +SRC_URI[sha256sum] =3D
> "dd8bd002a379b5d499dfb050dd1fa9af8029e80461f4bb6c523c49973f5a39f3"
> >
> >  CVE_STATUS[CVE-2007-2768] =3D "not-applicable-config: This CVE is
> specific to OpenSSH with the pam opie which we don't build/use here."
> >
> > @@ -195,7 +195,7 @@ ALLOW_EMPTY:${PN} =3D "1"
> >  PACKAGES =3D+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp
> ${PN}-misc ${PN}-sftp-server"
> >  FILES:${PN}-scp =3D "${bindir}/scp.${BPN}"
> >  FILES:${PN}-ssh =3D "${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_config=
"
> > -FILES:${PN}-sshd =3D "${sbindir}/sshd ${sysconfdir}/init.d/sshd
> ${systemd_system_unitdir}"
> > +FILES:${PN}-sshd =3D "${sbindir}/sshd ${libexecdir}/sshd-session
> ${sysconfdir}/init.d/sshd ${systemd_system_unitdir}"
> >  FILES:${PN}-sshd +=3D "${sysconfdir}/ssh/moduli
> ${sysconfdir}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_readonly
> ${sysconfdir}/default/volatiles/99_sshd ${sysconfdir}/pam.d/sshd"
> >  FILES:${PN}-sshd +=3D "${libexecdir}/${BPN}/sshd_check_keys"
> >  FILES:${PN}-sftp =3D "${bindir}/sftp"
> > --
> > 2.45.2
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#202117):
> https://lists.openembedded.org/g/openembedded-core/message/202117
> > Mute This Topic: https://lists.openembedded.org/mt/107252589/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000075642d061d6d922d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Alexandre Belloni &lt;<a href=3D"mail=
to:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.com</a>&gt; esc=
reveu (quarta, 17/07/2024 =C3=A0(s) 08:57):<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Hello,<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/81/build=
s/6812/steps/13/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6812/steps/13/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/82/build=
s/6636/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6636/steps/12/logs/=
stdio</a><br>
<br>
This causes libssh2 ptest failures:<br>
<a href=3D"https://autobuilder.yocto.io/pub/non-release/20240716-73/testres=
ults/qemux86-64-ptest/libssh2.log" rel=3D"noreferrer" target=3D"_blank">htt=
ps://autobuilder.yocto.io/pub/non-release/20240716-73/testresults/qemux86-6=
4-ptest/libssh2.log</a><br>
<br>
START: ptest-runner<br>
2024-07-16T23:20<br>
PASS: mansyntax.sh<br>
PASS: test_simple<br>
FAIL: test_sshd.test<br>
DURATION: 14<br></blockquote><div><br></div><div>I&#39;ll have to test libs=
sh2 to see what&#39;s happening.<br></div><div><br></div><div><div><div sty=
le=3D"color:rgb(80,0,80)">Thanks=C2=A0for the feedback.<br></div><div style=
=3D"color:rgb(80,0,80)"><br></div><div style=3D"color:rgb(80,0,80)">Jose</d=
iv></div><br class=3D"gmail-Apple-interchange-newline"></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
On 16/07/2024 15:16:39+0100, Jose Quaresma wrote:<br>
&gt; - drop the CVE-2024-6387<br>
&gt; - drop the backported systemd notify<br>
&gt; - backported fix for musl build<br>
&gt; - submited fix for ptest regression<br>
&gt; - sshd now had the sshd-session<br>
&gt; <br>
&gt; Release notes at <a href=3D"https://www.openssh.com/txt/release-9.8" r=
el=3D"noreferrer" target=3D"_blank">https://www.openssh.com/txt/release-9.8=
</a><br>
&gt; <br>
&gt; Security<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; <br>
&gt; This release contains fixes for two security problems, one critical<br=
>
&gt; and one minor.<br>
&gt; <br>
&gt; 1) Race condition in sshd(8)<br>
&gt; <br>
&gt; A critical vulnerability in sshd(8) was present in Portable OpenSSH<br=
>
&gt; versions between 8.5p1 and 9.7p1 (inclusive) that may allow arbitrary<=
br>
&gt; code execution with root privileges.<br>
&gt; <br>
&gt; Successful exploitation has been demonstrated on 32-bit Linux/glibc<br=
>
&gt; systems with ASLR. Under lab conditions, the attack requires on<br>
&gt; average 6-8 hours of continuous connections up to the maximum the<br>
&gt; server will accept. Exploitation on 64-bit systems is believed to be<b=
r>
&gt; possible but has not been demonstrated at this time. It&#39;s likely t=
hat<br>
&gt; these attacks will be improved upon.<br>
&gt; <br>
&gt; Exploitation on non-glibc systems is conceivable but has not been<br>
&gt; examined. Systems that lack ASLR or users of downstream Linux<br>
&gt; distributions that have modified OpenSSH to disable per-connection<br>
&gt; ASLR re-randomisation (yes - this is a thing, no - we don&#39;t<br>
&gt; understand why) may potentially have an easier path to exploitation.<b=
r>
&gt; OpenBSD is not vulnerable.<br>
&gt; <br>
&gt; We thank the Qualys Security Advisory Team for discovering, reporting<=
br>
&gt; and demonstrating exploitability of this problem, and for providing<br=
>
&gt; detailed feedback on additional mitigation measures.<br>
&gt; <br>
&gt; 2) Logic error in ssh(1) ObscureKeystrokeTiming<br>
&gt; <br>
&gt; In OpenSSH version 9.5 through 9.7 (inclusive), when connected to an<b=
r>
&gt; OpenSSH server version 9.5 or later, a logic error in the ssh(1)<br>
&gt; ObscureKeystrokeTiming feature (on by default) rendered this feature<b=
r>
&gt; ineffective - a passive observer could still detect which network<br>
&gt; packets contained real keystrokes when the countermeasure was active<b=
r>
&gt; because both fake and real keystroke packets were being sent<br>
&gt; unconditionally.<br>
&gt; <br>
&gt; This bug was found by Philippos Giavridis and also independently by<br=
>
&gt; Jacky Wei En Kung, Daniel Hugenroth and Alastair Beresford of the<br>
&gt; University of Cambridge Computer Lab.<br>
&gt; <br>
&gt; Worse, the unconditional sending of both fake and real keystroke<br>
&gt; packets broke another long-standing timing attack mitigation. Since<br=
>
&gt; OpenSSH 2.9.9 sshd(8) has sent fake keystoke echo packets for<br>
&gt; traffic received on TTYs in echo-off mode, such as when entering a<br>
&gt; password into su(8) or sudo(8). This bug rendered these fake<br>
&gt; keystroke echoes ineffective and could allow a passive observer of<br>
&gt; a SSH session to once again detect when echo was off and obtain<br>
&gt; fairly limited timing information about keystrokes in this situation<b=
r>
&gt; (20ms granularity by default).<br>
&gt; <br>
&gt; This additional implication of the bug was identified by Jacky Wei<br>
&gt; En Kung, Daniel Hugenroth and Alastair Beresford and we thank them<br>
&gt; for their detailed analysis.<br>
&gt; <br>
&gt; This bug does not affect connections when ObscureKeystrokeTiming<br>
&gt; was disabled or sessions where no TTY was requested.<br>
&gt; <br>
&gt; Future deprecation notice<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
&gt; <br>
&gt; OpenSSH plans to remove support for the DSA signature algorithm in<br>
&gt; early 2025. This release disables DSA by default at compile time.<br>
&gt; <br>
&gt; DSA, as specified in the SSHv2 protocol, is inherently weak - being<br=
>
&gt; limited to a 160 bit private key and use of the SHA1 digest. Its<br>
&gt; estimated security level is only 80 bits symmetric equivalent.<br>
&gt; <br>
&gt; OpenSSH has disabled DSA keys by default since 2015 but has retained<b=
r>
&gt; run-time optional support for them. DSA was the only mandatory-to-<br>
&gt; implement algorithm in the SSHv2 RFCs, mostly because alternative<br>
&gt; algorithms were encumbered by patents when the SSHv2 protocol was<br>
&gt; specified.<br>
&gt; <br>
&gt; This has not been the case for decades at this point and better<br>
&gt; algorithms are well supported by all actively-maintained SSH<br>
&gt; implementations. We do not consider the costs of maintaining DSA<br>
&gt; in OpenSSH to be justified and hope that removing it from OpenSSH<br>
&gt; can accelerate its wider deprecation in supporting cryptography<br>
&gt; libraries.<br>
&gt; <br>
&gt; This release, and its deactivation of DSA by default at compile-time,<=
br>
&gt; marks the second step in our timeline to finally deprecate DSA. The<br=
>
&gt; final step of removing DSA support entirely is planned for the first<b=
r>
&gt; OpenSSH release of 2025.<br>
&gt; <br>
&gt; DSA support may be re-enabled in OpenBSD by setting &quot;DSAKEY=3Dyes=
&quot;<br>
&gt; in Makefile.inc. To enable DSA support in portable OpenSSH, pass<br>
&gt; the &quot;--enable-dsa-keys&quot; option to configure.<br>
&gt; <br>
&gt; Potentially-incompatible changes<br>
&gt; --------------------------------<br>
&gt; <br>
&gt;=C2=A0 * all: as mentioned above, the DSA signature algorithm is now<br=
>
&gt;=C2=A0 =C2=A0 disabled at compile time.<br>
&gt; <br>
&gt;=C2=A0 * sshd(8): the server will now block client addresses that<br>
&gt;=C2=A0 =C2=A0 repeatedly fail authentication, repeatedly connect withou=
t ever<br>
&gt;=C2=A0 =C2=A0 completing authentication or that crash the server. See t=
he<br>
&gt;=C2=A0 =C2=A0 discussion of PerSourcePenalties below for more informati=
on.<br>
&gt;=C2=A0 =C2=A0 Operators of servers that accept connections from many us=
ers, or<br>
&gt;=C2=A0 =C2=A0 servers that accept connections from addresses behind NAT=
 or<br>
&gt;=C2=A0 =C2=A0 proxies may need to consider these settings.<br>
&gt; <br>
&gt;=C2=A0 * sshd(8): the server has been split into a listener binary, ssh=
d(8),<br>
&gt;=C2=A0 =C2=A0 and a per-session binary &quot;sshd-session&quot;. This a=
llows for a much<br>
&gt;=C2=A0 =C2=A0 smaller listener binary, as it no longer needs to support=
 the SSH<br>
&gt;=C2=A0 =C2=A0 protocol. As part of this work, support for disabling pri=
vilege<br>
&gt;=C2=A0 =C2=A0 separation (which previously required code changes to dis=
able) and<br>
&gt;=C2=A0 =C2=A0 disabling re-execution of sshd(8) has been removed. Furth=
er<br>
&gt;=C2=A0 =C2=A0 separation of sshd-session into additional, minimal binar=
ies is<br>
&gt;=C2=A0 =C2=A0 planned for the future.<br>
&gt; <br>
&gt;=C2=A0 * sshd(8): several log messages have changed. In particular, som=
e<br>
&gt;=C2=A0 =C2=A0 log messages will be tagged with as originating from a pr=
ocess<br>
&gt;=C2=A0 =C2=A0 named &quot;sshd-session&quot; rather than &quot;sshd&quo=
t;.<br>
&gt; <br>
&gt;=C2=A0 * ssh-keyscan(1): this tool previously emitted comment lines<br>
&gt;=C2=A0 =C2=A0 containing the hostname and SSH protocol banner to standa=
rd error.<br>
&gt;=C2=A0 =C2=A0 This release now emits them to standard output, but adds =
a new<br>
&gt;=C2=A0 =C2=A0 &quot;-q&quot; flag to silence them altogether.<br>
&gt; <br>
&gt;=C2=A0 * sshd(8): (portable OpenSSH only) sshd will no longer use argv[=
0]<br>
&gt;=C2=A0 =C2=A0 as the PAM service name. A new &quot;PAMServiceName&quot;=
 sshd_config(5)<br>
&gt;=C2=A0 =C2=A0 directive allows selecting the service name at runtime. T=
his<br>
&gt;=C2=A0 =C2=A0 defaults to &quot;sshd&quot;. bz2101<br>
&gt; <br>
&gt;=C2=A0 * (portable OpenSSH only) Automatically-generated files, such as=
<br>
&gt;=C2=A0 =C2=A0 configure, <a href=3D"http://config.h.in" rel=3D"noreferr=
er" target=3D"_blank">config.h.in</a>, etc will now be checked in to the po=
rtable<br>
&gt;=C2=A0 =C2=A0 OpenSSH git release branch (e.g. V_9_8). This should ensu=
re that<br>
&gt;=C2=A0 =C2=A0 the contents of the signed release branch exactly match t=
he<br>
&gt;=C2=A0 =C2=A0 contents of the signed release tarball.<br>
&gt; <br>
&gt; Changes since OpenSSH 9.7<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
&gt; <br>
&gt; This release contains mostly bugfixes.<br>
&gt; <br>
&gt; New features<br>
&gt; ------------<br>
&gt; <br>
&gt;=C2=A0 * sshd(8): as described above, sshd(8) will now penalise client<=
br>
&gt;=C2=A0 =C2=A0 addresses that, for various reasons, do not successfully =
complete<br>
&gt;=C2=A0 =C2=A0 authentication. This feature is controlled by a new sshd_=
config(5)<br>
&gt;=C2=A0 =C2=A0 PerSourcePenalties option and is on by default.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 sshd(8) will now identify situations where the session di=
d not<br>
&gt;=C2=A0 =C2=A0 authenticate as expected. These conditions include when t=
he client<br>
&gt;=C2=A0 =C2=A0 repeatedly attempted authentication unsucessfully (possib=
ly<br>
&gt;=C2=A0 =C2=A0 indicating an attack against one or more accounts, e.g. p=
assword<br>
&gt;=C2=A0 =C2=A0 guessing), or when client behaviour caused sshd to crash =
(possibly<br>
&gt;=C2=A0 =C2=A0 indicating attempts to exploit bugs in sshd).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 When such a condition is observed, sshd will record a pen=
alty of<br>
&gt;=C2=A0 =C2=A0 some duration (e.g. 30 seconds) against the client&#39;s =
address. If<br>
&gt;=C2=A0 =C2=A0 this time is above a minimum configurable threshold, then=
 all<br>
&gt;=C2=A0 =C2=A0 connections from the client address will be refused (alon=
g with any<br>
&gt;=C2=A0 =C2=A0 others in the same PerSourceNetBlockSize CIDR range) unti=
l the<br>
&gt;=C2=A0 =C2=A0 penalty expire.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 Repeated offenses by the same client address will accrue =
greater<br>
&gt;=C2=A0 =C2=A0 penalties, up to a configurable maximum. Address ranges m=
ay be<br>
&gt;=C2=A0 =C2=A0 fully exempted from penalties, e.g. to guarantee access f=
rom a set<br>
&gt;=C2=A0 =C2=A0 of trusted management addresses, using the new sshd_confi=
g(5)<br>
&gt;=C2=A0 =C2=A0 PerSourcePenaltyExemptList option.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 We hope these options will make it significantly more dif=
ficult for<br>
&gt;=C2=A0 =C2=A0 attackers to find accounts with weak/guessable passwords =
or exploit<br>
&gt;=C2=A0 =C2=A0 bugs in sshd(8) itself. This option is enabled by default=
.<br>
&gt; <br>
&gt;=C2=A0 * ssh(8): allow the HostkeyAlgorithms directive to disable the<b=
r>
&gt;=C2=A0 =C2=A0 implicit fallback from certificate host key to plain host=
 keys.<br>
&gt; <br>
&gt; Bugfixes<br>
&gt; --------<br>
&gt; <br>
&gt;=C2=A0 * misc: fix a number of inaccuracies in the PROTOCOL.*<br>
&gt;=C2=A0 =C2=A0 documentation files. GHPR430 GHPR487<br>
&gt; <br>
&gt;=C2=A0 * all: switch to strtonum(3) for more robust integer parsing in =
most<br>
&gt;=C2=A0 =C2=A0 places.<br>
&gt; <br>
&gt;=C2=A0 * ssh(1), sshd(8): correctly restore sigprocmask around ppoll()<=
br>
&gt; <br>
&gt;=C2=A0 * ssh-keysign(8): stricter validation of messaging socket fd GHP=
R492<br>
&gt; <br>
&gt;=C2=A0 * sftp(1): flush stdout after writing &quot;sftp&gt;&quot; promp=
t when not using<br>
&gt;=C2=A0 =C2=A0 editline. GHPR480<br>
&gt; <br>
&gt;=C2=A0 * sftp-server(8): fix home-directory extension implementation, i=
t<br>
&gt;=C2=A0 =C2=A0 previously always returned the current user&#39;s home di=
rectory<br>
&gt;=C2=A0 =C2=A0 contrary to the spec. GHPR477<br>
&gt; <br>
&gt;=C2=A0 * ssh-keyscan(1): do not close stdin to prevent error messages w=
hen<br>
&gt;=C2=A0 =C2=A0 stdin is read multiple times. E.g.<br>
&gt;=C2=A0 =C2=A0 echo localhost | ssh-keyscan -f - -f -<br>
&gt; <br>
&gt;=C2=A0 * regression tests: fix rekey test that was testing the same KEX=
<br>
&gt;=C2=A0 =C2=A0 algorithm repeatedly instead of testing all of them. bz36=
92<br>
&gt; <br>
&gt;=C2=A0 * ssh_config(5), sshd_config(5): clarify the KEXAlgorithms direc=
tive<br>
&gt;=C2=A0 =C2=A0 documentation, especially around what is supported vs ava=
ilable.<br>
&gt;=C2=A0 =C2=A0 bz3701.<br>
&gt; <br>
&gt; Portability<br>
&gt; -----------<br>
&gt; <br>
&gt;=C2=A0 * sshd(8): expose SSH_AUTH_INFO_0 always to PAM auth modules<br>
&gt;=C2=A0 =C2=A0 unconditionally. The previous behaviour was to expose it =
only when<br>
&gt;=C2=A0 =C2=A0 particular authentication methods were in use.<br>
&gt; <br>
&gt;=C2=A0 * build: fix OpenSSL ED25519 support detection. An incorrect fun=
ction<br>
&gt;=C2=A0 =C2=A0 signature in <a href=3D"http://configure.ac" rel=3D"noref=
errer" target=3D"_blank">configure.ac</a> previously prevented enabling the=
 recently<br>
&gt;=C2=A0 =C2=A0 added support for ED25519 private keys in PEM PKCS8 forma=
t.<br>
&gt; <br>
&gt;=C2=A0 * ssh(1), ssh-agent(8): allow the presence of the WAYLAND_DISPLA=
Y<br>
&gt;=C2=A0 =C2=A0 environment variable to enable SSH_ASKPASS, similarly to =
the X11<br>
&gt;=C2=A0 =C2=A0 DISPLAY environment variable. GHPR479<br>
&gt; <br>
&gt;=C2=A0 * build: improve detection of the -fzero-call-used-regs compiler=
<br>
&gt;=C2=A0 =C2=A0 flag. bz3673.<br>
&gt; <br>
&gt;=C2=A0 * build: relax OpenSSL version check to accept all OpenSSL 3.x<b=
r>
&gt;=C2=A0 =C2=A0 versions.<br>
&gt; <br>
&gt;=C2=A0 * sshd(8): add support for notifying systemd on server listen an=
d<br>
&gt;=C2=A0 =C2=A0 reload, using a standalone implementation that doesn&#39;=
t depend on<br>
&gt;=C2=A0 =C2=A0 libsystemd. bz2641<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; v2:<br>
&gt;=C2=A0 - fix musl build<br>
&gt;=C2=A0 - fix sshd-session packing on openssh-sshd<br>
&gt;=C2=A0 - rebase on top of the CVE-2024-6387 fix sent<br>
&gt; <br>
&gt; v3:<br>
&gt;=C2=A0 - fix the ptest fail<br>
&gt;=C2=A0 - update upstream status of the systemd sd-notify patch<br>
&gt; <br>
&gt; v4:<br>
&gt;=C2=A0 - split update of Upstream-Status in new patches in the serie<br=
>
&gt;=C2=A0 - submit the the ptest fix upstream<br>
&gt; <br>
&gt; v5:<br>
&gt;=C2=A0 - backport upstream fix for musl build<br>
&gt;=C2=A0 - drop the backported systemd notify<br>
&gt; <br>
&gt;=C2=A0 ...ast-to-sockaddr-in-systemd-interface.patch |=C2=A0 30 +++<br>
&gt;=C2=A0 ...-notify-systemd-on-listen-and-reload.patch | 225 ------------=
------<br>
&gt;=C2=A0 ...h-log-input-and-output-files-on-erro.patch |=C2=A0 =C2=A08 +-=
<br>
&gt;=C2=A0 ...c-use-the-absolute-path-in-the-SSH-e.patch |=C2=A0 35 +++<br>
&gt;=C2=A0 .../openssh/openssh/CVE-2024-6387.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 27 ---<br>
&gt;=C2=A0 .../openssh/openssh/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 .../{<a href=3D"http://openssh_9.7p1.bb" rel=3D"noreferrer" targ=
et=3D"_blank">openssh_9.7p1.bb</a> =3D&gt; <a href=3D"http://openssh_9.8p1.=
bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.8p1.bb</a>}=C2=A0 =C2=A0=
 |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 7 files changed, 73 insertions(+), 261 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-connectivity/openssh/openssh/000=
1-Cast-to-sockaddr-in-systemd-interface.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-connectivity/openssh/openssh/000=
1-notify-systemd-on-listen-and-reload.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-connectivity/openssh/openssh/000=
1-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-connectivity/openssh/openssh/CVE=
-2024-6387.patch<br>
&gt;=C2=A0 rename meta/recipes-connectivity/openssh/{<a href=3D"http://open=
ssh_9.7p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.7p1.bb</a> =3D=
&gt; <a href=3D"http://openssh_9.8p1.bb" rel=3D"noreferrer" target=3D"_blan=
k">openssh_9.8p1.bb</a>} (96%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-connectivity/openssh/openssh/0001-Cast-to-so=
ckaddr-in-systemd-interface.patch b/meta/recipes-connectivity/openssh/opens=
sh/0001-Cast-to-sockaddr-in-systemd-interface.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..c41642ae10<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-connectivity/openssh/openssh/0001-Cast-to-sockaddr-=
in-systemd-interface.patch<br>
&gt; @@ -0,0 +1,30 @@<br>
&gt; +From a3068c6edb81c0b0b9a2ced82e8632c79314e409 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Darren Tucker &lt;<a href=3D"mailto:dtucker@dtucker.net" target=
=3D"_blank">dtucker@dtucker.net</a>&gt;<br>
&gt; +Date: Sun, 7 Jul 2024 18:46:19 +1000<br>
&gt; +Subject: [PATCH] Cast to sockaddr * in systemd interface.<br>
&gt; +<br>
&gt; +Fixes build with musl libx.=C2=A0 bz#3707.<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/openssh/open=
ssh-portable/commit/8b664df75966e5aed8dabea00b8838303d3488b8" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/openssh/openssh-portable/commit/=
8b664df75966e5aed8dabea00b8838303d3488b8</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foun=
dries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; +---<br>
&gt; + openbsd-compat/port-linux.c | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/openbsd-compat/port-linux.c b/openbsd-compat/port-linux.=
c<br>
&gt; +index 4c024c6d2..8adfec5a7 100644<br>
&gt; +--- a/openbsd-compat/port-linux.c<br>
&gt; ++++ b/openbsd-compat/port-linux.c<br>
&gt; +@@ -366,7 +366,7 @@ ssh_systemd_notify(const char *fmt, ...)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_f(&quot;socket =
\&quot;%s\&quot;: %s&quot;, path, strerror(errno));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 if (connect(fd, &amp;addr, sizeof(addr)) !=3D 0) {<br>
&gt; ++=C2=A0 =C2=A0 if (connect(fd, (struct sockaddr *)&amp;addr, sizeof(a=
ddr)) !=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_f(&quot;socket =
\&quot;%s\&quot; connect: %s&quot;, path, strerror(errno));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-- <br>
&gt; +2.45.2<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/openssh/0001-notify-sys=
temd-on-listen-and-reload.patch b/meta/recipes-connectivity/openssh/openssh=
/0001-notify-systemd-on-listen-and-reload.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 4925c969fe..0000000000<br>
&gt; --- a/meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on=
-listen-and-reload.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,225 +0,0 @@<br>
&gt; -From fc73e2405a8ca928465580b74a4d76112919367b Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Damien Miller &lt;<a href=3D"mailto:djm@mindrot.org" target=3D"=
_blank">djm@mindrot.org</a>&gt;<br>
&gt; -Date: Wed, 3 Apr 2024 14:40:32 +1100<br>
&gt; -Subject: [PATCH] notify systemd on listen and reload<br>
&gt; -<br>
&gt; -Standalone implementation that does not depend on libsystemd.<br>
&gt; -With assistance from Luca Boccassi, and feedback/testing from Colin<b=
r>
&gt; -Watson. bz2641<br>
&gt; -<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://github.com/openssh/open=
ssh-portable/commit/08f579231cd38a1c657aaa6ddeb8ab57a1fd4f5c" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/openssh/openssh-portable/commit/=
08f579231cd38a1c657aaa6ddeb8ab57a1fd4f5c</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foun=
dries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ----<br>
&gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
&gt; - openbsd-compat/port-linux.c | 97 +++++++++++++++++++++++++++++++++++=
+-<br>
&gt; - openbsd-compat/port-linux.h |=C2=A0 5 ++<br>
&gt; - platform.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 11 +++++<br>
&gt; - platform.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 1 +<br>
&gt; - sshd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 2 +<br>
&gt; - 6 files changed, 115 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index 82e8bb7c1..854f92b5b 100644<br>
&gt; ---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -@@ -915,6 +915,7 @@ int main(void) { if (NSVersionOfRunTimeLibrary(&q=
uot;System&quot;) &gt;=3D (60 &lt;&lt; 16))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0AC_DEFINE([_PATH_BTMP], [&quot;/var/log/btmp&quot=
;], [log for bad login attempts])<br>
&gt; -=C2=A0 =C2=A0 =C2=A0AC_DEFINE([USE_BTMP])<br>
&gt; -=C2=A0 =C2=A0 =C2=A0AC_DEFINE([LINUX_OOM_ADJUST], [1], [Adjust Linux =
out-of-memory killer])<br>
&gt; -+=C2=A0 =C2=A0 AC_DEFINE([SYSTEMD_NOTIFY], [1], [Have sshd notify sys=
temd on start/reload])<br>
&gt; -=C2=A0 =C2=A0 =C2=A0inet6_default_4in6=3Dyes<br>
&gt; -=C2=A0 =C2=A0 =C2=A0case `uname -r` in<br>
&gt; -=C2=A0 =C2=A0 =C2=A01.*|2.0.*)<br>
&gt; -diff --git a/openbsd-compat/port-linux.c b/openbsd-compat/port-linux.=
c<br>
&gt; -index 0457e28d0..df7290246 100644<br>
&gt; ---- a/openbsd-compat/port-linux.c<br>
&gt; -+++ b/openbsd-compat/port-linux.c<br>
&gt; -@@ -21,16 +21,23 @@<br>
&gt; - <br>
&gt; - #include &quot;includes.h&quot;<br>
&gt; - <br>
&gt; --#if defined(WITH_SELINUX) || defined(LINUX_OOM_ADJUST)<br>
&gt; -+#if defined(WITH_SELINUX) || defined(LINUX_OOM_ADJUST) || \<br>
&gt; -+=C2=A0 =C2=A0 defined(SYSTEMD_NOTIFY)<br>
&gt; -+#include &lt;sys/socket.h&gt;<br>
&gt; -+#include &lt;sys/un.h&gt;<br>
&gt; -+<br>
&gt; - #include &lt;errno.h&gt;<br>
&gt; -+#include &lt;inttypes.h&gt;<br>
&gt; - #include &lt;stdarg.h&gt;<br>
&gt; - #include &lt;string.h&gt;<br>
&gt; - #include &lt;stdio.h&gt;<br>
&gt; - #include &lt;stdlib.h&gt;<br>
&gt; -+#include &lt;time.h&gt;<br>
&gt; - <br>
&gt; - #include &quot;log.h&quot;<br>
&gt; - #include &quot;xmalloc.h&quot;<br>
&gt; - #include &quot;port-linux.h&quot;<br>
&gt; -+#include &quot;misc.h&quot;<br>
&gt; - <br>
&gt; - #ifdef WITH_SELINUX<br>
&gt; - #include &lt;selinux/selinux.h&gt;<br>
&gt; -@@ -310,4 +317,90 @@ oom_adjust_restore(void)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return;<br>
&gt; - }<br>
&gt; - #endif /* LINUX_OOM_ADJUST */<br>
&gt; --#endif /* WITH_SELINUX || LINUX_OOM_ADJUST */<br>
&gt; -+<br>
&gt; -+#ifdef SYSTEMD_NOTIFY<br>
&gt; -+<br>
&gt; -+static void ssh_systemd_notify(const char *, ...)<br>
&gt; -+=C2=A0 =C2=A0 __attribute__((__format__ (printf, 1, 2))) __attribute=
__((__nonnull__ (1)));<br>
&gt; -+<br>
&gt; -+static void<br>
&gt; -+ssh_systemd_notify(const char *fmt, ...)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 char *s =3D NULL;<br>
&gt; -+=C2=A0 =C2=A0 const char *path;<br>
&gt; -+=C2=A0 =C2=A0 struct stat sb;<br>
&gt; -+=C2=A0 =C2=A0 struct sockaddr_un addr;<br>
&gt; -+=C2=A0 =C2=A0 int fd =3D -1;<br>
&gt; -+=C2=A0 =C2=A0 va_list ap;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 if ((path =3D getenv(&quot;NOTIFY_SOCKET&quot;)) =3D=
=3D NULL || strlen(path) =3D=3D 0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 va_start(ap, fmt);<br>
&gt; -+=C2=A0 =C2=A0 xvasprintf(&amp;s, fmt, ap);<br>
&gt; -+=C2=A0 =C2=A0 va_end(ap);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 /* Only AF_UNIX is supported, with path or abstract so=
ckets */<br>
&gt; -+=C2=A0 =C2=A0 if (path[0] !=3D &#39;/&#39; &amp;&amp; path[0] !=3D &=
#39;@&#39;) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f(&quot;socket \&quo=
t;%s\&quot; is not compatible with AF_UNIX&quot;, path);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 if (path[0] =3D=3D &#39;/&#39; &amp;&amp; stat(path, &=
amp;sb) !=3D 0) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f(&quot;socket \&quo=
t;%s\&quot; stat: %s&quot;, path, strerror(errno));<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 memset(&amp;addr, 0, sizeof(addr));<br>
&gt; -+=C2=A0 =C2=A0 addr.sun_family =3D AF_UNIX;<br>
&gt; -+=C2=A0 =C2=A0 if (strlcpy(addr.sun_path, path,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(addr.sun_path)) &gt;=3D sizeof(ad=
dr.sun_path)) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f(&quot;socket path =
\&quot;%s\&quot; too long&quot;, path);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 /* Support for abstract socket */<br>
&gt; -+=C2=A0 =C2=A0 if (addr.sun_path[0] =3D=3D &#39;@&#39;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr.sun_path[0] =3D 0;<br=
>
&gt; -+=C2=A0 =C2=A0 if ((fd =3D socket(PF_UNIX, SOCK_DGRAM, 0)) =3D=3D -1)=
 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f(&quot;socket \&quo=
t;%s\&quot;: %s&quot;, path, strerror(errno));<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 if (connect(fd, &amp;addr, sizeof(addr)) !=3D 0) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f(&quot;socket \&quo=
t;%s\&quot; connect: %s&quot;, path, strerror(errno));<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 if (write(fd, s, strlen(s)) !=3D (ssize_t)strlen(s)) {=
<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f(&quot;socket \&quo=
t;%s\&quot; write: %s&quot;, path, strerror(errno));<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 debug_f(&quot;socket \&quot;%s\&quot; notified %s&quot=
;, path, s);<br>
&gt; -+ out:<br>
&gt; -+=C2=A0 =C2=A0 if (fd !=3D -1)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
&gt; -+=C2=A0 =C2=A0 free(s);<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+void<br>
&gt; -+ssh_systemd_notify_ready(void)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 ssh_systemd_notify(&quot;READY=3D1&quot;);<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+void<br>
&gt; -+ssh_systemd_notify_reload(void)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 struct timespec now;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 monotime_ts(&amp;now);<br>
&gt; -+=C2=A0 =C2=A0 if (now.tv_sec &lt; 0 || now.tv_nsec &lt; 0) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f(&quot;monotime ret=
urned negative value&quot;);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssh_systemd_notify(&quot;R=
ELOADING=3D1&quot;);<br>
&gt; -+=C2=A0 =C2=A0 } else {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssh_systemd_notify(&quot;R=
ELOADING=3D1\nMONOTONIC_USEC=3D%llu&quot;,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t)n=
ow.tv_sec * 1000000ULL) +<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t)n=
ow.tv_nsec / 1000ULL));<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+}<br>
&gt; -+#endif /* SYSTEMD_NOTIFY */<br>
&gt; -+<br>
&gt; -+#endif /* WITH_SELINUX || LINUX_OOM_ADJUST || SYSTEMD_NOTIFY */<br>
&gt; -diff --git a/openbsd-compat/port-linux.h b/openbsd-compat/port-linux.=
h<br>
&gt; -index 3c22a854d..14064f87d 100644<br>
&gt; ---- a/openbsd-compat/port-linux.h<br>
&gt; -+++ b/openbsd-compat/port-linux.h<br>
&gt; -@@ -30,4 +30,9 @@ void oom_adjust_restore(void);<br>
&gt; - void oom_adjust_setup(void);<br>
&gt; - #endif<br>
&gt; - <br>
&gt; -+#ifdef SYSTEMD_NOTIFY<br>
&gt; -+void ssh_systemd_notify_ready(void);<br>
&gt; -+void ssh_systemd_notify_reload(void);<br>
&gt; -+#endif<br>
&gt; -+<br>
&gt; - #endif /* ! _PORT_LINUX_H */<br>
&gt; -diff --git a/platform.c b/platform.c<br>
&gt; -index 4fe8744ee..9cf818153 100644<br>
&gt; ---- a/platform.c<br>
&gt; -+++ b/platform.c<br>
&gt; -@@ -44,6 +44,14 @@ platform_pre_listen(void)<br>
&gt; - #endif<br>
&gt; - }<br>
&gt; - <br>
&gt; -+void<br>
&gt; -+platform_post_listen(void)<br>
&gt; -+{<br>
&gt; -+#ifdef SYSTEMD_NOTIFY<br>
&gt; -+=C2=A0 =C2=A0 ssh_systemd_notify_ready();<br>
&gt; -+#endif<br>
&gt; -+}<br>
&gt; -+<br>
&gt; - void<br>
&gt; - platform_pre_fork(void)<br>
&gt; - {<br>
&gt; -@@ -55,6 +63,9 @@ platform_pre_fork(void)<br>
&gt; - void<br>
&gt; - platform_pre_restart(void)<br>
&gt; - {<br>
&gt; -+#ifdef SYSTEMD_NOTIFY<br>
&gt; -+=C2=A0 =C2=A0 ssh_systemd_notify_reload();<br>
&gt; -+#endif<br>
&gt; - #ifdef LINUX_OOM_ADJUST<br>
&gt; -=C2=A0 =C2=A0 =C2=A0oom_adjust_restore();<br>
&gt; - #endif<br>
&gt; -diff --git a/platform.h b/platform.h<br>
&gt; -index 7fef8c983..5dec23276 100644<br>
&gt; ---- a/platform.h<br>
&gt; -+++ b/platform.h<br>
&gt; -@@ -21,6 +21,7 @@<br>
&gt; - void platform_pre_listen(void);<br>
&gt; - void platform_pre_fork(void);<br>
&gt; - void platform_pre_restart(void);<br>
&gt; -+void platform_post_listen(void);<br>
&gt; - void platform_post_fork_parent(pid_t child_pid);<br>
&gt; - void platform_post_fork_child(void);<br>
&gt; - int=C2=A0 platform_privileged_uidswap(void);<br>
&gt; -diff --git a/sshd.c b/sshd.c<br>
&gt; -index b4f2b9742..865331b46 100644<br>
&gt; ---- a/sshd.c<br>
&gt; -+++ b/sshd.c<br>
&gt; -@@ -2077,6 +2077,8 @@ main(int ac, char **av)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssh_signal(SIGTERM, s=
igterm_handler);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssh_signal(SIGQUIT, s=
igterm_handler);<br>
&gt; - <br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 platform_post_listen();<br=
>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Write out the pid =
file after the sigterm handler<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * is setup and the l=
isten sockets are bound<br>
&gt; --- <br>
&gt; -2.45.2<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-ba=
nner.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivit=
y/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro=
.patch<br>
&gt; index 8763f30f4b..f424288e37 100644<br>
&gt; --- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh=
-log-input-and-output-files-on-erro.patch<br>
&gt; +++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh=
-log-input-and-output-files-on-erro.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From f5a4dacc987ca548fc86577c2dba121c86da3c34 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 5cc897fe2effe549e1e280c2f606bce8b532b61e Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org=
" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 11 Sep 2023 09:55:21 +0100<br>
&gt;=C2=A0 Subject: [PATCH] regress/banner.sh: log input and output files o=
n error<br>
&gt; @@ -37,12 +37,13 @@ See: <a href=3D"https://bugzilla.yoctoproject.org/=
show_bug.cgi?id=3D15178" rel=3D"noreferrer" target=3D"_blank">https://bugzi=
lla.yoctoproject.org/show_bug.cgi?id=3D15178</a><br>
&gt;=C2=A0 Upstream-Status: Denied [<a href=3D"https://github.com/openssh/o=
penssh-portable/pull/437" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/openssh/openssh-portable/pull/437</a>]<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@l=
inaro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
&gt; +Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foun=
dries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0regress/banner.sh | 4 +++-<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 diff --git a/regress/banner.sh b/regress/banner.sh<br>
&gt; -index a84feb5a..de84957a 100644<br>
&gt; +index a84feb5..de84957 100644<br>
&gt;=C2=A0 --- a/regress/banner.sh<br>
&gt;=C2=A0 +++ b/regress/banner.sh<br>
&gt;=C2=A0 @@ -32,7 +32,9 @@ for s in 0 10 100 1000 10000 100000 ; do<br>
&gt; @@ -56,6 +57,3 @@ index a84feb5a..de84957a 100644<br>
&gt;=C2=A0 =C2=A0done<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0trace &quot;test suppress banner (-q)&quot;<br>
&gt; --- <br>
&gt; -2.34.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-te=
st-exec-use-the-absolute-path-in-the-SSH-e.patch b/meta/recipes-connectivit=
y/openssh/openssh/0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e=
.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..b90cd2e69d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-test-exec=
-use-the-absolute-path-in-the-SSH-e.patch<br>
&gt; @@ -0,0 +1,35 @@<br>
&gt; +From fb762172fb678fe29327b667f8fe7380962a4540 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.io"=
 target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; +Date: Mon, 15 Jul 2024 18:43:08 +0100<br>
&gt; +Subject: [PATCH] regress/test-exec: use the absolute path in the SSH =
env<br>
&gt; +<br>
&gt; +The SSHAGENT_BIN was changed in [1] to SSH_BIN but<br>
&gt; +the last one don&#39;t use the absolute path and consequently<br>
&gt; +the function increase_datafile_size can loops forever<br>
&gt; +if the binary not found.<br>
&gt; +<br>
&gt; +[1] <a href=3D"https://github.com/openssh/openssh-portable/commit/a68=
f80f2511f0e0c5cef737a8284cc2dfabad818" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/openssh/openssh-portable/commit/a68f80f2511f0e0c5cef737=
a8284cc2dfabad818</a><br>
&gt; +<br>
&gt; +Upstream-Status: Submitted [<a href=3D"https://github.com/openssh/ope=
nssh-portable/pull/510" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/openssh/openssh-portable/pull/510</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foun=
dries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; +---<br>
&gt; + regress/test-exec.sh | 5 +++++<br>
&gt; + 1 file changed, 5 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/regress/test-exec.sh b/regress/test-exec.sh<br>
&gt; +index 7afc2807..175f554b 100644<br>
&gt; +--- a/regress/test-exec.sh<br>
&gt; ++++ b/regress/test-exec.sh<br>
&gt; +@@ -175,6 +175,11 @@ if [ &quot;x$TEST_SSH_OPENSSL&quot; !=3D &quot;x=
&quot; ]; then<br>
&gt; + fi<br>
&gt; + <br>
&gt; + # Path to sshd must be absolute for rexec<br>
&gt; ++case &quot;$SSH&quot; in<br>
&gt; ++/*) ;;<br>
&gt; ++*) SSH=3D`which $SSH` ;;<br>
&gt; ++esac<br>
&gt; ++<br>
&gt; + case &quot;$SSHD&quot; in<br>
&gt; + /*) ;;<br>
&gt; + *) SSHD=3D`which $SSHD` ;;<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.p=
atch b/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 3e7c707100..0000000000<br>
&gt; --- a/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch<br=
>
&gt; +++ /dev/null<br>
&gt; @@ -1,27 +0,0 @@<br>
&gt; -Description: fix signal handler race condition<br>
&gt; -Bug-Ubuntu: <a href=3D"https://bugs.launchpad.net/ubuntu/+source/open=
ssh/+bug/2070497" rel=3D"noreferrer" target=3D"_blank">https://bugs.launchp=
ad.net/ubuntu/+source/openssh/+bug/2070497</a><br>
&gt; -<br>
&gt; -CVE: CVE-2024-6387<br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -<a href=3D"https://git.launchpad.net/ubuntu/+source/openssh/commit/?h=
=3Dapplied/ubuntu/jammy-devel&amp;id=3Db059bcfa928df4ff2d103ae2e8f4e3136ee0=
3efc" rel=3D"noreferrer" target=3D"_blank">https://git.launchpad.net/ubuntu=
/+source/openssh/commit/?h=3Dapplied/ubuntu/jammy-devel&amp;id=3Db059bcfa92=
8df4ff2d103ae2e8f4e3136ee03efc</a><br>
&gt; -<br>
&gt; -Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foun=
dries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; -<br>
&gt; ---- a/log.c<br>
&gt; -+++ b/log.c<br>
&gt; -@@ -452,12 +452,14 @@ void<br>
&gt; - sshsigdie(const char *file, const char *func, int line, int showfunc=
,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0LogLevel level, const char *suffix, const char *f=
mt, ...)<br>
&gt; - {<br>
&gt; -+#if 0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0va_list args;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0va_start(args, fmt);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0sshlogv(file, func, line, showfunc, SYSLOG_LEVEL_=
FATAL,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0suffix, fmt, args);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0va_end(args);<br>
&gt; -+#endif<br>
&gt; -=C2=A0 =C2=A0 =C2=A0_exit(1);<br>
&gt; - }<br>
&gt; - <br>
&gt; diff --git a/meta/recipes-connectivity/openssh/openssh/run-ptest b/met=
a/recipes-connectivity/openssh/openssh/run-ptest<br>
&gt; index b2244d725a..c9100f9f37 100755<br>
&gt; --- a/meta/recipes-connectivity/openssh/openssh/run-ptest<br>
&gt; +++ b/meta/recipes-connectivity/openssh/openssh/run-ptest<br>
&gt; @@ -1,5 +1,6 @@<br>
&gt;=C2=A0 #!/bin/sh<br>
&gt;=C2=A0 <br>
&gt; +export TEST_SSH_SSH=3Dssh<br>
&gt;=C2=A0 export TEST_SHELL=3Dsh<br>
&gt;=C2=A0 export SKIP_UNIT=3D1<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta/recipes-connectivity/openssh/<a href=3D"http://opens=
sh_9.7p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.7p1.bb</a> b/me=
ta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.8p1.bb" rel=3D"=
noreferrer" target=3D"_blank">openssh_9.8p1.bb</a><br>
&gt; similarity index 96%<br>
&gt; rename from meta/recipes-connectivity/openssh/<a href=3D"http://openss=
h_9.7p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.7p1.bb</a><br>
&gt; rename to meta/recipes-connectivity/openssh/<a href=3D"http://openssh_=
9.8p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.8p1.bb</a><br>
&gt; index 4680d12be5..9554b4783f 100644<br>
&gt; --- a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.7p=
1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.7p1.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.8p=
1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.8p1.bb</a><br>
&gt; @@ -23,11 +23,11 @@ SRC_URI =3D &quot;<a href=3D"http://ftp.openbsd.or=
g/pub/OpenBSD/OpenSSH/portable/openssh-$%7BPV%7D.tar" rel=3D"noreferrer" ta=
rget=3D"_blank">http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh=
-${PV}.tar</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://volatiles.99_ssh=
d \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://sshd_check_keys =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Cast-to-sockaddr=
-in-systemd-interface.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-regress-ban=
ner.sh-log-input-and-output-files-on-erro.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-notify-systemd-o=
n-listen-and-reload.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-6387.patch \=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-regress-test-exe=
c-use-the-absolute-path-in-the-SSH-e.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;490426f766d82a2763fcacd8d83ea3d70798750c=
7bd2aff2e57dc5660f773ffd&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;dd8bd002a379b5d499dfb050dd1fa9af8029e804=
61f4bb6c523c49973f5a39f3&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 CVE_STATUS[CVE-2007-2768] =3D &quot;not-applicable-config: This =
CVE is specific to OpenSSH with the pam opie which we don&#39;t build/use h=
ere.&quot;<br>
&gt;=C2=A0 <br>
&gt; @@ -195,7 +195,7 @@ ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&gt;=C2=A0 PACKAGES =3D+ &quot;${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd =
${PN}-sftp ${PN}-misc ${PN}-sftp-server&quot;<br>
&gt;=C2=A0 FILES:${PN}-scp =3D &quot;${bindir}/scp.${BPN}&quot;<br>
&gt;=C2=A0 FILES:${PN}-ssh =3D &quot;${bindir}/ssh.${BPN} ${sysconfdir}/ssh=
/ssh_config&quot;<br>
&gt; -FILES:${PN}-sshd =3D &quot;${sbindir}/sshd ${sysconfdir}/init.d/sshd =
${systemd_system_unitdir}&quot;<br>
&gt; +FILES:${PN}-sshd =3D &quot;${sbindir}/sshd ${libexecdir}/sshd-session=
 ${sysconfdir}/init.d/sshd ${systemd_system_unitdir}&quot;<br>
&gt;=C2=A0 FILES:${PN}-sshd +=3D &quot;${sysconfdir}/ssh/moduli ${sysconfdi=
r}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_readonly ${sysconfdir}/def=
ault/volatiles/99_sshd ${sysconfdir}/pam.d/sshd&quot;<br>
&gt;=C2=A0 FILES:${PN}-sshd +=3D &quot;${libexecdir}/${BPN}/sshd_check_keys=
&quot;<br>
&gt;=C2=A0 FILES:${PN}-sftp =3D &quot;${bindir}/sftp&quot;<br>
&gt; -- <br>
&gt; 2.45.2<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#202117): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/202117" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/202117</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10725258=
9/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/107252589/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.belloni@boo=
tlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--00000000000075642d061d6d922d--

