Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC375C71153
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 17:12:51 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.1029.1693242762187214284
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 10:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=NL14A1i1;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1ccb6a69b13so2515711fac.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 10:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693242761; x=1693847561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpULkozVds+Qn+5Xg1PWVxEqeBPm3ybHD+txpAET6rc=;
        b=NL14A1i1vmbJO031DVbT7DQ2hW3le87gj+OpwEyGLQTdwB7l0qHx9nmeLkHEZQFMBr
         RHqJmzbn+ej6fSp872umXPQn++qtqW3v/jfxlIPdcM/Q/+DVPdiHsSHnl3vSKxmBlWT6
         XfJv4kaPhJdgWkxeAVuk//Vbj2IWB1lMh+HhO4DQghhFUyllzy5cKXDRuFHnS+m4elQW
         KBzXuoyZtK1bTARnw+caYTn83PPTh9qTS/V4HGfZkjXH+tbaReg4WGaNuqRWBLsLY0kw
         8kT2FVF3stcO+NBd7ZZmr5iDwimQsSiD2gR1Ax2YXhsXNCVH5vPeEWOpiHRn+9UECLiS
         zKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693242761; x=1693847561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpULkozVds+Qn+5Xg1PWVxEqeBPm3ybHD+txpAET6rc=;
        b=YgCwpcUrwT52R+HBJvKVbrnPY/X1zOZgyrpgTIK0j7Iu5FmOfFtrkfBmms2HMFvvyV
         eGXCcSKVLkM8kVphTClrGwDGM4zC62BjFw7TeQDPp4sOixSxEojDKypYXMGH3nCrmKFr
         3vRbby+Vi45jKlA5hueucYBVQpQgQFycZBd2KzG0O7b36Km83PfZ+3Q2jnUkuJYNFoni
         Y8YAztEe72lGHFgFBVaaHFwLoADCxtHcNSDpaP9S6I94xq+3KtOWsepjVyYO42eDGe3+
         6v7O6ryKeogJC+ZukhyFXR5T0HuDvyfL7zEAt1GIBeg5vvhs8/I2BHtTLOADvu8uAjPF
         4ewQ==
X-Gm-Message-State: AOJu0Yy9TCyR76lN9B1545KLdsXCmQB8C3U8CiWmdUZ1C7rOedFBlz7z
	8Z8g22tmarYPeK9nK0e8fbl6yQxjPYWAxqwWkVL0zky68X0bKg==
X-Google-Smtp-Source: AGHT+IEqKt9xazx1TbQKD1MqzRR1ROhKwcG/H2oBr/4RBY63Y9maLofRmgWVSfIVURQQyO2JH7js4BRHcWSHxv8ljOE=
X-Received: by 2002:a05:6870:6391:b0:1be:ec3b:3ae1 with SMTP id
 t17-20020a056870639100b001beec3b3ae1mr13310689oap.50.1693242761303; Mon, 28
 Aug 2023 10:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230828153920.3262399-1-vanusuri@mvista.com>
In-Reply-To: <20230828153920.3262399-1-vanusuri@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Aug 2023 10:12:15 -0700
Message-ID: <CAMKF1spm=4Ft_j03H9YNhHUtG1Pt=sTWaUWKLVdktmJe-S9FSQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] inetutils: Fix CVE-2023-40303
To: vanusuri@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 17:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186839

I sent a patch for master already see
https://lists.openembedded.org/g/openembedded-core/topic/patch_1_2_inetutil=
s_fix/100993486?p=3D,,,100,0,0,0::recentpostdate/sticky,,,100,2,0,100993486=
,previd%3D1693242624210149855,nextid%3D1692981851065733310&previd=3D1693242=
624210149855&nextid=3D1692981851065733310

you can send a direct backport of that for kirkstone.

