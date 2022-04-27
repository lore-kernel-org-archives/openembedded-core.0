Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67474C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 16:54:23 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web09.222.1651078462437659288
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 09:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OQl/tvGt;
 spf=pass (domain: gmail.com, ip: 209.85.208.171,
 mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id bn33so3456107ljb.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 09:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fX3HRGtucn8oyRC8t5nqUXA/7n9ZqgQ1Osm2xBGHP58=;
        b=OQl/tvGtYi6jdkJZmj2a09cvdhZYbRjd7ssO1DEAUeTFfse+eEW0tCR65Bp5w8yPCX
         YAW8SKZsINthYB9+2mcd5+KNJpNPqNR1dQvGpBL01qS2EEoD2jrKJq/fy0rR5VNcTK0Z
         dxpkNmh4Q4P4mp8/a5Yx7hlcqR6PQFy9uPsDrY+tJeUlij9qsk+JlxYlEXIrQFUaBZfr
         Iublie0nDwtiVIpYgeHKEow43vxk3Y2i9EZ3ioUVvIeYceUzxYft2XlhXl7jgMjMgtQM
         1xyZK7/E/S9hlccIvgVp46jfnt/ci7XqiOUcAW8lf21+jF6kT6TBNjmT1TxLFhdnC7Hq
         jElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fX3HRGtucn8oyRC8t5nqUXA/7n9ZqgQ1Osm2xBGHP58=;
        b=1AJ1ItSCka2etyjLGR0Cqy2t2SR3No+Pbi6dW5xN+Gq1MUedD+4UwAdy+bxtohH4bm
         DEMEOz48CVkRclZjgAvRAeWKubPrZdr3JOvIeRFogJ8DdRCk04x47mbqYaohybnfMNps
         W4kAhEqU0TW4Vv2WQasa4Ir9pbcbue4Ogpa+/pM3V9T8p+Xi1SnfSMbMiEzuylwWQDeH
         cY6MMm9LToSTUFSLr1MARjdREyXcWtANnW3GEwxn0Chbf9PGqyjk9iIRzTqXr0/DMVWf
         Aljls5uxdf6Kn/qWnSUzFRHWkEy2xdtNHfIy5TyLoP5AMGyWul0FoN8/bYl64mJ7S52v
         z05Q==
X-Gm-Message-State: AOAM533iuf6g4sJdZoSMFB4RcQXIjNtGoYJ6VZIpU4Ob4whAfC1KJumh
	1o+icirzXbe42kU6psPXyt/VO/V0BziLWdhp1fk=
X-Google-Smtp-Source: 
 ABdhPJxiISeFHE076OuHw4MdJtvyRFzlrhXhklC9jPv6kAm3Po5lDDltxgCDdAistLQ8wnt7RvODZY5CYq1zNRtY1mU=
X-Received: by 2002:a2e:3c1a:0:b0:24d:b349:76d2 with SMTP id
 j26-20020a2e3c1a000000b0024db34976d2mr18548102lja.214.1651078460504; Wed, 27
 Apr 2022 09:54:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220426194618.218353-1-nicolas.dechesne@linaro.org>
 <CAJ86T=XZLytHs3yQxezF59+UbJnKPUsqJwqY0Cs8HTAqWoYRuQ@mail.gmail.com>
 <CAMKF1srtoJ018V4x3nX2CQ+77DfLgnN2-KizL1Zfje2e-wUEFQ@mail.gmail.com>
 <CAJ86T=WOttBz2W-xWD=dEP36FredBqzjEC3d+sF_ciUX_aCS1w@mail.gmail.com>
 <c57ed8a714da34b9649a49e823a304e99dc6b7a8.camel@linuxfoundation.org>
In-Reply-To: 
 <c57ed8a714da34b9649a49e823a304e99dc6b7a8.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 27 Apr 2022 09:54:03 -0700
Message-ID: 
 <CAJ86T=XjdWroxsPB90ccptODqCNwnue9o2JdNznATWQJk7v+Aw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity: skip make 4.2.1 warning for debian
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>,
	chris_larson <chris_larson@mentor.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 16:54:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164929

On Wed, Apr 27, 2022 at 3:40 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2022-04-26 at 14:39 -0700, Andre McCurdy wrote:
> > On Tue, Apr 26, 2022 at 1:56 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Tue, Apr 26, 2022 at 1:51 PM Andre McCurdy <armccurdy@gmail.com> wrote:
> > > >
> > > > On Tue, Apr 26, 2022 at 12:46 PM Nicolas Dechesne
> > > > <nicolas.dechesne@linaro.org> wrote:
> > > > >
> > > > > This is a follow up patch of:
> > > > > ad5829aa1f8a (sanity: Show a warning that make 4.2.1 is buggy on non-ubuntu systems)
> > > > >
> > > > > Debian10 has the exact same version/sources for make as Ubuntu
> > > > > (focal), e.g. https://packages.debian.org/source/buster/make-dfsg and
> > > > > https://packages.ubuntu.com/source/focal/make-dfsg.
> > > > >
> > > > > As per the corresponding changelog, the patch mentioned in
> > > > > ad5829aa1f8a, is included in both Debian and Ubuntu in make
> > > > > 4.2.1-1.1. So it's safe to use make 4.2.1 in Debian10.
> > > > >
> > > > > Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> > > > > ---
> > > > >  meta/classes/sanity.bbclass | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> > > > > index c385d92e8b..c72a7b3ed3 100644
> > > > > --- a/meta/classes/sanity.bbclass
> > > > > +++ b/meta/classes/sanity.bbclass
> > > > > @@ -470,7 +470,7 @@ def check_make_version(sanity_data):
> > > > >
> > > > >      if bb.utils.vercmp_string_op(version, "4.2.1", "=="):
> > > > >          distro = oe.lsb.distro_identifier()
> > > >
> > > > Not directly related to your change, but shouldn't this be
> > > > lsb_distro_identifier() instead of oe.lsb.distro_identifier()?
> > >
> > > lsb_distro_identifier would work when it is inheriting base.bbclass
> > > otherwise the utility function is needed.
> >
> > Question isn't really whether it will work or not (if it doesn't work,
> > we should make it work) but rather whether any user-defined
> > LSB_DISTRO_ADJUST should be applied before checking if the host distro
> > is based on Debian/Ubuntu or not.
>
> It would help to be a little more specific with the background. Having looked at
> the code, we have two lsb functions, one in base.bbclass and one in
> oe/lib/lsb.py. The one in base.bbclass is a wrapper which uses
> LSB_DISTRO_ADJUST.
>
> As far as I know, we don't use LSB_DISTRO_ADJUST in core at all. I suspect it
> should really probably be added to the lsb.py function in most cases. Is there
> any documentation or other info about when it should be applied and when it
> should not?

Adding LSB_DISTRO_ADJUST directly to lsb.py would be fine I think.
Personally I use LSB_DISTRO_ADJUST to map Linux Mint to Ubuntu. Linux
Mint is binary compatible with Ubuntu (created from Ubuntu package
feeds). The LSB_DISTRO_ADJUST mapping allows native sstate from a
build server running Ubuntu to be reused on a developer laptop running
Linux Mint.

  https://github.com/lgirdk/meta-mng/blob/ofw/conf/distro/include/mng-sstate.inc

If the make 4.2.1 sanity check were to include LSB_DISTRO_ADJUST then
(for me at least) it would suppress unnecessary warnings when running
on Linux Mint (ie with the Ubuntu version of make). But in general, if
we give users a method to adjust how their host distro is identified
then we should enable it consistently unless there's a clear reason
not to.

