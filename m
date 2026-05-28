Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E7DCD4F54
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 13:31:49 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10920.1779975099975863746
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 06:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1FahOiKJ;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45eedcdaeaaso266405f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 06:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779975098; cv=none;
        d=google.com; s=arc-20240605;
        b=fGlshUml9iLXTlIcfr0Xv+fxRYunNgRQDpkFT3+yM21DCU0+ecHcwuE3Wvyc3OqaTH
         xB73jNTZsptEhQQTvqns+5iLMI79NOLjZiIpTGGYyfFriIzu7Nq4zHIWcpLtScqEJBrI
         lWKM2LM2VPPEf0zWc/5gNDtYrU2uxQZtyin/fQyTqpTFdNRUP6BmUjGT9DJC0XJbe4NC
         f7EaqmRozEYmQu+pO9+ZYBV8SL6ohD/41ZKE0xb6MX3IlxP0hQHNu+f1LHue4ByMHTqS
         YHNLdZG0FKazYHzqtCYFwA4cJGzA+SJghTRy4r8X7NdHP15wbAR0QW8kRtv0pdRWbIoH
         Xlpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oVVaO9DynD+SLRMA0bB+ab8BwZGy8UkzWUVPa0GPRY8=;
        fh=F+utNSA8qcNHT+H28mQQQGtVeQ/pGHiOhDZ/3BAUTJU=;
        b=kqklhnTseXBcnWddEGjfDpcflzUNZ+wSHzJpDwwedlVkkenZ1VfTlmQD4Owr+NbhTY
         B8Tdk47WUHqDAF7/dkGqk/JiosUIvhlZaJPSgfjMX6nV3v0NArGJQS5QskkbLxZdYmPn
         Kee37C4tY8SCnXLtDBrlZfS5eCKRBbCOfMSg1W8nre53/Q0tLNLAP4TAPoNkW/NsiBc1
         uOhGLcx+Ph6QwJVctOq1t31UQNk/I7IAAG4QfEfArbdFrdqkvmtCnW8yAu62Sv/GaLXS
         dhJ0pqdw86HCDZj1RnQa5NFm7pOf9AOjT/o7qIQCCnP7xK9xRuOghHju3ID22khDv47f
         7sEw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779975098; x=1780579898; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oVVaO9DynD+SLRMA0bB+ab8BwZGy8UkzWUVPa0GPRY8=;
        b=1FahOiKJh8iUL/hEnW30o3/EpD8nKeKIfzcms4fkwwbv8aoWuqs9xhC5mJqr61jq02
         Xzi2hWzPdSH18JdovxSe6+qYmfQeynXZ5dj6niWWvXs7gA6ultADeVGDPEoE1C6T8pwR
         Lkv1k4QQOG7wLZnmP8qlJ75ZaerwCWQZTbgkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779975098; x=1780579898;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVVaO9DynD+SLRMA0bB+ab8BwZGy8UkzWUVPa0GPRY8=;
        b=Z9qrHLhBe2rgbV2malmE2dw9VAJGBqPMTjt5Un+tGdymQwUYKgfA8b204QcxEc/qlY
         HwPGwl8utQ+R/GEhpiascfZ2WRUAQO3Pr8UQ09IudsS9llH/9qSb++AOHU1yIHAnxzP7
         vtiyedHhjsYPIFF2WHh/kNZuGXuAcxhjibIk9x9sVlUPeaER39/JbdoKKmizQWUd5fAB
         Lz9+J6GQpVhmaxAnm1pb6am5E5yzh1kPfs7NGFiWN3hRGCevlXXEDNzONXkS5YPNyQOY
         gRBwMyK25TtCxbA4wLm6MRJznIiEym8V6E9ru4mPF+UBDeV7RlpUsTdlBfp0zpckRBhm
         j8/g==
X-Forwarded-Encrypted: i=1; AFNElJ+05qDY6MVVHZt0qLd/LVSSJEsWotCQhlm77UIGHY6Ft2XlF1swWFwN1jrL+vK7RhYMR3Ws9HA8mw6jUoKqgB2feA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz2TtE/2r0wYkK6gUeD3kyYHKgdjtG66z5QTLlk7adJbJ89Z2Ch
	M07ZLKqHsQEaYw+f+0BxAopkDCJQqfeC+pryOnImRmFWIWrNk1ONTc6Xdu98m2IX/IdmoXepW+o
	Dc4wmO0NQsSvawANIAqGIXFkmPXFwmu50YDdcGxGGYQ==
X-Gm-Gg: Acq92OFqxrCEWDpkmZvLJNEZe0wGDxbDjrBYflA1yULp0yc7nVjvQdlgba07ZSFsGbz
	HqeFNJw0u+uukXXFPRwEWwE0zu4AkmKfCSZ4TVoxNx7m2U3rLcnKihNEs+eIt3GWbCdu7foqTKU
	Xnn+0Z4BREGmZJp5ecL1CeW5cu8H/hqLW2MJGfZU1rVPioSPvBIeyFW9Atq7o8qN4F2fxk99RM1
	wnKXQ+VqOh05+NgqblfRYdWf1T0S7OlcoXkyjB9kYQFTWm4CA34AYCLCbE3vX6GzfJ7u6IFF/vH
	1d8xTti4KQ/DM0es5TnJFdDo22r8aq+ufmjjD2Xgf8EWTO4OarE=
