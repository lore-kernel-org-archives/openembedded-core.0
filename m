Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301B4C98304
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 19:11:53 +0000 (UTC)
Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3141.1790190709794630800
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 12:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=f1VVRdns;
 spf=pass (domain: gmail.com, ip: 74.125.224.141, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab1ef11so1193549d50.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 12:11:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790190709; cv=none;
        d=google.com; s=arc-20260327;
        b=dncUM5tsgT7YOOBqDGvbRB6emm8/QWJKEmWfAJ5k0sQ+tr6X2t2BszF5pjqgNjlYw7
         nP7G2GTw2H6NI2Jd8xGICmyBWY2dMSeY3QOBW4u/cSpBFBQKUK1BYr3RRVerZSchGl7u
         PiS2fOoE+ESgT3KguH3c0oh/q/jFG3y16ZDnhZwKAYFdm8Gk07o8wl0fHneDV9pIegKF
         tQL7a9RFfui9Z/ykQAMGCouqb95/+Pjl1ad5DE35Lz00T53ykxN/mCCviRsk4u+X92O7
         4AYWbLhW8KFZhEL4e8A8KN39BCRFKtwnwrV4VEdFxNWIF4yGO/QgqjnjW7wOfqTdC1gT
         gc2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=51XjXGNuNe7tZXNW6jce1YPzeYboJsAHxIGAmsKWnBc=;
        fh=KVXh6RAnMu2eYA7fRmhEUTWSBBlYV/A9V4ozkDA9O98=;
        b=Tizi3aXFqZypVZK8cLo1g5hcHPir1Pk/7tgmh5YkvwgUBKX1B56CURxo9Bl/GKuadX
         JRIblzLsbeBWA3iZ6EMvRWbskD01/rtsH0q4Oeg1qZFwp5R2szuVF3/NiYj/l42O4Wgk
         2yyrkcxEYEVgbzASKm3cHxqe4+biTP7g8u0RXH/o4L8mLU4cg22unJCAOH7hc05EgB5D
         ThFtxWU8zeBFZA2mEyIE32uA2IWqT2843bd7FCMxZNvvSksNh8k3qOr2RKK/+zJVowDW
         pEj52sB9YG/qa47HrdBFhW8j1kTw3BdeDY6rT/VbOr2cWADZvYRDDFwo3NQYxkD7Ns4H
         1EJg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790190709; x=1790795509; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=51XjXGNuNe7tZXNW6jce1YPzeYboJsAHxIGAmsKWnBc=;
        b=f1VVRdnsXF5e5NV88yZBxRfWGtEVTVCux6Dn3uBcJWzU+SQSdmCuszgLdw6ffd2xuX
         mFARCq+KRLPQVgeaGFtgasvVm9p545s8iyPE3kHKooZAY0UeGKFBINfvbcHc8/7SKR9N
         uBCMjKx00Lb6gcT/j1hbP9hayQlAQZZ/5KciYMNg57has0LDrcH2zXL5FgQH+7RKz+5e
         V6W64qGMV6avBpyAfqlyThrsUy303Ibj8zakJrCltQLFi4VY+KoAY52BX46IprWYYR4H
         HpIlJ15sz92RW2zaHWIWWkhbZxK/YHe3xgjZSyzErXmSsyeNQGPxwQ6GsOm34x3Vt8cb
         3GhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190709; x=1790795509;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=51XjXGNuNe7tZXNW6jce1YPzeYboJsAHxIGAmsKWnBc=;
        b=ILJbnW1Jvz+qJV7PSCLcr6aIb/ni7VO9TavpxSNfGMBVXeKxSoxBZN5G85buZAa30k
         wA4p3alsdriecHXvvo21w6gU7x0mg/LcEqk1hkWa1yDTQ0vmbWgW+ToiUv3icKgaGvTr
         Gae/FPbNJ+yjB+vZ9QNWe8eT8rv/MfBZz0xAywZj4lNtehwch/7xgHTyrZT8CNjQcH4B
         inSVAxqMQoCzBm2KvWz4MTkQk9PHKf1utNkdymDc1+WcUY80GTkrKMd/2kiMCCvaOTYK
         08y6spHfHzByoK0J00gtfJqARvrQcBoUWu/Uk4NpiXK3uhoD3WmAq9wTWdxgBzbomboH
         tN2w==
X-Gm-Message-State: AFuF++mLULyLIYj+OhriC8zuV1Dv3l6UH/wK6MUTYSQvTdfcj4h+fIeN
	4+YBKzhxJy9udfgOQHzX4hnZ8cAUgzsSU3UImrEcLrASPWBhnDEmuJt2+0FzclpGds+PoE2pkh/
	nSMhX0qdT6U7cIiK67fIKd+iRZxIaF68=
X-Gm-Gg: AYBFou01/qIhDXFl13qXhfE6akPgsjFWo0Xij0k0/q374Mv/3nGuKi5mlZg9AicZfdQ
	eaca2wbqBG74rnvIOv2zF+E7fRj1/7y/tTV+g6gTYA10VEmzwIkHuXtktwgPTBo6yHEMXi68M1W
	lXPFxCJvKT5Rd9jwcC7n5zgnFlO2bEFiaaGFmivy7MCH3OWS4nJDPjBbw2155+wOV6h8oMQ3CpC
	7S3xeri3o2vVPICLfj2tfZ2f1mkDp/BB9vExoUo7MapzlNWPFO2nRhSwuZZH8oNkGEMSbpvzw9d
	egn5Z57nwQwLpmPm3a22kUJy0DRSbW6oaQKUhUx63ngK2NeE5HNuyzLTsBrEa0f/K8rRDRv7cFV
	n0df7mMhPDfyDyouUyjGuEGvBiBKcPjfdPaItWNSbd17YLi3x/CpKL1leIZIk1aS3aDZLyc+oY3
	CKalKcxQUpEvA1QFTNQUVo0L14CDuJsH+fidO9HNqbfO6yeqidMET+iBariqxe7GMrSAN1/wUbZ
	L4RgJxhScw1etCI/mQqjuSMiNGosBw+4tAcD+2lyjktwplwcxKsxU9g89Oq0PqE9Z+m+o2ocawT
	kohrdWc=
X-Received: by 2002:a05:690e:1487:b0:672:e7e1:f3de with SMTP id
 956f58d0204a3-672ed46d694mr120661d50.73.1790190708487; Wed, 23 Sep 2026
 12:11:48 -0700 (PDT)
MIME-Version: 1.0
References: <AS8PR10MB5073C8A330EA6849DA8DE457FD822@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB5073C8A330EA6849DA8DE457FD822@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Sep 2026 12:11:22 -0700
X-Gm-Features: AcwNN1VBYPVhjWQFETt_juZeF3f7YNu2kVjP4t1dIR5LC3MP2c1fvi38qNdIniE
Message-ID: <CAMKF1spD1wpQm5STRFFjCRSrhXHix54BC_e=EXgw-5LCQUzzVw@mail.gmail.com>
Subject: Re: [OE-core] Topic: native libstdc++ and uninative
To: peter.marko@siemens.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"Freihofer, Adrian" <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="000000000000427938065c2b41ae"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 19:11:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246537

--000000000000427938065c2b41ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 7:54=E2=80=AFAM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:

> Dear Yocto toolchain experts,
>
>
>
> we have come across a problem with C++ native libraries and sstate-cache
> reuse on different host distros under uninative.
>
>
>
> Our scenario:
>
> For generation of sstate-cache, we're using only x86-64 Debian machines,
> each Yocto branch on a fixed version.
>
> For example for wrynose we use Debian 13.
>
> However, the clients can have a different host distro (different Debian
> release or even Ubuntu or Fedora).
>
> I think this is how Yocto uninative sstate-cache is intended to be used.
>
>
>
> The problem is following:
>
> GCC version is different between different Host distros, especially
> libstdc++ from newer GCC has more symbols than from older GCC.
>
> So when re-using a native c++ library generated on Debian-13, Debian-12
> liker can report failures.
>
> Concrete case we experienced is linking against googletest-native and
> missing symbol __cxa_call_terminate (introduced in GCC 14) on Debian 12
> (GCC 12.2.0).
>
>
>
> We don't want to go away from uninative as that would force us to produce
> separate sstate-cache for each host distro and explode storage size and
> build times.
>
>
>
> Has anyone else come across this problem?
>
> What would be the recommended way to solve this?
>
>
>
> Could libstdc++ be included in uninative?
>
> Would that work with all the different GCC versions in all supported host
> distros?
>
>
>
> Or some magical compiler option we could use to disable usage of some
> newer symbols?
>
>
>
> I know that we could use buildtools tarball, however that's against the
> idea of running Yocto natively.
>
> It's also a step very easy to be forgotten during build setup unless ther=
e
> is some magical qa check for that.
>
> And for application developers it's yet another Yocto obstacle and
> argument against developing with Yocto.
>
>
>

uninative only makes glibc (and libgcc_s) universal. libstdc++ is
still taken from the host, both when linking and at runtime. Native C++
artefacts are therefore only portable to hosts whose libstdc++ is at least
as new as the one on the machine that built the sstate.

It is wider than googletest. Any C++ source that includes <iostream> and is
built with gcc >=3D 13
references std::ios_base_library_init()@GLIBCXX_3.4.32. For example, a
cmake-native built on a gcc 13+ host needs GLIBCXX_3.4.32, while
Debian 12's libstdc++ (gcc 12) stops at 3.4.30. So I would expect
Debian 13 generated sstate to also break prebuilt native C++ tools on
Debian 12 at runtime ("version `GLIBCXX_3.4.32' not found"), not just
gtest at link time. You can check with:

     objdump -T <native-binary> | grep -o 'GLIBCXX_[0-9.]*' | sort -uV |
tail -1

googletest-native is built as a static library by default, so libgtest.a
and libgmock.a carry an unversioned reference to __cxa_call_terminate,
which is resolved against the old libstdc++ when the consuming recipe
links on the client. uninative's -Wl,--allow-shlib-undefined does not
help here since it only covers shared libraries. I can reproduce it with
a plain Release build of googletest 1.18 on a recent gcc.

There is no compiler option that can come to rescue here sadly.

somethings to consider

a) Generate the shared sstate on the oldest host gcc you want to support.
   libstdc++ is backward compatible, so objects built with gcc 12 link and
   run fine against newer libstdc++. This is the old "build on the oldest
   distro" rule, which uninative removed for glibc but not for libstdc++.
   Only native/cross output changes; with hash equivalence, target sstate
   is still reused. This is what I would do right away.

