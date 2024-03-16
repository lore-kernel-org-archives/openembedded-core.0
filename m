Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEDF4C48BF6
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 16:49:00 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.942.1710607738945987167
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Mar 2024 09:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SDODT0Nt;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d41f33eb05so35238341fa.0
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Mar 2024 09:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710607737; x=1711212537; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Svjrmct/qXzQVoI1uPKdhLwgdlZF1dRQQ+/sz0vx8Y=;
        b=SDODT0Nt40MLlwvqMTg0Nh+WZ6fxymDMATgrW6sM/EeYJ5C5N7X4FT4tuWXSaeHSFa
         4IV24So53HKOOaKF7r0iONFWGI88nw6gjKNRxQYebSpN/HwaP6Q0wkGLt4v7coGW7SMJ
         fbtuAbKimMY8SvfZ3fEEyYujVfIvw70qu+ZZOq/uj+0KHgKfJ4jnppRDGQ9erwz8/be2
         ycOqAQqq5KRy7Xd4hPGzez95yiPhPw3ueJ8LN4DlLGGen06dkTp5DuUGl5f37tqXxDBH
         pdzkJLUMXGDTO0KDUiqQoNfyYknSwNaQQk3dvKMiyk3ZEwomKJ3kQp2M0GJ/aw/wXitj
         T0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710607737; x=1711212537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Svjrmct/qXzQVoI1uPKdhLwgdlZF1dRQQ+/sz0vx8Y=;
        b=L9ZDHdpaTcq7ViHNLl6JRmco2ud09ku2f7Sy3eJs7F7NTjyTmnf4cuz3q14lsuho0C
         75lCTjpWIhdeSusFgSOhJukNCHe/q92plQ6XzbFgjMxpEpE2Rc8EAhVmivZoBzQbhx0H
         /J9YgQEFqf0Y3EqAFf4GpoS1XhmP5mrHKtOypi/SCz02HEKZ5DsdlGzr0VPGEEafa4Nu
         qg/VmA+EZKnlQoQDEdI9hTzj5KAQnSAYau7IcXZcQQCD2fBLnPZfDuqbJ3D1hLt7vZu/
         qcfT8yWn/yZaoMrAs5S1nolvAimdfR99YZRnJidC5Wbfb+4UXtv+hqym6xF2TCQwT4dh
         Zzmg==
X-Gm-Message-State: AOJu0YyJzS/5XtZS1mjfGUiY7TuLtxS4AdALKgig45QGCNPzx8Xz4fBy
	3wpXZyVv+AaVmXrqcTBYhMiCNBK/iTGi/APKf+g4XEuVlgMla7+HgSx2emQEOHVuolZ2kBPFep/
	nHvS5w5gHw/meheatAn+BdJwR5LTrqtiy
X-Google-Smtp-Source: AGHT+IFLZKhcHZ60bbpLImsdVQyLZ3X77u67O1Ae/4BJLRG2B4OPLLsOW59XGCCSUJpBqg8a96EewWEtMwm5Mpc+nZE=
X-Received: by 2002:a2e:8187:0:b0:2d2:c140:68cc with SMTP id
 e7-20020a2e8187000000b002d2c14068ccmr4118520ljg.5.1710607736670; Sat, 16 Mar
 2024 09:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240315081844.3075049-1-mingli.yu@windriver.com>
In-Reply-To: <20240315081844.3075049-1-mingli.yu@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 16 Mar 2024 17:48:50 +0100
Message-ID: <CANNYZj_ODsX=19UcN2MeetsF_QE4fibr=ovSxc1gMtX1+zBT_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] weston-init: Add --system for useradd
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org, 
	Enrico Scholz <enrico.scholz@sigma-chemnitz.de>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Mar 2024 16:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197254

This, unfortunately, is a recipe-specific workaround for an issue that
is general, and needs to be investigated properly. Please see the
thread ' ''.bashrc': Unknown file type; file ignored".

If you can join forces with Enrico and get to the bottom of it I'd
appreciate, as I'm traveling/on holiday/in company get-togethers for
the next week and can't quickly allocate enough time to reproduce and
help.

Alex



