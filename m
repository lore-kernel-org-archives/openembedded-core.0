Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25AEFC6FA82
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 15:53:24 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.540.1663861985470400700
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 08:53:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VMHKuPnB;
 spf=pass (domain: gmail.com, ip: 209.85.167.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id i26so15348143lfp.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 08:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=I5Y1mwE1BpSD7fG6Z6//kVne0mAbZGsusqoThoGDhTc=;
        b=VMHKuPnBRhahZGDSh8g83npbaSKbOVJ0ywDTl9SDBqtJdPzl3dladGPnpyBJQzrkVV
         HO32T0j1gXWR7Ms4lU0fBPL7lQS9J9eTL7r3ltfipb8aUwOUsiSgjft0S4OBw8FWIjTy
         9Gei98Zw85JPKiD+mZDU9GjjVL/0xpRDXtuFv8q18IAhr0bQnwDhMxN9F+Hq+M7gDXba
         Dl1OaZqhon0xOVSDMgzmkegoxtw6HBdqaw+6v/OQYhP/KXd1mx4XgOENxFiSMrfvBRRe
         Xlw5scG6O6N/sVhLGuP3YHaOGVLAPeyl2in9utz5/p7AlenPugZ56n3kseaQuurRWaDN
         p+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=I5Y1mwE1BpSD7fG6Z6//kVne0mAbZGsusqoThoGDhTc=;
        b=3DRxKpPmnNxbWuCQl/GGKKlTZeWlypEQ7pwjrYgb41Kk7X9RS0ZL8lfG66naC3fI4i
         k2jqMPa5mwD9xNQL3VrrhZvwTg41tFKxxHGFXYIHo9JYR46E1SsaHWY1ArMgDl7cv2/7
         I9bWlVMlEQ83+49C2prek9pf97QSNqyIyd/vvXxcysKDww85OPPJ1ExIxdBlkGY5LV+t
         DEIC/1l07lD011c05OikWfqXnhz+VvHOgypMpY6WGiV+ZNQTZWCH7op1w/6Vo68HJCuU
         OvYr3GYt/GkZvNUbpHMyyjyqPjAGJr7aHgvRffP9D6mFmYH4dn624PcdFIllB+obfL6f
         Qxyg==
X-Gm-Message-State: ACrzQf2BGgxTkzymhpi1aSI7ezcY3X7Zz0xP0uQqe82GDXADmJqX7hUH
	dW/u9fkKIDPK4VVbh+/fOGwp3v3MvKhBzDsxHnU=
X-Google-Smtp-Source: 
 AMsMyM7um6H8M4JFi3Us+Wu6NCvFAno8ihJqqyJqhoER4XknCF/bRaZMReLb3lqSMXXW8KwDCeuSzVMF4ZfNOMvDFO0=
X-Received: by 2002:a05:6512:13a4:b0:479:3b9f:f13c with SMTP id
 p36-20020a05651213a400b004793b9ff13cmr1465061lfa.380.1663861983638; Thu, 22
 Sep 2022 08:53:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220922124708.2218995-1-pkj@axis.com>
 <20220922124708.2218995-2-pkj@axis.com>
 <28947223c26b05f58c4b6cd13919b025617318a2.camel@linuxfoundation.org>
 <ee0aa31d5fa34a5ba889e3518d8b2a95@axis.com>
In-Reply-To: <ee0aa31d5fa34a5ba889e3518d8b2a95@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 22 Sep 2022 17:52:54 +0200
Message-ID: 
 <CANNYZj__Gud2xeWrtK=tZaY_BGQ2d4tVVJLfZt4R0aqzUadK-A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oe-setup-builddir: Do not hardcode invalid
 paths for templates
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 15:53:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170986

.templateconf is not the way to specify the location of custom
templates, and never was. It got added to documentation by
misunderstanding, this has now been removed, and so you need to update
your tooling so that templates are set with TEMPLATECONF going
forward.

Alex

On Thu, 22 Sept 2022 at 15:26, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Sent: den 22 september 2022 15:14
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 2/2] oe-setup-builddir: Do not hardcode invalid paths for templates
> >
> > On Thu, 2022-09-22 at 14:47 +0200, Peter Kjellerstedt wrote:
> > > Previously, the paths "meta/conf" and "meta-poky/conf" were hardcoded
> > > as invalid paths for templates. However, this is suboptimal for other
> > > distros that are setup similarly to Poky. Instead, add support for a
> > > new variable INVALID_TEMPLATECONFS, which takes a list of invalid
> > > paths.  It is expected that this variable is set in the .templateconf
> > > file together with the default value for TEMPLATECONF, typically at
> > > the same time that TEMPLATECONF is updated to match the new
> > > requirements.
> > >
> > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > ---
> > >  scripts/oe-setup-builddir | 21 +++++++++++++--------
> > >  1 file changed, 13 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> > > index 225919be92..c1148daf4f 100755
> > > --- a/scripts/oe-setup-builddir
> > > +++ b/scripts/oe-setup-builddir
> > > @@ -34,14 +34,19 @@ chmod -st "$BUILDDIR/conf" 2>/dev/null || echo "WARNING: unable to chmod $BUILDD
> > >
> > >  cd "$BUILDDIR" || die "Failed to change directory to $BUILDDIR!"
> > >
> > > -if [ -z "$TEMPLATECONF" ] && [ -f "$BUILDDIR/conf/templateconf.cfg" ]; then
> > > -    TEMPLATECONF=$(cat "$BUILDDIR/conf/templateconf.cfg")
> > > -    # The following two are no longer valid; unsetting them will automatically get them replaced
> > > -    # with correct ones.
> > > -    if [ "$TEMPLATECONF" = meta/conf ] || [ "$TEMPLATECONF" = meta-poky/conf ]; then
> > > -        unset TEMPLATECONF
> > > -        rm "$BUILDDIR/conf/templateconf.cfg"
> > > -    fi
> > > +TEMPLATECONF_CFG="$BUILDDIR/conf/templateconf.cfg"
> > > +if [ -z "$TEMPLATECONF" ] && [ -f "$TEMPLATECONF_CFG" ]; then
> > > +    TEMPLATECONF=$(cat "$TEMPLATECONF_CFG")
> > > +    # Unset TEMPLATECONF if it is set to a known invalid value to have it
> > > +    # automatically replaced with a correct one.
> > > +    for dir in $INVALID_TEMPLATECONFS; do
> > > +        if [ "$TEMPLATECONF" = "$dir" ]; then
> > > +           echo "WARNING: Removing $TEMPLATECONF_CFG as it contained the invalid value '$TEMPLATECONF'"
> > > +           unset TEMPLATECONF
> > > +           rm "$TEMPLATECONF_CFG"
> > > +      break;
> > > +        fi
> > > +    done
> > >  fi
> >
> > I've been trying to keep out this discussion but I really don't like
> > piling in more complexity and more things we have to support because of
> > a legacy code path we're trying to obsolete.
> >
> > I also suspect this is going to be used to "subvert" the move to try
> > and standardise and if that happens, we may as well not have bothered
> > making changes at all :(.
> >
> > As such I'm worried about this direction.
> >
> > Cheers,
> >
> > Richard
>
> All I want is to remove the hardcoded superficial limitations and
> allow us that provide distros setup just as Poky is setup to continue
> to do so.
>
> //Peter
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170981): https://lists.openembedded.org/g/openembedded-core/message/170981
> Mute This Topic: https://lists.openembedded.org/mt/93847437/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

