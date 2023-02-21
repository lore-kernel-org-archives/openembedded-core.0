Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CC1C64EC7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 17:51:48 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.49520.1677001903970594541
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 09:51:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jNeHTTkn;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id m6so6866652lfq.5
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 09:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8fI5QwU942sNPmOd3E/cXIDNHojyhdcU6he18OBR94=;
        b=jNeHTTkn8TDZ1qxrcQvpl1gmyh0Rwbgjj5Rv0o6a1z+SFCAZcmMvOAywVFv5KXvL9R
         E5RnH32CnlfHjC3fQb1LnxrdtrDzAqmGGEsd8QzLA6iGHyO/Hkm9sHGN7uHnJgPRE6BJ
         5nbpb0sRBeKz9lOWvk4pByacIAf0x4fEP4iRXPNaByJu7iQx63zjyrcR2fQcXu3b5Jni
         8grhXJ+ABo93nAHdQNpZd5/nX5brXQ5eCMR8C1j4pJlrU+31jNAu+uTtUJwkSiF4WpMG
         F1TIru3ur/BbL5YKuGW5OC7VtnODrKNpYk1wkKI06KqxslW8j0kEJgiZEjXCJlLYuQp2
         dEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8fI5QwU942sNPmOd3E/cXIDNHojyhdcU6he18OBR94=;
        b=NybZHAGe42DBGVKyrtNBOu+ighMi3YkRw5peBI4Hre0GInjpbI0vfWEsdfRcbV04Ww
         M/ZlTHy/jb12Tr45100vd/EugsaooOMktvd+0uo6VpuiAEtdgxtXISJEZgw3cGW7Ib21
         eo9X6utkibdblIQgY5a11bvRWdZGLqcjuaqM092DCi2ZXPw2VLTOzI3khKzGA9MDO7Z3
         4WmNC/2f6QCIsSaZDvrvG8uPffH566uaYj8KDp8w5C3YB44ojxhFMA/fI1mIyq3jdWTy
         XnZQF6wDniRSQ7lRhMkSmcaAR3iZJzXf94nWuT95cRZFh2OomzmhtSnk8ZCLVKviT/Rj
         pw2A==
X-Gm-Message-State: AO0yUKVIceBLiuSIj3RnlNazv0nephn1fhpndJHvXZ//b0mi4HbQ8bFM
	LN0R6ASl+pr5rm7rWXZpSxgNin8phHJ+/uQ000s=
X-Google-Smtp-Source: AK7set/wvaE24Sz+hJ8byrJY4dyBtPhdViPQa0gEicRyebuU/UrJm7AuHEI142xtDmUJwxBuKtGPx38wiPl9eYMo95w=
X-Received: by 2002:ac2:5a4d:0:b0:4d8:1c0e:bfc7 with SMTP id
 r13-20020ac25a4d000000b004d81c0ebfc7mr1885572lfn.13.1677001902046; Tue, 21
 Feb 2023 09:51:42 -0800 (PST)
MIME-Version: 1.0
References: <CH2PR11MB4470028F6C02394017143B9989A59@CH2PR11MB4470.namprd11.prod.outlook.com>
In-Reply-To: <CH2PR11MB4470028F6C02394017143B9989A59@CH2PR11MB4470.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 Feb 2023 18:51:30 +0100
Message-ID: <CANNYZj8T1Ex=5ti2ENWjcjcHSCMBubqu18rnenLQWcJdr_QQ=Q@mail.gmail.com>
Subject: Re: [OE-core] Yocto reproducibilty issue :: rust-llvm binary differences
To: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 17:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177532

Are the two different sets of object files available somewhere for
download and inspection? I could take a look and see if I can spot the
difference, but I need the files.

Alex

On Tue, 21 Feb 2023 at 17:47, Sundeep KOKKONDA
<sundeep.kokkonda@windriver.com> wrote:
>
> Hello,
>
> The rust builds are not reproducible when the build path is changed. The =
issue details are in https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14=
875.
>
> After debugging several ways, we tried to find at what build stage the Yo=
cto build artifacts are deviating with rust sources generated artifacts.
>
> I took the identical rust tarball sources (rustc-1.67.0-src.tar.xz) as Yo=
cto rust sources and built in two different paths (buildA & buildB director=
ies). In the rust sources the generated binaries are identical between 2 di=
fferent builds.
>
> But, In Yocto we found that the binaries '../tmp/work/x86_64-linux/rust-n=
ative/1.67.0-r0/recipe-sysroot-native/usr/lib/llvm-rust/lib/libLTO.so & lib=
Remarks.so' are differed between 2 builds. See the differences in the attac=
hed 'libLTO-diff.png'.
>
> And these objects are passed to compile all rust crates in later build st=
ages (with option '-L native=3D/ala-lpggp31/skokkonda/875/poky/buildC/tmp/w=
ork/x86_64-linux/rust-native/1.67.0-r0/recipe-sysroot-native/usr/lib/llvm-r=
ust/lib').
>
> So, we suspect this could be the reason for this reproducibility issue in=
 Yocto. I tried to find the reason for difference in these binaries but the=
 '-vv' build log doesn't give enough info by linking which objects this lib=
LTO.so is generated. I tried the disassembly of object files generated in .=
./x86_64-linux/rust-native/ but that didn't showup these binary differences=
.
>
> Anyone who has expertise with rust-llvm can guide me here on how these *.=
so are generating and how to understand/fix these differences.
>
>
>
> Thanks,
> Sundeep K.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177528): https://lists.openembedded.org/g/openembedde=
d-core/message/177528
> Mute This Topic: https://lists.openembedded.org/mt/97113152/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