b) Add an early check, which covers the "easy to forget" part. A small
   class in your distro config can find the highest GLIBCXX_/CXXABI_
   version in the host libstdc++ (g++ -print-file-name=3Dlibstdc++.so.6) an=
d
   stop the build with a clear message when it is older than what your
   sstate needs, e.g. suggesting a newer gcc or buildtools-extended. That
   turns an obscure link or runtime failure into one clear message.

c) Ship libstdc++ in uninative. This is technically feasible, libgcc was
added
   to uninative in 2023 for a similar mismatch,
   and the uninative loader already prefers its own libraries over the
   host's ld.so.cache. It would work for all hosts whose gcc is not newer
   than the libstdc++ that uninative ships (gcc 16 on master today), with
   two caveats:

   - It needs a UNINATIVE_MAXGLIBCVERSION-style check for gcc, so that it i=
s
     disabled on hosts (e.g. rolling distros) that have a newer gcc. We
     have already seen libstdc++ ABI changes between gcc point releases
     (13.1 -> 13.2).
   - It must apply at link time as well as at runtime, because static
     archives like libgtest.a are resolved when the consuming recipe links.
     BUILD_LDFLAGS would need a -L pointing at a directory that holds only
     uninative's libstdc++.so, so it takes precedence over the host gcc's.

   This needs changes to uninative-tarball.bb and uninative.bbclass plus a
   new uninative release, so it should be discussed on the OE-Core list.
   I think it is the only option that keeps "one universal native sstate"
   true for C++, and I would be happy to help prototype it.

