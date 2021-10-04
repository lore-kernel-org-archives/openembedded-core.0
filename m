Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397E5C433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 18:28:25 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web11.14044.1633372103957831099
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 11:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V3+O3MZy;
 spf=pass (domain: gmail.com, ip: 209.85.221.171,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id b67so8105941vkb.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 11:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qFGLTtGcDcExiFeGHfnipqhEJZCtX5dONFnRYAHQVfI=;
        b=V3+O3MZyiKbrV9sXsdJvS7ol8VJsD8yKUUReCxXdkPGEuN3pyWBBueFTo0Vs2o9NPx
         O2RJlW03vLgwZMhqstUeGbYjxDCB898KVmi3e9UBuQ+y+tvxWHeZnPs/DkwEsw6n3shb
         rait1wQpYmLz+VBMkcR230t4TKtJbATHtVU/FaT84rAn+r6KG2FC0Ms+LE5asSd14hpC
         FS7KsFK1vKTLQmFmNXAVOPj8AMwCy8rzqgxIFMD+njy4yW/3hzhJHEn/gzeDLfuu+xaY
         K8wmsMcpPwr21E6SANoVRn1P/WzBzixflyM6i3KPEN81CenD9A6JCTFFPL9P4VbTKd91
         FTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qFGLTtGcDcExiFeGHfnipqhEJZCtX5dONFnRYAHQVfI=;
        b=eaLVBhPnidjROHX5HUjC5UPduzsou62HLFvVrB64bumH39Kq4YtT4b/Xjc81hXfoF0
         2DEWDBcIOGFJIFfPClwweFezwLtecv8Rxqs1TMTWE4OZHHBLs2KncK885X/Nu3e8OXpC
         5QuGfaZR0rGIP45f9VwjIDXVzSKZ5SCBkoqNh/WPmMKj+zU+VPJAgXPsvynBbCjsEqyP
         IG2/c1jxt27sf4cF6nj3tsq1wNSDqtzKTLHuPaMx4P28cEVSTwGbMsKS2qHFf9yVFlAF
         rSXOWRvh1X99k24ibirXSCvgia6I/rryEpDNZWQ+KWTo4Bis/rhJ7yx6JWW/fN/J1Ngu
         DzdA==
X-Gm-Message-State: AOAM530lpz5iK8cNYpBGMP/yYiqVX/HYDbJA7VGa+4fG033PxiCYqT3A
	SZChabcg5z4u8ftyIH+2mYtbBSakAXYcb90lWjs=
X-Google-Smtp-Source: 
 ABdhPJxqKBLJbSTdxBkD6FZ9efh2lOP5CEHszUcJ/QpoLEmxPDK9J9SNdTlCn9ZyCqAog8/q23XrJGRxI48Q51RFlXk=
X-Received: by 2002:a1f:1bc6:: with SMTP id
 b189mr16670644vkb.15.1633372102944;
 Mon, 04 Oct 2021 11:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
 <20210604091458.1381144-4-alex.kanavin@gmail.com>
 <1685B658849E960A.4717@lists.openembedded.org>
 <f9cc3da4399fcca66a9c43638dcf4eca162ba23a.camel@linuxfoundation.org>
 <50a73766-dc52-0600-a6cd-7ab422030782@gmail.com>
 <7e56d093ba6c1390cec71ef3a362abe84ce735bb.camel@linuxfoundation.org>
 <CANNYZj_ExBZwGzRrnG8Yb2nsNmzCKkZV09FqFuMbCdxAepNSkg@mail.gmail.com>
 <2ac70a7b01743192ae4ec42b2b1eee18becde25d.camel@linuxfoundation.org>
 <CANNYZj-dYu4Q9PBhBd2-msPaBSreycLCfCKmZ1zm8=z=Ht+MbA@mail.gmail.com>
 <1c55d1aca45e746034b791b2f1712e8f335b502c.camel@linuxfoundation.org>
 <ae52185ed604614ff00bee7606b704e6c065107f.camel@intel.com>
 <CADfgfobgqkfyp3GLMqJbe-T18Rdf0FYdUpVBWcU2+wkVhfMKSw@mail.gmail.com>
In-Reply-To: 
 <CADfgfobgqkfyp3GLMqJbe-T18Rdf0FYdUpVBWcU2+wkVhfMKSw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 4 Oct 2021 20:28:11 +0200
Message-ID: 
 <CANNYZj_tBVBPDM4++e4Ujvt2jfchc1WBgiGBr4xW=UDD0xtztQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
To: Michael Halstead <mhalstead@linuxfoundation.org>
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fb696305cd8b136e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 18:28:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156628

--000000000000fb696305cd8b136e
Content-Type: text/plain; charset="UTF-8"

Since the original centos 8 is going away (support-wise) in less than 3
months, should we just convert all workers to stream and move on?

Alex

On Mon, 4 Oct 2021 at 18:27, Michael Halstead <mhalstead@linuxfoundation.org>
wrote:

> This error was fixed upstream
> https://bugzilla.redhat.com/show_bug.cgi?id=1975562 kernel 4.18.0-325.x
> which has landed in CentOS8 Stream on centos8-ty-2 but not plain CentOS8
> where the newest kernel is still at 4.18.0-305.x.
>
> I'll reboot into the older 4.18.0-240.15 kernel again on centos8-ty-1 as a
> fix for now.
>
> On Tue, Sep 28, 2021 at 6:12 PM Anuj Mittal <anuj.mittal@intel.com> wrote:
>
>> Did we find out the reason why this was happening? I have started
>> getting this error on Centos-8 while building hardknott.
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/4045
>>
>> Thanks,
>>
>> Anuj
>>
>> On Wed, 2021-06-16 at 23:45 +0100, Richard Purdie wrote:
>> > On Sun, 2021-06-06 at 21:51 +0200, Alexander Kanavin wrote:
>> > > On Sun, 6 Jun 2021 at 01:10, Richard Purdie
>> > > <richard.purdie@linuxfoundation.org> wrote:
>> > > > I tried again with the autobuilder, still fails:
>> > > >
>> > > >
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/3516
>> > > >
>> > > > so whatever it is, it is still "live".
>> > > >
>> > >
>> > >
>> > > I did some digging. The issue happens when:
>> > > - host is centos8
>> > > - SDKMACHINE is i686 (e.g. cmake is 32 bit)
>> > >
>> > > Then there's a failing syscall attempting to set file times:
>> > > utimensat_time64(AT_FDCWD, "../install/usr/local/lib/cmake/assimp-
>> > > 4.1/assimp-config.cmake",
>> > > [{tv_sec=1622966723, tv_nsec=6319439026193432576},
>> > > {tv_sec=1622966579, tv_nsec=17840053692309438464}], 0) = -1
>> > > EINVAL (Invalid argument)
>> > >
>> > > On latest Fedora, there's no issue:
>> > > utimensat_time64(AT_FDCWD, "../install2/usr/local/lib/cmake/assimp-
>> > > 4.1/assimp-config.cmake",
>> > > [{tv_sec=1623002886, tv_nsec=6369724778172907520},
>> > > {tv_sec=1623002886, tv_nsec=17839174083007217664}], 0) = 0
>> > >
>> > > utimensat_time64 only appeared with 5.1 kernels, however, 4.18 should
>> > > be returning ENOSYS in that case
>> > > probably?
>> >
>> > I hacked up a quick test bit of code (which makes assumptions
>> > about 32 bit):
>> >
>> > #include <unistd.h>
>> > #include <sys/syscall.h>
>> > #include <sys/types.h>
>> > #include <sys/stat.h>
>> > #include <fcntl.h>
>> > #include <stdio.h>
>> >
>> > struct timespec64 {
>> >     long long           tv_sec;                 /* seconds */
>> >     long long           tv_nsec;                /* nanoseconds */
>> > };
>> >
>> > int main() {
>> >   int fd = open("foo", O_RDWR | O_CREAT, 0644);
>> >   write(fd, "foo", 3);
>> >   struct timespec64 times[2] = {};
>> >   times[0].tv_sec = 1622966723;
>> >   times[0].tv_nsec = 631943;
>> >   times[1].tv_sec = 1622966579;
>> >   times[1].tv_nsec = 178400;
>> >   int rc = syscall(SYS_utimensat_time64, fd, NULL, &times[0], 0);
>> >   printf("rc=%d\n", rc);
>> >   close(fd);
>> >   return rc;
>> > }
>> >
>> > built with "gcc -m32 test-syscall.c -o test" and run with "strace
>> > ./test".
>> > This works on all the systems I tried it in. As does:
>> >
>> >
>> >   times[0].tv_sec = 1;
>> >   times[0].tv_nsec = 2;
>> >   times[1].tv_sec = 3;
>> >   times[1].tv_nsec = 4;
>> >
>> > however if you set (and ignore the compiler warning):
>> >
>> >   times[0].tv_sec = 1622966723;
>> >   times[0].tv_nsec = 6319439026193432576;
>> >   times[1].tv_sec = 1622966579;
>> >   times[1].tv_nsec = 17840053692309438464;
>> >
>> > then you see EINVAL on the centos system but not on my ubuntu one. It
>> > will
>> > do that until you reduce the values of tv_nsec right now. So it seems
>> > most
>> > systems accept large tv_nsec values but the Centos one does not.
>> >
>> > I think tv_nsec may be being clamped to LONG_MAX of 4 bytes but should
>> > be
>> > a LONG_LONG_MAX of 8 bytes on a 32 bit since the field is a 64 bit
>> > long.
>> >
>> > Michael: Hopefully that gives you something to raise with them?
>> >
>> > Cheers,
>> >
>> > Richard
>> >
>> >
>> >
>> >
>> >
>> >
>> >
>> >
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#156435):
>> https://lists.openembedded.org/g/openembedded-core/message/156435
>> Mute This Topic: https://lists.openembedded.org/mt/83304703/1003190
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> mhalstead@linuxfoundation.org]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>
>
> --
> Michael Halstead
> Linux Foundation / Yocto Project
> Systems Operations Engineer
>

