Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web12.2594.1614298582681905221
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 16:16:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jSA/uQkS;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id w19so7500332qki.13
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Feb 2021 16:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eUGuREMbWt07tG2d+RrS1kjAnB1b2z3VpzWnR09L9Oc=;
        b=jSA/uQkSqkodq2e/oN95sqc4FkO7kP2aQacy0AFR6F4+ZGS/NoRpvQqcp0YyBwPi+O
         sqlE1ymwWTBlnlFm0Wo61t66INebWuk5r7TrVh8CpLCZnWNuHfWQYdomP+rOMdqhN+Sl
         qbulKYVUJplzrBMDEH4qxLVffac2+jo6gn/0q0MCPc4jhjwB86E+AW5Wr+ekoHJrGInD
         K3tjN4sklqLo2KPIkB/Is/ynghcdtosI7deK/33mMG5uUlqNDwgHDZYe4RM6+Yj4o+Ym
         dONwzkfdxjfIs48GQl5qlaifRUTpUdic6mtfWIJ0iu9eRLrUSX6Bcw0RvGF9t7SxAhq8
         fiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eUGuREMbWt07tG2d+RrS1kjAnB1b2z3VpzWnR09L9Oc=;
        b=dBo4jLeROUo5aTywL2Lki8znfyL1VIyW4r00MZwSo4C1iICJMXNSJwDD5ZaMsu4ITG
         b7fjUwwKFQuvdqITKQgLdVjUaG+ZNadXv3LrX2xTgMiSUDCh3w6ykHAQtn8lkmvzs6rA
         xrRtKZpIfEoNeh5WbUFhnfXrfxehabZOGW+zBuXF3v+1JP+j21fcr8ST2YM6mFULH39J
         h4FPoWyobEfObC0g6NvvgXp6KXLgBo0Fo3HMrutP4MNJZOsvd3PCchxNO++R4fwGLQdY
         fKYdI7mE5kf10N+CdEFwKHBIE2jonLSPEK9eWg7oMlVO0iZY26tZDP3FTKQveYzW74zl
         VJKQ==
X-Gm-Message-State: AOAM530y1VSYUDK9l8tCVpRVzVbyGGUhG1fpw9W246+arhG6NiALCEsy
	JeSUZqcvJx4ZF6gCAfaQo5p6DLqdhZ1KiWApJS0=
X-Google-Smtp-Source: ABdhPJy59TUoO0OPRXrMyNhTGbEeFsyzdMo2wpO+uohvoIE9Nrvys0qBw1QKkV3n7MuRrx5W1CGdBjuD2haIDQancAI=
X-Received: by 2002:a37:a350:: with SMTP id m77mr330762qke.146.1614298581774;
 Thu, 25 Feb 2021 16:16:21 -0800 (PST)
MIME-Version: 1.0
References: <20210225211758.176441-1-raj.khem@gmail.com> <48564a078483f9cf2710252df2704d293e22f39d.camel@linuxfoundation.org>
In-Reply-To: <48564a078483f9cf2710252df2704d293e22f39d.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 25 Feb 2021 16:15:54 -0800
Message-ID: <CAMKF1sqdORMA1BtWzwqxFVU-9EJpx2B1QyHdGzH5RueKfjR-mQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/pam: Fix tests to work with busybox
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

yeah  I realized that it should be rather skipped when shadow and
shadow-base is missing in image
sent a v2

On Thu, Feb 25, 2021 at 1:45 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2021-02-25 at 13:17 -0800, Khem Raj wrote:
> > Distros may not use shadow for login manager
> > secondly login --help return 0 not 1 so adjust the check accordingly
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/lib/oeqa/runtime/cases/pam.py | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/lib/oeqa/runtime/cases/pam.py b/meta/lib/oeqa/runtime/cases/pam.py
> > index 271a1943e3..a61b5a881e 100644
> > --- a/meta/lib/oeqa/runtime/cases/pam.py
> > +++ b/meta/lib/oeqa/runtime/cases/pam.py
> > @@ -17,7 +17,7 @@ class PamBasicTest(OERuntimeTestCase):
> >          status, output = self.target.run('login --help')
> >          msg = ('login command does not work as expected. '
> >                 'Status and output:%s and %s' % (status, output))
> > -        self.assertEqual(status, 1, msg = msg)
> > +        self.assertEqual(status, 0, msg = msg)
>
> Surely just changing the exit status to the opposite will cause the
> autobuilder to fail this instead?
>
> Cheers,
>
> Richard
>
