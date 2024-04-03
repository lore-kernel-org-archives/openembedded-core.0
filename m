Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC8ECD1288
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 15:04:07 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.13543.1712156638000323078
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 08:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZrXHdfyO;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.177, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-61545a0280dso15780937b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 08:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1712156637; x=1712761437; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EACxBbNsYsNeuycXAFy4zq/tXmvYp20NulRfqvyfTOQ=;
        b=ZrXHdfyObLOxiBYTLoX/R8oqg6vUm5mfbr3bZwd8tzZOjkNyEVyv03RxkSk2Muu8R0
         +aLxg6RfjwEkJkL1RwKZOPVu8rBB+sHUdnOTDAOuV24/fI36bsYV0tmNV/d2HcBcmXzF
         pKL2nfsLDwwNOpHy9JRrowUh/anbUkWXSVxRfh2rujzLeOOWp38d/n32JwAnhK7pisZz
         TWMxH1Y7rrlz1dkkRwCOI5eI5Y4NYNq2HtKYL+5dyyPEamAie96WMYjZnIy20f89mxTq
         qHQQq0u7otaYJqV0jXuQgq4gqsfHWKW8a021JdE1zJ78sMyv2w9H5+FmZMxRns00J50T
         suAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712156637; x=1712761437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EACxBbNsYsNeuycXAFy4zq/tXmvYp20NulRfqvyfTOQ=;
        b=kvZeBw48GsYjUrqJEL+zVJff1sZ08jrk9kCfKke95d96K8Z5w4pg5qtXmJtz1/O5bh
         32OX0gyEiMnHqujjaHdXS7RB1AUnGX+nzCAiSgI9gkBw6VWnqGTdBj64HDVc++SsAVBF
         oJojiR/GiWad9glFCcfI/wmfJ5yhl8tvUS1dYp8jLRmAXcwW15tNuP5Tkz+I6T/685nn
         CFgdZ19vvsbPGOck2/T9AOiKn1ZrQ6dEJPzPozYI5ufX9nLF3e2mHYcC5K7YNSFBCJiH
         xZph1S3kCsqSwBYHjWfzxMzDRoCiyyyrieLWrDvKYADrVku4YQX1NQ+GMZ0RFxetynDa
         g2ow==
X-Gm-Message-State: AOJu0Yysda/cZUpW7IhwzT0EA4ePwBf9ooMQIPEc5z+BHU3lrNNlZ+Z6
	cqA5NRQuqKaAtdbUVvK1gkkYui2vFLYmKDIX4L7haZun+Mo3o4VvajnYtB5Oc1OeTesvbhUHAtB
	BZG6V373hhTNEG1nbeJVRDQcaw7Cv8uyB3vmaGvtIpyYohHqZG58=
X-Google-Smtp-Source: AGHT+IHUUzSAUsom0DAfEH9YWNgZSIoLraoG9cQMWv9t4TbDmcEABOz1OIq4z1uhgRLOoaPExFbbYd8cYZaLFR8J+e4=
X-Received: by 2002:a81:bf4f:0:b0:609:ff22:1a88 with SMTP id
 s15-20020a81bf4f000000b00609ff221a88mr2875517ywk.44.1712156636898; Wed, 03
 Apr 2024 08:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240403122917.29741-1-hsimeliere.opensource@witekio.com>
In-Reply-To: <20240403122917.29741-1-hsimeliere.opensource@witekio.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 3 Apr 2024 05:03:45 -1000
Message-ID: <CAOSpxdYFc-RPDbS0ckdwXBbuoZx=b43errwou50cSWwzUkt1CQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] shadow: fix CVE-2023-4641
To: hsimeliere.opensource@witekio.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 15:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197923