d) Include the host libstdc++ level in the signatures of native tasks, so
   that mismatched hosts rebuild instead of failing. With hash equivalence
   you would end up with one native sstate set per gcc level, not per
   distro. It is more robust than (a) but costs rebuilds on the clients.

For wrynose today, I would suggest (a) + (b), and raising (c) on the
OE-Core list as the long-term fix.

Cheers,
-Khem


> Best Regards,
>
>   Peter
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#246529):
> https://lists.openembedded.org/g/openembedded-core/message/246529
> Mute This Topic: https://lists.openembedded.org/mt/121393863/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000427938065c2b41ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 23,=
 2026 at 7:54=E2=80=AFAM Peter Marko via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;peter.marko=3D<a href=3D"mailto:siem=
ens.com@lists.openembedded.org">siemens.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div clas=
s=3D"msg-2290535514651471147">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-2290535514651471147WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">Dear Yocto toolchain experts,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">=C2=A0<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">we have come across a problem with C++ native libraries and sstate-=
cache reuse on different host distros under uninative.<u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">=C2=A0<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">Our scenario:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">For generation of sstate-cache, we&#39;re using only x86-64 Debian =
machines, each Yocto branch on a fixed version.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">For example for wrynose we use Debian 13.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">However, the clients can have a different host distro (different De=
bian release or even Ubuntu or Fedora).<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">I think this is how Yocto uninative sstate-cache is intended to be =
used.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">=C2=A0<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">The problem is following:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">GCC version is different between different Host distros, especially=
 libstdc++ from newer GCC has more symbols than from older GCC.<u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">So when re-using a native c++ library generated on Debian-13, Debia=
