Return-Path: <paul.barker@konsulko.com>
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
	[209.85.167.182])
	by mail.openembedded.org (Postfix) with ESMTP id 40C587FB11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 10:18:34 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id a67so21724745oib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 02:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=p3dkeTiUrLWSal+WlJhOUfV9m+K+1ee/vaj9cg2Xrt4=;
	b=D7Z72geHCMneBIF3CrMsfhIBqgO7nR2XT7MPvHUx5ATUASw6SNuKwZuKZnlECdJ6q9
	0Y+HdbKDU1Bs7GeT0Ds5vK6LOPf4fMqLwYOGk5HM6HQfaHmi+CT9SPaA4SV27kc9DhL6
	+DDSXv/87Y0BeXKpy63NFfdXV6dd83LEtTtyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=p3dkeTiUrLWSal+WlJhOUfV9m+K+1ee/vaj9cg2Xrt4=;
	b=IRoZoqZWda6oy9kt22Wv59bmKp/BrWc/AXHT5HOO4hiWNuj9MBjofQdeDpH9JqIDwg
	tX8WG/pgcZi3tH3GZNqPCmYmxdowg9RDqAc2SSyv7ANoGgNxn3jvCB1TAMfWS5sFhCBZ
	iBHKh2oTIHEg6tnf0rTcr1GpeENXsgayuos8tddUwGvA62s2r01J6FdIZjn9Pfle5Pyg
	mi29pO8RRXn7/yVMX5dTbavWzyJf4D76DI/C4NxjUVjHA/a9kQLTuuLXAQ65VkepE4D0
	FznfTics0eAjJJIAzGnSzdPeb3nB4WuzamIlbuiHDBnLUIar196ix8P+zHPkBpuIpdNs
	391w==
X-Gm-Message-State: APjAAAW9yFJlvDcYSMWcLZE0zkS5sTysFf2Y857QdEkeuKVjXOWl6uKI
	5+FxBbVzsm4tsomAv87ADd+PFHtc2MAivIvUt5Tm0w==
X-Google-Smtp-Source: APXvYqxpI1PEOJ2VWLKKKcykc3FyhzUH91E262aZ23GqZGTjGz0rBB4qkszHV7D1IIBrGW+uYfWwVMGW/3i7s/rOTrs=
X-Received: by 2002:aca:d985:: with SMTP id q127mr2735476oig.132.1579256314974;
	Fri, 17 Jan 2020 02:18:34 -0800 (PST)
MIME-Version: 1.0
References: <20200113130827.7409-1-maxim.uvarov@linaro.org>
	<CAM9ZRVt00houpaZaKirGYgu1w_WRm1yqoio_G-wAgdyyGwuAAg@mail.gmail.com>
	<CAD8XO3a66v27ohEbrjEC=+XanfD1Fo_zXXo9TaFYSr+C+9+jDQ@mail.gmail.com>
	<CAM9ZRVut=Wu37sJ5A8fi3be-Bm3vWYepK4Sp2x=r7Et0xoy3WA@mail.gmail.com>
	<CAD8XO3bz8S2S5LzNpJgNuOrQB__LqdWNt2-k0rn8+sdxG3UcLA@mail.gmail.com>
In-Reply-To: <CAD8XO3bz8S2S5LzNpJgNuOrQB__LqdWNt2-k0rn8+sdxG3UcLA@mail.gmail.com>
From: Paul Barker <pbarker@konsulko.com>
Date: Fri, 17 Jan 2020 10:18:24 +0000
Message-ID: <CAM9ZRVvqkd_eqnkuCsqRGwQceoiwN-XO_xWLZaN4KwTQfeNnRA@mail.gmail.com>
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] wic: fix images build in parallel
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jan 2020 10:18:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Jan 2020 at 14:12, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> On Mon, 13 Jan 2020 at 17:00, Paul Barker <pbarker@konsulko.com> wrote:
> >
> > On Mon, 13 Jan 2020 at 13:57, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > >
> > > On Mon, 13 Jan 2020 at 16:31, Paul Barker <pbarker@konsulko.com> wrote:
> > > >
> > > > On Mon, 13 Jan 2020 at 13:08, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > > > >
> > > > > OE wic plugins create temporary file with the index of the line
> > > > > tmp file name. This causes race in case several builds run in time.
> > > > > Add more entropy as timestamp to remove this race.
> > > >
> > > > How would two wic images to be built in parallel with the same work
> > > > directory? To my understanding an image recipe only supports building
> > > > a single wic image.
> > > >
> > > > Thanks,
> > > > Paul
> > >
> > > bitbake image1 image2 image3
> > > all images build .wics and use about the same files, like firmware.
> > > Issue is similar to that:
> > > https://www.yoctoproject.org/pipermail/yocto/2018-June/041373.html
> >
> > Each image has its own work directory though.
> >
> > I'll take a look in more detail later today or tomorrow, if wic is
> > writing temporary files outside of the work directory then that's a
> > bug and should be fixed.
>
> Thanks. I saw bug in rawcopy plugin. All other places were patched due
> to the same code.  I guess then for rawcopy temp files are in
> DEST_IMAGE_DIR (which is common) instead of WORKDIR.

I can't see how these files can possibly collide across parallel image
builds. In the lines you changed in your patch, cr_workdir passed in
as an argument set to imager.workdir (in
scripts/lib/wic/plugins/imager/direct.py) which is a temporary
directory created under options.outdir. image_types_wic.bbclass passes
the -o option to wic to set the outdir to something under ${WORKDIR}.
And different images have different WORKDIR paths. So things should be
safe.

Which branch & version of poky or oe-core are you using?

DEST_IMAGE_DIR is not defined in openembedded-core. Are you sure
that's the right variable name?

Could you provide full bitbake output showing the exact error message
when this collision happens?

And lastly if you want to look into this in more detail maybe add some
print statements just after each of those lines you patched to print
the full paths used so we can see if they step outside WORKDIR. I
think doing this on your side with your exact wks files that are
causing errors will give the most useful output.

Thanks,
Paul

