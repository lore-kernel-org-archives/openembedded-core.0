Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.3768.1587638722392791828
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 03:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C297LHx9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id d17so6247493wrg.11
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 03:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=RwzlPEWCwu/mMvrpTqsrndiu08qOnfzCXxAULobWKhY=;
        b=C297LHx9DsIV1SOM+yeCsLHT3n2lCQJlo7930PqFiQe9VI5Vb03IvplSGHEL0LIGGa
         kTT+hn155n/5Icr9VnlOfRAoGR3tYfJT2X8eLTIezgEoNOfUQqUxuBet+/nhWTlF0N2i
         GjwViTenfSsgbAXr4akB4fA5iRy2xF0JM9FNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RwzlPEWCwu/mMvrpTqsrndiu08qOnfzCXxAULobWKhY=;
        b=r3xddbZOfaZxb3ZAHZ2nJJYb0uLR94sPX0XOI4vSuyZh6OcVNHcnH40OMjRl5vm1Bh
         u2y+qIQvg5NO8FCU4O+Zr6Tx+3yYMF2FbH48PXAXr1bOi3STNr4bzrYk9QOGEt0/6Usb
         aoQuD3FJm0w5x/DKmhmelPuZxqgodFt7uloPcoAv7UXPPTSswuHY4zu8dDNf6GLRi7Q4
         wGH5RUE54kGnNarAkzrF8OCEqPHtolOSv2puhfT0e8AzKqmvy/n309XdygFHnV65C6Fh
         gIVU1Rgmq0laofV8L7UFI4VYWgRnHGJRiCM1NxhO2qeBbGhXHxXvMtEvuJNuLg7DqogN
         vsdw==
X-Gm-Message-State: AGi0Pubqbpwc8Pm5KvQ0/2tFkV94i/VHdO0PVXP3oeT7RcxhMl7urVZ/
	W9w85OSqq93ziCT2x65uaFgI8A==
X-Google-Smtp-Source: APiQypID+DLaCoaQaQa8mi7/20a2ORVTZWcL3CycF1ToYGHPZ5E5GkYq+xDFRcAO0SsqqKr0b6b+bw==
X-Received: by 2002:adf:f0cb:: with SMTP id x11mr4303933wro.266.1587638720794;
        Thu, 23 Apr 2020 03:45:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id q184sm3059241wma.25.2020.04.23.03.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 03:45:20 -0700 (PDT)
Message-ID: <ebb64c86224b51b49b1d86f864566ecd91696f95.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v7 00/10] Fix permissions and embed-rotofs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Paul
 Barker <pbarker@konsulko.com>
Date: Thu, 23 Apr 2020 11:45:18 +0100
In-Reply-To: <CAPybu_1XdULtkfUQsjTa=PvuyUECKpNLoFXX95F_+Ly3=fbqBg@mail.gmail.com>
References: <20200419063539.1467641-1-ricardo@ribalda.com>
	 <258be2a52105a49413b954df67e61444dc73492e.camel@linuxfoundation.org>
	 <CAPybu_1XdULtkfUQsjTa=PvuyUECKpNLoFXX95F_+Ly3=fbqBg@mail.gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-04-23 at 11:57 +0200, Ricardo Ribalda Delgado wrote:
> Hi Richard
> 
> Thanks for the test.
> 
> All the errors seem to have the same pattern:
> 
> FileNotFoundError: [Errno 2] No such file or directory:
> '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-
> 27135/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0-
> r0/testimage/qemurunner_log.20200423015612'
> 
> I do not believe that it is related to my patchset, I have seen that
> you are already running the selftest without the patchset
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/850
> 
> Lets see if it also crashes or not. I am also trying to replicate
> locally.

It did recur:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/862

so your patches are probably not the cause, sorry! :)

I'll continue to try and track it down.

Cheers,

Richard

