Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1349E92710
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 15:27:59 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.18472.1696519674601503546
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 08:27:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=eda5r3zw;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50435a9f800so1473443e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 08:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696519673; x=1697124473; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MsjYhMBJq8XSRHhg7rrWcRKNE2dt7tfGd/PH771v+kY=;
        b=eda5r3zwFqN4wqjvSeJwCywS9VwTW6oRrnU9025HIYVgzDATfbLisp/mz22/x+d2nM
         poX6Rrk0LaTLYqmopaQOuqf1cjV97t0sFWmtCIJM5qhflkoa/3Km2SZ5GW3Dt3rnZZEX
         sRiHI6rtPi4RuR7ryRGUmE0e4x8kOn+MuP2CQ0Hngpv2scEL6VtzovoF7stuTzoqIiQe
         iKp2JHSIyAiNFGQQEbpHxpZfJLmjQ/eaMehxk+kuL4OTNoddCUIRAeVB6HfdVGK5HwxG
         DvlSUCS1d5vKM6izf3YDZ/jVV2sOb7uNSLzgxXSDWfb4AMDqYdMvalR6NqWW0sqR8w5i
         N4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696519673; x=1697124473;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MsjYhMBJq8XSRHhg7rrWcRKNE2dt7tfGd/PH771v+kY=;
        b=utO1KwlnoCiabRCmYFNq9N/hCtIcbQpTnb5gjgxcY+gd5qweOhwdBefELjxjnyxwUj
         LWCFvubQFgkKNv29KY3Ztxr8ejKdMqdjCA0/GV5nyg+s+P0o7r9nxrXsMLL4gi9WDejc
         OTSq8kQiQOo2TXVBKuNKOBkIClmp1r8ORlLaUtqf9lvUMjTj0b3Yg/ff/mtNRf1QBm70
         xA28I8H1CyNOhSuLrSuZkCGux8p+uv2fkyyDV+K6KHG4kwc90UZzicRgykEkJBWrvWyL
         UEgr/RLE/ifAZHU7UjG78Zs6cv7w6Ac/apfXbJhuxoecMXyALf19Cw4UM51g1vStOK2G
         xqAg==
X-Gm-Message-State: AOJu0YzdympxJNB+Rz8qiX0IvW+KgGRymuGZlBE1Tj57EHf1LZIZwGjz
	BuBLXSMHzFN0nhd8Vv7TY/61TA==
X-Google-Smtp-Source: AGHT+IF2Hrznt7lNrYTqT6A/UWy+dUAop8pFhXmiKHZzzATr7OycUa1dLLNGeAze/7rLubSkCPw4jg==
X-Received: by 2002:ac2:5b5c:0:b0:504:3093:1fad with SMTP id i28-20020ac25b5c000000b0050430931fadmr4647544lfp.20.1696519672635;
        Thu, 05 Oct 2023 08:27:52 -0700 (PDT)
Received: from nuoska (dc7g6tyyyyyyyyyyyyhbt-3.rev.dnainternet.fi. [2001:14ba:16cb:a800::183])
        by smtp.gmail.com with ESMTPSA id g21-20020a19ee15000000b005007e7211f7sm342461lfb.21.2023.10.05.08.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:27:52 -0700 (PDT)
Date: Thu, 5 Oct 2023 18:27:50 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 5/5] qemurunner: Show both the login console
 log and all logging upon failure
Message-ID: <ZR7V9ogs9aV7Pqux@nuoska>
References: <20231004123823.2990916-1-richard.purdie@linuxfoundation.org>
 <20231004123823.2990916-5-richard.purdie@linuxfoundation.org>
 <ZR1jk6AlAXCswWJw@nuoska>
 <61c00ad09a90ebc9886e2ddee069f0817b0069e9.camel@linuxfoundation.org>
 <ZR2+Of26qhx9vRnv@nuoska>
 <d8836f8a7338be3a8653be54319e21133cb125d3.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8836f8a7338be3a8653be54319e21133cb125d3.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 15:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188725

Hi,

On Wed, Oct 04, 2023 at 09:35:20PM +0100, Richard Purdie wrote:
> On Wed, 2023-10-04 at 22:34 +0300, Mikko Rapeli wrote:
> > Hi,
> > 
> > On Wed, Oct 04, 2023 at 02:29:40PM +0100, Richard Purdie wrote:
> > > On Wed, 2023-10-04 at 16:07 +0300, Mikko Rapeli wrote:
> > > > Hi,
> > > > 
> > > > Acked-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > 
> > > > for the full series. I hope our discussion over #yocto irc channel
> > > > helped resolve these and the test failures seen with master-next.
> > > 
> > > Yes, thanks! It was useful to have someone to talk the issues through
> > > with and much appreciated.
> > > 
> > > Sadly I don't think we've found all the issues yet.
> > > 
> > > On the build N-1 we have a selftest failure on debian12-ty-1:
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5803/steps/14/logs/stdio
> > 
> > Can I get from this test run stdio to the more detailed task, qemurunner or qemu boot logs somehow?
> > Or do you have to dig into the system manually to capture them, like in the example below?
> > 
> > I would like to check into the detailed logs from both passing and failing test runs.
> > Of course kernel dmesg would need to be there so maybe after your patch to the runqemu
> > side at least.
> > 
> > If there is a regression in kernel to the serial device detection and numbering,
> > then we need some way to see e.g. 8250 uart/tty0/ttyAMA0 related dmesg messages.
> 
> I can't capture everything in time in each case but I did grab:
> 
> https://autobuilder.yocto.io/pub/failed-builds-data/6.5%20kernel/e/
> 
> which is from
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/7863/steps/21/logs/stdio
> 
> which has this threads patches applied.
> 
> I've put two sets of logs there from the same builds, one success, one
> is missing the getty on one log.
> 
> 
> I also have the logs from:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5848/steps/14/logs/stdio
> 
> which I've saved here:
> 
> https://autobuilder.yocto.io/pub/failed-builds-data/6.5%20kernel/f/
> 
> noting that:�
> 
> https://autobuilder.yocto.io/pub/failed-builds-data/6.5%20kernel/f/qemu_boot_log.20231004134427
> 
> is 3 bytes in size.

All this is very confusing indeed. I sent another version of the detect login prompt without
utf-8 conversion, with some luck that could help. At least on some of the logs the login prompt
is there but with lots of garbage around it. Serial port core got refactored in 6.5 and diff to
6.4 is quite large so there could be bugs there, and those could be triggering new
errors visible to userspace too.

Cheers,

-Mikko

