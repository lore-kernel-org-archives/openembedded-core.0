Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.11149.1612881630706225537
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 06:40:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=b/2/2viT;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.50, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f50.google.com with SMTP id q7so22099156wre.13
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 06:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x43Rsec69MLiXAm6S7dXRgYXd95duaSq+LkLAHickNA=;
        b=b/2/2viTkisPv/ozDMzh8bbB8htys6CKGX2nD9oMo+i/7Dil/F5fIYzOjxOhJzRqhy
         YaeLGmhmmveQ3sSQViFnUHAOmPrpCnjsjflMB2XL8tgf8IB0ZLIr/sKkvvY5f1quoeYN
         1tohTyZYzZk26Uvjq3HZNooL+y5nGAlp+cgs70jAMuj+xkUkTHuLe0v4sq0EffPFFeRD
         OC7DyYyZTcOToYjPubOxdw0YHZFbXa10WIZoKkgJuAdZAYNin0ZlISlxfUB3SV6LuESg
         VjHjymrhRT1pmRHdZYPYMXET2H7Y2H+8LDDwiDAbn6p8CiZokdAFaZvuWtO0IEcB+kKE
         Rw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x43Rsec69MLiXAm6S7dXRgYXd95duaSq+LkLAHickNA=;
        b=B9nC7uymCPuATxkeILXnElFI/BCzUrbV6/d2m2JYPLAUL6/l5QeF7rxw1Cbs1n/skT
         n0A11znM7GQJGR3CKtd3FSJMPec60JukDqtS628+qQSufFu/8fdslk9r3JFi5Z9w7Yq5
         H8SUAMIMz0Q0QR2Ptgou4qgVRZJueFdI82yKk0H1cHWb8bko+VamrYh66GA/oeuv9wiK
         ruDFBiORbCoxt1O2gRXOrqhlBxZONKzIzbLcgtUZcOmMAUjSS+uPlz+AvUtlVqDYZ95m
         YRbm+ntIFpUmodAa7CdTqYzvfzDaaLO114KI9Fmyp97WPWXsn8VJSopJPKwt+pF1ngML
         h81Q==
X-Gm-Message-State: AOAM530tXz+i9eljwRJJkHkj/4sNvNMl1CGTDXeXa+QwvZcnwpDFeUec
	oRV103GUFxp5w8wBtGqVG4W+3pQtwV5/SKMLdQ3w8Q==
X-Google-Smtp-Source: ABdhPJwhBniuqJwtAiTP6YOVlugeInTk40+lMrrqMzR1NXCLDGGi4dfcJCnyyFErZ45vKIeMxxK9JuF4DfO1e2+2OEc=
X-Received: by 2002:adf:e5c6:: with SMTP id a6mr26096539wrn.400.1612881629282;
 Tue, 09 Feb 2021 06:40:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1612792088.git.steve@sakoman.com> <bc1f08f0202b1ea3780b72dc9b2e7bc339581fcc.1612792088.git.steve@sakoman.com>
 <efcd1bc6ff5c0f4ec4b6111d51b292c629b2ce58.camel@linuxfoundation.org>
In-Reply-To: <efcd1bc6ff5c0f4ec4b6111d51b292c629b2ce58.camel@linuxfoundation.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 9 Feb 2021 04:40:17 -1000
Message-ID: <CAOSpxdbL_s8kENSEXyez036pdEJ5wSR8GaYccy-ZHcvO+U2jVA@mail.gmail.com>
Subject: Re: [OE-core][dunfell 23/28] opkg: Fix build reproducibility issue
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 9, 2021 at 4:34 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2021-02-08 at 03:52 -1000, Steve Sakoman wrote:
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > A build date was leaking into the generated docs and makefile used for
> > ptests leading to reproducibility issues each time the month changed.
> >
> > Add a patch to use SOURCE_DATE_EPOCH to derive it if available.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 6a9ca7aec4991eabd425e32fdf85f51bb1686b8b)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  .../opkg/opkg/sourcedateepoch.patch           | 25 +++++++++++++++++++
> >  meta/recipes-devtools/opkg/opkg_0.4.2.bb      |  1 +
> >  2 files changed, 26 insertions(+)
> >  create mode 100644 meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
>
> I'd hold this one until I get the patch fixed...

Got it!  I'll remove from the pull request and wait till I see your
fix to resubmit.

Steve
