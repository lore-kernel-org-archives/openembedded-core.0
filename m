Return-Path: <paul.barker@konsulko.com>
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
	[209.85.210.43])
	by mail.openembedded.org (Postfix) with ESMTP id E0C027F827
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 12:18:04 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id h9so22293355otj.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 04:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uBvdWdtb8Lsq7CLeUbfCO0uQGje4wWfFIkg0wb5sRps=;
	b=mCWzOM5B00sa9WuP+pfj6gfoAdJG1oqtkUz9Fwiu4DjTxXCocITgxEAUmh80eqg1Gr
	dQ6cWFQ5psk7yNjEyPCCORRmAv4bdhS0VlMUXDvR33/psy2rk7U1YArcnsRdOzEmxm9H
	b+RdAs7ctF3Q+7IDbf/v9J8jJ+ywhTSZNSh9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uBvdWdtb8Lsq7CLeUbfCO0uQGje4wWfFIkg0wb5sRps=;
	b=SeXsEKFG+cdmxL+BY1hyv7TfCPofjH3gmfxAxDE97d9ycea1QqSgHh/Dm9g37vdGoh
	np68MGVghcdkySL55xctd4hjVq+NVqEERtOIItH3PR3H9spy3FAhSVky0q0yrEKz26d9
	mPuRPo09/Bhg5zNoYWaxy7KBYP+giWn49HEMG7mHAYMZGmO8VDKOyA2R1IbPPl7cULW8
	hkMFoYVvPH/JsN6sIul7RKpxA/XtG82xSxDWA1N6ohD/Gq9ObJTeRIOne/vjgEOg3qV9
	IZ8nv6rI+yBBgW1kQxR1qwjwiX3YDcWd2Kji+mSeB4V488f1c8RV19QepMNeo4zc3owh
	+jJA==
X-Gm-Message-State: APjAAAV/FKyewaH1hrwN7Bu743OoJskb1x8sBNkUvD+Q6c3D5oBWzqse
	5FmWq08n4YK7L5l3xbfwCScXSIOW9WRDHdmLn8P0cQ==
X-Google-Smtp-Source: APXvYqyi4X+YSZ355uWhAFX9EV9g85z3x9Gwmve6FkpgE+/rPya/gZJK3vTSsqSHvkWurRzQJN2bn5UWR3jPszbTtxg=
X-Received: by 2002:a05:6830:194:: with SMTP id
	q20mr6080000ota.92.1579263485855; 
	Fri, 17 Jan 2020 04:18:05 -0800 (PST)
MIME-Version: 1.0
References: <20200113130827.7409-1-maxim.uvarov@linaro.org>
	<CAM9ZRVt00houpaZaKirGYgu1w_WRm1yqoio_G-wAgdyyGwuAAg@mail.gmail.com>
	<CAD8XO3a66v27ohEbrjEC=+XanfD1Fo_zXXo9TaFYSr+C+9+jDQ@mail.gmail.com>
	<CAM9ZRVut=Wu37sJ5A8fi3be-Bm3vWYepK4Sp2x=r7Et0xoy3WA@mail.gmail.com>
	<CAD8XO3bz8S2S5LzNpJgNuOrQB__LqdWNt2-k0rn8+sdxG3UcLA@mail.gmail.com>
	<CAM9ZRVvqkd_eqnkuCsqRGwQceoiwN-XO_xWLZaN4KwTQfeNnRA@mail.gmail.com>
	<CAD8XO3aeDxrACL9Tf1ng4cR7AiUCQuqz+fjhyPKdonqZQq8Gvg@mail.gmail.com>
In-Reply-To: <CAD8XO3aeDxrACL9Tf1ng4cR7AiUCQuqz+fjhyPKdonqZQq8Gvg@mail.gmail.com>
From: Paul Barker <pbarker@konsulko.com>
Date: Fri, 17 Jan 2020 12:17:55 +0000
Message-ID: <CAM9ZRVsqxRzsndf3MDkGLHnzxDRv3aF+P8McMq96W11rDAF5_g@mail.gmail.com>
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
X-List-Received-Date: Fri, 17 Jan 2020 12:18:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Jan 2020 at 11:59, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> On Fri, 17 Jan 2020 at 13:18, Paul Barker <pbarker@konsulko.com> wrote:
> >
> > On Mon, 13 Jan 2020 at 14:12, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > >
> > > On Mon, 13 Jan 2020 at 17:00, Paul Barker <pbarker@konsulko.com> wrote:
> > > >
> > > > On Mon, 13 Jan 2020 at 13:57, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > > > >
> > > > > On Mon, 13 Jan 2020 at 16:31, Paul Barker <pbarker@konsulko.com> wrote:
> > > > > >
> > > > > > On Mon, 13 Jan 2020 at 13:08, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > > > > > >
> > > > > > > OE wic plugins create temporary file with the index of the line
> > > > > > > tmp file name. This causes race in case several builds run in time.
> > > > > > > Add more entropy as timestamp to remove this race.
> > > > > >
> > > > > > How would two wic images to be built in parallel with the same work
> > > > > > directory? To my understanding an image recipe only supports building
> > > > > > a single wic image.
> > > > > >
> > > > > > Thanks,
> > > > > > Paul
> > > > >
> > > > > bitbake image1 image2 image3
> > > > > all images build .wics and use about the same files, like firmware.
> > > > > Issue is similar to that:
> > > > > https://www.yoctoproject.org/pipermail/yocto/2018-June/041373.html
> > > >
> > > > Each image has its own work directory though.
> > > >
> > > > I'll take a look in more detail later today or tomorrow, if wic is
> > > > writing temporary files outside of the work directory then that's a
> > > > bug and should be fixed.
> > >
> > > Thanks. I saw bug in rawcopy plugin. All other places were patched due
> > > to the same code.  I guess then for rawcopy temp files are in
> > > DEST_IMAGE_DIR (which is common) instead of WORKDIR.
> >
> > I can't see how these files can possibly collide across parallel image
> > builds. In the lines you changed in your patch, cr_workdir passed in
> > as an argument set to imager.workdir (in
> > scripts/lib/wic/plugins/imager/direct.py) which is a temporary
> > directory created under options.outdir. image_types_wic.bbclass passes
> > the -o option to wic to set the outdir to something under ${WORKDIR}.
> > And different images have different WORKDIR paths. So things should be
> > safe.
> >
> > Which branch & version of poky or oe-core are you using?
> >
>
> zeus
>
> > DEST_IMAGE_DIR is not defined in openembedded-core. Are you sure
> > that's the right variable name?
> >
>
> DEPLOY_DIR_IMAGE
>
> > Could you provide full bitbake output showing the exact error message
> > when this collision happens?
>
> See traceback here:
> https://ci.linaro.org/job/ledge-oe/357/DISTRO=rpb,MACHINE=ledge-stm32mp157c-dk2,label=docker-stretch-amd64/console

I think I'm starting to understand now. Is this the wks file?
https://github.com/Linaro/meta-ledge/blob/zeus/meta-ledge-bsp/wic/ledge-stm32mp157c-dk2-optee.wks.in

>
> >
> > And lastly if you want to look into this in more detail maybe add some
> > print statements just after each of those lines you patched to print
> > the full paths used so we can see if they step outside WORKDIR. I
> > think doing this on your side with your exact wks files that are
> > causing errors will give the most useful output.
> >
>
> Is there a good way to add debug messages and see then on console,
> other then rise WicError() ?

In wic you should just be able to use print() and look in the
do_image_wic log file IIRC.

Thanks,
Paul

