Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD86CD6E44
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 13:25:39 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10937.1779974736645275727
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 06:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NH/Vq2L0;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-367cbac9c37so7620866a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 06:25:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779974736; cv=none;
        d=google.com; s=arc-20240605;
        b=dOPrrHiyrobjDwFyhkFRGPKlLEO1+IrMIwzOSJiNUGMalH4f0Sujfgq/XaamYorGVm
         6ER4Z0i71ZcMCBOM2Ac2cS2ad5W8fqjbVBiS6lj8Wa0uJiCZdgov5JkgOxs4SsauHt6M
         S64xFBVCHNXu3mpgkCGirioPvLGafFOPuY7HdlEV9jKJfHEG3CHEq3wJYMrdcOdGcCZM
         MMrLLlQecgvG1kYWYIOvIcjcCN6tKWM/1FEsbBoKEvImKvTdQkPkmVAaxmp/tR05Mm0z
         RXtuUTlgJiDEHwkbU5ZaLZBxuVBdFCM0pEn9sb4MH07yalSyo31IYsyl3KSNgqKz6tAv
         Q95A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=56KkIaLRVzMvGO3mS5FqpTeIFcRXNKeuZQAp8q78XNI=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=QGtwqgXbM98bYfWl2ZLy2D6kAuFcQ9y5+5oS4rzE5NSY/tW+rB5wBL96J9njxbm3cU
         ldEitQWaZxrWSqbq5RYuJGjd5cWaRPw82PZUrFg0OiXMCYdwPz93dXYO6kjLPhJbh8DA
         dEhdRMwHXn45eRI7qo5AWCY0XGD/lSYB14xwWCI37mw820+RFXJ6Z8uWZ+x0oicVgKHD
         e3Psn5hWZLFfazJoo+JN4tcO9VT5TrHoWb/3aymcMLO4JqLOpjACi8PjV0qGOcFhBN69
         SVd8qxKzKWEHsADR2m1LFaIcHC3CB5iWMqICep1DEXSic4f2f+JGGamhEYyOjPFbhUGW
         hCZg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779974736; x=1780579536; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=56KkIaLRVzMvGO3mS5FqpTeIFcRXNKeuZQAp8q78XNI=;
        b=NH/Vq2L0c86+0mgO8mxeUXLnB5bCUaEhbK+z3dd5nBmJ8eIhAZlMeB2g0R3p1Fs8oS
         YLkMKDt8Xw6I7m5YHk37EkqJ8jdmJjqgiDq+JL9DRdwicXqRf0dQySyEXOvgPhxG3I9s
         3nXxj9IFAjy/E4m/KuEgUTjsDHSvG2e7O0zRVHT8du7UNP0abhzBTbL9QpUzoqzxKOg5
         Njs4nCZiNtIaH9JtTFbhvALUwdss8FUKWBltTgUmOxzk2/orgOxks9OBVjOxpTZQGnmd
         SmDwxMbAr2wooseDdzpVi45+W+sQKpvmNoGRup3wHor9K7dEyckdCjgR2RJkakc4ZqaZ
         9F/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779974736; x=1780579536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56KkIaLRVzMvGO3mS5FqpTeIFcRXNKeuZQAp8q78XNI=;
        b=m7Ta5kmNpqaKm6WJKFppuoDqYmmxJ1ZGGsv69scWZ9SEZYBZVCyjdinzmRlkaf8xTs
         rWY4CTw25x+XmxxqaPHiQVLc0h7fPVuNYmtNpAoGuhkN4AUhPESfjLmDHrtlzkzN2FkO
         9AmQ09xhKG/0aAZGC9ucgmO5C2y72cFigMR97UPpZqdxF+8gYWpMz7vUMFC8UQjEBDOG
         Mh5dNg72z/tWXRrDVRqS7Uh9UwW9oUfWKQxdrhJX73te6J1op9HmEfEDJhYFzXnbT04f
         ptrXAiogAZOEjcJ6g1Ipswc4sTFsocDo16qY9zweuEbpCESprstVqVDlI+VM7CrLFCeF
         P+cQ==
X-Gm-Message-State: AOJu0YyK6NQnSB7ZzFd654jEhDCpjuURwhQYETfmOnQEJ6fEEoXubXEZ
	4QMb+sMC3lihIUWT1k9gk3NJ+dqjkCHdz6o5K0+PqXM7wSbRjR2OxX0n+iU8j4QASHte7FxO8N2
	k+Oktbg1aZQzsyZi+e9GgESzvq7PvAwI=
X-Gm-Gg: Acq92OEUQqeZqkCr88W5vf5v1v9zjqfczGeuuatcoHG6Aedz9X7gZkgwbq7VEbhIaiC
	/g2C1YCuE12Ln/jCgkYAG7xLFCMCm6CXtr5k0gbdEG1D+5/mOt6mUvOyx9UBXgWtYxsbFwo3w2+
	lnC9Yh5WaZlfI+s95KwJO/8qAbrewsU0tcXmNESfQd7e5wqDkP0nt61XMj/i0BkW8QO6nC53j7u
	NkGO478kw6V7TFd6WHNXsBjh4PpZgE4wE+in03OpfM1ZdCen+/238fuAajc8p19CQ7lKVLfgPnW
	1Uaf+pVR2pzULAvcncpKWsARvoUlM393ETkChRsee9jBRwiqOyFOPyGjUEgCqJvWx4s4Gw3Zuxl
	amQjqq2epC596f3a1QJyik4LqLO/anUicsPwh
