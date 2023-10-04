Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5EBFE7C4EF
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 19:34:29 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.4115.1696448062371850798
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 12:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=U+fRcGq+;
 spf=pass (domain: linaro.org, ip: 209.85.208.182, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2b9338e4695so2475841fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 12:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696448060; x=1697052860; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8P3725QV2ZGM9Bx2KAE/giYg7Bdvt7G4SZhj7+9ldIA=;
        b=U+fRcGq+f87oKQdBl9aoQffPzVp3j2bZALJZqWA0nlRhn8D3X7/t7C14oJqqdoAV6i
         ol4n7KM0pQCVs+JKqD8B3T0wYq89u9VJzwE9o8GdWZcPz1ZWXIpj5/9V/FKkDmyucRR0
         Xn6P69u6ZWDgdTm3PQySYrPRvGsd/d8t0qbJ87DTmMAK+UDssb0eewDMaJhIXENSfoBO
         GfdkT7Ho9x8azgQF4XeQhG8MAUPkLUiVQozxrTix293EAEWU8iFWn0YBlS5/uwMfxPme
         aeVPkcqoxG9kyWBamxC7TfJVw+NM/puwxtQuNM9RTaWZmGt/Jz4rp6LpRlJ/jdTMDokp
         WnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696448060; x=1697052860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8P3725QV2ZGM9Bx2KAE/giYg7Bdvt7G4SZhj7+9ldIA=;
        b=TFF1JYbDIsdJ29sMy6MXaobLdcZ9xGqSuz9YyKAn/LYxZOqs3eNgZgbVLnsei0uvif
         Vmz8qVIAXwyQV3Fhv/EIoUl+ae5x9XuiGmGiWmKryZi5HJ4ARMWKHMk+1lXpFtbb2lGx
         nCNDzpPhGkInZ3+qeQDbM09ID+B93Ok+G3ZjYcUjsgFrtCzfeWvZXK6PUNEbv1qqilTF
         ZHhw3bOyiX3RHtC8hbcf+ie6PHpuIKqo8b1/N1X4CRkcP+j1lu1Oe2fgxEEpQDzEk2Ty
         N0Nm2uhXjg9K7+v2z0zjazwCQ8nECWx5sD8yu+0nqtjtxYCWdxRZ20Zc8j96xaHz6aC1
         862A==
X-Gm-Message-State: AOJu0Yw1ijfxRyqaL3iCDL7ok1wIEMm+1cIlz6tAxd8X/Dnjen/DxcLB
	MvWj0jXLRwY0Cpmnuj/q0HUooA==
X-Google-Smtp-Source: AGHT+IHxYWjg+TTnPDyycxuXGPG1fb+TYzOSmMQGu54x+Xe89HgyI9sJiBKXEn6/xgeIQ7EUONppQg==
X-Received: by 2002:a2e:8ed9:0:b0:2bc:d5ad:2758 with SMTP id e25-20020a2e8ed9000000b002bcd5ad2758mr2897721ljl.5.1696448060454;
        Wed, 04 Oct 2023 12:34:20 -0700 (PDT)
Received: from nuoska (dc7g6tyyyyyyyyyyyyhbt-3.rev.dnainternet.fi. [2001:14ba:16cb:a800::183])
        by smtp.gmail.com with ESMTPSA id p17-20020a2e8051000000b002b6c61bac2esm782090ljg.92.2023.10.04.12.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 12:34:20 -0700 (PDT)
Date: Wed, 4 Oct 2023 22:34:17 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 5/5] qemurunner: Show both the login console
 log and all logging upon failure
Message-ID: <ZR2+Of26qhx9vRnv@nuoska>
References: <20231004123823.2990916-1-richard.purdie@linuxfoundation.org>
 <20231004123823.2990916-5-richard.purdie@linuxfoundation.org>
 <ZR1jk6AlAXCswWJw@nuoska>
 <61c00ad09a90ebc9886e2ddee069f0817b0069e9.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61c00ad09a90ebc9886e2ddee069f0817b0069e9.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 19:34:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188698

Hi,

On Wed, Oct 04, 2023 at 02:29:40PM +0100, Richard Purdie wrote:
> On Wed, 2023-10-04 at 16:07 +0300, Mikko Rapeli wrote:
> > Hi,
> > 
> > Acked-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > 
> > for the full series. I hope our discussion over #yocto irc channel
> > helped resolve these and the test failures seen with master-next.
> 
> Yes, thanks! It was useful to have someone to talk the issues through
> with and much appreciated.
> 
> Sadly I don't think we've found all the issues yet.
> 
> On the build N-1 we have a selftest failure on debian12-ty-1:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5803/steps/14/logs/stdio

Can I get from this test run stdio to the more detailed task, qemurunner or qemu boot logs somehow?
Or do you have to dig into the system manually to capture them, like in the example below?

I would like to check into the detailed logs from both passing and failing test runs.
Of course kernel dmesg would need to be there so maybe after your patch to the runqemu
side at least.

If there is a regression in kernel to the serial device detection and numbering,
then we need some way to see e.g. 8250 uart/tty0/ttyAMA0 related dmesg messages.

Cheers,

-Mikko

> with these logs saved:
> 
> https://autobuilder.yocto.io/pub/failed-builds-data/6.5%20kernel/d/qemurunner_log.20231004022851
> https://autobuilder.yocto.io/pub/failed-builds-data/6.5%20kernel/d/qemu_boot_log.20231004022851
> 
> which suggest that ttyS1 never got any output but a getty did appear on
> ttyS0. I confirmed there were only two serial devices in that
> configuration. The exact image downloaded off that worker and run
> locally worked so it isn't the image, it has to be some kind of race.
> The image does have gettys configured for both serial ports. The kernel
> boot log isn't present which a patch in this series attempts to fix.
> 
> There was also:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5528/steps/13/logs/stdio
> 
> which looks again like a getty didn't show up on a serial port. We
> don't have more logs for that one but "Running postinst /etc/rpm-
> postinsts/100-sysvinit-inittab" worries Ross and I a bit. It may or may
> not be related.
> 
> That brings me to:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2199
> 
> which has two failures, I think both in commands run over the serial
> interface. These ones appear to be more reproducible on ARM.
> 
> I'm trying a new build run with this series applied to see if that
> helps shed any light on what is going on.
> 
> Cheers,
> 
> Richard
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 

