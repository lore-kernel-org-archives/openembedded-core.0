Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C654EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 15:18:02 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.21231.1686842280170946062
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 08:18:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=QWiOw8rH;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-311148ea881so794517f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 08:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686842278; x=1689434278;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7zfFyntZ6UnIsFbtZQyn7dDnFAQf6pKTBApQCsYAmOs=;
        b=QWiOw8rHXlpsuyii2Erje24vL3NCg1Koy3N6etLmARqIRmUvTd2PfyNatD2tq1IvjZ
         RMJmdkxyWdONMSOIk3MltwMowmhPU+Nnbc1NDCVgYn8ep6VZrvcAw2EnqNlqK5R177Vt
         16fYfHktnyazQYWuwQVNfm14/rXXeN6Xw6zjZTWLj64rRJV3f73T6SpXGxQO6uLre6Qx
         H+T2Eh5m6VEnEiHSCG7XRoalRBM3Vgw2QrMa70aNiJdc1JJw6U7Dh8DbOhqoLZ/uDHCv
         gsNhusqenV6J0C1pb34F4+UQMnWg9Z+4slZtYFUNZzngSEjmd8952GmI95hUb0hmKmsK
         mmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686842278; x=1689434278;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7zfFyntZ6UnIsFbtZQyn7dDnFAQf6pKTBApQCsYAmOs=;
        b=IlFcVBu+IpsVNlzzSkHWpqttlRaieO8tiVTaAK+NR9AhM+5TVndWYCh7539dARZiU5
         S0lWST2SkNvfwzAK3IxKnLlr9fAmsz9egP8qFqp/V+4akJYhUc3GL+RxuWTdm6H2e7MF
         qNh5y6sajQBdvyZzG2/HcQsWiNP0u4NuncPFOl93bdhG0rZVnk0/bWFECdeoHqXl1G/4
         gpRGhkj0slVBDSZlub9OyhBgDWKNAm9l7erORU2Qa2kxDHb77YztCeGY8wZJ3N/O8MRd
         i7elpr+WTVXsqm3bXLk3BXWJDQMtG++04gikHkV9N08WiMOTNAewZ/LxApGzIXx6+7V9
         8/aA==
X-Gm-Message-State: AC+VfDxG+Ua/9GysKCbZx7tGhxChOfqK65sqt9sndkF+QEqA26pAKCPk
	oPtVbd0TGVCEHEggDzd/ypd+rVzz5pWda1qPDqo=
X-Google-Smtp-Source: ACHHUZ7xwYKxkzg7Karyu4eRxK+ZpAwLIh8cqM/mWoWAPXjlXSqo63AUK34GTqty/xgUAu5etfsnNnWY0A/a2Rw+684=
X-Received: by 2002:adf:f10a:0:b0:311:1b27:bc7d with SMTP id
 r10-20020adff10a000000b003111b27bc7dmr538355wro.56.1686842278246; Thu, 15 Jun
 2023 08:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1685672395.git.steve@sakoman.com> <0470293e16f424ba4ee6505f3ef68e5ee13df483.1685672395.git.steve@sakoman.com>
 <CA+chaQdwObovTdLKQDoK5iKs4JDZXMNbmKc8X-EJFLaNJdX+Ww@mail.gmail.com>
 <CAOSpxdabCO0O+Ct_wMeYxCiZ60=33tC3a0jAqw=yL12KSfNpCA@mail.gmail.com>
 <CA+chaQf2FWd9rhOU07s0ra8S5tkEKNDZsjiXFY+GDynssuBd9A@mail.gmail.com> <1768DD7D92A3BE8A.10197@lists.openembedded.org>
In-Reply-To: <1768DD7D92A3BE8A.10197@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 15 Jun 2023 17:17:44 +0200
Message-ID: <CA+chaQcZCV6xUXPMzOO07trMsmx0R7T3_mQxfYWVHwqiK+LTXw@mail.gmail.com>
Subject: Re: mkfs.ext4 segfaults with uninative-4.0 Was: [OE-core][mickledore
 13/13] uninative: Upgrade to 4.0 to include latest gcc 13.1.1
To: Martin.Jansa@gmail.com
Cc: Steve Sakoman <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c97d6005fe2c9261"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 15:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182864

--000000000000c97d6005fe2c9261
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Well, after typing all of that I've realized that it might be related to:
https://github.com/NixOS/patchelf/issues/244

as we had similar issue before:
https://git.openembedded.org/openembedded-core/commit/?id=3Dcccd4bcaf381c27=
29adc000381bd89906003e72a

On Thu, Jun 15, 2023 at 5:06=E2=80=AFPM Martin Jansa via lists.openembedded=
.org
<Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:

