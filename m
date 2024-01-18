Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B825C4707B
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 13:32:25 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.11419.1705584741474276378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 05:32:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ko20tnrz;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-559f92bf7b6so1346698a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 05:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705584740; x=1706189540; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X9kIdgCnwP9DRpj7Il05yU5Cc6QamSxYfeWK4h5XjOU=;
        b=ko20tnrzEjfbccsjRhQF9AuWZMQX/P5h+YlSF5YoPrEVzusgQVKPWb/Xv+zjlX3MbY
         MqOJrwl9zgBSYo+5yHdex+C07TjR9Pc7lZJ7r62x5M372E7Uk7h0g2adh1FuCaxPmxxU
         MajssI9Xii+Bp4cIQAjCr7G7udTzD1MSx13c0XJ1OJ48rPkkiTW5EHR0OHPi74gsjwl3
         1xvq+KgRorMFFo3l+c8fykYrpdRRsGlhNKmhGqkH8YF+Cw6HdZkzuKACMeS79gHdO5q0
         0FeatP+/AqOcPKQP/MnwqepxXfzbir5H9Yj7rwkUoMtfeEL2kWnGaXYRkFxyRTijKRbG
         Jcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705584740; x=1706189540;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9kIdgCnwP9DRpj7Il05yU5Cc6QamSxYfeWK4h5XjOU=;
        b=TobVX6tSlRkYJiq6qJEevypqyAiHf7Vcn+A5k4vNJontcau247yl3dAj6mDnrXE7Ww
         WMLwKPv6wV14ula+IlE+QHq+N2/bmxzIZ2wDN+vX9ReL+Vg0s93OEh5Nbf5z5oU/5w6a
         CZ7vkvZWrLak8wnISblfAEvKMiIT0k7URCPzXr2t3pIrZP2Q5QhJu48mk3vP72X3N3RH
         i2GPU8PoS8l0IP7AKZXzUKJEWpUj3b+6e2bpd4qMqxAzGsLsMOa01l+N0pxSEOVzXenF
         l53+9KRvXUWREAdR3W0nIK2BJFtD4wihfNxv+dTNG1nwGuNY7EU8wvPQvzd4kz4EVt+m
         8T8A==
X-Gm-Message-State: AOJu0Yy/6VdqZyTv/4P7f8rDp9HrYdjZAL4WFe7vmfDX3iqOqVZXmx/q
	iZymLwA5oCZwj36UPhFNW3ip3kdp7PUJw2hTL/JWVxfxJRxTo9MRlYw5Sz3Ni/22jMffECpwBj/
	C+MLpqbLOshLmDjuUeKJgck5fRlw=
X-Google-Smtp-Source: AGHT+IGZF5izO+zXSUvVIZbUSp59P8Qk5b16RvnpCCl2y8K38QPTMML/OtUnAwJ6zIGcIevd7zYz3rGXKSDQ3wNivSE=
X-Received: by 2002:aa7:d4cc:0:b0:55a:4503:6b04 with SMTP id
 t12-20020aa7d4cc000000b0055a45036b04mr166085edr.8.1705584739596; Thu, 18 Jan
 2024 05:32:19 -0800 (PST)
MIME-Version: 1.0
References: <20240111131521.2305172-1-alex@linutronix.de> <20240111131521.2305172-2-alex@linutronix.de>
 <CALT56yMAYUiu8VLbH1HLLYGm=TkVZx31nZu_M5+bhDp=OnqMXg@mail.gmail.com>
 <e9283815ee1dc83b09470cefc75b0bb74bda974a.camel@linuxfoundation.org> <CANNYZj-1E0JpLBRHvS+f05HXkQxw1xaKfVpQOpExFpH-k8LeUA@mail.gmail.com>
In-Reply-To: <CANNYZj-1E0JpLBRHvS+f05HXkQxw1xaKfVpQOpExFpH-k8LeUA@mail.gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Thu, 18 Jan 2024 15:32:08 +0200
Message-ID: <CALT56yN7hkqxdDdgGoCz9At=PpLs_8E4H5iL46FPZer8nHwuRw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/2] shadow: link executables statically for
 -native variant
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Vishal Bhoj <vishal.bhoj@linaro.org>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 13:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193979

On Thu, 18 Jan 2024 at 12:13, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> I'd like to clarify the 'randomly' part: does the failure disappear if
> you re-run bitbake on the same build directory, or is it random only
> between different builds?

It is random between different builds. Rerunning the build frequently
(but not always) makes it go away.

> If it's deterministic in the same build
> directory, then you can narrow it down to the specific tar invocation
> directly from command line perhaps, and then try to see what is it in
> the tree that tar operates on, that triggers the error.
>
> Alex
>
> On Thu, 18 Jan 2024 at 10:59, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Wed, 2024-01-17 at 14:46 +0200, Dmitry Baryshkov wrote:
> > > On Thu, 11 Jan 2024 at 15:15, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > > >
> > > > shadow 4.14.x adds a number of libraries it dynamically links with
> > > > (md, bsd, attr). This causes troubles in setscene tasks where
> > > > shadow executables are used (such as useradd), as pulling in
> > > > the needed dynamic libraries needs unpleasant special-casing.
> > > >
> > > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > >
> > > It seems, this is causing issues with the TuxOE builds. We have been
> > > observing issues with the TuxOE build environment with the image
> > > creation choking on the home dirs. Reverting this patch seems to fix
> > > the problem. The build environment is Ubuntu 20.04 running in a
> > > container on Ubuntu 22.04.
> > >
> > > ERROR: rpb-weston-image-1.0-r0 do_image_tar:
> > > ExecutionError('/oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/temp/run.do_image_tar.160075',
> > > 1, None, None)
> > > ERROR: Logfile of failure stored in:
> > > /oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/temp/log.do_image_tar.160075
> > > Log data follows:
> > > > DEBUG: Executing python function set_image_size
> > > > DEBUG: 1402908.000000 = 1079160 * 1.300000
> > > > DEBUG: 1402908.000000 = max(1402908.000000, 65536)[1402908.000000] + 0
> > > > DEBUG: 1402908.000000 = int(1402908.000000)
> > > > DEBUG: 1404928 = aligned(1402908)
> > > > DEBUG: returning 1404928
> > > > DEBUG: Python function set_image_size finished
> > > > DEBUG: Executing shell function do_image_tar
> > > > tar: ./home/linaro/.bashrc: Unknown file type; file ignored
> > > > tar: ./home/linaro/.profile: Unknown file type; file ignored
> > > > tar: Exiting with failure status due to previous errors
> > > > WARNING: /oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/temp/run.do_image_tar.160075:146
> > > exit 1 from '[ $? -eq 1 ]'
> > >
> >
> > The error is coming from tar during archive creation, "Unknown file
> > type; file ignored". I'm a little confused/concerned about what it is
> > seeing which it can't handle.
> >
> > It might also be good to work out if that is tar from the host or tar
> > from tar-native. Is the host's tar unable to support something we're
> > relying upon?
> >
> > If it were me, I'd probably have a look into the tar source code too,
> > see what might trigger an error like that.
> >
> > Cheers,
> >
> > Richard
> >
> >



-- 
With best wishes
Dmitry

