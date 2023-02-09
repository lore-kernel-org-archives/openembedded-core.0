Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F137C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 12:23:17 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.13019.1675945396550382545
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 04:23:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=VRkd5Rhe;
 spf=pass (domain: linaro.org, ip: 209.85.208.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-ed1-f51.google.com with SMTP id q19so1983288edd.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 04:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7igq/C+KFlUAgVvTIRxVgy7EeNoAHcmf9u6DViiLp+U=;
        b=VRkd5RheH6UYQL7fx1uSFV3ua8UIDKjxIfY7iBwljQ+ubVUelen6gRKIyoddf7sM20
         pVfGGi8jkKTS81k0RkPVMBKS/GKjOuAyarRqGCWwL0NtIf0Gl3Sg37QPzGsr2vKjn13N
         PQxW2nc047mBS4SGNr5tLwmCsBNnhJcJ4IWyJFkcnzpbKLr7RpeQMTblzqN349E3acyX
         z6QT3cylHqL0+bmPezHsynCJAg0+jG47Nm3ljcEZJ1hE6mJNXPwy5ICQ986G19CqP5Rb
         MEXfSgrVHsQw0V89zHjzmM+o1UMbYM+XnHnJseKWzi3h41RA7pofUi2rfKGVGYDl2xsm
         9vKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7igq/C+KFlUAgVvTIRxVgy7EeNoAHcmf9u6DViiLp+U=;
        b=57CkK/LikzG24L17/sZGxPRoaHEJfm6EtjldrvNxFrQbc3bs/luuOzP5nevk9LPn0L
         nPSaN5F1JzHRjhbVeuLBgnx25uT0+YIuNo6T5sbxC2Y2JAVGLwZx+WA4T5I0kjTvQl5c
         tr+uSXszr2Sqc7V9tKw9tT4jEVNJIGv3k/GzEl5vHqzOBCeIqO4a+/kduORPGPiZLu+0
         Kx+tRRWX3tiwvnHFS+FsQxv9fy3QnByapOvyBthfv3S5XTAAum0JCOtlTodDckNYvrfj
         ahNRjj/M5yRE95Hy4bw8pw9++8oNsHCAhs0u8yXrZDotGx3F0+QOrnWtVF1mfVKyH7PG
         R1Fw==
X-Gm-Message-State: AO0yUKUzoinI5SUdHqblQ/EASqWvz7NZDG4mabv6vcRQfishw7qD4qpl
	0DPnMLfhQe6ZiNk+T6oVPMUPOw==
X-Google-Smtp-Source: AK7set8Q9QCH1Nj6ESJrFrLtCziWMhMbAS++t666nDOPvznupdF6RKUHsG6GTTEUatR5kQ71XIlKFQ==
X-Received: by 2002:a05:6402:ea2:b0:4aa:b38e:28f8 with SMTP id h34-20020a0564020ea200b004aab38e28f8mr7098922eda.13.1675945394707;
        Thu, 09 Feb 2023 04:23:14 -0800 (PST)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id g25-20020a50d0d9000000b004a2569f6ba0sm691096edf.82.2023.02.09.04.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 04:23:14 -0800 (PST)
Date: Thu, 9 Feb 2023 14:23:12 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 2/8] oeqa ssh.py: fix hangs in run()
Message-ID: <Y+TlsC4RYFmucKf8@nuoska>
References: <20230209080936.148489-1-mikko.rapeli@linaro.org>
 <20230209080936.148489-3-mikko.rapeli@linaro.org>
 <b9dd7731ad6e5e5bbe2a061f87c2d2452ca6524f.camel@linuxfoundation.org>
 <Y+S+g0W4NZ+0zd5g@nuoska>
 <CANNYZj9Hr2AZSuXutfF8kktatFt-AmsYT2bp9oauOLLFonQ5wQ@mail.gmail.com>
 <Y+TVGJ+OOfSL+pBX@nuoska>
 <CANNYZj8KYxL_W+oPXT4T+MU3RtB6h4t7egdassM1W__9yoATxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj8KYxL_W+oPXT4T+MU3RtB6h4t7egdassM1W__9yoATxA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 12:23:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176950

Hi,

On Thu, Feb 09, 2023 at 12:42:09PM +0100, Alexander Kanavin wrote:
> On Thu, 9 Feb 2023 at 12:12, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> > select() returns with any data, even single character. Fancy readers
> > will read larger chunks but will read more data than is available and thus
> > block for ever. Plain read() will read the data which is available from
> > select() and thus really small amounts like single characters if that's
> > available over the socket. This is visible in the partial read output of
> > do_testimage() task output log which becomes quite unreadable without change.
> 
> Yes, but this does not explain why single characters happen to begin
> with - RP offered a hypothesis, but the problem is that data arrives
> that way, not the tight-loop manner in which we're reading it.

Without the sleep(0.2) with ssh, the do_testimage task output can be like this (which
isn't too bad, just annoying):

DEBUG: [Running]$ ssh -l root -o ServerAliveCountMax=2 -o ServerAliveInterval=30 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR -p 2222 127.0.0.1 export PATH=/usr/sbin:/sbin:/usr/bin:/bin; cat /etc/controllerimage
DEBUG: Waiting for process output: time: 1675942983.6053402, endtime: 1675943283.6033137
DEBUG: Partial data from SSH call:
cat: 
DEBUG: Waiting for process output: time: 1675942986.2085373, endtime: 1675943286.208536
DEBUG: Partial data from SSH call:
/etc/controllerimage
DEBUG: Waiting for process output: time: 1675942986.2111514, endtime: 1675943286.2111504
DEBUG: Partial data from SSH call:
: No such file or directory
DEBUG: Waiting for process output: time: 1675942986.2140906, endtime: 1675943286.2140894
DEBUG: Partial data from SSH call:


DEBUG: Waiting for process output: time: 1675942986.216261, endtime: 1675943286.21626
DEBUG: [Command returned '1' after 2.64 seconds]

I think qemu is just slower than what anyone expects, including the ssh
protocol which does some buffer but then gives up. It may also be the
kernel and image running under qemu which busy starting up, e.g.
generating entropy or keys.

With the sleep(0.2) output is:

DEBUG: [Running]$ ssh -l root -o ServerAliveCountMax=2 -o ServerAliveInterval=30 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR -p 2222 127.0.0.1 export PATH=/usr/sbin:/sbin:/usr/bin:/bin; cat /etc/controllerimage
DEBUG: Waiting for process output: time: 1675945065.6815689, endtime: 1675945365.6790204
DEBUG: Partial data from SSH call:
cat: /etc/controllerimage: No such file or directory

DEBUG: Waiting for process output: time: 1675945068.308055, endtime: 1675945368.3080513
DEBUG: [Command returned '1' after 2.83 seconds]
DEBUG: Command: cat /etc/controllerimage
Status: 1 Output:
cat: /etc/controllerimage: No such file or directory

NOTE:  ... ok

Similar thing happens then over serial console which is even slower. I
know debugging the data read and written to serial are not wanted but I
had the changes in place and saw bootloader and kernel messages being
read initally one character at a time and later on 5-10 characters at a time
which made debugging problems really annoying. The small sleep does
improve things, doesn't solve everything but also doesn't really harm.

No data is lost and less time is used looping around the file
descriptor.

Cheers,

-Mikko

