Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178BDE7DEF4
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 15:16:09 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55085.1770045359363614715
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 07:15:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=B0Y1vNxz;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so4844214f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 07:15:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770045358; cv=none;
        d=google.com; s=arc-20240605;
        b=RLOQawU3omDAm2b2wrD3oHxuQ7BrRlT2lR2u0Et6Sugmhplp8nQQ33YI1vjyYO/5tC
         L1l8LHoxZ+mMjPPb0tdmc1xArVg7IBfe/tJeIWczIzIeV7ps2W7PmXodLlhqyxHXVa+D
         pUuLhV2yCeSDX+Bw6tLoreWWTE3tfmqyGPgbzkMXV+4KTqnRZA13h73gBrvH3uVG/LLm
         dmkW6Rfy6+W1KwqE5S4EeLxHte5sCbCwOAtNK1K4DUD7/9oSm333DoWC3EWXsgiXhFxv
         UN9qAVxxbMQiVI0vxw3XIPzIBZrF8tiHXDfaokSvsLXHGL1l8IddIin0tyGZCwD8C//I
         0t4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cg77a0loPMNT8t4XT4CUMKNKlhhCO2C+rn9VZzIwKFQ=;
        fh=P4ESOSihnqMyW57Z9Y03dpM2fROrsLfblJnvbM9yd4k=;
        b=VxMnVykWrJqMMI6IXaJAcIee2sf/tue1Q0b5BrmmMeh2PtYE7VXpzOCmpMACR3wdEY
         Xw59oGGgc8vx40dMBryBrbmXT1NZN+AiUkYZUe+atVHZbVjc0oZC6hpAVFjoDnzOqslJ
         ERnNso5h6EC5x5FDdOdrbGC8vNZLBPdg6C6bFW5iwU8ckfWmUtOiIu/WRAHmzJzVoqFW
         AvIm3GQGsVLB1jXk8dabTFTJzbR6IaFMF9UuSiRGoTMoxSpph1qWIWZoJVMIQOjU2Bru
         y8fb/8xohOE+QayraQTORHEmDIL0vr70qnt1kZd/xiKY/Je7ITCikde88JhsnB+1MV+c
         y7/w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770045358; x=1770650158; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cg77a0loPMNT8t4XT4CUMKNKlhhCO2C+rn9VZzIwKFQ=;
        b=B0Y1vNxzlt95Gz5zX4gAKd2usPwJmWa946ohGAz3oCAQzJiVsYdv5LjWX/9OzM4Ug7
         YElOHAsQB3eqjF6d1sYMb0O3tDEL0cs7xBomkXEgYiyw67fbFxn7M9zd1tg5CfkSk/pV
         x1jtUpUeEgTxDcskNe5GjjT7aY2oF07SMzZ7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770045358; x=1770650158;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cg77a0loPMNT8t4XT4CUMKNKlhhCO2C+rn9VZzIwKFQ=;
        b=MhijwoNIzvoUVidPcWjaOWFWicR54aOLvZ4C009h+Z29EFRbwjRs1AK7kziz2WyT7E
         Voaaz3Xht2e7Y3ABODoav65kpArctjN26SyTWH0vjfo2EAdMsO3heu8/SM58mLrcMcB7
         LytXIgeOXkP+jYmAcr0wcOPjfxnroTKW0QQako7Wf4pBvKRx4Uh9nAkVl31T4WjOWYjK
         bTIgClDh2eKLhby8R0UjKX4mz/caKAxGjxZL35kRFiP+oGZ2bMx8iId5egywiTL65EDO
         o9Ir+I2XLN+OHsvHbZ5pQWnH5DLPpdGhI31rOwg6t026cJMgEg5uah9CosjxM4SSJbEK
         vljw==
