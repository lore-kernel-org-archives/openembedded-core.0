Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E5EC83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 12:57:35 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.48484.1752757054532911404
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 05:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PpX8HtBu;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: hiagofranco@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-73e560636d6so507355a34.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 05:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752757053; x=1753361853; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NEvnnXwRUnkQwykTNWiCD63iry4zhSC0CxuriOSeNb4=;
        b=PpX8HtBuM3yh5P2J/KbZwl7xo9cwtSXZ/pfLk+EYFmUrQvSjo+gUWJoSpysVPiTOn0
         sbZ6GS0oMl+9qtTeWVUiDw1gZ42+f3TL4DbeVfLLK/HoW8j4c9anjaKuSD31713/BSJ2
         TKu2VIs52Hm6sMF0Xw6pSmTMrZDKsqOIMdmNqNeHtRYYO3bqfiDcDd9XRUt2UmZtqz+l
         iZQAbmL2fxVV43Y8NBz0cULra/v+FYod57gHRlPGgMy51echemtKvu+fbL1gQRmrqDT6
         1c8NHXvNO5+pqLQmg159kp65MB87ypK8Zc9nCRTyAt8b8FPUTnBvf6ecdSLCGq13PX7n
         z3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752757053; x=1753361853;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NEvnnXwRUnkQwykTNWiCD63iry4zhSC0CxuriOSeNb4=;
        b=rTK1Nsc5I27+k5slVDG35s7QMl/KKY/L3GsCEBe1nqLgfYQOFptrwd9y2ZQROw+sRR
         gqDRKE8SQJT+wv+K+n4kdLoNgxsJ0ycjSMFhLlRkm1iAeFMkNogg0bIWVFQNRV4CGZzq
         WO0CU/Rr/dDNbjDezdsUKjDIyjgaDw4u3V/GKjVj2B3fiPed14qVhBPokWds9xK7/alY
         Fest11R5cyv4oIMrh7SDkXC+jsxl3vvwAEpR1NkO+XQTTH+mwQRfecvYpz7ieyJOalLs
         h7Ckaxolj2Jq7BWHHYH0fg8FTBkAsLD5JcIpzRfaRtBbnfcSub0gFzOy+HR2smD+knhw
         jyHA==
X-Gm-Message-State: AOJu0YwvmNTj2CjR/QEZXqc9H6xvuyX8IZQ7YC7mAGBZCTZaksXBddgr
	W1wGpLEYK+zl17qokkFnjwcIuw8GGRZj/DpUk2+OuKdnxLgpH4tZ91OlEWNn050H
X-Gm-Gg: ASbGncudVebmd0iHmIxIjNeRQ3DOXCQW3gQZF4BgFxZo6wr1qm9xV8xGj6mqZ1izD/p
	/sZqpoq+x0YEgWhnRwaBR4cloi2EyXxdEJoBDKoJAYP4Y9ZFPg9Vz7HxMVuqPaQYSQvaj9tPEtJ
	aIuxbdRL8NdWK5fpBwmidTM9E3Iiv6H+xV/GF2ZZY3IYqMuyR390qZtrHokqVELR5S5ZeP/j0PB
	b47/6zg6XyTLFIvNwfrwKD6cWg+TQA5/dpcuh3dqeAAlsTv9GNeMy672u34AmuKCRlaEg555Cz7
	kFhbx9qbzNU9asf32H4rA1F6hER1q3ZAF+RIDfj8sLqCEqCFhMzQ4kKep+TaDKYn8o3WcuOi0XA
	RgAxyGR/OPfbwJHaQAuM=
X-Google-Smtp-Source: AGHT+IEvyF4E0EL4E8grKR1JZp5bQUWkURJj7U973dpB+ZPDVlGMJwCvFYKpWq/CQjdSPZTKHRBXWA==
X-Received: by 2002:a05:6830:4d95:b0:73e:6fac:b3d6 with SMTP id 46e09a7af769-73e753b689fmr2015123a34.24.1752757052523;
        Thu, 17 Jul 2025 05:57:32 -0700 (PDT)
