Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEA8C3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 00:45:36 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.2384.1672965927740006337
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 16:45:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cEae1YTl;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-14fb3809eaeso312390fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 16:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2XemLY1KnTHRaEaNyZaWM7TDTvoay0kIXHeRj1FH/o=;
        b=cEae1YTlY9ZJYDsbpK46EKnKCt2gW1tUJrVlPkfUtORc5zXfkzJ0jcyIEQ4HhHlIvX
         te3/2V2jFG8golyyE+gCdVecbjTYuWCFXb7V5Ed00pt3dpQwQ9WWX39fCRMeCkBvuJ1Y
         qXP9qAf5TVOgUg50C9nxBRw3bcN4Iv5CxaFPG79eKauQXVl8WjGQAY2h9w7w8zknsnGf
         ZdHxe/dvE1HCR2rgqNzXk0nRyCp0NBzLJX8NT/qXZ64YLjuHD0lQUTTaYB4q+4Qqk6Sv
         HA72CA97Dhe8NhlPYrSaRNNdMhWiTjfLCEjKFOvvb8rVp6YYQSC72hhTw5LS/KOPqJmU
         B5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y2XemLY1KnTHRaEaNyZaWM7TDTvoay0kIXHeRj1FH/o=;
        b=kPdbom/b2miwGKsA0YCtGTdOPWEOokmFm5JtrEcLEnLx2J7xIB86uOlt/bBY5Ye7pf
         qFMwxJ0HiQTgcUuPGw151+2g5zBtpzRzfxdA0KzMoOH8NW5eOyV8Wb8KoSHjbtWwbMzt
         wfvL0cDCyiBoFuJfqr9naIt2ab9POjr/XJwSaPYdLTSPwEupQgEEfPxR73H0mnpBwBjm
         zOEblrxFLDKv1XB/TYK5mAYyCdFL4NCKvqE8d/upVQSyGrgUOngnvjdWTdw0G3CeCeTz
         fe6TA9CLu1MCxaCi47s8+J43d4O4KOf0jhV52urE4fHDwhmArhk8ditaXKi2Ju3WK1Ty
         AH5w==
X-Gm-Message-State: AFqh2kp2ZVOwV+WsU99PB4mnUu5AlrgQ24hFsAkFq0pj64IZ/eY/YPG6
	mp4b4JwlQZZy7cg2reHm9aHT2Fg3Pjzn6ng+cL4=
X-Google-Smtp-Source: AMrXdXtVNBs5dWvMHVOwC5jj6Qp08I5jCOs7twICbstDT7P2AlcOc/IxYQ4YOlVXJjimFgn/Ct4FcQg62Bh9Z69TYoI=
X-Received: by 2002:a05:6871:4049:b0:150:ab7d:7012 with SMTP id
 ky9-20020a056871404900b00150ab7d7012mr1004853oab.55.1672965926973; Thu, 05
 Jan 2023 16:45:26 -0800 (PST)
MIME-Version: 1.0
References: <20221229071310.4111511-1-raj.khem@gmail.com> <8b9837c04e2f9bb684aa290761e00e9d072e3dba.camel@linuxfoundation.org>
 <CAMKF1sq-Nw9Mdzkg2c-rbmFfcVr4BG=ZikEs4pRr=Kn4URCh5g@mail.gmail.com> <CAP71WjwpPDqD5Ro7QH4d7xdPCuArsXz4HEX9RiAD-h19M31L3g@mail.gmail.com>
In-Reply-To: <CAP71WjwpPDqD5Ro7QH4d7xdPCuArsXz4HEX9RiAD-h19M31L3g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Jan 2023 16:45:01 -0800
Message-ID: <CAMKF1sq+yps+26k-Xg0DEELRkfrYrU41FkEpvhRxB_iNPNT67Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] musl: Update to latest on tip of trunk
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 00:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175552

