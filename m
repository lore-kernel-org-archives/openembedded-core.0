Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E1FCA101F
	for <webhook@archiver.kernel.org>; Sun,  7 Sep 2025 15:47:50 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.21221.1757260063493189981
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Sep 2025 08:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=HfNWt4/k;
 spf=pass (domain: underview.tech, ip: 209.85.128.43, mailfrom: vince@underview.tech)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45de1e6d76fso6647455e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Sep 2025 08:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1757260062; x=1757864862; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zm/bxOG8kWVesplElwB11t10lXM0b1ITkpuQYHTZ3L8=;
        b=HfNWt4/k1C29BfLd9lxcIWCa1LJkQL+RgAmvQAKPPrRbRmiC9x4zVU8/VJxThYmLFk
         Mg+x0JWilaXri6At/H2Bg6YtU/XfCV7TZLmtFJdE1NW9kvGVXD5S54xzKDWts8cy90Yk
         ed1hUxkjLRbORDYjOSR/nvOC7YBR7s5spIwoq1B30WL4MHZgOB2NiUKw3DyQ/u/S4HxH
         RMNZ8shvjDoOrrzgDW8SkxPOcUmgik16LX3rv1ZJmnyRAzCG+Aqe6g07Mg7uAHt317FQ
         3gxRF1LrgeHdZ+1HXAC8JJuRm2gjkfjkuoQ8xKighuCW4wTtwH3zYgR+cpTRxOZeRyT/
         jmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757260062; x=1757864862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zm/bxOG8kWVesplElwB11t10lXM0b1ITkpuQYHTZ3L8=;
        b=j580JvIOGLWMSqWVdxMYl2GNWB+GilvRwT8S96IQpAZfkjphzvW1+nehKVOzcjY6pY
         d0v+T31QeBOGiMPX021uTj5pU9Ub3mT4LZUYmksJqHD2zQZlXSiV/7SE+e7xiKl8HPsJ
         Y8lp3Hqg5pgWhgikXaVyhyrb/cbcVG9hvu292jcpbOIp99foJAzjngDh9ZpRZXBjk7fH
         Ag69tj7ZtfyLyXArUhOz7R7L/PZV6bQBLM01fkCQ2MWlNGOGH9M+8CEYvuSCRlDJnenb
         gD/bcw6R5e+AQwuCARveBmrwEITejIxaUOhRA61xBdYzKeaPa52El5J64+Z34ycTGqKV
         thQA==
X-Gm-Message-State: AOJu0YzNaZlQba9xeI9jDXHThoROZQuxv0c+NtwCwiPAr8qml45evqUz
	MQZZ/SkPlsABn4dXsS6NFzMOn+TfCSh8p0bkNVH7CD6bewexAPwq64Dfd+/yMWp2/tx0MvD60b4
	eFjVN1RLkmlgtS1uEVij8OjjRvdl2qhZRumwnoRxjAw==
X-Gm-Gg: ASbGncuDoyOMeXH8XO5GSxqvJt+jSMUobMB3zUxapvvFIpfZC6RX8PuqWbjOfMdFQwf
	9R71q3ZtWWuKSOIChrBSb+N2KiQgYZaLKmuMT+XfdkyWqS5ctyIVI3xPGBkHdFd8AdKgfNhAX/8
	e0k9QGKnsoubQcILCOxnj4KdwEJEgf9dHigwuyokk+B10eui+TucJLh90GqDGzfa70siu9cRRcA
	5H1NKjULSlxVYlmeDn3
X-Google-Smtp-Source: AGHT+IFBAR658ebZ0vYrfXetMCr5qpY4ubI4hso2iwyx7KiHp2BGzq9AtrbFKxZktnjkv83UifsOYawacz711c3o6Qk=
X-Received: by 2002:a05:600c:1f0e:b0:45d:e326:96ef with SMTP id
 5b1f17b1804b1-45de5557e89mr12970895e9.15.1757260061552; Sun, 07 Sep 2025
 08:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250905164136.2896809-1-vince@underview.tech> <DCMMGFDTYJD0.3EMQPQ884OGL2@bootlin.com>
