Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B8B2D43FF1
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 08:51:16 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.36268.1731919869216627121
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 00:51:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=I8vvrphV;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53d9ff92b14so3990726e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 00:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731919867; x=1732524667; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HSPf/CB1JNAguTtLmugv8+k+gP8cEC4eEk/LkS2h4q4=;
        b=I8vvrphVqJkE4cWNB6+JBINIc+uvJIh2k6POpi3BDNrlfu3/niAj0rsTkD1nz3x05+
         i4fta8iT0xnZLpgooSicLZtfPDl1rY0LESJfxpH5cZP9cwoUeMCAAl+4MSNmf26ua9/5
         hSsdrAkwKx/M/Mu/5Guzzoa3MSmi8Z5ujLk6Bpx+Sgsp+STue/VZ36IayAx0KjYFJTqh
         PudY2OYEhUTSZQ6XQuuTuYRgduHgCTzQxaxVyqHroMlqnyVk/9aYBduKfMmlksB4P8BX
         +tQOIlwpbt+ZgsvMLLTgOM/5Rs4pu4JU1OL1IU8AbTFZx5zuryQh+ZsEki+jUFMxaxYK
         r3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731919867; x=1732524667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSPf/CB1JNAguTtLmugv8+k+gP8cEC4eEk/LkS2h4q4=;
        b=W3ZE/7AF+VreQAZ2796+9JgzCYs1+g+lvu/685zy8joQoWs0EtDTd3ColSfv544Hcl
         /7Bf+AQDx843FZEmMRWAnnEoY/hofliZlcwbLEG2fBlV6NN24OcTPsTy/7/NHmLUMclT
         MPfTc7TpMkIIGOd9wCuLnuOtdymFYfGFn3eekyJgMDNU1LNQO94jOX+TfK1e45zIltUR
         S8CnOPOBB14685wVOgyQ0fJI7SKQb1agaVCZJN4aHzTcQ0tNZ75xA8gd26U45wwHkd5m
         yIqXlxBamh4n2rlpBkdQpi8NSifEx1i5/HITr3lvDABDYJQjJVYzNBtUPG+efA7H9O1L
         csbw==
X-Gm-Message-State: AOJu0Yxybq3TfCmLt6jw9smZdfdiM+8CEX9fh9ATXEgeyuewk0oSwx0v
	PU2Atu9iptCCVmic8KoZmzqsdVPKXhRWh/M5nTLr1szTFCyhf9W09xNGuDbeMjs=
X-Google-Smtp-Source: AGHT+IGCgdsdjxObv2LR9Jy5u0TZ/EDMSSawM1jVzgqhupixpkbcg/jOJbdxdN+70pCxgEoWE6oI1A==
X-Received: by 2002:a05:6512:a87:b0:53d:ab10:234a with SMTP id 2adb3069b0e04-53dab2a07c4mr3282953e87.21.1731919867192;
        Mon, 18 Nov 2024 00:51:07 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da64f8fbcsm1513240e87.51.2024.11.18.00.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 00:51:05 -0800 (PST)
Date: Mon, 18 Nov 2024 10:51:02 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] oeqa/runtime/ping: don't bother trying to ping
 localhost
Message-ID: <Zzr_9kbw8L9PHKnn@nuoska>
References: <20241114174336.3793581-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114174336.3793581-1-ross.burton@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 08:51:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207211

Hi,

On Thu, Nov 14, 2024 at 05:43:36PM +0000, Ross Burton via lists.openembedded.org wrote:
> If SLIRP is being used instead of TAP for networking to the guest then
> the target IP will be localhost.  There's no point in pinging localhost
> to see if the target is up but whilst you'd think it is harmless, in
> some containers ping doesn't actually have enough rights to work:
> 
>   ping: socktype: SOCK_RAW
>   ping: socket: Operation not permitted
>   ping: => missing cap_net_raw+p capability or setuid?
> 
> Look at the target address and if it's localhost or 127.0.0.* return
> immediately.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/lib/oeqa/runtime/cases/ping.py | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/meta/lib/oeqa/runtime/cases/ping.py b/meta/lib/oeqa/runtime/cases/ping.py
> index f72460e7f3f..bc543f6c41e 100644
> --- a/meta/lib/oeqa/runtime/cases/ping.py
> +++ b/meta/lib/oeqa/runtime/cases/ping.py
> @@ -18,6 +18,13 @@ class PingTest(OERuntimeTestCase):
>          output = ''
>          count = 0
>          self.assertNotEqual(len(self.target.ip), 0, msg="No target IP address set")
> +
> +        # If the target IP is localhost (because user-space networking is being used),
> +        # then there's no point in pinging it.
> +        if self.target.ip.startswith("127.0.0.") or self.target.ip in ("localhost", "::1"):
> +            print("runtime/ping: localhost detected, not pinging")
> +            return
> +
>          try:
>              while count < 5:
>                  cmd = 'ping -c 1 %s' % self.target.ip

I think this is the right thing to do and enables running these tests in kas container
for meta-arm.

I have seen some other odd ping test failures with meta-arm builds,
which may be related:

QMP connected to QEMU at 10/31/24 13:36:14 and took 0.58 seconds
QMP released QEMU at 10/31/24 13:36:14 and took 0.18 seconds from connect
Bitbake still alive (no events for 600s). Active tasks:
/home/builder/src/base/meta-arm/build/../poky/meta/recipes-core/images/core-image-base.bb:do_testimage
Test requires apt to be installed
Traceback (most recent call last):
  File "/home/builder/src/base/meta-arm/poky/meta/lib/oeqa/runtime/cases/ping.py", line 30, in test_ping
    sleep(1)
  File "/home/builder/src/base/meta-arm/build/../poky/meta/lib/oeqa/core/decorator/oetimeout.py", line 18, in _timeoutHandler
    raise OEQATimeoutError("Timed out after %s "
oeqa.core.exception.OEQATimeoutError: Timed out after 30 seconds of execution

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/builder/src/base/meta-arm/build/../poky/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/home/builder/src/base/meta-arm/poky/meta/lib/oeqa/runtime/cases/ping.py", line 32, in test_ping
    self.fail("Ping timeout error for address %s, count %s, output: %s" % (self.target.ip, count, output))
AssertionError: Ping timeout error for address 127.0.0.1, count 0, output: 

Then I also saw in one case that running "ping" host binary failed due to
command not found when it for sure was there on the host. I think leaked
cooker processes could have caused these and expected something to be in
build/tmp which had been removed.

While debugging into these, I stumbled on the non-cought RuntimeError exception
in testimage.bbclass which could explain the errors.

Just wanted to share these in case someone has seen similar odd things...

Cheers,

-Mikko

