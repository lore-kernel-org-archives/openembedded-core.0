Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7361C54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 10:16:27 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web11.68242.1673259384625633583
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 02:16:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DyujNLbQ;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id 3so4254468iou.12
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 02:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrzX1JRnuw+OrHlW2F1zp5o0flM5uZxHDMOYL8Qni58=;
        b=DyujNLbQH788+cN4EgMAg2RaHVDX2v9i2k+jbOxkWDaTs6qundFbGjm7GW9Kqnnic7
         KTiCTPdo2MLUkmPXotFu2w0KD/UJ+AmT8VeQ71EVszJB7lKmIiC71zIyz7PUxN75KpBz
         oEIUjU3KJTdcIBuW6oLZNSElh98UD+iLyrh5ED1PPJ+XnrxLC9KivJzS+Yvzx2gG4k0w
         mXShh4Jpda/0uEi3UcnHTN0yEPIuQPmWSCkn4E5wFmW0u9fq/IxkbLV8gYhw4eIyteBR
         SGQKPcmX8eTFVnxnYVXNeC6M18OWxC14UmuFPSvMQiLqZdPtN+9VVfMZi8g8+YERiSNV
         p2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrzX1JRnuw+OrHlW2F1zp5o0flM5uZxHDMOYL8Qni58=;
        b=Ycvn1jLG0gJYv3s914VuJzKZl/vePD9LH8eHKRYj86Gd6yk2//vIlmsn6/c90KAZZr
         8u5WM5JMPOUArBKRsZvbS5D5T+Vl0pHMNZl6JYqqcB4i2WBgIm2yeiCqx9qa+HYKgugK
         o/b7fIK3BAwUK4SRpGGSLeBKDh8XRcShYnLVQfvLqBo1BOksVeXNbJZnnOSpxE1dDyYZ
         huBUWCf0dmOzEeWKSWXvY8Cp8soYn1smHQEsvEABXw8fYtEEmf4e3zFAxE1W/u050FCc
         qkBqtqOl+7GO6ZIoOEGIL2ZLVPef5PsqdZFFRGMk3epo6q8wetuIiDZ3ES9gnw7iCt3G
         57sw==
X-Gm-Message-State: AFqh2korBTKW/zuL7wpj1gdvcvJTnUuxVPfkeMY7NgpCw0wo5+55n/SG
	WmIyY6+styFwCtwR9jfBIsKznEjtogP6kJCDpfc=
X-Google-Smtp-Source: AMrXdXuCeFE0/hZM2xsChFtVAjMc5AUAQ2o1c95nYq77ZHpU5YsZWyaBZOqZk6aimgwaAIyMEssPXwEuMvlTEAoFwrE=
X-Received: by 2002:a05:6602:18a:b0:6ed:13b9:2e1e with SMTP id
 m10-20020a056602018a00b006ed13b92e1emr5951831ioo.172.1673259383957; Mon, 09
 Jan 2023 02:16:23 -0800 (PST)
MIME-Version: 1.0
References: <CH2PR11MB447005CD0919C22171E2EC4189F49@CH2PR11MB4470.namprd11.prod.outlook.com>
 <CH2PR11MB447038A3B16A1413A72859C489FE9@CH2PR11MB4470.namprd11.prod.outlook.com>
 <CH2PR11MB44707F27A41F7EC82078CDF689FE9@CH2PR11MB4470.namprd11.prod.outlook.com>
In-Reply-To: <CH2PR11MB44707F27A41F7EC82078CDF689FE9@CH2PR11MB4470.namprd11.prod.outlook.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 9 Jan 2023 10:16:12 +0000
Message-ID: <CAO5Uq5Qig0RHUABFXZQo=00ubOqWxaNyivFB7C1U+c5ZZVR+sg@mail.gmail.com>
Subject: Re: Fw: Bug 14875 - reproducibility issue queries
To: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 10:16:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175679

On Mon, Jan 9, 2023 at 7:02 AM Kokkonda, Sundeep
<Sundeep.Kokkonda@windriver.com> wrote:
>
> Hello Alex,
>
> I found a few below listed deviations in Yocto's (with rust recipe) build=
 environment w.r.t 'rust' (rust cloned from github) build environment. Do y=
ou know why these deviations in Yocto's rust linker?
>

Sorry, ended up reading these messages out of order...

>
> Thanks,
> Sundeep K.
> ________________________________
> From: Kokkonda, Sundeep
> Sent: 03 January 2023 21:29
> To: richard.purdie@linuxfoundation.org <richard.purdie@linuxfoundation.or=
g>
> Cc: MacLeod, Randy <Randy.MacLeod@windriver.com>; Moodalappa, Shivaprasad=
 <Shivaprasad.Moodalappa@windriver.com>
> Subject: Bug 14875 - reproducibility issue queries
>
> Hello Richard,
>
> On the rust reproducibility issue, as we discussed I tried to compile the=
 libs outside of Yocto to generate the lib.
>
> I took the compiler command of a crate from the 'bitbake -vv rust' log (r=
efer attached file), but the compilation shows several errors...
>
> (Eg. missing ofenv variables RUSTC_STAGE, RUSTC_SYSROOT, RUSTC_SNAPSHOT, =
RUSTC_SNAPSHOT_LIBDIR, RUSTC_REAL, RUSTC_LIBDIR... I read all env vars duri=
ng Yocto rust execution but the env list doesn't show any of these vars. So=
mehow, I exported these vars but the build shows other errors from *.rs sou=
rce files).
> Is it the way you want me to do?
>
> Since the --remap-path-prefix cmd is passed during compilation, I suspect=
 the issue is not with compiler and tried below alternate methods to find t=
he issue and have some queries... It'll be helpful if you've any inputs on =
below points...
>
> Since the librustc_driver*.so binary differed in '.rustc' linker section,=
 I disassembled all generated objects (including the objects in .rlib libra=
ries) to identify from which object the assembly difference is coming. But,=
 in any of these disassembled files the '.rustc' section is not present. Co=
uld not find any linker script which groups some input sections to .rustc o=
utput section. I suspect there is 'link.rs' file which is making this linke=
r section, going through the code...
>
> I found a difference in linking of libs in Yocto project when compared to=
 normal rust environment. In rust, there is no linker flag '-C linker' is p=
assed,  but Yocto uses below extra linker parameters. Maybe we are linking =
objects differently than rust used linker?
> -C linker=3D/home/skokkonda/yocto/poky/buildA/tmp/work/core2-64-poky-linu=
x/rust/1.66.0-r0/wrapper/build-rust-ccld
> -L native=3D/home/skokkonda/yocto/poky/buildA/tmp/work/core2-64-poky-linu=
x/rust/1.66.0-r0/recipe-sysroot-native/usr/lib/llvm-rust/lib
> -L native=3D/home/skokkonda/yocto/poky/buildA/tmp/work/x86_64-linux/rust-=
llvm-native/1.66.0-r0/recipe-sysroot-native/usr/lib
> -L native=3D/home/skokkonda/yocto/poky/buildA/tmp/work/x86_64-linux/rust-=
llvm-native/1.66.0-r0/recipe-sysroot-native/lib
>
> In rust, the librustc_driver*.so is generated during stage-0 and the same=
 lib copied to stage-2 output. But, as per Yocto build log shows librustc_d=
river*.so is re-generated at every build stage.
>

That strikes me as interesting - I wondered if our builds did
something like that.

This upstream ticket looked interesting too
https://github.com/rust-lang/rust/issues/98185

I'm afraid I've no real insight into the issue though.

--
Alex Kiernan

