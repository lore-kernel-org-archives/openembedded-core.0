Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79E9CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 13:28:36 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.281589.1697635711778355250
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 06:28:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=MQfCd+qH;
 spf=pass (domain: baylibre.com, ip: 209.85.208.50, mailfrom: jstephan@baylibre.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-53db1fbee70so11537748a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 06:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697635710; x=1698240510; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUlMkAxoj2BTfz41kb5R9S0zdg2U1+kiIclZPmOHrUs=;
        b=MQfCd+qHAYJSOKoE11OoAP8INVQa5D3xURMnpvHb6BjYjQ+MCI2a1neDZcqT4yMb7o
         SZkQSdwqe4EdvJTn4oEV97Ip/6lkdy82wUJbeJVbj2qvDVWz+cqDW0E4pk0huKHM+SQ+
         6TaHaULWlgd4La+frwiXdBaFBlm8E46JQ2OeLfDIaW3RqohBGM9hqJS/5MVmmiB7Mrvu
         IVqH3iBiQ/OQgHbbSEj6djM3PAlD2jHCryplcJvvxbPaEDkRiBuL4ny5Eb8Hy6RN7C+W
         vv6A+zR8UJGIs4GIWt7TuXiQIhifZECO6AnD3D4BYTL9XNndMmQ9QEGGov4bXE2eyrKu
         hTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697635710; x=1698240510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OUlMkAxoj2BTfz41kb5R9S0zdg2U1+kiIclZPmOHrUs=;
        b=RtNqtvARemceeCbvf7rwMfwznVRJdpcnfsz+tKzidsBHofbCkChZw5TIVtYDAHVgm1
         pWW+a8IFhJt7vv7/UIuzq7KvXCuzlb6CLPvNA/vS6iEh0lE4DlV4/DUhPRR7l43zUR2V
         MwWobedpODnlaa1mcftX45Vcoe8846Mh6aHnR4Mv08H6j7BXf/Q/89x77gUGi+MLUBjm
         FuBANXctN9WeSwiJkJMkhq32ugvEtf4L6HOW+isLkS394LKROEl3/HNxVI3NzIK1oTyu
         FCycVJ/lToUySIfIvaKF2l00yXmGthTXEkDPp4gALeaMYAXAYfmzRkykxjG9403okwY2
         sNog==
X-Gm-Message-State: AOJu0Ywpp42tLtRUthNzilbur1wFJu1ZzvPCN4LV4K2fQIYQYNkm24nM
	bnzAgUaU2TswIuyHcp09SUzrq0qh8bbzLbXU8aH0fQ==
X-Google-Smtp-Source: AGHT+IHfcNW1BKB4a/yMqHji+rZ27etkZTUEZHN0pQXyQtgXmTFRk3TZBumiUCeQp2UyORMY6ysrQA4ZELhHdvsV0PQ=
X-Received: by 2002:a05:6402:27ca:b0:53e:34c5:ad8e with SMTP id
 c10-20020a05640227ca00b0053e34c5ad8emr4467015ede.19.1697635709674; Wed, 18
 Oct 2023 06:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <d15f738b-60d2-48a0-9dc6-6e242469b7a5@gmail.com>
 <CA+chaQcLsDyXMFRtpUdH6yCWCXuShSytFyoqRZ_5F8Ton4HfzA@mail.gmail.com> <d466e4c6-20bf-42e2-8342-c058fca4aea2@gmail.com>
In-Reply-To: <d466e4c6-20bf-42e2-8342-c058fca4aea2@gmail.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 18 Oct 2023 15:28:18 +0200
Message-ID: <CAEHHSvYW_-O=Z5r+sCTFdfS-vuafcnzRsQ_YoUY=MTVOFS1e5g@mail.gmail.com>
Subject: Re: [OE-core] gitsm:// question
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 13:28:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189391

Le mer. 18 oct. 2023 =C3=A0 15:25, Zoltan Boszormenyi <zboszor@gmail.com> a=
 =C3=A9crit :
>
> Thanks, I will try it.
>
> 2023. 10. 18. 15:16 keltez=C3=A9ssel, Martin Jansa =C3=ADrta:
> > Just add the name to pytorch repo url and use only that in SRCREV_FORMA=
T, you probably
> > don't care about representing the other repos in SRCPV if you're updati=
ng them only
> > together with main pytorch update.
> >
> > On Wed, Oct 18, 2023 at 3:05=E2=80=AFPM Zoltan Boszormenyi <zboszor@gma=
il.com> wrote:
> >
> >     Hi,
> >
> >     I have a working python3-pytorch recipe which originally used this:
> >
> >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >     addtask do_git_submodules after do_unpack before do_patch
> >
> >     do_git_submodules[network] =3D "1"
> >
> >     do_git_submodules () {
> >              cd ${S}
> >              git submodule update --init --recursive
> >     }
> >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >     I would like to replace the above with a series of gitsm:// SRC_URI=
 lines.
> >     Here's a subset of submodules that shows the problem I am seeing:
> >
> >     SRC_URI =3D " \
> >     git://github.com/pytorch/pytorch.git;protocol=3Dhttps;branch=3Drele=
ase/2.1
> >     <http://github.com/pytorch/pytorch.git;protocol=3Dhttps;branch=3Dre=
lease/2.1> \
> >     ...
> >     gitsm://github.com/pytorch/FBGEMM.git;protocol=3Dhttps;name=3Dfbgem=
m;nobranch=3D1;destsuffix=3Dthird_party/fbgemm
> >     <http://github.com/pytorch/FBGEMM.git;protocol=3Dhttps;name=3Dfbgem=
m;nobranch=3D1;destsuffix=3Dthird_party/fbgemm>
> >
> >     \
> >     gitsm://github.com/asmjit/asmjit.git;protocol=3Dhttps;name=3Dfbgemm=
asmjit;destsuffix=3Dthird_party/fbgemm/third_party/asmjit
> >     <http://github.com/asmjit/asmjit.git;protocol=3Dhttps;name=3Dfbgemm=
asmjit;destsuffix=3Dthird_party/fbgemm/third_party/asmjit>
> >
> >     \
> >     gitsm://github.com/pytorch/cpuinfo.git;protocol=3Dhttps;name=3Dfbge=
mmcpuinfo;destsuffix=3Dthird_party/fbgemm/third_party/cpuinfo
> >     <http://github.com/pytorch/cpuinfo.git;protocol=3Dhttps;name=3Dfbge=
mmcpuinfo;destsuffix=3Dthird_party/fbgemm/third_party/cpuinfo>
> >
> >     \
> >     gitsm://github.com/NVIDIA/cutlass.git;protocol=3Dhttps;name=3Dfbgem=
mcutlass;destsuffix=3Dthird_party/fbgemm/third_party/cutlass
> >     <http://github.com/NVIDIA/cutlass.git;protocol=3Dhttps;name=3Dfbgem=
mcutlass;destsuffix=3Dthird_party/fbgemm/third_party/cutlass>
> >
> >     \
> >     gitsm://github.com/google/googletest.git;protocol=3Dhttps;name=3Dfb=
gemmgtest;destsuffix=3Dthird_party/fbgemm/third_party/googletest
> >     <http://github.com/google/googletest.git;protocol=3Dhttps;name=3Dfb=
gemmgtest;destsuffix=3Dthird_party/fbgemm/third_party/googletest>
> >
> >     \
> >     gitsm://github.com/ROCmSoftwarePlatform/hipify_torch.git;protocol=
=3Dhttps;name=3Dfbgemmhiptorch;destsuffix=3Dthird_party/fbgemm/third_party/=
hipify_torch
> >     <http://github.com/ROCmSoftwarePlatform/hipify_torch.git;protocol=
=3Dhttps;name=3Dfbgemmhiptorch;destsuffix=3Dthird_party/fbgemm/third_party/=
hipify_torch>
> >
> >     \
> >     ...
> >     "

Hi Zoltan
This is not how you are supposed to use gitsm.. This is much simpler:

SRC_URI =3D " gitsm://github.com/pytorch/pytorch.git;protocol=3Dhttps;branc=
h=3Drelease/2.1
"

will do all the magic for you :)

You can look at the vulkan-sample recipes in poky for an example of
how to use it: https://git.openembedded.org/openembedded-core/tree/meta/rec=
ipes-graphics/vulkan/vulkan-samples_git.bb?h=3Dmaster

Cheers
Julien


> >
> >     As you can see, there are recursively placed git submodules
> >     and do_fetch fails with an error message about SRCREV_FORMAT
> >     having to be set.
> >
> >     The above is a limited subset of the complete list and
> >     some of the repositories (like googletest, gloo, glog and pybind11)
> >     occurs multiple times as child submodules of upper ones,
> >     with different SRCREV values in different leaf submodules.
> >
> >     I have not found a conclusive example to use SRCREV_FORMAT
> >     with git:// + gitsm://
> >
> >     Can someone enlighten me how to use SRCREV_FORMAT properly
> >     for this case? Should I stick to the proven working nonstandard way
> >     and just run git submodule update --init --recursive?
> >
> >     As an easy way out, is there a flag to git:// to process its
> >     submodules automatically?
> >
> >     Thanks in advance,
> >     Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189390): https://lists.openembedded.org/g/openembedde=
d-core/message/189390
> Mute This Topic: https://lists.openembedded.org/mt/102038382/4356723
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [js=
tephan@baylibre.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