n-12 liker can report failures.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">Concrete case we experienced is linking against googletest-native a=
nd missing symbol __cxa_call_terminate (introduced in GCC 14) on Debian 12 =
(GCC 12.2.0).<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">=C2=A0<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">We don&#39;t want to go away from uninative as that would force us =
to produce separate sstate-cache for each host distro and explode storage s=
ize and build times.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">=C2=A0<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">Has anyone else come across this problem?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">What would be the recommended way to solve this?<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">=C2=A0<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">Could libstdc++ be included in uninative?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">Would that work with all the different GCC versions in all supporte=
d host distros?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">Or some magical compiler option we could use to disable usage of so=
me newer symbols?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">=C2=A0<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">I know that we could use buildtools tarball, however that&#39;s aga=
inst the idea of running Yocto natively.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">It&#39;s also a step very easy to be forgotten during build setup u=
nless there is some magical qa check for that.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">And for application developers it&#39;s yet another Yocto obstacle =
and argument against developing with Yocto.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">=C2=A0</span></p></div></div></div></blockquote><div><br></div><div=
>uninative only makes glibc (and libgcc_s) universal. libstdc++ is<br>still=
 taken from the host, both when linking and at runtime. Native C++<br>artef=
acts are therefore only portable to hosts whose libstdc++ is at least<br>as=
 new as the one on the machine that built the sstate.<br><span style=3D"bac=
kground-color:transparent"><br></span></div><div><span style=3D"background-=
color:transparent">It is wider than googletest.=C2=A0</span><span style=3D"=
background-color:transparent">Any C++ source that includes &lt;iostream&gt;=
 and is built with gcc &gt;=3D 13</span></div><div>references std::ios_base=
