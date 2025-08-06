Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49AF4C87FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 15:21:03 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.28173.1754493655573408651
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 08:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FWK3x2C0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-459ebb6bbdfso367985e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 08:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1754493654; x=1755098454; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8YFOgXRb7R6p2GkU/2q+B5dc2/zxq9OetksHJIsyB7U=;
        b=FWK3x2C0ctNcgBatFi26NjYZ5bplURK/LxscL/7vKFZEpqd0aaIgwxchGeiTdDifSZ
         ZxWThd4jNnCodODYEImjOU6+HjPy5mzIzuM0lY3kGsu+04OvPgKrcL3iSNoz4UbsetTf
         j4WEnLNks/rOzRBuMxwAogO/PXB2VVVk2EcWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754493654; x=1755098454;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8YFOgXRb7R6p2GkU/2q+B5dc2/zxq9OetksHJIsyB7U=;
        b=m2cboBBHn9pDbWm81DzgdJ32uAqIXWF3A5aFgffNaRLGWWuvNMb0l6id+aorADS0Y2
         mS2pQ53NDpqKM40T2F6AgZnxlpYFoZyuXhDUt+tRT4bSBV+VU80GP0iwMYv4s0oojLP0
         HSVZerNx1yoIakNK95baMU/vfhEBb8mzwzPdl22rnVwy//J59DyZh7UrI0PED1T6LgZO
         msHErHDvV1h8G2wG+cHuyZVHiwmtfxp5yerW52w9cguJvP6/jusjDYZto77lEcwwHduL
         +vt3pejB4gWzUPWdKcew8AVvIqOp3DoCaqIhxFhIp46isJ/EdNqj/24BO1QXI6gCh2yy
         G/zw==
X-Gm-Message-State: AOJu0YzNy1Y9F/CQr9IqBd8Rc5MJSWBbc8PGljB/ev9/cRLvLNaI6Mqr
	Br4haHIyMN9KppNQpfhTMcT7gcojckxEXfW84VlC5Z6oHMEaMHjO9pM7vWO9y+Wgyls=
X-Gm-Gg: ASbGnctsfuxuMIOzSMfrfsMpuhmS4mlry5qVvFKItoIYy7BXERjY+oWjXAMHD8DzpCU
	Vy/gf7HoavkKFHc+9kMxKCPpaUn1kt7jtZFRTilFuJoP7izMq+pnTL9kG3dPuREHlcK+/KRr3p3
	nd9syVA9LVcUCBD59+/fa/7xukKRiYuKB2WK071MXyJJjYC+DIdX2Oipc/EHoqcmjrG+mxlT9RQ
	O3XlSJ9RkNskm2/FXN9M/docM2LNCpASee6Jae0Q8oN8QHtKuc0Oj+JqdPNtgPvxXsI5mv3jorz
	5URkySgMFUmzCb7NkvItG+vSuziKuiZS27+DXP/mW0U+1CpqwC3IJR2WXi/5YOV48nU53nbiPVf
	AjhK5ftiNljDk5KVIXErVqMwjWJd70+rvE/V3MenbY4XqKqb9veAHNx9D0rEFiYKTrEjzYh8vgQ
	eNLZnjD+oZIDI=
X-Google-Smtp-Source: AGHT+IGnD5knhAzd3LDNRzxoDSlklS5hWKXqO4+b7bd6YzmmXRx96dso9ksf+kmVtq2l0bHZSmfnFA==
X-Received: by 2002:a05:600c:1c95:b0:459:dfa8:b854 with SMTP id 5b1f17b1804b1-459e70768a0mr31528355e9.5.1754493653786;
        Wed, 06 Aug 2025 08:20:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ba4d:97fb:bf3b:8a21? ([2001:8b0:aba:5f3c:ba4d:97fb:bf3b:8a21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459dc7e1ddesm128365215e9.27.2025.08.06.08.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 08:20:52 -0700 (PDT)
Message-ID: <dc49c5a116ba8f1752daee81b33d04d9ed099d4b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] glibc: Upgrade to 2.42 release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, Mathieu Dubois-Briand
	 <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 06 Aug 2025 16:20:52 +0100
In-Reply-To: <CAMKF1sr9CJ9Xy6QX+NvX3LQVjRm-2RaxCozZ_TwC48t3sWe44g@mail.gmail.com>
References: <20250729012911.2402010-1-raj.khem@gmail.com>
	 <DBVEXLB4MHYD.1JE6I46WJ5E4B@bootlin.com>
	 <CAMKF1sr9CJ9Xy6QX+NvX3LQVjRm-2RaxCozZ_TwC48t3sWe44g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 15:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221543

On Wed, 2025-08-06 at 07:32 -0700, Khem Raj via lists.openembedded.org
wrote:
> On Wed, Aug 6, 2025 at 7:26=E2=80=AFAM Mathieu Dubois-Briand
> <mathieu.dubois-briand@bootlin.com> wrote:
> >=20
> > On Tue Jul 29, 2025 at 3:29 AM CEST, Khem Raj via
> > lists.openembedded.org wrote:
> > > * GCC 12.1 or later is now required to build the GNU C Library.
> > > * GNU Binutils 2.39 or later is now required to build the GNU C
> > > Library.
> > > * Support for lightweight stack guard pages via madvise and the
> > > =C2=A0 MADV_GUARD_INSTALL flag has been added to pthread_create.
> > > * This is major release, changelog [1]
> > >=20
> > > [1]
> > > https://sourceware.org/pipermail/libc-announce/2025/000048.html
> > >=20
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> >=20
> > Hi Khem,
> >=20
> > Sorry for the delay on this patch.
> >=20
> > It looks like buildtools cannot build after this update, because of
> > ncurses-native:
> >=20
> > ERROR: ncurses-native-6.5-r0 do_install: oe_runmake failed
> > ...
> > > ** Building terminfo database, please wait...
> > ...
> > > tic: /srv/pokybuild/yocto-
> > > worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-
> > > linux/buildtools-extended-tarball/1.0/testimage-sdk/bitbake-
> > > build-sj26dmh3/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6:
> > > version `GLIBC_2.42' not found (required by /srv/pokybuild/yocto-
> > > worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-
> > > linux/buildtools-extended-tarball/1.0/testimage-sdk/bitbake-
> > > build-sj26dmh3/tmp/work/x86_64-linux/ncurses-
> > > native/6.5/build/narrowc/lib/libtinfo.so.5)
> > > ? tic could not build /srv/pokybuild/yocto-
> > > worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-
> > > linux/buildtools-extended-tarball/1.0/testimage-sdk/bitbake-
> > > build-sj26dmh3/tmp/work/x86_64-linux/ncurses-
> > > native/6.5/image/srv/pokybuild/yocto-
> > > worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-
> > > linux/buildtools-extended-tarball/1.0/testimage-sdk/bitbake-
> > > build-sj26dmh3/tmp/work/x86_64-linux/ncurses-native/6.5/recipe-
> > > sysroot-native/usr/share/terminfo
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/2179
> >=20
> > Can you have a look at these, please?
>=20
> Its reporting about glibc 2.42 versioned symbols, so I wonder if we
> need to have uninative with glibc-2.42 as well before this can build.

That would make sense, I think we'll have to build and release a new
uninative to resolve this...

Was that the only failure?

Cheers,

Richard

