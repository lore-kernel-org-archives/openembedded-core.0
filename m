Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72110C3DA42
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 08:46:33 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web10.10641.1721205992603569936
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 01:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i1aVUkLv;
 spf=pass (domain: gmail.com, ip: 209.85.222.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-80fbfeecca1so347883241.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 01:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721205991; x=1721810791; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JlREHgWI8HkS3kGMnV8sxnBkqmkdWnheh5p3wohcgok=;
        b=i1aVUkLvJKDlhpo0WsiEo5OHfep5Zh0yPLfmNGOh7NyvwhqB1DxPIl50PuNSlcGx3M
         gioqU6qI8CcNxqLEVzazr1sCse9U7bmfVYI54PDI1IRVk1AiJ07t/KBVohu5A37rU2wJ
         6wbRLTEyi4JrkBWz/rt4ejOQ5P48ZnZZaCWM5bmf8EZr3F18wTKWQGTT0Me4TVsnmEvC
         eIYh5wXmD85znkIzYpMZI4aJFroa8Lt+1HwVssiMLe1O7KRYHA5m7EeiCRR42Zz4c/G8
         8mm5xu76PC7ue1CoM1qFc4zBuS2/2HkmYnz3gb6HONzpihM5QAd4UAHmBBaqlm3+6AjH
         5ahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721205991; x=1721810791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlREHgWI8HkS3kGMnV8sxnBkqmkdWnheh5p3wohcgok=;
        b=hdHaFE8tFdIjNBtfb9RDA5taICNbEcIU8xYtpC128MySKCujobQHkHE4vqAlAI2Mre
         MtwVLjBZn5kSm2CA3pqnvsMoyAAlw8jCXAKL9DHHTCjd7xbzK9VP/C4iQz6/KZni3gc7
         Kv89ehQuLm6oR5kwlOGYcwl1+2EdofKroWCU3c6L6d+SZtv2D2EONif8/bZnq143+e3m
         lqoy1CiPSp2YvPdzND4S+lvHucfaDVirgH5vHEH42Yr4scvL6JjdfweOnCjWBQkdwQ7w
         nMe3Hk/K/S1loN6GTk1VsOE4tsZCpEzzNmSMkVSWC7jRhY4q1yl33wBWJ24X+wT+WUTl
         g3Gw==
X-Gm-Message-State: AOJu0YwdhrhDot+LHxj6IaDzw7zeWGzfNOv38pFXmEQd3jqGxDjSq6gF
	9tbsQsHWbWlfZp3x6TXhjWZIj+5zkwB9Q0+lqiiLYsXfQMe3doau9bxRdSOdfxEOFZ9GAHZfsqx
	+TuUxLvvt7mOG5l49O6vVfziryaw=
X-Google-Smtp-Source: AGHT+IFHQMjIAJTjU9nURDUGb2Z97st32clmN4/HYQat96K2NMLtMREfyVY871vSbJyHuXCmELpwSgdWWxsE0DAL5NE=
X-Received: by 2002:a05:6102:5e88:b0:48f:8c38:55d1 with SMTP id
 ada2fe7eead31-491598ff904mr1191319137.24.1721205991385; Wed, 17 Jul 2024
 01:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240716141639.1564355-1-jose.quaresma@foundries.io>
 <20240716141639.1564355-2-jose.quaresma@foundries.io> <CAMKF1sq9uq7tf_8K_-54mVdnerEbQQubBx2QXmX6xuU-RTgYXg@mail.gmail.com>
In-Reply-To: <CAMKF1sq9uq7tf_8K_-54mVdnerEbQQubBx2QXmX6xuU-RTgYXg@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 17 Jul 2024 09:46:16 +0100
Message-ID: <CANPvuRnPcYdSTjM3Kc8j1RfBw8LWRxj_quabmMZr_aOpUS8xRQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v5 2/3] openssh: systemd notification was
 implemented upstream
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000b3af6a061d6d7f48"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 08:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202144

--000000000000b3af6a061d6d7f48
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Khem Raj <raj.khem@gmail.com> escreveu (quarta, 17/07/2024 =C3=A0(s) 07:38)=
:

> actually I narrowed down my problem of disconnection to this patch in
> the series. Earlier I thought it might be related to the openssh
> upgrade patch
> but reverting that still causes the problem but this patch when
> reverted, the problem is gone.
>

I will jump on this today and try to find the root cause.
The ptest goes well in my local tests but I didn't do anything with
testimage.
I'll see if the testimage picks up something.

Thanks for the feedback.

Jose


