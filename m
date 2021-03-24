Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.3852.1616582226636408423
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 03:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A4Eatnpv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id j20-20020a05600c1914b029010f31e15a7fso881140wmq.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 03:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=+l8RRo8YGNJk2pJdY6fmzO7NowtdrzL5JidN5A0pUko=;
        b=A4Eatnpv9s6ZzKvyc44sgut7UbeYD1BeOxWnc4487+hYjyXca46yhlQHuUWB4a1ZbM
         ajzHXgQdB3hiaGXMB/G7OLfdjO6/I0gku+4P7s/I7/YuZa60Njj4azpnV56K8uu12Gsj
         wSJRM+N9plwsJt/8FvPdnLpJ009Ss+b+C0FBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+l8RRo8YGNJk2pJdY6fmzO7NowtdrzL5JidN5A0pUko=;
        b=ajeNkN9gZW8nNwUXsWtIKRKu5Fap/X5THnXtk5bvyJMnImqqsoAocsOT/l2kDvjgsi
         l/yZ0poBNeqy1/SZDtjZOrTUeEVXO40hycw1G1Dp1DpL1jth6cY7Jjd4rsydoChZhztk
         FiAV4/+BGGAcvKpzpPaE6UsNBBwqZG2ulpRqTJCZvCBPX17Plfz5y8PDluK5kZg6MUM0
         9ENLR2QeHqgptqDLo7h9z98wUc3uDvPsGWB3d52h7vJq6Ss8Eg/uIzImlt2/Dxmb0cTW
         9aIpz9wUyBApAG+vDBKy2TzckvtFeG93zqutTjVwfLl2QKTu1ae1qTIwaj5gRxMJgd9W
         9kRg==
X-Gm-Message-State: AOAM531/627wNN8qGwpny/rvCyAmqyY6scchCDEDoRpQI0ymfuWiT4aV
	hdUPEByPDrfQcxi6777rhxB0/A==
X-Google-Smtp-Source: ABdhPJyXClAd+4wp6QOJqRv/b3SVz9930dyYoAVld1nHbGu8jFbps2QI3my92F0l/oM0uxtr7R5qKg==
X-Received: by 2002:a05:600c:2d42:: with SMTP id a2mr2228291wmg.77.1616582224977;
        Wed, 24 Mar 2021 03:37:04 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6fe3:771d:8d45:4b93? ([2001:8b0:aba:5f3c:6fe3:771d:8d45:4b93])
        by smtp.gmail.com with ESMTPSA id e6sm2606691wrw.60.2021.03.24.03.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 03:37:04 -0700 (PDT)
Message-ID: <39fe6d084810c455d0c6c31277e1d57784655501.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] bitbake.conf: ensure BUILD_* tools match target tools
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Mar 2021 10:37:03 +0000
In-Reply-To: <CAAnfSTuPcUV3FSThU_Zbs2Bn2vKJykFboGmiH+ZsOAHvj2VP0w@mail.gmail.com>
References: <20210323212814.567119-1-ross.burton@arm.com>
	 <CAJ86T=UsfzS0KMHVpyXkeL3aio9mU-9hszabKq56EBeZ+RxEuw@mail.gmail.com>
	 <CAAnfSTuPcUV3FSThU_Zbs2Bn2vKJykFboGmiH+ZsOAHvj2VP0w@mail.gmail.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-03-24 at 09:41 +0000, Ross Burton wrote:
> On Tue, 23 Mar 2021 at 21:53, Andre McCurdy <armccurdy@gmail.com> wrote:
> > > @@ -541,7 +541,10 @@ export BUILD_AR = "${BUILD_PREFIX}ar"
> > >  export BUILD_AS = "${BUILD_PREFIX}as ${BUILD_AS_ARCH}"
> > >  export BUILD_RANLIB = "${BUILD_PREFIX}ranlib"
> > >  export BUILD_STRIP = "${BUILD_PREFIX}strip"
> > > +export BUILD_OBJCOPY = "${BUILD_PREFIX}objcopy"
> > > +export BUILD_OBJDUMP = "${BUILD_PREFIX}objdump"
> > >  export BUILD_NM = "${BUILD_PREFIX}nm"
> > > +export BUILD_READELF = "${BUILD_PREFIX}readelf"
> > 
> > Do these new variables need to be exported?
> > 
> > As far as I remember a few of the BUILD_xxx variables are "official"
> > autotools variables which some autotools packages may expect to find
> > in the environment (although googling now doesn't find any
> > references).
> > 
> > If so then the rest (i.e. most of them, and certainly these newly
> > added ones) are OE specific and only used in OE recipes and classes...
> > and therefore don't need to be exported here.
> 
> It was all in the name of consistency.
> 
> The Meson cross-file sets readelf, so to mirror the new native-file
> also sets readelf.  There wasn't a BUILD_READELF and if someone is
> changing BUILD_CC there's a good chance they'll be changing the entire
> toochain, so I added any missing entries.
> 
> Yes, BUILD_* are effectively OE-specific so we could unexport the
> entire set.  I'd prefer to do that than have some exported and some
> not.

It is really hard to determine if we can unexport something so whilst I
appreciate the symmetry desire, lets not add any exports we don't need.
Exports are pretty ugly from a signatures standpoint as they have to be
added to all shell tasks.

Cheers,

Richard

