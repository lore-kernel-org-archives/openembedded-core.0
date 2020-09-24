Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.10095.1600927247827424274
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2020 23:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U49936zi;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id p15so1337978qvk.5
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2020 23:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=COH1dThVmEldAxx2nM21/goAS0alSmM1Dmnjjb8vw8s=;
        b=U49936ziJkDb9JWyRK2MEVU6BtUJ8KO05jyxI3hT2+tT01fOhF+pGtNlfwLrsqm9P/
         Ol4EKYxgzh0akP97s+4Yd1lrvDnnvESSedvBFDX6oEYozGkxakkjzEzGqu6v+uLaI2AX
         0c03q2C/aHdfkSRvos+HzTJz6beea69BMKf7Eu8RqhDgFv3Xhe+FyFq9UKtjVCZbjDMB
         PqhQmu+qnpV7GinYmpaJbXhOu2lfZWLZQEhMKBEAd11nceaAYlv5MC8V+dJvN50ZVW8C
         9KlowpiGmBo2zHA8hYCqIwM2drxBi7DRqfhdKNA9+nIeCRu2wbOSA1udUyVMf+kq8WsM
         NyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=COH1dThVmEldAxx2nM21/goAS0alSmM1Dmnjjb8vw8s=;
        b=R/v59bECrdd2iUfAGqeh2m+vzn04TR3wK2wm0AwkuxAa15q7n5xkp5A1DI9EQ+o/gr
         PWgsANxH43gUKPHuklaYfSH4/UCDV5/soXXudokXdqPkucE1iuISGqqD9SRic81ZOiBk
         UfHF/eAjYQOEs5/tUmd/dEtlVy5P7JeRjuTVY4Vrswmyra5Jd+YLgdYPgzk/pv9e+ih1
         DocXbyUwT1Yky+Ks7nov/VVcvqz5xwO8Jb08vTUqRAFLUOk400tK6ZDWNhQRDQfGME8T
         fZO3bjO81W4hV/AOoqYwyx06ftYorM+syjCSAH55F14IAOM5W8/aVlKKvETbXQMBEH7l
         llMA==
X-Gm-Message-State: AOAM531dSSqz3u5unlAm+i21OKkQtpuN0zFCNoEhAoKJ+LgSoF7xeaCS
	RZGtbvAtgHyDCv/erwbbPdpI2C0ReqAXJbzRjeA=
X-Google-Smtp-Source: ABdhPJy0cajmYGlvUtJCTSWfY+Ygjv6CR/iKkeys6REZXIerraNWA6XgDp9rc1BPyHDgIHL5hrxmeP5Ugucn1Lx9YwE=
X-Received: by 2002:a0c:8f02:: with SMTP id z2mr3671597qvd.21.1600927246876;
 Wed, 23 Sep 2020 23:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <711dd8de-1ea7-e3cd-d606-5f69faa7c8a3@linux.intel.com> <CAAnfSTsTXqEXVcoL+bdCU8wyRRSs_XL2HqQ0jiMCLrRNPOWEdg@mail.gmail.com>
In-Reply-To: <CAAnfSTsTXqEXVcoL+bdCU8wyRRSs_XL2HqQ0jiMCLrRNPOWEdg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 23 Sep 2020 23:00:21 -0700
Message-ID: <CAMKF1spFrLCVpwqeWkhys5K4r8vav6GFpFNobwkRZW3Mt=NOUA@mail.gmail.com>
Subject: Re: [OE-core] RFC: Upgrading rt-tests requires numactl
To: Ross Burton <ross@burtonini.com>
Cc: Randy Witt <randy.e.witt@linux.intel.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 23, 2020 at 2:40 PM Ross Burton <ross@burtonini.com> wrote:
>
> On Wed, 23 Sep 2020 at 18:23, Randy Witt <randy.e.witt@linux.intel.com> wrote:
> > Another issue is that ARM is removed from COMPATIBLE_HOST in
> > http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/numactl/numactl_git.bb?h=master#n27.
> > This may be for legacy reasons, but libnuma can be installed on most
> > distributions running on an ARM host. Regardless, it would need to be changed to
> > allow for rt-tests on ARM.
>
> Yeah, that's probably very old.
>
> $ lscpu
> Architecture:                    aarch64
> CPU op-mode(s):                  64-bit
> Byte Order:                      Little Endian
> CPU(s):                          256
> On-line CPU(s) list:             0-255
> Thread(s) per core:              4
> Core(s) per socket:              32
> Socket(s):                       2
> NUMA node(s):                    2
>
> The recipe has done that since it was added, so I'd call this
> historical and just delete it.

question is not aarch64 but arm (32bit) and I think answer is still no for arm.

>
> Ross
>
> 
>
