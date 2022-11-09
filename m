Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE14C4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 12:56:30 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web08.2847.1667998580052875523
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 04:56:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dc9V0mDI;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id l12so14354385lfp.6
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 04:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mWnaSLds3wS2C3rZBd3IYf1x6EGO5mI+k7kGzKQJFDE=;
        b=dc9V0mDI335e06EFMqYrzrfDsH6YwPNbb27oSk3N4ybAjoSkSGkIx5yvN53M6lLj5P
         er6It6N57X5W12YeOiLEig7Z/a0nSBMfz4nT2Zbb+c0P3biWxc/14NE31Z4622/ADFIL
         8aMUc42KhHTpAT6dxFBDF0acUvtKKKWN+SYVPL3/8s1kmHH0lgVa67HJFqD+dU5oE0hx
         nrWE7tocn9PR7FJJoa/e74hd5Ojvmiq65HG3yLguYr/fnhXNBb/Qf1RQVytngu/JaeLg
         mcZys9XIzP4NS6k/XFI7L9B1mKZVuKwT4bH3TrLjWR1+exkOH4NnRmFePrQ5WRbDC8Xw
         lFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWnaSLds3wS2C3rZBd3IYf1x6EGO5mI+k7kGzKQJFDE=;
        b=A1Wne93UYUZt5hEc1Zw5al8pPrl3YcJ3aImD4R3Hy3qfmeCWlcQZ4XJzLwGHYuRKZI
         x4WLlrDoBcIgwpBYpwnLSpOIyMY6io3A3m6QT31EXk3v1jaIKg50wjUVGeTX4KhUjVRh
         VHArGc40tFi5h2Ral36Bxt/CsxdA0/8UdX4XklbZ+zStABJVV1hEuaTVvWPVtcrd+VLD
         K3qAkrBkyaWozH6k4QXW3eg+7c9R3r9YYjbfEgq/oosbcMkmsAn0bX92I6boxcYpssvH
         OSJZZt3CpDE7iEXRwJYkWXseocjXWsMIkhYgZ9WZ2NwsWushqHTd6IK2JqBjwDP+SoD3
         oDbg==
X-Gm-Message-State: ACrzQf0QBlAnPx2RwF10mrv2fHJ3PM4UzyDQtndBf6tnH7xJdgdVik+1
	K12CPychXWodLXYeIyLIsZe2KqlPmhmkHyfHTDg=
X-Google-Smtp-Source: AMsMyM4D//40ePOytDp5mjRIqVMY9znkQoFx158UJUmfj3GrGWoqUf67ic/Bn9IdozYnlPpWSfSOwBxGiDL06YMwo8c=
X-Received: by 2002:a05:6512:4016:b0:4a4:6edb:8d6e with SMTP id
 br22-20020a056512401600b004a46edb8d6emr22505374lfb.393.1667998578008; Wed, 09
 Nov 2022 04:56:18 -0800 (PST)
MIME-Version: 1.0
References: <20221107145508.1051404-1-alex@linutronix.de> <20221107145508.1051404-46-alex@linutronix.de>
 <53c48a9347a894fd991b4faf3bfb415ae3529830.camel@linuxfoundation.org> <CAMKF1soCO_zcACw7+EmudmD2i=yv59_YSkOioMoFxYmOR+RcFA@mail.gmail.com>
In-Reply-To: <CAMKF1soCO_zcACw7+EmudmD2i=yv59_YSkOioMoFxYmOR+RcFA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Nov 2022 13:56:06 +0100
Message-ID: <CANNYZj_JmUq6390fnyWmSwsp=pssy23ayhBF64JeJC8GObp_Lg@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 12:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173016

Yes, I got these to fail:
  /srv/work/alex/meta-openembedded/meta-python/recipes-devtools/python/python3-ipy_1.01.bb:do_install
  /srv/work/alex/meta-openembedded/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb:do_install
  /srv/work/alex/meta-openembedded/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb:do_install
  virtual:native:/srv/work/alex/meta-openembedded/meta-networking/recipes-protocols/frr/frr_8.3.1.bb:do_configure
  /srv/work/alex/meta-openembedded/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb:do_compile
  /srv/work/alex/meta-openembedded/meta-gnome/recipes-gimp/babl/babl_0.1.96.bb:do_compile
  /srv/work/alex/meta-openembedded/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.9.1.bb:do_install
  /srv/work/alex/meta-openembedded/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb:do_install
  /srv/work/alex/meta-openembedded/meta-gnome/recipes-gnome/gedit/gedit_42.2.bb:do_compile
  /srv/work/alex/meta-openembedded/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.44.0.bb:do_configure

So it's not as painless as I expected, I'll look into what's wrong with these.

Alex

On Wed, 9 Nov 2022 at 04:47, Khem Raj <raj.khem@gmail.com> wrote:
>
> I am seeing a bunch of failures perhaps related but not sure
>
> https://errors.yoctoproject.org/Errors/Build/154610/
>
> On Tue, Nov 8, 2022 at 2:59 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Mon, 2022-11-07 at 15:55 +0100, Alexander Kanavin wrote:
> > >
> > > +SYSROOT_PREPROCESS_FUNCS:append:class-target = " provide_target_config_script"
> > > +SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " provide_target_config_script"
> > > +
> > > +provide_target_config_script() {
> > > +        install -d ${SYSROOT_DESTDIR}${bindir}/
> > > +        install ${D}/${bindir}/python3-config ${SYSROOT_DESTDIR}${bindir}/
> > > +        install ${D}/${bindir}/python${PYTHON_MAJMIN}-config ${SYSROOT_DESTDIR}${bindir}/
> > > +}
> > > +
> > > +
> > >  SSTATE_SCAN_FILES += "Makefile _sysconfigdata.py"
> > >  SSTATE_HASHEQUIV_FILEMAP = " \
> > >      populate_sysroot:*/lib*/python3*/_sysconfigdata*.py:${TMPDIR} \
> >
> > This made me wonder if we shouldn't have a better way of handling this.
> > I was wondering if we should have a sysroot_stage_file function (like
> > sysroot_stage_dir) and then we could do something like:
> >
> > sysroot_stage_all:append() {
> >         sysroot_stage_file ${D}/${bindir}/python3-config ${SYSROOT_DESTDIR}/${bindir}/python3-config
> > }
> >
> > Note that the sysroot code plays with hardlinks for efficiency, I
> > appreciate one file doesn't really matter though.
> >
> > I was hoping we could have just added to SYSROOT_DIRS but that does
> > only handle dirs, not files.
> >
> > Cheers,
> >
> > Richard
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#173003): https://lists.openembedded.org/g/openembedded-core/message/173003
> > Mute This Topic: https://lists.openembedded.org/mt/94867622/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