In-Reply-To: <DCMMGFDTYJD0.3EMQPQ884OGL2@bootlin.com>
From: Vincent Davis <vince@underview.tech>
Date: Sun, 7 Sep 2025 11:47:29 -0400
X-Gm-Features: AS18NWAUWikHeyU3HlTFcI3KmHWsyA7Sk3goxemk3Q2xwOAIkC7bBnYNUnOfnOg
Message-ID: <CAPQx_gPwZ7y0kddQc3TvKSeb18-Zmf8ZW5q38M9uiCYV2qTEbw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 1/8] bootimg_pcbios: support grub hybrid boot
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bf4529063e37fd01"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Sep 2025 15:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223054

--000000000000bf4529063e37fd01
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Okay

Is there anyway I can see

qemu_boot_log.20250907083922?

Also assuming we are running in a docker container.

May I see the Docker file.

Ran v3 against latest poky using an ubuntu docker container after cherry
picking v3 commits into it.

DISTRO =3D "poky"
MACHINE =3D "qemux86-64" I believe not near computer.

My docker file and docker compose file

https://github.com/under-view/docker-builds/blob/master/containers/yocto-pr=
oject/ubuntu-24.04/Dockerfile

https://github.com/under-view/docker-builds/blob/master/composes/default-co=
mpose.yaml