On Mon, Aug 28, 2023 at 8:39=E2=80=AFAM Vijay Anusuri via
lists.openembedded.org <vanusuri=3Dmvista.com@lists.openembedded.org>
wrote:
>
> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Upstream-commit: https://git.savannah.gnu.org/cgit/inetutils.git/commit/?=
id=3De4e65c03f4c11292a3e40ef72ca3f194c8bffdd6
> & https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=3D9122999252=
c7e21eb7774de11d539748e7bdf46d
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  ...tpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch | 282 ++++++++++++++++++
>  ...03-Indent-changes-in-previous-commit.patch | 256 ++++++++++++++++
>  .../inetutils/inetutils_2.2.bb                |   2 +
>  3 files changed, 540 insertions(+)
>  create mode 100644 meta/recipes-connectivity/inetutils/inetutils/0001-CV=
E-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch
>  create mode 100644 meta/recipes-connectivity/inetutils/inetutils/0002-CV=
E-2023-40303-Indent-changes-in-previous-commit.patch
>
> diff --git a/meta/recipes-connectivity/inetutils/inetutils/0001-CVE-2023-=
40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch b/meta/recipes-connectivi=
ty/inetutils/inetutils/0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-f=
ix-ch.patch
> new file mode 100644
> index 0000000000..0f388ec424
> --- /dev/null
> +++ b/meta/recipes-connectivity/inetutils/inetutils/0001-CVE-2023-40303-f=
tpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch
> @@ -0,0 +1,282 @@
> +From e4e65c03f4c11292a3e40ef72ca3f194c8bffdd6 Mon Sep 17 00:00:00 2001
> +From: Jeffrey Bencteux <jeffbencteux@gmail.com>
> +Date: Fri, 30 Jun 2023 19:02:45 +0200
> +Subject: [PATCH] CVE-2023-40303 ftpd,rcp,rlogin,rsh,rshd,uucpd: fix: che=
ck set*id() return values
> +
> +Several setuid(), setgid(), seteuid() and setguid() return values
> +were not checked in ftpd/rcp/rlogin/rsh/rshd/uucpd code potentially
> +leading to potential security issues.
> +
> +Signed-off-by: Jeffrey Bencteux <jeffbencteux@gmail.com>
> +Signed-off-by: Simon Josefsson <simon@josefsson.org>
> +
> +Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/inetutils.g=
it/commit/?id=3De4e65c03f4c11292a3e40ef72ca3f194c8bffdd6]
> +CVE: CVE-2023-40303
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + ftpd/ftpd.c  | 10 +++++++---
> + src/rcp.c    | 39 +++++++++++++++++++++++++++++++++------
> + src/rlogin.c | 11 +++++++++--
> + src/rsh.c    | 25 +++++++++++++++++++++----
> + src/rshd.c   | 20 +++++++++++++++++---
> + src/uucpd.c  | 15 +++++++++++++--
> + 6 files changed, 100 insertions(+), 20 deletions(-)
> +
> +diff --git a/ftpd/ftpd.c b/ftpd/ftpd.c
> +index 68d41fd..703fbbc 100644
> +--- a/ftpd/ftpd.c
> ++++ b/ftpd/ftpd.c
> +@@ -865,7 +865,9 @@ end_login (struct credentials *pcred)
> +   char *remotehost =3D pcred->remotehost;
> +   int atype =3D pcred->auth_type;
> +
> +-  seteuid ((uid_t) 0);
> ++  if (seteuid ((uid_t) 0) =3D=3D -1)
> ++    _exit (EXIT_FAILURE);
> ++
> +   if (pcred->logged_in)
> +     {
> +       logwtmp_keep_open (ttyline, "", "");
> +@@ -1154,7 +1156,8 @@ getdatasock (const char *mode)
> +
> +   if (data >=3D 0)
> +     return fdopen (data, mode);
> +-  seteuid ((uid_t) 0);
> ++  if (seteuid ((uid_t) 0) =3D=3D -1)
> ++    _exit (EXIT_FAILURE);
> +   s =3D socket (ctrl_addr.ss_family, SOCK_STREAM, 0);
> +   if (s < 0)
> +     goto bad;
> +@@ -1981,7 +1984,8 @@ passive (int epsv, int af)
> +   else        /* !AF_INET6 */
> +     ((struct sockaddr_in *) &pasv_addr)->sin_port =3D 0;
> +
> +-  seteuid ((uid_t) 0);
> ++  if (seteuid ((uid_t) 0) =3D=3D -1)
> ++    _exit (EXIT_FAILURE);
> +   if (bind (pdata, (struct sockaddr *) &pasv_addr, pasv_addrlen) < 0)
> +     {
> +       if (seteuid ((uid_t) cred.uid))
> +diff --git a/src/rcp.c b/src/rcp.c
> +index 476cbaa..cd84570 100644
> +--- a/src/rcp.c
> ++++ b/src/rcp.c
> +@@ -348,14 +348,23 @@ main (int argc, char *argv[])
> +   if (from_option)
> +     {                         /* Follow "protocol", send data. */
> +       response ();
> +-      setuid (userid);
> ++
> ++      if (setuid (userid) =3D=3D -1)
> ++      {
> ++        error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() fa=
iled)");
> ++      }
> ++
> +       source (argc, argv);
> +       exit (errs);
> +     }
> +
> +   if (to_option)
> +     {                         /* Receive data. */
> +-      setuid (userid);
> ++      if (setuid (userid) =3D=3D -1)
> ++      {
> ++        error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() fa=
iled)");
> ++      }
> ++
> +       sink (argc, argv);
> +       exit (errs);
> +     }
> +@@ -540,7 +549,11 @@ toremote (char *targ, int argc, char *argv[])
> +             if (response () < 0)
> +               exit (EXIT_FAILURE);
> +             free (bp);
> +-            setuid (userid);
> ++
> ++            if (setuid (userid) =3D=3D -1)
> ++              {
> ++                error (EXIT_FAILURE, 0, "Could not drop privileges (set=
uid() failed)");
> ++              }
> +           }
> +         source (1, argv + i);
> +         close (rem);
> +@@ -633,7 +646,12 @@ tolocal (int argc, char *argv[])
> +         ++errs;
> +         continue;
> +       }
> +-      seteuid (userid);
> ++
> ++      if (seteuid (userid) =3D=3D -1)
> ++      {
> ++        error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid() f=
ailed)");
> ++      }
> ++
> + #if defined IP_TOS && defined IPPROTO_IP && defined IPTOS_THROUGHPUT
> +       sslen =3D sizeof (ss);
> +       (void) getpeername (rem, (struct sockaddr *) &ss, &sslen);
> +@@ -646,7 +664,12 @@ tolocal (int argc, char *argv[])
> + #endif
> +       vect[0] =3D target;
> +       sink (1, vect);
> +-      seteuid (effuid);
> ++
> ++      if (seteuid (effuid) =3D=3D -1)
> ++      {
> ++        error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid() f=
ailed)");
> ++      }
> ++
> +       close (rem);
> +       rem =3D -1;
> + #ifdef SHISHI
> +@@ -1444,7 +1467,11 @@ susystem (char *s, int userid)
> +       return (127);
> +
> +     case 0:
> +-      setuid (userid);
> ++      if (setuid (userid) =3D=3D -1)
> ++      {
> ++        error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() fa=
iled)");
> ++      }
> ++
> +       execl (PATH_BSHELL, "sh", "-c", s, NULL);
> +       _exit (127);
> +     }
> +diff --git a/src/rlogin.c b/src/rlogin.c
> +index bdfcfa6..2addf49 100644
> +--- a/src/rlogin.c
> ++++ b/src/rlogin.c
> +@@ -650,8 +650,15 @@ try_connect:
> +   /* Now change to the real user ID.  We have to be set-user-ID root
> +      to get the privileged port that rcmd () uses.  We now want, howeve=
r,
> +      to run as the real user who invoked us.  */
> +-  seteuid (uid);
> +-  setuid (uid);
> ++  if (seteuid (uid) =3D=3D -1)
> ++  {
> ++    error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid() faile=
d)");
> ++  }
> ++
> ++  if (setuid (uid) =3D=3D -1)
> ++  {
> ++    error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() failed=
)");
> ++  }
> +
> +   doit (&osmask);     /* The old mask will activate SIGURG and SIGUSR1!=
  */