>
> On Tue, Jul 16, 2024 at 7:17=E2=80=AFAM Jose Quaresma via
> lists.openembedded.org
> <quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Still side effects of the XZ backdoor. The systemd sd-notify patch
> > was rejected [1] upstream and was chosen a standalone implementation
> > that does not depend on libsystemd [2].
> >
> > Racional [1]:
> >
> > License incompatibility and library bloatedness were the reasons.
> > Given recent events we're never going to take a dependency on libsystem=
d,
> > though we might implement the notification protocol ourselves if it
> isn't too much work.
> >
> > [1]
> https://github.com/openssh/openssh-portable/pull/375#issuecomment-2027749=
729
> > [2]
> https://github.com/openssh/openssh-portable/commit/08f579231cd38a1c657aaa=
6ddeb8ab57a1fd4f5c
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >
> > v4:
> >  - split update of Upstream-Status in new patches in the serie
> >
> > v5:
> >  - use the upstream solution
> >
> >  ...-notify-systemd-on-listen-and-reload.patch | 225 ++++++++++++++++++
> >  ...tional-support-for-systemd-sd_notify.patch |  96 --------
> >  .../openssh/openssh/sshd.service              |   2 +-
> >  .../openssh/openssh/sshd@.service             |   1 +
> >  .../openssh/openssh_9.7p1.bb                  |   4 +-
> >  5 files changed, 228 insertions(+), 100 deletions(-)
> >  create mode 100644
> meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-listen-a=
nd-reload.patch
> >  delete mode 100644
> meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-suppo=
rt-for-systemd-sd_notify.patch
> >
> > diff --git
> a/meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-listen=
-and-reload.patch
> b/meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-listen=
-and-reload.patch
> > new file mode 100644
> > index 0000000000..4925c969fe
> > --- /dev/null
> > +++
> b/meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-listen=
-and-reload.patch
> > @@ -0,0 +1,225 @@
> > +From fc73e2405a8ca928465580b74a4d76112919367b Mon Sep 17 00:00:00 2001
> > +From: Damien Miller <djm@mindrot.org>
> > +Date: Wed, 3 Apr 2024 14:40:32 +1100
> > +Subject: [PATCH] notify systemd on listen and reload
> > +
> > +Standalone implementation that does not depend on libsystemd.
> > +With assistance from Luca Boccassi, and feedback/testing from Colin
> > +Watson. bz2641
> > +
> > +Upstream-Status: Backport [
> https://github.com/openssh/openssh-portable/commit/08f579231cd38a1c657aaa=
6ddeb8ab57a1fd4f5c
> ]
> > +
> > +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > +---
> > + configure.ac                |  1 +
> > + openbsd-compat/port-linux.c | 97 ++++++++++++++++++++++++++++++++++++=
-
> > + openbsd-compat/port-linux.h |  5 ++
> > + platform.c                  | 11 +++++
> > + platform.h                  |  1 +
> > + sshd.c                      |  2 +
> > + 6 files changed, 115 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index 82e8bb7c1..854f92b5b 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -915,6 +915,7 @@ int main(void) { if
> (NSVersionOfRunTimeLibrary("System") >=3D (60 << 16))
> > +       AC_DEFINE([_PATH_BTMP], ["/var/log/btmp"], [log for bad login
> attempts])
> > +       AC_DEFINE([USE_BTMP])
> > +       AC_DEFINE([LINUX_OOM_ADJUST], [1], [Adjust Linux out-of-memory
> killer])
> > ++      AC_DEFINE([SYSTEMD_NOTIFY], [1], [Have sshd notify systemd on
> start/reload])
> > +       inet6_default_4in6=3Dyes
> > +       case `uname -r` in
> > +       1.*|2.0.*)
> > +diff --git a/openbsd-compat/port-linux.c b/openbsd-compat/port-linux.c
> > +index 0457e28d0..df7290246 100644
> > +--- a/openbsd-compat/port-linux.c
> > ++++ b/openbsd-compat/port-linux.c
> > +@@ -21,16 +21,23 @@
> > +
> > + #include "includes.h"
> > +
> > +-#if defined(WITH_SELINUX) || defined(LINUX_OOM_ADJUST)
> > ++#if defined(WITH_SELINUX) || defined(LINUX_OOM_ADJUST) || \
> > ++    defined(SYSTEMD_NOTIFY)
> > ++#include <sys/socket.h>
> > ++#include <sys/un.h>
> > ++
> > + #include <errno.h>
> > ++#include <inttypes.h>
> > + #include <stdarg.h>
> > + #include <string.h>
> > + #include <stdio.h>
> > + #include <stdlib.h>
> > ++#include <time.h>
> > +
> > + #include "log.h"
> > + #include "xmalloc.h"
> > + #include "port-linux.h"
> > ++#include "misc.h"
> > +
> > + #ifdef WITH_SELINUX
> > + #include <selinux/selinux.h>
> > +@@ -310,4 +317,90 @@ oom_adjust_restore(void)
> > +       return;
> > + }
> > + #endif /* LINUX_OOM_ADJUST */
> > +-#endif /* WITH_SELINUX || LINUX_OOM_ADJUST */
> > ++
> > ++#ifdef SYSTEMD_NOTIFY
> > ++
> > ++static void ssh_systemd_notify(const char *, ...)
> > ++    __attribute__((__format__ (printf, 1, 2)))
> __attribute__((__nonnull__ (1)));
> > ++
> > ++static void
> > ++ssh_systemd_notify(const char *fmt, ...)
> > ++{
> > ++      char *s =3D NULL;
> > ++      const char *path;
> > ++      struct stat sb;
> > ++      struct sockaddr_un addr;
> > ++      int fd =3D -1;
> > ++      va_list ap;
> > ++
> > ++      if ((path =3D getenv("NOTIFY_SOCKET")) =3D=3D NULL || strlen(pa=
th) =3D=3D
> 0)
> > ++              return;
> > ++
> > ++      va_start(ap, fmt);
> > ++      xvasprintf(&s, fmt, ap);
> > ++      va_end(ap);
> > ++
> > ++      /* Only AF_UNIX is supported, with path or abstract sockets */
> > ++      if (path[0] !=3D '/' && path[0] !=3D '@') {
> > ++              error_f("socket \"%s\" is not compatible with AF_UNIX",
> path);
> > ++              goto out;
> > ++      }
> > ++
> > ++      if (path[0] =3D=3D '/' && stat(path, &sb) !=3D 0) {
> > ++              error_f("socket \"%s\" stat: %s", path, strerror(errno)=
);
> > ++              goto out;
> > ++      }
> > ++
> > ++      memset(&addr, 0, sizeof(addr));
> > ++      addr.sun_family =3D AF_UNIX;
> > ++      if (strlcpy(addr.sun_path, path,
> > ++          sizeof(addr.sun_path)) >=3D sizeof(addr.sun_path)) {
> > ++              error_f("socket path \"%s\" too long", path);
> > ++              goto out;
> > ++      }
> > ++      /* Support for abstract socket */
> > ++      if (addr.sun_path[0] =3D=3D '@')
> > ++              addr.sun_path[0] =3D 0;
> > ++      if ((fd =3D socket(PF_UNIX, SOCK_DGRAM, 0)) =3D=3D -1) {
> > ++              error_f("socket \"%s\": %s", path, strerror(errno));
> > ++              goto out;
> > ++      }
> > ++      if (connect(fd, &addr, sizeof(addr)) !=3D 0) {
> > ++              error_f("socket \"%s\" connect: %s", path,
> strerror(errno));
> > ++              goto out;
> > ++      }
> > ++      if (write(fd, s, strlen(s)) !=3D (ssize_t)strlen(s)) {
> > ++              error_f("socket \"%s\" write: %s", path,
> strerror(errno));
> > ++              goto out;
> > ++      }
> > ++      debug_f("socket \"%s\" notified %s", path, s);
> > ++ out:
> > ++      if (fd !=3D -1)
> > ++              close(fd);
> > ++      free(s);
> > ++}
> > ++
> > ++void
> > ++ssh_systemd_notify_ready(void)
> > ++{
> > ++      ssh_systemd_notify("READY=3D1");
> > ++}
> > ++
> > ++void
> > ++ssh_systemd_notify_reload(void)
> > ++{
> > ++      struct timespec now;
> > ++
> > ++      monotime_ts(&now);
> > ++      if (now.tv_sec < 0 || now.tv_nsec < 0) {
> > ++              error_f("monotime returned negative value");
> > ++              ssh_systemd_notify("RELOADING=3D1");
> > ++      } else {
> > ++              ssh_systemd_notify("RELOADING=3D1\nMONOTONIC_USEC=3D%ll=
u",
> > ++                  ((uint64_t)now.tv_sec * 1000000ULL) +
> > ++                  ((uint64_t)now.tv_nsec / 1000ULL));
> > ++      }
> > ++}
> > ++#endif /* SYSTEMD_NOTIFY */
> > ++
> > ++#endif /* WITH_SELINUX || LINUX_OOM_ADJUST || SYSTEMD_NOTIFY */
> > +diff --git a/openbsd-compat/port-linux.h b/openbsd-compat/port-linux.h
> > +index 3c22a854d..14064f87d 100644
> > +--- a/openbsd-compat/port-linux.h
> > ++++ b/openbsd-compat/port-linux.h
> > +@@ -30,4 +30,9 @@ void oom_adjust_restore(void);
> > + void oom_adjust_setup(void);
> > + #endif
> > +
> > ++#ifdef SYSTEMD_NOTIFY
> > ++void ssh_systemd_notify_ready(void);
> > ++void ssh_systemd_notify_reload(void);
> > ++#endif
> > ++
> > + #endif /* ! _PORT_LINUX_H */
> > +diff --git a/platform.c b/platform.c
> > +index 4fe8744ee..9cf818153 100644
> > +--- a/platform.c
> > ++++ b/platform.c
> > +@@ -44,6 +44,14 @@ platform_pre_listen(void)
> > + #endif
> > + }
> > +
> > ++void
> > ++platform_post_listen(void)
> > ++{
> > ++#ifdef SYSTEMD_NOTIFY
> > ++      ssh_systemd_notify_ready();
> > ++#endif
> > ++}
> > ++
> > + void
> > + platform_pre_fork(void)
> > + {
> > +@@ -55,6 +63,9 @@ platform_pre_fork(void)
> > + void
> > + platform_pre_restart(void)
> > + {
> > ++#ifdef SYSTEMD_NOTIFY
> > ++      ssh_systemd_notify_reload();
> > ++#endif
> > + #ifdef LINUX_OOM_ADJUST
> > +       oom_adjust_restore();
> > + #endif
> > +diff --git a/platform.h b/platform.h
> > +index 7fef8c983..5dec23276 100644
> > +--- a/platform.h
> > ++++ b/platform.h
> > +@@ -21,6 +21,7 @@
> > + void platform_pre_listen(void);
> > + void platform_pre_fork(void);
> > + void platform_pre_restart(void);
> > ++void platform_post_listen(void);
> > + void platform_post_fork_parent(pid_t child_pid);
> > + void platform_post_fork_child(void);
> > + int  platform_privileged_uidswap(void);
> > +diff --git a/sshd.c b/sshd.c
> > +index b4f2b9742..865331b46 100644
> > +--- a/sshd.c
> > ++++ b/sshd.c
> > +@@ -2077,6 +2077,8 @@ main(int ac, char **av)
> > +               ssh_signal(SIGTERM, sigterm_handler);
> > +               ssh_signal(SIGQUIT, sigterm_handler);
> > +
> > ++              platform_post_listen();
> > ++
> > +               /*
> > +                * Write out the pid file after the sigterm handler
> > +                * is setup and the listen sockets are bound
> > +--
> > +2.45.2
> > +
> > diff --git
> a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-sup=
port-for-systemd-sd_notify.patch
> b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-sup=
port-for-systemd-sd_notify.patch
> > deleted file mode 100644
> > index f079d936a4..0000000000
> > ---
> a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-sup=
port-for-systemd-sd_notify.patch
> > +++ /dev/null
> > @@ -1,96 +0,0 @@
> > -From b02ef7621758f06eb686ef4f620636dbad086eda Mon Sep 17 00:00:00 2001
> > -From: Matt Jolly <Matt.Jolly@footclan.ninja>
> > -Date: Thu, 2 Feb 2023 21:05:40 +1100
> > -Subject: [PATCH] systemd: Add optional support for systemd `sd_notify`
> > -
> > -This is a rebase of Dennis Lamm's <expeditioneer@gentoo.org>
> > -patch based on Jakub Jelen's <jjelen@redhat.com> original patch
> > -
> > -Upstream-Status: Submitted [
> https://github.com/openssh/openssh-portable/pull/375/commits/be187435911c=
de6cc3cef6982a508261074f1e56
> ]
> > -
> > -Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> > ----
> > - configure.ac | 24 ++++++++++++++++++++++++
> > - sshd.c       | 13 +++++++++++++
> > - 2 files changed, 37 insertions(+)
> > -
> > -diff --git a/configure.ac b/configure.ac
> > -index 82e8bb7..d1145d3 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -4870,6 +4870,29 @@ AC_SUBST([GSSLIBS])
> > - AC_SUBST([K5LIBS])
> > - AC_SUBST([CHANNELLIBS])
> > -
> > -+# Check whether user wants systemd support
> > -+SYSTEMD_MSG=3D"no"
> > -+AC_ARG_WITH(systemd,
> > -+      [  --with-systemd          Enable systemd support],
> > -+      [ if test "x$withval" !=3D "xno" ; then
> > -+              AC_PATH_TOOL([PKGCONFIG], [pkg-config], [no])
> > -+              if test "$PKGCONFIG" !=3D "no"; then
> > -+                      AC_MSG_CHECKING([for libsystemd])
> > -+                      if $PKGCONFIG --exists libsystemd; then
> > -+                              SYSTEMD_CFLAGS=3D`$PKGCONFIG --cflags
> libsystemd`
> > -+                              SYSTEMD_LIBS=3D`$PKGCONFIG --libs
> libsystemd`
> > -+                              CPPFLAGS=3D"$CPPFLAGS $SYSTEMD_CFLAGS"
> > -+                              SSHDLIBS=3D"$SSHDLIBS $SYSTEMD_LIBS"
> > -+                              AC_MSG_RESULT([yes])
> > -+                              AC_DEFINE(HAVE_SYSTEMD, 1, [Define if
> you want systemd support.])
> > -+                              SYSTEMD_MSG=3D"yes"
> > -+                      else
> > -+                              AC_MSG_RESULT([no])
> > -+                      fi
> > -+              fi
> > -+      fi ]
> > -+)
> > -+
> > - # Looking for programs, paths and files
> > -
> > - PRIVSEP_PATH=3D/var/empty
> > -@@ -5688,6 +5711,7 @@ echo "                   libldns support:
> $LDNS_MSG"
> > - echo "  Solaris process contract support: $SPC_MSG"
> > - echo "           Solaris project support: $SP_MSG"
> > - echo "         Solaris privilege support: $SPP_MSG"
> > -+echo "                   systemd support: $SYSTEMD_MSG"
> > - echo "       IP address in \$DISPLAY hack: $DISPLAY_HACK_MSG"
> > - echo "           Translate v4 in v6 hack: $IPV4_IN6_HACK_MSG"
> > - echo "                  BSD Auth support: $BSD_AUTH_MSG"
> > -diff --git a/sshd.c b/sshd.c
> > -index b4f2b97..6820a41 100644
> > ---- a/sshd.c
> > -+++ b/sshd.c
> > -@@ -88,6 +88,10 @@
> > - #include <prot.h>
> > - #endif
> > -
> > -+#ifdef HAVE_SYSTEMD
> > -+#include <systemd/sd-daemon.h>
> > -+#endif
> > -+
> > - #include "xmalloc.h"
> > - #include "ssh.h"
> > - #include "ssh2.h"
> > -@@ -308,6 +312,10 @@ static void
> > - sighup_restart(void)
> > - {
> > -       logit("Received SIGHUP; restarting.");
> > -+#ifdef HAVE_SYSTEMD
> > -+      /* Signal systemd that we are reloading */
> > -+      sd_notify(0, "RELOADING=3D1");
> > -+#endif
> > -       if (options.pid_file !=3D NULL)
> > -               unlink(options.pid_file);
> > -       platform_pre_restart();
> > -@@ -2093,6 +2101,11 @@ main(int ac, char **av)
> > -                       }
> > -               }
> > -
> > -+#ifdef HAVE_SYSTEMD
> > -+              /* Signal systemd that we are ready to accept
> connections */
> > -+              sd_notify(0, "READY=3D1");
> > -+#endif
> > -+
> > -               /* Accept a connection and return in a forked child */
> > -               server_accept_loop(&sock_in, &sock_out,
> > -                   &newsock, config_s);
> > diff --git a/meta/recipes-connectivity/openssh/openssh/sshd.service
> b/meta/recipes-connectivity/openssh/openssh/sshd.service
> > index 3e570ab1e5..c71fff1cc1 100644
> > --- a/meta/recipes-connectivity/openssh/openssh/sshd.service
> > +++ b/meta/recipes-connectivity/openssh/openssh/sshd.service
> > @@ -5,11 +5,11 @@ After=3Dsshdgenkeys.service
> >  After=3Dnss-user-lookup.target
> >
> >  [Service]
> > +Type=3Dnotify-reload
> >  Environment=3D"SSHD_OPTS=3D"
> >  EnvironmentFile=3D-/etc/default/ssh
> >  ExecStartPre=3D@BASE_BINDIR@/mkdir -p /var/run/sshd
> >  ExecStart=3D-@SBINDIR@/sshd -D $SSHD_OPTS
> > -ExecReload=3D@BASE_BINDIR@/kill -HUP $MAINPID
> >  KillMode=3Dprocess
> >  Restart=3Don-failure
> >  RestartSec=3D42s
> > diff --git a/meta/recipes-connectivity/openssh/openssh/sshd@.service
> b/meta/recipes-connectivity/openssh/openssh/sshd@.service
> > index 9d9965e624..dcfec8f054 100644
> > --- a/meta/recipes-connectivity/openssh/openssh/sshd@.service
> > +++ b/meta/recipes-connectivity/openssh/openssh/sshd@.service
> > @@ -3,6 +3,7 @@ Description=3DOpenSSH Per-Connection Daemon
> >  After=3Dsshdgenkeys.service
> >
> >  [Service]
> > +Type=3Dnotify-reload
> >  Environment=3D"SSHD_OPTS=3D"
> >  EnvironmentFile=3D-/etc/default/ssh
> >  ExecStart=3D-@SBINDIR@/sshd -i $SSHD_OPTS
> > diff --git a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
> b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
> > index 4f20616295..4680d12be5 100644
> > --- a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
> > +++ b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
> > @@ -24,7 +24,7 @@ SRC_URI =3D "
> http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
> >             file://run-ptest \
> >             file://sshd_check_keys \
> >
>  file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
> > -
>  file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patch \
> > +           file://0001-notify-systemd-on-listen-and-reload.patch \
> >             file://CVE-2024-6387.patch \
> >             "
> >  SRC_URI[sha256sum] =3D
> "490426f766d82a2763fcacd8d83ea3d70798750c7bd2aff2e57dc5660f773ffd"
> > @@ -52,7 +52,6 @@ SYSTEMD_PACKAGES =3D "${PN}-sshd"
> >  SYSTEMD_SERVICE:${PN}-sshd =3D
> "${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-socket-mode','sshd.so=
cket',
> '', d)}
> ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-service-mode','sshd.se=
rvice',
> '', d)}"
> >
> >  inherit autotools-brokensep ptest pkgconfig
> > -DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> 'systemd', '', d)}"
> >
> >  # systemd-sshd-socket-mode means installing sshd.socket
> >  # and systemd-sshd-service-mode corresponding to sshd.service
> > @@ -78,7 +77,6 @@ EXTRA_OECONF =3D "'LOGIN_PROGRAM=3D${base_bindir}/log=
in' \
> >                  --sysconfdir=3D${sysconfdir}/ssh \
> >                  --with-xauth=3D${bindir}/xauth \
> >                  --disable-strip \
> > -                ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> '--with-systemd', '--without-systemd', d)} \
> >                  "
> >
> >  # musl doesn't implement wtmp/utmp and logwtmp
> > --
> > 2.45.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#202116):
> https://lists.openembedded.org/g/openembedded-core/message/202116
> > Mute This Topic: https://lists.openembedded.org/mt/107252588/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000b3af6a061d6d7f48
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">ra=
j.khem@gmail.com</a>&gt; escreveu (quarta, 17/07/2024 =C3=A0(s) 07:38):<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">actually I narrowed=
 down my problem of disconnection to this patch in<br>
