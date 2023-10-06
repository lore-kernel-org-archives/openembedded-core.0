Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B7CE92FF7
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 07:51:37 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.7781.1696578688033118274
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 00:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=j+W969d0;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-503f39d3236so2269151e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 00:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696578686; x=1697183486; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ej/yJlb28mOPi3D4mYJejLP7vnEAZG4e35LCMc3boF4=;
        b=j+W969d0QqlENmDbOYt5J3X13ymQBkuxvE8p3RyNSSGNlRKU0aBiroDkf0vwuCPLvo
         gRmqxcql6gcfqKkyB3zMhsqudxNKvhlVjirl/07S3aPRagnKpmDWfBYIaeCqs4qMFTnt
         TsXfA9EpId4+mid+romh7Qu3Ud7YpgveorxjecbD70U8oVNJiLNgmUgxt2jp19y8awAM
         jsB6VNsSpxKFXR7CCGWwyhFzOfMh7HR8r712yhxRTS93REswlyuK7AVgni7zDvC2oX7H
         2QBkc1tN7Dkc2Cqe5OKiNaHmjVjSUO90NP662FqnocrVMaMsQw69D5peSwTQF4dfE51A
         GsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696578686; x=1697183486;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ej/yJlb28mOPi3D4mYJejLP7vnEAZG4e35LCMc3boF4=;
        b=Oi81jYs4jIapf3Rva/NDVszI7BJSA1cB2276ZTv1mCgE8gK8BwKriIZNHFLLEU2Zz0
         TcOs+Ajqan/cHzRiRP3hvc8loOV4EGFskmcdIqV2svh4S2WuDpPnSQUfqDMov2Z9bS+B
         hNlfCMbbnYVdrZp4oeEepqgQSsfj7BIVprgs+AB88+AtfLH4RtEwvIhDCFAkwqPxLR6C
         Gz3DD24LpP6CmaDbxhC8fdpUYBPXmgR9gKfc43icvv7/MJL+GZgsadCQxAmxKzsnhsrW
         3rGLQasBfsWgBRnRbkKqCVOkgSn6Akpx62xbKyvnM6oQlJ6YSSFiKqj0ukpwG9zUKiKE
         Od0A==
X-Gm-Message-State: AOJu0YxilpMUF339YXW6FFLyF8Du9PdrZb6qUEVxtiRBQl7KvehNWuQd
	kWqXWL5Sh3TZHf5216hSlS0d+Q==
X-Google-Smtp-Source: AGHT+IF1B/dVmsDKSbFNOJuWKkURcSChXMRVh23RuGJ18MA3X1RkeeTstwfsuHxxAIUxyLYt95SvdQ==
X-Received: by 2002:ac2:58c9:0:b0:503:ca:7b4c with SMTP id u9-20020ac258c9000000b0050300ca7b4cmr5452246lfo.8.1696578685982;
        Fri, 06 Oct 2023 00:51:25 -0700 (PDT)
Received: from nuoska (85-76-112-31-nat.elisa-mobile.fi. [85.76.112.31])
        by smtp.gmail.com with ESMTPSA id q9-20020a19a409000000b00501b9fc977csm199647lfc.37.2023.10.06.00.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 00:51:25 -0700 (PDT)
Date: Fri, 6 Oct 2023 10:51:23 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 5/5] qemurunner: Show both the login console
 log and all logging upon failure
Message-ID: <ZR+8e9/1QouDiyrv@nuoska>
References: <20231004123823.2990916-1-richard.purdie@linuxfoundation.org>
 <20231004123823.2990916-5-richard.purdie@linuxfoundation.org>
 <ZR1jk6AlAXCswWJw@nuoska>
 <61c00ad09a90ebc9886e2ddee069f0817b0069e9.camel@linuxfoundation.org>
 <ZR2+Of26qhx9vRnv@nuoska>
 <d8836f8a7338be3a8653be54319e21133cb125d3.camel@linuxfoundation.org>
 <ZR7V9ogs9aV7Pqux@nuoska>
 <b421bff99d46507ec63d9b1e8d0db4c6f5d38a3f.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b421bff99d46507ec63d9b1e8d0db4c6f5d38a3f.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 07:51:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188749