> +
> +diff --git a/src/rsh.c b/src/rsh.c
> +index fa97e2a..6137ba7 100644
> +--- a/src/rsh.c
> ++++ b/src/rsh.c
> +@@ -279,8 +279,17 @@ main (int argc, char **argv)
> +     {
> +       if (asrsh)
> +       *argv =3D (char *) "rlogin";
> +-      seteuid (getuid ());
> +-      setuid (getuid ());
> ++
> ++      if (seteuid (getuid ()) =3D=3D -1)
> ++      {
> ++        error (EXIT_FAILURE, errno, "seteuid() failed");
> ++      }
> ++
> ++      if (setuid (getuid ()) =3D=3D -1)
> ++      {
> ++        error (EXIT_FAILURE, errno, "setuid() failed");
> ++      }
> ++
> +       execv (PATH_RLOGIN, argv);
> +       error (EXIT_FAILURE, errno, "cannot execute %s", PATH_RLOGIN);
> +     }
> +@@ -544,8 +553,16 @@ try_connect:
> +       error (0, errno, "setsockopt DEBUG (ignored)");
> +     }
> +
> +-  seteuid (uid);
> +-  setuid (uid);
> ++  if (seteuid (uid) =3D=3D -1)
> ++  {
> ++    error (EXIT_FAILURE, errno, "seteuid() failed");
> ++  }
> ++
> ++  if (setuid (uid) =3D=3D -1)
> ++  {
> ++    error (EXIT_FAILURE, errno, "setuid() failed");
> ++  }
> ++
> + #ifdef HAVE_SIGACTION
> +   sigemptyset (&sigs);
> +   sigaddset (&sigs, SIGINT);
> +diff --git a/src/rshd.c b/src/rshd.c
> +index fed6f39..f6e74b9 100644
> +--- a/src/rshd.c
> ++++ b/src/rshd.c
> +@@ -1850,8 +1850,18 @@ doit (int sockfd, struct sockaddr *fromp, socklen=
_t fromlen)
> +     pwd->pw_shell =3D PATH_BSHELL;
> +
> +   /* Set the gid, then uid to become the user specified by "locuser" */
> +-  setegid ((gid_t) pwd->pw_gid);
> +-  setgid ((gid_t) pwd->pw_gid);
> ++  if (setegid ((gid_t) pwd->pw_gid) =3D=3D -1)
> ++  {
> ++    rshd_error ("Cannot drop privileges (setegid() failed)\n");
> ++    exit (EXIT_FAILURE);
> ++  }
> ++
> ++  if (setgid ((gid_t) pwd->pw_gid) =3D=3D -1)
> ++  {
> ++    rshd_error ("Cannot drop privileges (setgid() failed)\n");
> ++    exit (EXIT_FAILURE);
> ++  }
> ++
> + #ifdef HAVE_INITGROUPS
> +   initgroups (pwd->pw_name, pwd->pw_gid);     /* BSD groups */
> + #endif
> +@@ -1873,7 +1883,11 @@ doit (int sockfd, struct sockaddr *fromp, socklen=
_t fromlen)
> +     }
> + #endif /* WITH_PAM */
> +
> +-  setuid ((uid_t) pwd->pw_uid);
> ++  if (setuid ((uid_t) pwd->pw_uid) =3D=3D -1)
> ++  {
> ++    rshd_error ("Cannot drop privileges (setuid() failed)\n");
> ++    exit (EXIT_FAILURE);
> ++  }
> +
> +   /* We'll execute the client's command in the home directory
> +    * of locuser. Note, that the chdir must be executed after
> +diff --git a/src/uucpd.c b/src/uucpd.c
> +index c8bb460..5b76390 100644
> +--- a/src/uucpd.c
> ++++ b/src/uucpd.c
> +@@ -255,7 +255,12 @@ doit (struct sockaddr *sap, socklen_t salen)
> +   snprintf (Username, sizeof (Username), "USER=3D%s", user);
> +   snprintf (Logname, sizeof (Logname), "LOGNAME=3D%s", user);
> +   dologin (pw, sap, salen);
> +-  setgid (pw->pw_gid);
> ++
> ++  if (setgid (pw->pw_gid) =3D=3D -1)
> ++  {
> ++    fprintf (stderr, "setgid() failed");
> ++    return;
> ++  }
> + #ifdef HAVE_INITGROUPS
> +   initgroups (pw->pw_name, pw->pw_gid);
> + #endif
> +@@ -264,7 +269,13 @@ doit (struct sockaddr *sap, socklen_t salen)
> +       fprintf (stderr, "Login incorrect.");
> +       return;
> +     }
> +-  setuid (pw->pw_uid);
> ++
> ++  if (setuid (pw->pw_uid) =3D=3D -1)
> ++  {
> ++    fprintf (stderr, "setuid() failed");
> ++    return;
> ++  }
> ++
> +   execl (uucico_location, "uucico", NULL);
> +   perror ("uucico server: execl");
> + }
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-connectivity/inetutils/inetutils/0002-CVE-2023-=
40303-Indent-changes-in-previous-commit.patch b/meta/recipes-connectivity/i=
netutils/inetutils/0002-CVE-2023-40303-Indent-changes-in-previous-commit.pa=
tch
> new file mode 100644
> index 0000000000..2628487ff8
> --- /dev/null
> +++ b/meta/recipes-connectivity/inetutils/inetutils/0002-CVE-2023-40303-I=
ndent-changes-in-previous-commit.patch
> @@ -0,0 +1,256 @@
> +From 70fe022f9dac760eaece0228cad17e3d29a57fb8 Mon Sep 17 00:00:00 2001
> +From: Simon Josefsson <simon@josefsson.org>
> +Date: Mon, 31 Jul 2023 13:59:05 +0200
> +Subject: [PATCH] CVE-2023-40303: Indent changes in previous commit.
> +
> +Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/inetutils.g=
it/commit/?id=3D9122999252c7e21eb7774de11d539748e7bdf46d]
> +CVE: CVE-2023-40303
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + src/rcp.c    | 42 ++++++++++++++++++++++++------------------
> + src/rlogin.c | 12 ++++++------
> + src/rsh.c    | 24 ++++++++++++------------
> + src/rshd.c   | 24 ++++++++++++------------
> + src/uucpd.c  | 16 ++++++++--------
> + 5 files changed, 62 insertions(+), 56 deletions(-)
> +
> +diff --git a/src/rcp.c b/src/rcp.c
> +index cd84570..50196c6 100644
> +--- a/src/rcp.c
> ++++ b/src/rcp.c
> +@@ -350,9 +350,10 @@ main (int argc, char *argv[])
> +       response ();
> +
> +       if (setuid (userid) =3D=3D -1)
> +-      {
> +-        error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() fa=
iled)");
> +-      }
> ++      {
> ++        error (EXIT_FAILURE, 0,
> ++               "Could not drop privileges (setuid() failed)");
> ++      }
> +
> +       source (argc, argv);
> +       exit (errs);
> +@@ -361,9 +362,10 @@ main (int argc, char *argv[])
> +   if (to_option)
> +     {                         /* Receive data. */
> +       if (setuid (userid) =3D=3D -1)
> +-      {
> +-        error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() fa=
iled)");
> +-      }
> ++      {
> ++        error (EXIT_FAILURE, 0,
> ++               "Could not drop privileges (setuid() failed)");
> ++      }
> +
> +       sink (argc, argv);
> +       exit (errs);
> +@@ -551,9 +553,10 @@ toremote (char *targ, int argc, char *argv[])
> +             free (bp);
> +
> +             if (setuid (userid) =3D=3D -1)
> +-              {
> +-                error (EXIT_FAILURE, 0, "Could not drop privileges (set=
uid() failed)");
> +-              }
> ++              {
> ++                error (EXIT_FAILURE, 0,
> ++                       "Could not drop privileges (setuid() failed)");
> ++              }
> +           }
> +         source (1, argv + i);
> +         close (rem);
> +@@ -648,9 +651,10 @@ tolocal (int argc, char *argv[])
> +       }
> +
> +       if (seteuid (userid) =3D=3D -1)
> +-      {
> +-        error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid() f=
ailed)");
> +-      }
> ++      {
> ++        error (EXIT_FAILURE, 0,
> ++               "Could not drop privileges (seteuid() failed)");
> ++      }
> +
> + #if defined IP_TOS && defined IPPROTO_IP && defined IPTOS_THROUGHPUT
> +       sslen =3D sizeof (ss);
> +@@ -666,9 +670,10 @@ tolocal (int argc, char *argv[])
> +       sink (1, vect);
> +
> +       if (seteuid (effuid) =3D=3D -1)
> +-      {
> +-        error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid() f=
ailed)");
> +-      }
> ++      {
> ++        error (EXIT_FAILURE, 0,
> ++               "Could not drop privileges (seteuid() failed)");
> ++      }
> +
> +       close (rem);
> +       rem =3D -1;
> +@@ -1468,9 +1473,10 @@ susystem (char *s, int userid)
> +
> +     case 0:
> +       if (setuid (userid) =3D=3D -1)
> +-      {
> +-        error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() fa=
iled)");
> +-      }
> ++      {
> ++        error (EXIT_FAILURE, 0,
> ++               "Could not drop privileges (setuid() failed)");
> ++      }
> +
> +       execl (PATH_BSHELL, "sh", "-c", s, NULL);
> +       _exit (127);
> +diff --git a/src/rlogin.c b/src/rlogin.c
> +index 2addf49..15d6f14 100644
> +--- a/src/rlogin.c
> ++++ b/src/rlogin.c
> +@@ -651,14 +651,14 @@ try_connect:
> +      to get the privileged port that rcmd () uses.  We now want, howeve=
r,
> +      to run as the real user who invoked us.  */
> +   if (seteuid (uid) =3D=3D -1)
> +-  {
> +-    error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid() faile=
d)");
> +-  }
> ++    {
> ++      error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid() fai=
led)");
> ++    }
> +
> +   if (setuid (uid) =3D=3D -1)
> +-  {
> +-    error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() failed=
)");
> +-  }
> ++    {
> ++      error (EXIT_FAILURE, 0, "Could not drop privileges (setuid() fail=
ed)");
> ++    }
> +
> +   doit (&osmask);     /* The old mask will activate SIGURG and SIGUSR1!=
  */
