Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A2FD1D468
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 14:52:42 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8052.1767883953407116286
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 06:52:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ghq3+4so;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59b6c905a46so2101996e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 06:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767883951; x=1768488751; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HNdysQTb5a1y3Ju8V1Kcyv4fT78aoJAluN5L97DcZ2E=;
        b=ghq3+4soZXf7aO70UeWGDjDnxvZ63/MxEIq89tFaZaaW8CfMdYHI84Q9d784MrLl8k
         c3zm0s7sABxo+SF+Nag2R8Adl+MiZLhQweXcPJz2R5bbTi1Vx2q3M8Nt5Ver+buyCoIn
         J8S2hZRpSYyzQZYtM8aNjSfqTE0y86TCYvBR3IiJJOKFYiAHz9J7EochT7q7O/K6M5+x
         jj6/PDaC+kDYUEFWNNmawWD0udUo0eu2IOJ+rzPS0D9kErrp7KNO+KlOGSZ7PiuW6ZPf
         5/UteJYjFf4gId86/TUXfnR+v7CkvKc8L+YjH/xuKQVguVoeltLknOEWB0tefqwx03UC
         6s4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767883951; x=1768488751;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNdysQTb5a1y3Ju8V1Kcyv4fT78aoJAluN5L97DcZ2E=;
        b=gDKZXGZMmWpJNje2lNptXO+fElA6xc+e7ho0HN+c3Inv0HvzN7Nqf8aPRncqyZzlaW
         6ld6UUGOPzJAYvQ2L7ZXiw42EV0dRU0S+LP22E54RUSgKx93qCN+iTBY0/fvLOSw7iv3
         BV+OPIJZIzw4/Xp8mTPnEK8hdj5s+NmhhpiaKj1sF2JxSyFzXUB4d0F49rfl3ACFvbMT
         6+A+7gTRrEXLKb/bPwmWWk28uIMj/TS0yNUEF5AJriIP72YVnAlN9mTlR8lxC0MqBrMS
         mSYDi3ShzrEUfeRbMHsk6fNYOilM/pSpnk90mbo2/2skTRWvq7FXM2ZH20yxOjtbfwhE
         H7xA==
X-Gm-Message-State: AOJu0Yx2qZtrL/bT+WYzE9Q5t48OsdUe4oukcdjTfSwmhGJJkyRb6bWA
	hj9yKNCzGVdbGP0us1XQOJgKq+gEu3/eLJLdY6L3hOnMIxKE0/z4vcycliyM+lydOAvZV0Y3ukT
	O7vp6ZaMmO2eOwclWV6boS5tu8rv6MQA=
X-Gm-Gg: AY/fxX4k8cMokhk13WMzu/Tl3GNjYqZdVUoB1mcJmED7RRPSuIqk1JkDEnE0Hc63W6I
	xB5XD+Imq/vBGbzubRWZ8wcKEMJcwgQIYjSBJG4T8znT2g65YBZhoPLWuJEpiA/L/+WvkPMOQka
	5lo953vIX6fYF4FMaJxC46VBuL0ms3idy6D2k/nivFIJI1jO8S0qDBfU2AN+z6xLPvJ0urVNz5+
	kiPQigLigogZKgvWmzSh2cO3khaESoxuIoChf6dgsN6oeTHihppWsNnP5+Cszo7YnRklg==
X-Google-Smtp-Source: AGHT+IGeGbOK6BJlriiaJgFdvZU42o0s+uKPomIlw9nzjeiCiw4VXK6aVBmbvieEZ96YlfVUSsEAdKATma0/Sb7mEO4=
X-Received: by 2002:a05:6512:a8a:b0:577:6e42:3718 with SMTP id
 2adb3069b0e04-59b6ef0c29cmr2349420e87.7.1767883950956; Thu, 08 Jan 2026
 06:52:30 -0800 (PST)
MIME-Version: 1.0
References: <20260107202553.2965393-3-t.f.g.geelen@gmail.com> <DFJ6AGZNL99N.VPY6DN6VPCWK@bootlin.com>
In-Reply-To: <DFJ6AGZNL99N.VPY6DN6VPCWK@bootlin.com>
From: Tom Geelen <t.f.g.geelen@gmail.com>
Date: Thu, 8 Jan 2026 15:52:19 +0100
X-Gm-Features: AQt7F2quA97ePAAE6o1-q3iqSgo22UmZS5KUYjYE8ddRZ3_DHxMVaE9CUIQz0fc
Message-ID: <CAJo0Az4cUtFnVH9H+LKqP39Fnxe5-AECCi=swWz98wjm5dJLGQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2] qemurunner: Improve qmp module detection
 PKG_CONFIG_SYSROOT_DIR for qmp module path
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alex Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e6a4980647e18ed8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 14:52:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229080

