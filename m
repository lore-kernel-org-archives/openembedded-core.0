Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.411.1596592782697583999
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2020 18:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Qnhb9QX1;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.65, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f65.google.com with SMTP id d6so30759817ejr.5
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2020 18:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Swrt+GcnCOVBNoOvnngFStGSG33TSOoBkANuKXWNlSo=;
        b=Qnhb9QX1dEzy0GgwMheT9Z5QKVxmrL75rIua47mZucdA3zOfVP5tHJvG/4WJZhqPiX
         001w6a0bZeA9nFCwCBSAfCBcmUFE6AhctXoj2bxWk99OHuSxotBW342W1WYpG+6pv7Q1
         1jQa+ucXJAfGxdjBGG+eTw4NeZQQjQ1EYlUVZUdEYf4FhM4FpEDsnzFK6ZUxFVt1VTr8
         UQDmrFtNvfbLJB0GV/glgJ9n1GL85vEPLoLqjmEUc3BVUNcr6HASAEbVFSfphOHJ5FvV
         pyGcCcmDIRHBD1L8rO2gAuM7YrzFO0n5p7fKpxig4X2SNarWjNDydcA9ABNvmlAFw3ce
         abpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Swrt+GcnCOVBNoOvnngFStGSG33TSOoBkANuKXWNlSo=;
        b=TTcNrDOM9qTNlx3qVJL+dWXC4kEBLGYgizenrTNhODgmlQvupCsutJXKHd/jQbYFgL
         ayvi3Y/2R0F6HcD6UbaERgF9p2HmTQ7kNgvb8HdEsPlqMiqszVsjVCqPdAOtWET3/CTE
         Ix5hPSn0UqKAs4+KeCUWu85MjPjRCp74aUbcqQomd7JbEnFeQG97+ft+cAyUM4bTUvRt
         EPCqT7bPNOyht32nZEkT45vnor3ikN4GqNj8zQfim0HgtvhGHFdXQxZbc1p0vJGPNfQy
         MI6/EvdurzyybaXQS63gRkCiaENEcakJMwenmEGHx2yN19gFIQG3/Zw7Sz43gZALbtLm
         zDSw==
X-Gm-Message-State: AOAM5325szJiPgDO+y9HoSVNd34j1kNuL1jbiczogdB5iVSzWWusOSf8
	XFDB1LHckfmQory6RKMzPU3iyZdNEpBcvaQ35Sfd8A==
X-Google-Smtp-Source: ABdhPJz4hFV8o07vZW0F166ZHW7WEzW0mDEmkvJc7DEJ+msOiHps93rNTZBg+/pwoY75LLyvTuSIOdAxi2BHhh3LVdU=
X-Received: by 2002:a17:906:698:: with SMTP id u24mr958021ejb.57.1596592781112;
 Tue, 04 Aug 2020 18:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1596464561.git.steve@sakoman.com> <8f55aa8139347e8ac491002f10d1ba220430ea82.1596464561.git.steve@sakoman.com>
 <0345b07862124c6a7c14ba32284cbef88b7313d0.camel@linuxfoundation.org>
In-Reply-To: <0345b07862124c6a7c14ba32284cbef88b7313d0.camel@linuxfoundation.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 4 Aug 2020 15:59:30 -1000
Message-ID: <CAOSpxdYXuOUx6C5dRfKVMPhtJg7NKEkK2Rae6CaKyL=fEwXm2A@mail.gmail.com>
Subject: Re: [OE-core][dunfell 06/12] gtk-icon-cache.bbclass: add features_check
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 4, 2020 at 11:47 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2020-08-03 at 04:26 -1000, Steve Sakoman wrote:
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > 'bitbake world -k' when DISTRO_FEATURES don't have x11 and wayland,
> > report errors:
> > Nothing PROVIDES 'gtk+3'
> > Nothing RPROVIDES 'blueman'
> >
> > gtk+3 set ANY_OF_DISTRO_FEATURES, so add it here too
> > since we DEPENDS on it
> >
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit ab9ff563c77cd5105f4ef9426f076b10ea8e2ee8)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/classes/gtk-icon-cache.bbclass | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-
> > icon-cache.bbclass
> > index dd394af27c..340a283851 100644
> > --- a/meta/classes/gtk-icon-cache.bbclass
> > +++ b/meta/classes/gtk-icon-cache.bbclass
> > @@ -1,5 +1,10 @@
> >  FILES_${PN} += "${datadir}/icons/hicolor"
> >
> > +#gtk+3 reqiure GTK3DISTROFEATURES, DEPENDS on it make all the
> > +#recipes inherit this class require GTK3DISTROFEATURES
> > +inherit features_check
> > +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> > +
>
> Sorry, I understand now. I'd suggest we don't backport this as it
> causes problems in other layers and is probably too invasive for the
> LTS.

OK, makes sense.  I'll drop this patch from the pull request.

Steve
