Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D539CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 10:19:56 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4296.1778667588821209039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 03:19:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=s94ywUcl;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50e614fdb42so50982111cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 03:19:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778667588; cv=none;
        d=google.com; s=arc-20240605;
        b=VrQOSuhNpue/YYytU9NpwXzclpNEfZGyRMyqaRY6KaQBqzH36pN5ct7VtnASm2844Z
         mMgHTqDZ6viESDEgsao/TeUD34RoW03ELG1NQmP4SYgEDXwM3mFNWTVvuwqag/UWVw3C
         bZIV66q3k0ih9MCOxIR2QdtkD4mCqV8dYv8Vvm4lBH6oT1t1sKR7xF7LNp4cbqD9EbhP
         Hqcybi+04TbI3KjKvC9BA9q84dw6CHet/H5QqHuPqM4kxJj5MrBTyjFnrbC8ViVRhRCd
         AGCC8vHLiiLRw9v5bufeF8/SnlMTsizrZilpBUPNhfGG6+06c5tf/W1lSzXLbhVuc5HH
         xbdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7Uwzt26iGP2iC/E+P4G025e0FdP4AUvO6Jlu1a8VOrY=;
        fh=zKz6N5nlw6uV0qJjkrzhx898ldqCrBJnbC3xvUl9vao=;
        b=YPhNa1K+pZFNS+ZYIkVjLWKR9kYKFyWtx3IPsS8Yh1phjeiZ+uiyeydyoKFoe8znu9
         DusKdVdyaU5UA76dBnUDi7G00D/jtGyHlWzxJdIzHcbqaRfNXDBpKHIlvJWZxw/0hLvs
         WnB9zLJc0K6bCgW7gfHHFDE1HoYtvMrH0TOcXT2/mLpYvbbx2x3iazSGPBOFehcl/hTD
         chPl+5Mtur7r5VwNx81Y89S2u4/lbBtbTM8CS/lP1JWqtuU685dK2Y8SYePRCrL/cLR2
         q9mN8DuxlQ+vfpk51sC+JrSlLXPm+2qMZHnqTHqqD0alkk6eXoDmor4opzbmNZvv5fNN
         6SyQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778667588; x=1779272388; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7Uwzt26iGP2iC/E+P4G025e0FdP4AUvO6Jlu1a8VOrY=;
        b=s94ywUcl1FEJlh4L8U5o8dwQA70FBDPqwTrO7dp4qD+c/USKFXeTnGZE1xTrXefei0
         lB9Wl9iMEn1SJHpUhvyNkaNd+Bn/dxOqOOjXS8wQ7OQ2/SgGLNDoUjxQRJxS3YQ/ygP+
         i54qblJZ3qY1oya0Ip27g7wiUjzzoB9el/JI1SbSc97inKjKqMKPL8B3FqoQS1K3+k3D
         IdfMYyqeWCClnkMPowlCd7uJvuxAxwOtVp/C+6+d6Jb2mKjscgcXZ1iGWeVkbA8SASiT
         4AphipZJnxaAENh70IPX/gCl58wlkxX9mgBmlqQUngKtb+NJJBHcy10LAWfeJ3Mgy4g1
         yCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778667588; x=1779272388;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Uwzt26iGP2iC/E+P4G025e0FdP4AUvO6Jlu1a8VOrY=;
        b=kMeqUWlBgrYydUij+M6jClk80xvGAXIlqyaeCbVBX5htYaYWEXyyn7LF+zABBb+VjM
         f7AI+6Xih1v07krKI63SJuodrpPibEvpw1rOGZieksRzCR7HS6rD2oymn2a1Mm/Txtf6
         2Pa+a88hPp2VZOV4Ua/JFtAQGmsjxjWYXwDEt9ktaiDmhv+YF3gzyib8KlOkEnv3gnNS
         qo9qg0FbLwckbJKEb+cpap+7h8Rqfogz8gwOp338wcgseB0SRvdQuieT2/XFb2zkbsRY
         rm16uFwYYcNtcZjf0mpZiOKeSAGQYV22YWSpsGjc1OOHgB0+Y/a7WAi16c2gavYa9R+7
         S1NA==
X-Gm-Message-State: AOJu0YxgA4b+4C+bKeh2Yux5rvuBEpwT5CHswm+l6czDldTGvz3D6nJ9
	AanpotK2LaBtO0cNrU4Vi5nNPOQNRv5Zsu3j0NQBmVp3jQoScvOJ/WymfNJRF+9pBTaNicXHXrt
	pZftIWIJ2uYye82NpZlu/jfJRp0Kogw0=
