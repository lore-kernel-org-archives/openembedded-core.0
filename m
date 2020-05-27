Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com [209.85.222.67])
 by mx.groups.io with SMTP id smtpd.web12.1129.1590619389604359178
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 15:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cScMa/+8;
 spf=pass (domain: gmail.com, ip: 209.85.222.67, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f67.google.com with SMTP id g14so3317421uaq.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 15:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ByWsITOT/lS3La83Z1/lPfZOnPH/ZmF0NfdfqEy2zFQ=;
        b=cScMa/+8lmqp3soiaSyCkpbeGGKwX7uN9jdaAHoF4hSSBszhzQSdy0Q7iDUwZC/1ww
         q+6C40U/WcO27ZLRt73L7mEl5MpMkORDBFG0xaGuWpY9PHWGcJhFKbLhBnP9c8dJPyBO
         Am0NySnngxx72RGVsGu9Y/E26RcY4MH0DP3NhWyE0fR3CHt8WiGc1WFdDbmFflXOyQyE
         t/1rfWZFNI5C/RB0iFKLqji+9x9/GPTqTtIzQIJG5sP48/IB7HJAVhHfbyUtjM41/qA9
         FDBJbHLvsC8dvx01jWuze6OTaaJV6/0mHNfT0BGkFhRSEb7TKule6PDyJgiPIxm7pSHA
         zcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ByWsITOT/lS3La83Z1/lPfZOnPH/ZmF0NfdfqEy2zFQ=;
        b=IBL7aw6vKIuiGT+Ty/Aw9m0HirD4JDh7J2Mxfrf6hOLzD4RKgPBLc1CkGwTsGvmWHJ
         WATPhA468XPddDULObbPG8ELvs3JFq05CE08EfJ/a95kkyHh9hb9AE2dNAfGCWymtcrZ
         71Wc+vrLp6NPLu8xqX6P+WzGRs0anIyXQyTeZj3+xDeCVwszPxY2zz5GjUgZ3hRqKiKG
         1mxzESg96315I0MYhIOGJHRehL+4BJtzrpJ4RM0sRouzYWxJ0KI3mPft+a9coO1WGD3e
         eY8QcH0GFRrwh+MomRRn+ELjIsHeFRUc6ZtfIQPBSNxGOkoakibj6CPtrFRgMZNHfRKS
         1z1w==
X-Gm-Message-State: AOAM533bhWvN/J2nnCAfJaFu4LQGhjcK1mIPyBQIVzazqrf5iqsO+V2G
	sesNp/sNJzUfJlgD1xZNeT1xLsfIYTMcdXWKumg=
X-Google-Smtp-Source: ABdhPJzjhCwudqYfb/ggr5cXbfZlpLvHmPz91JIZnUXWuU0nqDcTVcM7yFqnD0uC8u+6OXq/Z6wh4UFJxZv+DJ7GsM0=
X-Received: by 2002:a9f:2788:: with SMTP id b8mr34601uab.81.1590619387849;
 Wed, 27 May 2020 15:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200527155011.3165976-1-raj.khem@gmail.com> <20200527155957.GK17660@denix.org>
 <765f3daeb6ce5f28c2d1e258dd303f5707363678.camel@linuxfoundation.org>
 <CAMKF1spMw=6ZfkBWy3=+rSiHknxLvVC6uPH3Q8z_UiGdOECVdw@mail.gmail.com> <20200527215251.GA20867@pbcl.net>
In-Reply-To: <20200527215251.GA20867@pbcl.net>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 27 May 2020 15:42:57 -0700
Message-ID: <CAJ86T=X=su_-PaAG_fqs-AjFb_ZFPtvRJTFvP9ZOce1Kv1Z3nQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-libc-headers: Check for asm/bpf_perf_event.h before multilibbing
To: Phil Blundell <pb@pbcl.net>
Cc: Khem Raj <raj.khem@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Denys Dmytriyenko <denis@denix.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 27, 2020 at 2:52 PM Phil Blundell via
lists.openembedded.org <pb=pbcl.net@lists.openembedded.org> wrote:
>
> On Wed, May 27, 2020 at 02:46:24PM -0700, Khem Raj wrote:
> > and building userspace against way newer kernel-headers with older
> > kernel underneath has unintended
> > consequences.
>
> Can you be more specific?  If this doesn't work, it's just a bug and
> should be fixed.  What problems are you having?

I don't have an up to date example, but I've been using kernel version
specific libc headers for all my projects for many years. The issue
which prompted me to do that was run time crashes from libcap-ng and
the historical commit message was:

----

 linux-libc-headers: use 3.3.8 kernel header files for mips platforms

 If libcap-ng is unable to probe kernel capabilities at runtime then
 it will assume the kernel supports all features defined by the libc
 kernel headers. Since our default libc kernel headers (linux 3.14)
 define capabilities which are not available in linux 3.3 based
 stblinux kernel used for our MIPS platforms, that causes runtime
 crashes.

 As a workaround, force an older version of linux-libc-headers for all
 MIPS platforms to try to remove that discrepancy between the kernel's
 capabilities and those defined in the libc kernel headers.

----

The risk of using bleeding edge linux-libc-headers with an older
kernel may be low, it's not zero. Since OE testing doesn't appear to
include any coverage of older kernels, I'm not sure why I should be
the guinea pig and take the risk!
