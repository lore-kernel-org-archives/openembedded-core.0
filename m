Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD00D1118D
	for <webhook@archiver.kernel.org>; Sun,  3 Nov 2024 18:35:17 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.41268.1730658915063956361
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Nov 2024 10:35:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MPTiMQOG;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20c70abba48so29827605ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Nov 2024 10:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730658914; x=1731263714; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IZsPk6kzzTDInW0aKKx+5wePeK3+NJv2CtmE7dlJ5bU=;
        b=MPTiMQOG0OT+gKrxHX5NcTjR/H+AXWM1+o0ype8cKj8RKyBcLSrMQNFmQd5EZCX8dm
         m+iSM2XNtHHP0MUzGXAh7rz4Wm2r8AUAiu6+ngi1DIWIwystcEp3a+sIsrrasxVSZLl9
         JcLe1l9oEfLcyZq6sG1X14JHYWBxyxgCwQJfGs+sVDE7QpSVUQMkBMemrxc+ulZvitwa
         gzN4K8u1XpYdhtWd7J0s1rCaGEOzx3rxXLNskSRnib1umC437RceuUM2HG8IqQp29MUw
         Tv+vpogJz+JuRNbp8UUumd5K3BMBZZxTkCKVIl9WEertLEcoGF/f2skB8ie7vOurxLc8
         W5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730658914; x=1731263714;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IZsPk6kzzTDInW0aKKx+5wePeK3+NJv2CtmE7dlJ5bU=;
        b=wOljSwGgBsaFHA5pFgZM1oRbTmkLAUswLH+IkuafVTZ1S3IXH1WtH/9jd3uwZHyEpP
         a/ienrnxNf3TVCSpZPd4dx+pb7egGSXixBSW8dj73c2kkgrn3Z244os63N6dbfq8VtRb
         nExgb4aN9KTil/bws/DNYvDv0px/jg7CY+RQA8HRFg72WvTaVXHOIr9i7qSzvn6dEgXP
         9A24F7UMnk0RxNemwixFpSV+QiOy21Iy+cIKbvM73gYLJHLfi8raOBY94d11B3MLeb7p
         z0e2EmVms+Y/GFz54KdrK0UWAQy3//4cdgcEjVms/dptW1MC81BXySo23X4aopgtsHs4
         mjmA==
X-Gm-Message-State: AOJu0YxuordwKuvDf1x1v2X6CozMHcBh4aPORYhPqOOZEMoIUbfdZC6j
	Ao0EytPg8gAgsTx0upbMofI2A1/ctFBQK/rXs/2qsSyPvVK6SASB
X-Google-Smtp-Source: AGHT+IE4jRkkPcMR8hRgppu41pEnM1yzxX8mEhhngUiV4jWmzttmQEhfEP6/c1SJqEvnbT+ztkRAAw==
X-Received: by 2002:a17:903:338b:b0:20e:55b0:35f2 with SMTP id d9443c01a7336-2111af1769bmr96729195ad.1.1730658914447;
        Sun, 03 Nov 2024 10:35:14 -0800 (PST)
Received: from hiago-nb ([2804:1b3:a7c0:1be5:78d:7a64:653a:de2d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056edec1sm48570955ad.50.2024.11.03.10.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 10:35:13 -0800 (PST)
Date: Sun, 3 Nov 2024 15:35:10 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [OE-core] [meta-oe][PATCH] drm-info: add recipe
Message-ID: <20241103183510.folsb2xotk4fsgkw@hiago-nb>
References: <20241103182040.25039-1-hiagofranco@gmail.com>
 <CA+chaQforrVHeUCApbig_roJ5OtFeX+FM=Mds=f3wDx-15R37w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+chaQforrVHeUCApbig_roJ5OtFeX+FM=Mds=f3wDx-15R37w@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Nov 2024 18:35:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206669

On Sun, Nov 03, 2024 at 07:24:39PM +0100, Martin Jansa wrote:
> meta-oe patches should go to openembedded-devel ML as README says.

Sorry about that, I sent it to openembedded-devel ML now.

> 
> On Sun, Nov 3, 2024 at 7:21 PM Hiago De Franco via
> lists.openembedded.org <hiagofranco=gmail.com@lists.openembedded.org>
> wrote:
> >
> > From: Hiago De Franco <hiago.franco@toradex.com>
> >
> > This recipe provides information about DRM devices, useful for debugging
> > and checking information about DRM.
> >
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > ---
> >  meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >  create mode 100644 meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb
> >
> > diff --git a/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb b/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb
> > new file mode 100644
> > index 000000000000..9f1cbb47fbfd
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb
> > @@ -0,0 +1,13 @@
> > +SUMMARY = "Small utility to dump info about DRM devices"
> > +HOMEPAGE = "https://gitlab.freedesktop.org/emersion/drm_info"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=32fd56d355bd6a61017655d8da26b67c"
> > +
> > +SRC_URI = "git://gitlab.freedesktop.org/emersion/drm_info.git;branch=master;protocol=https"
> > +SRCREV = "c1f5ca4cf750b26eb26c1d9d5c2ef057acbcfefc"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit meson pkgconfig
> > +
> > +DEPENDS = "json-c libdrm"
> > --
> > 2.39.5
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#206667): https://lists.openembedded.org/g/openembedded-core/message/206667
> > Mute This Topic: https://lists.openembedded.org/mt/109371629/3617156
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [martin.jansa@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

Regards,

Hiago.

