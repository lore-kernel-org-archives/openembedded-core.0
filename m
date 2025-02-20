Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9E4C021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 16:03:33 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.53444.1740067406197124145
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 08:03:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DFFTqlRb;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54529eeb38aso910385e87.2
        for <Openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 08:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740067404; x=1740672204; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Te/Em1hPzkb+pq7rsBGaoLquTuJt8KqADSws7WQhU9o=;
        b=DFFTqlRbPofnhNMZl1dj08vIF/qIsRz4ipfOFfZ45Bvpe/aqoZS8L7cZoW2r6xLi41
         C+Ww3JpQF4Jy9N1WDC/jv8SvrvnIsK6ZAhzsO97KuVmuEQUE5KmABIypvQatfATpHAB5
         x7/anae3tcO3EWjmVABfzievuQcaLCmyUDoCAYRFGkm1Tb5v6sLgfp+AJ0oVcYAz/xGn
         2HamaggUW00XTgDWDtikWY+nYyaGbQSc7msi0nl9/c9GoXwOlpvJ90arOwrD7tFFcPw6
         aG7t7nst55W0h4FCTstvpPWyUz+JyCpJFhNwwnG9koav5EF2hnl9ePgkdIpKfhhbxVyS
         AUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740067404; x=1740672204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Te/Em1hPzkb+pq7rsBGaoLquTuJt8KqADSws7WQhU9o=;
        b=rzgISipczB0YdaSW8svoOowZnxupEIOKN90Qw0Pcu8xogtWcqsXr2Ha4QSLvN1zbit
         eK/HRJVoIliG/8a8qzr8cMnUrkZIjKgQe8nKNsr+pBF7HdHcDlk9a3PDolwqpUiA9dwD
         moyuLq/mJQLfH9KZH6hPTBjvpoqZT98WolwV/agCQRKoWSCD+OIkzBDMu7Om4Atbe7gZ
         oX56FUgmRIRwvNZrHHl1mNaEKm9+brB40YMQgXbVn8WqFnk38VfoLQWk365W+k8e/lOM
         dmsQgbuxeCfETl0jKGcT5msD4RMjXqHLiea2fHm+JNHNwHBapc9hPdcHuGst+i5KfiKQ
         Hnzw==
X-Forwarded-Encrypted: i=1; AJvYcCUtT4YRILN8RiWDqqi7YzE6gwrjfjcR1Eirh0UF35Q6cfCZQKre2NtJJJRiyMv2MXi+D0PJfyHfcUyWlTJHmbsqIg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzIWLMeyeAi3Gkq1pXwpGGZK0p3L+wCUo459vfwIP06yFCF/I4q
	Lcr4rnjm7DfrKAi8bKP1YrQdHYrcUitWLmclHWW++EdV2yWml9o2pfAhhy7f3qeRUlycAUDc/H5
	TCwtLZKGBlJ013YUbv25ACjiOgSg=
X-Gm-Gg: ASbGncsB280gID8IjI7ybuq9ldDnU/uCJlTc1WBWF71G+Zr5ppzPancGzGaMDDoG6VS
	aOUC/Vm3Ig5zgKn+VGDngh9E1RmgTrVT2JlHk0li3TTINJzbxGtRf0db3xOR9D41sanv2oCRZ2r
	9r5AjQhJvKIPPL0nwbkLDP3Ran7Q==
X-Google-Smtp-Source: AGHT+IG7C0/qOjGMELMALouULeZNrr/Uhf2p+5djlHaorfo26Pc/KvldL+SKFBL+Vt1WmQ4zrDOa7kmPbLOxQVvcUqk=
X-Received: by 2002:a05:6512:e93:b0:545:2f9b:7584 with SMTP id
 2adb3069b0e04-5462ef1972emr3212699e87.36.1740067402356; Thu, 20 Feb 2025
 08:03:22 -0800 (PST)
MIME-Version: 1.0
References: <20250219103908.42513-1-uvv.mail@gmail.com> <71BF1160-E808-4212-B790-5462F95BFBA4@arm.com>
 <1825F47182B39BA0.23135@lists.openembedded.org> <ae46ffa2-b88d-4ec5-822a-08c00e2baa46@gmail.com>
In-Reply-To: <ae46ffa2-b88d-4ec5-822a-08c00e2baa46@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 20 Feb 2025 16:03:10 +0000
X-Gm-Features: AWEUYZn2xY7djCMFyWQ05uHydaV1u1tr9eDVMHrnkacJ1lQAWIWXJkJKJBL4ebU
Message-ID: <CAO5Uq5SCkF9n9ngCvcNSkHLNSPQpKxwXv+o+OfLP+VkMeq3TQA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6] systemd: Build the systemctl executable
To: uvv.mail@gmail.com
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"Openembedded-core@lists.openembedded.org" <Openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 16:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211769

On Thu, Feb 20, 2025 at 3:52=E2=80=AFPM Vyacheslav Yurkov via
lists.openembedded.org <uvv.mail=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From meta/classes-recipe/rootfs-postcommands.bbclass:
>
>      # 20:12 < mezcalero> koen: you have three options: a) run
> systemd-machine-id-setup at install time, b) have / read-only and an
> empty file there (for stateless) and c) boot with / writable
>          touch ${IMAGE_ROOTFS}${sysconfdir}/machine-id
>      fi
>
> We could think of further improvements. One thing that comes to mind is
> changing systemd-systemctl-native to systemd-tools-native and enable the
> build of systemd-machine-id-setup.
>
> Slava
>

I do know that it was a horrible thing to get right when I rewrote the
shell script in python (which I'm very glad to see the back of):

    # If we populate the systemd links we also create /etc/machine-id, whic=
h
    # allows systemd to boot with the filesystem read-only before generatin=
g
    # a real value and then committing it back.
    #
    # For the stateless configuration, where /etc is generated at runtime
    # (for example on a tmpfs), this script shouldn't run at all and we
    # allow systemd to completely populate /etc.

It may be that this behaviour was wrong in some cases, but at the same
time, I remember spending a lot of time getting this right!

Alex

> On 20.02.2025 16:33, Vyacheslav Yurkov via lists.openembedded.org wrote:
> > Isn't is supposed to be created on first boot?
> >
> > Slava
> >
> > On 20.02.2025 15:07, Ross Burton wrote:
> >> On 19 Feb 2025, at 10:39, Vyacheslav Yurkov via
> >> lists.openembedded.org <uvv.mail=3Dgmail.com@lists.openembedded.org>
> >> wrote:
> >>> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
> >>>
> >>> Instead of the python re-implementation build the actual systemctl fr=
om
> >>> the systemd source tree. The python script was used when systemd didn=
't
> >>> provide an option to build individual executables. It is possible in
> >>> the
> >>> meantime, so instead of always adapting the script when there's a new
> >>> functionality, we simply use upstream implementation.
> >> If I compare an image built with master and this, there=E2=80=99s one =
notable
> >> change in the file list:
> >>
> >> Changes to images/qemuarm64/glibc/core-image-full-cmdline
> >> (files-in-image.txt):
> >>    /etc/machine-id was removed
> >>
> >> The good news is that apart from that the final images are identical,
> >> but that change wasn=E2=80=99t expected.
> >>
> >> Ross
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211766): https://lists.openembedded.org/g/openembedde=
d-core/message/211766
> Mute This Topic: https://lists.openembedded.org/mt/111267385/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

