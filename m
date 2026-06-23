Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B71CD98F0
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 04:11:46 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13619.1782187904105654837
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 21:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lnKTglQs;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-660e9ff0587so2853061d50.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 21:11:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782187903; cv=none;
        d=google.com; s=arc-20240605;
        b=VKi4r7vd/YFaFEkyZN+njXg6xDL+s8X731Eh0ev2lXkzppyxeJOoneaJZ62L5vR/WN
         4fp7ot7hBQ7AhWcuQM1z8zCV7kiWAn/BYPqRb4H3ygaeWU88QnasX2iM7Idwh4Ka/AYP
         2ZhZROceHwfoqI9f3KIMKc1iwzTTB5DkRcyH+cZEuTkfHlygvf9ADzWNSm/AUYSnHMj4
         PGm/SIDLeV8WdntqglF1aHiDCBv0E1Y0nZY84YfsRGc5E2vZomEPGSr0dFGfkmltAwDC
         XQgkmLz7M/+6GtwEwlku88QGxRshG1RLnipn2/+Iy8CReefPrtScX8V193OguhWAoapn
         5Brg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9Kgo2u1L7HEv2l8S3hTJKaDn56ghSYsSCY4oc9rkG4M=;
        fh=Shyw4Ssou6l0RJ8Hg3PTolXkk/msdJJnlaELzE9n7QE=;
        b=Qghe/Fql8R91fwXmi+4+3gCkbR2ZmaotWM0OdzfT8rPUiHhCP3HU/+7VGJoRyVXp52
         IqWgOAqxl3dga0PzihlFXlm01Rj3UW+yRDovhVhFlmhsK89iAEjeW5kOZfSsBmVvyQ2Y
         Z4xm129zWb/snTHZoLwzDmAxDGv3Z0xURzhzyR5YMelOGflciEbmvZylrfxvAtzEAyEE
         k+U6AOb1tVpW3/4aqQNdtVIFRRBkCXNd9ytqiYt2fqlVrbTUHmG+dpnuR+CxepcQeSqc
         5ptPa3hJr5puqD1Xfs2/eZd+3JlR92V0GkFHu2Os9nDb5vSjXE2WSPk0UniAbDkVwbMZ
         /JeA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782187903; x=1782792703; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9Kgo2u1L7HEv2l8S3hTJKaDn56ghSYsSCY4oc9rkG4M=;
        b=lnKTglQsK2oZkJPjKtP95JwNSDbTFBuFSiAcRebmnidwv7TfCZPOWEAasQvhfFseDc
         L2f6izi/5kEzPAAFg5bLRZic0IKSCwQMKG9OGoqYXlA7IllyluBA5tMiEg+hn3qcvdeC
         pZx+3wVbsfXYdWNp68KixktthuGYn1X1A7zXcHg7HglVFOUfyKWsd4Psfupj6I+USnTD
         gHRzlx/6nztYpbNuKwfVOfLo7Qtmtv93nNbzyydFAnXdJ922RnlpucBpb+aPWWKoAM3Q
         k+h1IM5TBKVKbxC1I6n2sSnRsMNwmxFxSAcuT3kaUpXU/XrAO0dUEBN0TX4ll8rcrvF1
         Kn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782187903; x=1782792703;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Kgo2u1L7HEv2l8S3hTJKaDn56ghSYsSCY4oc9rkG4M=;
        b=oJwg2J5PPYLuJBeYUQ9OOonoUd9u1zRM4vFzvF5Cu+laKNcacBOejasPHHrOxdz0fV
         zUaVZSKWXeoEabQmZZI4c9MS669PaVl/US1SmCID8CtPmi/1btU/jxGf+LWWmTX3dJVi
         wzmbi8gRVmhmgcCHRhZwsE7slRXg0UOrAGRUiK9qU48LWsHcNgjnvPbpbz13KGDMStPc
         lKygorjN5rMJR4QgFXDpyUCeeI7h4bmkf+8MkpREvOxMtarf107liuU24nBtmwyWZNOB
         Gu0OUzht1idN6hP4LWWBvEt6qKxPF8DVvafnO0JIEH//Ff0arGo/APE1cFnHnkBuZhM5
         Hx0g==