Hi,

On Thu, Oct 05, 2023 at 04:47:16PM +0100, Richard Purdie wrote:
> On Thu, 2023-10-05 at 18:27 +0300, Mikko Rapeli wrote:
> > Hi,
> > 
> > On Wed, Oct 04, 2023 at 09:35:20PM +0100, Richard Purdie wrote:
> > > On Wed, 2023-10-04 at 22:34 +0300, Mikko Rapeli wrote:
> > > > Hi,
> > > > 
> > > > On Wed, Oct 04, 2023 at 02:29:40PM +0100, Richard Purdie wrote:
> > > > > On Wed, 2023-10-04 at 16:07 +0300, Mikko Rapeli wrote:
> > > > > > Hi,
> > > > > > 
> > > > > > Acked-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > > > 
> > > > > > for the full series. I hope our discussion over #yocto irc channel
> > > > > > helped resolve these and the test failures seen with master-next.
> > > > > 
> > > > > Yes, thanks! It was useful to have someone to talk the issues through
> > > > > with and much appreciated.
> > > > > 
> > > > > Sadly I don't think we've found all the issues yet.
> > > > > 
> > > > > On the build N-1 we have a selftest failure on debian12-ty-1:
> > > > > 
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5803/steps/14/logs/stdio
> > > > 
> > > > Can I get from this test run stdio to the more detailed task, qemurunner or qemu boot logs somehow?
> > > > Or do you have to dig into the system manually to capture them, like in the example below?
> > > > 
> > > > I would like to check into the detailed logs from both passing and failing test runs.
> > > > Of course kernel dmesg would need to be there so maybe after your patch to the runqemu
> > > > side at least.
> > > > 
> > > > If there is a regression in kernel to the serial device detection and numbering,
> > > > then we need some way to see e.g. 8250 uart/tty0/ttyAMA0 related dmesg messages.
> > > 
> > > I can't capture everything in time in each case but I did grab:
> > > 
> > > https://autobuilder.yocto.io/pub/failed-builds-data/6.5%20kernel/e/
> > > 
> > > which is from
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/7863/steps/21/logs/stdio
> > > 
> > > which has this threads patches applied.
> > > 
> > > I've put two sets of logs there from the same builds, one success, one
> > > is missing the getty on one log.
> > > 
> > > 
> > > I also have the logs from:
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5848/steps/14/logs/stdio
> > > 
> > > which I've saved here:
> > > 
> > > https://autobuilder.yocto.io/pub/failed-builds-data/6.5%20kernel/f/
> > > 
> > > noting that:�
> > > 
> > > https://autobuilder.yocto.io/pub/failed-builds-data/6.5%20kernel/f/qemu_boot_log.20231004134427
> > > 
> > > is 3 bytes in size.
> > 
> > All this is very confusing indeed. I sent another version of the detect login prompt without
> > utf-8 conversion, with some luck that could help. At least on some of the logs the login prompt
> > is there but with lots of garbage around it. Serial port core got refactored in 6.5 and diff to
> > 6.4 is quite large so there could be bugs there, and those could be triggering new
> > errors visible to userspace too.
> 
> With the changes I've made to the logging and the raw log files we have
> without any utf-8 conversion, I'm now 99% certain this isn't any utf
> conversion issue since the login prompts are not in the raw binary
> files and those are written with no conversion. It is much more likely
> the getty isn't running or isn't communicating somehow.
> 
> I'm trying to work out how to add some further debug/testing when this
> fails in a way it will help us debug.

Alright, I was confused by logs from working login detection. I presume
qemu is configured with two serial ports to avoid mixing kernel messages with
the login prompt. It would be easy to grep for the login prompt also from the first
serial output though it would not explain the root cause for these issues
but could allow testing to move forward to the ssh connection. In all of the logs
I saw, the first serial port had a login prompt.

The serial ports are not used in testing, AFAIK. Oh now there are the debug
commands in master-next. Nice, I was hoping for this kind of data in logs when
things go horribly wrong.

Cheers,

-Mikko