X-Received: by 2002:a05:600c:4e14:b0:490:5cb3:e936 with SMTP id
 5b1f17b1804b1-4905cb3eb00mr363817985e9.4.1779975098022; Thu, 28 May 2026
 06:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260528023714.4026613-1-bruce.ashfield@gmail.com>
 <ea78d370348fbc117e23085ae59791fce6c0b404.camel@linuxfoundation.org> <CADkTA4NYJckE+4eLF2ucrK8h6iDipAt-ynCsVXWYfrOAQSRzhw@mail.gmail.com>
In-Reply-To: <CADkTA4NYJckE+4eLF2ucrK8h6iDipAt-ynCsVXWYfrOAQSRzhw@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 28 May 2026 15:31:11 +0200
X-Gm-Features: AVHnY4LO6rEUy0o32tueMVgJm_xbZ3_eIKgh_v82lOnPom_H1VmLTWtNk8izfBY
Message-ID: <CAMSfU+4SYvgPaokKsPN9CnRbK5C5858Xcy661JG2PzvYGCZskg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/7] linux-yocto: consolidated pull request
To: bruce.ashfield@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006d54500652e0bf7e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 13:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237709

--0000000000006d54500652e0bf7e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 28 mai 2026 =C3=A0 15:25, Bruce Ashfield via lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

>
>
> On Thu, May 28, 2026 at 9:00=E2=80=AFAM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> Hi Bruce,
>>
>> On Wed, 2026-05-27 at 22:37 -0400, bruce.ashfield@gmail.com wrote:
>> > Here's the latest -stable bumps for OEcore and yocto-bsps (again,
>> > let me know if the combined pull causes issues).
>> >
>> > I've also moved the dev kernel to v7.1 and fixed lttng-modules
>> > along the way. Hopefully a new point release will be available soon
>> > and we can quickly drop the backported patches.
>> >
>> > Also note that since ross removed the CVE exclusions .inc file in
>> > a patch (which I think is still pending), I haven't updated the
>> > exclusions for the kernel in this series.
>>
>> Thanks for these. I put them in for testing and there are two weird
>> failures:
>>
>> qemuarm64 musl python3 ptest:
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/460
>>
>> which leads to:
>>
>>
>> https://valkyrie.yocto.io/pub/non-release/20260528-74/testresults/qemuar=
m64-musl-ptest/python3.log
>
>
I recognize https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16182 in th=
is
failure.
More detail in our bug but the gist is that there is an unresolved upstream
bug :
`test_tracemalloc_track_race` segfault on buildbot =C2=B7 Issue #143143 =C2=
=B7
python/cpython
https://github.com/python/cpython/issues/143143


>
>>
>> test_tracemalloc_track_race
>> (test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race) ... Fatal
>> Python error: Segmentation fault
>>
>> qemux86-64 musl libc-test ptest failure:
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/444
>>
>> which failed in functional_ipc_shm
>>
>>
>> https://valkyrie.yocto.io/pub/non-release/20260528-74/testresults/qemux8=
6-64-musl-ptest/libc-test.log
>>
>> FAIL src/functional/ipc_shm.exe [status 1]
>>
>> --- ptest result ---
>> FAIL: functional_ipc_shm
>>
>>
>> I'll rerun the tests, it is possible this is some weird intermittent
>> issue, I just can't tell :(
>>
>
> ack'd. I also took another look at the changelogs and don't see anything
> that looks obvious or makes
> me think it isn't a race.
>
> test_tracemalloc_track_race segfault (qemuarm64-musl)
>   - v6.18.32 =E2=86=92 .33 has 55 mm/kernel commits, including 1dcd36420a=
f2 futex:
> Drop CLONE_THREAD
>     requirement for private default hash alloc and several sched/fair
> tweaks that affect timing
>
> That  could nudge a race test toward a fail, if the test was flaky before=
.
>
> functional_ipc_shm (qemux86-64-musl libc-test)
>   - No ipc/ changes in v6.18.32 =E2=86=92 .33. Kernel-side SysV shm code =
is
> untouched.
>   - A quick search found me a few hits on.libc-test's ipc_shm has what
> looks like known intermittent
>    issues in some emulated arch + c library combox
>
> I can try a bisect between  .32 and .33 if we get it to happen again, I'l=
l
> get setup for testing in case
> it does fail again or becomes a common intermittent issue.
>
> bruce
>
>
>>
>> Cheers,
>>
>> Richard
>>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#237708):
> https://lists.openembedded.org/g/openembedded-core/message/237708
> Mute This Topic: https://lists.openembedded.org/mt/119524504/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000006d54500652e0bf7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 28=
 mai 2026 =C3=A0=C2=A015:25, Bruce Ashfield via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;bruce.ashfield=3D<a href=3D"m=
ailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a=
>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"=
><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu, May 28, 2026 at 9:00=E2=80=AFAM Richard Purdie &lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Hi Bruce,<br>
<br>
On Wed, 2026-05-27 at 22:37 -0400, <a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a> wrote:<br>
&gt; Here&#39;s the latest -stable bumps for OEcore and yocto-bsps (again,<=
br>
&gt; let me know if the combined pull causes issues).<br>
&gt; <br>
&gt; I&#39;ve also moved the dev kernel to v7.1 and fixed lttng-modules<br>
&gt; along the way. Hopefully a new point release will be available soon<br=
>
&gt; and we can quickly drop the backported patches.<br>
&gt; <br>
&gt; Also note that since ross removed the CVE exclusions .inc file in<br>
&gt; a patch (which I think is still pending), I haven&#39;t updated the<br=
>
&gt; exclusions for the kernel in this series.<br>
<br>
Thanks for these. I put them in for testing and there are two weird failure=
s:<br>
<br>
qemuarm64 musl python3 ptest:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/bui=
lds/460" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/109/builds/460</a><br>
<br>
which leads to:<br>
<br>
<a href=3D"https://valkyrie.yocto.io/pub/non-release/20260528-74/testresult=
s/qemuarm64-musl-ptest/python3.log" rel=3D"noreferrer" target=3D"_blank">ht=
tps://valkyrie.yocto.io/pub/non-release/20260528-74/testresults/qemuarm64-m=
usl-ptest/python3.log</a></blockquote></div></div></blockquote><div><br></d=
iv><div>I recognize=C2=A0<a href=3D"https://bugzilla.yoctoproject.org/show_=
bug.cgi?id=3D16182">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D161=
82</a> in this failure.</div><div>More detail in our bug but the gist is th=
at there is an unresolved upstream bug :</div><div>`test_tracemalloc_track_=
race` segfault on buildbot =C2=B7 Issue #143143 =C2=B7 python/cpython<br><a=
 href=3D"https://github.com/python/cpython/issues/143143">https://github.co=
m/python/cpython/issues/143143</a></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
test_tracemalloc_track_race (test.test_tracemalloc.TestCAPI.test_tracemallo=
c_track_race) ... Fatal Python error: Segmentation fault<br>
<br>
qemux86-64 musl libc-test ptest failure:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/bui=
lds/444" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/110/builds/444</a><br>
<br>
which failed in functional_ipc_shm<br>
<br>
<a href=3D"https://valkyrie.yocto.io/pub/non-release/20260528-74/testresult=
s/qemux86-64-musl-ptest/libc-test.log" rel=3D"noreferrer" target=3D"_blank"=
>https://valkyrie.yocto.io/pub/non-release/20260528-74/testresults/qemux86-=
64-musl-ptest/libc-test.log</a><br>
<br>
FAIL src/functional/ipc_shm.exe [status 1]<br>
<br>
--- ptest result ---<br>
FAIL: functional_ipc_shm<br>
<br>
<br>
I&#39;ll rerun the tests, it is possible this is some weird intermittent<br=
>
issue, I just can&#39;t tell :(<br></blockquote><div><br></div><div><div st=
yle=3D"font-size:small">ack&#39;d. I also took another look at the changelo=
gs and don&#39;t see anything that looks obvious or makes</div><div style=
=3D"font-size:small">me think it isn&#39;t a race.<br><br>test_tracemalloc_=
track_race segfault (qemuarm64-musl)<br>=C2=A0 - v6.18.32 =E2=86=92 .33 has=
 55 mm/kernel commits, including 1dcd36420af2 futex: Drop CLONE_THREAD=C2=
=A0</div><div style=3D"font-size:small">=C2=A0 =C2=A0 requirement for priva=
te default hash alloc and several sched/fair tweaks that affect timing=C2=
=A0</div><div style=3D"font-size:small"><br></div><div style=3D"font-size:s=
mall">That=C2=A0 could nudge a race test toward a fail, if the test was fla=
ky before.<br><br>functional_ipc_shm (qemux86-64-musl libc-test)<br>=C2=A0 =
- No ipc/ changes in v6.18.32 =E2=86=92 .33. Kernel-side SysV shm code is u=
ntouched.<br>=C2=A0 - A quick search found me a few hits on.libc-test&#39;s=
 ipc_shm has what looks like known intermittent=C2=A0</div><div style=3D"fo=
nt-size:small">=C2=A0 =C2=A0issues in some emulated arch + c library combox=
</div><div style=3D"font-size:small"><br>I can try a bisect between=C2=A0 .=
32 and .33 if we get it to happen again, I&#39;ll get setup for testing in =
case</div><div style=3D"font-size:small">it does fail again or becomes a co=
mmon intermittent=C2=A0issue.</div><div style=3D"font-size:small"><br></div=
><div style=3D"font-size:small">bruce</div><div style=3D"font-size:small">=
=C2=A0</div></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#237708): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/237708" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/237708</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119524504/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119524504/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000006d54500652e0bf7e--