X-Gm-Message-State: AOJu0Yw7QrNj6hcSr3Fny9no1nVvsDb94cLuufH1YyryZ1zyOWEtBOBC
	ZZXYrUIr2lPfQc80ssE0OzvQJtKmqVgqLycg57518SgEzibG16CBlRd5EnexsFg9mjFiyOXhe77
	e6cVwIIoHaccpRuvfJEiNK9pyjSvb8bk=
X-Gm-Gg: AfdE7ckCnfK4lhssdCABpOxkhYpWD5zHQt3BpdutnUvXVcSKMfCXvs6tlmwEWMyyfzQ
	hCBTA0eOc+N0TjkOF4N6FwSqFjNUqKzG0vqWHW/jtcqGIsfS8npukrd7HHeMLFmC4CN/bROs+gi
	z3DlkSuUNlruUJPh8TTYp1rqehcGmUr1mucIGxZnmkiLeZCr9Qsb0m9o9GCkWNL3kI07wNu9a/9
	HybNGUN2qgKlttwiNkCZ4zi0YLcFxyZZNQaPtBUrvCu2TG0q/jiAZGD+uI8fXSDK5S9ltwx0uKf
	kK9sys+5kDebaOFve4FOZkEvm7Nz+uOIYbO4LxBAAzgp43SGEs8zdXBQ/UXAushOjvGMtL+cE7c
	REZC/Su8BLVmI6ElPMIs7RvO6F+28LxE5DLh1c8kxZEmqxdI5Gs2+dITY6qWDQEW0P1oE8w==
X-Received: by 2002:a05:690e:4842:b0:660:d512:470e with SMTP id
 956f58d0204a3-6635d94b4c0mr381352d50.63.1782187903136; Mon, 22 Jun 2026
 21:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260622132021.37598-1-joaomarcos.costa@bootlin.com>
In-Reply-To: <20260622132021.37598-1-joaomarcos.costa@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Jun 2026 21:11:16 -0700
X-Gm-Features: AVVi8CdE1qG_cBaud5JMCRr40cwcUmyY3Imvew6znbv4E9yG1yG3SBhzbFpHlPk
Message-ID: <CAMKF1srZSyGgoNHztFqPPg5jm-m9Njxr_fv37_L0X3eE9vEmTQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] llvm/clang: fix some syntax issues in llvm-project-source
To: =?UTF-8?Q?Jo=C3=A3o_Marcos_Costa?= <joaomarcos.costa@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com
Content-Type: multipart/alternative; boundary="000000000000e3b8cd0654e3f4f9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 04:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239326

--000000000000e3b8cd0654e3f4f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Jo=C3=A3o, the patchset looks solid, I have one comment if you can
address that we are good to go

On Mon, Jun 22, 2026 at 6:21=E2=80=AFAM Jo=C3=A3o Marcos Costa <
joaomarcos.costa@bootlin.com> wrote:

> Hello,
>
> I faced some strange build issues when switching from one distro to anoth=
er
> (i.e. DISTRO=3D"poky" to DISTRO=3D"foobar"), even after adding "foobar"
> ("foobar:foobar" actually) to CLANG_EXTRA_OE_DISTRO. I started
> investigating
> what was wrong, and I believe the order of pathes in this series reflects
> pretty
> well what specific issue I stumbled upon and what was the next one, on an=
d
> on.
>
> The error message was:
>
> /src/build/tmp/work/riscv64imafdc-foobar-linux/libcxx/22.1.3/recipe-sysro=
ot-native/usr/bin/riscv64-foobar-linux/riscv64-foobar-linux-ld:
> cannot find crtbeginS.o: No such file or directory
> /src/build/tmp/work/riscv64imafdc-foobar-linux/libcxx/22.1.3/recipe-sysro=
ot-native/usr/bin/riscv64-foobar-linux/riscv64-foobar-linux-ld:
> cannot find -lstdc++: No such file or directory
> /src/build/tmp/work/riscv64imafdc-foobar-linux/libcxx/22.1.3/recipe-sysro=
ot-native/usr/bin/riscv64-foobar-linux/riscv64-foobar-linux-ld:
> cannot find -lgcc: No such file or directory
> riscv64-foobar-linux-clang++: error: linker command failed with exit code
> 1 (use -v to see invocation)
>
> As far as I understand, this is precisely what do_preconfigure (+ some
> patches)
> is supposed to handle, so at first it looked like a regression, but it
> seems the
> error only reproduces when switching distros.
>
> For some context, I was building something with
> PREFERRED_TOOLCHAIN_TARGET=3D"clang", using wrynose branch. If I use the
> custom
> distro from the beginning (so no switching), everything works fine (as
> expected).
>
> Best regards,
>
> Jo=C3=A3o Marcos Costa (4):
>   llvm-project-source.inc: fix string replacements in do_preconfigure
>   llvm-project-source.inc: fix end of line in triple variable
>   clang/llvm: add missing instance of Distro class in Linux.cpp
>   llvm-project-source.inc: add vardeps to do_preconfigure
>
>  ...istro-instance-to-getMultiarchTriple.patch | 35 +++++++++++++++++++
>  meta/recipes-devtools/clang/common.inc        |  1 +
>  .../clang/llvm-project-source.inc             |  7 ++--
>  3 files changed, 40 insertions(+), 3 deletions(-)
>  create mode 100644
> meta/recipes-devtools/clang/clang/0001-llvm-clang-Add-Distro-instance-to-=
getMultiarchTriple.patch
>
> --
> 2.47.0
>
>