X-Forwarded-Encrypted: i=1; AJvYcCUe5geJqdwoujVmzBYAHPCUjjC0ebFH4Ebu4d6rV2b6nnPtqpsfnjAPncl8MkmBYXJcJcdfPWhgYz2NWUxelZliZw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwqKFhLVKSQEEa+lFALpJC8wTip2qAh5fbmp8LsIYNV5k0nfK8t
	OsuNx/40NB3kImBQytJTPrFd2ALa4cS2BqJwmufRCNJM8khHOr1tUY46M/tHv4Unr9mjlo6KGTK
	re7nrvr2Pm5QANEMf/hK2vlzAwzUWxb5mAMZlkGzSmg==
X-Gm-Gg: AZuq6aKy3U9ZXEmC3GoybcWgaQSmWBvuq/FwAUUphqQb55i9LycxbnLO4yW1oLOWXlQ
	sztQIsuAQQDL4TgA88/Dvkh7YTYiHCPVHiHLYUCV3V2iyJpoGRfN071VgwM28Lpl9udKxKiO0+P
	lHibVx9H4OV1qhUnS031nBU2cVlhZ+vE6BkN/j5HpNQjy+UrRo2kNgM3Rc6It3auvDG7dZBNo17
	+a0GhiGA2T2SWe+Zvmtv3TlYJvOXvsNlw4GRIne9ZRCRWg3NQVKZW1O+85k7PSlObJwKuEJXw==
X-Received: by 2002:a5d:584a:0:b0:435:a464:f467 with SMTP id
 ffacd0b85a97d-435f3abc7d7mr18179121f8f.50.1770045357490; Mon, 02 Feb 2026
 07:15:57 -0800 (PST)
MIME-Version: 1.0
References: <20260130134137.2463745-1-Hemanth.KumarMD@windriver.com> <DG3GN4VGMAU4.OOYLJKHV2X2B@bootlin.com>
In-Reply-To: <DG3GN4VGMAU4.OOYLJKHV2X2B@bootlin.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 2 Feb 2026 16:15:30 +0100
X-Gm-Features: AZwV_QjMYc0iuOR5xW3T8r2WwOpIdC9lTABnmYdCfd48yn5izMB1x4IQLRSbuUU
Message-ID: <CAMSfU+5-gHPYDLsxKjSK-BRVqhZ+dis+b1hE+82LAL0pAQL7CA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.92.0 -> 1.93.0
To: mathieu.dubois-briand@bootlin.com
Cc: Hemanth.KumarMD@windriver.com, openembedded-core@lists.openembedded.org, 
	Sundeep.Kokkonda@windriver.com
Content-Type: multipart/alternative; boundary="000000000000c521090649d8cc78"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 15:16:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230373

--000000000000c521090649d8cc78
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 1 f=C3=A9vr. 2026 =C3=A0 08:52, Mathieu Dubois-Briand via
lists.openembedded.org <mathieu.dubois-briand=3D
bootlin.com@lists.openembedded.org> a =C3=A9crit :

