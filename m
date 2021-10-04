Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F13FC433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 16:27:22 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web09.12125.1633364840679405846
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 09:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N6g9RsGY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.48,
 mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lf1-f48.google.com with SMTP id x27so73427018lfa.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 09:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EKdGJ7m9m+5pB0gCgqzFJ20f78R7j5EGwgeNJrxHe0c=;
        b=N6g9RsGYh9LrdM6KEPw/1Uf2RgifoYUikjMqgrNnIVIiENAKP38fq+iDNgKpTe3Njd
         UKnVhI71U4gkoSYMVdxcqHeaUfPMOGERRxzCUzj8C9j9zwB7YPxSjqElte14Gkr6VLtK
         hfIYT87IB3xEgDo5Yv1uUr7B4DlmicPGqARBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EKdGJ7m9m+5pB0gCgqzFJ20f78R7j5EGwgeNJrxHe0c=;
        b=aCkClRVGETXzYU71e47UjhuxJ89yiPa+TJk3Spk0cVqyPUbE4rFnJV8LRbbW32/uO6
         K13n2ir9Adfe6Kh9GGVqUdDy5q+JY4lixC+JdUspUHOX6bUvF+0Nu98R8YhlOe5h5OnO
         eZfVPqIUdgMB0I+FBzpMK3phL9Q//tG8BxVAS9GL1rotGig8fviPWWQ7WAz3qLQ7cXup
         fcz+dvX7fIcBEHmK8ZyihQSCtibdgkr9vnyiLBNvGeo64QWL+fUxrqUcfihkzSZ0VHPC
         f5PGEE2e1oScbtlSjVV+YJVXXchJ6d3zGJvKbtCAPd9elIQi7n29broRJO6jpQMI39jA
         UB1g==
X-Gm-Message-State: AOAM533X5cBtQGNGLjFSYcma5UwIR8ur/bbvElkXZ+TWTymRULwRM5gd
	xVCGCA2bw+NoY3O05kaKHYm/C79OJ80rLFloo/Mu9Q==
X-Google-Smtp-Source: 
 ABdhPJzpQ03np8lFJPsqDHU4p5ZUIVjP6tbikWvr4lhwRK+JqBIJdaA/X5ccutPrNjbl2aODCmoFF8DtRyrZcD91rTI=
X-Received: by 2002:a19:7701:: with SMTP id s1mr15649032lfc.592.1633364838496;
 Mon, 04 Oct 2021 09:27:18 -0700 (PDT)
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
In-Reply-To: <ae52185ed604614ff00bee7606b704e6c065107f.camel@intel.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Mon, 4 Oct 2021 09:27:06 -0700
Message-ID: 
 <CADfgfobgqkfyp3GLMqJbe-T18Rdf0FYdUpVBWcU2+wkVhfMKSw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fcd04605cd8962d8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 16:27:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156614

--000000000000fcd04605cd8962d8
Content-Type: text/plain; charset="UTF-8"

This error was fixed upstream
https://bugzilla.redhat.com/show_bug.cgi?id=1975562 kernel 4.18.0-325.x
which has landed in CentOS8 Stream on centos8-ty-2 but not plain CentOS8
where the newest kernel is still at 4.18.0-305.x.

I'll reboot into the older 4.18.0-240.15 kernel again on centos8-ty-1 as a
fix for now.

On Tue, Sep 28, 2021 at 6:12 PM Anuj Mittal <anuj.mittal@intel.com> wrote:

> Did we find out the reason why this was happening? I have started
> getting this error on Centos-8 while building hardknott.
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/4045
>
> Thanks,
>
> Anuj
>
> On Wed, 2021-06-16 at 23:45 +0100, Richard Purdie wrote:
> > On Sun, 2021-06-06 at 21:51 +0200, Alexander Kanavin wrote:
> > > On Sun, 6 Jun 2021 at 01:10, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > I tried again with the autobuilder, still fails:
> > > >
> > > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/3516
> > > >
> > > > so whatever it is, it is still "live".
> > > >
> > >
> > >
> > > I did some digging. The issue happens when:
> > > - host is centos8
> > > - SDKMACHINE is i686 (e.g. cmake is 32 bit)
> > >
> > > Then there's a failing syscall attempting to set file times:
> > > utimensat_time64(AT_FDCWD, "../install/usr/local/lib/cmake/assimp-
> > > 4.1/assimp-config.cmake",
> > > [{tv_sec=1622966723, tv_nsec=6319439026193432576},
> > > {tv_sec=1622966579, tv_nsec=17840053692309438464}], 0) = -1
> > > EINVAL (Invalid argument)
> > >
> > > On latest Fedora, there's no issue:
> > > utimensat_time64(AT_FDCWD, "../install2/usr/local/lib/cmake/assimp-
> > > 4.1/assimp-config.cmake",
> > > [{tv_sec=1623002886, tv_nsec=6369724778172907520},
> > > {tv_sec=1623002886, tv_nsec=17839174083007217664}], 0) = 0
> > >
> > > utimensat_time64 only appeared with 5.1 kernels, however, 4.18 should
> > > be returning ENOSYS in that case
> > > probably?
> >
> > I hacked up a quick test bit of code (which makes assumptions
> > about 32 bit):
> >
> > #include <unistd.h>
> > #include <sys/syscall.h>
> > #include <sys/types.h>
> > #include <sys/stat.h>
> > #include <fcntl.h>
> > #include <stdio.h>
> >
> > struct timespec64 {
> >     long long           tv_sec;                 /* seconds */
> >     long long           tv_nsec;                /* nanoseconds */
> > };
> >
> > int main() {
> >   int fd = open("foo", O_RDWR | O_CREAT, 0644);
> >   write(fd, "foo", 3);
> >   struct timespec64 times[2] = {};
> >   times[0].tv_sec = 1622966723;
> >   times[0].tv_nsec = 631943;
> >   times[1].tv_sec = 1622966579;
> >   times[1].tv_nsec = 178400;
> >   int rc = syscall(SYS_utimensat_time64, fd, NULL, &times[0], 0);
> >   printf("rc=%d\n", rc);
> >   close(fd);
> >   return rc;
> > }
> >
> > built with "gcc -m32 test-syscall.c -o test" and run with "strace
> > ./test".
> > This works on all the systems I tried it in. As does:
> >
> >
> >   times[0].tv_sec = 1;
> >   times[0].tv_nsec = 2;
> >   times[1].tv_sec = 3;
> >   times[1].tv_nsec = 4;
> >
> > however if you set (and ignore the compiler warning):
> >
> >   times[0].tv_sec = 1622966723;
> >   times[0].tv_nsec = 6319439026193432576;
> >   times[1].tv_sec = 1622966579;
> >   times[1].tv_nsec = 17840053692309438464;
> >
> > then you see EINVAL on the centos system but not on my ubuntu one. It
> > will
> > do that until you reduce the values of tv_nsec right now. So it seems
> > most
> > systems accept large tv_nsec values but the Centos one does not.
> >
> > I think tv_nsec may be being clamped to LONG_MAX of 4 bytes but should
> > be
> > a LONG_LONG_MAX of 8 bytes on a 32 bit since the field is a 64 bit
> > long.
> >
> > Michael: Hopefully that gives you something to raise with them?
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> >
> >
> >
> >
> >
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156435):
> https://lists.openembedded.org/g/openembedded-core/message/156435
> Mute This Topic: https://lists.openembedded.org/mt/83304703/1003190
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> mhalstead@linuxfoundation.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

-- 
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--000000000000fcd04605cd8962d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This error was fixed upstream=C2=A0<a href=3D"https://bugz=
illa.redhat.com/show_bug.cgi?id=3D1975562">https://bugzilla.redhat.com/show=
_bug.cgi?id=3D1975562</a> kernel 4.18.0-325.x which has landed in CentOS8 S=
tream on centos8-ty-2 but not plain CentOS8 where the newest kernel is stil=
l at=C2=A04.18.0-305.x.<div><br></div><div>I&#39;ll reboot into the older=
=C2=A04.18.0-240.15 kernel again on centos8-ty-1 as a fix for now.=C2=A0</d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue, Sep 28, 2021 at 6:12 PM Anuj Mittal &lt;<a href=3D"mailto:anuj.m=
ittal@intel.com">anuj.mittal@intel.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Did we find out the reason why this w=
as happening? I have started<br>
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
 class=3D"gmail_signature"><div dir=3D"ltr">Michael Halstead<div>Linux Foun=
dation / Yocto Project</div><div>Systems Operations Engineer</div></div></d=
iv>

--000000000000fcd04605cd8962d8--

