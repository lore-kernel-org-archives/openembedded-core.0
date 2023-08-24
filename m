Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C39C71145
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 06:45:24 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.5243.1692859515254732877
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 23:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=s6of7R9w;
 spf=pass (domain: linaro.org, ip: 209.85.208.169, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2bb97f2c99cso99394361fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 23:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692859513; x=1693464313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=htfvfoNAugH1PpL4Z1rnN1HFPFXkzta319psrqCgt7o=;
        b=s6of7R9wfwJKK1xRG6ij7wG8V6u9XzzlZCmb+ib2KBqz3RRBoLLhl1vjzS1VOPsjFE
         zgTPo8JvGhfWPrBi+lmbmLeKk6oJnLEJ/lTWPDxvvytoFGNfbJsQQDXeLFvKIT7y2Hw7
         fMpuIPAsJAfyUJAwQDnJvRb7g+Q8m/TOCQiodpXC/OVP9niNZ707+pBQ9KJ5j3OOz2TM
         WDGSeqRZZx3uK/KeQZcQwlhfx2gd/b0vGEuE7g4tLk1Ju+U3WlU6d9Omhg4DwEZbX2Hl
         BQPaJLdH5bz7s0864s/a2sz2EhY6iZQaJYKOgA20ucgQAkZJiIujcLKYg43MT1Pc9p7i
         Vn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692859513; x=1693464313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htfvfoNAugH1PpL4Z1rnN1HFPFXkzta319psrqCgt7o=;
        b=cMoV+9yaXmNckVotNI1Af1UVpBodxUjwEwrBFnGZXrcg2Ysc0PmK8N9r0219FUVxvn
         CO4ftYUBfN5MU0kwHPEXDYwnWLN2JWNVFPv8nO55nJ2u4/1byxmGjun6A2dIOft/ACsR
         XCy8VoD9GtfkcHolq95cPyIPNzqzwWX0+aRt75ZcpF4Pn6W4UDQlkzoDWEzXY/qshKCy
         fl4QNPgjIcFZZ9w7y9vc+vdnq12CAviPLB6Et9cB0Qr2muq3wDkyrluA0K6PJq43qlFg
         Giq5JHf5/7kt5AfCbyALv7bpDfzeDm9Q+3MLrtcuDLrqeuFZcPaGOT9Ev3Ep8DIGaCXU
         SNcA==
X-Gm-Message-State: AOJu0Yys78QZtnrGfpo7tTrx4io9y9CdGf5/aD+ycmLsLoNhXze6Ho6F
	PFFcsHt+oiOCtgx3BF6BjdYNz3VAFDHeyoxr2oU=
X-Google-Smtp-Source: AGHT+IH8Z/CwwgqnYFae3ipN0R2lXQHKGmVLF2KObj+VNBR2NQttynq4hOFnguYiHuSFvrIvFpJNxA==
X-Received: by 2002:a2e:97cd:0:b0:2b6:ccd6:3ec2 with SMTP id m13-20020a2e97cd000000b002b6ccd63ec2mr10736181ljj.36.1692859513458;
        Wed, 23 Aug 2023 23:45:13 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id j22-20020a2e6e16000000b002bcdd73a412sm613533ljc.116.2023.08.23.23.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 23:45:12 -0700 (PDT)
Date: Thu, 24 Aug 2023 09:45:11 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 9/9] oeqa selftest runtime_test.py: skip
 virgl_headless test if /dev/dri/renderD128 access fails
Message-ID: <ZOb8dy1yGpNJpJSI@nuoska>
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
 <20230823061025.3952909-9-mikko.rapeli@linaro.org>
 <CANNYZj-FK42Y4+cZNg2uekOPipQDPAq8HmXn4r4zLSiUTq8DeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj-FK42Y4+cZNg2uekOPipQDPAq8HmXn4r4zLSiUTq8DeQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 06:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186638

Hi,

On Wed, Aug 23, 2023 at 08:37:47PM +0200, Alexander Kanavin wrote:
> On Wed, 23 Aug 2023 at 08:10, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> >
> > If access to /dev/dri/renderD128 fails, then qemu with 3d graphics will
> > fail to start and errors are rather cryptic like:
> >
> > qemu-system-x86_64: egl: render node init failed
> >
> > To fix this, users likely need to
> >
> >  * modprobe vgem
> >  * add their user to "render" group to write to /dev/dri/renderD128
> >
> > If access is not available due to missing HW, driver or failing access,
> > then skip the test:
> 
> This should be a failure rather than a skip. Otherwise, autobuilder
> testing will silently regress and no one will notice. The error
> message should include information from IOError as well so that it's
> clear that the issue is device file permissions.

Then this change is not needed at all. Test already fails if render device
is not available or if access fails. In my experience very few environments have vgem
driver loaded and "render" group permissions for the user running the builds and tests.

Cheers,

-Mikko

