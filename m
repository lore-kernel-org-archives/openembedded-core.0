Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B126FC87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:42:15 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.89434.1754059328917875325
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FFd+kERI;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.174, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-708d90aa8f9so23941967b3.3
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 07:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1754059328; x=1754664128; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4eXIKPxxo5wdDMtjj2PBgfIvXz40HRHJ0N+OO0hLj+s=;
        b=FFd+kERI82cPngvCsEnZ+K0TlaCQj19A/Gl3NPZ0RhPyCkpNc15OUqypnVbVHWY60c
         tT09UISSHWnCy0czMyl7Nxt+t4X1BO+qcXl3UCHUwmuQ4IVx72j81Cb8s2urlDJITAbK
         YVG1Xw0oHUWSFSQxektU5X2TDBi18KHpnp3LLTpn/hmdfMi4+FiUlgTD1HOoTxMnEmaY
         YxLW1g3SIFzrzNuJpR8Boqlse1stzLmmwKTNX6VgmFingAzh44yiR00dYb527oF/mZFl
         j3WF0Sy/aaTA8J99nhiR4evOt3sEB+1qYUhoHDmC9NmGOdeAhcRJ/lbLMIBosKkN4c8B
         ak2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754059328; x=1754664128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4eXIKPxxo5wdDMtjj2PBgfIvXz40HRHJ0N+OO0hLj+s=;
        b=CVyBtMhOnN/6zzv2v6zqqhZV6tZ0bpgT4Vgp1yI1rxLn4adeD4baiVu56uVs0q6ICw
         YNL9Sy3Grf1i9bCy3AtcamXDZCPk9ENqLVAciqnZXcAOk02XUUEAcu4JTABGA8RXAmSY
         1x7Ge/LFYi29z+O04k6W3bLZNFqCKLdK0FRKuiFzuwBEXxKtxCLB8MCQjduOXrRD90DD
         Snk5+OPanE+Dj+404/dUQFhyf+lYXu0X123CAWx1zk9p0NaJT2svbGdkzKwfP16P+A5R
         9iGO0pQ8s8APWTB/JVgzkCvgBHVHGWoJEOyzGHWXNlsr8l+6+KPWQTVoEbOhhT1f6Ske
         nC3g==
X-Gm-Message-State: AOJu0YwGNVWA4oyAICGStGAD7mZwurN7muOAI7bod0PTtSiyefTLE594
	W5Y37NIKmk+nBPY96ojiwmjGO9asWh6KeeMVzs7+G4YbBdZFnHwDFZvCDxDMfk89vivHnvBFSYp
	ZUqmlfYfSBQuTfqmLh60iWd8uiNY8/VcdXgndNfZSiA==
X-Gm-Gg: ASbGncvBM1EHLFYtl1lBPyg22k6m2gaMDm+NBFuNlvTxXoN6Rsp4KSWoqskhTI7RlLI
	sGjeErjeg9iNnpb5GNRczLvmg+LaVYOH19zz5SavP8qt/tZnh8HiJZUyYJ3hI54+trzKmMpn3q3
	TKhpyOCE8DDjl5olAi0Jw6C007CR4dCWwKBdjMXh1ZhMKONXzEPpnOZVCzQvcI8GJ2ZAl1MRVZQ
	RwlhpZEH4McgMOZti+4xBJ9kmpJ9I5SCLzMY88=
X-Google-Smtp-Source: AGHT+IFT2cUWcieKM5slLVwdu5NR++ZirWtrPfcp0svyhwfZxJkqMjoWqEq5aHc2YOwdhTV+YwPfG1zPbajJ9qyXCjo=
X-Received: by 2002:a05:690c:3505:b0:71a:3276:d6e1 with SMTP id
 00721157ae682-71a4665ac89mr158451017b3.26.1754059327783; Fri, 01 Aug 2025
 07:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250801100708.2925411-1-martin.jansa@gmail.com>
In-Reply-To: <20250801100708.2925411-1-martin.jansa@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 1 Aug 2025 07:41:57 -0700
X-Gm-Features: Ac12FXx0PIgHyitgUrkg5h0vPl5v6c5Ju9vlbKxvexh1m0H2yJo7GotHXH-cPRE
Message-ID: <CAOSpxdbjrwU2N-qYdy8+o2K3Q+XH9dn0VquQe0YSyass_PxYcA@mail.gmail.com>
Subject: Re: [scarthgap][PATCH] libpam: re-add missing libgen include
To: martin.jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org, hprajapati@mvista.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221361

Thanks Martin!

Any theories on why I didn't see this error on local or autobuilder testing=
?

Steve

On Fri, Aug 1, 2025 at 3:07=E2=80=AFAM <martin.jansa@gmail.com> wrote:
>
> From: Martin Jansa <martin.jansa@gmail.com>
>
> It was added by original commit for CVE-2025-6020-01.patch
> https://github.com/linux-pam/linux-pam/commit/475bd60c552b98c7eddb3270b0b=
4196847c0072e#diff-05f443e6acbe32a148a45648148739bf6f02f13acc5c20c6037bf933=
223d4d77
> but removed here in the rebase, causing:
>
> ../../../Linux-PAM-1.5.3/modules/pam_namespace/pam_namespace.c:326:11: er=
ror: call to undeclared function 'dirname'; ISO C99 and later do not suppor=
t implicit function declarations [-Wimplicit-function-declaration]
>   326 |         parent =3D dirname(buf);
>       |                  ^
> ../../../Linux-PAM-1.5.3/modules/pam_namespace/pam_namespace.c:326:9: err=
or: incompatible integer to pointer conversion assigning to 'char*' from 'i=
nt' [-Wint-conversion]
>   326 |         parent =3D dirname(buf);
>       |                ^ ~~~~~~~~~~~~
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  .../pam/libpam/0002-pam-namespace-rebase.patch                | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/pam/libpam/0002-pam-namespace-rebase.p=
atch b/meta/recipes-extended/pam/libpam/0002-pam-namespace-rebase.patch
> index ff5a8a4946..c57011da0b 100644
> --- a/meta/recipes-extended/pam/libpam/0002-pam-namespace-rebase.patch
> +++ b/meta/recipes-extended/pam/libpam/0002-pam-namespace-rebase.patch
> @@ -714,7 +714,7 @@ diff --git a/modules/pam_namespace/pam_namespace.h b/=
modules/pam_namespace/pam_n
>  index a991b4c..180e042 100644
>  --- a/modules/pam_namespace/pam_namespace.h
>  +++ b/modules/pam_namespace/pam_namespace.h
> -@@ -44,21 +44,16 @@
> +@@ -44,21 +44,17 @@
>   #include <stdlib.h>
>   #include <errno.h>
>   #include <syslog.h>
> @@ -728,7 +728,7 @@ index a991b4c..180e042 100644
>  -#include <sys/resource.h>
>   #include <sys/mount.h>
>   #include <sys/wait.h>
> --#include <libgen.h>
> + #include <libgen.h>
>   #include <fcntl.h>
>   #include <sched.h>
>   #include <glob.h>