On Wed, Apr 3, 2024 at 2:29=E2=80=AFAM Hugo Simeliere via
lists.openembedded.org
<hsimeliere.opensource=3Dwitekio.com@lists.openembedded.org> wrote:
>
> From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
>
> Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/=
65c88a43a23c2391dcc90c0abda3e839e9c57904]
>
> Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
> ---
>  .../shadow/files/CVE-2023-4641.patch          | 145 ++++++++++++++++++
>  meta/recipes-extended/shadow/shadow.inc       |   1 +
>  2 files changed, 146 insertions(+)
>  create mode 100644 meta/recipes-extended/shadow/files/CVE-2023-4641.patc=
h
>
> diff --git a/meta/recipes-extended/shadow/files/CVE-2023-4641.patch b/met=
a/recipes-extended/shadow/files/CVE-2023-4641.patch
> new file mode 100644
> index 0000000000..709813ab31
> --- /dev/null
> +++ b/meta/recipes-extended/shadow/files/CVE-2023-4641.patch
> @@ -0,0 +1,145 @@
> +From 51731b01fd9a608397da22b7b9164e4996f3d4c6 Mon Sep 17 00:00:00 2001
> +From: Alejandro Colomar <alx@kernel.org>
> +Date: Sat, 10 Jun 2023 16:20:05 +0200
> +Subject: [PATCH] gpasswd(1): Fix password leak
> +
> +CVE: CVE-2023-4641
> +Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit=
/65c88a43a23c2391dcc90c0abda3e839e9c57904]

Missing Signed-off-by in the patch file, please submit a V2

Thanks,

Steve

