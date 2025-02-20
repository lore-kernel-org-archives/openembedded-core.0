Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D88C021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 09:20:21 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.45553.1740043219650230601
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 01:20:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SMDt1LN6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38f2b7ce2e5so357664f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 01:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740043218; x=1740648018; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gey7WyqkzEPMXR/ZCWfn4A4qYqoyLkFIUZwkmxMx9/4=;
        b=SMDt1LN6uB33FQ0Y+KgyP7/O6bgiTElvUVN1VDZnXdcuNhKyKWp3wTpohrNVg84Tjd
         u7Xl9d53tMsqDJ+/paj2rqImopmfydAMrVCm+yFCgDESQltQzK2vPVKjCcCk2cg3rDGW
         3P+8x830ffiHAZNkHb9XIHO3Z/ZE4YGNRRuL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043218; x=1740648018;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gey7WyqkzEPMXR/ZCWfn4A4qYqoyLkFIUZwkmxMx9/4=;
        b=tP06bSCl5Er+kgSk5ytIhHDkEnqcR0Oc9TBkkmW0OwL3Je+1P/oz2PJqPD+rpE5hLP
         6YzLtoR9RREjVJNMoKAWs2wUfOLD6aYkiLfKAyfGNGtJoBL2pbs3q8/p1HNC1s28ksqQ
         kmJXet/zTgHHQeCFJCwvQMk2YGvPVrRFhezSybxXinNodyrW/W/x3tn6JYCRhdTLu/Yu
         tJbwENubNeOfvUNyMOjpV0ubKN2Qqs1M7eNLP1+q4SGqvKoQQgDSe+iBx8rG5uzvmur6
         +zq7HJHTU8/UQawVyqV8ZZLjjrUMYd6NiGsuDw+Jh/apfIdXeN/jyAFfE+Xm8Dogd4QX
         HfyA==
X-Gm-Message-State: AOJu0YzHEVkFoIznic4yIK/8srX0q7r/Z2Tj5K/VJzYNWBUZJMOcHrYV
	1vh87NI6E4cZn31uCR9uAa2QFpycEZ87vIAYv5tgCi47eT/dizr2aKOlJc6qEFI=
X-Gm-Gg: ASbGncvVD9W1Bw26PiUk+Ko/FnL5LxmLJ1TGmCFTiYRQZzQRZRT4OfpJeU56+feY+k0
	Om1GLIxUcFWb4P8UdSXBbYmiEIsiWnVxKMS2HK7HtNRAGnjH4MVeC/p9RXzX7LsM6e0ueORQLz/
	ZoAQ7TmaAlxKDjhA23vN2ZTS9uiM9lAnKK01ydlZ4o5ZQROhL3ZWDGa2gw7tc79MFpeAn/MurLT
	TNf97e0OCs0KtUlaCU7rsTvCMCnGPUoEtjJcMbqoYzceoUFvi1Anm0umEX/TiBzRiQWHUpxq4mT
	LWdJFqMPMtSIdhrqEzNeCTmKXvBB8oZhKVrXXfVFbLJY1bQmK7Qd3p463sqbZzf3t96wEjw38hb
	kcbC5
X-Google-Smtp-Source: AGHT+IE4SkVu84v0T2yzrN3WIrbueR903u+jI9tCrhUEiJdts/EeR26JA6GPmx4wLYDQnYLjkg622A==
X-Received: by 2002:a05:6000:188c:b0:38f:22ed:f9e9 with SMTP id ffacd0b85a97d-38f33f42692mr24857523f8f.21.1740043217813;
        Thu, 20 Feb 2025 01:20:17 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:9458:4cb6:ddd6:4840? ([2001:8b0:aba:5f3c:9458:4cb6:ddd6:4840])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a0558e2sm235290615e9.11.2025.02.20.01.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:20:17 -0800 (PST)
Message-ID: <d3e2d988c109520827afe6a514375e5510075cc2.camel@linuxfoundation.org>
Subject: Re: [poky] [PATCH 2/2] psplash: start via udev if framebuffer
 device detected
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org, poky@lists.yoctoproject.org, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Jon Mason
 <Jon.Mason@arm.com>, Ross Burton <ross.burton@arm.com>
Date: Thu, 20 Feb 2025 09:20:16 +0000
In-Reply-To: <Z7bpaerggUQ4vgqK@nuoska>
References: <20250206144406.1328276-1-mikko.rapeli@linaro.org>
	 <a7821314c57220b19a189530d48a64934c4b4820.camel@linuxfoundation.org>
	 <Z7bpaerggUQ4vgqK@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 09:20:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211747