the series. Earlier I thought it might be related to the openssh<br>
upgrade patch<br>
but reverting that still causes the problem but this patch when<br>
reverted, the problem is gone.<br></blockquote><div><br></div><div>I will j=
ump on this today and try to find the root cause.</div><div>The ptest goes =
well in my local tests but I didn&#39;t do anything with testimage.<br>I&#3=
9;ll see if the testimage picks up something.<br></div><div><br></div><div>=
Thanks=C2=A0for the feedback.<br></div><div><br></div><div>Jose</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
On Tue, Jul 16, 2024 at 7:17=E2=80=AFAM Jose Quaresma via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" tar=
get=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Still side effects of the XZ backdoor. The systemd sd-notify patch<br>
&gt; was rejected [1] upstream and was chosen a standalone implementation<b=
r>
&gt; that does not depend on libsystemd [2].<br>
&gt;<br>
&gt; Racional [1]:<br>
&gt;<br>
&gt; License incompatibility and library bloatedness were the reasons.<br>
&gt; Given recent events we&#39;re never going to take a dependency on libs=
ystemd,<br>
&gt; though we might implement the notification protocol ourselves if it is=
n&#39;t too much work.<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/openssh/openssh-portable/pull/375#is=
suecomment-2027749729" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/openssh/openssh-portable/pull/375#issuecomment-2027749729</a><br>
&gt; [2] <a href=3D"https://github.com/openssh/openssh-portable/commit/08f5=
79231cd38a1c657aaa6ddeb8ab57a1fd4f5c" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/openssh/openssh-portable/commit/08f579231cd38a1c657aaa6d=
deb8ab57a1fd4f5c</a><br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; v4:<br>
&gt;=C2=A0 - split update of Upstream-Status in new patches in the serie<br=
>
&gt;<br>
&gt; v5:<br>
&gt;=C2=A0 - use the upstream solution<br>
&gt;<br>
&gt;=C2=A0 ...-notify-systemd-on-listen-and-reload.patch | 225 ++++++++++++=
++++++<br>
&gt;=C2=A0 ...tional-support-for-systemd-sd_notify.patch |=C2=A0 96 -------=
-<br>
&gt;=C2=A0 .../openssh/openssh/sshd.service=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../openssh/openssh/sshd@.service=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 .../openssh/<a href=3D"http://openssh_9.7p1.bb" rel=3D"noreferre=
r" target=3D"_blank">openssh_9.7p1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 5 files changed, 228 insertions(+), 100 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-connectivity/openssh/openssh/000=
1-notify-systemd-on-listen-and-reload.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-connectivity/openssh/openssh/000=
1-systemd-Add-optional-support-for-systemd-sd_notify.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/openssh/0001-notify-sys=
temd-on-listen-and-reload.patch b/meta/recipes-connectivity/openssh/openssh=
/0001-notify-systemd-on-listen-and-reload.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..4925c969fe<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on=
-listen-and-reload.patch<br>
&gt; @@ -0,0 +1,225 @@<br>
&gt; +From fc73e2405a8ca928465580b74a4d76112919367b Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Damien Miller &lt;<a href=3D"mailto:djm@mindrot.org" target=3D"=
_blank">djm@mindrot.org</a>&gt;<br>
&gt; +Date: Wed, 3 Apr 2024 14:40:32 +1100<br>
&gt; +Subject: [PATCH] notify systemd on listen and reload<br>
&gt; +<br>
&gt; +Standalone implementation that does not depend on libsystemd.<br>
&gt; +With assistance from Luca Boccassi, and feedback/testing from Colin<b=
r>
&gt; +Watson. bz2641<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/openssh/open=
ssh-portable/commit/08f579231cd38a1c657aaa6ddeb8ab57a1fd4f5c" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/openssh/openssh-portable/commit/=
08f579231cd38a1c657aaa6ddeb8ab57a1fd4f5c</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foun=
dries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; +---<br>
&gt; + <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
&gt; + openbsd-compat/port-linux.c | 97 +++++++++++++++++++++++++++++++++++=
+-<br>
&gt; + openbsd-compat/port-linux.h |=C2=A0 5 ++<br>
&gt; + platform.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 11 +++++<br>
&gt; + platform.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 1 +<br>
&gt; + sshd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 2 +<br>
&gt; + 6 files changed, 115 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; +index 82e8bb7c1..854f92b5b 100644<br>
&gt; +--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; ++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; +@@ -915,6 +915,7 @@ int main(void) { if (NSVersionOfRunTimeLibrary(&q=
uot;System&quot;) &gt;=3D (60 &lt;&lt; 16))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_DEFINE([_PATH_BTMP], [&quot;/var/log/bt=
mp&quot;], [log for bad login attempts])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_DEFINE([USE_BTMP])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_DEFINE([LINUX_OOM_ADJUST], [1], [Adjust=
 Linux out-of-memory killer])<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 AC_DEFINE([SYSTEMD_NOTIFY], [1], [Have sshd not=
ify systemd on start/reload])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0inet6_default_4in6=3Dyes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case `uname -r` in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A01.*|2.0.*)<br>
&gt; +diff --git a/openbsd-compat/port-linux.c b/openbsd-compat/port-linux.=
c<br>
&gt; +index 0457e28d0..df7290246 100644<br>
&gt; +--- a/openbsd-compat/port-linux.c<br>
&gt; ++++ b/openbsd-compat/port-linux.c<br>
&gt; +@@ -21,16 +21,23 @@<br>
&gt; +<br>
&gt; + #include &quot;includes.h&quot;<br>
&gt; +<br>
&gt; +-#if defined(WITH_SELINUX) || defined(LINUX_OOM_ADJUST)<br>
&gt; ++#if defined(WITH_SELINUX) || defined(LINUX_OOM_ADJUST) || \<br>
&gt; ++=C2=A0 =C2=A0 defined(SYSTEMD_NOTIFY)<br>
&gt; ++#include &lt;sys/socket.h&gt;<br>
&gt; ++#include &lt;sys/un.h&gt;<br>
&gt; ++<br>
&gt; + #include &lt;errno.h&gt;<br>
&gt; ++#include &lt;inttypes.h&gt;<br>
&gt; + #include &lt;stdarg.h&gt;<br>
&gt; + #include &lt;string.h&gt;<br>
&gt; + #include &lt;stdio.h&gt;<br>
&gt; + #include &lt;stdlib.h&gt;<br>
&gt; ++#include &lt;time.h&gt;<br>
&gt; +<br>
&gt; + #include &quot;log.h&quot;<br>
&gt; + #include &quot;xmalloc.h&quot;<br>
&gt; + #include &quot;port-linux.h&quot;<br>
&gt; ++#include &quot;misc.h&quot;<br>
&gt; +<br>
&gt; + #ifdef WITH_SELINUX<br>
&gt; + #include &lt;selinux/selinux.h&gt;<br>
&gt; +@@ -310,4 +317,90 @@ oom_adjust_restore(void)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; + }<br>
&gt; + #endif /* LINUX_OOM_ADJUST */<br>
&gt; +-#endif /* WITH_SELINUX || LINUX_OOM_ADJUST */<br>
&gt; ++<br>
&gt; ++#ifdef SYSTEMD_NOTIFY<br>
&gt; ++<br>
&gt; ++static void ssh_systemd_notify(const char *, ...)<br>
&gt; ++=C2=A0 =C2=A0 __attribute__((__format__ (printf, 1, 2))) __attribute=
__((__nonnull__ (1)));<br>
&gt; ++<br>
&gt; ++static void<br>
&gt; ++ssh_systemd_notify(const char *fmt, ...)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 char *s =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 const char *path;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 struct stat sb;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 struct sockaddr_un addr;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int fd =3D -1;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 va_list ap;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if ((path =3D getenv(&quot;NOTIFY_SOCKET&quot;)=
) =3D=3D NULL || strlen(path) =3D=3D 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 va_start(ap, fmt);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 xvasprintf(&amp;s, fmt, ap);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 va_end(ap);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* Only AF_UNIX is supported, with path or abst=
ract sockets */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (path[0] !=3D &#39;/&#39; &amp;&amp; path[0]=
 !=3D &#39;@&#39;) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f(&quot;socke=
t \&quot;%s\&quot; is not compatible with AF_UNIX&quot;, path);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (path[0] =3D=3D &#39;/&#39; &amp;&amp; stat(=
path, &amp;sb) !=3D 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f(&quot;socke=
t \&quot;%s\&quot; stat: %s&quot;, path, strerror(errno));<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 memset(&amp;addr, 0, sizeof(addr));<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 addr.sun_family =3D AF_UNIX;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (strlcpy(addr.sun_path, path,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(addr.sun_path)) &gt;=3D si=
zeof(addr.sun_path)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f(&quot;socke=
t path \&quot;%s\&quot; too long&quot;, path);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* Support for abstract socket */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (addr.sun_path[0] =3D=3D &#39;@&#39;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr.sun_path[0] =
=3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if ((fd =3D socket(PF_UNIX, SOCK_DGRAM, 0)) =3D=
=3D -1) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f(&quot;socke=
t \&quot;%s\&quot;: %s&quot;, path, strerror(errno));<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (connect(fd, &amp;addr, sizeof(addr)) !=3D 0=
) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f(&quot;socke=
t \&quot;%s\&quot; connect: %s&quot;, path, strerror(errno));<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (write(fd, s, strlen(s)) !=3D (ssize_t)strle=
n(s)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f(&quot;socke=
t \&quot;%s\&quot; write: %s&quot;, path, strerror(errno));<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 debug_f(&quot;socket \&quot;%s\&quot; notified =
%s&quot;, path, s);<br>
&gt; ++ out:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (fd !=3D -1)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 free(s);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++void<br>
&gt; ++ssh_systemd_notify_ready(void)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ssh_systemd_notify(&quot;READY=3D1&quot;);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++void<br>
&gt; ++ssh_systemd_notify_reload(void)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 struct timespec now;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 monotime_ts(&amp;now);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (now.tv_sec &lt; 0 || now.tv_nsec &lt; 0) {<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f(&quot;monot=
ime returned negative value&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssh_systemd_notify(=
&quot;RELOADING=3D1&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssh_systemd_notify(=
&quot;RELOADING=3D1\nMONOTONIC_USEC=3D%llu&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((uin=
t64_t)now.tv_sec * 1000000ULL) +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((uin=
t64_t)now.tv_nsec / 1000ULL));<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++#endif /* SYSTEMD_NOTIFY */<br>
&gt; ++<br>
&gt; ++#endif /* WITH_SELINUX || LINUX_OOM_ADJUST || SYSTEMD_NOTIFY */<br>
&gt; +diff --git a/openbsd-compat/port-linux.h b/openbsd-compat/port-linux.=
h<br>
&gt; +index 3c22a854d..14064f87d 100644<br>
&gt; +--- a/openbsd-compat/port-linux.h<br>
&gt; ++++ b/openbsd-compat/port-linux.h<br>
&gt; +@@ -30,4 +30,9 @@ void oom_adjust_restore(void);<br>
&gt; + void oom_adjust_setup(void);<br>
&gt; + #endif<br>
&gt; +<br>
&gt; ++#ifdef SYSTEMD_NOTIFY<br>
&gt; ++void ssh_systemd_notify_ready(void);<br>
&gt; ++void ssh_systemd_notify_reload(void);<br>
&gt; ++#endif<br>
&gt; ++<br>
&gt; + #endif /* ! _PORT_LINUX_H */<br>
&gt; +diff --git a/platform.c b/platform.c<br>
&gt; +index 4fe8744ee..9cf818153 100644<br>
&gt; +--- a/platform.c<br>
&gt; ++++ b/platform.c<br>
&gt; +@@ -44,6 +44,14 @@ platform_pre_listen(void)<br>
&gt; + #endif<br>
&gt; + }<br>
&gt; +<br>
&gt; ++void<br>
&gt; ++platform_post_listen(void)<br>
&gt; ++{<br>
&gt; ++#ifdef SYSTEMD_NOTIFY<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ssh_systemd_notify_ready();<br>
&gt; ++#endif<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + void<br>
&gt; + platform_pre_fork(void)<br>
&gt; + {<br>
&gt; +@@ -55,6 +63,9 @@ platform_pre_fork(void)<br>
&gt; + void<br>
&gt; + platform_pre_restart(void)<br>
&gt; + {<br>
&gt; ++#ifdef SYSTEMD_NOTIFY<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ssh_systemd_notify_reload();<br>
&gt; ++#endif<br>
&gt; + #ifdef LINUX_OOM_ADJUST<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0oom_adjust_restore();<br>
&gt; + #endif<br>
&gt; +diff --git a/platform.h b/platform.h<br>
&gt; +index 7fef8c983..5dec23276 100644<br>
&gt; +--- a/platform.h<br>
&gt; ++++ b/platform.h<br>
&gt; +@@ -21,6 +21,7 @@<br>
&gt; + void platform_pre_listen(void);<br>
&gt; + void platform_pre_fork(void);<br>
&gt; + void platform_pre_restart(void);<br>
&gt; ++void platform_post_listen(void);<br>
&gt; + void platform_post_fork_parent(pid_t child_pid);<br>
&gt; + void platform_post_fork_child(void);<br>
&gt; + int=C2=A0 platform_privileged_uidswap(void);<br>
&gt; +diff --git a/sshd.c b/sshd.c<br>
&gt; +index b4f2b9742..865331b46 100644<br>
&gt; +--- a/sshd.c<br>
&gt; ++++ b/sshd.c<br>
&gt; +@@ -2077,6 +2077,8 @@ main(int ac, char **av)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssh_signal(SIG=
TERM, sigterm_handler);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssh_signal(SIG=
QUIT, sigterm_handler);<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 platform_post_liste=
n();<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Write out t=
he pid file after the sigterm handler<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * is setup an=
d the listen sockets are bound<br>
&gt; +--<br>
&gt; +2.45.2<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Ad=
d-optional-support-for-systemd-sd_notify.patch b/meta/recipes-connectivity/=
openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.pat=
ch<br>
&gt; deleted file mode 100644<br>
&gt; index f079d936a4..0000000000<br>
&gt; --- a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optio=
nal-support-for-systemd-sd_notify.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,96 +0,0 @@<br>
&gt; -From b02ef7621758f06eb686ef4f620636dbad086eda Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Matt Jolly &lt;Matt.Jolly@footclan.ninja&gt;<br>
&gt; -Date: Thu, 2 Feb 2023 21:05:40 +1100<br>
&gt; -Subject: [PATCH] systemd: Add optional support for systemd `sd_notify=
`<br>
&gt; -<br>
&gt; -This is a rebase of Dennis Lamm&#39;s &lt;<a href=3D"mailto:expeditio=
neer@gentoo.org" target=3D"_blank">expeditioneer@gentoo.org</a>&gt;<br>
&gt; -patch based on Jakub Jelen&#39;s &lt;<a href=3D"mailto:jjelen@redhat.=
com" target=3D"_blank">jjelen@redhat.com</a>&gt; original patch<br>
&gt; -<br>
&gt; -Upstream-Status: Submitted [<a href=3D"https://github.com/openssh/ope=
nssh-portable/pull/375/commits/be187435911cde6cc3cef6982a508261074f1e56" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/openssh/openssh-porta=
ble/pull/375/commits/be187435911cde6cc3cef6982a508261074f1e56</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@windri=
ver.com" target=3D"_blank">xiangyu.chen@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> | 24 ++++++++++++++++++++++++<br>
&gt; - sshd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 13 +++++++++++++<br>
&gt; - 2 files changed, 37 insertions(+)<br>
&gt; -<br>
&gt; -diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index 82e8bb7..d1145d3 100644<br>
&gt; ---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -@@ -4870,6 +4870,29 @@ AC_SUBST([GSSLIBS])<br>
&gt; - AC_SUBST([K5LIBS])<br>
&gt; - AC_SUBST([CHANNELLIBS])<br>
&gt; -<br>
&gt; -+# Check whether user wants systemd support<br>
&gt; -+SYSTEMD_MSG=3D&quot;no&quot;<br>
&gt; -+AC_ARG_WITH(systemd,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 [=C2=A0 --with-systemd=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Enable systemd support],<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 [ if test &quot;x$withval&quot; !=3D &quot;xno&=
quot; ; then<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_PATH_TOOL([PKGCO=
NFIG], [pkg-config], [no])<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$PKGC=
ONFIG&quot; !=3D &quot;no&quot;; then<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 AC_MSG_CHECKING([for libsystemd])<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if $PKGCONFIG --exists libsystemd; then<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSTEMD_CFLAGS=3D`$PKGCONFIG --cflag=
s libsystemd`<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSTEMD_LIBS=3D`$PKGCONFIG --libs li=
bsystemd`<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$CPPFLAGS $SYSTEMD_=
CFLAGS&quot;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SSHDLIBS=3D&quot;$SSHDLIBS $SYSTEMD_=
LIBS&quot;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([yes])<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_DEFINE(HAVE_SYSTEMD, 1, [Define i=
f you want systemd support.])<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSTEMD_MSG=3D&quot;yes&quot;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 else<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([no])<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fi<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 fi ]<br>
&gt; -+)<br>
&gt; -+<br>
&gt; - # Looking for programs, paths and files<br>
&gt; -<br>
&gt; - PRIVSEP_PATH=3D/var/empty<br>
&gt; -@@ -5688,6 +5711,7 @@ echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libldns support: $LDNS_MSG&quot;<br>
&gt; - echo &quot;=C2=A0 Solaris process contract support: $SPC_MSG&quot;<b=
r>
&gt; - echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Solaris project =
support: $SP_MSG&quot;<br>
&gt; - echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Solaris privilege suppo=
rt: $SPP_MSG&quot;<br>
&gt; -+echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0systemd support: $SYSTEMD_MSG&quot;<br>
&gt; - echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0IP address in \$DISPLAY hack: =
$DISPLAY_HACK_MSG&quot;<br>
&gt; - echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Translate v4 in =
v6 hack: $IPV4_IN6_HACK_MSG&quot;<br>
&gt; - echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 BSD Auth support: $BSD_AUTH_MSG&quot;<br>
&gt; -diff --git a/sshd.c b/sshd.c<br>
&gt; -index b4f2b97..6820a41 100644<br>
&gt; ---- a/sshd.c<br>
&gt; -+++ b/sshd.c<br>
&gt; -@@ -88,6 +88,10 @@<br>
&gt; - #include &lt;prot.h&gt;<br>
&gt; - #endif<br>
&gt; -<br>
&gt; -+#ifdef HAVE_SYSTEMD<br>
&gt; -+#include &lt;systemd/sd-daemon.h&gt;<br>
&gt; -+#endif<br>
&gt; -+<br>
&gt; - #include &quot;xmalloc.h&quot;<br>
&gt; - #include &quot;ssh.h&quot;<br>
&gt; - #include &quot;ssh2.h&quot;<br>
&gt; -@@ -308,6 +312,10 @@ static void<br>
&gt; - sighup_restart(void)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0logit(&quot;Received SIGHUP; restarting.&q=
uot;);<br>
&gt; -+#ifdef HAVE_SYSTEMD<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 /* Signal systemd that we are reloading */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 sd_notify(0, &quot;RELOADING=3D1&quot;);<br>
&gt; -+#endif<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (options.pid_file !=3D NULL)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unlink(options=
.pid_file);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0platform_pre_restart();<br>
&gt; -@@ -2093,6 +2101,11 @@ main(int ac, char **av)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -+#ifdef HAVE_SYSTEMD<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Signal systemd t=
hat we are ready to accept connections */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sd_notify(0, &quot;=
READY=3D1&quot;);<br>
&gt; -+#endif<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Accept a co=
nnection and return in a forked child */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0server_accept_=
loop(&amp;sock_in, &amp;sock_out,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&amp;newsock, config_s);<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/openssh/sshd.service b/=
meta/recipes-connectivity/openssh/openssh/sshd.service<br>
&gt; index 3e570ab1e5..c71fff1cc1 100644<br>
&gt; --- a/meta/recipes-connectivity/openssh/openssh/sshd.service<br>
&gt; +++ b/meta/recipes-connectivity/openssh/openssh/sshd.service<br>
&gt; @@ -5,11 +5,11 @@ After=3Dsshdgenkeys.service<br>
&gt;=C2=A0 After=3Dnss-user-lookup.target<br>
&gt;<br>
&gt;=C2=A0 [Service]<br>
&gt; +Type=3Dnotify-reload<br>
&gt;=C2=A0 Environment=3D&quot;SSHD_OPTS=3D&quot;<br>
&gt;=C2=A0 EnvironmentFile=3D-/etc/default/ssh<br>
&gt;=C2=A0 ExecStartPre=3D@BASE_BINDIR@/mkdir -p /var/run/sshd<br>
&gt;=C2=A0 ExecStart=3D-@SBINDIR@/sshd -D $SSHD_OPTS<br>
&gt; -ExecReload=3D@BASE_BINDIR@/kill -HUP $MAINPID<br>
&gt;=C2=A0 KillMode=3Dprocess<br>
&gt;=C2=A0 Restart=3Don-failure<br>
&gt;=C2=A0 RestartSec=3D42s<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/openssh/sshd@.service b=
/meta/recipes-connectivity/openssh/openssh/sshd@.service<br>
&gt; index 9d9965e624..dcfec8f054 100644<br>
&gt; --- a/meta/recipes-connectivity/openssh/openssh/sshd@.service<br>
&gt; +++ b/meta/recipes-connectivity/openssh/openssh/sshd@.service<br>
&gt; @@ -3,6 +3,7 @@ Description=3DOpenSSH Per-Connection Daemon<br>
&gt;=C2=A0 After=3Dsshdgenkeys.service<br>
&gt;<br>
&gt;=C2=A0 [Service]<br>
&gt; +Type=3Dnotify-reload<br>
&gt;=C2=A0 Environment=3D&quot;SSHD_OPTS=3D&quot;<br>
&gt;=C2=A0 EnvironmentFile=3D-/etc/default/ssh<br>
&gt;=C2=A0 ExecStart=3D-@SBINDIR@/sshd -i $SSHD_OPTS<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/<a href=3D"http://opens=
sh_9.7p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.7p1.bb</a> b/me=
ta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.7p1.bb" rel=3D"=
noreferrer" target=3D"_blank">openssh_9.7p1.bb</a><br>
&gt; index 4f20616295..4680d12be5 100644<br>
&gt; --- a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.7p=
1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.7p1.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.7p=
1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.7p1.bb</a><br>
&gt; @@ -24,7 +24,7 @@ SRC_URI =3D &quot;<a href=3D"http://ftp.openbsd.org/=
pub/OpenBSD/OpenSSH/portable/openssh-$%7BPV%7D.tar" rel=3D"noreferrer" targ=
et=3D"_blank">http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-$=
{PV}.tar</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://sshd_check_keys =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-regress-ban=
ner.sh-log-input-and-output-files-on-erro.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-systemd-Add-opti=
onal-support-for-systemd-sd_notify.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-notify-systemd-o=
n-listen-and-reload.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-6387.pa=
tch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;490426f766d82a2763fcacd8d83ea3d7079=
8750c7bd2aff2e57dc5660f773ffd&quot;<br>
&gt; @@ -52,7 +52,6 @@ SYSTEMD_PACKAGES =3D &quot;${PN}-sshd&quot;<br>
&gt;=C2=A0 SYSTEMD_SERVICE:${PN}-sshd =3D &quot;${@bb.utils.contains(&#39;P=
ACKAGECONFIG&#39;,&#39;systemd-sshd-socket-mode&#39;,&#39;sshd.socket&#39;,=
 &#39;&#39;, d)} ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;,&#39;systemd-=
sshd-service-mode&#39;,&#39;sshd.service&#39;, &#39;&#39;, d)}&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit autotools-brokensep ptest pkgconfig<br>
&gt; -DEPENDS +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#=
39;systemd&#39;, &#39;systemd&#39;, &#39;&#39;, d)}&quot;<br>
&gt;<br>
&gt;=C2=A0 # systemd-sshd-socket-mode means installing sshd.socket<br>
&gt;=C2=A0 # and systemd-sshd-service-mode corresponding to sshd.service<br=
>
&gt; @@ -78,7 +77,6 @@ EXTRA_OECONF =3D &quot;&#39;LOGIN_PROGRAM=3D${base_b=
indir}/login&#39; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --syscon=
fdir=3D${sysconfdir}/ssh \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-x=
auth=3D${bindir}/xauth \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disabl=
e-strip \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.c=
ontains(&#39;DISTRO_FEATURES&#39;, &#39;systemd&#39;, &#39;--with-systemd&#=
39;, &#39;--without-systemd&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<b=
r>
&gt;<br>
&gt;=C2=A0 # musl doesn&#39;t implement wtmp/utmp and logwtmp<br>
&gt; --<br>
&gt; 2.45.2<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#202116): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/202116" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/202116</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10725258=
8/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/107252588/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000b3af6a061d6d7f48--

