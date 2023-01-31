Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78210C636CC
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 07:38:12 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.7299.1675150685585189480
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jan 2023 23:38:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qkTKd3GY;
 spf=pass (domain: linaro.org, ip: 209.85.208.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-ed1-f54.google.com with SMTP id q19so3566563edd.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 23:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mMPCfDQ6wG1XQGXc1ihhHuTeanEFxLoomE9asMu8CLM=;
        b=qkTKd3GYW1a41yjJP3097Xn3zIaOj7kO/knTQmx7urdyzwr2bdUbgWY4Lzco5hcTYZ
         yGCXkhsAYV9HUA9r4GBhZ3MxjSWuY+TB/4TVVhv5XKFXGPl/qJPccyBVRb+ltPuBvPFV
         o4syXGE0SjsM/t/6NYiNGqJdnTFiVeZMcc4JjJpfYyA7R51aVBPLquBJl7k7s/XH7FIZ
         0jKRXZk70CK1JoaVL9cDTqJRrBBgMQTQpUXsri8azDvwzcjKuULBsdnI0RScO2ZyFtjE
         xrT70j973ynzxi18HN58jQnEiTc/FZUSkp8sgkMyxLW3nPVa/R2ybgUkEDIUSYmhVo2K
         sbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMPCfDQ6wG1XQGXc1ihhHuTeanEFxLoomE9asMu8CLM=;
        b=ht+3Dt/z6LmfUyygLE18ao1FI/3s15t/z2AyJY1LbcasuAo/fA/CQH3sNZp35F5m2S
         r9XJ1RROPZQD2xITpqkGsuT41QRDc2er/3t+390/YwR9OIZo2J+weOZIPchPGZ5W5pEV
         Y/thEYxLflw53tiAguOKdzXJYx7HMt90ZA4rXX/wWcymfI2X3yvU6nPvTPyva5JOttbo
         nhGQ0d03+SrQ10tyr4KHkA+gebs4Hqu4pLTtzBApw3neQCR8TfnAhPmYeXFHLHQkMdQ3
         mz810Q/kv3c1FaIxcaQFQ3FYNRhrowEXl6L3GmMP67i7Wed8FN6gxsNfhVnYPpyrVgzC
         +DLg==
X-Gm-Message-State: AO0yUKX/ypC7Yzfl854oMSaiK3YTkx9+rjqMbS6M/4FpMZ76xQZjHC5s
	Q5FprcsDo9yVNER0ZUiBzq0kmA==
X-Google-Smtp-Source: AK7set9ugcxZ4xitGi4CrkO/62VWyLLrVAw3Ei3wEEyOvM/9pqlrc0XcDNZpGHiJcwXmzKwRQ/H0Aw==
X-Received: by 2002:a05:6402:4d1:b0:4a0:a7d8:500e with SMTP id n17-20020a05640204d100b004a0a7d8500emr25020832edw.20.1675150683866;
        Mon, 30 Jan 2023 23:38:03 -0800 (PST)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id 21-20020a170906311500b0087045ae5935sm8008307ejx.1.2023.01.30.23.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 23:38:03 -0800 (PST)
Date: Tue, 31 Jan 2023 09:38:00 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH] oeqa/qemurunner: do not use Popen.poll() when
 terminating runqemu with a signal
Message-ID: <Y9jFWJg9baNOeryh@nuoska>
References: <20230130221125.2299244-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130221125.2299244-1-alex@linutronix.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 07:38:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176507

Hi,

On Mon, Jan 30, 2023 at 11:11:25PM +0100, Alexander Kanavin wrote:
> This does not actually guarantee that the child runqemu process has completely exited:
> poll() may return prematurely while the SIGTERM handler in runqemu is still running.
> This thwarts the rest of the processing, and may terminate the handler before
> it completes.
> 
> Use Popen.communicate() instead: this is what python documentation recommends as well:
> https://docs.python.org/3/library/subprocess.html#subprocess.Popen.communicate

Was I trying to solve the same problem in
https://lists.openembedded.org/g/openembedded-core/message/176203 ?

I think so.

Cheers,

-Mikko

> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/lib/oeqa/utils/qemurunner.py | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
> index b5fed6c9fe..8b893601d4 100644
> --- a/meta/lib/oeqa/utils/qemurunner.py
> +++ b/meta/lib/oeqa/utils/qemurunner.py
> @@ -543,10 +543,13 @@ class QemuRunner:
>                  except OSError as e:
>                      if e.errno != errno.ESRCH:
>                          raise
> -            endtime = time.time() + self.runqemutime
> -            while self.runqemu.poll() is None and time.time() < endtime:
> -                time.sleep(1)
> -            if self.runqemu.poll() is None:
> +            try:
> +                outs, errs = self.runqemu.communicate(timeout = self.runqemutime)
> +                if outs:
> +                    self.logger.info("Output from runqemu:\n%s", outs.decode("utf-8"))
> +                if errs:
> +                    self.logger.info("Stderr from runqemu:\n%s", errs.decode("utf-8"))
> +            except TimeoutExpired:
>                  self.logger.debug("Sending SIGKILL to runqemu")
>                  os.killpg(os.getpgid(self.runqemu.pid), signal.SIGKILL)
>              if not self.runqemu.stdout.closed:
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176502): https://lists.openembedded.org/g/openembedded-core/message/176502
> Mute This Topic: https://lists.openembedded.org/mt/96639889/7159507
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


