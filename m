Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FB2C4707B
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 10:13:24 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.8190.1705572795761407378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 02:13:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MIq3PYmA;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e7c6f0487so14192570e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 02:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705572794; x=1706177594; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ULlsohqZWz2PFSPVRX9ffA0qRSSgzsmfJoOWo+7SSQY=;
        b=MIq3PYmAmv4A3f+mD5AFr+txAsprNcpfQ/noECX6V7fHiaKKIo3Jzp1ZQgQdl27g6U
         2klXaGkVvk0LUvAKj8g9A4cuza8FpFWApi0zDVRKaX62z2D4Pj1ZVMBa8jSU1LmEtVgo
         eLQOeXh7o7JHXAlhpIojeKKS71ur5QGrDj9Oow6HKWw/TtfzA1Zij3DzDqoZb3cQcTEL
         NLL/VH3wESMpl4ot7zkl5BH2Up6NpoHJ2wIHkPkMV5XHrffGRL0l2TpQJWfpCzw45X4G
         8XtGYam8oYzKBhK7Vw+lqTFHlbSKp9b4lDQhuAHgnhRiUt8UpkbzlcACMdXFaXQ5v+7c
         8wNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705572794; x=1706177594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ULlsohqZWz2PFSPVRX9ffA0qRSSgzsmfJoOWo+7SSQY=;
        b=eU4mB/Gf7KoNAKnTydyZJSzjdK3IyePjsTzBoYHSlE+j6oqVskNrPso57XxNqPa0yA
         QbmqGVv5TMxOUjowgnZCTCElHZENWyvtgikYs7Vg3NI/QK8V4P2hloxqEA+zK67ykXCt
         ascphcllkrXtzWdh3BCedd5zsq2cqVZqhKdTtRbqLYp4YM6d/Ang3tt4aa9Q/CM0dcfg
         vJlwo2j3yEaeqtkVzSMT0cx/P7vFMKZ7OktNWWhGSvXKOUTDIJ9RcdspEDxkEq0SY68h
         E8048E1pN2vBB6oRrmisWa/a6IhuFN4pr6aTYDRiwSdYkIHVyknwwKSf9s2FKJ3e8CRd
         dHGQ==
X-Gm-Message-State: AOJu0Yw103ticmjZLfgex9N46Kod50YbBWWmn/OJYcjIu/RSyql8+D40
	Arn5tiMK73J8DaiRMcWxjoILyIGvnYNZLfmLSq9FNue4d0qPrjvRzb/Jri8nS2Gd44AdW1foA/i
	uxqYy8eA/8gH1e3wwNGAWYf4+Zdo=
X-Google-Smtp-Source: AGHT+IG2lJodztSl3rSMUqy1OsoooRRO3lMJP6IQ/hx94enreoYpcakfQJoptXT58/bPq1Ou2WWTCxLOidEHMg8+ecI=
X-Received: by 2002:a05:6512:398b:b0:50e:b1fa:8645 with SMTP id
 j11-20020a056512398b00b0050eb1fa8645mr290488lfu.109.1705572793526; Thu, 18
 Jan 2024 02:13:13 -0800 (PST)
MIME-Version: 1.0
References: <20240111131521.2305172-1-alex@linutronix.de> <20240111131521.2305172-2-alex@linutronix.de>
 <CALT56yMAYUiu8VLbH1HLLYGm=TkVZx31nZu_M5+bhDp=OnqMXg@mail.gmail.com> <e9283815ee1dc83b09470cefc75b0bb74bda974a.camel@linuxfoundation.org>
In-Reply-To: <e9283815ee1dc83b09470cefc75b0bb74bda974a.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 18 Jan 2024 11:13:02 +0100
Message-ID: <CANNYZj-1E0JpLBRHvS+f05HXkQxw1xaKfVpQOpExFpH-k8LeUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/2] shadow: link executables statically for
 -native variant
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, Vishal Bhoj <vishal.bhoj@linaro.org>, 
	openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 10:13:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193968

I'd like to clarify the 'randomly' part: does the failure disappear if
you re-run bitbake on the same build directory, or is it random only
between different builds? If it's deterministic in the same build
directory, then you can narrow it down to the specific tar invocation
directly from command line perhaps, and then try to see what is it in
the tree that tar operates on, that triggers the error.

Alex

On Thu, 18 Jan 2024 at 10:59, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2024-01-17 at 14:46 +0200, Dmitry Baryshkov wrote:
> > On Thu, 11 Jan 2024 at 15:15, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > >
> > > shadow 4.14.x adds a number of libraries it dynamically links with
> > > (md, bsd, attr). This causes troubles in setscene tasks where
> > > shadow executables are used (such as useradd), as pulling in
> > > the needed dynamic libraries needs unpleasant special-casing.
> > >
> > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >
> > It seems, this is causing issues with the TuxOE builds. We have been
> > observing issues with the TuxOE build environment with the image
> > creation choking on the home dirs. Reverting this patch seems to fix
> > the problem. The build environment is Ubuntu 20.04 running in a
> > container on Ubuntu 22.04.
> >
> > ERROR: rpb-weston-image-1.0-r0 do_image_tar:
> > ExecutionError('/oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/temp/run.do_image_tar.160075',
> > 1, None, None)
> > ERROR: Logfile of failure stored in:
> > /oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/temp/log.do_image_tar.160075
> > Log data follows:
> > > DEBUG: Executing python function set_image_size
> > > DEBUG: 1402908.000000 = 1079160 * 1.300000
> > > DEBUG: 1402908.000000 = max(1402908.000000, 65536)[1402908.000000] + 0
> > > DEBUG: 1402908.000000 = int(1402908.000000)
> > > DEBUG: 1404928 = aligned(1402908)
> > > DEBUG: returning 1404928
> > > DEBUG: Python function set_image_size finished
> > > DEBUG: Executing shell function do_image_tar
> > > tar: ./home/linaro/.bashrc: Unknown file type; file ignored
> > > tar: ./home/linaro/.profile: Unknown file type; file ignored
> > > tar: Exiting with failure status due to previous errors
> > > WARNING: /oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/temp/run.do_image_tar.160075:146
> > exit 1 from '[ $? -eq 1 ]'
> >
>
> The error is coming from tar during archive creation, "Unknown file
> type; file ignored". I'm a little confused/concerned about what it is
> seeing which it can't handle.
>
> It might also be good to work out if that is tar from the host or tar
> from tar-native. Is the host's tar unable to support something we're
> relying upon?
>
> If it were me, I'd probably have a look into the tar source code too,
> see what might trigger an error like that.
>
> Cheers,
>
> Richard
>
>