--000000000000e6a4980647e18ed8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mattieu,

Certainly. Question from my side. What is the exact setup that is used on
the autobuilder? Or the build commands for that matter.
I would like to reproduce this particular setup locally as well.

Regards,

Tom

On Thu, Jan 8, 2026 at 12:31=E2=80=AFPM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Wed Jan 7, 2026 at 9:25 PM CET, Tom Geelen via lists.openembedded.org
> wrote:
> > Instead of using logfile to detect where qmp is located we can use
> PKG_CONFIG_SYSROOT_DIR, passed via ENV to the launch function as this wil=
l
> point to the image recipe for which launch is called.
> >
> > Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
> > ---
>
> Hi Tom,
>
> Thanks for your patch.
>
> This is failing on the autobuilder, with the following error:
>
> 2026-01-08 10:20:15,532 - oe-selftest - INFO -
> testtools.testresult.real._StringException: Traceback (most recent call
> last):
>   File
> "/srv/pokybuild/yocto-worker/qemux86-tc/build/layers/openembedded-core/me=
ta/lib/oeqa/utils/commands.py",
> line 390, in runqemu
>     qemu.start(params=3Dqemuparams, ssh=3Dssh, runqemuparams=3Drunqemupar=
ams,
> launch_cmd=3Dlaunch_cmd, discard_writes=3Ddiscard_writes)
>   File
> "/srv/pokybuild/yocto-worker/qemux86-tc/build/layers/openembedded-core/me=
ta/lib/oeqa/targetcontrol.py",
> line 179, in start
>     raise RuntimeError("%s - FAILED to start qemu - check the task log an=
d
> the boot log" % self.pn)
> RuntimeError: core-image-minimal - FAILED to start qemu - check the task
> log and the boot log
> ...
> DEBUG: Using kvm for runqemu
> ERROR: qemurunner: qmp module missing, please ensure it's installed in
> /../recipe-sysroot-native/usr/lib/qemu-python (No module named 'qmp')
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/2925
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/2931
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/2925
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/2975
>
> Can you have a look at these issues?
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

--000000000000e6a4980647e18ed8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Mattieu,<div><br></div><div>Certainly. Question from my=
 side. What is the exact setup that is used on the autobuilder? Or the buil=
d commands for that matter.</div><div>I would like to reproduce this partic=
ular setup locally as well.</div><div><br></div><div>Regards,</div><div><br=
></div><div>Tom</div></div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 8, 2026 at 12:31=E2=
=80=AFPM Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-briand@=
bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Wed Jan 7, 2026 at 9:25 PM=
 CET, Tom Geelen via <a href=3D"http://lists.openembedded.org" rel=3D"noref=
errer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Instead of using logfile to detect where qmp is located we can use PKG=
_CONFIG_SYSROOT_DIR, passed via ENV to the launch function as this will poi=
nt to the image recipe for which launch is called.<br>
&gt;<br>
&gt; Signed-off-by: Tom Geelen &lt;<a href=3D"mailto:t.f.g.geelen@gmail.com=
" target=3D"_blank">t.f.g.geelen@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Tom,<br>
<br>
Thanks for your patch.<br>
<br>
This is failing on the autobuilder, with the following error:<br>
<br>
2026-01-08 10:20:15,532 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemux86-tc/build/layers/opene=
mbedded-core/meta/lib/oeqa/utils/commands.py&quot;, line 390, in runqemu<br=
>
=C2=A0 =C2=A0 qemu.start(params=3Dqemuparams, ssh=3Dssh, runqemuparams=3Dru=
nqemuparams, launch_cmd=3Dlaunch_cmd, discard_writes=3Ddiscard_writes)<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemux86-tc/build/layers/opene=
mbedded-core/meta/lib/oeqa/targetcontrol.py&quot;, line 179, in start<br>
=C2=A0 =C2=A0 raise RuntimeError(&quot;%s - FAILED to start qemu - check th=
e task log and the boot log&quot; % <a href=3D"http://self.pn" rel=3D"noref=
errer" target=3D"_blank">self.pn</a>)<br>
RuntimeError: core-image-minimal - FAILED to start qemu - check the task lo=
g and the boot log<br>
...<br>
DEBUG: Using kvm for runqemu<br>
ERROR: qemurunner: qmp module missing, please ensure it&#39;s installed in =
/../recipe-sysroot-native/usr/lib/qemu-python (No module named &#39;qmp&#39=
;)<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/buil=
ds/2925" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/28/builds/2925</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/build=
s/2931" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/5/builds/2931</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/buil=
ds/2925" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/28/builds/2925</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/buil=
ds/2975" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/66/builds/2975</a><br>
<br>
Can you have a look at these issues?<br>
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
</blockquote></div>

--000000000000e6a4980647e18ed8--

