Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE4DC624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 16:43:23 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2659.1788540197219972179
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 09:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bSqlklCj;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-86d43cdee51so16624447b3.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 09:43:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788540196; cv=none;
        d=google.com; s=arc-20260327;
        b=JCBBMVQ1R3BtqKv5r824wPo/n2BfPM8af7DjbY5elRbGn+VImGtg7PIgLRyDdghuaz
         0176Viu4nRcWpbjuYhIl7i+QmDdRQrG9TGn0jX1lcmsi+dQTtILyYyhEAuhmODfw79Wr
         LZTpdqCZS7G0dEH6JpwtJ+jwuZDwAxPk/MuQXK0FUfU6wc/nnCkf/+1/x8bJ7hhMxpNg
         1C+mdRjH4q1d3iqT3koJbAYo+ZzivvOzVaxnj7hb4FAk0O2b4ILYdnUydpne5rZfmAZM
         v6M3wBKdLb8Mbcd6V8xEmd6zhgVu4sIZPIvmiFxDG5j0hOqJHo2DVGTchghQIkZVU8XB
         2xKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cD9MTwBB9bjQjIEL+BNNHDOX3yzb3bmz7bQbVXamNK8=;
        fh=c8gzXe9Tb3DYJY8T1ToyIO5IJGBe5vpTYi6yqGpJc7M=;
        b=mQ8k1S5us5gr8FhposSnUirtmVhzNQewK+NcmsonhMoftVo6d1YMUaAp5boFHQjeyV
         RvOASjk8aX+adcVvVyTxoy+diqAibhpXh3i7vgD5vDQ/27G27h3IuBEDF+QqmCqkgZUs
         w9avhkStHL5Io3hxbK3bUSaKnbHIVghe1iIuS4yhu99XWgUR2Q0k4oXTlGsUDIlTeIwt
         DS4zF9RF6ZCWpcsM700wy/Hzamy8sYX0YEWeVRCGSMHgeNyN08vyJqkXnCgpyrDs7A9z
         CN1pDlbtyRw36vapCRkCKyUheKPhn79//pmyMFfmyy7kWjX2cMQAiUCwD6Yei2nHVQJ7
         EZXw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788540196; x=1789144996; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cD9MTwBB9bjQjIEL+BNNHDOX3yzb3bmz7bQbVXamNK8=;
        b=bSqlklCjRuaaYHOtT0dteQ0itYO2ooUu1exeXT3bHnWUslPBeM0Oltpece5lQdZb17
         6753PnV3gmIbsPlJzPIBbAxXZcas+GohhQ7Ht9vhPptVc4uyPcLt+HupixN9/tmGVeUt
         3iE7NRZm7M9t2Y8sotN7VPGUTD9P1xhWt4ohu61WbN5xfbiDTGupWCAYyVAmkGIkukN7
         Q+ezehrVGujQIvfaIcZ2x9J9BDaGWmH9bF0pE+NZ0H0+CwKh1l4iCWXwQ+kwVvoJtl7V
         q2ogMe6ghaw3qA+B3UtTf23aRaCu4OPoz383B3COpfULLCUbP9xScJbfSdLS4WpktAQP
         7PmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540196; x=1789144996;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cD9MTwBB9bjQjIEL+BNNHDOX3yzb3bmz7bQbVXamNK8=;
        b=R7obH+VAl1SKJ6OhEa/clttil7aBLOMor1vCCsGI9tB66hq5jjOiTGrXRzYLBHRxFN
         BCG3Zs748THZuaDYL7M/t9Y/7qqR2vJOp0AC5TmGwHWnnKi+SvoSL2gjfIbyn6zbMoEb
         aPSAiPGBscTaEhjESE0TWyt7q1gyNTXcBRWkoTQ6nGnXguEcQveqDlF6P+tzAYXPFYmI
         SVztVMhIUZ9Vc4kK6cThZAETzJ8gKrMzHCKO7/pFp46/XwkqI2PjjNzsj8hqUzDJQj4m
         HaemMmnELKM3fwiLqMMS443P4fXEZf8uAg8fYOWeRbG/5sp1qa1E9ZsjDF6ZmuxDin2m
         HkxQ==
