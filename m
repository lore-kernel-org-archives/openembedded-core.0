Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web12.695.1590010109008525785
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2020 14:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nqpoavMd;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id v4so3873699qte.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2020 14:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0WCjmA06tyLplol4L2CgeVfcCQ4PIGJhjVbL7NMkJr8=;
        b=nqpoavMdGoMwg3cxQcChP/XDzvu7otKvVzFspkTx6+UZYpN22PQnP/kgajNUN41xf3
         5xIG9yt1UpWkPgyfLc5nMUtuVum3rhFF9SlSxR4gul4kDO9bsFe9TuhL/S2kYFFx+gWX
         W9OOx197olXU7tIv8a7GaOWM1Mu6csdeipm69fXwqXxzKlrkU2Y20vl9BE/Md9ai5MKt
         4MNhaPXXyVJvVEZPU0CvyFyJ+Q7nsO9gJ4IypBfuMl8pqsunicnYMst0KV/Hzsggy2Dm
         TEjeAgSmzOwdPL4UyZLSn9wwnXBDiJJA7JBWEaevMw5agGWe/aiICM2uJmYwsOJqNsGf
         VpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0WCjmA06tyLplol4L2CgeVfcCQ4PIGJhjVbL7NMkJr8=;
        b=nLAsFQME5jZ3kffMTSj5zfwDSXLaEHYDoVuFbBTSajBqKVlWhDg6tD9j9rj+yyAfHT
         5moaW2F5RTK13Eoaycrd9sAjd1Q9kQzfHYWtzXJ2xR9UYcG+EgzT/gCOR+rpnnAKmXfo
         MPWGs3cS+B2codPvylccgvdPIqhVPmzZsdLLhHUL0tXFd/ul+o2cOTeO32mvK3OSy6Kd
         Ddmf88L8DN60IAMXfwCA1St3ENLyNqorScgi+lQ55p8Ic0NULmjFlHxIGt9z5fhPgSTK
         HHAKqi3BaM4PDH2LMhYsbb8cDSxkUWBDkz+DASYChuLRwIDVCdd4KxJlZfDcexZ5GdVr
         t6DQ==
X-Gm-Message-State: AOAM532ue4YsxYowi2N5fY5sAd3OFU3Z7Q4o4DXffftd6IByhw8bX4x5
	vVQpPrYW8qxgm0ZjPkfZfi5mWfa2qYHPYTUW6Nk=
X-Google-Smtp-Source: ABdhPJxttWe197kL4iESDiBgFZef9l0CSFeYleXyzFYuz0W8T/zxScr74x9qX2GYZVrh6xNloDpe1/hx4M8kFnl0Odg=
X-Received: by 2002:ac8:4a8f:: with SMTP id l15mr72598qtq.285.1590010108044;
 Wed, 20 May 2020 14:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <AM7PR05MB68813C6F4A99F236D682914CA8B90@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <4c0bdb8031119a16004ecf9aa5d1a19dc0ec397d.camel@linuxfoundation.org> <AM7PR05MB68818CD461CF14303C8BCA71A8B60@AM7PR05MB6881.eurprd05.prod.outlook.com>
In-Reply-To: <AM7PR05MB68818CD461CF14303C8BCA71A8B60@AM7PR05MB6881.eurprd05.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 20 May 2020 14:28:01 -0700
Message-ID: <CAMKF1srcK9xwVy0Nwb7V17_RQmfa_fEvF8L5cfZK5vSfGfdiMw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package_ipk.bbclass: print opkg output on error
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 20, 2020 at 1:17 PM Konrad Weihmann <kweihmann@outlook.com> wrote:
>
> On a second thought it should be bb.error not bb.fatal - are all okay
> with fixing just this one for now?

I am yes.

>
> On 20.05.20 00:02, Richard Purdie wrote:
> > On Tue, 2020-05-19 at 20:36 +0200, Konrad Weihmann wrote:
> >> in case the opkg command fails in before no output of the tool
> >> itself was printed to assist the user with debugging the issue.
> >> Print all output of the tool by using CalledProcessError wrapper around
> >> the call
> >>
> >> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> >> ---
> >>   meta/classes/package_ipk.bbclass | 11 +++++++----
> >>   1 file changed, 7 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> >> index c008559e4a..5e7d552cc5 100644
> >> --- a/meta/classes/package_ipk.bbclass
> >> +++ b/meta/classes/package_ipk.bbclass
> >> @@ -223,10 +223,13 @@ def ipk_write_pkg(pkg, d):
> >>               conffiles.close()
> >>
> >>           os.chdir(basedir)
> >> -        subprocess.check_output("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH"),
> >> -                                                          d.getVar("OPKGBUILDCMD"), pkg, pkgoutdir),
> >> -                                stderr=subprocess.STDOUT,
> >> -                                shell=True)
> >> +        try:
> >> +            subprocess.check_output("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH"),
> >> +                                                            d.getVar("OPKGBUILDCMD"), pkg, pkgoutdir),
> >> +                                    stderr=subprocess.STDOUT,
> >> +                                    shell=True)
> >> +        except subprocess.CalledProcessError as exp:
> >> +            bb.fatal("{} failed with {}: {}".format(exp.cmd, exp.returncode, exp.output.decode("utf-8")))
> >>
> >>           if d.getVar('IPK_SIGN_PACKAGES') == '1':
> >>               ipkver = "%s-%s" % (d.getVar('PKGV'), d.getVar('PKGR'))
> >
> > I get the feeling we have a problem with our subprocess calls and
> > debugging but its hard to know what to do about it. We can patch each
> > call site like this but it starts to make we wonder whether we need a
> > general wrapper, or we're missing something in bitbake or elsewhere to
> > help with things.
> >
> > There is this code:
> >
> > http://git.yoctoproject.org/cgit.cgi/poky/tree/bitbake/lib/bb/utils.py#n378
> >
> > which is meant to help but it clearly isn't helping/catching all cases.
> >
> > I think we are going to need to look at a wider/more general solution
> > or at least have a plan for one.
> >
> > Cheers,
> >
> > Richard
> >
> 