X-Gm-Gg: Acq92OGaT1UYPizptMs1kF1JjUEP4sB1PCnAt09WRvcx32EU7vTapryVnc5Zz1GpjBb
	YxTZRTs16ddQtARP2rX/3PdZOXBukLfSTL39yJtMukhMIzlaUiJfqEuMUFNQHcyolbXEO/K7S+m
	xcVwZkDunNsIiNMmr3bLTYXrAZioMSTueW41TC5KTyu5vobCrEb+xVe+TzSNgpkYLnMHVQIxL7h
	3z4ADPih68JKw7NjBA44+gzltiAo7twUX4Fx/APoMqZWYZ2B0yoxFeZLL6VRBnrSCzuB4VTaV3p
	E9EXFmfcWMvdjGEPV3R/G4NTsOaQwuSkhNJLF2o7kA==
X-Received: by 2002:a05:622a:5505:b0:50e:a1ab:114c with SMTP id
 d75a77b69052e-5162f563134mr32991891cf.32.1778667587683; Wed, 13 May 2026
 03:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260511133450.50595-1-tarun@centricular.com> <20260513071155.1215141-1-tarun@centricular.com>
In-Reply-To: <20260513071155.1215141-1-tarun@centricular.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 13 May 2026 12:19:35 +0200
X-Gm-Features: AVHnY4KlZXk3C8r0fI-N9K-opDYauxbmz85Uyzk6KohSOyzpfKuXk9AOaizyR8g
Message-ID: <CANNYZj8sYaa=hGCCWViiOQojN9TjuroAPs7FHhVLCT=g+Ut1=w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gstreamer1.0-plugins-rs: add new package
To: tarun@centricular.com
Cc: openembedded-core@lists.openembedded.org, sebastian@centricular.com, 
	nirbheek@centricular.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 10:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236959

On Wed, 13 May 2026 at 09:14, Taruntej Kanakamalla via
lists.openembedded.org <tarun=centricular.com@lists.openembedded.org>
wrote:
> Adapted from an existing patch:
> https://patchwork.yoctoproject.org/project/oe-core/patch/20220606132653.60232-5-brgl@bgdev.pl

Hello Tarun,

thanks for bringing these up to date. The question from that link
still stands though: are these useful and used enough to be in
oe-core, or should they be in meta-oe for now?

> Unlike the other GStreamer submodules, the Rust plugins follow a
> separate release cycle and versioning scheme. These plugins are fully
> stable and required for a fully-featured GStreamer installation, as most
> new features and plugins are being written in Rust.

There should be evidence for this claim. If most new features are
written in rust, then the rust plugins should be in the core gstreamer
project, following its release cadence, and they aren't.

> +SRC_URI = " \
> +    git://gitlab.freedesktop.org/gstreamer/gst-plugins-rs;protocol=https;branch=0.15;name=default \
> +    git://github.com/gtk-rs/gtk4-rs;protocol=https;branch=0.11;name=gtk4-rs;destsuffix=gtk4-rs \
> +    git://github.com/gtk-rs/gtk-rs-core;protocol=https;branch=0.22;name=gtk-rs-core;destsuffix=gtk-rs-core \
> +    git://github.com/rust-av/ffv1.git;protocol=https;nobranch=1;name=ffv1;destsuffix=ffv1 \
> +    git://github.com/rust-av/flavors;protocol=https;nobranch=1;name=flavors;destsuffix=flavors \
> +    git://gitlab.freedesktop.org/gstreamer/gstreamer-rs;protocol=https;branch=0.25;name=gstreamer-rs;destsuffix=gstreamer-rs \

These all need to be split into their own recipes, or there should be
an explanation of why that isn't possible.

> +# Silence package QA errors like:
> +# ERROR: gstreamer1.0-plugins-rs-0.15.1-r0 do_package_qa:
> +# QA Issue: File /usr/lib/gstreamer-1.0/.debug/libgstrswebrtc.so in
> +# package gstreamer1.0-plugins-rs-dbg contains reference to TMPDIR [buildpaths]
> +# TODO: look for proper fix
> +INSANE_SKIP:${PN}-dbg += "buildpaths"

This will fail the reproducibility test on the yocto autobuilder and
needs to be addressed.

Alex