> +
> +diff --git a/src/rsh.c b/src/rsh.c
> +index 6137ba7..138d98e 100644
> +--- a/src/rsh.c
> ++++ b/src/rsh.c
> +@@ -281,14 +281,14 @@ main (int argc, char **argv)
> +       *argv =3D (char *) "rlogin";
> +
> +       if (seteuid (getuid ()) =3D=3D -1)
> +-      {
> +-        error (EXIT_FAILURE, errno, "seteuid() failed");
> +-      }
> ++      {
> ++        error (EXIT_FAILURE, errno, "seteuid() failed");
> ++      }
> +
> +       if (setuid (getuid ()) =3D=3D -1)
> +-      {
> +-        error (EXIT_FAILURE, errno, "setuid() failed");
> +-      }
> ++      {
> ++        error (EXIT_FAILURE, errno, "setuid() failed");
> ++      }
> +
> +       execv (PATH_RLOGIN, argv);
> +       error (EXIT_FAILURE, errno, "cannot execute %s", PATH_RLOGIN);
> +@@ -554,14 +554,14 @@ try_connect:
> +     }
> +
> +   if (seteuid (uid) =3D=3D -1)
> +-  {
> +-    error (EXIT_FAILURE, errno, "seteuid() failed");
> +-  }
> ++    {
> ++      error (EXIT_FAILURE, errno, "seteuid() failed");
> ++    }
> +
> +   if (setuid (uid) =3D=3D -1)
> +-  {
> +-    error (EXIT_FAILURE, errno, "setuid() failed");
> +-  }
> ++    {
> ++      error (EXIT_FAILURE, errno, "setuid() failed");
> ++    }
> +
> + #ifdef HAVE_SIGACTION
> +   sigemptyset (&sigs);
> +diff --git a/src/rshd.c b/src/rshd.c
> +index f6e74b9..cf3ee79 100644
> +--- a/src/rshd.c
> ++++ b/src/rshd.c
> +@@ -1851,16 +1851,16 @@ doit (int sockfd, struct sockaddr *fromp, sockle=
n_t fromlen)
> +
> +   /* Set the gid, then uid to become the user specified by "locuser" */
> +   if (setegid ((gid_t) pwd->pw_gid) =3D=3D -1)
> +-  {
> +-    rshd_error ("Cannot drop privileges (setegid() failed)\n");
> +-    exit (EXIT_FAILURE);
> +-  }
> ++    {
> ++      rshd_error ("Cannot drop privileges (setegid() failed)\n");
> ++      exit (EXIT_FAILURE);
> ++    }
> +
> +   if (setgid ((gid_t) pwd->pw_gid) =3D=3D -1)
> +-  {
> +-    rshd_error ("Cannot drop privileges (setgid() failed)\n");
> +-    exit (EXIT_FAILURE);
> +-  }
> ++    {
> ++      rshd_error ("Cannot drop privileges (setgid() failed)\n");
> ++      exit (EXIT_FAILURE);
> ++    }
> +
> + #ifdef HAVE_INITGROUPS
> +   initgroups (pwd->pw_name, pwd->pw_gid);     /* BSD groups */
> +@@ -1884,10 +1884,10 @@ doit (int sockfd, struct sockaddr *fromp, sockle=
n_t fromlen)
> + #endif /* WITH_PAM */
> +
> +   if (setuid ((uid_t) pwd->pw_uid) =3D=3D -1)
> +-  {
> +-    rshd_error ("Cannot drop privileges (setuid() failed)\n");
> +-    exit (EXIT_FAILURE);
> +-  }
> ++    {
> ++      rshd_error ("Cannot drop privileges (setuid() failed)\n");
> ++      exit (EXIT_FAILURE);
> ++    }
> +
> +   /* We'll execute the client's command in the home directory
> +    * of locuser. Note, that the chdir must be executed after
> +diff --git a/src/uucpd.c b/src/uucpd.c
> +index 5b76390..abbb02d 100644
> +--- a/src/uucpd.c
> ++++ b/src/uucpd.c
> +@@ -257,10 +257,10 @@ doit (struct sockaddr *sap, socklen_t salen)
> +   dologin (pw, sap, salen);
> +
> +   if (setgid (pw->pw_gid) =3D=3D -1)
> +-  {
> +-    fprintf (stderr, "setgid() failed");
> +-    return;
> +-  }
> ++    {
> ++      fprintf (stderr, "setgid() failed");
> ++      return;
> ++    }
> + #ifdef HAVE_INITGROUPS
> +   initgroups (pw->pw_name, pw->pw_gid);
> + #endif
> +@@ -271,10 +271,10 @@ doit (struct sockaddr *sap, socklen_t salen)
> +     }
> +
> +   if (setuid (pw->pw_uid) =3D=3D -1)
> +-  {
> +-    fprintf (stderr, "setuid() failed");
> +-    return;
> +-  }
> ++    {
> ++      fprintf (stderr, "setuid() failed");
> ++      return;
> ++    }
> +
> +   execl (uucico_location, "uucico", NULL);
> +   perror ("uucico server: execl");
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.2.bb b/meta/=
recipes-connectivity/inetutils/inetutils_2.2.bb
> index d8062e2b21..6f9173dbc1 100644
> --- a/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
> +++ b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
> @@ -22,6 +22,8 @@ SRC_URI =3D "${GNU_MIRROR}/inetutils/inetutils-${PV}.ta=
r.xz \
>             file://inetutils-1.9-PATH_PROCNET_DEV.patch \
>             file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch=
 \
>             file://CVE-2022-39028.patch \
> +           file://0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix=
-ch.patch \
> +           file://0002-CVE-2023-40303-Indent-changes-in-previous-commit.=
patch \
>  "
>
>  inherit autotools gettext update-alternatives texinfo
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186834): https://lists.openembedded.org/g/openembedde=
d-core/message/186834
> Mute This Topic: https://lists.openembedded.org/mt/101012524/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