X-Forwarded-Encrypted: i=1; AKwUvByxckt+bxIa5o+Wi0lpHYuUTNVoRTOb4A8Q6tnpLENnbNvc51UcfJfMEXQx/HKLagRMrcb2plwg2CQ1NB9cGmDA5w==@lists.openembedded.org
X-Gm-Message-State: AFuF++mkYxtP1UnFn5SPHkGanb3A/+3rT6eiRsGgfFiJYhGsdKCwansz
	ZzyKTkO4EdbXC1zmkpRZEZYmblHtSlXGE2t9gap3B07dV1rGrSMyYuSGUcsPVjVIn1vMiw3VX/H
	ux7710HWyGJtIDVdYmtQLdQ32UpHbI3s=
X-Gm-Gg: AYBFou30/PE19WNw+tm2VpXozjeHmWS4woYYRB7oEBTGV5SCZMoNPR21/HZzr2W9SsR
	fcr9B3uQCqMkxiHamyFGkPN2EXfWzCoDnUg3huxNr6YKI4PI5MO0H15yP0Ur8J0P4qh8RjjSa1f
	dBXuW+kl8e1Ds5or+r+skmzj524YFY/k3AAyXTiDlHJiVbbWNRHgPn8wHqSDWRvdzzMdf0uDDMn
	iz3DzIl6fSOpbckVJlHkIbS/+FL+seyNYiRHpQp39/yO1NsKgeNlC+7LdmyIGLuOoR4fMCvhPMM
	lWZwH1r1eO5m8vb6A/nwpn673JJ3djW9/Tpm4HeuHlHPOF4MQ9FEoVghStgxoXIxGpDECCHHt0t
	T9PN9ASGfNtWdJEUq001Ikuts+R45mlqOPy/YzpQJWtbx0qVMACnxyEbs/nRUnCprwxN4YCTZ/k
	7WJ1DIRUrePRPzPt62hVWWdq8bJRK75g094GNuwxoh2Fo1w6yy1LT8Mc4qdpIXAWx/17JmSO1tF
	G+Yl2ixiP0pg4/Z9rAL9dDh
X-Received: by 2002:a05:690c:e3e3:b0:866:4769:d60d with SMTP id
 00721157ae682-8712a9f58bemr38844107b3.22.1788540196175; Fri, 04 Sep 2026
 09:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260904080004.2501262-1-HimaniRamesh.Barde@windriver.com> <459ee648f0e733958f7e0d21074d3fa41e77248a.camel@linuxfoundation.org>
In-Reply-To: <459ee648f0e733958f7e0d21074d3fa41e77248a.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Sep 2026 09:42:49 -0700
X-Gm-Features: AcwNN1UFvVWugzRVUlWjE6D6AGyy1Os5mFM9iJ0oIE4YshBODSWwcPMF7A2NCH8
Message-ID: <CAMKF1sr=zhY_+aWw17=O4n73JeqUVXsRxO87RzBVct7WhETGnA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] systemd: re-enable ptest support
To: richard.purdie@linuxfoundation.org
Cc: HimaniRamesh.Barde@windriver.com, openembedded-core@lists.openembedded.org, 
	Randy.MacLeod@windriver.com, ross.burton@arm.com
Content-Type: multipart/alternative; boundary="0000000000000f4367065aaaf7ed"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 16:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245125

--0000000000000f4367065aaaf7ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

with master-next I am seeing

ERROR: systemd-1_261.2-r0 do_package_qa: QA Issue: supports ptests but is
not included in oe-core's ptest-packagelists.inc [missing-ptest]
ERROR: systemd-1_261.2-r0 do_package_qa: Fatal QA errors were found,
failing task.

perhaps due to the same patch ?

On Fri, Sep 4, 2026 at 9:35=E2=80=AFAM Richard Purdie via lists.openembedde=
d.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