X-Received: by 2002:a17:90b:38cc:b0:36a:c4b:76cf with SMTP id
 98e67ed59e1d1-36a67642c8amr27322078a91.23.1779974735166; Thu, 28 May 2026
 06:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260528023714.4026613-1-bruce.ashfield@gmail.com> <ea78d370348fbc117e23085ae59791fce6c0b404.camel@linuxfoundation.org>
In-Reply-To: <ea78d370348fbc117e23085ae59791fce6c0b404.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 28 May 2026 09:25:22 -0400
X-Gm-Features: AVHnY4IizfTNWD_k0vz1wdqQtULoCuCAjaVfih_zwOMDadItKPW5nujssM-L1VA
Message-ID: <CADkTA4NYJckE+4eLF2ucrK8h6iDipAt-ynCsVXWYfrOAQSRzhw@mail.gmail.com>
Subject: Re: [PATCH 0/7] linux-yocto: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cc80ab0652e0a99f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 13:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237708

--000000000000cc80ab0652e0a99f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 9:00=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Hi Bruce,
>
> On Wed, 2026-05-27 at 22:37 -0400, bruce.ashfield@gmail.com wrote:
> > Here's the latest -stable bumps for OEcore and yocto-bsps (again,
> > let me know if the combined pull causes issues).
> >
> > I've also moved the dev kernel to v7.1 and fixed lttng-modules
> > along the way. Hopefully a new point release will be available soon
> > and we can quickly drop the backported patches.
> >
> > Also note that since ross removed the CVE exclusions .inc file in
> > a patch (which I think is still pending), I haven't updated the
> > exclusions for the kernel in this series.
>
> Thanks for these. I put them in for testing and there are two weird
> failures:
>
> qemuarm64 musl python3 ptest:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/460
>
> which leads to:
>
>
> https://valkyrie.yocto.io/pub/non-release/20260528-74/testresults/qemuarm=
64-musl-ptest/python3.log
>
> test_tracemalloc_track_race
> (test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race) ... Fatal
> Python error: Segmentation fault
>
> qemux86-64 musl libc-test ptest failure:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/444
>
> which failed in functional_ipc_shm
>
>
> https://valkyrie.yocto.io/pub/non-release/20260528-74/testresults/qemux86=
-64-musl-ptest/libc-test.log
>
> FAIL src/functional/ipc_shm.exe [status 1]
>
> --- ptest result ---
> FAIL: functional_ipc_shm
>
>
> I'll rerun the tests, it is possible this is some weird intermittent
> issue, I just can't tell :(
>

ack'd. I also took another look at the changelogs and don't see anything
that looks obvious or makes
me think it isn't a race.

test_tracemalloc_track_race segfault (qemuarm64-musl)
  - v6.18.32 =E2=86=92 .33 has 55 mm/kernel commits, including 1dcd36420af2=
 futex:
Drop CLONE_THREAD
    requirement for private default hash alloc and several sched/fair
tweaks that affect timing

That  could nudge a race test toward a fail, if the test was flaky before.

functional_ipc_shm (qemux86-64-musl libc-test)
  - No ipc/ changes in v6.18.32 =E2=86=92 .33. Kernel-side SysV shm code is
untouched.
  - A quick search found me a few hits on.libc-test's ipc_shm has what
looks like known intermittent
   issues in some emulated arch + c library combox

I can try a bisect between  .32 and .33 if we get it to happen again, I'll
get setup for testing in case
it does fail again or becomes a common intermittent issue.

bruce


>
> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000cc80ab0652e0a99f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 28, 2026 at 9:00=
=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi Bruce,<br>
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
usl-ptest/python3.log</a><br>
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
issue, I just can&#39;t tell :(<br></blockquote><div><br></div><div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">ack&#39;d. I also took anot=
her look at the changelogs and don&#39;t see anything that looks obvious or=
 makes</div><div class=3D"gmail_default" style=3D"font-size:small">me think=
 it isn&#39;t a race.<br><br>test_tracemalloc_track_race segfault (qemuarm6=
4-musl)<br>=C2=A0 - v6.18.32 =E2=86=92 .33 has 55 mm/kernel commits, includ=
ing 1dcd36420af2 futex: Drop CLONE_THREAD=C2=A0</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">=C2=A0 =C2=A0 requirement for private defa=
ult hash alloc and several sched/fair tweaks that affect timing=C2=A0</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">That=C2=A0 could nudge a race =
test toward a fail, if the test was flaky before.<br><br>functional_ipc_shm=
 (qemux86-64-musl libc-test)<br>=C2=A0 - No ipc/ changes in v6.18.32 =E2=86=
=92 .33. Kernel-side SysV shm code is untouched.<br>=C2=A0 - A quick search=
 found me a few hits on.libc-test&#39;s ipc_shm has what looks like known i=
ntermittent=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">=C2=A0 =C2=A0issues in some emulated arch + c library combox</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br>I can try a bisect bet=
ween=C2=A0 .32 and .33 if we get it to happen again, I&#39;ll get setup for=
 testing in case</div><div class=3D"gmail_default" style=3D"font-size:small=
">it does fail again or becomes a common intermittent=C2=A0issue.</div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">bruce</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">=C2=A0</div></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000cc80ab0652e0a99f--

