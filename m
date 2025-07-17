Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA5BC83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 19:51:26 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web10.4622.1752781885926768375
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 12:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ir4lXgos;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: hiagofranco@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-87f0efa51c0so713544241.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 12:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752781885; x=1753386685; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x8SZpyx2rzHEfQsX8YJWcNotunJwmI+9kt6aQBO8l9M=;
        b=ir4lXgostq6tOJE7HjAhTKloulU+AS0Re0O+F6QyAQRnj0LPduiOZCZ9jU4Pk2SbgN
         tNJGn+oB6rxyP3acszCpWnzOe6a7B4h+ulis08Lw/ZuYXgxpF8bSjyEX7dtn00W0rHgD
         h0N3NGYBwgt0ULuxi8zmMixRzWbxI+0E2u0GgBEd/VMpt6X8zEp6yInfCsVB/p9Wfrf8
         gZluVLDMANNrieNCmzhd+bxJ0YPGqHBa2ytQBZ2bmfo3XXehN8f0EteELO8jggurTums
         70ayeByAjBU7Q+A5aI7RFbEJPI56z7rQzFtyMJXzBhZBfbLK1b5C3RF1maRPowln1fVP
         cq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752781885; x=1753386685;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x8SZpyx2rzHEfQsX8YJWcNotunJwmI+9kt6aQBO8l9M=;
        b=D017KwwBFvOIBzEMWc7Vy5GggE7J+37YRDKpTK1wC8/m9c+SLGU9ER1yx1BUlG4WvS
         CWIS+g6J5HJpF4g3Fx+H1sHlvjeOMfFAAxCc9qelCA29zzEMHghy1HLvn9k/e+13JkJv
         n9VHNupO6LssIJh+0QU4hHBu/ZXgJ5cSeQHpU2bHVn68D7jZ4azfGMe0Fz/qEBULK2PV
         5qTeRm11hAx/hZqpvgI2WojW9nTeeKtM69CeIozqvcFy6iL39H7h4Y/QK06UoIYq0pvf
         /S2QPPuA5wjZi+I0yefcIhkDz8mgGN1+yBHFDz+gWhn0secFIeJy1a1ixSN0twdxMXtF
         xL1w==
X-Gm-Message-State: AOJu0YxVVOXS35oPl7fQNUJE/SIE0/meq5rUA4ZNFWt1zD2+oZZCb8lE
	Up75NDh7+7O46FWMA6NOmGAsfXQRSqCqv3oh7hPdGZuMl4p3gqCp0fwk
X-Gm-Gg: ASbGncsiWKPdZIVk5dD+X+wq9WTX/su8cmpqxEt1qIgOhrqVMsuHurGxBkdxvnYnGSP
	EX4MgpZQTdrMvZX3+kJhfukqbXvMIITFeyTy2c+xjBzvyTspxtnlC/KLNo9KQrZfvGwHNsFRY3W
	/icaBxK0IDnDauyR3XLm6EN4JtMiZuvSqZhGB9Rhvdy9zi30vN+gw+gBY1gUIMYwO4UlhO81KrT
	5pdOpcjpsPHsHbiwBulFY1ig3d5cHQb+Y9WwrjkUA/Mp9xNewyBdNAOYHxomJXJ65L+ak10m1BO
	mNpU5auqB4tSTyQkRjCaF5/FbzFVC1r4vWrTlSZ8zeTJDBAVoshxQuFfzDtHBF1rOMUCwf7WDLj
	aQ5FiEikR/S/vMaNnFQg=
X-Google-Smtp-Source: AGHT+IH4yBrzatlUHXf7E15QMSzGFBYgH6w9oEKMjY0i0PkpRTdeDDmG3GbXy8JiPzX98ycid1OH1g==
X-Received: by 2002:a05:6102:2906:b0:4e2:82b9:b377 with SMTP id ada2fe7eead31-4f9ab36ccccmr136936137.18.1752781884802;
        Thu, 17 Jul 2025 12:51:24 -0700 (PDT)
Received: from hiagonb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-888ec44acefsm4183675241.26.2025.07.17.12.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 12:51:24 -0700 (PDT)
Date: Thu, 17 Jul 2025 16:51:21 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
	Chen Qi <Qi.Chen@windriver.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [OE-core] [PATCH 0/2] systemd: drop libmount dependency and add
 blkid and fdisk PACKAGECONFIGs
