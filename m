Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C110BC54E76
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 07:32:28 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.8835.1672990346823209694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 23:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mLokcdrG;
 spf=pass (domain: linaro.org, ip: 209.85.219.171, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f171.google.com with SMTP id 192so1033652ybt.6
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 23:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ut/sVTKJ9AEkoKFGi7L1rDQ90x4jQeDkhr0AHiTTyaI=;
        b=mLokcdrGyGC1//SQ2CsC5WlHvHs3hePvWFDhvxQLY+8Uo+ghXUfbBc1tCU16UxWPFn
         1DYW99td3vuZC4XAASe7c5lC1+jj7yR0Lqx0k69SPRyQ1j6Ew5Vl+3Nw5sp/t6Rfcotj
         OP6rpm4cPGgeNZmL+4muqpKpFF6qdeKQd8aio7/QX1T1lnvb7ucLXVCTgRLz0DCnc7dl
         /pSC0nMsXESlya7KEKCt/Vo4t6eswM0A5AX7ZKo6Ldy9Tbx7rcFmPsmCkyRQA3U1unSn
         Wn8L/+wWItEj6wSU57EmJ4hL12PrvMg+BNPaJ8MCdujmOY189MMKBWoDuY8j5quQPlrR
         NAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ut/sVTKJ9AEkoKFGi7L1rDQ90x4jQeDkhr0AHiTTyaI=;
        b=xh+H49+axzYduccpbIuxcNEUNc0EpJALCSotAKg4NKBuzRu/8REA0pTM2z40ZDWCPd
         t/hIQRbG2BCZNjCmkR9IEqP2VkhnOg92w+revLoLPmtzvXvpumAe3TYvH14xTAKgoe29
         rznjWkkwoPBkvTK222Sud1oyBQmi2TQ+COWuJgfiz3SWaZIlGCgjydkzM/zluPZkVoID
         mTFFoOfbWtIIUCn7ajyKy0fvTrFcsfVV8PefFTvdjYN73Wzct4/aFRMTiluATarmGhg2
         DnkzkhbVRRDoX2dlYqzOxzUvhRcQGzN3LUgjRe+Lh3n7d0NXHAyQWrMxesJ5aCjcw+za
         ynuA==
X-Gm-Message-State: AFqh2kq2+1MX5zGtjlrQMGrocx64wMSEEkW/BYzBCgx7C220TM7mno06
	3nL635SszWNQngE2FW8UTrWpG0NSK0udsa732iyeZA==
X-Google-Smtp-Source: AMrXdXsHWgG5xafCu6l1a0r0z7CYDNKy6BAe9hy7g3AjQ26YOF8x/CDgJTW4JhRMZhqK5CDXfKHi27UjrtPD6dtzF7s=
X-Received: by 2002:a25:9209:0:b0:756:3e38:765f with SMTP id
 b9-20020a259209000000b007563e38765fmr4455013ybo.428.1672990345813; Thu, 05
 Jan 2023 23:32:25 -0800 (PST)
MIME-Version: 1.0
References: <20221229071310.4111511-1-raj.khem@gmail.com> <8b9837c04e2f9bb684aa290761e00e9d072e3dba.camel@linuxfoundation.org>
 <CAMKF1sq-Nw9Mdzkg2c-rbmFfcVr4BG=ZikEs4pRr=Kn4URCh5g@mail.gmail.com>
 <CAP71WjwpPDqD5Ro7QH4d7xdPCuArsXz4HEX9RiAD-h19M31L3g@mail.gmail.com> <CAMKF1sq+yps+26k-Xg0DEELRkfrYrU41FkEpvhRxB_iNPNT67Q@mail.gmail.com>
In-Reply-To: <CAMKF1sq+yps+26k-Xg0DEELRkfrYrU41FkEpvhRxB_iNPNT67Q@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 6 Jan 2023 08:32:14 +0100
Message-ID: <CAP71WjwmACg3NX9fEKhm0y+AdK3hbKPeQA1P9fn5_t8-vz_F4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] musl: Update to latest on tip of trunk
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004682d505f1936b9f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 07:32:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175558