On Thu, 2025-02-20 at 10:35 +0200, Mikko Rapeli wrote:
> Hi,
>=20
> On Wed, Feb 19, 2025 at 03:59:59PM +0000, Richard Purdie wrote:
> > On Thu, 2025-02-06 at 16:44 +0200, Mikko Rapeli via lists.yoctoproject.=
org wrote:
> > > psplash-start.service expected to find /dev/fb0 and failed
> > > if device was not found. This failure breaks systemd
> > > oeqa runtime test with "runqemu nographic". Starting
> > > psplash based on detected framebuffer device fixes systemd
> > > boot status and systemd oeqa runtime tests for qemu
> > > boots with and without graphics support.
> > >=20
> > > Note that psplash-systemd.service still depends on /dev/fb0
> > > so startup with multiple framebuffer devices may not work
> > > correctly. I don't have devices with multiple framebuffer
> > > devices to test with.
> > >=20
> > > On qemu machine with graphics, psplash displays yocto
> > > logo correctly and boot progress bar as well. Once boot completes
> > > to systemd "running" state, the logo is replaced by login prompt.
> > > On qemu machine without graphics, boot completes without psplash
> > > or failures and login over serial console works normally.
> > > Tested with genericarm64 machine poky-altcfg distro and core-image-ba=
se
> > > image on qemu. AMD kv260 tested as well but graphics stack is not yet
> > > working there so boot is similar to qemu without graphics.
> > >=20
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > ---
> > > =C2=A0meta/recipes-core/psplash/files/fb.rules=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 1 +
> > > =C2=A0.../{psplash-start.service =3D> psplash-start@.service}=C2=A0=
=C2=A0=C2=A0 | 5 ++---
> > > =C2=A0meta/recipes-core/psplash/files/psplash-systemd.service=C2=A0 |=
 8 +++-----
> > > =C2=A0meta/recipes-core/psplash/psplash_git.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 9 ++++++---
> > > =C2=A04 files changed, 12 insertions(+), 11 deletions(-)
> > > =C2=A0create mode 100644 meta/recipes-core/psplash/files/fb.rules
> > > =C2=A0rename meta/recipes-core/psplash/files/{psplash-start.service =
=3D> psplash-start@.service} (84%)
> >=20
> > Unfortunately I think this has introduced an intermittent QA test
> > failure showing up in meta-arm in particular. Examples:
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/994/=
steps/22/logs/stdio
>=20
> Feb 19 01:26:42 sbsa-ref psplash-systemd[261]: Error unable to open fifo
>=20
> This means psplash.service did not start or did not yet create it. Can I =
somehow see the
> build and boot configuration?

If you shorten the url you can see the list of steps taken:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/994


The failure in this case is from sbsa-ref and the "Write config" just
before that is step 20 which is:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/994/step=
s/20/logs/stdio

That at least gives you the config of the build. Step 21 builds it,
then step 22 runs the tests which fail.