> +
> +How to trigger this password leak?
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +When gpasswd(1) asks for the new password, it asks twice (as is usual
> +for confirming the new password).  Each of those 2 password prompts
> +uses agetpass() to get the password.  If the second agetpass() fails,
> +the first password, which has been copied into the 'static' buffer
> +'pass' via STRFCPY(), wasn't being zeroed.
> +
> +agetpass() is defined in <./libmisc/agetpass.c> (around line 91), and
> +can fail for any of the following reasons:
> +
> +-  malloc(3) or readpassphrase(3) failure.
> +
> +   These are going to be difficult to trigger.  Maybe getting the system
> +   to the limits of memory utilization at that exact point, so that the
> +   next malloc(3) gets ENOMEM, and possibly even the OOM is triggered.
> +   About readpassphrase(3), ENFILE and EINTR seem the only plausible
> +   ones, and EINTR probably requires privilege or being the same user;
> +   but I wouldn't discard ENFILE so easily, if a process starts opening
> +   files.
> +
> +-  The password is longer than PASS_MAX.
> +
> +   The is plausible with physical access.  However, at that point, a
> +   keylogger will be a much simpler attack.
> +
> +And, the attacker must be able to know when the second password is being
> +introduced, which is not going to be easy.
> +
> +How to read the password after the leak?
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Provoking the leak yourself at the right point by entering a very long
> +password is easy, and inspecting the process stack at that point should
> +be doable.  Try to find some consistent patterns.
> +
> +Then, search for those patterns in free memory, right after the victim
> +leaks their password.
> +
> +Once you get the leak, a program should read all the free memory
> +searching for patterns that gpasswd(1) leaves nearby the leaked
> +password.
> +
> +On 6/10/23 03:14, Seth Arnold wrote:
> +> An attacker process wouldn't be able to use malloc(3) for this task.
> +> There's a handful of tools available for userspace to allocate memory:
> +>
> +> -  brk / sbrk
> +> -  mmap MAP_ANONYMOUS
> +> -  mmap /dev/zero
> +> -  mmap some other file
> +> -  shm_open
> +> -  shmget
> +>
> +> Most of these return only pages of zeros to a process.  Using mmap of =
an
> +> existing file, you can get some of the contents of the file demand-loa=
ded
> +> into the memory space on the first use.
> +>
> +> The MAP_UNINITIALIZED flag only works if the kernel was compiled with
> +> CONFIG_MMAP_ALLOW_UNINITIALIZED.  This is rare.
> +>
> +> malloc(3) doesn't zero memory, to our collective frustration, but all =
the
> +> garbage in the allocations is from previous allocations in the current
> +> process.  It isn't leftover from other processes.
> +>
> +> The avenues available for reading the memory:
> +> -  /dev/mem and /dev/kmem (requires root, not available with Secure Bo=
ot)
> +> -  /proc/pid/mem (requires ptrace privileges, mediated by YAMA)
> +> -  ptrace (requires ptrace privileges, mediated by YAMA)
> +> -  causing memory to be swapped to disk, and then inspecting the swap
> +>
> +> These all require a certain amount of privileges.
> +
> +How to fix it?
> +~~~~~~~~~~~~~~
> +
> +memzero(), which internally calls explicit_bzero(3), or whatever
> +alternative the system provides with a slightly different name, will
> +make sure that the buffer is zeroed in memory, and optimizations are not
> +allowed to impede this zeroing.
> +
> +This is not really 100% effective, since compilers may place copies of
> +the string somewhere hidden in the stack.  Those copies won't get zeroed
> +by explicit_bzero(3).  However, that's arguably a compiler bug, since
> +compilers should make everything possible to avoid optimizing strings
> +that are later passed to explicit_bzero(3).  But we all know that
> +sometimes it's impossible to have perfect knowledge in the compiler, so
> +this is plausible.  Nevertheless, there's nothing we can do against such
> +issues, except minimizing the time such passwords are stored in plain
> +text.
> +
> +Security concerns
> +~~~~~~~~~~~~~~~~~
> +
> +We believe this isn't easy to exploit.  Nevertheless, and since the fix
> +is trivial, this fix should probably be applied soon, and backported to
> +all supported distributions, to prevent someone else having more
> +imagination than us to find a way.
> +
> +Affected versions
> +~~~~~~~~~~~~~~~~~
> +
> +All.  Bug introduced in shadow 19990709.  That's the second commit in
> +the git history.
> +
> +Fixes: 45c6603cc86c ("[svn-upgrade] Integrating new upstream version, sh=
adow (19990709)")
> +Reported-by: Alejandro Colomar <alx@kernel.org>
> +Cc: Serge Hallyn <serge@hallyn.com>
> +Cc: Iker Pedrosa <ipedrosa@redhat.com>
> +Cc: Seth Arnold <seth.arnold@canonical.com>
> +Cc: Christian Brauner <christian@brauner.io>
> +Cc: Balint Reczey <rbalint@debian.org>
> +Cc: Sam James <sam@gentoo.org>
> +Cc: David Runge <dvzrv@archlinux.org>
> +Cc: Andreas Jaeger <aj@suse.de>
> +Cc: <~hallyn/shadow@lists.sr.ht>
> +Signed-off-by: Alejandro Colomar <alx@kernel.org>
> +---
> + src/gpasswd.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/gpasswd.c b/src/gpasswd.c
> +index 4d75af96..a698b32a 100644
> +--- a/src/gpasswd.c
> ++++ b/src/gpasswd.c
> +@@ -918,6 +918,7 @@ static void change_passwd (struct group *gr)
> +               strzero (cp);
> +               cp =3D getpass (_("Re-enter new password: "));
> +               if (NULL =3D=3D cp) {
> ++                      memzero (pass, sizeof pass);
> +                       exit (1);
> +               }
> +
> +--
> +2.42.0
> +
> diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-exten=
ded/shadow/shadow.inc
> index 2ecab5073d..c16292c38a 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -16,6 +16,7 @@ SRC_URI =3D "https://github.com/shadow-maint/shadow/rel=
eases/download/${PV}/${BP}.
>             file://shadow-relaxed-usernames.patch \
>             file://CVE-2023-29383.patch \
>             file://0001-Overhaul-valid_field.patch \
> +           file://CVE-2023-4641.patch \
>             "
>
>  SRC_URI_append_class-target =3D " \
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197916): https://lists.openembedded.org/g/openembedde=
d-core/message/197916
> Mute This Topic: https://lists.openembedded.org/mt/105307284/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

