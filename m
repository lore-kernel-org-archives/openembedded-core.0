Return-Path: <wak@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0685C25B6F
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 10:38:45 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.67551.1698316720232845238
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 03:38:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20230601 header.b=jsSGNFYs;
 spf=pass (domain: google.com, ip: 209.85.208.43, mailfrom: wak@google.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5401bab7525so1188973a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 03:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698316719; x=1698921519; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pycT4Khli3EC0UMtT7WoH+3K+tSB/oFZPz0g43S9gIc=;
        b=jsSGNFYsEabBYsAykJPMJfvVp8/hhDYSXZ6O7FfHKgs98Izv9z3m4M5ksaQk4Vym7C
         DwgpQh/x6SZ18dmN0TxLKm++rQIQwAr4m5RkKx9lSIUi4hxEpZGUkUl8oV8tz1VSDxVC
         cU9AiGJPi+3DkBRJgaEngzh2fHJcF4zKn4PHfgFOhtKPp7QyYrhYLWgiU0K7RZBpX7UC
         4T9Fwc0ZTBUKJFt8ZThoA3csB+5SaIqFcjzXymWH8o0suKz6seSwT4UR7yDFR6w2GDLW
         9CvcfOhuOeBb/OZGhzrYj/tlgel9A1GQJluSqfXGfkEVcP8MMdiseyWPlxmE8QIgM9T7
         mlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698316719; x=1698921519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pycT4Khli3EC0UMtT7WoH+3K+tSB/oFZPz0g43S9gIc=;
        b=whrX9emzJGcRXr4234zKM4ngcjde+AfR+ISSRDFLGzO46jNJ5oVaAsSWRz2LQoeUOi
         9PBjg5dR6Cc9iZ3FLW4cvPp+LwuVL2sezDhOShtg9bps5J9T36u3sSjQAlYgvliZOtyI
         WJBZYkDgVMMKAmkc33ByKRY4xFuf7+r5YB/BTYmpcK+1R+5oyXnT6paxdCWEtCgX58cc
         OaZFPrvSmPeYYTVweq+XLrqP08MoSPDqfPmD5YCpvl8cuiJ0AyCPAyX4sDXe6N7l9j1P
         4GSOZrhp9gNHRYa0/ap5vGnr+IYWtePGrbGJNg3YirmQXHciqJkbmsmxGFougJ3j6apE
         n2AQ==
X-Gm-Message-State: AOJu0YwZd5XZ1kq0P8/neSA3YA0RTEu2Lr9DbjnLl/U23UsoBctwNZy0
	DQHUC+mOiUakQqRG87hjHS4ex4b5RyGYbIw/emUD+g==
X-Google-Smtp-Source: AGHT+IEKby2NIYX50mi5wplKJ9jexNzVyrMxRNbCizEx+infcJg7ZhnC9VB+RFPg9Wjl1XhKSmjN7eq1T2nUqegRsqo=
X-Received: by 2002:a17:907:9618:b0:9be:ddad:61db with SMTP id
 gb24-20020a170907961800b009beddad61dbmr13322338ejc.56.1698316718472; Thu, 26
 Oct 2023 03:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231025223710.93502-1-wak@google.com> <CADkTA4OucgUogtX6tQ21oD6i1qQ+6qq1uJQG3S8NsChATTr3Ww@mail.gmail.com>
In-Reply-To: <CADkTA4OucgUogtX6tQ21oD6i1qQ+6qq1uJQG3S8NsChATTr3Ww@mail.gmail.com>
From: William Kennington <wak@google.com>
Date: Thu, 26 Oct 2023 03:38:25 -0700
Message-ID: <CAPnigK=VcgCH_gWUy2j3nXSngNXdc32y8FRKRiPSRU-bh57M5w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: Commit without running hooks
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 10:38:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189710

On Wed, Oct 25, 2023 at 7:08=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>
> On Wed, Oct 25, 2023 at 6:37=E2=80=AFPM William A. Kennington III via
> lists.openembedded.org <wak=3Dgoogle.com@lists.openembedded.org> wrote:
> >
> > The hooks are pulled from the impure environment and are often broken i=
n
> > our environments. There is no reason to add extra metadata or verify th=
e
> > commit message as its arbitrary to turn the tarball into a git repo.
>
> But what about the other uses of git ? If the hooks are broken during
> the creation step, other uses of git should also be broken.

The only time hooks are run is for `git commit`. AFAIK our build
process has no other invocations of `git commit`. All other git
operations work fine.

>
> We've had the ability to check the git config for quite some time, we
> could take it further an inhibit the use of the host config if we are
> worried about breakage like this.

Maybe this would be the best idea overall for our git support inside
the build system, avoiding the build user global git config. That
probably solves the issue we generally have. I'm okay either way.

>
> Bruce
>
> >
> > Signed-off-by: William A. Kennington III <wak@google.com>
> > ---
> >  meta/classes-recipe/kernel-yocto.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-re=
cipe/kernel-yocto.bbclass
> > index 4ac977b122..cb9cd26b09 100644
> > --- a/meta/classes-recipe/kernel-yocto.bbclass
> > +++ b/meta/classes-recipe/kernel-yocto.bbclass
> > @@ -408,7 +408,7 @@ do_kernel_checkout() {
> >                 git init
> >                 check_git_config
> >                 git add .
> > -               git commit -q -m "baseline commit: creating repo for ${=
PN}-${PV}"
> > +               git commit -q -n -m "baseline commit: creating repo for=
 ${PN}-${PV}"
> >                 git clean -d -f
> >         fi
> >
> > --
> > 2.42.0.820.g83a721a137-goog
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#189694): https://lists.openembedded.org/g/openembed=
ded-core/message/189694
> > Mute This Topic: https://lists.openembedded.org/mt/102189231/1050810
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

