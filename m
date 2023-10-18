Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FE4CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 14:24:57 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.282486.1697639094791582620
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 07:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=HVe5OnQq;
 spf=pass (domain: baylibre.com, ip: 209.85.208.42, mailfrom: jstephan@baylibre.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-53e2dc8fa02so10309247a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 07:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697639093; x=1698243893; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HI9hBSjKyi/vFMNNIjmrqZWu0I9HWuA2pwU0q7gM8mU=;
        b=HVe5OnQqwCd3iiSKpmUktqIe6VIG/PGpkqwuWPeDeEAAFl+GRywN8hEcmD+3IDaFOX
         NSuCc0tyPNPB2lOO/KxMLj2YkBX78N74OZwstO6LXeSta11L22X5N58MDlW2aw2ucXNU
         uziJ+sHFt1HpXl5+OhNdZxGb9d0We+V9hkJwG1AJH/KE3bS/vjVAqHsZSNC2mb/+Sqk9
         SDP1dYS61ZAxN8dt9eRGbq9ATxdNYm/HhWd5GtB/V8y4GBaRr5kiqALt2IioSFcuWmkU
         3oUaM+qya/v4RruDMD29MORRPz6R1ssJ0utxW64hiXVMj53U3nfN7dcpOkscaR3CMwpv
         sZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697639093; x=1698243893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HI9hBSjKyi/vFMNNIjmrqZWu0I9HWuA2pwU0q7gM8mU=;
        b=moJPvqxarS+9JbNN3r7B1ey8EvBLj2lVAhA8pffOyUvI5hg61OS8M8xMJadlvCo9MN
         Jf5reb55LREAYRAeC8gyfCsfeeZV96CBMYav/JaNLJia7REgTxv+2COCliHwOJjfOtHs
         wJASN+YL7M9e+KZW6daBSudNKKWboiKmPs2ImKjRYLYuHP0hBgkxY9Ctgu6dNPMzxhLI
         P305DGQV4INPGM0DSIzwMpzZzOfNvuYLZUQlYnnnLLEZR4PKFsfz0YJRD71Hl70kcEN1
         Xo9EIrAoiwtLCiDTCrEss2ZxY4xqTUL5RwKd+2/P/bEWE79pGujeEh7brDH+mE0i8ONc
         CkfA==
X-Gm-Message-State: AOJu0YwhRqIdUJyLHhk6uUu+hUSpiJBgfRfxuzxvO1iMIg9p8++pHABA
	E99UTP9s0ZIKnXqXB8vqA/K7DFsgCEsEjEDEvS99QA==
X-Google-Smtp-Source: AGHT+IHoAFXSjfVcF6EZ/z0LGM1QClwZcj/6ozFNYFNqBWJ+gMp0oFgLh9/H5UKylvyi/UVbYACYspfUipwu0iqutMw=
X-Received: by 2002:a05:6402:524b:b0:53d:9a37:5bcf with SMTP id
 t11-20020a056402524b00b0053d9a375bcfmr4605830edd.31.1697639092956; Wed, 18
 Oct 2023 07:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <d15f738b-60d2-48a0-9dc6-6e242469b7a5@gmail.com>
 <CA+chaQcLsDyXMFRtpUdH6yCWCXuShSytFyoqRZ_5F8Ton4HfzA@mail.gmail.com>
 <d466e4c6-20bf-42e2-8342-c058fca4aea2@gmail.com> <CAEHHSvYW_-O=Z5r+sCTFdfS-vuafcnzRsQ_YoUY=MTVOFS1e5g@mail.gmail.com>
 <6a7c97c6-2fc3-4596-8d45-388eb49c3c32@gmail.com>
In-Reply-To: <6a7c97c6-2fc3-4596-8d45-388eb49c3c32@gmail.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 18 Oct 2023 16:24:41 +0200
Message-ID: <CAEHHSvb_dvP4FtS5nhCGFvBvZPuCtZsPDDc18jWh_DoFdaqFLQ@mail.gmail.com>
Subject: Re: [OE-core] gitsm:// question
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 14:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189394

Le mer. 18 oct. 2023 =C3=A0 16:12, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <=
zboszor@gmail.com> a =C3=A9crit :
>
> 2023. 10. 18. 15:28 keltez=C3=A9ssel, Julien Stephan =C3=ADrta:
> > Le mer. 18 oct. 2023 =C3=A0 15:25, Zoltan Boszormenyi <zboszor@gmail.co=
m> a =C3=A9crit :
> >> Thanks, I will try it.
> >>
> >> 2023. 10. 18. 15:16 keltez=C3=A9ssel, Martin Jansa =C3=ADrta:
> >>> Just add the name to pytorch repo url and use only that in SRCREV_FOR=
MAT, you probably
> >>> don't care about representing the other repos in SRCPV if you're upda=
ting them only
> >>> together with main pytorch update.
> >>>
> >>> On Wed, Oct 18, 2023 at 3:05=E2=80=AFPM Zoltan Boszormenyi <zboszor@g=
mail.com> wrote:
> >>>
> >>>      Hi,
> >>>
> >>>      I have a working python3-pytorch recipe which originally used th=
is:
> >>>
> >>>      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>      addtask do_git_submodules after do_unpack before do_patch
> >>>
> >>>      do_git_submodules[network] =3D "1"
> >>>
> >>>      do_git_submodules () {
> >>>               cd ${S}
> >>>               git submodule update --init --recursive
> >>>      }
> >>>      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>
> >>>      I would like to replace the above with a series of gitsm:// SRC_=
URI lines.
> >>>      Here's a subset of submodules that shows the problem I am seeing=
:
> >>>
> >>>      SRC_URI =3D " \
> >>>      git://github.com/pytorch/pytorch.git;protocol=3Dhttps;branch=3Dr=
elease/2.1
> >>>      <http://github.com/pytorch/pytorch.git;protocol=3Dhttps;branch=
=3Drelease/2.1> \
> >>>      ...
> >>>      gitsm://github.com/pytorch/FBGEMM.git;protocol=3Dhttps;name=3Dfb=
gemm;nobranch=3D1;destsuffix=3Dthird_party/fbgemm
> >>>      <http://github.com/pytorch/FBGEMM.git;protocol=3Dhttps;name=3Dfb=
gemm;nobranch=3D1;destsuffix=3Dthird_party/fbgemm>
> >>>
> >>>      \
> >>>      gitsm://github.com/asmjit/asmjit.git;protocol=3Dhttps;name=3Dfbg=
emmasmjit;destsuffix=3Dthird_party/fbgemm/third_party/asmjit
> >>>      <http://github.com/asmjit/asmjit.git;protocol=3Dhttps;name=3Dfbg=
emmasmjit;destsuffix=3Dthird_party/fbgemm/third_party/asmjit>
> >>>
> >>>      \
> >>>      gitsm://github.com/pytorch/cpuinfo.git;protocol=3Dhttps;name=3Df=
bgemmcpuinfo;destsuffix=3Dthird_party/fbgemm/third_party/cpuinfo
> >>>      <http://github.com/pytorch/cpuinfo.git;protocol=3Dhttps;name=3Df=
bgemmcpuinfo;destsuffix=3Dthird_party/fbgemm/third_party/cpuinfo>
> >>>
> >>>      \
> >>>      gitsm://github.com/NVIDIA/cutlass.git;protocol=3Dhttps;name=3Dfb=
gemmcutlass;destsuffix=3Dthird_party/fbgemm/third_party/cutlass
> >>>      <http://github.com/NVIDIA/cutlass.git;protocol=3Dhttps;name=3Dfb=
gemmcutlass;destsuffix=3Dthird_party/fbgemm/third_party/cutlass>
> >>>
> >>>      \
> >>>      gitsm://github.com/google/googletest.git;protocol=3Dhttps;name=
=3Dfbgemmgtest;destsuffix=3Dthird_party/fbgemm/third_party/googletest
> >>>      <http://github.com/google/googletest.git;protocol=3Dhttps;name=
=3Dfbgemmgtest;destsuffix=3Dthird_party/fbgemm/third_party/googletest>
> >>>
> >>>      \
> >>>      gitsm://github.com/ROCmSoftwarePlatform/hipify_torch.git;protoco=
l=3Dhttps;name=3Dfbgemmhiptorch;destsuffix=3Dthird_party/fbgemm/third_party=
/hipify_torch
> >>>      <http://github.com/ROCmSoftwarePlatform/hipify_torch.git;protoco=
l=3Dhttps;name=3Dfbgemmhiptorch;destsuffix=3Dthird_party/fbgemm/third_party=
/hipify_torch>
> >>>
> >>>      \
> >>>      ...
> >>>      "
> > Hi Zoltan
> > This is not how you are supposed to use gitsm.. This is much simpler:
> >
> > SRC_URI =3D " gitsm://github.com/pytorch/pytorch.git;protocol=3Dhttps;b=
ranch=3Drelease/2.1
> > "
> >
> > will do all the magic for you :)
>
> When I first created that recipe (Yocto 4.0, PyTorch 1.13.0), it didn't.
>
> The problems were:
> * PyTorch source releases are not on https://pypi.org/project/torch
>     This would have been the most convenient.
> * Yocto complains about using the (unstable) release tarball URL from Git=
hub.
> * Using the git:// SRC_URI did not populate the submodules' directories.
>     This was noticed because some submodules need patches to build under =
Yocto.
>     Without checking out submodules manually, those patches fail.
>
> Just checked the last one on mickledore, still a problem.
>
> Have Yocto master changed this?
>

