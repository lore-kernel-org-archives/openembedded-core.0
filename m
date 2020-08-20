Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web12.108712.1597926595995751282
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 05:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sidebranch-com.20150623.gappssmtp.com header.s=20150623 header.b=tY5FIlc4;
 spf=softfail (domain: sidebranch.com, ip: 209.85.219.65, mailfrom: leon@sidebranch.com)
Received: by mail-qv1-f65.google.com with SMTP id o2so784342qvk.6
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2020 05:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=loqsks3wEiNa8k49dnYpIMczIk9EVJRbC+O7hv6BbMA=;
        b=tY5FIlc4RaO/zwHkzpaFNQgB8yvAwA9DHO31O+eQhceg5+p/s9RvJSpHsipUMAe7MD
         WTi7KWe9N7xVjmAmy/PLuEhap4jm4AnPe3o+rPWAB7Xl+s+DkZFEW3Vt6Yb5ZGYk7ZH/
         DDCIcuWk62YLjxTOidNbkusbowPQJ0S8lMswuPs8NN2ANy63YZIG1QLOhGGthVMlH++P
         i9det33GzvQtbFlP9nAvKw8ArdosHYkPcTfvrzkOchQmYJGzWzi0VIjPMVL9+Q3ezDTe
         ZTTpmr3wZ23foHIdkuBIo62gSaZH/WqMQgXKamBe9cNM/4e/XXQOCeKEuFnO2168dqSX
         jUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=loqsks3wEiNa8k49dnYpIMczIk9EVJRbC+O7hv6BbMA=;
        b=Ron9VXRVCmO5qR6iAH+NyesdRzNU+QWAWPC1ytIECp7najqdDFZFs4TY+BZnwTykhP
         fwalMu/fO+JAldkpsBTs7wkGVNY5sJ93nps+qz7o8sQssc4vmtOV/x8NmDo7SiA/xxbF
         T1NxMXtPw5Exj+Y7UvsAJ1cnzOJKfU5CEl1lwidEqE81fKah0wn2M6thek5MXteThVxV
         IfXKUBGep9HyvElvNlL6Q4hlLY9+BsTb1/POWgQPkkCfy+OOG5GYGS0WJ708ZNdkcXxP
         HbXOnF7qbUSaI9dhhF3Vc2S02NXDkRbr94m1+UYv4ovV5JWjjkC8dRm37J+boqYXm33D
         pm5Q==
X-Gm-Message-State: AOAM532ho2+oGQoIRZkwfjugCYs/CtEGT5oHtE99RskHzY3EPpGeOETo
	ZhM+J5cBlupSR7qPcudgHZrX+HUV2gESOuNW5sGKnw==
X-Google-Smtp-Source: ABdhPJyFKUkWsF80PWTAJMrHskAFvisUV0kojCchQfV9Q4HewSzPqW8O+m87/LfCQTq/Rdqf5WrqG9uT46tFyT11Vdk=
X-Received: by 2002:a0c:e292:: with SMTP id r18mr2564734qvl.117.1597926595028;
 Thu, 20 Aug 2020 05:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200820065727.2589128-1-raj.khem@gmail.com> <20200820065727.2589128-2-raj.khem@gmail.com>
In-Reply-To: <20200820065727.2589128-2-raj.khem@gmail.com>
From: "Leon Woestenberg" <leon@sidebranch.com>
Date: Thu, 20 Aug 2020 14:29:44 +0200
Message-ID: <CAMjhiJiEdpLHF7EONY4YchXAeXPK0qbgb2JF_pRLmvTQedEn=w@mail.gmail.com>
Subject: Re: [PATCH 2/4] gcc-cross-canadian: Install gcc/g++ wrappers for musl
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Khem,

Thanks for looking into this. I applied your patch on top of our zeus
branch (I think the issue is in zeus, dunfell, master).

On Thu, Aug 20, 2020 at 8:57 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> gcc needs -mmusl option to be passed in SDK since we ship crossdk compiler
> configured for glibc by default, this helps in creating correct
> compiler defaults for musl based SDK compilers
>
> [YOCTO #13459]
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc

Can you elaborate why this is the proper solution over just
TARGET_CC_ARCH_append_linux-musl = " --mmusl" in
toolchain-scripts.bbclass?

> +
> +       for i in linux ${CANADIANEXTRAOS}

Why keep linux in here?

> +       do
> +               for v in ${CANADIANEXTRAVENDOR}
> +               do
> +                       d=${D}${bindir}/../${TARGET_ARCH}$v-$i
> +                       install -d $d

Hmm, even for the non-musl case?

> +                       for j in ${TARGET_PREFIX}gcc${EXEEXT} ${TARGET_PREFIX}g++${EXEEXT}
> +                       do
> +                               p=${TARGET_ARCH}$v-$i-`echo $j | sed -e s,${TARGET_PREFIX},,`
> +                               case $i in
> +                               *musl*)
> +                                       echo "#!/usr/bin/env sh" > $d/$p

$d/$p already exists at this point, and it's a softlink to the actual gcc.
The redirected output will end up in the *target* of the softlink;
this replaces the actual gcc compiler binary by a script, which calls
itself.
It ends up being a recursive invocation.

I have added rm -f $d/$p above to fix this locally, while testing.

> +                                       echo "exec \`dirname \$0\`/../${TARGET_SYS}/$j -mmusl \$@" >> $d/$p
> +                                       chmod 0755 $d/$p
> +                                       ;;

Regards,

Leon.