> On Fri, 2026-09-04 at 08:00 +0000, Himani Ramesh Barde via
> lists.openembedded.org wrote:
> > ptest support for systemd was dropped in 2018 (commit 906230a73b3c)
> > when the recipe switched to meson, as there was no easy way to
> > install and run the test suite. Current systemd and meson resolve
> > this: the meson 'install-tests' option installs the unit-test
> > binaries and a run-unit-tests.py runner under
> > ${prefix}/lib/systemd/tests, and run-unit-tests.py already emits
> > PASS:/SKIP: results per test.
> >
> > Enable install-tests, package the installed tree into systemd-ptest,
> > and add a run-ptest wrapper that drives run-unit-tests.py. This
> > provides ptest coverage for the systemd:test and libsystemd meson
> > unit-test suites.
> >
> > The test/units integration tests, which require a booted system, are
> > out of scope here and can be addressed separately.
> >
> > Verified on systemd 257.6: -Dinstall-tests=3Dtrue installs 313 test-*
> > unit-test binaries plus run-unit-tests.py; systemd-ptest packages
> > cleanly. The recipe change parses without error against oe-core
> > master (261.2).
> >
> > [YOCTO #16386]
> >
> > Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
> > ---
> >  meta/recipes-core/systemd/systemd/run-ptest | 11 +++++++++++
> >  meta/recipes-core/systemd/systemd_261.2.bb  | 18 +++++++++++++++++-
> >  2 files changed, 28 insertions(+), 1 deletion(-)
> >  create mode 100755 meta/recipes-core/systemd/systemd/run-ptest
>
> First issue found in test:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/builds/4554
>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#245124):
> https://lists.openembedded.org/g/openembedded-core/message/245124
> Mute This Topic: https://lists.openembedded.org/mt/121086003/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000f4367065aaaf7ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">with master-next I am seeing<div><br></div><div>ERROR: sys=
temd-1_261.2-r0 do_package_qa: QA Issue: supports ptests but is not include=
d in oe-core&#39;s ptest-packagelists.inc [missing-ptest]<br>ERROR: systemd=
-1_261.2-r0 do_package_qa: Fatal QA errors were found, failing task.</div><=
div><br></div><div>perhaps due to the same patch ?</div></div><br><div clas=
s=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_att=
r">On Fri, Sep 4, 2026 at 9:35=E2=80=AFAM Richard Purdie via <a href=3D"htt=
p://lists.openembedded.org">lists.openembedded.org</a> &lt;richard.purdie=
=3D<a href=3D"mailto:linuxfoundation.org@lists.openembedded.org">linuxfound=
ation.org@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Fri, 2026-09-04 at 08:00 +0000, Himani =
Ramesh Barde via <a href=3D"http://lists.openembedded.org" rel=3D"noreferre=
r" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; ptest support for systemd was dropped in 2018 (commit 906230a73b3c)<br=
>
&gt; when the recipe switched to meson, as there was no easy way to<br>
&gt; install and run the test suite. Current systemd and meson resolve<br>
&gt; this: the meson &#39;install-tests&#39; option installs the unit-test<=
br>
&gt; binaries and a run-unit-tests.py runner under<br>
&gt; ${prefix}/lib/systemd/tests, and run-unit-tests.py already emits<br>
&gt; PASS:/SKIP: results per test.<br>
&gt; <br>
&gt; Enable install-tests, package the installed tree into systemd-ptest,<b=
r>
&gt; and add a run-ptest wrapper that drives run-unit-tests.py. This<br>
&gt; provides ptest coverage for the systemd:test and libsystemd meson<br>
&gt; unit-test suites.<br>
&gt; <br>
&gt; The test/units integration tests, which require a booted system, are<b=
r>
&gt; out of scope here and can be addressed separately.<br>
&gt; <br>
&gt; Verified on systemd 257.6: -Dinstall-tests=3Dtrue installs 313 test-*<=
br>
&gt; unit-test binaries plus run-unit-tests.py; systemd-ptest packages<br>
&gt; cleanly. The recipe change parses without error against oe-core<br>
&gt; master (261.2).<br>
&gt; <br>
&gt; [YOCTO #16386]<br>
&gt; <br>
&gt; Signed-off-by: Himani Ramesh Barde &lt;<a href=3D"mailto:HimaniRamesh.=
Barde@windriver.com" target=3D"_blank">HimaniRamesh.Barde@windriver.com</a>=
&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-core/systemd/systemd/run-ptest | 11 +++++++++++<br>
&gt; =C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_261.2.bb" re=
l=3D"noreferrer" target=3D"_blank">systemd_261.2.bb</a>=C2=A0 | 18 ++++++++=
+++++++++-<br>
&gt; =C2=A02 files changed, 28 insertions(+), 1 deletion(-)<br>
&gt; =C2=A0create mode 100755 meta/recipes-core/systemd/systemd/run-ptest<b=
r>
<br>
First issue found in test:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/buil=
ds/4554" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/10/builds/4554</a><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#245124): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/245124" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/245124</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121086003/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121086003/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000000f4367065aaaf7ed--