I used to have a kirkstone recipe using gitsm properly to fetch the
submodules. Can you reproduce your issue on master? And maybe share it
to help debugging?

Cheers
Julien
> > You can look at the vulkan-sample recipes in poky for an example of
> > how to use it: https://git.openembedded.org/openembedded-core/tree/meta=
/recipes-graphics/vulkan/vulkan-samples_git.bb?h=3Dmaster
> >
> > Cheers
> > Julien
> >
> >
> >>>      As you can see, there are recursively placed git submodules
> >>>      and do_fetch fails with an error message about SRCREV_FORMAT
> >>>      having to be set.
> >>>
> >>>      The above is a limited subset of the complete list and
> >>>      some of the repositories (like googletest, gloo, glog and pybind=
11)
> >>>      occurs multiple times as child submodules of upper ones,
> >>>      with different SRCREV values in different leaf submodules.
> >>>
> >>>      I have not found a conclusive example to use SRCREV_FORMAT
> >>>      with git:// + gitsm://
> >>>
> >>>      Can someone enlighten me how to use SRCREV_FORMAT properly
> >>>      for this case? Should I stick to the proven working nonstandard =
way
> >>>      and just run git submodule update --init --recursive?
> >>>
> >>>      As an easy way out, is there a flag to git:// to process its
> >>>      submodules automatically?
> >>>
> >>>      Thanks in advance,
> >>>      Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
> >>>
> >>>
> >>>
> >>>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#189390): https://lists.openembedded.org/g/openembe=
dded-core/message/189390
> >> Mute This Topic: https://lists.openembedded.org/mt/102038382/4356723
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[jstephan@baylibre.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

