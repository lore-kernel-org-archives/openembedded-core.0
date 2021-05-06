Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.8464.1620303388418215381
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 05:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fgGeuAgt;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id n15so1278393edw.8
        for <openembedded-core@lists.openembedded.org>; Thu, 06 May 2021 05:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=geY7whiNwQ38XTYxdpB387GjnflKK6IDdIUjNPQYN7w=;
        b=fgGeuAgtkG8DRSrwI22Z/Pb69pAZsgaA1ZfiMXbR5LeU6Ap5vbns/AU6NeJ+HnkiH1
         mKdyjc8KTl1Shcb8Bt4ryfyWxcCbz0RQLRgvDCq2+jS99Pa9zDOGWPQT13AK8VCmXo1k
         QoEJxYUizxeqnSf7RuHLBnSmKv/FPj+HfspBJnjD/F4Abi2fsKytAcPiHu93eZhJIAWE
         l1punltZDafRRYO7BSPLL9tFGKwNkOJAO6QALUIMsUyV23CT5EvzB/jbUh6bzUx43n3i
         +0KuUNe4VhQ618gtgsYlwsNNEdBpu2/Mrlc2uhXV6ZGMTDIuEpl7VOVb83/P2ucuU8CR
         0t3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=geY7whiNwQ38XTYxdpB387GjnflKK6IDdIUjNPQYN7w=;
        b=HKEF/Q8k34kZ3Xd79RzaMDPuoyXIs/r1sjIFKaT2riMkqj0rNB98Rilaou5M7AewRQ
         cgWs+XY9OM+n3VJxhT6/tDR18rblIpW+ahzkhsXkziyfzpyOX/zDJY5I2G0QZ2jqjjze
         Gg6HG2821pLqnc1z6c4YXXPZW1ROpPgp7w+StNHc0TvYkqfbjkhqNahZ1zlYH6NXdV/w
         BYVPWTMye9JhsskM5ojKIjl4clh7mOS56Wv4vfQ2NCheoGyUSMfJHH5b0hhZkL05/DY1
         fuEVCicK1bK8FThO+RM5/+2fcC2EbV1wS9ACBecn28f5NG5HBCCHP28zKOmwN3gqCSoy
         JdLg==
X-Gm-Message-State: AOAM532e1uzGb4k2Km0nGB4i4zSHEK518voH3Nx2Sao89b/lSBpg2URp
	oXbNA+kcXnts15deOijNooYltQJ4CB4mgkQu0EE=
X-Google-Smtp-Source: ABdhPJw108UvqOp4htpBRQEL8jVkKj8dfuBNdZH5KId2rFgGdtq7Lw7wk/UXPw9H/g+RdmcSJm708O07bFgb8dSoxvI=
X-Received: by 2002:a05:6402:105a:: with SMTP id e26mr4808626edu.164.1620303386925;
 Thu, 06 May 2021 05:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210505175821.39714-1-bruce.ashfield@gmail.com> <a86ae7902cb7b63b25b9696d617a1012663f89a0.camel@linuxfoundation.org>
In-Reply-To: <a86ae7902cb7b63b25b9696d617a1012663f89a0.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 6 May 2021 08:16:15 -0400
Message-ID: <CADkTA4PheTUxTbFTU0Sn9xmmh7rN50Lryws5WLKbAYg+DsCQaQ@mail.gmail.com>
Subject: Re: [PATCH] linux-yocto/5.10: qemuppc32: reduce serial shutdown issues
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 6, 2021 at 3:30 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2021-05-05 at 13:58 -0400, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Integrating the following commit(s) to linux-yocto/5.10:
> >
> >     qemuppc32: reduce serial issues seen on shutdown
> >
>
> Thanks for this, I appreciate being able to test it quickly. We are seeing
> a warning from it:
>
> WARNING: linux-yocto-5.10.34+gitAUTOINC+16df1d13c6_85c17ad073-r0 do_kernel_configcheck: [kernel config]: This
> BSP contains fragments with warnings:
> [INFO]: Fragments with duplicated configuration options:
>     - fragment configs/v5.10/standard/qemuppc/bsp/qemu-ppc32/qemu-ppc32.cfg has a duplicated option: CONFIG_SERIAL_PMACZILOG_CONSOLE
>

hahah! of course.

Don't you hate it when your own checks keep you honest ?

I'm now both enabling that, and then disabling it within the same
fragment. Which is why it warns.

I'll send a v2 shortly.

Bruce

>
> Cheers,
>
> Richard
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