_library_init()@GLIBCXX_3.4.32. For example, a<br>cmake-native built on a g=
cc 13+ host needs GLIBCXX_3.4.32, while<br>Debian 12&#39;s libstdc++ (gcc 1=
2) stops at 3.4.30. So I would expect<br>Debian 13 generated sstate to also=
 break prebuilt native C++ tools on<br>Debian 12 at runtime (&quot;version =
`GLIBCXX_3.4.32&#39; not found&quot;), not just<br>gtest at link time. You =
can check with:<br><br>=C2=A0 =C2=A0 =C2=A0objdump -T &lt;native-binary&gt;=
 | grep -o &#39;GLIBCXX_[0-9.]*&#39; | sort -uV | tail -1<br><br></div><div=
>googletest-native is built as a static library by default, so libgtest.a<b=
r>and libgmock.a carry an unversioned reference to __cxa_call_terminate,<br=
>which is resolved against the old libstdc++ when the consuming recipe<br>l=
inks on the client. uninative&#39;s -Wl,--allow-shlib-undefined does not<br=
>help here since it only covers shared libraries. I can reproduce it with<b=
r>a plain Release build of googletest 1.18 on a recent gcc.<br><br>There is=
 no compiler option that can come to rescue here sadly.<br><br></div><div>s=
omethings to consider</div><div><br>a) Generate the shared sstate on the ol=
dest host gcc you want to support.<br>=C2=A0 =C2=A0libstdc++ is backward co=
mpatible, so objects built with gcc 12 link and<br>=C2=A0 =C2=A0run fine ag=
ainst newer libstdc++. This is the old &quot;build on the oldest<br>=C2=A0 =
=C2=A0distro&quot; rule, which uninative removed for glibc but not for libs=
tdc++.<br>=C2=A0 =C2=A0Only native/cross output changes; with hash equivale=
nce, target sstate<br>=C2=A0 =C2=A0is still reused. This is what I would do=
 right away.<br><br>b) Add an early check, which covers the &quot;easy to f=
orget&quot; part. A small<br>=C2=A0 =C2=A0class in your distro config can f=
ind the highest GLIBCXX_/CXXABI_<br>=C2=A0 =C2=A0version in the host libstd=
c++ (g++ -print-file-name=3Dlibstdc++.so.6) and<br>=C2=A0 =C2=A0stop the bu=
ild with a clear message when it is older than what your<br>=C2=A0 =C2=A0ss=
tate needs, e.g. suggesting a newer gcc or buildtools-extended. That<br>=C2=
=A0 =C2=A0turns an obscure link or runtime failure into one clear message.<=
br><br>c) Ship libstdc++ in uninative. This is technically feasible, libgcc=
 was added</div><div>=C2=A0 =C2=A0to uninative in 2023 for a similar mismat=
ch,<br>=C2=A0 =C2=A0and the uninative loader already prefers its own librar=
ies over the<br>=C2=A0 =C2=A0host&#39;s ld.so.cache. It would work for all =
hosts whose gcc is not newer<br>=C2=A0 =C2=A0than the libstdc++ that uninat=
ive ships (gcc 16 on master today), with<br>=C2=A0 =C2=A0two caveats:<br><b=
r>=C2=A0 =C2=A0- It needs a UNINATIVE_MAXGLIBCVERSION-style check for gcc, =
so that it is<br>=C2=A0 =C2=A0 =C2=A0disabled on hosts (e.g. rolling distro=
s) that have a newer gcc. We<br>=C2=A0 =C2=A0 =C2=A0have already seen libst=
dc++ ABI changes between gcc point releases<br>=C2=A0 =C2=A0 =C2=A0(13.1 -&=
gt; 13.2).<br>=C2=A0 =C2=A0- It must apply at link time as well as at runti=
me, because static<br>=C2=A0 =C2=A0 =C2=A0archives like libgtest.a are reso=
lved when the consuming recipe links.<br>=C2=A0 =C2=A0 =C2=A0BUILD_LDFLAGS =
would need a -L pointing at a directory that holds only<br>=C2=A0 =C2=A0 =
=C2=A0uninative&#39;s libstdc++.so, so it takes precedence over the host gc=
c&#39;s.<br><br>=C2=A0 =C2=A0This needs changes to <a href=3D"http://uninat=
ive-tarball.bb">uninative-tarball.bb</a> and uninative.bbclass plus a<br>=
=C2=A0 =C2=A0new uninative release, so it should be discussed on the OE-Cor=
e list.<br>=C2=A0 =C2=A0I think it is the only option that keeps &quot;one =
universal native sstate&quot;<br>=C2=A0 =C2=A0true for C++, and I would be =
happy to help prototype it.<br><br>d) Include the host libstdc++ level in t=
he signatures of native tasks, so<br>=C2=A0 =C2=A0that mismatched hosts reb=
uild instead of failing. With hash equivalence<br>=C2=A0 =C2=A0you would en=
d up with one native sstate set per gcc level, not per<br>=C2=A0 =C2=A0dist=
ro. It is more robust than (a) but costs rebuilds on the clients.<br><br>Fo=
r wrynose today, I would suggest (a) + (b), and raising (c) on the<br>OE-Co=
re list as the long-term fix.<br><br>Cheers,<br>-Khem</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-229053=
5514651471147"><div lang=3D"EN-US" style=3D"overflow-wrap: break-word;"><di=
v class=3D"m_-2290535514651471147WordSection1"><p class=3D"MsoNormal"><span=
 style=3D"font-size:10pt;font-family:Arial,sans-serif"><u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">Best Regards,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">=C2=A0 Peter<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif"><u></u>=C2=A0<u></u></span></p>
</div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#246529): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/246529" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/246529</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121393863/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121393863/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div></blockquote></div></div>

--000000000000427938065c2b41ae--

