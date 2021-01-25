Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web12.1101.1611592365724932883
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 08:32:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=oC6mjv7z;
 spf=pass (domain: konsulko.com, ip: 209.85.161.41, mailfrom: paul.barker@konsulko.com)
Received: by mail-oo1-f41.google.com with SMTP id q3so3406470oog.4
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 08:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VDAzQ8yhFSBEvVd9xxSe90Tw5Mwl3jOjQHS3ul9BI4E=;
        b=oC6mjv7z4mcDFXacGCzsB8DgZi1hJJdgBbYOZNb5CvpAzgrCDPNz0IGhmefNjp6oFx
         QHBA3DqvT6WGHu4g/Qa3qImkUBKmzHf/lYypDSRDg5Qk9tu/5Af1goFQIcg7JrX86Sek
         aE2YMH3vLeeGyWyuOpa9rLAXTdya6jKcmFrfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VDAzQ8yhFSBEvVd9xxSe90Tw5Mwl3jOjQHS3ul9BI4E=;
        b=mP0fevhIUivFKae9Su2lPN6CUpOMNXLp/gKNFcLDvl3RBin9nWzGYb+BMb1r3tTEZk
         9Ho7zJ/oQLBLmb54eb07SY5TCKckCb78tDedD9/J1oeWEcJ3p6xT2pMtGCikZ45YCAS3
         CZyKoY35QzupUScEDHhdqnDG4FXwHnC8EsORKXUZufmD5GoYTdJpyXyiT5BWQGBd7uy/
         0Vln7htcV8Ni4dMeNFlmpbJKOf1GSBBrr55fO++IK2RkGJ+y6YCP/+qRHLS11ALzunpB
         rf7yy/cT4Hx2qoJ0JRiRYshwjSVhAE60jiRJFIMP8J2CNDoyKJnxZ8q2kS0cjHd9Lbkw
         1Y2w==
X-Gm-Message-State: AOAM531pyJnKi+G91ZoS0a6ZZU7jwoW8BjMDvu8EKbskjsE4kPG247il
	gu51bRlh0sHYEorZLSIuxytbsc3G2MmCVFmIKQUkSw==
X-Google-Smtp-Source: ABdhPJyKxAZI2o4llXrjPpceYBN2zQRYTgSZWgE6CcwpmnrjdnNklPbW6tuBb4CfPT0nuSdpAnbeE3pEXe9qsn4PUcU=
X-Received: by 2002:a4a:b244:: with SMTP id i4mr1025142ooo.5.1611592365055;
 Mon, 25 Jan 2021 08:32:45 -0800 (PST)
MIME-Version: 1.0
References: <cover.1611585425.git.steve@sakoman.com> <CAM9ZRVsw+VO=L6Fc4iYCtOpB1mJnqmVrt8ADfG1q4q53mt0AuA@mail.gmail.com>
 <CAOSpxdYS1zHhr43BrP970cRXKdJTY+LUDVdV7jHt=Em5qOs+DQ@mail.gmail.com>
In-Reply-To: <CAOSpxdYS1zHhr43BrP970cRXKdJTY+LUDVdV7jHt=Em5qOs+DQ@mail.gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Mon, 25 Jan 2021 16:32:34 +0000
Message-ID: <CAM9ZRVtkq1ciuL5oxjhGKTueGtk05dgF+h7V2L=RLifWvk=n5Q@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/47] Patch review - pseudo file mode corruption fix V2
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Jan 2021 at 16:25, Steve Sakoman <steve@sakoman.com> wrote:
>
> On Mon, Jan 25, 2021 at 5:42 AM Paul Barker <pbarker@konsulko.com> wrote:
> >
> > On Mon, 25 Jan 2021 at 14:51, Steve Sakoman <steve@sakoman.com> wrote:
> > >
> > > Issues with undetected file mode corruption in pseudo have been identified.
> > >
> > > Fixes have been merged into master and gatesgarth over the past several months and
> > > things seem to have stabilized enough that we can consider backporting these fixes
> > > to dunfell.
> > >
> > > This is a somewhat more invasive change than normal. Specifically the user will
> > > be required to clean TMPDIR after this merge. It may also expose issues with
> > > other layers, though master and gategarth have probably helped to pave the way for
> > > this change.
> > >
> > > Personally I think that this fixes a serious enough issue that we should consider
> > > this series for dunfell.
> > >
> > > This second version includes the wic patches which have been the gating item for
> > > merging this series.
> > >
> > > Note also that there is an associated bitbake patch for stable/1.46:
> > >
> > > lib/bb/utils.py: Do not preserve TERM in the environment
> > >
> > > This is due to taking:
> > >
> > > bitbake.conf: Remove TERM from default BB_HASHBASE_WHITELIST
> > >
> > > which was needed to do clean cherry-picks of the pseudo changes.
> >
> > If this is just brought in to allow clean cherry-picks I think it
> > would be better left out and instead do the small bit of rebasing
> > required in the patches. We don't know what downstream users are doing
> > with TERM so minimising unnecessary changes in the stable branch is
> > preferable.
>
> OK, will do.
>
> > Everything else looks good to me at a glance.
>
> Thanks for reviewing.  I'll wait for more feedback and send a v3.
> This is one series we really want to get right!

Agreed. It's a difficult balance. I want stable branches to be as
conservative as possible and not risk making breaking changes but this
series fixes an important issue (risk of silently creating images with
incorrect permissions). On balance it does make sense to backport
these pretty invasive changes.

Thanks,

-- 
Paul Barker
Konsulko Group