Received: from hiagonb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e63b94769sm1643339a34.21.2025.07.17.05.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:57:32 -0700 (PDT)
Date: Thu, 17 Jul 2025 09:57:28 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
	Chen Qi <Qi.Chen@windriver.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [OE-core] [PATCH 0/2] systemd: drop libmount dependency and add
 blkid and fdisk PACKAGECONFIGs
Message-ID: <20250717125728.tmxoze5r2obktl3x@hiagonb>
References: <20250716232931.127811-1-hiagofranco@gmail.com>
 <DBE8J299IF7K.22KVHVSAEHE8@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DBE8J299IF7K.22KVHVSAEHE8@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 12:57:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220540

Hi Mathieu,

On Thu, Jul 17, 2025 at 11:49:54AM +0200, Mathieu Dubois-Briand wrote:
> On Thu Jul 17, 2025 at 1:29 AM CEST, Hiago De Franco via lists.openembedded.org wrote:
> > From: Hiago De Franco <hiago.franco@toradex.com>
> >
> > The libmount dependency in systemd was made optional upstream [2]. This
> > series backports that change, allowing us to drop util-linux as a build
> > dependency for systemd. This resolves a circular dependency between
> > util-linux and systemd when systemd PACKAGECONFIG is enabled in
> > util-linux. Without this fix, each recipe depends on the other,
> > triggering the circular dependency error.
> >
> > Note that this alone does not fully resolve the circular dependency
> > on util-linux-fstrim/uuid. There is another one:
> >
> > glib-2.0 -> util-linux -> systemd -> shared-mime-info -> glib-2.0
> >
> > But the libmount PACKAGECONFIG can be removed from glib-2.0 to break its
> > dependency on util-linux.
> >
> > In addition, according to systemd's README [2], the dependencies on
> > libblkid and libfdisk from util-linux are optional, so add them as new
> > PACKAGECONFIGs.
> >
> > [1] https://github.com/systemd/systemd/commit/d1ee3889cf8e8a9edc82e41d306155fb4c531c8f
> > [2] https://github.com/systemd/systemd/blob/main/README#L216
> >
> > Hiago De Franco (2):
> >   systemd: drop build dependency on util-linux
> >   systemd: add libblkid and libfdisk PACKAGECONFIG options
> >
> >  .../0001-meson-Add-libmount-feature.patch     | 58 +++++++++++++++++++
> >  meta/recipes-core/systemd/systemd_257.6.bb    |  9 ++-
> >  2 files changed, 65 insertions(+), 2 deletions(-)
> >  create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-Add-libmount-feature.patch
> 
> Hi Hiago,
> 
> Thanks for your patches.
> 
> I suspect this series is responsible from a test failure:
> 
> Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/qemuarm-alt/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/srv/pokybuild/yocto-worker/qemuarm-alt/build/meta/lib/oeqa/runtime/cases/systemd.py", line 100, in test_systemd_failed
>     output += self.systemctl('status --full --failed')
>   File "/srv/pokybuild/yocto-worker/qemuarm-alt/build/meta/lib/oeqa/runtime/cases/systemd.py", line 26, in systemctl
>     self.assertEqual(status, expected, message)
> AssertionError: 3 != 0 : SYSTEMD_BUS_TIMEOUT=240s systemctl status --full --failed
> � systemd-boot-update.service - Automatic Boot Loader Update
>      Loaded: loaded (/usr/lib/systemd/system/systemd-boot-update.service; enabled; preset: enabled)
>      Active: failed (Result: exit-code) since Thu 2025-07-17 09:02:59 UTC; 25min ago
>  Invocation: a44df1a151da4bbfa387c056d59eb001
>        Docs: man:bootctl(1)
>    Main PID: 189 (code=exited, status=203/EXEC)
>    Mem peak: 828K
>         CPU: 58ms
> ...
> RESULTS - systemd.SystemdBasicTests.test_systemd_failed: FAILED (9.36s)
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/2034
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2030
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/95/builds/2018
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2017
> 
> Can you have a look at this failure please?

Sure, I will take a look.

Best Regards,
Hiago.

> 
> -- 
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