--0000000000004682d505f1936b9f
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 6, 2023 at 1:45 AM Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Jan 4, 2023 at 11:57 PM Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
> >
> >
> >
> > On Fri, Dec 30, 2022 at 10:14 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On Thu, Dec 29, 2022 at 3:10 PM Richard Purdie
> >> <richard.purdie@linuxfoundation.org> wrote:
> >> >
> >> > On Wed, 2022-12-28 at 23:13 -0800, Khem Raj wrote:
> >> > > Brings following changes
> >> > >
> >> > > * f47a8cdd ldso: fix invalid early references to extern-linkage
> libc.page_size
> >> > > * 377218cb pthread_atfork: fix return value on malloc failure
> >> > > * 29e43191 fix double-processing of DT_RELR relocations in ldso
> relocating itself
> >> > > * b50eb8c3 fix strverscmp comparison of digit sequence with
> non-digits
> >> > > * ad5dcd39 fix async thread cancellation stack alignment
> >> > > * 8f925945 fix return value of gethostby{name[2],addr} with no
> result but no error
> >> > > * 63402be2 clean up dns_parse_callback
> >> > > * 0a7b4323 dns response handling: don't treat too many addresses as
> an error
> >> > > * 41603c77 dns response handling: ignore presence of wrong-type RRs
> >> > > * cf76df0e fix missing synchronization of pthread TSD keys with
> MT-fork
> >> > > * 5ff3eea9 fgets: avoid arithmetic overflow when n==INT_MIN is
> passed
> >> > > * d8f35e29 fix AS-safety of close when aio is in use and fd map is
> expanded
> >> > > * 26c76a90 fix use of uninitialized dummy_fut in aio_suspend
> >> > > * aebd6a36 fix potential deadlock between multithreaded fork and aio
> >> > > * d64148a8 fix potential unsynchronized access to killlock state at
> thread exit
> >> > > * 36b72cd6 fix potential deadlock in dlerror buffer handling at
> thread exit
> >> > > * 833a4691 configure: disable TBAA optimization because most
> compilers are buggy
> >> > > * e6e82132 disable MADV_FREE usage in mallocng
> >> > > * 25e6fee2 remove LFS64 programming interfaces (macro-only) from
> _GNU_SOURCE
> >> > > * 246f1c81 remove LFS64 symbol aliases; replace with dynamic linker
> remapping
> >> > > * dec8f0a4 dns query core: detect udp truncation at recv time
> >> > > * 8c408937 getaddrinfo dns lookup: use larger answer buffer to
> handle long CNAMEs
> >> > > * 759bf785 arpa/nameser.h: update RR types list
> >> > > * 51d4669f dns: implement tcp fallback in __res_msend query core
> >> > > * e2e95176 res_send: use a temp buffer if caller's buffer is under
> 512 bytes
> >> > > * c87d75f2 adapt res_msend DNS query core for working with multiple
> sockets
> >> > > * 85050ac5 getaddrinfo: add EAI_NODATA error code to distinguish
> NODATA vs NxDomain
> >> > >
> >> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> > > ---
> >> > >  meta/recipes-core/musl/musl_git.bb | 2 +-
> >> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> > >
> >> > > diff --git a/meta/recipes-core/musl/musl_git.bb
> b/meta/recipes-core/musl/musl_git.bb
> >> > > index a72d87ea6f..7749495ec6 100644
> >> > > --- a/meta/recipes-core/musl/musl_git.bb
> >> > > +++ b/meta/recipes-core/musl/musl_git.bb
> >> > > @@ -4,7 +4,7 @@
> >> > >  require musl.inc
> >> > >  inherit linuxloader
> >> > >
> >> > > -SRCREV = "dc9285ad1dc19349c407072cc48ba70dab86de45"
> >> > > +SRCREV = "f47a8cdd250d9163fcfb39bf4e9d813957c0b187"
> >> > >
> >> > >  BASEVER = "1.2.3"
> >> > >
> >> >
> >> > I tested this with your 3 musl patches and it showed a few issues:
> >> >
> >> >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/6421
> >> >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/6439
> >> >
> >>
> >> I have sent fixes for all the build failures seen in these two builds.
> >
> >
> > I am getting other failures since this patch was merged (
> https://github.com/ndechesne/meta-qcom/actions/workflows/daily.yml). When
> building e2fsprog for arm 32 bit targets. A snippet of the build log is:
> >
> > | arm-poky-linux-musleabi-gcc  -mthumb -mfpu=neon-vfpv4 -mfloat-abi=hard
> -mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat
> -Wformat-security -Werror=format-security
> --sysroot=/oe/build/tmp/work/cortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/recipe-sysroot
> -I. -I../../lib -I../../../git/lib  -O2 -pipe -g
> -feliminate-unused-debug-types
> -fmacro-prefix-map=/oe/build/tmp/work/cortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/git=/usr/src/debug/e2fsprogs/1.46.5-r0
> -fdebug-prefix-map=/oe/build/tmp/work/cortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/git=/usr/src/debug/e2fsprogs/1.46.5-r0
> -fmacro-prefix-map=/oe/build/tmp/work/cortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/build=/usr/src/debug/e2fsprogs/1.46.5-r0
> -fdebug-prefix-map=/oe/build/tmp/work/cortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/build=/usr/src/debug/e2fsprogs/1.46.5-r0
> -fdebug-prefix-map=/oe/build/tmp/work/cortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/recipe-sysroot=
> -fmacro-prefix-map=/oe/build/tmp/work/cortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/recipe-sysroot=
> -fdebug-prefix-map=/oe/build/tmp/work/cortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/recipe-sysroot-native=
> -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/lookup.c -o lookup.o
> > | ../../../git/lib/ext2fs/llseek.c:70:22: error: expected declaration
> specifiers or '...' before '_llseek'
> > |    70 | static _syscall5(int,_llseek,unsigned int,fd,unsigned
> long,offset_high,
> > |       |                      ^~~~~~~
> > | ../../../git/lib/ext2fs/llseek.c:70:43: error: unknown type name 'fd'
> > |    70 | static _syscall5(int,_llseek,unsigned int,fd,unsigned
> long,offset_high,
> > |       |                                           ^~
> > | ../../../git/lib/ext2fs/llseek.c:70:60: error: unknown type name
> 'offset_high'
> > |    70 | static _syscall5(int,_llseek,unsigned int,fd,unsigned
> long,offset_high,
> > |       |
> ^~~~~~~~~~~
> > | ../../../git/lib/ext2fs/llseek.c:71:33: error: unknown type name
> 'offset_low'; did you mean 'offsetof'?
> > |    71 |                  unsigned long, offset_low,ext2_loff_t
> *,result,
> > |       |                                 ^~~~~~~~~~
> > |       |                                 offsetof
> > | ../../../git/lib/ext2fs/llseek.c:71:58: error: unknown type name
> 'result'
> > |    71 |                  unsigned long, offset_low,ext2_loff_t
> *,result,
> > |       |                                                          ^~~~~~
> > | ../../../git/lib/ext2fs/llseek.c:72:32: error: unknown type name
> 'origin'
> > |    72 |                  unsigned int, origin);
> > |       |                                ^~~~~~
> > | ../../../git/lib/ext2fs/llseek.c:67:12: warning: '_llseek' used but
> never defined
> > |    67 | static int _llseek (unsigned int, unsigned long,
> > |       |            ^~~~~~~
> > | make[2]: *** [Makefile:689: llseek.o] Error 1
> >
> > The last known good build was with
> acef849931c5ab14ede40c2ea01a22027e34a335, first failure was caught with
> 64625155eca8399f403b992ec536897f75956baa (both are Poky tree sha).
> >
>
> Interesting, it compiled ok for qemuarm and also for rpi4(32bit), I
> will try to reproduce it here.
>

I am seeing the same problem in my poky/qemuarm CI:
https://ci.linaro.org/job/lt-qcom-poky-master/604/DISTRO=poky,MACHINE=qemuarm,TCLIBC=musl/console

Note that both meta-qcom and poky/qemu are using the Linaro Tux cloud
infrastructure to build.. I will try a local build as well.


>
> >>
> >> Thanks
> >> -Khem
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#175178):
> https://lists.openembedded.org/g/openembedded-core/message/175178
> >> Mute This Topic: https://lists.openembedded.org/mt/95933622/1279857
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> nicolas.dechesne@linaro.org]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>
>

--0000000000004682d505f1936b9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 6, 2023 at 1:45 AM Khem R=
aj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Jan =
4, 2023 at 11:57 PM Nicolas Dechesne<br>
&lt;<a href=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicola=
s.dechesne@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Dec 30, 2022 at 10:14 PM Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Dec 29, 2022 at 3:10 PM Richard Purdie<br>
&gt;&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Wed, 2022-12-28 at 23:13 -0800, Khem Raj wrote:<br>
&gt;&gt; &gt; &gt; Brings following changes<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; * f47a8cdd ldso: fix invalid early references to extern-=
linkage libc.page_size<br>
&gt;&gt; &gt; &gt; * 377218cb pthread_atfork: fix return value on malloc fa=
ilure<br>
&gt;&gt; &gt; &gt; * 29e43191 fix double-processing of DT_RELR relocations =
in ldso relocating itself<br>
&gt;&gt; &gt; &gt; * b50eb8c3 fix strverscmp comparison of digit sequence w=
ith non-digits<br>
&gt;&gt; &gt; &gt; * ad5dcd39 fix async thread cancellation stack alignment=
<br>
&gt;&gt; &gt; &gt; * 8f925945 fix return value of gethostby{name[2],addr} w=
ith no result but no error<br>
&gt;&gt; &gt; &gt; * 63402be2 clean up dns_parse_callback<br>
&gt;&gt; &gt; &gt; * 0a7b4323 dns response handling: don&#39;t treat too ma=
ny addresses as an error<br>
&gt;&gt; &gt; &gt; * 41603c77 dns response handling: ignore presence of wro=
ng-type RRs<br>
&gt;&gt; &gt; &gt; * cf76df0e fix missing synchronization of pthread TSD ke=
ys with MT-fork<br>
&gt;&gt; &gt; &gt; * 5ff3eea9 fgets: avoid arithmetic overflow when n=3D=3D=
INT_MIN is passed<br>
&gt;&gt; &gt; &gt; * d8f35e29 fix AS-safety of close when aio is in use and=
 fd map is expanded<br>
&gt;&gt; &gt; &gt; * 26c76a90 fix use of uninitialized dummy_fut in aio_sus=
pend<br>
&gt;&gt; &gt; &gt; * aebd6a36 fix potential deadlock between multithreaded =
fork and aio<br>
&gt;&gt; &gt; &gt; * d64148a8 fix potential unsynchronized access to killlo=
ck state at thread exit<br>
&gt;&gt; &gt; &gt; * 36b72cd6 fix potential deadlock in dlerror buffer hand=
ling at thread exit<br>
&gt;&gt; &gt; &gt; * 833a4691 configure: disable TBAA optimization because =
most compilers are buggy<br>
&gt;&gt; &gt; &gt; * e6e82132 disable MADV_FREE usage in mallocng<br>
&gt;&gt; &gt; &gt; * 25e6fee2 remove LFS64 programming interfaces (macro-on=
ly) from _GNU_SOURCE<br>
&gt;&gt; &gt; &gt; * 246f1c81 remove LFS64 symbol aliases; replace with dyn=
amic linker remapping<br>
&gt;&gt; &gt; &gt; * dec8f0a4 dns query core: detect udp truncation at recv=
 time<br>
&gt;&gt; &gt; &gt; * 8c408937 getaddrinfo dns lookup: use larger answer buf=
fer to handle long CNAMEs<br>
&gt;&gt; &gt; &gt; * 759bf785 arpa/nameser.h: update RR types list<br>
&gt;&gt; &gt; &gt; * 51d4669f dns: implement tcp fallback in __res_msend qu=
ery core<br>
&gt;&gt; &gt; &gt; * e2e95176 res_send: use a temp buffer if caller&#39;s b=
uffer is under 512 bytes<br>
&gt;&gt; &gt; &gt; * c87d75f2 adapt res_msend DNS query core for working wi=
th multiple sockets<br>
&gt;&gt; &gt; &gt; * 85050ac5 getaddrinfo: add EAI_NODATA error code to dis=
tinguish NODATA vs NxDomain<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt; &gt; ---<br>
&gt;&gt; &gt; &gt;=C2=A0 meta/recipes-core/musl/<a href=3D"http://musl_git.=
bb" rel=3D"noreferrer" target=3D"_blank">musl_git.bb</a> | 2 +-<br>
&gt;&gt; &gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; diff --git a/meta/recipes-core/musl/<a href=3D"http://mu=
sl_git.bb" rel=3D"noreferrer" target=3D"_blank">musl_git.bb</a> b/meta/reci=
pes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"noreferrer" target=3D"_=
blank">musl_git.bb</a><br>
&gt;&gt; &gt; &gt; index a72d87ea6f..7749495ec6 100644<br>
&gt;&gt; &gt; &gt; --- a/meta/recipes-core/musl/<a href=3D"http://musl_git.=
bb" rel=3D"noreferrer" target=3D"_blank">musl_git.bb</a><br>
&gt;&gt; &gt; &gt; +++ b/meta/recipes-core/musl/<a href=3D"http://musl_git.=
bb" rel=3D"noreferrer" target=3D"_blank">musl_git.bb</a><br>
&gt;&gt; &gt; &gt; @@ -4,7 +4,7 @@<br>
&gt;&gt; &gt; &gt;=C2=A0 require musl.inc<br>
&gt;&gt; &gt; &gt;=C2=A0 inherit linuxloader<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; -SRCREV =3D &quot;dc9285ad1dc19349c407072cc48ba70dab86de=
45&quot;<br>
&gt;&gt; &gt; &gt; +SRCREV =3D &quot;f47a8cdd250d9163fcfb39bf4e9d813957c0b1=
87&quot;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;=C2=A0 BASEVER =3D &quot;1.2.3&quot;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I tested this with your 3 musl patches and it showed a few is=
sues:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/bui=
lders/64/builds/6421" rel=3D"noreferrer" target=3D"_blank">https://autobuil=
der.yoctoproject.org/typhoon/#/builders/64/builds/6421</a><br>
&gt;&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/bui=
lders/45/builds/6439" rel=3D"noreferrer" target=3D"_blank">https://autobuil=
der.yoctoproject.org/typhoon/#/builders/45/builds/6439</a><br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; I have sent fixes for all the build failures seen in these two bui=
lds.<br>
&gt;<br>
&gt;<br>
&gt; I am getting other failures since this patch was merged (<a href=3D"ht=
tps://github.com/ndechesne/meta-qcom/actions/workflows/daily.yml" rel=3D"no=
referrer" target=3D"_blank">https://github.com/ndechesne/meta-qcom/actions/=
workflows/daily.yml</a>). When building e2fsprog for arm 32 bit targets. A =
snippet of the build log is:<br>
&gt;<br>
&gt; | arm-poky-linux-musleabi-gcc=C2=A0 -mthumb -mfpu=3Dneon-vfpv4 -mfloat=
-abi=3Dhard -mcpu=3Dcortex-a15 -fstack-protector-strong=C2=A0 -O2 -D_FORTIF=
Y_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security --sysroot=
=3D/oe/build/tmp/work/cortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprog=
s/1.46.5-r0/recipe-sysroot -I. -I../../lib -I../../../git/lib=C2=A0 -O2 -pi=
pe -g -feliminate-unused-debug-types -fmacro-prefix-map=3D/oe/build/tmp/wor=
k/cortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/git=3D/u=
sr/src/debug/e2fsprogs/1.46.5-r0=C2=A0 -fdebug-prefix-map=3D/oe/build/tmp/w=
ork/cortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/git=3D=
/usr/src/debug/e2fsprogs/1.46.5-r0=C2=A0 -fmacro-prefix-map=3D/oe/build/tmp=
/work/cortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/buil=
d=3D/usr/src/debug/e2fsprogs/1.46.5-r0=C2=A0 -fdebug-prefix-map=3D/oe/build=
/tmp/work/cortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/=
build=3D/usr/src/debug/e2fsprogs/1.46.5-r0=C2=A0 -fdebug-prefix-map=3D/oe/b=
uild/tmp/work/cortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5=
-r0/recipe-sysroot=3D=C2=A0 -fmacro-prefix-map=3D/oe/build/tmp/work/cortexa=
15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/recipe-sysroot=3D=
=C2=A0 -fdebug-prefix-map=3D/oe/build/tmp/work/cortexa15t2hf-neon-vfpv4-pok=
y-linux-musleabi/e2fsprogs/1.46.5-r0/recipe-sysroot-native=3D=C2=A0 -pthrea=
d=C2=A0 -DHAVE_CONFIG_H=C2=A0 -c ../../../git/lib/ext2fs/lookup.c -o lookup=
.o<br>
&gt; | ../../../git/lib/ext2fs/llseek.c:70:22: error: expected declaration =
specifiers or &#39;...&#39; before &#39;_llseek&#39;<br>
&gt; |=C2=A0 =C2=A0 70 | static _syscall5(int,_llseek,unsigned int,fd,unsig=
ned long,offset_high,<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~<br>
&gt; | ../../../git/lib/ext2fs/llseek.c:70:43: error: unknown type name &#3=
9;fd&#39;<br>
&gt; |=C2=A0 =C2=A0 70 | static _syscall5(int,_llseek,unsigned int,fd,unsig=
ned long,offset_high,<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~<br>
&gt; | ../../../git/lib/ext2fs/llseek.c:70:60: error: unknown type name &#3=
9;offset_high&#39;<br>
&gt; |=C2=A0 =C2=A0 70 | static _syscall5(int,_llseek,unsigned int,fd,unsig=
ned long,offset_high,<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~<br>
&gt; | ../../../git/lib/ext2fs/llseek.c:71:33: error: unknown type name &#3=
9;offset_low&#39;; did you mean &#39;offsetof&#39;?<br>
&gt; |=C2=A0 =C2=A0 71 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 unsigned long, offset_low,ext2_loff_t *,result,<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^~~~~~~~~~<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0offsetof<br>
&gt; | ../../../git/lib/ext2fs/llseek.c:71:58: error: unknown type name &#3=
9;result&#39;<br>
&gt; |=C2=A0 =C2=A0 71 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 unsigned long, offset_low,ext2_loff_t *,result,<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ^~~~~~<br>
&gt; | ../../../git/lib/ext2fs/llseek.c:72:32: error: unknown type name &#3=
9;origin&#39;<br>
&gt; |=C2=A0 =C2=A0 72 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 unsigned int, origin);<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~=
~~<br>
&gt; | ../../../git/lib/ext2fs/llseek.c:67:12: warning: &#39;_llseek&#39; u=
sed but never defined<br>
&gt; |=C2=A0 =C2=A0 67 | static int _llseek (unsigned int, unsigned long,<b=
r>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ^~~~~~~<br>
&gt; | make[2]: *** [Makefile:689: llseek.o] Error 1<br>
&gt;<br>
&gt; The last known good build was with acef849931c5ab14ede40c2ea01a22027e3=
4a335, first failure was caught with 64625155eca8399f403b992ec536897f75956b=
aa (both are Poky tree sha).<br>
&gt;<br>
<br>
Interesting, it compiled ok for qemuarm and also for rpi4(32bit), I<br>
will try to reproduce it here.<br></blockquote><div><br></div><div>I am see=
ing the same problem in my poky/qemuarm CI:</div><div><a href=3D"https://ci=
.linaro.org/job/lt-qcom-poky-master/604/DISTRO=3Dpoky,MACHINE=3Dqemuarm,TCL=
IBC=3Dmusl/console">https://ci.linaro.org/job/lt-qcom-poky-master/604/DISTR=
O=3Dpoky,MACHINE=3Dqemuarm,TCLIBC=3Dmusl/console</a></div><div><br></div><d=
iv>Note that both meta-qcom and poky/qemu are using the Linaro Tux cloud in=
frastructure to build.. I will try a local build as well.=C2=A0</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;&gt;<br>
&gt;&gt; Thanks<br>
&gt;&gt; -Khem<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#175178): <a href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/175178" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/g/openembedded-core/message/175178</a><br=
>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/9593=
3622/1279857" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/mt/95933622/1279857</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded=
.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:nicolas.dechesne@=
linaro.org" target=3D"_blank">nicolas.dechesne@linaro.org</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div></div>

--0000000000004682d505f1936b9f--