--000000000000e3b8cd0654e3f4f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks=C2=A0Jo=C3=A3o, the patchset looks solid, I have on=
e comment if you can address that we are good=C2=A0to go</div><br><div clas=
s=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_att=
r">On Mon, Jun 22, 2026 at 6:21=E2=80=AFAM Jo=C3=A3o Marcos Costa &lt;<a hr=
ef=3D"mailto:joaomarcos.costa@bootlin.com">joaomarcos.costa@bootlin.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hell=
o,<br>
<br>
I faced some strange build issues when switching from one distro to another=
<br>
(i.e. DISTRO=3D&quot;poky&quot; to DISTRO=3D&quot;foobar&quot;), even after=
 adding &quot;foobar&quot;<br>
(&quot;foobar:foobar&quot; actually) to CLANG_EXTRA_OE_DISTRO. I started in=
vestigating<br>
what was wrong, and I believe the order of pathes in this series reflects p=
retty<br>
well what specific issue I stumbled upon and what was the next one, on and =
on.<br>
<br>
The error message was:<br>
<br>
/src/build/tmp/work/riscv64imafdc-foobar-linux/libcxx/22.1.3/recipe-sysroot=
-native/usr/bin/riscv64-foobar-linux/riscv64-foobar-linux-ld: cannot find c=
rtbeginS.o: No such file or directory<br>
/src/build/tmp/work/riscv64imafdc-foobar-linux/libcxx/22.1.3/recipe-sysroot=
-native/usr/bin/riscv64-foobar-linux/riscv64-foobar-linux-ld: cannot find -=
lstdc++: No such file or directory<br>
/src/build/tmp/work/riscv64imafdc-foobar-linux/libcxx/22.1.3/recipe-sysroot=
-native/usr/bin/riscv64-foobar-linux/riscv64-foobar-linux-ld: cannot find -=
lgcc: No such file or directory<br>
riscv64-foobar-linux-clang++: error: linker command failed with exit code 1=
 (use -v to see invocation)<br>
<br>
As far as I understand, this is precisely what do_preconfigure (+ some patc=
hes)<br>
is supposed to handle, so at first it looked like a regression, but it seem=
s the<br>
error only reproduces when switching distros.<br>
<br>
For some context, I was building something with<br>
PREFERRED_TOOLCHAIN_TARGET=3D&quot;clang&quot;, using wrynose branch. If I =
use the custom<br>
distro from the beginning (so no switching), everything works fine (as expe=
cted).<br>
<br>
Best regards,<br>
<br>
Jo=C3=A3o Marcos Costa (4):<br>
=C2=A0 llvm-project-source.inc: fix string replacements in do_preconfigure<=
br>
=C2=A0 llvm-project-source.inc: fix end of line in triple variable<br>
=C2=A0 clang/llvm: add missing instance of Distro class in Linux.cpp<br>
=C2=A0 llvm-project-source.inc: add vardeps to do_preconfigure<br>
<br>
=C2=A0...istro-instance-to-getMultiarchTriple.patch | 35 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-devtools/clang/common.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
=C2=A0.../clang/llvm-project-source.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 7 ++--<br>
=C2=A03 files changed, 40 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0001-llvm-clang-=
Add-Distro-instance-to-getMultiarchTriple.patch<br>
<br>
-- <br>
2.47.0<br>
<br>
</blockquote></div>

--000000000000e3b8cd0654e3f4f9--