--000000000000fb696305cd8b136e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Since the original centos 8 is going away (support-wi=
se) in less than 3 months, should we just convert all workers to stream and=
 move on?</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 4 Oct 2021 at 18:2=
7, Michael Halstead &lt;<a href=3D"mailto:mhalstead@linuxfoundation.org">mh=
alstead@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr">This error was fixed upstream=
=C2=A0<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1975562" tar=
get=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?id=3D1975562</a> ke=
rnel 4.18.0-325.x which has landed in CentOS8 Stream on centos8-ty-2 but no=
t plain CentOS8 where the newest kernel is still at=C2=A04.18.0-305.x.<div>=
<br></div><div>I&#39;ll reboot into the older=C2=A04.18.0-240.15 kernel aga=
in on centos8-ty-1 as a fix for now.=C2=A0</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 28, 2021 at 6:1=
2 PM Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_bl=
ank">anuj.mittal@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Did we find out the reason why this was happening=
? I have started<br>
getting this error on Centos-8 while building hardknott.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/63/build=
s/4045" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/63/builds/4045</a><br>
<br>
Thanks,<br>
<br>
Anuj<br>
<br>
On Wed, 2021-06-16 at 23:45 +0100, Richard Purdie wrote:<br>
&gt; On Sun, 2021-06-06 at 21:51 +0200, Alexander Kanavin wrote:<br>
&gt; &gt; On Sun, 6 Jun 2021 at 01:10, Richard Purdie<br>
&gt; &gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; &gt; I tried again with the autobuilder, still fails:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/bu=
ilders/48/builds/3516" rel=3D"noreferrer" target=3D"_blank">https://autobui=
lder.yoctoproject.org/typhoon/#/builders/48/builds/3516</a><br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; so whatever it is, it is still &quot;live&quot;.<br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; I did some digging. The issue happens when:<br>
&gt; &gt; - host is centos8<br>
&gt; &gt; - SDKMACHINE is i686 (e.g. cmake is 32 bit)<br>
&gt; &gt; <br>
&gt; &gt; Then there&#39;s a failing syscall attempting to set file times:<=
br>
&gt; &gt; utimensat_time64(AT_FDCWD, &quot;../install/usr/local/lib/cmake/a=
ssimp-<br>
&gt; &gt; 4.1/assimp-config.cmake&quot;,<br>
&gt; &gt; [{tv_sec=3D1622966723, tv_nsec=3D6319439026193432576},<br>
&gt; &gt; {tv_sec=3D1622966579, tv_nsec=3D17840053692309438464}], 0) =3D -1=
<br>
&gt; &gt; EINVAL (Invalid argument)<br>
&gt; &gt; <br>
&gt; &gt; On latest Fedora, there&#39;s no issue:<br>
&gt; &gt; utimensat_time64(AT_FDCWD, &quot;../install2/usr/local/lib/cmake/=
assimp-<br>
&gt; &gt; 4.1/assimp-config.cmake&quot;,<br>
&gt; &gt; [{tv_sec=3D1623002886, tv_nsec=3D6369724778172907520},<br>
&gt; &gt; {tv_sec=3D1623002886, tv_nsec=3D17839174083007217664}], 0) =3D 0<=
br>
&gt; &gt; <br>
&gt; &gt; utimensat_time64 only appeared with 5.1 kernels, however, 4.18 sh=
ould<br>
&gt; &gt; be returning ENOSYS in that case<br>
&gt; &gt; probably?<br>
&gt; <br>
&gt; I hacked up a quick test bit of code (which makes assumptions=C2=A0<br=
>
&gt; about 32 bit):<br>
&gt; <br>
&gt; #include &lt;unistd.h&gt;<br>
&gt; #include &lt;sys/syscall.h&gt;<br>
&gt; #include &lt;sys/types.h&gt;<br>
&gt; #include &lt;sys/stat.h&gt;<br>
&gt; #include &lt;fcntl.h&gt;<br>
&gt; #include &lt;stdio.h&gt;<br>
&gt; <br>
&gt; struct timespec64 {<br>
&gt; =C2=A0=C2=A0=C2=A0 long long=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0tv_sec;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* seconds */<b=
r>
&gt; =C2=A0=C2=A0=C2=A0 long long=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0tv_nsec;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* nanoseconds */<br>
&gt; };<br>
&gt; <br>
&gt; int main() {<br>
&gt; =C2=A0 int fd =3D open(&quot;foo&quot;, O_RDWR | O_CREAT, 0644);<br>
&gt; =C2=A0 write(fd, &quot;foo&quot;, 3);<br>
&gt; =C2=A0 struct timespec64 times[2] =3D {};<br>
&gt; =C2=A0 times[0].tv_sec =3D 1622966723;<br>
&gt; =C2=A0 times[0].tv_nsec =3D 631943;<br>
&gt; =C2=A0 times[1].tv_sec =3D 1622966579;<br>
&gt; =C2=A0 times[1].tv_nsec =3D 178400;<br>
&gt; =C2=A0 int rc =3D syscall(SYS_utimensat_time64, fd, NULL, &amp;times[0=
], 0);<br>
&gt; =C2=A0 printf(&quot;rc=3D%d\n&quot;, rc);<br>
&gt; =C2=A0 close(fd);<br>
&gt; =C2=A0 return rc;<br>
&gt; }<br>
&gt; <br>
&gt; built with &quot;gcc -m32 test-syscall.c -o test&quot; and run with &q=
uot;strace<br>
&gt; ./test&quot;.<br>
&gt; This works on all the systems I tried it in. As does:<br>
&gt; <br>
&gt; <br>
&gt; =C2=A0 times[0].tv_sec =3D 1;<br>
&gt; =C2=A0 times[0].tv_nsec =3D 2;<br>
&gt; =C2=A0 times[1].tv_sec =3D 3;<br>
&gt; =C2=A0 times[1].tv_nsec =3D 4;<br>
&gt; <br>
&gt; however if you set (and ignore the compiler warning):<br>
&gt; <br>
&gt; =C2=A0 times[0].tv_sec =3D 1622966723;<br>
&gt; =C2=A0 times[0].tv_nsec =3D 6319439026193432576;<br>
&gt; =C2=A0 times[1].tv_sec =3D 1622966579;<br>
&gt; =C2=A0 times[1].tv_nsec =3D 17840053692309438464;<br>
&gt; <br>
&gt; then you see EINVAL on the centos system but not on my ubuntu one. It<=
br>
&gt; will<br>
&gt; do that until you reduce the values of tv_nsec right now. So it seems<=
br>
&gt; most=C2=A0<br>
&gt; systems accept large tv_nsec values but the Centos one does not.<br>
&gt; <br>
&gt; I think tv_nsec may be being clamped to LONG_MAX of 4 bytes but should=
<br>
&gt; be=C2=A0<br>
&gt; a LONG_LONG_MAX of 8 bytes on a 32 bit since the field is a 64 bit<br>
&gt; long.<br>
&gt; <br>
&gt; Michael: Hopefully that gives you something to raise with them?<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Richard<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#156435): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/156435" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/156435</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/83304703/1003=
190" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/83304703/1003190</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:mhalstead@linuxfoundation.=
org" target=3D"_blank">mhalstead@linuxfoundation.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Michael Halstead<div>Linux Foundation / Yocto Project</di=
v><div>Systems Operations Engineer</div></div></div>
</blockquote></div>

--000000000000fb696305cd8b136e--