> On Sun, Jun 4, 2023 at 10:34=E2=80=AFPM Martin Jansa <martin.jansa@gmail.=
com>
> wrote:
>
>> > It might be useful to delay backporting this for a bit longer (and I'l=
l
>> soon confirm if 3.10 was already affected or not).
>>
>> I can confirm that 3.10 is also affected.
>>
>> I did build with
>> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstabl=
e/kirkstone-nut&id=3D75e3870ea124321b81f856c4e5170c891f0bd050
>> and mkfs.ext4 didn't segfault. With uninative 3.10 from
>> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstabl=
e/kirkstone-nut&id=3D680eecc3ae09ea5585e46ff0e67f7c6704221806
>> it segfaults again.
>>
>> I haven't reproduced the gdk-pixbuf-native issue with buildtools-extende=
d
>> 4.0.6 with kirkstone yet, so that one might be only with nanbield, but
>> mkfs.ext4 segfaults seem related to uninative for sure. Will debug more
>> when I get access.
>>
>
> I got access to one of the servers where this is still reproducible, but
> the real root cause is still a mystery for me.
>
> I'll share what I've found so far in case someone else is seeing the same
> or can spot what I'm missing.
>
> It's reproducible on ubuntu-18.06, but not everywhere, I've tried older
> docker image and latest 18.04 on my host and both work fine. I've tried t=
o
> narrow the difference from the 18.04 image where it is failing but withou=
t
> any luck.
>
> The same happens with nanbield (where I've noticed it first), but now the
> same happens with mickledore and kirkstone.
>
> No special config needed, default poky configuration reproduces the same.
>
> Easiest test is to build just e2fsprogs-native and try to execute
> mkfs.ext4.real, if it immediately segfaults it's a "bad" binary, if it
> complains about missing e2* symbols or BLKID_2_36 symbol missing
> in libblkid.so.1, then it's "good" binary and works as long as you let it
> load the right libraries from native sysroot.
>
> Surprisingly whatever breaks the binary happens between "image" and
> "sysroot-destdir" so first I was suspecting strip from host's binutils, b=
ut
> downgrading binutils in different 18.04 system to match the one where it =
is
> failing didn't reproduce it. Downgrading libgcc1 and some other packages =
to
> match didn't reproduce it as well.
>
> Next I've tried to inhibit strip completely (assuming it will be usable
> work around to keep the binary in sysroot-destdir working with new
> uninative and narrow down what I need to debug), but surprisingly now bot=
h
> the binary in "image" and "sysroot-destdir" fail the same.
>
> Strace doesn't show anything useful, other than segfault triggered very
> early:
>
> $ strace
> tmp/work/x86_64-linux/e2fsprogs-native/1.46.5-r0/sysroot-destdir/home/wor=
ker/poky-kirkstone-jansa/build/tmp/work/x86_64-linux/e2fsprogs-native/1.46.=
5-r0/recipe-sysroot-native/sbin/mkfs.ext4.real
> execve("tmp/work/x86_64-linux/e2fsprogs-native/1.46.5-r0/sysroot-destdir/=
home/worker/poky-kirkstone-jansa/build/tmp/work/x86_64-linux/e2fsprogs-nati=
ve/1.46.5-r0/recipe-sysroot-native/sbin/mkfs.ext4.real",
> ["tmp/work/x86_64-linux/e2fsprogs-"...], 0x7fffbec05ac0 /* 55 vars */) =
=3D 0
> brk(NULL)                               =3D 0x55b91bc0e000
> arch_prctl(0x3001 /* ARCH_??? */, 0x7ffc146b5340) =3D -1 EINVAL (Invalid
> argument)
> --- SIGSEGV {si_signo=3DSIGSEGV, si_code=3DSEGV_MAPERR,
> si_addr=3D0x55b91ba016e0} ---
> +++ killed by SIGSEGV (core dumped) +++
> Segmentation fault (core dumped)
>
> $ strace
> tmp/work/x86_64-linux/e2fsprogs-native/1.46.5-r0/image/home/worker/poky-k=
irkstone-jansa/build/tmp/work/x86_64-linux/e2fsprogs-native/1.46.5-r0/recip=
e-sysroot-native/sbin/mkfs.ext4.real
> 2>&1 | head
> execve("tmp/work/x86_64-linux/e2fsprogs-native/1.46.5-r0/image/home/worke=
r/poky-kirkstone-jansa/build/tmp/work/x86_64-linux/e2fsprogs-native/1.46.5-=
r0/recipe-sysroot-native/sbin/mkfs.ext4.real",
> ["tmp/work/x86_64-linux/e2fsprogs-"...], 0x7ffd387a7f60 /* 55 vars */) =
=3D 0
> brk(NULL)                               =3D 0x5641b084f000
> arch_prctl(0x3001 /* ARCH_??? */, 0x7ffe271263f0) =3D -1 EINVAL (Invalid
> argument)
> --- SIGSEGV {si_signo=3DSIGSEGV, si_code=3DSEGV_MAPERR,
> si_addr=3D0x5641b00016e0} ---
> +++ killed by SIGSEGV (core dumped) +++
>
> While "good" binary:
> $ strace
> tmp/work/x86_64-linux/e2fsprogs-native/1.46.5-r0/image/home/worker/poky-k=
irkstone-jansa/build/tmp/work/x86_64-linux/e2fsprogs-native/1.46.5-r0/recip=
e-sysroot-native/sbin/mkfs.ext4.real
> | head
> execve("tmp/work/x86_64-linux/e2fsprogs-native/1.46.5-r0/image/home/worke=
r/poky-kirkstone-jansa/build/tmp/work/x86_64-linux/e2fsprogs-native/1.46.5-=
r0/recipe-sysroot-native/sbin/mkfs.ext4.real",
> ["tmp/work/x86_64-linux/e2fsprogs-"...], 0x7ffd9f569ae0 /* 55 vars */) =
=3D 0
> brk(NULL)                               =3D 0x5569fad4e000
> arch_prctl(0x3001 /* ARCH_??? */, 0x7ffe1d8ce2f0) =3D -1 EINVAL (Invalid
> argument)
> mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D
> 0x7f210b337000
> access("/etc/ld.so.preload", R_OK)      =3D -1 ENOENT (No such file or
> directory)
> openat(AT_FDCWD,
> "/home/worker/poky-kirkstone-jansa/build/tmp/work/x86_64-linux/e2fsprogs-=
native/1.46.5-r0/recipe-sysroot-native/usr/lib/glibc-hwcaps/x86-64-v4/libex=
t2fs.so.2",
> O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (No such file or directory)
> newfstatat(AT_FDCWD,
> "/home/worker/poky-kirkstone-jansa/build/tmp/work/x86_64-linux/e2fsprogs-=
native/1.46.5-r0/recipe-sysroot-native/usr/lib/glibc-hwcaps/x86-64-v4",
> 0x7ffe1d8cd520, 0) =3D -1 ENOENT (No such file or directory)
>
> The diffoscope output shows that dynsym section is second to last in "bad=
"
> binary and first in "good" binary, which might relate to the warnings sho=
wn
> by gdb:
>
> Reading symbols from ./recipe-sysroot-native/sbin/mkfs.ext4.real...
>
> warning: Loadable section ".dynsym" outside of ELF segments
>
> warning: Loadable section ".interp" outside of ELF segments
> (No debugging symbols found in ./recipe-sysroot-native/sbin/mkfs.ext4.rea=
l)
> (gdb) r
> Starting program:
> /data001/jansa/build-webos/BUILD/work/qemux86_64-webos-linux/webos-image/=
1.0-r3normal1/recipe-sysroot-native/sbin/mkfs.ext4.real
>
> warning: Error disabling address space randomization: Operation not
> permitted
> BFD:
> /data001/jansa/build-webos/BUILD/sysroots-uninative/x86_64-linux/lib/ld-l=
inux-x86-64.so.2:
> unknown type [0x13] section `.relr.dyn'
> warning:
> `/data001/jansa/build-webos/BUILD/sysroots-uninative/x86_64-linux/lib/ld-=
linux-x86-64.so.2':
> Shared library architecture unknown is not compatible with target
> architecture i386:x86-64.
> warning:
> `/data001/jansa/build-webos/BUILD/sysroots-uninative/x86_64-linux/lib/ld-=
linux-x86-64.so.2':
> Shared library architecture unknown is not compatible with target
> architecture i386:x86-64.
>
> Program received signal SIGSEGV, Segmentation fault.
> 0x00007f08c9d9232a in strcmp () from
> /data001/jansa/build-webos/BUILD/sysroots-uninative/x86_64-linux/lib/ld-l=
inux-x86-64.so.2
>
> And ldd also says that the "bad" binary isn't dynamic executable while
> "good" on is (objdump -x works for both of them):
>
> the "bad" one:
> ldd
> tmp/work/x86_64-linux/e2fsprogs-native/1.46.5-r0/sysroot-destdir/home/wor=
ker/poky-kirkstone-jansa/build/tmp/work/x86_64-linux/e2fsprogs-native/1.46.=
5-r0/recipe-sysroot-native/sbin/mkfs.ext4.real
> not a dynamic executable
>
> and the "good" one:
> ldd
> tmp/work/x86_64-linux/e2fsprogs-native/1.46.5-r0/image/home/worker/poky-k=
irkstone-jansa/build/tmp/work/x86_64-linux/e2fsprogs-native/1.46.5-r0/recip=
e-sysroot-native/sbin/mkfs.ext4.real
>
> linux-vdso.so.1 (0x00007ffce83fc000)
> libext2fs.so.2 =3D> /lib/x86_64-linux-gnu/libext2fs.so.2 (0x00007fd1ba5a0=
000)
> libcom_err.so.2 =3D> /lib/x86_64-linux-gnu/libcom_err.so.2
> (0x00007fd1ba39c000)
> libblkid.so.1 =3D>
> /home/worker/poky-kirkstone-jansa/build/tmp/work/x86_64-linux/e2fsprogs-n=
ative/1.46.5-r0/recipe-sysroot-native/usr/lib/libblkid.so.1
> (0x00007fd1ba149000)
> libuuid.so.1 =3D>
> /home/worker/poky-kirkstone-jansa/build/tmp/work/x86_64-linux/e2fsprogs-n=
ative/1.46.5-r0/recipe-sysroot-native/usr/lib/libuuid.so.1
> (0x00007fd1b9f42000)
> libe2p.so.2 =3D> /lib/x86_64-linux-gnu/libe2p.so.2 (0x00007fd1b9d39000)
> libpthread.so.0 =3D> /lib/x86_64-linux-gnu/libpthread.so.0
> (0x00007fd1b9b1a000)
> libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007fd1b9729000)
> /home/worker/poky-kirkstone-jansa/build/tmp/sysroots-uninative/x86_64-lin=
ux/lib/ld-linux-x86-64.so.2
> =3D> /lib64/ld-linux-x86-64.so.2 (0x00007fd1baa0f000)
>
> Once the "bad" binary is built (with either uninative 4.0 or 3.9) it will
> always fail with uninative 4.0 even when reused from sstate on different
> server (if it's the server producing "good" mkfs.ext4.real binaries, then
> just rebuilding e2fsprogs-native will fix it).
>
> Does this make any sense to anyone? I'll continue to look into it, but if
> you have any hints, please let me know.
>
> I know 18.04 is EOL and nobody should be using it, I'm trying to get our
> build infra upgraded for very long time.
>
> The diffoscope output (mkfs.4.0-18.04-sstate is the "bad" binary from
> sstate while mkfs.4.0-18.04-rebuilt is the "good" one).
>
> --- mkfs.4.0-18.04-rebuilt
> +++ mkfs.4.0-18.04-sstate
> =E2=94=82=E2=94=84 File has been modified after NT_GNU_BUILD_ID has been =
applied.
> =E2=94=9C=E2=94=80=E2=94=80 readelf --wide --file-header {}
> =E2=94=82 @@ -4,17 +4,17 @@
> =E2=94=82    Data:                              2's complement, little en=
dian
> =E2=94=82    Version:                           1 (current)
> =E2=94=82    OS/ABI:                            UNIX - System V
> =E2=94=82    ABI Version:                       0
> =E2=94=82    Type:                              DYN (Position-Independent
> Executable file)
> =E2=94=82    Machine:                           Advanced Micro Devices X8=
6-64
> =E2=94=82    Version:                           0x1
> =E2=94=82 -  Entry point address:               0x8350
> =E2=94=82 +  Entry point address:               0x8380
> =E2=94=82    Start of program headers:          64 (bytes into file)
> =E2=94=82    Start of section headers:          127520 (bytes into file)
> =E2=94=82    Flags:                             0x0
> =E2=94=82    Size of this header:               64 (bytes)
> =E2=94=82    Size of program headers:           56 (bytes)
> =E2=94=82    Number of program headers:         13
> =E2=94=82    Size of section headers:           64 (bytes)
> =E2=94=82    Number of section headers:         27
> =E2=94=82 -  Section header string table index: 22
> =E2=94=82 +  Section header string table index: 21
> =E2=94=9C=E2=94=80=E2=94=80 readelf --wide --program-header {}
> =E2=94=82 @@ -1,37 +1,37 @@
> =E2=94=82
> =E2=94=82  Elf file type is DYN (Position-Independent Executable file)
> =E2=94=82 -Entry point 0x8350
> =E2=94=82 +Entry point 0x8380
> =E2=94=82  There are 13 program headers, starting at offset 64
> =E2=94=82
> =E2=94=82  Program Headers:
> =E2=94=82    Type           Offset   VirtAddr           PhysAddr         =
  FileSiz
>  MemSiz   Flg Align
> =E2=94=82    PHDR           0x000040 0x0000000000000040 0x000000000000004=
0
> 0x0002d8 0x0002d8 R   0x8
> =E2=94=82 -  LOAD           0x000000 0x0000000000000000 0x000000000000000=
0
> 0x01dcb0 0x01dcb0 R E 0x200000
> =E2=94=82 +  LOAD           0x000000 0x0000000000000000 0x000000000000000=
0
> 0x01dcf0 0x01dcf0 R E 0x200000
> =E2=94=82    GNU_STACK      0x000000 0x0000000000000000 0x000000000000000=
0
> 0x000000 0x000000 RW  0x10
> =E2=94=82 -  GNU_EH_FRAME   0x01b794 0x000000000001b794 0x000000000001b79=
4
> 0x0004fc 0x0004fc R   0x4
> =E2=94=82 +  GNU_EH_FRAME   0x01b7d4 0x000000000001b7d4 0x000000000001b7d=
4
> 0x0004fc 0x0004fc R   0x4
> =E2=94=82    LOAD           0x01e450 0x000000000021e450 0x000000000021e45=
0
> 0x000cd8 0x0013d8 RW  0x200000
> =E2=94=82    GNU_RELRO      0x01e450 0x000000000021e450 0x000000000021e45=
0
> 0x000bb0 0x000bb0 R   0x1
> =E2=94=82    DYNAMIC        0x01e678 0x000000000021e678 0x000000000021e67=
8
> 0x000260 0x000260 RW  0x8
> =E2=94=82 -  LOAD           0x020000 0x0000000000400000 0x000000000040000=
0
> 0x000178 0x000178 RW  0x200000
> =E2=94=82 +  LOAD           0x020000 0x0000000000400000 0x000000000040000=
0
> 0x0000a8 0x0000a8 RW  0x200000
> =E2=94=82    NOTE           0x020060 0x0000000000400060 0x000000000040006=
0
> 0x000020 0x000020 R   0x4
> =E2=94=82    NOTE           0x020080 0x0000000000400080 0x000000000040008=
0
> 0x000024 0x000024 R   0x4
> =E2=94=82 -  LOAD           0x021000 0x0000000000600000 0x000000000060000=
0
> 0x001060 0x001060 RW  0x200000
> =E2=94=82 -  INTERP         0x023000 0x0000000000a00000 0x0000000000a0000=
0
> 0x00005a 0x00005a R   0x1
> =E2=94=82 +  LOAD           0x021000 0x0000000000600000 0x000000000060000=
0
> 0x000130 0x000130 RW  0x200000
> =E2=94=82 +  LOAD           0x022000 0x0000000000800000 0x000000000080000=
0
> 0x002740 0x002740 RW  0x200000
> =E2=94=82 +  INTERP         0x0246e0 0x0000000000a016e0 0x0000000000a016e=
0
> 0x00005a 0x00005a R   0x1
> =E2=94=82        [Requesting program interpreter:
> /data001/jansa/build-webos/BUILD/sysroots-uninative/x86_64-linux/lib/ld-l=
inux-x86-64.so.2]
> =E2=94=82 -  LOAD           0x023000 0x0000000000a00000 0x0000000000a0000=
0
> 0x000060 0x000060 RW  0x200000
> =E2=94=82
> =E2=94=82   Section to Segment mapping:
> =E2=94=82    Segment Sections...
> =E2=94=82     00
> =E2=94=82 -   01     .dynsym .dynstr .gnu.version .gnu.version_r .rela.dy=
n
> .rela.plt .init .plt .plt.got .text .fini .rodata .eh_frame_hdr .eh_frame
> =E2=94=82 +   01     .dynstr .gnu.version .gnu.version_r .rela.dyn .rela.=
plt .init
> .plt .plt.got .text .fini .rodata .eh_frame_hdr .eh_frame
> =E2=94=82     02
> =E2=94=82     03     .eh_frame_hdr
> =E2=94=82     04     .init_array .fini_array .data.rel.ro .dynamic .got .=
data .bss
> =E2=94=82     05     .init_array .fini_array .data.rel.ro .dynamic .got
> =E2=94=82     06     .dynamic
> =E2=94=82 -   07     .note.ABI-tag .note.gnu.build-id .gnu.hash
> =E2=94=82 +   07     .note.ABI-tag .note.gnu.build-id
> =E2=94=82     08     .note.ABI-tag
> =E2=94=82     09     .note.gnu.build-id
> =E2=94=82 -   10
> =E2=94=82 -   11     .interp
> =E2=94=82 +   10     .gnu.hash
> =E2=94=82 +   11
> =E2=94=82     12     .interp
> =E2=94=9C=E2=94=80=E2=94=80 readelf --wide --sections {}
> =E2=94=82 @@ -1,36 +1,36 @@
> =E2=94=82  There are 27 section headers, starting at offset 0x1f220:
> =E2=94=82
> =E2=94=82  Section Headers:
> =E2=94=82    [Nr] Name              Type            Address          Off =
   Size
> ES Flg Lk Inf Al
> =E2=94=82    [ 0]                   NULL            0000000000000000 0000=
00 000000
> 00      0   0  0
> =E2=94=82 -  [ 1] .dynsym           DYNSYM          00000000000003a8 0003=
a8 0016e0
> 18   A  2   1  8
> =E2=94=82 -  [ 2] .dynstr           STRTAB          0000000000001a88 001a=
88 001182
> 00   A  0   0  1
> =E2=94=82 -  [ 3] .gnu.version      VERSYM          0000000000002c0a 002c=
0a 0001e8
> 02   A  1   0  2
> =E2=94=82 -  [ 4] .gnu.version_r    VERNEED         0000000000002df8 002d=
f8 000100
> 00   A  2   4  8
> =E2=94=82 -  [ 5] .rela.dyn         RELA            0000000000002ef8 002e=
f8 0008a0
> 18   A  1   0  8
> =E2=94=82 -  [ 6] .rela.plt         RELA            0000000000003798 0037=
98 001488
> 18  AI  1  19  8
> =E2=94=82 -  [ 7] .init             PROGBITS        0000000000004c20 004c=
20 000017
> 00  AX  0   0  4
> =E2=94=82 -  [ 8] .plt              PROGBITS        0000000000004c40 004c=
40 000dc0
> 10  AX  0   0 16
> =E2=94=82 -  [ 9] .plt.got          PROGBITS        0000000000005a00 005a=
00 000008
> 08  AX  0   0  8
> =E2=94=82 -  [10] .text             PROGBITS        0000000000005a10 005a=
10 010cd2
> 00  AX  0   0 16
> =E2=94=82 -  [11] .fini             PROGBITS        00000000000166e4 0166=
e4 000009
> 00  AX  0   0  4
> =E2=94=82 -  [12] .rodata           PROGBITS        00000000000166f0 0166=
f0 0050a2
> 00   A  0   0 16
> =E2=94=82 -  [13] .eh_frame_hdr     PROGBITS        000000000001b794 01b7=
94 0004fc
> 00   A  0   0  4
> =E2=94=82 -  [14] .eh_frame         PROGBITS        000000000001bc90 01bc=
90 002020
> 00   A  0   0  8
> =E2=94=82 -  [15] .init_array       INIT_ARRAY      000000000021e450 01e4=
50 000008
> 08  WA  0   0  8
> =E2=94=82 -  [16] .fini_array       FINI_ARRAY      000000000021e458 01e4=
58 000008
> 08  WA  0   0  8
> =E2=94=82 -  [17] .data.rel.ro      PROGBITS        000000000021e460 01e4=
60
> 000218 00  WA  0   0 32
> =E2=94=82 -  [18] .dynamic          DYNAMIC         000000000021e678 01e6=
78 000260
> 10  WA  2   0  8
> =E2=94=82 -  [19] .got              PROGBITS        000000000021e8d8 01e8=
d8 000720
> 08  WA  0   0  8
> =E2=94=82 -  [20] .data             PROGBITS        000000000021f000 01f0=
00 000128
> 00  WA  0   0 32
> =E2=94=82 -  [21] .bss              NOBITS          000000000021f140 01f1=
28 0006e8
> 00  WA  0   0 32
> =E2=94=82 -  [22] .shstrtab         STRTAB          0000000000000000 01f1=
28 0000f2
> 00      0   0  1
> =E2=94=82 -  [23] .note.ABI-tag     NOTE            0000000000400060 0200=
60 000020
> 00   A  0   0  4
> =E2=94=82 -  [24] .note.gnu.build-id NOTE            0000000000400080 020=
080
> 000024 00   A  0   0  4
> =E2=94=82 -  [25] .gnu.hash         GNU_HASH        00000000004000a8 0200=
a8 0000cc
> 00   A  1   0  8
> =E2=94=82 -  [26] .interp           PROGBITS        0000000000a00000 0230=
00 00005a
> 00   A  0   0  8
> =E2=94=82 +  [ 1] .dynstr           STRTAB          0000000000001aa0 001a=
a0 0011a8
> 00   A  0   0  1
> =E2=94=82 +  [ 2] .gnu.version      VERSYM          0000000000002c48 002c=
48 0001e8
> 02   A 25   0  2
> =E2=94=82 +  [ 3] .gnu.version_r    VERNEED         0000000000002e30 002e=
30 000100
> 00   A  1   4  8
> =E2=94=82 +  [ 4] .rela.dyn         RELA            0000000000002f30 002f=
30 0008a0
> 18   A 25   0  8
> =E2=94=82 +  [ 5] .rela.plt         RELA            00000000000037d0 0037=
d0 001488
> 18  AI 25  18  8
> =E2=94=82 +  [ 6] .init             PROGBITS        0000000000004c58 004c=
58 000017
> 00  AX  0   0  4
> =E2=94=82 +  [ 7] .plt              PROGBITS        0000000000004c70 004c=
70 000dc0
> 10  AX  0   0 16
> =E2=94=82 +  [ 8] .plt.got          PROGBITS        0000000000005a30 005a=
30 000008
> 08  AX  0   0  8
> =E2=94=82 +  [ 9] .text             PROGBITS        0000000000005a40 005a=
40 010cd2
> 00  AX  0   0 16
> =E2=94=82 +  [10] .fini             PROGBITS        0000000000016714 0167=
14 000009
> 00  AX  0   0  4
> =E2=94=82 +  [11] .rodata           PROGBITS        0000000000016720 0167=
20 0050b2
> 00   A  0   0 16
> =E2=94=82 +  [12] .eh_frame_hdr     PROGBITS        000000000001b7d4 01b7=
d4 0004fc
> 00   A  0   0  4
> =E2=94=82 +  [13] .eh_frame         PROGBITS        000000000001bcd0 01bc=
d0 002020
> 00   A  0   0  8
> =E2=94=82 +  [14] .init_array       INIT_ARRAY      000000000021e450 01e4=
50 000008
> 08  WA  0   0  8
> =E2=94=82 +  [15] .fini_array       FINI_ARRAY      000000000021e458 01e4=
58 000008
> 08  WA  0   0  8
> =E2=94=82 +  [16] .data.rel.ro      PROGBITS        000000000021e460 01e4=
60
> 000218 00  WA  0   0 32
> =E2=94=82 +  [17] .dynamic          DYNAMIC         000000000021e678 01e6=
78 000260
> 10  WA  1   0  8
> =E2=94=82 +  [18] .got              PROGBITS        000000000021e8d8 01e8=
d8 000720
> 08  WA  0   0  8
> =E2=94=82 +  [19] .data             PROGBITS        000000000021f000 01f0=
00 000128
> 00  WA  0   0 32
> =E2=94=82 +  [20] .bss              NOBITS          000000000021f140 01f1=
28 0006e8
> 00  WA  0   0 32
> =E2=94=82 +  [21] .shstrtab         STRTAB          0000000000000000 01f1=
28 0000f2
> 00      0   0  1
> =E2=94=82 +  [22] .note.ABI-tag     NOTE            0000000000400060 0200=
60 000020
> 00   A  0   0  4
> =E2=94=82 +  [23] .note.gnu.build-id NOTE            0000000000400080 020=
080
> 000024 00   A  0   0  4
> =E2=94=82 +  [24] .gnu.hash         GNU_HASH        0000000000600000 0210=
00 0000cc
> 00   A 25   0  8
> =E2=94=82 +  [25] .dynsym           DYNSYM          0000000000a00000 0230=
00 0016e0
> 18   A  1   1  8
> =E2=94=82 +  [26] .interp           PROGBITS        0000000000a016e0 0246=
e0 00005a
> 00   A  0   0  8
> =E2=94=82  Key to Flags:
> =E2=94=82    W (write), A (alloc), X (execute), M (merge), S (strings), I=
 (info),
> =E2=94=82    L (link order), O (extra OS processing required), G (group),=
 T (TLS),
> =E2=94=82    C (compressed), x (unknown), o (OS specific), E (exclude),
> =E2=94=82    D (mbind), l (large), p (processor specific)
> =E2=94=9C=E2=94=80=E2=94=80 readelf --wide --symbols {}
> =E2=94=82 @@ -223,25 +223,25 @@
> =E2=94=82     219: 0000000000000000     0 FUNC    GLOBAL DEFAULT  UND
> ext2fs_get_device_size2
> =E2=94=82     220: 0000000000000000     0 FUNC    GLOBAL DEFAULT  UND
> ext2fs_free_blocks_count
> =E2=94=82     221: 0000000000000000     0 FUNC    GLOBAL DEFAULT  UND
> ext2fs_inode_table_loc
> =E2=94=82     222: 0000000000000000     0 FUNC    GLOBAL DEFAULT  UND
> ext2fs_badblocks_list_iterate
> =E2=94=82     223: 0000000000000000     0 FUNC    GLOBAL DEFAULT  UND
> __ctype_b_loc@GLIBC_2.3 (8)
> =E2=94=82     224: 0000000000000000     0 FUNC    GLOBAL DEFAULT  UND
> ext2fs_open_file
> =E2=94=82     225: 0000000000000000     0 FUNC    GLOBAL DEFAULT  UND
> __sprintf_chk@GLIBC_2.3.4 (4)
> =E2=94=82 -   226: 000000000021f128     0 NOTYPE  GLOBAL DEFAULT   20 _ed=
ata
> =E2=94=82 -   227: 000000000021f1b0     8 OBJECT  GLOBAL DEFAULT   21 _et=
_list
> =E2=94=82 -   228: 000000000021f140     8 OBJECT  GLOBAL DEFAULT   21
> stdout@GLIBC_2.2.5 (3)
> =E2=94=82 -   229: 00000000000166e4     0 FUNC    GLOBAL DEFAULT   11 _fi=
ni
> =E2=94=82 -   230: 000000000021e660    24 OBJECT  GLOBAL DEFAULT   17
> et_ext2_error_table
> =E2=94=82 -   231: 000000000021f168     8 OBJECT  GLOBAL DEFAULT   21
> optarg@GLIBC_2.2.5 (3)
> =E2=94=82 -   232: 0000000000004c20     0 FUNC    GLOBAL DEFAULT    7 _in=
it
> =E2=94=82 -   233: 000000000021f158     4 OBJECT  GLOBAL DEFAULT   21
> optind@GLIBC_2.2.5 (3)
> =E2=94=82 -   234: 000000000021f190     8 OBJECT  GLOBAL DEFAULT   21
> unix_io_manager
> =E2=94=82 -   235: 000000000021f1a8     8 OBJECT  GLOBAL DEFAULT   21
> test_io_backing_manager
> =E2=94=82 -   236: 000000000021f128     0 NOTYPE  GLOBAL DEFAULT   21 __b=
ss_start
> =E2=94=82 -   237: 000000000021f150     8 OBJECT  GLOBAL DEFAULT   21
> stdin@GLIBC_2.2.5 (3)
> =E2=94=82 -   238: 000000000021f1c0     8 OBJECT  GLOBAL DEFAULT   21
> stderr@GLIBC_2.2.5 (3)
> =E2=94=82 -   239: 000000000021f170    24 OBJECT  GLOBAL DEFAULT   21
> ext2fs_numeric_progress_ops
> =E2=94=82 -   240: 000000000021f828     0 NOTYPE  GLOBAL DEFAULT   21 _en=
d
> =E2=94=82 -   241: 000000000021f1a0     8 OBJECT  GLOBAL DEFAULT   21
> undo_io_manager
> =E2=94=82 -   242: 000000000021f160     8 OBJECT  GLOBAL DEFAULT   21
> test_io_manager
> =E2=94=82 -   243: 000000000021f1b8     8 OBJECT  GLOBAL DEFAULT   21
> sparse_io_manager
> =E2=94=82 +   226: 000000000021f128     0 NOTYPE  GLOBAL DEFAULT   19 _ed=
ata
> =E2=94=82 +   227: 000000000021f1b0     8 OBJECT  GLOBAL DEFAULT   20 _et=
_list
> =E2=94=82 +   228: 000000000021f140     8 OBJECT  GLOBAL DEFAULT   20
> stdout@GLIBC_2.2.5 (3)
> =E2=94=82 +   229: 0000000000016714     0 FUNC    GLOBAL DEFAULT   10 _fi=
ni
> =E2=94=82 +   230: 000000000021e660    24 OBJECT  GLOBAL DEFAULT   16
> et_ext2_error_table
> =E2=94=82 +   231: 000000000021f168     8 OBJECT  GLOBAL DEFAULT   20
> optarg@GLIBC_2.2.5 (3)
> =E2=94=82 +   232: 0000000000004c58     0 FUNC    GLOBAL DEFAULT    6 _in=
it
> =E2=94=82 +   233: 000000000021f158     4 OBJECT  GLOBAL DEFAULT   20
> optind@GLIBC_2.2.5 (3)
> =E2=94=82 +   234: 000000000021f190     8 OBJECT  GLOBAL DEFAULT   20
> unix_io_manager
> =E2=94=82 +   235: 000000000021f1a8     8 OBJECT  GLOBAL DEFAULT   20
> test_io_backing_manager
> =E2=94=82 +   236: 000000000021f128     0 NOTYPE  GLOBAL DEFAULT   20 __b=
ss_start
> =E2=94=82 +   237: 000000000021f150     8 OBJECT  GLOBAL DEFAULT   20
> stdin@GLIBC_2.2.5 (3)
> =E2=94=82 +   238: 000000000021f1c0     8 OBJECT  GLOBAL DEFAULT   20
> stderr@GLIBC_2.2.5 (3)
> =E2=94=82 +   239: 000000000021f170    24 OBJECT  GLOBAL DEFAULT   20
> ext2fs_numeric_progress_ops
> =E2=94=82 +   240: 000000000021f828     0 NOTYPE  GLOBAL DEFAULT   20 _en=
d
> =E2=94=82 +   241: 000000000021f1a0     8 OBJECT  GLOBAL DEFAULT   20
> undo_io_manager
> =E2=94=82 +   242: 000000000021f160     8 OBJECT  GLOBAL DEFAULT   20
> test_io_manager
> =E2=94=82 +   243: 000000000021f1b8     8 OBJECT  GLOBAL DEFAULT   20
> sparse_io_manager
> =E2=94=9C=E2=94=80=E2=94=80 readelf --wide --relocs {}
> =E2=94=82 @@ -1,83 +1,83 @@
> =E2=94=82
> =E2=94=82 -Relocation section '.rela.dyn' at offset 0x2ef8 contains 92 en=
tries:
> =E2=94=82 +Relocation section '.rela.dyn' at offset 0x2f30 contains 92 en=
tries:
> =E2=94=82      Offset             Info             Type               Sym=
bol's
> Value  Symbol's Name + Addend
> =E2=94=82 -000000000021e450  0000000000000008 R_X86_64_RELATIVE
>       8430
> =E2=94=82 -000000000021e458  0000000000000008 R_X86_64_RELATIVE
>       83f0
> =E2=94=82 -000000000021e460  0000000000000008 R_X86_64_RELATIVE
>       1aaad
> =E2=94=82 -000000000021e468  0000000000000008 R_X86_64_RELATIVE
>       1a9c1
> =E2=94=82 -000000000021e470  0000000000000008 R_X86_64_RELATIVE
>       1a9c4
> =E2=94=82 -000000000021e478  0000000000000008 R_X86_64_RELATIVE
>       1a9ca
> =E2=94=82 -000000000021e480  0000000000000008 R_X86_64_RELATIVE
>       1aa17
> =E2=94=82 -000000000021e488  0000000000000008 R_X86_64_RELATIVE
>       1a9ce
> =E2=94=82 -000000000021e4a0  0000000000000008 R_X86_64_RELATIVE
>       190bd
> =E2=94=82 -000000000021e4a8  0000000000000008 R_X86_64_RELATIVE
>       1a9d2
> =E2=94=82 -000000000021e4b0  0000000000000008 R_X86_64_RELATIVE
>       1a9d6
> =E2=94=82 -000000000021e4b8  0000000000000008 R_X86_64_RELATIVE
>       1aa87
> =E2=94=82 -000000000021e4c0  0000000000000008 R_X86_64_RELATIVE
>       18ebd
> =E2=94=82 -000000000021e4c8  0000000000000008 R_X86_64_RELATIVE
>       1904e
> =E2=94=82 +000000000021e450  0000000000000008 R_X86_64_RELATIVE
>       8460
> =E2=94=82 +000000000021e458  0000000000000008 R_X86_64_RELATIVE
>       8420
> =E2=94=82 +000000000021e460  0000000000000008 R_X86_64_RELATIVE
>       1aaed
> =E2=94=82 +000000000021e468  0000000000000008 R_X86_64_RELATIVE
>       1aa01
> =E2=94=82 +000000000021e470  0000000000000008 R_X86_64_RELATIVE
>       1aa04
> =E2=94=82 +000000000021e478  0000000000000008 R_X86_64_RELATIVE
>       1aa0a
> =E2=94=82 +000000000021e480  0000000000000008 R_X86_64_RELATIVE
>       1aa57
> =E2=94=82 +000000000021e488  0000000000000008 R_X86_64_RELATIVE
>       1aa0e
> =E2=94=82 +000000000021e4a0  0000000000000008 R_X86_64_RELATIVE
>       19100
> =E2=94=82 +000000000021e4a8  0000000000000008 R_X86_64_RELATIVE
>       1aa12
> =E2=94=82 +000000000021e4b0  0000000000000008 R_X86_64_RELATIVE
>       1aa16
> =E2=94=82 +000000000021e4b8  0000000000000008 R_X86_64_RELATIVE
>       1aac7
> =E2=94=82 +000000000021e4c0  0000000000000008 R_X86_64_RELATIVE
>       18f00
> =E2=94=82 +000000000021e4c8  0000000000000008 R_X86_64_RELATIVE
>       19091
> ...
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182862):
> https://lists.openembedded.org/g/openembedded-core/message/182862
> Mute This Topic: https://lists.openembedded.org/mt/99550848/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c97d6005fe2c9261
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Well, after typing all of that I&#39;ve realized that it m=
ight be related to:<br><a href=3D"https://github.com/NixOS/patchelf/issues/=
244">https://github.com/NixOS/patchelf/issues/244</a><br><br>as we had simi=
lar issue before:<br><a href=3D"https://git.openembedded.org/openembedded-c=
ore/commit/?id=3Dcccd4bcaf381c2729adc000381bd89906003e72a">https://git.open=
embedded.org/openembedded-core/commit/?id=3Dcccd4bcaf381c2729adc000381bd899=
06003e72a</a><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Thu, Jun 15, 2023 at 5:06=E2=80=AFPM Martin Jansa via <=
a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;Mar=
tin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@l=
ists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Sun, Jun 4, 2023 =
at 10:34=E2=80=AFPM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.c=
om" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br></div><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><span style=3D"color:rgb(80,0,80)">&gt; It might be useful to =
delay backporting this for a bit longer (and I&#39;ll soon confirm if 3.10 =
was already affected or not).</span><br><div><span style=3D"color:rgb(80,0,=
80)"><br></span></div><div><span style=3D"color:rgb(80,0,80)">I can confirm=
 that 3.10 is also affected.</span></div><div><span style=3D"color:rgb(80,0=
,80)"><br></span></div><div><span style=3D"color:rgb(80,0,80)">I did build =
with=C2=A0</span><a href=3D"https://git.openembedded.org/openembedded-core-=
contrib/commit/?h=3Dstable/kirkstone-nut&amp;id=3D75e3870ea124321b81f856c4e=
5170c891f0bd050" target=3D"_blank">https://git.openembedded.org/openembedde=
d-core-contrib/commit/?h=3Dstable/kirkstone-nut&amp;id=3D75e3870ea124321b81=
f856c4e5170c891f0bd050</a> and mkfs.ext4 didn&#39;t segfault. With uninativ=
e 3.10 from=C2=A0<a href=3D"https://git.openembedded.org/openembedded-core-=
contrib/commit/?h=3Dstable/kirkstone-nut&amp;id=3D680eecc3ae09ea5585e46ff0e=
67f7c6704221806" target=3D"_blank">https://git.openembedded.org/openembedde=
d-core-contrib/commit/?h=3Dstable/kirkstone-nut&amp;id=3D680eecc3ae09ea5585=
e46ff0e67f7c6704221806</a> it segfaults again.</div><div><br></div><div>I h=
aven&#39;t reproduced the gdk-pixbuf-native issue with buildtools-extended =
4.0.6 with kirkstone yet, so that one might be only with nanbield, but mkfs=
.ext4 segfaults seem related to uninative for sure. Will debug more when I =
get access.</div></div></blockquote><div><br></div><div>I got access to one=
 of the servers where this is still reproducible, but the real root cause i=
s still a mystery for me.</div><div><br></div><div>I&#39;ll share what I&#3=
9;ve found so far in case someone else is seeing the same or can spot what =
I&#39;m missing.</div><div><br></div><div>It&#39;s reproducible on ubuntu-1=
8.06, but not everywhere, I&#39;ve tried older docker image and latest 18.0=
4 on my host and both work fine. I&#39;ve tried to narrow the difference fr=
om the 18.04 image where it is failing but without any luck.</div><div><br>=
</div><div>The same happens with nanbield (where I&#39;ve noticed it first)=
, but now the same happens with mickledore and kirkstone.</div><div><br></d=
iv><div>No special config needed, default poky configuration reproduces the=
 same.</div><div><br></div><div>Easiest test is to build just e2fsprogs-nat=
ive and try to execute mkfs.ext4.real, if it immediately segfaults it&#39;s=
 a &quot;bad&quot; binary, if it complains about missing e2* symbols or=C2=
=A0BLKID_2_36 symbol missing in=C2=A0libblkid.so.1, then it&#39;s &quot;goo=
d&quot; binary and works as long as you let it load the right libraries fro=
m native sysroot.</div><div><br></div><div>Surprisingly whatever breaks the=
 binary happens between &quot;image&quot; and &quot;sysroot-destdir&quot; s=
o first I was suspecting strip from host&#39;s binutils, but downgrading bi=
nutils in different 18.04 system to match the one where it is failing didn&=
#39;t reproduce it. Downgrading libgcc1 and some other packages to match di=
dn&#39;t reproduce it as well.</div><div><br></div><div>Next I&#39;ve tried=
 to inhibit strip completely (assuming it will be usable work around to kee=
p the binary in sysroot-destdir working with new uninative and narrow down =
what I need to debug), but surprisingly now both the binary in &quot;image&=
quot; and &quot;sysroot-destdir&quot; fail the same.</div><div><br></div><d=
iv>Strace doesn&#39;t show anything useful, other than segfault triggered v=
ery early:</div><div><br></div><div>$ strace tmp/work/x86_64-linux/e2fsprog=
s-native/1.46.5-r0/sysroot-destdir/home/worker/poky-kirkstone-jansa/build/t=
mp/work/x86_64-linux/e2fsprogs-native/1.46.5-r0/recipe-sysroot-native/sbin/=
mkfs.ext4.real<br>execve(&quot;tmp/work/x86_64-linux/e2fsprogs-native/1.46.=
5-r0/sysroot-destdir/home/worker/poky-kirkstone-jansa/build/tmp/work/x86_64=
-linux/e2fsprogs-native/1.46.5-r0/recipe-sysroot-native/sbin/mkfs.ext4.real=
&quot;, [&quot;tmp/work/x86_64-linux/e2fsprogs-&quot;...], 0x7fffbec05ac0 /=
* 55 vars */) =3D 0<br>brk(NULL) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x55b91b=
c0e000<br>arch_prctl(0x3001 /* ARCH_??? */, 0x7ffc146b5340) =3D -1 EINVAL (=
Invalid argument)<br>--- SIGSEGV {si_signo=3DSIGSEGV, si_code=3DSEGV_MAPERR=
, si_addr=3D0x55b91ba016e0} ---<br>+++ killed by SIGSEGV (core dumped) +++<=
br>Segmentation fault (core dumped)<br></div><div><br></div><div>$ strace t=
mp/work/x86_64-linux/e2fsprogs-native/1.46.5-r0/image/home/worker/poky-kirk=
stone-jansa/build/tmp/work/x86_64-linux/e2fsprogs-native/1.46.5-r0/recipe-s=
ysroot-native/sbin/mkfs.ext4.real 2&gt;&amp;1 | head<br>execve(&quot;tmp/wo=
rk/x86_64-linux/e2fsprogs-native/1.46.5-r0/image/home/worker/poky-kirkstone=
-jansa/build/tmp/work/x86_64-linux/e2fsprogs-native/1.46.5-r0/recipe-sysroo=
t-native/sbin/mkfs.ext4.real&quot;, [&quot;tmp/work/x86_64-linux/e2fsprogs-=
&quot;...], 0x7ffd387a7f60 /* 55 vars */) =3D 0<br>brk(NULL) =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D 0x5641b084f000<br>arch_prctl(0x3001 /* ARCH_??? */, 0=
x7ffe271263f0) =3D -1 EINVAL (Invalid argument)<br>--- SIGSEGV {si_signo=3D=
SIGSEGV, si_code=3DSEGV_MAPERR, si_addr=3D0x5641b00016e0} ---<br>+++ killed=
 by SIGSEGV (core dumped) +++<br></div><div><br></div><div>While &quot;good=
&quot; binary:</div><div>$ strace tmp/work/x86_64-linux/e2fsprogs-native/1.=
46.5-r0/image/home/worker/poky-kirkstone-jansa/build/tmp/work/x86_64-linux/=
e2fsprogs-native/1.46.5-r0/recipe-sysroot-native/sbin/mkfs.ext4.real | head=
<br>execve(&quot;tmp/work/x86_64-linux/e2fsprogs-native/1.46.5-r0/image/hom=
e/worker/poky-kirkstone-jansa/build/tmp/work/x86_64-linux/e2fsprogs-native/=
1.46.5-r0/recipe-sysroot-native/sbin/mkfs.ext4.real&quot;, [&quot;tmp/work/=
x86_64-linux/e2fsprogs-&quot;...], 0x7ffd9f569ae0 /* 55 vars */) =3D 0<br>b=
rk(NULL) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x5569fad4e000<br>arch_prctl(0x3=
001 /* ARCH_??? */, 0x7ffe1d8ce2f0) =3D -1 EINVAL (Invalid argument)<br>mma=
p(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =3D 0=
x7f210b337000<br>access(&quot;/etc/ld.so.preload&quot;, R_OK) =C2=A0 =C2=A0=
 =C2=A0=3D -1 ENOENT (No such file or directory)<br>openat(AT_FDCWD, &quot;=
/home/worker/poky-kirkstone-jansa/build/tmp/work/x86_64-linux/e2fsprogs-nat=
ive/1.46.5-r0/recipe-sysroot-native/usr/lib/glibc-hwcaps/x86-64-v4/libext2f=
s.so.2&quot;, O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (No such file or directory)=
<br>newfstatat(AT_FDCWD, &quot;/home/worker/poky-kirkstone-jansa/build/tmp/=
work/x86_64-linux/e2fsprogs-native/1.46.5-r0/recipe-sysroot-native/usr/lib/=
glibc-hwcaps/x86-64-v4&quot;, 0x7ffe1d8cd520, 0) =3D -1 ENOENT (No such fil=
e or directory)<br></div><div><br></div><div>The diffoscope output shows th=
at dynsym section is second to last in &quot;bad&quot; binary and first in =
&quot;good&quot; binary, which might relate to the warnings shown by gdb:</=
div><div><br></div><div>Reading symbols from ./recipe-sysroot-native/sbin/m=
kfs.ext4.real...<br><br>warning: Loadable section &quot;.dynsym&quot; outsi=
de of ELF segments<br><br>warning: Loadable section &quot;.interp&quot; out=
side of ELF segments<br>(No debugging symbols found in ./recipe-sysroot-nat=
ive/sbin/mkfs.ext4.real)<br>(gdb) r<br>Starting program: /data001/jansa/bui=
ld-webos/BUILD/work/qemux86_64-webos-linux/webos-image/1.0-r3normal1/recipe=
-sysroot-native/sbin/mkfs.ext4.real <br>warning: Error disabling address sp=
ace randomization: Operation not permitted<br>BFD: /data001/jansa/build-web=
os/BUILD/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2: unknown =
type [0x13] section `.relr.dyn&#39;<br>warning: `/data001/jansa/build-webos=
/BUILD/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2&#39;: Share=
d library architecture unknown is not compatible with target architecture i=
386:x86-64.<br>warning: `/data001/jansa/build-webos/BUILD/sysroots-uninativ=
e/x86_64-linux/lib/ld-linux-x86-64.so.2&#39;: Shared library architecture u=
nknown is not compatible with target architecture i386:x86-64.<br><br>Progr=
am received signal SIGSEGV, Segmentation fault.<br>0x00007f08c9d9232a in st=
rcmp () from /data001/jansa/build-webos/BUILD/sysroots-uninative/x86_64-lin=
ux/lib/ld-linux-x86-64.so.2<br></div><div><br></div><div>And ldd also says =
that the &quot;bad&quot; binary isn&#39;t dynamic executable while &quot;go=
od&quot; on is (objdump -x works for both of them):</div><div><br></div><di=
v>the &quot;bad&quot; one:</div><div>ldd tmp/work/x86_64-linux/e2fsprogs-na=
tive/1.46.5-r0/sysroot-destdir/home/worker/poky-kirkstone-jansa/build/tmp/w=
ork/x86_64-linux/e2fsprogs-native/1.46.5-r0/recipe-sysroot-native/sbin/mkfs=
.ext4.real<br>	not a dynamic executable<br></div><div><br></div><div>and th=
e &quot;good&quot; one:</div><div>ldd tmp/work/x86_64-linux/e2fsprogs-nativ=
e/1.46.5-r0/image/home/worker/poky-kirkstone-jansa/build/tmp/work/x86_64-li=
nux/e2fsprogs-native/1.46.5-r0/recipe-sysroot-native/sbin/mkfs.ext4.real <b=
r>	linux-vdso.so.1 (0x00007ffce83fc000)<br>	libext2fs.so.2 =3D&gt; /lib/x86=
_64-linux-gnu/libext2fs.so.2 (0x00007fd1ba5a0000)<br>	libcom_err.so.2 =3D&g=
t; /lib/x86_64-linux-gnu/libcom_err.so.2 (0x00007fd1ba39c000)<br>	libblkid.=
so.1 =3D&gt; /home/worker/poky-kirkstone-jansa/build/tmp/work/x86_64-linux/=
e2fsprogs-native/1.46.5-r0/recipe-sysroot-native/usr/lib/libblkid.so.1 (0x0=
0007fd1ba149000)<br>	libuuid.so.1 =3D&gt; /home/worker/poky-kirkstone-jansa=
/build/tmp/work/x86_64-linux/e2fsprogs-native/1.46.5-r0/recipe-sysroot-nati=
ve/usr/lib/libuuid.so.1 (0x00007fd1b9f42000)<br>	libe2p.so.2 =3D&gt; /lib/x=
86_64-linux-gnu/libe2p.so.2 (0x00007fd1b9d39000)<br>	libpthread.so.0 =3D&gt=
; /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007fd1b9b1a000)<br>	libc.so.6 =
=3D&gt; /lib/x86_64-linux-gnu/libc.so.6 (0x00007fd1b9729000)<br>	/home/work=
er/poky-kirkstone-jansa/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-li=
nux-x86-64.so.2 =3D&gt; /lib64/ld-linux-x86-64.so.2 (0x00007fd1baa0f000)<br=
></div><div><br></div><div>Once the &quot;bad&quot; binary is built (with e=
ither uninative 4.0 or 3.9) it will always fail with uninative 4.0 even whe=
n reused from sstate on different server (if it&#39;s the server producing =
&quot;good&quot; mkfs.ext4.real binaries, then just rebuilding e2fsprogs-na=
tive will fix it).</div><div><br></div><div>Does this make any sense to any=
one? I&#39;ll continue to look into it, but if you have any hints, please l=
et me know.</div><div><br></div><div>I know 18.04 is EOL and nobody should =
be using it, I&#39;m trying to get our build infra upgraded for very long t=
ime.</div><div><br></div><div>The diffoscope output (mkfs.4.0-18.04-sstate =
is the &quot;bad&quot; binary from sstate while=C2=A0mkfs.4.0-18.04-rebuilt=
 is the &quot;good&quot; one).</div><div><br></div><div>--- mkfs.4.0-18.04-=
rebuilt<br>+++ mkfs.4.0-18.04-sstate<br>=E2=94=82=E2=94=84 File has been mo=
dified after NT_GNU_BUILD_ID has been applied.<br>=E2=94=9C=E2=94=80=E2=94=
=80 readelf --wide --file-header {}<br>=E2=94=82 @@ -4,17 +4,17 @@<br>=E2=
=94=82 =C2=A0 =C2=A0Data: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02&#39;s complement, =
little endian<br>=E2=94=82 =C2=A0 =C2=A0Version: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 (curre=
nt)<br>=E2=94=82 =C2=A0 =C2=A0OS/ABI: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UNIX - System=
 V<br>=E2=94=82 =C2=A0 =C2=A0ABI Version: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>=E2=94=82 =C2=A0 =C2=A0T=
ype: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DYN (Position-Independent Executable file=
)<br>=E2=94=82 =C2=A0 =C2=A0Machine: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Advanced Micro Devices=
 X86-64<br>=E2=94=82 =C2=A0 =C2=A0Version: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x1<br>=E2=94=
=82 - =C2=A0Entry point address: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x8350<br>=E2=94=82 + =C2=A0Entry point address: =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x8380<br>=E2=94=82 =C2=A0 =C2=A0Start of p=
rogram headers: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A064 (bytes into file)<br>=
=E2=94=82 =C2=A0 =C2=A0Start of section headers: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0127520 (bytes into file)<br>=E2=94=82 =C2=A0 =C2=A0Flags: =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x0<br>=E2=94=82 =C2=A0 =C2=A0Size of this header: =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 64 (bytes)<br>=E2=94=82 =C2=A0 =
=C2=A0Size of program headers: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 56 (bytes=
)<br>=E2=94=82 =C2=A0 =C2=A0Number of program headers: =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 13<br>=E2=94=82 =C2=A0 =C2=A0Size of section headers: =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 64 (bytes)<br>=E2=94=82 =C2=A0 =C2=A0Number of sectio=
n headers: =C2=A0 =C2=A0 =C2=A0 =C2=A0 27<br>=E2=94=82 - =C2=A0Section head=
er string table index: 22<br>=E2=94=82 + =C2=A0Section header string table =
index: 21<br>=E2=94=9C=E2=94=80=E2=94=80 readelf --wide --program-header {}=
<br>=E2=94=82 @@ -1,37 +1,37 @@<br>=E2=94=82<br>=E2=94=82 =C2=A0Elf file ty=
pe is DYN (Position-Independent Executable file)<br>=E2=94=82 -Entry point =
0x8350<br>=E2=94=82 +Entry point 0x8380<br>=E2=94=82 =C2=A0There are 13 pro=
gram headers, starting at offset 64<br>=E2=94=82<br>=E2=94=82 =C2=A0Program=
 Headers:<br>=E2=94=82 =C2=A0 =C2=A0Type =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 Offset =C2=A0 VirtAddr =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PhysAddr =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 FileSiz =C2=A0MemSiz =C2=A0 Flg Align<br>=E2=94=
=82 =C2=A0 =C2=A0PHDR =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x000040 0x0000000=
000000040 0x0000000000000040 0x0002d8 0x0002d8 R =C2=A0 0x8<br>=E2=94=82 - =
=C2=A0LOAD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x000000 0x0000000000000000 0=
x0000000000000000 0x01dcb0 0x01dcb0 R E 0x200000<br>=E2=94=82 + =C2=A0LOAD =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x000000 0x0000000000000000 0x0000000000=
000000 0x01dcf0 0x01dcf0 R E 0x200000<br>=E2=94=82 =C2=A0 =C2=A0GNU_STACK =
=C2=A0 =C2=A0 =C2=A00x000000 0x0000000000000000 0x0000000000000000 0x000000=
 0x000000 RW =C2=A00x10<br>=E2=94=82 - =C2=A0GNU_EH_FRAME =C2=A0 0x01b794 0=
x000000000001b794 0x000000000001b794 0x0004fc 0x0004fc R =C2=A0 0x4<br>=E2=
=94=82 + =C2=A0GNU_EH_FRAME =C2=A0 0x01b7d4 0x000000000001b7d4 0x0000000000=
01b7d4 0x0004fc 0x0004fc R =C2=A0 0x4<br>=E2=94=82 =C2=A0 =C2=A0LOAD =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01e450 0x000000000021e450 0x000000000021e450=
 0x000cd8 0x0013d8 RW =C2=A00x200000<br>=E2=94=82 =C2=A0 =C2=A0GNU_RELRO =
=C2=A0 =C2=A0 =C2=A00x01e450 0x000000000021e450 0x000000000021e450 0x000bb0=
 0x000bb0 R =C2=A0 0x1<br>=E2=94=82 =C2=A0 =C2=A0DYNAMIC =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x01e678 0x000000000021e678 0x000000000021e678 0x000260 0x000260 =
RW =C2=A00x8<br>=E2=94=82 - =C2=A0LOAD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=
x020000 0x0000000000400000 0x0000000000400000 0x000178 0x000178 RW =C2=A00x=
200000<br>=E2=94=82 + =C2=A0LOAD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x02000=
0 0x0000000000400000 0x0000000000400000 0x0000a8 0x0000a8 RW =C2=A00x200000=
<br>=E2=94=82 =C2=A0 =C2=A0NOTE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x020060=
 0x0000000000400060 0x0000000000400060 0x000020 0x000020 R =C2=A0 0x4<br>=
=E2=94=82 =C2=A0 =C2=A0NOTE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x020080 0x0=
000000000400080 0x0000000000400080 0x000024 0x000024 R =C2=A0 0x4<br>=E2=94=
=82 - =C2=A0LOAD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x021000 0x000000000060=
0000 0x0000000000600000 0x001060 0x001060 RW =C2=A00x200000<br>=E2=94=82 - =
=C2=A0INTERP =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x023000 0x0000000000a00000 0x0000=
000000a00000 0x00005a 0x00005a R =C2=A0 0x1<br>=E2=94=82 + =C2=A0LOAD =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x021000 0x0000000000600000 0x0000000000600=
000 0x000130 0x000130 RW =C2=A00x200000<br>=E2=94=82 + =C2=A0LOAD =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x022000 0x0000000000800000 0x0000000000800000 =
0x002740 0x002740 RW =C2=A00x200000<br>=E2=94=82 + =C2=A0INTERP =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x0246e0 0x0000000000a016e0 0x0000000000a016e0 0x00005a 0=
x00005a R =C2=A0 0x1<br>=E2=94=82 =C2=A0 =C2=A0 =C2=A0 =C2=A0[Requesting pr=
ogram interpreter: /data001/jansa/build-webos/BUILD/sysroots-uninative/x86_=
64-linux/lib/ld-linux-x86-64.so.2]<br>=E2=94=82 - =C2=A0LOAD =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0x023000 0x0000000000a00000 0x0000000000a00000 0x00006=
0 0x000060 RW =C2=A00x200000<br>=E2=94=82<br>=E2=94=82 =C2=A0 Section to Se=
gment mapping:<br>=E2=94=82 =C2=A0 =C2=A0Segment Sections...<br>=E2=94=82 =
=C2=A0 =C2=A0 00<br>=E2=94=82 - =C2=A0 01 =C2=A0 =C2=A0 .dynsym .dynstr .gn=
u.version .gnu.version_r .rela.dyn .rela.plt .init .plt .plt.got .text .fin=
i .rodata .eh_frame_hdr .eh_frame<br>=E2=94=82 + =C2=A0 01 =C2=A0 =C2=A0 .d=
ynstr .gnu.version .gnu.version_r .rela.dyn .rela.plt .init .plt .plt.got .=
text .fini .rodata .eh_frame_hdr .eh_frame<br>=E2=94=82 =C2=A0 =C2=A0 02<br=
>=E2=94=82 =C2=A0 =C2=A0 03 =C2=A0 =C2=A0 .eh_frame_hdr<br>=E2=94=82 =C2=A0=
 =C2=A0 04 =C2=A0 =C2=A0 .init_array .fini_array .<a href=3D"http://data.re=
l.ro" target=3D"_blank">data.rel.ro</a> .dynamic .got .data .bss<br>=E2=94=
=82 =C2=A0 =C2=A0 05 =C2=A0 =C2=A0 .init_array .fini_array .<a href=3D"http=
://data.rel.ro" target=3D"_blank">data.rel.ro</a> .dynamic .got<br>=E2=94=
=82 =C2=A0 =C2=A0 06 =C2=A0 =C2=A0 .dynamic<br>=E2=94=82 - =C2=A0 07 =C2=A0=
 =C2=A0 .note.ABI-tag .note.gnu.build-id .gnu.hash<br>=E2=94=82 + =C2=A0 07=
 =C2=A0 =C2=A0 .note.ABI-tag .note.gnu.build-id<br>=E2=94=82 =C2=A0 =C2=A0 =
08 =C2=A0 =C2=A0 .note.ABI-tag<br>=E2=94=82 =C2=A0 =C2=A0 09 =C2=A0 =C2=A0 =
.note.gnu.build-id<br>=E2=94=82 - =C2=A0 10<br>=E2=94=82 - =C2=A0 11 =C2=A0=
 =C2=A0 .interp<br>=E2=94=82 + =C2=A0 10 =C2=A0 =C2=A0 .gnu.hash<br>=E2=94=
=82 + =C2=A0 11<br>=E2=94=82 =C2=A0 =C2=A0 12 =C2=A0 =C2=A0 .interp<br>=E2=
=94=9C=E2=94=80=E2=94=80 readelf --wide --sections {}<br>=E2=94=82 @@ -1,36=
 +1,36 @@<br>=E2=94=82 =C2=A0There are 27 section headers, starting at offs=
et 0x1f220:<br>=E2=94=82<br>=E2=94=82 =C2=A0Section Headers:<br>=E2=94=82 =
=C2=A0 =C2=A0[Nr] Name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Type=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Address =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Off =C2=A0 =C2=A0Size =C2=A0 ES Flg Lk Inf Al<br>=E2=94=82 =C2=A0=
 =C2=A0[ 0] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
NULL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000000000000000 000000 00000=
0 00 =C2=A0 =C2=A0 =C2=A00 =C2=A0 0 =C2=A00<br>=E2=94=82 - =C2=A0[ 1] .dyns=
ym =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DYNSYM =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A000000000000003a8 0003a8 0016e0 18 =C2=A0 A =C2=A02 =C2=A0 1 =C2=A08<b=
r>=E2=94=82 - =C2=A0[ 2] .dynstr =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 STRTAB =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000000000001a88 001a88 001182 00 =C2=A0 =
A =C2=A00 =C2=A0 0 =C2=A01<br>=E2=94=82 - =C2=A0[ 3] .gnu.version =C2=A0 =
=C2=A0 =C2=A0VERSYM =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000000000002c0a 002c=
0a 0001e8 02 =C2=A0 A =C2=A01 =C2=A0 0 =C2=A02<br>=E2=94=82 - =C2=A0[ 4] .g=
nu.version_r =C2=A0 =C2=A0VERNEED =C2=A0 =C2=A0 =C2=A0 =C2=A0 0000000000002=
df8 002df8 000100 00 =C2=A0 A =C2=A02 =C2=A0 4 =C2=A08<br>=E2=94=82 - =C2=
=A0[ 5] .rela.dyn =C2=A0 =C2=A0 =C2=A0 =C2=A0 RELA =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00000000000002ef8 002ef8 0008a0 18 =C2=A0 A =C2=A01 =C2=A0 =
0 =C2=A08<br>=E2=94=82 - =C2=A0[ 6] .rela.plt =C2=A0 =C2=A0 =C2=A0 =C2=A0 R=
ELA =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000000000003798 003798 001488=
 18 =C2=A0AI =C2=A01 =C2=A019 =C2=A08<br>=E2=94=82 - =C2=A0[ 7] .init =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PROGBITS =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0000000000004c20 004c20 000017 00 =C2=A0AX =C2=A00 =C2=A0 0 =C2=A04<br>=E2=
=94=82 - =C2=A0[ 8] .plt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PR=
OGBITS =C2=A0 =C2=A0 =C2=A0 =C2=A00000000000004c40 004c40 000dc0 10 =C2=A0A=
X =C2=A00 =C2=A0 0 16<br>=E2=94=82 - =C2=A0[ 9] .plt.got =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0PROGBITS =C2=A0 =C2=A0 =C2=A0 =C2=A00000000000005a00 005a0=
0 000008 08 =C2=A0AX =C2=A00 =C2=A0 0 =C2=A08<br>=E2=94=82 - =C2=A0[10] .te=
xt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PROGBITS =C2=A0 =C2=A0 =C2=A0 =
=C2=A00000000000005a10 005a10 010cd2 00 =C2=A0AX =C2=A00 =C2=A0 0 16<br>=E2=
=94=82 - =C2=A0[11] .fini =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PROGBIT=
S =C2=A0 =C2=A0 =C2=A0 =C2=A000000000000166e4 0166e4 000009 00 =C2=A0AX =C2=
=A00 =C2=A0 0 =C2=A04<br>=E2=94=82 - =C2=A0[12] .rodata =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 PROGBITS =C2=A0 =C2=A0 =C2=A0 =C2=A000000000000166f0 0166=
f0 0050a2 00 =C2=A0 A =C2=A00 =C2=A0 0 16<br>=E2=94=82 - =C2=A0[13] .eh_fra=
me_hdr =C2=A0 =C2=A0 PROGBITS =C2=A0 =C2=A0 =C2=A0 =C2=A0000000000001b794 0=
1b794 0004fc 00 =C2=A0 A =C2=A00 =C2=A0 0 =C2=A04<br>=E2=94=82 - =C2=A0[14]=
 .eh_frame =C2=A0 =C2=A0 =C2=A0 =C2=A0 PROGBITS =C2=A0 =C2=A0 =C2=A0 =C2=A0=
000000000001bc90 01bc90 002020 00 =C2=A0 A =C2=A00 =C2=A0 0 =C2=A08<br>=E2=
=94=82 - =C2=A0[15] .init_array =C2=A0 =C2=A0 =C2=A0 INIT_ARRAY =C2=A0 =C2=
=A0 =C2=A0000000000021e450 01e450 000008 08 =C2=A0WA =C2=A00 =C2=A0 0 =C2=
=A08<br>=E2=94=82 - =C2=A0[16] .fini_array =C2=A0 =C2=A0 =C2=A0 FINI_ARRAY =
=C2=A0 =C2=A0 =C2=A0000000000021e458 01e458 000008 08 =C2=A0WA =C2=A00 =C2=
=A0 0 =C2=A08<br>=E2=94=82 - =C2=A0[17] .<a href=3D"http://data.rel.ro" tar=
get=3D"_blank">data.rel.ro</a> =C2=A0 =C2=A0 =C2=A0PROGBITS =C2=A0 =C2=A0 =
=C2=A0 =C2=A0000000000021e460 01e460 000218 00 =C2=A0WA =C2=A00 =C2=A0 0 32=
<br>=E2=94=82 - =C2=A0[18] .dynamic =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DYNAM=
IC =C2=A0 =C2=A0 =C2=A0 =C2=A0 000000000021e678 01e678 000260 10 =C2=A0WA =
=C2=A02 =C2=A0 0 =C2=A08<br>=E2=94=82 - =C2=A0[19] .got =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PROGBITS =C2=A0 =C2=A0 =C2=A0 =C2=A000000000=
0021e8d8 01e8d8 000720 08 =C2=A0WA =C2=A00 =C2=A0 0 =C2=A08<br>=E2=94=82 - =
=C2=A0[20] .data =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PROGBITS =C2=A0 =
=C2=A0 =C2=A0 =C2=A0000000000021f000 01f000 000128 00 =C2=A0WA =C2=A00 =C2=
=A0 0 32<br>=E2=94=82 - =C2=A0[21] .bss =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0NOBITS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0000000000021f140 01f1=
28 0006e8 00 =C2=A0WA =C2=A00 =C2=A0 0 32<br>=E2=94=82 - =C2=A0[22] .shstrt=
ab =C2=A0 =C2=A0 =C2=A0 =C2=A0 STRTAB =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0000=
0000000000000 01f128 0000f2 00 =C2=A0 =C2=A0 =C2=A00 =C2=A0 0 =C2=A01<br>=
=E2=94=82 - =C2=A0[23] .note.ABI-tag =C2=A0 =C2=A0 NOTE =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00000000000400060 020060 000020 00 =C2=A0 A =C2=A00 =
=C2=A0 0 =C2=A04<br>=E2=94=82 - =C2=A0[24] .note.gnu.build-id NOTE =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000000000400080 020080 000024 00 =C2=A0 =
A =C2=A00 =C2=A0 0 =C2=A04<br>=E2=94=82 - =C2=A0[25] .gnu.hash =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 GNU_HASH =C2=A0 =C2=A0 =C2=A0 =C2=A000000000004000a8 0200=
a8 0000cc 00 =C2=A0 A =C2=A01 =C2=A0 0 =C2=A08<br>=E2=94=82 - =C2=A0[26] .i=
nterp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PROGBITS =C2=A0 =C2=A0 =C2=A0 =C2=
=A00000000000a00000 023000 00005a 00 =C2=A0 A =C2=A00 =C2=A0 0 =C2=A08<br>=
=E2=94=82 + =C2=A0[ 1] .dynstr =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 STRTAB =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000000000001aa0 001aa0 0011a8 00 =C2=A0 =
A =C2=A00 =C2=A0 0 =C2=A01<br>=E2=94=82 + =C2=A0[ 2] .gnu.version =C2=A0 =
=C2=A0 =C2=A0VERSYM =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000000000002c48 002c=
48 0001e8 02 =C2=A0 A 25 =C2=A0 0 =C2=A02<br>=E2=94=82 + =C2=A0[ 3] .gnu.ve=
rsion_r =C2=A0 =C2=A0VERNEED =C2=A0 =C2=A0 =C2=A0 =C2=A0 0000000000002e30 0=
02e30 000100 00 =C2=A0 A =C2=A01 =C2=A0 4 =C2=A08<br>=E2=94=82 + =C2=A0[ 4]=
 .rela.dyn =C2=A0 =C2=A0 =C2=A0 =C2=A0 RELA =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00000000000002f30 002f30 0008a0 18 =C2=A0 A 25 =C2=A0 0 =C2=A08<br=
>=E2=94=82 + =C2=A0[ 5] .rela.plt =C2=A0 =C2=A0 =C2=A0 =C2=A0 RELA =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A000000000000037d0 0037d0 001488 18 =C2=A0A=
I 25 =C2=A018 =C2=A08<br>=E2=94=82 + =C2=A0[ 6] .init =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 PROGBITS =C2=A0 =C2=A0 =C2=A0 =C2=A00000000000004c58 0=
04c58 000017 00 =C2=A0AX =C2=A00 =C2=A0 0 =C2=A04<br>=E2=94=82 + =C2=A0[ 7]=
 .plt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PROGBITS =C2=A0 =C2=
=A0 =C2=A0 =C2=A00000000000004c70 004c70 000dc0 10 =C2=A0AX =C2=A00 =C2=A0 =
0 16<br>=E2=94=82 + =C2=A0[ 8] .plt.got =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0P=
ROGBITS =C2=A0 =C2=A0 =C2=A0 =C2=A00000000000005a30 005a30 000008 08 =C2=A0=
AX =C2=A00 =C2=A0 0 =C2=A08<br>=E2=94=82 + =C2=A0[ 9] .text =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PROGBITS =C2=A0 =C2=A0 =C2=A0 =C2=A000000000000=
05a40 005a40 010cd2 00 =C2=A0AX =C2=A00 =C2=A0 0 16<br>=E2=94=82 + =C2=A0[1=
0] .fini =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PROGBITS =C2=A0 =C2=A0 =
=C2=A0 =C2=A00000000000016714 016714 000009 00 =C2=A0AX =C2=A00 =C2=A0 0 =
=C2=A04<br>=E2=94=82 + =C2=A0[11] .rodata =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PROGBITS =C2=A0 =C2=A0 =C2=A0 =C2=A00000000000016720 016720 0050b2 00 =
=C2=A0 A =C2=A00 =C2=A0 0 16<br>=E2=94=82 + =C2=A0[12] .eh_frame_hdr =C2=A0=
 =C2=A0 PROGBITS =C2=A0 =C2=A0 =C2=A0 =C2=A0000000000001b7d4 01b7d4 0004fc =
00 =C2=A0 A =C2=A00 =C2=A0 0 =C2=A04<br>=E2=94=82 + =C2=A0[13] .eh_frame =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PROGBITS =C2=A0 =C2=A0 =C2=A0 =C2=A000000000000=
1bcd0 01bcd0 002020 00 =C2=A0 A =C2=A00 =C2=A0 0 =C2=A08<br>=E2=94=82 + =C2=
=A0[14] .init_array =C2=A0 =C2=A0 =C2=A0 INIT_ARRAY =C2=A0 =C2=A0 =C2=A0000=
000000021e450 01e450 000008 08 =C2=A0WA =C2=A00 =C2=A0 0 =C2=A08<br>=E2=94=
=82 + =C2=A0[15] .fini_array =C2=A0 =C2=A0 =C2=A0 FINI_ARRAY =C2=A0 =C2=A0 =
=C2=A0000000000021e458 01e458 000008 08 =C2=A0WA =C2=A00 =C2=A0 0 =C2=A08<b=
r>=E2=94=82 + =C2=A0[16] .<a href=3D"http://data.rel.ro" target=3D"_blank">=
data.rel.ro</a> =C2=A0 =C2=A0 =C2=A0PROGBITS =C2=A0 =C2=A0 =C2=A0 =C2=A0000=
000000021e460 01e460 000218 00 =C2=A0WA =C2=A00 =C2=A0 0 32<br>=E2=94=82 + =
=C2=A0[17] .dynamic =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DYNAMIC =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 000000000021e678 01e678 000260 10 =C2=A0WA =C2=A01 =C2=A0 0 =
=C2=A08<br>=E2=94=82 + =C2=A0[18] .got =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0PROGBITS =C2=A0 =C2=A0 =C2=A0 =C2=A0000000000021e8d8 01e8d8 00=
0720 08 =C2=A0WA =C2=A00 =C2=A0 0 =C2=A08<br>=E2=94=82 + =C2=A0[19] .data =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PROGBITS =C2=A0 =C2=A0 =C2=A0 =C2=
=A0000000000021f000 01f000 000128 00 =C2=A0WA =C2=A00 =C2=A0 0 32<br>=E2=94=
=82 + =C2=A0[20] .bss =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NOBIT=
S =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0000000000021f140 01f128 0006e8 00 =C2=
=A0WA =C2=A00 =C2=A0 0 32<br>=E2=94=82 + =C2=A0[21] .shstrtab =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 STRTAB =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000000000000000 01=
f128 0000f2 00 =C2=A0 =C2=A0 =C2=A00 =C2=A0 0 =C2=A01<br>=E2=94=82 + =C2=A0=
[22] .note.ABI-tag =C2=A0 =C2=A0 NOTE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00000000000400060 020060 000020 00 =C2=A0 A =C2=A00 =C2=A0 0 =C2=A04<b=
r>=E2=94=82 + =C2=A0[23] .note.gnu.build-id NOTE =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00000000000400080 020080 000024 00 =C2=A0 A =C2=A00 =C2=A0 =
0 =C2=A04<br>=E2=94=82 + =C2=A0[24] .gnu.hash =C2=A0 =C2=A0 =C2=A0 =C2=A0 G=
NU_HASH =C2=A0 =C2=A0 =C2=A0 =C2=A00000000000600000 021000 0000cc 00 =C2=A0=
 A 25 =C2=A0 0 =C2=A08<br>=E2=94=82 + =C2=A0[25] .dynsym =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 DYNSYM =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000000000a00000=
 023000 0016e0 18 =C2=A0 A =C2=A01 =C2=A0 1 =C2=A08<br>=E2=94=82 + =C2=A0[2=
6] .interp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PROGBITS =C2=A0 =C2=A0 =C2=A0=
 =C2=A00000000000a016e0 0246e0 00005a 00 =C2=A0 A =C2=A00 =C2=A0 0 =C2=A08<=
br>=E2=94=82 =C2=A0Key to Flags:<br>=E2=94=82 =C2=A0 =C2=A0W (write), A (al=
loc), X (execute), M (merge), S (strings), I (info),<br>=E2=94=82 =C2=A0 =
=C2=A0L (link order), O (extra OS processing required), G (group), T (TLS),=
<br>=E2=94=82 =C2=A0 =C2=A0C (compressed), x (unknown), o (OS specific), E =
(exclude),<br>=E2=94=82 =C2=A0 =C2=A0D (mbind), l (large), p (processor spe=
cific)<br>=E2=94=9C=E2=94=80=E2=94=80 readelf --wide --symbols {}<br>=E2=94=
=82 @@ -223,25 +223,25 @@<br>=E2=94=82 =C2=A0 =C2=A0 219: 0000000000000000 =
=C2=A0 =C2=A0 0 FUNC =C2=A0 =C2=A0GLOBAL DEFAULT =C2=A0UND ext2fs_get_devic=
e_size2<br>=E2=94=82 =C2=A0 =C2=A0 220: 0000000000000000 =C2=A0 =C2=A0 0 FU=
NC =C2=A0 =C2=A0GLOBAL DEFAULT =C2=A0UND ext2fs_free_blocks_count<br>=E2=94=
=82 =C2=A0 =C2=A0 221: 0000000000000000 =C2=A0 =C2=A0 0 FUNC =C2=A0 =C2=A0G=
LOBAL DEFAULT =C2=A0UND ext2fs_inode_table_loc<br>=E2=94=82 =C2=A0 =C2=A0 2=
22: 0000000000000000 =C2=A0 =C2=A0 0 FUNC =C2=A0 =C2=A0GLOBAL DEFAULT =C2=
=A0UND ext2fs_badblocks_list_iterate<br>=E2=94=82 =C2=A0 =C2=A0 223: 000000=
0000000000 =C2=A0 =C2=A0 0 FUNC =C2=A0 =C2=A0GLOBAL DEFAULT =C2=A0UND __cty=
pe_b_loc@GLIBC_2.3 (8)<br>=E2=94=82 =C2=A0 =C2=A0 224: 0000000000000000 =C2=
=A0 =C2=A0 0 FUNC =C2=A0 =C2=A0GLOBAL DEFAULT =C2=A0UND ext2fs_open_file<br=
>=E2=94=82 =C2=A0 =C2=A0 225: 0000000000000000 =C2=A0 =C2=A0 0 FUNC =C2=A0 =
=C2=A0GLOBAL DEFAULT =C2=A0UND __sprintf_chk@GLIBC_2.3.4 (4)<br>=E2=94=82 -=
 =C2=A0 226: 000000000021f128 =C2=A0 =C2=A0 0 NOTYPE =C2=A0GLOBAL DEFAULT =
=C2=A0 20 _edata<br>=E2=94=82 - =C2=A0 227: 000000000021f1b0 =C2=A0 =C2=A0 =
8 OBJECT =C2=A0GLOBAL DEFAULT =C2=A0 21 _et_list<br>=E2=94=82 - =C2=A0 228:=
 000000000021f140 =C2=A0 =C2=A0 8 OBJECT =C2=A0GLOBAL DEFAULT =C2=A0 21 std=
out@GLIBC_2.2.5 (3)<br>=E2=94=82 - =C2=A0 229: 00000000000166e4 =C2=A0 =C2=
=A0 0 FUNC =C2=A0 =C2=A0GLOBAL DEFAULT =C2=A0 11 _fini<br>=E2=94=82 - =C2=
=A0 230: 000000000021e660 =C2=A0 =C2=A024 OBJECT =C2=A0GLOBAL DEFAULT =C2=
=A0 17 et_ext2_error_table<br>=E2=94=82 - =C2=A0 231: 000000000021f168 =C2=
=A0 =C2=A0 8 OBJECT =C2=A0GLOBAL DEFAULT =C2=A0 21 optarg@GLIBC_2.2.5 (3)<b=
r>=E2=94=82 - =C2=A0 232: 0000000000004c20 =C2=A0 =C2=A0 0 FUNC =C2=A0 =C2=
=A0GLOBAL DEFAULT =C2=A0 =C2=A07 _init<br>=E2=94=82 - =C2=A0 233: 000000000=
021f158 =C2=A0 =C2=A0 4 OBJECT =C2=A0GLOBAL DEFAULT =C2=A0 21 optind@GLIBC_=
2.2.5 (3)<br>=E2=94=82 - =C2=A0 234: 000000000021f190 =C2=A0 =C2=A0 8 OBJEC=
T =C2=A0GLOBAL DEFAULT =C2=A0 21 unix_io_manager<br>=E2=94=82 - =C2=A0 235:=
 000000000021f1a8 =C2=A0 =C2=A0 8 OBJECT =C2=A0GLOBAL DEFAULT =C2=A0 21 tes=
t_io_backing_manager<br>=E2=94=82 - =C2=A0 236: 000000000021f128 =C2=A0 =C2=
=A0 0 NOTYPE =C2=A0GLOBAL DEFAULT =C2=A0 21 __bss_start<br>=E2=94=82 - =C2=
=A0 237: 000000000021f150 =C2=A0 =C2=A0 8 OBJECT =C2=A0GLOBAL DEFAULT =C2=
=A0 21 stdin@GLIBC_2.2.5 (3)<br>=E2=94=82 - =C2=A0 238: 000000000021f1c0 =
=C2=A0 =C2=A0 8 OBJECT =C2=A0GLOBAL DEFAULT =C2=A0 21 stderr@GLIBC_2.2.5 (3=
)<br>=E2=94=82 - =C2=A0 239: 000000000021f170 =C2=A0 =C2=A024 OBJECT =C2=A0=
GLOBAL DEFAULT =C2=A0 21 ext2fs_numeric_progress_ops<br>=E2=94=82 - =C2=A0 =
240: 000000000021f828 =C2=A0 =C2=A0 0 NOTYPE =C2=A0GLOBAL DEFAULT =C2=A0 21=
 _end<br>=E2=94=82 - =C2=A0 241: 000000000021f1a0 =C2=A0 =C2=A0 8 OBJECT =
=C2=A0GLOBAL DEFAULT =C2=A0 21 undo_io_manager<br>=E2=94=82 - =C2=A0 242: 0=
00000000021f160 =C2=A0 =C2=A0 8 OBJECT =C2=A0GLOBAL DEFAULT =C2=A0 21 test_=
io_manager<br>=E2=94=82 - =C2=A0 243: 000000000021f1b8 =C2=A0 =C2=A0 8 OBJE=
CT =C2=A0GLOBAL DEFAULT =C2=A0 21 sparse_io_manager<br>=E2=94=82 + =C2=A0 2=
26: 000000000021f128 =C2=A0 =C2=A0 0 NOTYPE =C2=A0GLOBAL DEFAULT =C2=A0 19 =
_edata<br>=E2=94=82 + =C2=A0 227: 000000000021f1b0 =C2=A0 =C2=A0 8 OBJECT =
=C2=A0GLOBAL DEFAULT =C2=A0 20 _et_list<br>=E2=94=82 + =C2=A0 228: 00000000=
0021f140 =C2=A0 =C2=A0 8 OBJECT =C2=A0GLOBAL DEFAULT =C2=A0 20 stdout@GLIBC=
_2.2.5 (3)<br>=E2=94=82 + =C2=A0 229: 0000000000016714 =C2=A0 =C2=A0 0 FUNC=
 =C2=A0 =C2=A0GLOBAL DEFAULT =C2=A0 10 _fini<br>=E2=94=82 + =C2=A0 230: 000=
000000021e660 =C2=A0 =C2=A024 OBJECT =C2=A0GLOBAL DEFAULT =C2=A0 16 et_ext2=
_error_table<br>=E2=94=82 + =C2=A0 231: 000000000021f168 =C2=A0 =C2=A0 8 OB=
JECT =C2=A0GLOBAL DEFAULT =C2=A0 20 optarg@GLIBC_2.2.5 (3)<br>=E2=94=82 + =
=C2=A0 232: 0000000000004c58 =C2=A0 =C2=A0 0 FUNC =C2=A0 =C2=A0GLOBAL DEFAU=
LT =C2=A0 =C2=A06 _init<br>=E2=94=82 + =C2=A0 233: 000000000021f158 =C2=A0 =
=C2=A0 4 OBJECT =C2=A0GLOBAL DEFAULT =C2=A0 20 optind@GLIBC_2.2.5 (3)<br>=
=E2=94=82 + =C2=A0 234: 000000000021f190 =C2=A0 =C2=A0 8 OBJECT =C2=A0GLOBA=
L DEFAULT =C2=A0 20 unix_io_manager<br>=E2=94=82 + =C2=A0 235: 000000000021=
f1a8 =C2=A0 =C2=A0 8 OBJECT =C2=A0GLOBAL DEFAULT =C2=A0 20 test_io_backing_=
manager<br>=E2=94=82 + =C2=A0 236: 000000000021f128 =C2=A0 =C2=A0 0 NOTYPE =
=C2=A0GLOBAL DEFAULT =C2=A0 20 __bss_start<br>=E2=94=82 + =C2=A0 237: 00000=
0000021f150 =C2=A0 =C2=A0 8 OBJECT =C2=A0GLOBAL DEFAULT =C2=A0 20 stdin@GLI=
BC_2.2.5 (3)<br>=E2=94=82 + =C2=A0 238: 000000000021f1c0 =C2=A0 =C2=A0 8 OB=
JECT =C2=A0GLOBAL DEFAULT =C2=A0 20 stderr@GLIBC_2.2.5 (3)<br>=E2=94=82 + =
=C2=A0 239: 000000000021f170 =C2=A0 =C2=A024 OBJECT =C2=A0GLOBAL DEFAULT =
=C2=A0 20 ext2fs_numeric_progress_ops<br>=E2=94=82 + =C2=A0 240: 0000000000=
21f828 =C2=A0 =C2=A0 0 NOTYPE =C2=A0GLOBAL DEFAULT =C2=A0 20 _end<br>=E2=94=
=82 + =C2=A0 241: 000000000021f1a0 =C2=A0 =C2=A0 8 OBJECT =C2=A0GLOBAL DEFA=
ULT =C2=A0 20 undo_io_manager<br>=E2=94=82 + =C2=A0 242: 000000000021f160 =
=C2=A0 =C2=A0 8 OBJECT =C2=A0GLOBAL DEFAULT =C2=A0 20 test_io_manager<br>=
=E2=94=82 + =C2=A0 243: 000000000021f1b8 =C2=A0 =C2=A0 8 OBJECT =C2=A0GLOBA=
L DEFAULT =C2=A0 20 sparse_io_manager<br>=E2=94=9C=E2=94=80=E2=94=80 readel=
f --wide --relocs {}<br>=E2=94=82 @@ -1,83 +1,83 @@<br>=E2=94=82<br>=E2=94=
=82 -Relocation section &#39;.rela.dyn&#39; at offset 0x2ef8 contains 92 en=
tries:<br>=E2=94=82 +Relocation section &#39;.rela.dyn&#39; at offset 0x2f3=
0 contains 92 entries:<br>=E2=94=82 =C2=A0 =C2=A0 =C2=A0Offset =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Info =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Type =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Symbol&#39;s Valu=
e =C2=A0Symbol&#39;s Name + Addend<br>=E2=94=82 -000000000021e450 =C2=A0000=
0000000000008 R_X86_64_RELATIVE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8430<br>=E2=94=82 -000000000021e4=
58 =C2=A00000000000000008 R_X86_64_RELATIVE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 83f0<br>=E2=94=82 -000=
000000021e460 =C2=A00000000000000008 R_X86_64_RELATIVE =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1aaad<br>=
=E2=94=82 -000000000021e468 =C2=A00000000000000008 R_X86_64_RELATIVE =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 1a9c1<br>=E2=94=82 -000000000021e470 =C2=A00000000000000008 R_X86_64_RE=
LATIVE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 1a9c4<br>=E2=94=82 -000000000021e478 =C2=A000000000000000=
08 R_X86_64_RELATIVE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1a9ca<br>=E2=94=82 -000000000021e480 =C2=A0=
0000000000000008 R_X86_64_RELATIVE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1aa17<br>=E2=94=82 -000000000=
021e488 =C2=A00000000000000008 R_X86_64_RELATIVE =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1a9ce<br>=E2=94=
=82 -000000000021e4a0 =C2=A00000000000000008 R_X86_64_RELATIVE =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1=
90bd<br>=E2=94=82 -000000000021e4a8 =C2=A00000000000000008 R_X86_64_RELATIV=
E =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 1a9d2<br>=E2=94=82 -000000000021e4b0 =C2=A00000000000000008 R_X8=
6_64_RELATIVE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 1a9d6<br>=E2=94=82 -000000000021e4b8 =C2=A00000000=
000000008 R_X86_64_RELATIVE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1aa87<br>=E2=94=82 -000000000021e4c0=
 =C2=A00000000000000008 R_X86_64_RELATIVE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 18ebd<br>=E2=94=82 -00=
0000000021e4c8 =C2=A00000000000000008 R_X86_64_RELATIVE =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1904e<br=
>=E2=94=82 +000000000021e450 =C2=A00000000000000008 R_X86_64_RELATIVE =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 8460<br>=E2=94=82 +000000000021e458 =C2=A00000000000000008 R_X86_64_=
RELATIVE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 8420<br>=E2=94=82 +000000000021e460 =C2=A0000000000000000=
8 R_X86_64_RELATIVE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1aaed<br>=E2=94=82 +000000000021e468 =C2=A0000=
0000000000008 R_X86_64_RELATIVE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1aa01<br>=E2=94=82 +000000000021e=
470 =C2=A00000000000000008 R_X86_64_RELATIVE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1aa04<br>=E2=94=82 =
+000000000021e478 =C2=A00000000000000008 R_X86_64_RELATIVE =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1aa0a=
<br>=E2=94=82 +000000000021e480 =C2=A00000000000000008 R_X86_64_RELATIVE =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 1aa57<br>=E2=94=82 +000000000021e488 =C2=A00000000000000008 R_X8=
6_64_RELATIVE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 1aa0e<br>=E2=94=82 +000000000021e4a0 =C2=A00000000=
000000008 R_X86_64_RELATIVE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 19100<br>=E2=94=82 +000000000021e4a8=
 =C2=A00000000000000008 R_X86_64_RELATIVE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1aa12<br>=E2=94=82 +00=
0000000021e4b0 =C2=A00000000000000008 R_X86_64_RELATIVE =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1aa16<br=
>=E2=94=82 +000000000021e4b8 =C2=A00000000000000008 R_X86_64_RELATIVE =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 1aac7<br>=E2=94=82 +000000000021e4c0 =C2=A00000000000000008 R_X86_64=
_RELATIVE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 18f00<br>=E2=94=82 +000000000021e4c8 =C2=A000000000000=
00008 R_X86_64_RELATIVE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 19091<br>...<br></div></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#182862): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/182862" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/182862</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99550848/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99550848/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c97d6005fe2c9261--

