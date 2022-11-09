Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40026C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 20:36:27 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.56.1668026183414301315
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 12:36:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iMRsW0Zx;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id u2so26955447ljl.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 12:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qztHh1u2vPqp8gdz5lPuh74aPuCZqMuRHaiSvNZlqeI=;
        b=iMRsW0ZxIDza2SelPmcQte8MH9OueN8b1u5MXv4zl00Co+P3d51WnNmidEVNh9F2DU
         3RCJBiXrHJ80r0nwDRn+O+8scqVGf8QvVgMGpvRjna3LDE0Y3ZOnqMvuRXCqQjuEnO8d
         YFYwLiEIrwA5xtWu8pEE8MUMkJgsTlCdJhhBuksXhQIsjvVYKamZMfG16iTOOLVq1ryJ
         An1PBmCyEUZTNzzbay94XqDVqSlFDPUIQN5h+ljiJ71MSQ3tSKaQssc6++mVDVFP682G
         MYoCyp2JFyDmkeFGgNYUDqOCdgMJR6GFw3RRfbDb4rM2QpMG8UB1XG5KB4OpYbaWDaxm
         oqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qztHh1u2vPqp8gdz5lPuh74aPuCZqMuRHaiSvNZlqeI=;
        b=WuI1nL6Oq7IwZ6DJNO/sqkTCPwQaeMwOgXQcatHG5Gmfuao4UHs2alS5GYFSgcbJYR
         PWhzudnh6d7vna5RVEWuxOmWKBkSLyCpDVZznAAOdrwAodIY5fk3TyYbyUmiimWfOVfj
         Ned2IXJj5KNXZFW49HD+htTB8RPRK0q0wOHTKlSe/xNY2xTniE5/e2tQLADj6Zhd9Vuf
         P/n7CwIOgey3DIppZlzSkFxzOd3HAki6frqOAWvUOGAK9upOqaO7nuO80tbUm8jGF9FB
         ysqHvyoscFHSt0gwU6l4NXMkqbGZrr5/Ptoc+4cYc7MRKqkGyZEOapx+Em8KQo5OGAuR
         lx4w==
X-Gm-Message-State: ACrzQf1B79xazjjoikPEtCG7kNLMtUG/qNvnntCyfzUncldkQ6x++yFx
	czXCHtWMU51TsNXePrwuQCwSF4mfueLaJv9tlL0=
X-Google-Smtp-Source: AMsMyM5SlrmpZGjxWo6rZ2pjMKBaTiHJiN2NV+HrfnPquG6frOJOl+Jm7+zXYv/VcFl061rH4jSZZ9ARrV2ubSkKYt8=
X-Received: by 2002:a2e:b0f3:0:b0:26f:c081:9aed with SMTP id
 h19-20020a2eb0f3000000b0026fc0819aedmr8007324ljl.222.1668026181542; Wed, 09
 Nov 2022 12:36:21 -0800 (PST)
MIME-Version: 1.0
References: <20221107145508.1051404-1-alex@linutronix.de> <20221107145508.1051404-46-alex@linutronix.de>
 <53c48a9347a894fd991b4faf3bfb415ae3529830.camel@linuxfoundation.org>
 <CAMKF1soCO_zcACw7+EmudmD2i=yv59_YSkOioMoFxYmOR+RcFA@mail.gmail.com> <CANNYZj_JmUq6390fnyWmSwsp=pssy23ayhBF64JeJC8GObp_Lg@mail.gmail.com>
In-Reply-To: <CANNYZj_JmUq6390fnyWmSwsp=pssy23ayhBF64JeJC8GObp_Lg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Nov 2022 21:36:10 +0100
Message-ID: <CANNYZj9zCZSr4QomT0a2SP0MagQfN+krq7K63U=eAQS5xTX5kQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 46/48] python3: use the standard shell version
 of python3-config
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 20:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173056

I've sent a couple fixes to meta-oe, and v2 of the patchset here.
Particularly, "python3: correctly adjust include paths in
sysconfigdata" is important, as somehow setuptools update made it to
master and ppl will start seeing these:
https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/6514/steps/11/logs/stdio

Alex

On Wed, 9 Nov 2022 at 13:56, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Yes, I got these to fail:
>   /srv/work/alex/meta-openembedded/meta-python/recipes-devtools/python/python3-ipy_1.01.bb:do_install
>   /srv/work/alex/meta-openembedded/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb:do_install
>   /srv/work/alex/meta-openembedded/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb:do_install
>   virtual:native:/srv/work/alex/meta-openembedded/meta-networking/recipes-protocols/frr/frr_8.3.1.bb:do_configure
>   /srv/work/alex/meta-openembedded/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb:do_compile
>   /srv/work/alex/meta-openembedded/meta-gnome/recipes-gimp/babl/babl_0.1.96.bb:do_compile
>   /srv/work/alex/meta-openembedded/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.9.1.bb:do_install
>   /srv/work/alex/meta-openembedded/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb:do_install
>   /srv/work/alex/meta-openembedded/meta-gnome/recipes-gnome/gedit/gedit_42.2.bb:do_compile
>   /srv/work/alex/meta-openembedded/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.44.0.bb:do_configure
>
> So it's not as painless as I expected, I'll look into what's wrong with these.
>
> Alex
>
> On Wed, 9 Nov 2022 at 04:47, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > I am seeing a bunch of failures perhaps related but not sure
> >
> > https://errors.yoctoproject.org/Errors/Build/154610/
> >
> > On Tue, Nov 8, 2022 at 2:59 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Mon, 2022-11-07 at 15:55 +0100, Alexander Kanavin wrote:
> > > >
> > > > +SYSROOT_PREPROCESS_FUNCS:append:class-target = " provide_target_config_script"
> > > > +SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " provide_target_config_script"
> > > > +
> > > > +provide_target_config_script() {
> > > > +        install -d ${SYSROOT_DESTDIR}${bindir}/
> > > > +        install ${D}/${bindir}/python3-config ${SYSROOT_DESTDIR}${bindir}/
> > > > +        install ${D}/${bindir}/python${PYTHON_MAJMIN}-config ${SYSROOT_DESTDIR}${bindir}/
> > > > +}
> > > > +
> > > > +
> > > >  SSTATE_SCAN_FILES += "Makefile _sysconfigdata.py"
> > > >  SSTATE_HASHEQUIV_FILEMAP = " \
> > > >      populate_sysroot:*/lib*/python3*/_sysconfigdata*.py:${TMPDIR} \
> > >
> > > This made me wonder if we shouldn't have a better way of handling this.
> > > I was wondering if we should have a sysroot_stage_file function (like
> > > sysroot_stage_dir) and then we could do something like:
> > >
> > > sysroot_stage_all:append() {
> > >         sysroot_stage_file ${D}/${bindir}/python3-config ${SYSROOT_DESTDIR}/${bindir}/python3-config
> > > }
> > >
> > > Note that the sysroot code plays with hardlinks for efficiency, I
> > > appreciate one file doesn't really matter though.
> > >
> > > I was hoping we could have just added to SYSROOT_DIRS but that does
> > > only handle dirs, not files.
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#173003): https://lists.openembedded.org/g/openembedded-core/message/173003
> > > Mute This Topic: https://lists.openembedded.org/mt/94867622/1997914
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >

