Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F4BE10F3DC9
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 02:39:54 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4335.1774665589695313187
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 19:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=D0SPrNBV;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64eaf8aa893so2923589d50.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 19:39:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774665589; cv=none;
        d=google.com; s=arc-20240605;
        b=gi31pyZehqypI/tkmxcklLbzEApJGD2znU1u8duvUJg5gdYZtCDAEhnEDKf/3ZH1Yl
         lWrNknbhg9XgwdCRBrjVFiEfx80uO+wqGzxBEF/WOKtJY9Gbm9IaTYbbXyw5m0KOhHdn
         JxISmc4h23HAa5a3Z2jrIfmUcbTFj46/Kt0uFNBVWTSG0FY06wlmBmAhvYN8634d7itt
         TmBDXBhud9KcEeCnoZUX7vipfqLaEMfbc4MyOPGA0yjOQd0YLrveeXsFM/QAOSiQka+B
         Ca0jbmzM6hxyc1yhfQpMCPx22kXv2cBTgaC1oLkmALGkCAhNJ9PYEY9d6BXNri7nSG4z
         QaGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3tLWpK9fduDe6lzCQtADDLUxzJOr/dwaGqH+I422BRM=;
        fh=TGF7TVa5Eshw5M6K2XLmjdIMKFhrsPaliuC+tv7wzuY=;
        b=av9rONL4TN/r3SVKUjsE8YLNdiKA+Nbnn1tiNLJ74XRJoTvCDWKOeAiu65IU8KEUVr
         G/Fr/MDYPgoUTHEaYUFMZwsVEvg7G3bVl47wfJuLvbFf1r3WsZEI8ibMQ5Kyq31JOa8y
         NYPhNhMv8go8A1iidT+nv+1LkJAFM0vtl24LtFLmztiGx4dnOIzHbCiyQGH4hko/+CKd
         SWUHyKrv8Xutt7w/+RZG/JpW3++4mAszvFCXIIpy4waMm14X0Hofwn9U3otdJ+UAIXgq
         W1Ia2A/GtzvPkR0buJviFJURpzFLAlk6B8E4bL0QqWjbzoK0glGsvPRJPNQsB/68MsLg
         lOYA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774665589; x=1775270389; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3tLWpK9fduDe6lzCQtADDLUxzJOr/dwaGqH+I422BRM=;
        b=D0SPrNBVP1RzYmfV1cjrH0ji9Bkf/gSTL/bz0RKkq4Yv0tj1xbmzg5NhlvCr319MJi
         qVLRnElV9Vpz552kBq8wZE0dNgUsRGsXqAzPOFcIPiEEdH3wcO5/nEKfePYgZEhP6RjP
         yko7S4leq2dY749Dm9Cli7Wd/hYIKQ8EzIriABxYNQ01uI0w0Jab4JEgkcVhv4hU+GaM
         45Z6TLnduMj8wjQ9nD9fymDTInJMDhiSLeN6fxv8OE9qydbLRIM3wDv7j4yweeFZpQDb
         2A75TkMYUX3J3f2PmIDM8n5KHKA7jn3HQmWIugrbLN4JOTQcxHx27h53+bTw9N65bwGx
         tQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774665589; x=1775270389;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3tLWpK9fduDe6lzCQtADDLUxzJOr/dwaGqH+I422BRM=;
        b=WZIWBBUCM8iYArdkJ48CJuW2f4Y1qLxWu25BfO+82PT1JJ0qXNhbFMblU5tjFMF3PL
         PKikM+nodc8xQNlxp5UhJMJ2UuZn4gwhlZNaw9YO10cvSAH5eseMSRmfRxgMFx65TAxd
         C0zRcchsNFpqULLFqDnoMK5QM9na3YA4JvVREeMXRU9O7IL655Wh+BYdQwbu2hql0X7z
         2spsA5CHCm2W1Xmd7POR7YulKWcMf9UAqXgWvYtIfvQde1qAEHIxOmKonoIwcBPxYMd6
         ghAyEm+vwb8IASDQ5RYijkm6KwICSGLKtEmCYd55u6iWree7eQpQDyiz/0o7K+ByElsp
         /HiA==
X-Gm-Message-State: AOJu0Yz7eITBOF9xUo8CvBzLfqslGr0RIoi/mDqjUpQDrX0gZcJB3fsj
	coUYR1L/6xspuuzP1yUZ/SWqcO4MwZaZTLmjd3uAO7EGSsyVcU+IHrfHNcj59EhIAn7Bh5kNkqQ
	J5OcILa9ayvRV9nhRf7sbRqMzR2zJ7AhdBniEAn0=
X-Gm-Gg: ATEYQzytG5ZDlaDPUxYKMZMsPbVCXVRY7cVQfCjiKwAf0UAGRQyeIlotIao3rkIuYCu
	terVJhjze3kSl4HoQKMAAOXIIMBCaEdVUq0WBq4idagKPgzQHrgDnX38Z3rbUvugBCMzFZ7x+i8
	WMmAXa2UzOCkcKrV3g4vsuy3xpKclY9YzTF+kZRR8WkT/HrMHEwZvwdt7zOtzLmyY71omdzB2Xo
	MAojDGnzcW9TrmjPA2JriC8ZVIrOO+TTgiPWALp3BWz2HIwR4zEKGAYs7NBfgGZ1NmaW79rY/BZ
	XW+279myJRiRFToE2VyRX5z7RvDj5x2Ikjl3ky8Ics1yrkZcVzvN8c2i/BeU00Z6CraSYXdwUt9
	Z1NDGjyVtkgdDKRDiVaBJKvcvAendDCUbgXw=
X-Received: by 2002:a05:690e:43cd:b0:64a:ee12:e7c3 with SMTP id
 956f58d0204a3-64ff73bb9d3mr3862795d50.49.1774665588712; Fri, 27 Mar 2026
 19:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260326151641.3974221-1-khem.raj@oss.qualcomm.com>
 <DHDI32YKJSSP.MH33L7GOJJ1Q@bootlin.com> <CAMKF1soKLkhMZNSHTzrTcX8qSQYgFz20NgAzjN-ResCgG=Dg1g@mail.gmail.com>
In-Reply-To: <CAMKF1soKLkhMZNSHTzrTcX8qSQYgFz20NgAzjN-ResCgG=Dg1g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Mar 2026 19:39:21 -0700
X-Gm-Features: AQROBzDo7x6xU_FISagSI997cxmHTeh_ear0V6DJa3KSnCSBtla63ksnNDaq_QY
Message-ID: <CAMKF1sorE-KOXvC+n4RtcdU8S6nzcGiE1knTg==8+d3fX0SxSw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/7] clang/llvm: Upgrade to 22.x major release
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000002a95a064e0c88d1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 02:39:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234115

--00000000000002a95a064e0c88d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu

I have pushed another change to address install-but-unpackaged QA warning
since the last fix. Please pick up the branch again if you have done it
after my last message.

qemux86-world is green with this change see

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3494

On Fri, Mar 27, 2026 at 11:00=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:

>
>
> On Fri, Mar 27, 2026 at 3:42=E2=80=AFAM Mathieu Dubois-Briand <
> mathieu.dubois-briand@bootlin.com> wrote:
>
>> On Thu Mar 26, 2026 at 4:16 PM CET, Khem Raj via lists.openembedded.org
>> wrote:
>> > From: Khem Raj <raj.khem@gmail.com>
>> >
>> > Includes support for new Intel (Wildcat Lake, Nova Lake with APX and
>> AVX10.2)
>> > Arm (C1 Nano, Pro, Premium, Ultra) processors. It also features
>> performance
>> > optimizations for AMD Zen 4 and Zen 5 architectures.
>> >
>> > Integrated Distributed ThinLTO is more mature, with enhancements
>> > like cache support for incremental builds and robust handling of
>> temporary artifacts.
>> >
>> > LLDB added first-class WebAssembly debugging support, including
>> breakpoints and variable inspection.
>> >
>> > Support for Google Native Client (NaCl) is dropped in this release.
>> >
>> > Detailed ChangeLog [1]
>> >
>> > [1] https://releases.llvm.org/22.1.0/docs/ReleaseNotes.html
>> >
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>>
>> Hi Khem,
>>
>> This looks better, but we still have one issue:
>>
>> ERROR: clang-22.1.2-r0 do_compile: Execution of
>> '/srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-64-v=
3-poky-linux/clang/22.1.2/temp/run.do_compile.573061'
>> failed with exit code 1
>> ...
>> Log data follows:
>> | DEBUG: Executing shell function do_compile
>> | NOTE: VERBOSE=3D1 cmake --build
>> /srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-64-v3=
-poky-linux/clang/22.1.2/build
>> --target all --
>> | Change Dir:
>> '/srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-64-v=
3-poky-linux/clang/22.1.2/build'
>> |
>> | Run Build Command(s): ninja -v -j 16 all
>> | ninja: error:
>> '/srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work-shared/l=
lvm-project-source-22.1.2-r0/sources/llvm-project-22.1.2.src/clang/tools/sc=
an-build-py/lib64/libscanbuild/__init__.py',
>> needed by 'lib64/libscanbuild/__init__.py', missing and no known rule to
>> make it
>> |
>> | WARNING: exit code 1 from a shell command.
>> NOTE: recipe clang-22.1.2-r0: task do_compile: Failed
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3485
>>
>>
> This is caught with x86_64 because libdir is lib64 in multilib mode. The
> issue was in the clangscan patch where it was
> changing rules to look for sourcefiles also in mulilib libdir. I have
> fixed it and updated the patchset here in a branch on top of master
>
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/clan=
g-22
>
> my local builds are seeming ok. I have also started an AB build here, its
> still running
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3492
>
>
>
>
>> Thanks,
>> Mathieu
>>
>> --
>> Mathieu Dubois-Briand, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>>

--00000000000002a95a064e0c88d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Mathieu<div><br></div><div>I have pushed another change=
 to address install-but-unpackaged QA warning since the last fix. Please pi=
ck up the branch again if you have done it after my last message.</div><div=
><br></div><div>qemux86-world is green with this change see</div><div><br><=
/div><div><a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builde=
rs/59/builds/3494">https://autobuilder.yoctoproject.org/valkyrie/#/builders=
/59/builds/3494</a></div></div><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 27, 2026 at 11:0=
0=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 27, 2026 at 3:42=
=E2=80=AFAM Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-bria=
nd@bootlin.com" target=3D"_blank">mathieu.dubois-briand@bootlin.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu M=
ar 26, 2026 at 4:16 PM CET, Khem Raj via <a href=3D"http://lists.openembedd=
ed.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wro=
te:<br>
&gt; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Includes support for new Intel (Wildcat Lake, Nova Lake with APX and A=
VX10.2)<br>
&gt; Arm (C1 Nano, Pro, Premium, Ultra) processors. It also features perfor=
mance<br>
&gt; optimizations for AMD Zen 4 and Zen 5 architectures.<br>
&gt;<br>
&gt; Integrated Distributed ThinLTO is more mature, with enhancements<br>
&gt; like cache support for incremental builds and robust handling of tempo=
rary artifacts.<br>
&gt;<br>
&gt; LLDB added first-class WebAssembly debugging support, including breakp=
oints and variable inspection.<br>
&gt;<br>
&gt; Support for Google Native Client (NaCl) is dropped in this release.<br=
>
&gt;<br>
&gt; Detailed ChangeLog [1]<br>
&gt;<br>
&gt; [1] <a href=3D"https://releases.llvm.org/22.1.0/docs/ReleaseNotes.html=
" rel=3D"noreferrer" target=3D"_blank">https://releases.llvm.org/22.1.0/doc=
s/ReleaseNotes.html</a><br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Khem,<br>
<br>
This looks better, but we still have one issue:<br>
<br>
ERROR: clang-22.1.2-r0 do_compile: Execution of &#39;/srv/pokybuild/yocto-w=
orker/qemux86-world/build/build/tmp/work/x86-64-v3-poky-linux/clang/22.1.2/=
temp/run.do_compile.573061&#39; failed with exit code 1<br>
...<br>
Log data follows:<br>
| DEBUG: Executing shell function do_compile<br>
| NOTE: VERBOSE=3D1 cmake --build /srv/pokybuild/yocto-worker/qemux86-world=
/build/build/tmp/work/x86-64-v3-poky-linux/clang/22.1.2/build --target all =
--<br>
| Change Dir: &#39;/srv/pokybuild/yocto-worker/qemux86-world/build/build/tm=
p/work/x86-64-v3-poky-linux/clang/22.1.2/build&#39;<br>
|<br>
| Run Build Command(s): ninja -v -j 16 all<br>
| ninja: error: &#39;/srv/pokybuild/yocto-worker/qemux86-world/build/build/=
tmp/work-shared/llvm-project-source-22.1.2-r0/sources/llvm-project-22.1.2.s=
rc/clang/tools/scan-build-py/lib64/libscanbuild/__init__.py&#39;, needed by=
 &#39;lib64/libscanbuild/__init__.py&#39;, missing and no known rule to mak=
e it<br>
|<br>
| WARNING: exit code 1 from a shell command.<br>
NOTE: recipe clang-22.1.2-r0: task do_compile: Failed<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/buil=
ds/3485" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/59/builds/3485</a><br>
<br></blockquote><div><br></div><div>This is caught with x86_64 because lib=
dir is lib64 in multilib mode. The issue was in the clangscan patch where i=
t was</div><div>changing rules to look for sourcefiles also in mulilib=C2=
=A0libdir. I have fixed it and updated the patchset here in a branch on top=
 of master</div><div><br></div><div><a href=3D"https://git.openembedded.org=
/openembedded-core-contrib/log/?h=3Dkraj/clang-22" target=3D"_blank">https:=
//git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/clang-22</a>=
</div><div><br></div><div>my local builds are seeming ok. I have also start=
ed an AB build here, its still running</div><div><br></div><div><a href=3D"=
https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3492" ta=
rget=3D"_blank">https://autobuilder.yoctoproject.org/valkyrie/#/builders/59=
/builds/3492</a></div><div><br></div><div><br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>
</blockquote></div>

--00000000000002a95a064e0c88d1--