On Fri, 15 Mar 2024 at 09:18, Yu, Mingli <mingli.yu@eng.windriver.com> wrot=
e:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Add --system parameter for useradd to avoid intruducing .bashrc
> and .profile under home dir to fix the below error.
>  $ bitbake core-image-weston
> | DEBUG: Executing python function set_image_size
> | DEBUG: 352679.600000 =3D 271292 * 1.300000
> | DEBUG: 455079.600000 =3D max(352679.600000, 65536)[352679.600000] + 102=
400
> | DEBUG: 455080.000000 =3D int(455079.600000)
> | DEBUG: 455080 =3D aligned(455080)
> | DEBUG: returning 455080
> | DEBUG: Python function set_image_size finished
> | DEBUG: Executing shell function do_image_tar
> | tar: ./home/weston/.bashrc: Unknown file type; file ignored
> | tar: ./home/weston/.profile: Unknown file type; file ignored
> | tar: Exiting with failure status due to previous errors
> | WARNING: /buildarea1/test/yocto/builds/poky-build-weston/tmp/work/qemux=
86_64-poky-linux/core-image-weston/1.0/temp/run.do_image_tar.1972897:150 ex=
it 1 from '[ $? -eq 1 ]'
> | WARNING: Backtrace (BB generated script):
>     #1: do_image_tar, /buildarea1/test/yocto/builds/poky-build-weston/tmp=
/work/qemux86_64-poky-linux/core-image-weston/1.0/temp/run.do_image_tar.197=
2897, line 150
>     #2: main, /buildarea1/test/yocto/builds/poky-build-weston/tmp/work/qe=
mux86_64-poky-linux/core-image-weston/1.0/temp/run.do_image_tar.1972897, li=
ne 156
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing python function set_image_size
> | DEBUG: 352679.600000 =3D 271292 * 1.300000
> | DEBUG: 455079.600000 =3D max(352679.600000, 65536)[352679.600000] + 102=
400
> | DEBUG: 455080.000000 =3D int(455079.600000)
> | DEBUG: 455080 =3D aligned(455080)
> | DEBUG: returning 455080
> | DEBUG: Python function set_image_size finished
> | DEBUG: Executing shell function do_image_ext4
> | DEBUG: Executing dd if=3D/dev/zero of=3D/buildarea1/test/yocto/builds/p=
oky-build-weston/tmp/work/qemux86_64-poky-linux/core-image-weston/1.0/deplo=
y-core-image-weston-image-complete/core-image-weston-qemux86-64.rootfs-2024=
0315032140.ext4 seek=3D455080 count=3D0 bs=3D1024
> | 0+0 records in
> | 0+0 records out
> | 0 bytes copied, 0.00136946 s, 0.0 kB/s
> | DEBUG: Actual Rootfs size:  268184    /buildarea1/test/yocto/builds/pok=
y-build-weston/tmp/work/qemux86_64-poky-linux/core-image-weston/1.0/rootfs
> | DEBUG: Actual Partition size: 466001920
> | DEBUG: Executing mkfs.ext4 -F -i 4096 /buildarea1/test/yocto/builds/pok=
y-build-weston/tmp/work/qemux86_64-poky-linux/core-image-weston/1.0/deploy-=
core-image-weston-image-complete/core-image-weston-qemux86-64.rootfs-202403=
15032140.ext4 -d /buildarea1/test/yocto/builds/poky-build-weston/tmp/work/q=
emux86_64-poky-linux/core-image-weston/1.0/rootfs
> | mke2fs 1.47.0 (5-Feb-2023)
> | Discarding device blocks: done
> | Creating filesystem with 455080 1k blocks and 113792 inodes
> | Filesystem UUID: 2031373e-63cd-4711-968b-4023ff7d6a90
> | Superblock backups stored on blocks:
> |   8193, 24577, 40961, 57345, 73729, 204801, 221185, 401409
> |
> | Allocating group tables: done
> | Writing inode tables: done
> | Creating journal (8192 blocks): done
> | Copying files into the device: __populate_fs: ignoring entry ".bashrc"
> | .bashrc: File not found by ext2_lookup while looking up ".bashrc"
> | mkfs.ext4: File not found by ext2_lookup while populating file system
> | WARNING: /buildarea1/test/yocto/builds/poky-build-weston/tmp/work/qemux=
86_64-poky-linux/core-image-weston/1.0/temp/run.do_image_ext4.1972895:178 e=
xit 1 from 'mkfs.$fstype -F $extra_imagecmd /buildarea1/test/yocto/builds/p=
oky-build-weston/tmp/work/qemux86_64-poky-linux/core-image-weston/1.0/deplo=
y-core-image-weston-image-complete/core-image-weston-qemux86-64.rootfs-2024=
0315032140.$fstype -d /buildarea1/test/yocto/builds/poky-build-weston/tmp/w=
ork/qemux86_64-poky-linux/core-image-weston/1.0/rootfs'
> | WARNING: Backtrace (BB generated script):
> |   #1: oe_mkext234fs, /buildarea1/test/yocto/builds/poky-build-weston/tm=
p/work/qemux86_64-poky-linux/core-image-weston/1.0/temp/run.do_image_ext4.1=
972895, line 178
> |   #2: do_image_ext4, /buildarea1/test/yocto/builds/poky-build-weston/tm=
p/work/qemux86_64-poky-linux/core-image-weston/1.0/temp/run.do_image_ext4.1=
972895, line 150
> |   #3: main, /buildarea1/test/yocto/builds/poky-build-weston/tmp/work/qe=
mux86_64-poky-linux/core-image-weston/1.0/temp/run.do_image_ext4.1972895, l=
ine 215
> ERROR: Task (/buildarea1/test/yocto/poky/meta/recipes-graphics/images/cor=
e-image-weston.bb:do_image_ext4) failed with exit code '1'
>
> Before the patch:
> $ ls -a tmp/work/qemux86_64-poky-linux/core-image-weston/1.0/rootfs/home/=
weston/
> .  ..  .bashrc  .profile
>
> After the patch:
> $ ls -a tmp/work/qemux86_64-poky-linux/core-image-weston/1.0/rootfs/home/=
weston/
> .  ..
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-graphics/wayland/weston-init.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-=
graphics/wayland/weston-init.bb
> index 024e400665..542b86818c 100644
> --- a/meta/recipes-graphics/wayland/weston-init.bb
> +++ b/meta/recipes-graphics/wayland/weston-init.bb
> @@ -101,6 +101,6 @@ FILES:${PN} +=3D "\
>  CONFFILES:${PN} +=3D "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/=
default/weston"
>
>  SYSTEMD_SERVICE:${PN} =3D "weston.service weston.socket"
> -USERADD_PARAM:${PN} =3D "--home /home/weston --shell /bin/sh --user-grou=
p -G video,input,render,wayland weston"
> +USERADD_PARAM:${PN} =3D "--system --home /home/weston --shell /bin/sh --=
user-group -G video,input,render,wayland weston"
>  GROUPADD_PARAM:${PN} =3D "-r wayland; -r render"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197129): https://lists.openembedded.org/g/openembedde=
d-core/message/197129
> Mute This Topic: https://lists.openembedded.org/mt/104943634/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