Message-ID: <20250717195121.e6cuvfzqyco47gll@hiagonb>
References: <20250716232931.127811-1-hiagofranco@gmail.com>
 <DBE8J299IF7K.22KVHVSAEHE8@bootlin.com>
 <20250717125728.tmxoze5r2obktl3x@hiagonb>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250717125728.tmxoze5r2obktl3x@hiagonb>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 19:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220562

On Thu, Jul 17, 2025 at 09:57:28AM -0300, Hiago De Franco wrote:
> Hi Mathieu,
> 
> On Thu, Jul 17, 2025 at 11:49:54AM +0200, Mathieu Dubois-Briand wrote:
> > On Thu Jul 17, 2025 at 1:29 AM CEST, Hiago De Franco via lists.openembedded.org wrote:
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > >
> > > The libmount dependency in systemd was made optional upstream [2]. This
> > > series backports that change, allowing us to drop util-linux as a build
> > > dependency for systemd. This resolves a circular dependency between
> > > util-linux and systemd when systemd PACKAGECONFIG is enabled in
> > > util-linux. Without this fix, each recipe depends on the other,
> > > triggering the circular dependency error.
> > >
> > > Note that this alone does not fully resolve the circular dependency
> > > on util-linux-fstrim/uuid. There is another one:
> > >
> > > glib-2.0 -> util-linux -> systemd -> shared-mime-info -> glib-2.0
> > >
> > > But the libmount PACKAGECONFIG can be removed from glib-2.0 to break its
> > > dependency on util-linux.
> > >
> > > In addition, according to systemd's README [2], the dependencies on
> > > libblkid and libfdisk from util-linux are optional, so add them as new
> > > PACKAGECONFIGs.
> > >
> > > [1] https://github.com/systemd/systemd/commit/d1ee3889cf8e8a9edc82e41d306155fb4c531c8f
> > > [2] https://github.com/systemd/systemd/blob/main/README#L216
> > >
> > > Hiago De Franco (2):
> > >   systemd: drop build dependency on util-linux
> > >   systemd: add libblkid and libfdisk PACKAGECONFIG options
> > >
> > >  .../0001-meson-Add-libmount-feature.patch     | 58 +++++++++++++++++++
> > >  meta/recipes-core/systemd/systemd_257.6.bb    |  9 ++-
> > >  2 files changed, 65 insertions(+), 2 deletions(-)
> > >  create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-Add-libmount-feature.patch
> > 
> > Hi Hiago,
> > 
> > Thanks for your patches.
> > 
> > I suspect this series is responsible from a test failure:
> > 
> > Traceback (most recent call last):
> >   File "/srv/pokybuild/yocto-worker/qemuarm-alt/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >   File "/srv/pokybuild/yocto-worker/qemuarm-alt/build/meta/lib/oeqa/runtime/cases/systemd.py", line 100, in test_systemd_failed
> >     output += self.systemctl('status --full --failed')
> >   File "/srv/pokybuild/yocto-worker/qemuarm-alt/build/meta/lib/oeqa/runtime/cases/systemd.py", line 26, in systemctl
> >     self.assertEqual(status, expected, message)
> > AssertionError: 3 != 0 : SYSTEMD_BUS_TIMEOUT=240s systemctl status --full --failed
> > � systemd-boot-update.service - Automatic Boot Loader Update
> >      Loaded: loaded (/usr/lib/systemd/system/systemd-boot-update.service; enabled; preset: enabled)
> >      Active: failed (Result: exit-code) since Thu 2025-07-17 09:02:59 UTC; 25min ago
> >  Invocation: a44df1a151da4bbfa387c056d59eb001
> >        Docs: man:bootctl(1)
> >    Main PID: 189 (code=exited, status=203/EXEC)
> >    Mem peak: 828K
> >         CPU: 58ms
> > ...
> > RESULTS - systemd.SystemdBasicTests.test_systemd_failed: FAILED (9.36s)
> > 
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/2034
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2030
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/95/builds/2018
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2017
> > 
> > Can you have a look at this failure please?
> 
> Sure, I will take a look.

I was looking at it now and I was able to find the issue. We need to set
the new blkid PACKAGECONFIG from patch 2 as default, because this is
needed to build bootctl. I will fix this and send a v2.

Best regards,
Hiago.

> 
> Best Regards,
> Hiago.
> 
> > 
> > -- 
> > Mathieu Dubois-Briand, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> > 