On Wed, Jan 4, 2023 at 11:57 PM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
>
>
> On Fri, Dec 30, 2022 at 10:14 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Thu, Dec 29, 2022 at 3:10 PM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > On Wed, 2022-12-28 at 23:13 -0800, Khem Raj wrote:
>> > > Brings following changes
>> > >
>> > > * f47a8cdd ldso: fix invalid early references to extern-linkage libc=
.page_size
>> > > * 377218cb pthread_atfork: fix return value on malloc failure
>> > > * 29e43191 fix double-processing of DT_RELR relocations in ldso relo=
cating itself
>> > > * b50eb8c3 fix strverscmp comparison of digit sequence with non-digi=
ts
>> > > * ad5dcd39 fix async thread cancellation stack alignment
>> > > * 8f925945 fix return value of gethostby{name[2],addr} with no resul=
t but no error
>> > > * 63402be2 clean up dns_parse_callback
>> > > * 0a7b4323 dns response handling: don't treat too many addresses as =
an error
>> > > * 41603c77 dns response handling: ignore presence of wrong-type RRs
>> > > * cf76df0e fix missing synchronization of pthread TSD keys with MT-f=
ork
>> > > * 5ff3eea9 fgets: avoid arithmetic overflow when n=3D=3DINT_MIN is p=
assed
>> > > * d8f35e29 fix AS-safety of close when aio is in use and fd map is e=
xpanded
>> > > * 26c76a90 fix use of uninitialized dummy_fut in aio_suspend
>> > > * aebd6a36 fix potential deadlock between multithreaded fork and aio
>> > > * d64148a8 fix potential unsynchronized access to killlock state at =
thread exit
>> > > * 36b72cd6 fix potential deadlock in dlerror buffer handling at thre=
ad exit
>> > > * 833a4691 configure: disable TBAA optimization because most compile=
rs are buggy
>> > > * e6e82132 disable MADV_FREE usage in mallocng
>> > > * 25e6fee2 remove LFS64 programming interfaces (macro-only) from _GN=
U_SOURCE
>> > > * 246f1c81 remove LFS64 symbol aliases; replace with dynamic linker =
remapping
>> > > * dec8f0a4 dns query core: detect udp truncation at recv time
>> > > * 8c408937 getaddrinfo dns lookup: use larger answer buffer to handl=
e long CNAMEs
>> > > * 759bf785 arpa/nameser.h: update RR types list
>> > > * 51d4669f dns: implement tcp fallback in __res_msend query core
>> > > * e2e95176 res_send: use a temp buffer if caller's buffer is under 5=
12 bytes
>> > > * c87d75f2 adapt res_msend DNS query core for working with multiple =
sockets
>> > > * 85050ac5 getaddrinfo: add EAI_NODATA error code to distinguish NOD=
ATA vs NxDomain
>> > >
>> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > > ---
>> > >  meta/recipes-core/musl/musl_git.bb | 2 +-
>> > >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > >
>> > > diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/=
musl/musl_git.bb
>> > > index a72d87ea6f..7749495ec6 100644
>> > > --- a/meta/recipes-core/musl/musl_git.bb
>> > > +++ b/meta/recipes-core/musl/musl_git.bb
>> > > @@ -4,7 +4,7 @@
>> > >  require musl.inc
>> > >  inherit linuxloader
>> > >
>> > > -SRCREV =3D "dc9285ad1dc19349c407072cc48ba70dab86de45"
>> > > +SRCREV =3D "f47a8cdd250d9163fcfb39bf4e9d813957c0b187"
>> > >
>> > >  BASEVER =3D "1.2.3"
>> > >
>> >
>> > I tested this with your 3 musl patches and it showed a few issues:
>> >
>> > https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/6421
>> > https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/6439
>> >
>>
>> I have sent fixes for all the build failures seen in these two builds.
>
>
> I am getting other failures since this patch was merged (https://github.c=
om/ndechesne/meta-qcom/actions/workflows/daily.yml). When building e2fsprog=
 for arm 32 bit targets. A snippet of the build log is:
>
> | arm-poky-linux-musleabi-gcc  -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dh=
ard -mcpu=3Dcortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 =
-Wformat -Wformat-security -Werror=3Dformat-security --sysroot=3D/oe/build/=
tmp/work/cortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/r=
ecipe-sysroot -I. -I../../lib -I../../../git/lib  -O2 -pipe -g -feliminate-=
unused-debug-types -fmacro-prefix-map=3D/oe/build/tmp/work/cortexa15t2hf-ne=
on-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/git=3D/usr/src/debug/e2fsp=
rogs/1.46.5-r0  -fdebug-prefix-map=3D/oe/build/tmp/work/cortexa15t2hf-neon-=
vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/git=3D/usr/src/debug/e2fsprog=
s/1.46.5-r0  -fmacro-prefix-map=3D/oe/build/tmp/work/cortexa15t2hf-neon-vfp=
v4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/build=3D/usr/src/debug/e2fsprogs=
/1.46.5-r0  -fdebug-prefix-map=3D/oe/build/tmp/work/cortexa15t2hf-neon-vfpv=
4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/build=3D/usr/src/debug/e2fsprogs/=
1.46.5-r0  -fdebug-prefix-map=3D/oe/build/tmp/work/cortexa15t2hf-neon-vfpv4=
-poky-linux-musleabi/e2fsprogs/1.46.5-r0/recipe-sysroot=3D  -fmacro-prefix-=
map=3D/oe/build/tmp/work/cortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsp=
rogs/1.46.5-r0/recipe-sysroot=3D  -fdebug-prefix-map=3D/oe/build/tmp/work/c=
ortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/recipe-sysr=
oot-native=3D  -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/lookup=
.c -o lookup.o
> | ../../../git/lib/ext2fs/llseek.c:70:22: error: expected declaration spe=
cifiers or '...' before '_llseek'
> |    70 | static _syscall5(int,_llseek,unsigned int,fd,unsigned long,offs=
et_high,
> |       |                      ^~~~~~~
> | ../../../git/lib/ext2fs/llseek.c:70:43: error: unknown type name 'fd'
> |    70 | static _syscall5(int,_llseek,unsigned int,fd,unsigned long,offs=
et_high,
> |       |                                           ^~
> | ../../../git/lib/ext2fs/llseek.c:70:60: error: unknown type name 'offse=
t_high'
> |    70 | static _syscall5(int,_llseek,unsigned int,fd,unsigned long,offs=
et_high,
> |       |                                                            ^~~~=
~~~~~~~
> | ../../../git/lib/ext2fs/llseek.c:71:33: error: unknown type name 'offse=
t_low'; did you mean 'offsetof'?
> |    71 |                  unsigned long, offset_low,ext2_loff_t *,result=
,
> |       |                                 ^~~~~~~~~~
> |       |                                 offsetof
> | ../../../git/lib/ext2fs/llseek.c:71:58: error: unknown type name 'resul=
t'
> |    71 |                  unsigned long, offset_low,ext2_loff_t *,result=
,
> |       |                                                          ^~~~~~
> | ../../../git/lib/ext2fs/llseek.c:72:32: error: unknown type name 'origi=
n'
> |    72 |                  unsigned int, origin);
> |       |                                ^~~~~~
> | ../../../git/lib/ext2fs/llseek.c:67:12: warning: '_llseek' used but nev=
er defined
> |    67 | static int _llseek (unsigned int, unsigned long,
> |       |            ^~~~~~~
> | make[2]: *** [Makefile:689: llseek.o] Error 1
>
> The last known good build was with acef849931c5ab14ede40c2ea01a22027e34a3=
35, first failure was caught with 64625155eca8399f403b992ec536897f75956baa =
(both are Poky tree sha).
>

Interesting, it compiled ok for qemuarm and also for rpi4(32bit), I
will try to reproduce it here.

>>
>> Thanks
>> -Khem
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#175178): https://lists.openembedded.org/g/openembedd=
ed-core/message/175178
>> Mute This Topic: https://lists.openembedded.org/mt/95933622/1279857
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [n=
icolas.dechesne@linaro.org]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