> On Fri Jan 30, 2026 at 2:41 PM CET, Hemanth.KumarMD via
> lists.openembedded.org wrote:
> > From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> >
> > https://blog.rust-lang.org/2026/01/22/Rust-1.93.0/
> > Rust changes: https://github.com/rust-lang/rust/releases/tag/1.93.0
> > Cargo changes:
> https://doc.rust-lang.org/nightly/cargo/CHANGELOG.html#cargo-193-2026-01-=
22
> >
> > * rust-oe-selftest.patch updated for 1.93:
> >   Renamed UI test directive from add-core-stubs to add-minicore as in
> >
> https://github.com/rust-lang/rust/commit/3796f7de57f5d4cf4325d1f13aeb07fd=
aa57983b
> >
> > * OE-selftests:
> >   - Exclude src/tools/remote-test-client from test suite.
> >     This unit test modifies the TEST_DEVICE_ADDR environment variable,
> >     which breaks the OE test harness that uses the same variable for
> >     QEMU remote testing. Filed a bug with upstream:
> >     https://github.com/rust-lang/rust/issues/151823
> >
> >   - Enable +v8a feature for cortexa57.
> >     Rust 1.93.0 added a regression test (PR #149549) to verify that the
> >     ARMv8-A system register ttbr0_el2 is recognized in inline assembly.
> >     This addresses issue #97724 where LLVM wasn't recognizing ttbr0_el2
> >     as a valid register. Upstream Rust enables +v8a by default for all
> >     AArch64 targets (PR #105026), but Yocto's custom target specificati=
on
> >     doesn't inherit this. Adding +v8a ensures LLVM recognizes ARMv8-A
> >     system registers, fixing the test failure.
> >
> >     Related upstream links:
> >     - PR #149549: https://github.com/rust-lang/rust/pull/149549
> >     - Issue #97724: https://github.com/rust-lang/rust/issues/97724
> >     - PR #105026: https://github.com/rust-lang/rust/pull/105026
> >
> > Test results:
> >
> > rust v1.93.0
> > +-------------+--------+---------+
> > | Machine     | Passed | Skipped |
> > +-------------+--------+---------+
> > | qemux86-64  | 21,689 |   646   |
> > | qemux86     | 21,439 |   896   |
> > | qemuarm64   | 21,495 |   840   |
> > | qemuarm     | 21,421 |   914   |
> > | qemuriscv64 | 21,466 |   869   |
> > +-------------+--------+---------+
> >
> > Test results difference (1.93.0 - 1.92.0):
> >
> > +-------------+--------+---------+
> > | Machine     | Passed | Skipped |
> > +-------------+--------+---------+
> > | qemux86-64  |  +205  |   +33   |
> > | qemux86     |  +205  |   +33   |
> > | qemuarm64   |  +206  |   +32   |
> > | qemuarm     |  +205  |   +33   |
> > | qemuriscv64 |  +205  |   +33   |
> > +-------------+--------+---------+
> >
> > Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> > ---
>
> Hi Hemanth,
>
> Thanks for the upgrade.
>
> I suspect this is responsible of the
> runtime_test.RustKernel.test_kernel_rust_sample selftest failure:
>
> 2026-01-31 16:20:41,991 - oe-selftest - INFO -
> runtime_test.RustKernel.test_kernel_rust_sample (subunit.RemotedTestCase)
> 2026-01-31 16:20:41,994 - oe-selftest - INFO -  ... FAIL
> ...
> ERROR: linux-yocto-6.16.11+git-r0 do_compile: Execution of
> '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-766138/tmp=
/work/qemux86_64-poky-linux/linux-yocto/6.16.11+git/temp/run.do_compile.189=
616'
> failed with exit code 1
> ...
> | error: unknown unstable option: `no-jump-tables`
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3127
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3022
>
> Can you have a look at what is going wrong here?
>

Hello,

To clarify because this is not totally obvious:
This test is defined in the "[PATCH v5 00/15] Enable rust support for linux
kernel" from Harish.Sadineni (also at Windriver)
https://lore.kernel.org/openembedded-core/20260129163910.2612040-10-Harish.=
Sadineni@windriver.com/
So, the test is not present on master (or even master-next).


>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230253):
> https://lists.openembedded.org/g/openembedded-core/message/230253
> Mute This Topic: https://lists.openembedded.org/mt/117544255/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000c521090649d8cc78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 1 =
f=C3=A9vr. 2026 =C3=A0=C2=A008:52, Mathieu Dubois-Briand via <a href=3D"htt=
p://lists.openembedded.org">lists.openembedded.org</a> &lt;mathieu.dubois-b=
riand=3D<a href=3D"mailto:bootlin.com@lists.openembedded.org">bootlin.com@l=
ists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Fri Jan 30, 2026 at 2:41 PM CET, Heman=
th.KumarMD via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer"=
 target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; From: Hemanth Kumar M D &lt;<a href=3D"mailto:Hemanth.KumarMD@windrive=
r.com" target=3D"_blank">Hemanth.KumarMD@windriver.com</a>&gt;<br>
&gt;<br>
&gt; <a href=3D"https://blog.rust-lang.org/2026/01/22/Rust-1.93.0/" rel=3D"=
noreferrer" target=3D"_blank">https://blog.rust-lang.org/2026/01/22/Rust-1.=
93.0/</a><br>
&gt; Rust changes: <a href=3D"https://github.com/rust-lang/rust/releases/ta=
g/1.93.0" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang=
/rust/releases/tag/1.93.0</a><br>
&gt; Cargo changes: <a href=3D"https://doc.rust-lang.org/nightly/cargo/CHAN=
GELOG.html#cargo-193-2026-01-22" rel=3D"noreferrer" target=3D"_blank">https=
://doc.rust-lang.org/nightly/cargo/CHANGELOG.html#cargo-193-2026-01-22</a><=
br>
&gt;<br>
&gt; * rust-oe-selftest.patch updated for 1.93:<br>
&gt;=C2=A0 =C2=A0Renamed UI test directive from add-core-stubs to add-minic=
ore as in<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/rust-lang/rust/commit/3796f7=
de57f5d4cf4325d1f13aeb07fdaa57983b" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/rust-lang/rust/commit/3796f7de57f5d4cf4325d1f13aeb07fdaa57=
983b</a><br>
&gt;<br>
&gt; * OE-selftests:<br>
&gt;=C2=A0 =C2=A0- Exclude src/tools/remote-test-client from test suite.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0This unit test modifies the TEST_DEVICE_ADDR enviro=
nment variable,<br>
&gt;=C2=A0 =C2=A0 =C2=A0which breaks the OE test harness that uses the same=
 variable for<br>
&gt;=C2=A0 =C2=A0 =C2=A0QEMU remote testing. Filed a bug with upstream:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/rust-lang/rust/issues=
/151823" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
rust/issues/151823</a><br>
&gt;<br>
&gt;=C2=A0 =C2=A0- Enable +v8a feature for cortexa57.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Rust 1.93.0 added a regression test (PR #149549) to=
 verify that the<br>
&gt;=C2=A0 =C2=A0 =C2=A0ARMv8-A system register ttbr0_el2 is recognized in =
inline assembly.<br>
&gt;=C2=A0 =C2=A0 =C2=A0This addresses issue #97724 where LLVM wasn&#39;t r=
ecognizing ttbr0_el2<br>
&gt;=C2=A0 =C2=A0 =C2=A0as a valid register. Upstream Rust enables +v8a by =
default for all<br>
&gt;=C2=A0 =C2=A0 =C2=A0AArch64 targets (PR #105026), but Yocto&#39;s custo=
m target specification<br>
&gt;=C2=A0 =C2=A0 =C2=A0doesn&#39;t inherit this. Adding +v8a ensures LLVM =
recognizes ARMv8-A<br>
&gt;=C2=A0 =C2=A0 =C2=A0system registers, fixing the test failure.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Related upstream links:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- PR #149549: <a href=3D"https://github.com/rust-la=
ng/rust/pull/149549" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/rust-lang/rust/pull/149549</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0- Issue #97724: <a href=3D"https://github.com/rust-=
lang/rust/issues/97724" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/rust-lang/rust/issues/97724</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0- PR #105026: <a href=3D"https://github.com/rust-la=
ng/rust/pull/105026" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/rust-lang/rust/pull/105026</a><br>
&gt;<br>
&gt; Test results:<br>
&gt;<br>
&gt; rust v1.93.0<br>
&gt; +-------------+--------+---------+<br>
&gt; | Machine=C2=A0 =C2=A0 =C2=A0| Passed | Skipped |<br>
&gt; +-------------+--------+---------+<br>
&gt; | qemux86-64=C2=A0 | 21,689 |=C2=A0 =C2=A0646=C2=A0 =C2=A0|<br>
&gt; | qemux86=C2=A0 =C2=A0 =C2=A0| 21,439 |=C2=A0 =C2=A0896=C2=A0 =C2=A0|<=
br>
&gt; | qemuarm64=C2=A0 =C2=A0| 21,495 |=C2=A0 =C2=A0840=C2=A0 =C2=A0|<br>
&gt; | qemuarm=C2=A0 =C2=A0 =C2=A0| 21,421 |=C2=A0 =C2=A0914=C2=A0 =C2=A0|<=
br>
&gt; | qemuriscv64 | 21,466 |=C2=A0 =C2=A0869=C2=A0 =C2=A0|<br>
&gt; +-------------+--------+---------+<br>
&gt;<br>
&gt; Test results difference (1.93.0 - 1.92.0):<br>
&gt;<br>
&gt; +-------------+--------+---------+<br>
&gt; | Machine=C2=A0 =C2=A0 =C2=A0| Passed | Skipped |<br>
&gt; +-------------+--------+---------+<br>
&gt; | qemux86-64=C2=A0 |=C2=A0 +205=C2=A0 |=C2=A0 =C2=A0+33=C2=A0 =C2=A0|<=
br>
&gt; | qemux86=C2=A0 =C2=A0 =C2=A0|=C2=A0 +205=C2=A0 |=C2=A0 =C2=A0+33=C2=
=A0 =C2=A0|<br>
&gt; | qemuarm64=C2=A0 =C2=A0|=C2=A0 +206=C2=A0 |=C2=A0 =C2=A0+32=C2=A0 =C2=
=A0|<br>
&gt; | qemuarm=C2=A0 =C2=A0 =C2=A0|=C2=A0 +205=C2=A0 |=C2=A0 =C2=A0+33=C2=
=A0 =C2=A0|<br>
&gt; | qemuriscv64 |=C2=A0 +205=C2=A0 |=C2=A0 =C2=A0+33=C2=A0 =C2=A0|<br>
&gt; +-------------+--------+---------+<br>
&gt;<br>
&gt; Signed-off-by: Hemanth Kumar M D &lt;<a href=3D"mailto:Hemanth.KumarMD=
@windriver.com" target=3D"_blank">Hemanth.KumarMD@windriver.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Hemanth,<br>
<br>
Thanks for the upgrade.<br>
<br>
I suspect this is responsible of the<br>
runtime_test.RustKernel.test_kernel_rust_sample selftest failure:<br>
<br>
2026-01-31 16:20:41,991 - oe-selftest - INFO - runtime_test.RustKernel.test=
_kernel_rust_sample (subunit.RemotedTestCase)<br>
2026-01-31 16:20:41,994 - oe-selftest - INFO -=C2=A0 ... FAIL<br>
...<br>
ERROR: linux-yocto-6.16.11+git-r0 do_compile: Execution of &#39;/srv/pokybu=
ild/yocto-worker/oe-selftest-debian/build/build-st-766138/tmp/work/qemux86_=
64-poky-linux/linux-yocto/6.16.11+git/temp/run.do_compile.189616&#39; faile=
d with exit code 1<br>
...<br>
| error: unknown unstable option: `no-jump-tables`<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/buil=
ds/3127" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/35/builds/3127</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/buil=
ds/3022" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/48/builds/3022</a><br>
<br>
Can you have a look at what is going wrong here?<br></blockquote><div><br><=
/div><div>Hello,</div><div><br></div><div>To clarify because this is not to=
tally obvious:</div><div>This test is defined in the &quot;[PATCH v5 00/15]=
 Enable rust support for linux kernel&quot; from Harish.Sadineni (also at W=
indriver)</div><div><a href=3D"https://lore.kernel.org/openembedded-core/20=
260129163910.2612040-10-Harish.Sadineni@windriver.com/">https://lore.kernel=
.org/openembedded-core/20260129163910.2612040-10-Harish.Sadineni@windriver.=
com/</a></div><div>So, the test is not present on master (or even master-ne=
xt).</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#230253): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/230253" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/230253</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117544255/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117544255/4316185</a><br>
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

--000000000000c521090649d8cc78--