> Feb 19 01:27:12 sbsa-ref systemd[1]: /usr/lib/systemd/system/psplash-syst=
emd.service:8: Unknown key 'ConditionFileExists' in section [Unit], ignorin=
g.
> Feb 19 01:27:26 sbsa-ref systemd[1]: /usr/lib/systemd/system/psplash-syst=
emd.service:8: Unknown key 'ConditionFileExists' in section [Unit], ignorin=
g.
>=20
> psplash.service is of type notify and fifo is created before systemd is n=
otified, but
> the fifo creation could also fail due to other reasons which I can't see =
from the logs.
>=20
> Fixing the condition will fix the systemd test failure but plsplash and p=
rogress
> bar may have functional failures.
>=20
> I will send a patch.
>=20
> > https://gitlab.com/jonmason00/meta-arm/-/jobs/9155263483
>=20
> This looks like something completely different:
>=20
> 2025-02-17 22:43:20 - INFO=C2=A0=C2=A0=C2=A0=C2=A0 - AssertionError: 3 !=
=3D 0 : SYSTEMD_BUS_TIMEOUT=3D240s systemctl status --full --failed
> 2025-02-17 22:43:20 - INFO=C2=A0=C2=A0=C2=A0=C2=A0 - x dev-disk-by\x2duui=
d-38d0b388\x2d9989\x2d4744\x2d8a0a\x2d3e6be1135f5a.swap - /dev/disk/by-uuid=
/38d0b388-9989-4744-8a0a-3e6be1135f5a
> 2025-02-17 22:43:20 - INFO=C2=A0=C2=A0=C2=A0=C2=A0 - Loaded: loaded (/etc=
/fstab; generated)
> 2025-02-17 22:43:20 - INFO=C2=A0=C2=A0=C2=A0=C2=A0 - Active: failed (Resu=
lt: exit-code) since Mon 2025-02-17 22:41:32 UTC; 20min left
> 2025-02-17 22:43:20 - INFO=C2=A0=C2=A0=C2=A0=C2=A0 - Invocation: 6e51ad1d=
846f4e8cbb129f05d75ac240
> 2025-02-17 22:43:20 - INFO=C2=A0=C2=A0=C2=A0=C2=A0 - What: /dev/disk/by-u=
uid/38d0b388-9989-4744-8a0a-3e6be1135f5a
> 2025-02-17 22:43:20 - INFO=C2=A0=C2=A0=C2=A0=C2=A0 - Docs: man:fstab(5)
> 2025-02-17 22:43:20 - INFO=C2=A0=C2=A0=C2=A0=C2=A0 - man:systemd-fstab-ge=
nerator(8)
> 2025-02-17 22:43:20 - INFO=C2=A0=C2=A0=C2=A0=C2=A0 - Mem peak: 1.7M
> 2025-02-17 22:43:20 - INFO=C2=A0=C2=A0=C2=A0=C2=A0 - CPU: 198ms
> 2025-02-17 22:43:20 - INFO=C2=A0=C2=A0=C2=A0=C2=A0 -=20
> 2025-02-17 22:43:20 - INFO=C2=A0=C2=A0=C2=A0=C2=A0 - Feb 17 22:41:32 sbsa=
-ref systemd[1]: Activating swap /dev/disk/by-uuid/38d0b388-9989-4744-8a0a-=
3e6be1135f5a...
> 2025-02-17 22:43:20 - INFO=C2=A0=C2=A0=C2=A0=C2=A0 - Feb 17 22:41:32 sbsa=
-ref swapon[210]: swapon: /dev/sda3: swap format pagesize does not match.
> 2025-02-17 22:43:20 - INFO=C2=A0=C2=A0=C2=A0=C2=A0 - Feb 17 22:41:32 sbsa=
-ref swapon[210]: swapon: /dev/sda3: reinitializing the swap.
> 2025-02-17 22:43:20 - INFO=C2=A0=C2=A0=C2=A0=C2=A0 - Feb 17 22:41:32 sbsa=
-ref swapon[212]: mkswap: invalid option -- 'U'
> 2025-02-17 22:43:20 - INFO=C2=A0=C2=A0=C2=A0=C2=A0 - Feb 17 22:41:32 sbsa=
-ref swapon[212]: BusyBox v1.37.0 () multi-call binary.
> 2025-02-17 22:43:20 - INFO=C2=A0=C2=A0=C2=A0=C2=A0 - Feb 17 22:41:32 sbsa=
-ref swapon[212]: Usage: mkswap [-L LBL] BLOCKDEV [KBYTES]
> 2025-02-17 22:43:20 - INFO=C2=A0=C2=A0=C2=A0=C2=A0 - Feb 17 22:41:32 sbsa=
-ref systemd[1]: dev-disk-by\x2duuid-38d0b388\x2d9989\x2d4744\x2d8a0a\x2d3e=
6be1135f5a.swap: Swap process exited, code=3Dexited, status=3D255/EXCEPTION
> 2025-02-17 22:43:20 - INFO=C2=A0=C2=A0=C2=A0=C2=A0 - Feb 17 22:41:32 sbsa=
-ref systemd[1]: dev-disk-by\x2duuid-38d0b388\x2d9989\x2d4744\x2d8a0a\x2d3e=
6be1135f5a.swap: Failed with result 'exit-code'.
> 2025-02-17 22:43:20 - INFO=C2=A0=C2=A0=C2=A0=C2=A0 - Feb 17 22:41:32 sbsa=
-ref systemd[1]: Failed to activate swap /dev/disk/by-uuid/38d0b388-9989-47=
44-8a0a-3e6be1135f5a.
>=20
> So these could be fixed by adding util-linux-mkswap to the images instead=
 of
> relying on busybox?
>=20
> I will send a patch.

Thanks, and sorry, I thought that was the same failure for some reason.

>=20
> > but it doesn't always fail. There were other failures if you look
> > through the meta-arm builds.
>=20
> Link to the builds?

The builds for meta-arm can be found by going to the autobuilder main page:

https://autobuilder.yoctoproject.org/valkyrie/#/

then "Builds" on the LHS sidebar, "Builders", "meta-arm", i.e.:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/75

where the failing builds are:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/986
https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/991
https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/992
https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/994
https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/1001
https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/1003

Cheers,

Richard