On Sun, Sep 7, 2025, 10:02=E2=80=AFAM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Fri Sep 5, 2025 at 6:41 PM CEST, Vincent Davis Jr wrote:
> > If caller wants to primarily leverage
> > grub as the primary boot loader current
> > oe-core doesn't support booting grub when
> > the boot firmware is legacy BIOS based and
> > the partition table format is GPT based.
> >
> > Issue GPT header reside where core.img
> > should be located (at byte 512).
> >
> > To navigate around issue core.img was
> > moved to a seperate partition.
> >
> > If disk is a GPT disk caller must specify
> > the file system type as none and set the
> > partition type as BIOS boot. No filesystem
> > will be created on partition. This also
> > allows wic plugin to know where to dd
> > core.img.
> >
> > Unfortunately No deep dive into grub-install
> > was perform to know the exact bytes changed
> > in hybrid boot case. To see the change in
> > bytes generated boot.img + core.img was compared
> > to boot.img + core.img after grub-install was
> > executed using the xxd command.
> >
> > Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> > ---
>
> Hi Vincent,
>
> We still have the same failure as on v2. Still happening with selftests
> running on debian host, so there might be something related to the host
> configuration.
>
> ERROR: Qemu log output from
> /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-2287526/tmp=
/work/qemux86_64-poky-linux/core-image-minimal/1.0/testimage/qemu_boot_log.=
20250907083922:
> SeaBIOS (version rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org)
> ...
> iPXE (http://ipxe.org) 00:02.0 CA00 PCI2.10 PnP PMM+0EFC6560+0EF26560 CA0=
0
> Press Ctrl-B to configure iPXE (PCI 00:02.0)...
> ...
> Booting from Hard Disk..
> 2025-09-07 08:56:24,256 - oe-selftest - INFO - 9: 79/94 577/639 (1085.73s=
)
> (0 failed) (wic.Wic2.test_grub_install_biosplusefi_qemu)
> 2025-09-07 08:56:24,265 - oe-selftest - INFO -
> testtools.testresult.real._StringException: Traceback (most recent call
> last):
>   File
> "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/utils=
/commands.py",
> line 390, in runqemu
>     qemu.start(params=3Dqemuparams, ssh=3Dssh, runqemuparams=3Drunqemupar=
ams,
> launch_cmd=3Dlaunch_cmd, discard_writes=3Ddiscard_writes)
>   File
> "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/targe=
tcontrol.py",
> line 179, in start
>     raise RuntimeError("%s - FAILED to start qemu - check the task log an=
d
> the boot log" % self.pn)
> RuntimeError: core-image-minimal - FAILED to start qemu - check the task
> log and the boot log
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2280
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

--000000000000bf4529063e37fd01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Okay<br><div dir=3D"auto"><br></div><div dir=3D"auto">Is =
there anyway I can see</div><div dir=3D"auto"><br></div><div dir=3D"auto">q=
emu_boot_log.20250907083922?</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Also assuming we are running in a docker container.=C2=A0</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">May I see the Docker file.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Ran v3 against latest poky using =
an ubuntu docker container after cherry picking v3 commits into it.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">DISTRO =3D &quot;poky&quot;</di=
v><div dir=3D"auto">MACHINE =3D &quot;qemux86-64&quot; I believe not near c=
omputer.</div><div dir=3D"auto"><br></div><div dir=3D"auto">My docker file =
and docker compose file</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
<a href=3D"https://github.com/under-view/docker-builds/blob/master/containe=
rs/yocto-project/ubuntu-24.04/Dockerfile">https://github.com/under-view/doc=
ker-builds/blob/master/containers/yocto-project/ubuntu-24.04/Dockerfile</a>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto"><a href=3D"https://gith=
ub.com/under-view/docker-builds/blob/master/composes/default-compose.yaml">=
https://github.com/under-view/docker-builds/blob/master/composes/default-co=
mpose.yaml</a></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">=
<br></div></div><br><div class=3D"gmail_quote gmail_quote_container"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 7, 2025, 10:02=E2=80=AFAM Mathi=
eu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-briand@bootlin.com">m=
athieu.dubois-briand@bootlin.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On Fri Sep 5, 2025 at 6:41 PM CEST, Vincent Davis Jr wrote:<b=
r>
&gt; If caller wants to primarily leverage<br>
&gt; grub as the primary boot loader current<br>
&gt; oe-core doesn&#39;t support booting grub when<br>
&gt; the boot firmware is legacy BIOS based and<br>
&gt; the partition table format is GPT based.<br>
&gt;<br>
&gt; Issue GPT header reside where core.img<br>
&gt; should be located (at byte 512).<br>
&gt;<br>
&gt; To navigate around issue core.img was<br>
&gt; moved to a seperate partition.<br>
&gt;<br>
&gt; If disk is a GPT disk caller must specify<br>
&gt; the file system type as none and set the<br>
&gt; partition type as BIOS boot. No filesystem<br>
&gt; will be created on partition. This also<br>
&gt; allows wic plugin to know where to dd<br>
&gt; core.img.<br>
&gt;<br>
&gt; Unfortunately No deep dive into grub-install<br>
&gt; was perform to know the exact bytes changed<br>
&gt; in hybrid boot case. To see the change in<br>
&gt; bytes generated boot.img + core.img was compared<br>
&gt; to boot.img + core.img after grub-install was<br>
&gt; executed using the xxd command.<br>
&gt;<br>
&gt; Signed-off-by: Vincent Davis Jr &lt;vince@underview.tech&gt;<br>
&gt; ---<br>
<br>
Hi Vincent,<br>
<br>
We still have the same failure as on v2. Still happening with selftests<br>
running on debian host, so there might be something related to the host<br>
configuration.<br>
<br>
ERROR: Qemu log output from /srv/pokybuild/yocto-worker/oe-selftest-debian/=
build/build-st-2287526/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.=
0/testimage/qemu_boot_log.20250907083922:<br>
SeaBIOS (version <a href=3D"http://rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu=
.org" rel=3D"noreferrer noreferrer" target=3D"_blank">rel-1.16.3-0-ga6ed6b7=
01f0a-prebuilt.qemu.org</a>)<br>
...<br>
iPXE (<a href=3D"http://ipxe.org" rel=3D"noreferrer noreferrer" target=3D"_=
blank">http://ipxe.org</a>) 00:02.0 CA00 PCI2.10 PnP PMM+0EFC6560+0EF26560 =
CA00<br>
Press Ctrl-B to configure iPXE (PCI 00:02.0)...<br>
...<br>
Booting from Hard Disk..<br>
2025-09-07 08:56:24,256 - oe-selftest - INFO - 9: 79/94 577/639 (1085.73s) =
(0 failed) (wic.Wic2.test_grub_install_biosplusefi_qemu)<br>
2025-09-07 08:56:24,265 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta=
/lib/oeqa/utils/commands.py&quot;, line 390, in runqemu<br>
=C2=A0 =C2=A0 qemu.start(params=3Dqemuparams, ssh=3Dssh, runqemuparams=3Dru=
nqemuparams, launch_cmd=3Dlaunch_cmd, discard_writes=3Ddiscard_writes)<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta=
/lib/oeqa/targetcontrol.py&quot;, line 179, in start<br>
=C2=A0 =C2=A0 raise RuntimeError(&quot;%s - FAILED to start qemu - check th=
e task log and the boot log&quot; % <a href=3D"http://self.pn" rel=3D"noref=
errer noreferrer" target=3D"_blank">self.pn</a>)<br>
RuntimeError: core-image-minimal - FAILED to start qemu - check the task lo=
g and the boot log<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/buil=
ds/2280" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobuilde=
r.yoctoproject.org/valkyrie/#/builders/35/builds/2280</a><br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
<br>
</blockquote></div>

--000000000000bf4529063e37fd01--

