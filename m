Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 622C3CCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 12:17:44 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.30891.1761567461283339353
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 05:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iIkfyNRZ;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-33bafd5d2adso4347405a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 05:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761567461; x=1762172261; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bIniFzyrg2VCxyqGimmIFfNXZz9VEfZswG6G+9xaMwg=;
        b=iIkfyNRZRVRi4stFcHnvyCgcII7BP227ycXPVBkaqu5yl0OdrN3s/pdIhXvhsGzGw3
         ZwhqH7z4mGNpxU2MGJG1QQvUE5jh0tKrsY2RINEyCOpo0B60cI5SYadPT0iV60auG1qR
         buvt+uaBQTkSLUdSqWFxT1Bii97bYakIwyFQbjLNdeyep2XWr1tmdBJHJVK8OxzXlBba
         DSLAqmo7sKcYfjhwg59mVViw6/2k69uVzT27qVtwCl1BmkExpAETTUweVrzau5h/JuGn
         ewmZt7W82f//kPqJLWmw3iD3OWq7IEzxx8Q+WhgXAp+oHH3uDuA4MS7hqaLNYUS0aJzk
         I1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761567461; x=1762172261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bIniFzyrg2VCxyqGimmIFfNXZz9VEfZswG6G+9xaMwg=;
        b=KGhkmGFOZNHicGZ6kHZSgXKllacxANlgA44MGvCveT5OG20YjIo7T6BI5bhvgGmChX
         FboSZX3oTB/mjBw8YL0+Nxt0iVJVzxpQuQ3Fu2QCBgRVHLvCkcWIcoBLqFD4RnR+xE7k
         W5LzZZx8y5+pOgPp9qoO01j0KmMp1Nl1koFFPwSHX4yNHPBSpQgjotj8EFUcXU6xumzC
         zD3AfXa4mMefA1Sj1XVMQYx8X4NIfat5GvwIzs/TY+DuPpEa3mgD1Ql6DoYcnvTJqEGw
         O7atWe0jtO9R358uL8DoRtE8goTlx5ZnRKiql3PjHAyA9fdoyK0Ppz6jDQX6BLekWOZL
         JdEA==
X-Forwarded-Encrypted: i=1; AJvYcCVJkiscQqQQQh1FWOkufHwn7k8bwoqrq7bHq+RNkj83KaXPim0sWNo4sIlC3+QYzBoAlk40vF7OURNV/SPoePLbjg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yym/dssP+5owXdrQJAnGZB8SVmDSAKA4iL3Ac8Rv4Bi14+TX3Mh
	Z2iC5g8/O2bEKBLA6SnhF0H621zjWqEHLjMsgSGLakgOdn8KI2H77JKA3NTgjYN0JQEZNIb/HlR
	9EGqwgPr+17goFndY81IELzlD+1y1TiM=
X-Gm-Gg: ASbGncvbofRyETfb5VqH6XeZ3pskiv/5XA72rRBMXhiS/B/kXly69oSjCS2wiHRTu+E
	qNeG9b161qaUpG5Ilw5NH6d4+7+QCiOsKVCD+VYFFzXSyguxzbqeAidfq5WfGJqDdeGjggdQzIU
	vcKIZqlOcwnQ9IX5b2cmtznCj/ZZbEgfkHN/KeNI9IILYkPUbQUOKiDt7Yvg/jpWc98Zx1aA4z2
	0NtwZ2YfUMlz92iMMCH8vqBF3zJwZbD6TeoXF87HMZOd2LIW8M/rwuisiL0ohUFty79mveL
X-Google-Smtp-Source: AGHT+IHh6yBqRG69DkWFuUZadaYi6l7NwpPVflvh1nVpsriokt2tSjM9BDe1CSks3LMznKGY2qlz/awo0Mho9IesVUw=
X-Received: by 2002:a17:90a:e70f:b0:32f:98da:c397 with SMTP id
 98e67ed59e1d1-33bcf8f735emr45065922a91.24.1761567460268; Mon, 27 Oct 2025
 05:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1761360245.git.bruce.ashfield@gmail.com>
 <65b6f4cb57e6738e48560539cf2c0485e0469b65.1761360245.git.bruce.ashfield@gmail.com>
 <DDSZYF5TWBO9.2Z5Y4SR4SE5D8@bootlin.com>
In-Reply-To: <DDSZYF5TWBO9.2Z5Y4SR4SE5D8@bootlin.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 27 Oct 2025 08:17:28 -0400
X-Gm-Features: AWmQ_bk4zNp--irg3WKgTsZfKZ8TQzbgJIl03SCnc7pX9bb_pN5_SHyiG8tw5xM
Message-ID: <CADkTA4M90CB7qmkO=dxr1KUkfxbotH_trwL3mgpo4abj8=Mbrw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] linux-yocto: introduce 6.17 reference kernels
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b79de0064222e274"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 12:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225331

--000000000000b79de0064222e274
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 5:28=E2=80=AFAM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Sat Oct 25, 2025 at 4:48 AM CEST, Bruce Ashfield via
> lists.openembedded.org wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > The 6.17 kernel went through quite a bit of testing via
> > linux-yocto-dev, so it is a relatively well understood release.
> >
> > These recipes introduce it as a fully tested reference with the
> > potential to replace the EOL 6.16 refs.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
>
> Hi Bruce,
>
> Thanks for your patch. It looks like we do have some issue with qemu
> images failing to boot on ARM:
>
> Traceback (most recent call last):
>   File
> "/srv/pokybuild/yocto-worker/qemuarm-oecore/build/layers/openembedded-cor=
e/meta/lib/oeqa/core/decorator/__init__.py",
> line 35, in wrapped_f
>     return func(*args, **kwargs)
>            ^^^^^^^^^^^^^^^^^^^^^
>   File
> "/srv/pokybuild/yocto-worker/qemuarm-oecore/build/layers/openembedded-cor=
e/meta/lib/oeqa/runtime/cases/parselogs.py",
> line 185, in test_parselogs
>     self.assertEqual(errcount, 0, msg=3Dself.msg)
> AssertionError: 2 !=3D 0 : Log:
> /srv/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp/work/qemuarm-o=
e-linux-gnueabi/core-image-sato/1.0/target_logs/dmesg
> -----------------------
> Central error: [    2.782604] check access for rdinit=3D/init failed: -2,
> ignoring
> ***********************
> [    2.708951] Key type fscrypt-provisioning registered
> [    2.716922] Btrfs loaded, zoned=3Dno, fsverity=3Dno
> [    2.719780] Key type encrypted registered
> [    2.722461] netconsole: network logging started
> [    2.763480] IP-Config: Complete:
> [    2.764617]      device=3Deth0, hwaddr=3D52:54:00:12:34:02,
> ipaddr=3D192.168.7.2, mask=3D255.255.255.0, gw=3D192.168.7.1
> [    2.767176]      host=3D192.168.7.2, domain=3D, nis-domain=3D(none)
> [    2.768653]      bootserver=3D255.255.255.255,
> rootserver=3D255.255.255.255, rootpath=3D
> [    2.768746]      nameserver0=3D8.8.8.8
> [    2.773746] clk: Disabling unused clocks
> [    2.782604] check access for rdinit=3D/init failed: -2, ignoring
> [    2.784414] md: Waiting for all devices to be available before
> autodetect
> [    2.786070] md: If you don't use raid, use raid=3Dnoautodetect
> [    2.787605] md: Autodetecting RAID arrays.
> [    2.788689] md: autorun ...
> [    2.788965] md: ... autorun DONE.
> [    2.863628] usb 1-1: new high-speed USB device number 2 using xhci_hcd
> [    2.881074] EXT4-fs (vda): mounted filesystem
> 49485ab8-9460-46e8-bf1c-423f2c03e0bb r/w with ordered data mode. Quota
> mode: disabled.
> [    2.887371] VFS: Mounted root (ext4 filesystem) on device 253:0.
> [    2.892345] devtmpfs: mounted
> [    3.045885] input: QEMU QEMU USB Tablet as
> /devices/platform/3f000000.pcie/pci0000:00/0000:00:02.0/usb1/1-1/1-1:1.0/=
0003:0627:0001.0001/input/input0
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/2629
>
> Can you have a look at this?
>

It boots locally, so I don't have any great ideas.

We'd need the ARM guys to step in and offer some more specific advice.

Bruce



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

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000b79de0064222e274
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 27, 2025 at 5:28=
=E2=80=AFAM Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-bria=
nd@bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Sat Oct 25, 2025 at 4:4=
8 AM CEST, Bruce Ashfield via <a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;<br>
&gt; The 6.17 kernel went through quite a bit of testing via<br>
&gt; linux-yocto-dev, so it is a relatively well understood release.<br>
&gt;<br>
&gt; These recipes introduce it as a fully tested reference with the<br>
&gt; potential to replace the EOL 6.16 refs.<br>
&gt;<br>
&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gma=
il.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Bruce,<br>
<br>
Thanks for your patch. It looks like we do have some issue with qemu<br>
images failing to boot on ARM:<br>
<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemuarm-oecore/build/layers/o=
penembedded-core/meta/lib/oeqa/core/decorator/__init__.py&quot;, line 35, i=
n wrapped_f<br>
=C2=A0 =C2=A0 return func(*args, **kwargs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^^^^^^<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemuarm-oecore/build/layers/o=
penembedded-core/meta/lib/oeqa/runtime/cases/parselogs.py&quot;, line 185, =
in test_parselogs<br>
=C2=A0 =C2=A0 self.assertEqual(errcount, 0, msg=3Dself.msg)<br>
AssertionError: 2 !=3D 0 : Log: /srv/pokybuild/yocto-worker/qemuarm-oecore/=
build/build/tmp/work/qemuarm-oe-linux-gnueabi/core-image-sato/1.0/target_lo=
gs/dmesg<br>
-----------------------<br>
Central error: [=C2=A0 =C2=A0 2.782604] check access for rdinit=3D/init fai=
led: -2, ignoring<br>
***********************<br>
[=C2=A0 =C2=A0 2.708951] Key type fscrypt-provisioning registered<br>
[=C2=A0 =C2=A0 2.716922] Btrfs loaded, zoned=3Dno, fsverity=3Dno<br>
[=C2=A0 =C2=A0 2.719780] Key type encrypted registered<br>
[=C2=A0 =C2=A0 2.722461] netconsole: network logging started<br>
[=C2=A0 =C2=A0 2.763480] IP-Config: Complete:<br>
[=C2=A0 =C2=A0 2.764617]=C2=A0 =C2=A0 =C2=A0 device=3Deth0, hwaddr=3D52:54:=
00:12:34:02, ipaddr=3D192.168.7.2, mask=3D255.255.255.0, gw=3D192.168.7.1<b=
r>
[=C2=A0 =C2=A0 2.767176]=C2=A0 =C2=A0 =C2=A0 host=3D192.168.7.2, domain=3D,=
 nis-domain=3D(none)<br>
[=C2=A0 =C2=A0 2.768653]=C2=A0 =C2=A0 =C2=A0 bootserver=3D255.255.255.255, =
rootserver=3D255.255.255.255, rootpath=3D<br>
[=C2=A0 =C2=A0 2.768746]=C2=A0 =C2=A0 =C2=A0 nameserver0=3D8.8.8.8<br>
[=C2=A0 =C2=A0 2.773746] clk: Disabling unused clocks<br>
[=C2=A0 =C2=A0 2.782604] check access for rdinit=3D/init failed: -2, ignori=
ng<br>
[=C2=A0 =C2=A0 2.784414] md: Waiting for all devices to be available before=
 autodetect<br>
[=C2=A0 =C2=A0 2.786070] md: If you don&#39;t use raid, use raid=3Dnoautode=
tect<br>
[=C2=A0 =C2=A0 2.787605] md: Autodetecting RAID arrays.<br>
[=C2=A0 =C2=A0 2.788689] md: autorun ...<br>
[=C2=A0 =C2=A0 2.788965] md: ... autorun DONE.<br>
[=C2=A0 =C2=A0 2.863628] usb 1-1: new high-speed USB device number 2 using =
xhci_hcd<br>
[=C2=A0 =C2=A0 2.881074] EXT4-fs (vda): mounted filesystem 49485ab8-9460-46=
e8-bf1c-423f2c03e0bb r/w with ordered data mode. Quota mode: disabled.<br>
[=C2=A0 =C2=A0 2.887371] VFS: Mounted root (ext4 filesystem) on device 253:=
0.<br>
[=C2=A0 =C2=A0 2.892345] devtmpfs: mounted<br>
[=C2=A0 =C2=A0 3.045885] input: QEMU QEMU USB Tablet as /devices/platform/3=
f000000.pcie/pci0000:00/0000:00:02.0/usb1/1-1/1-1:1.0/0003:0627:0001.0001/i=
nput/input0<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/buil=
ds/2629" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/40/builds/2629</a><br>
<br>
Can you have a look at this?<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">It boots locally, so I don&#39=
;t have any great ideas.</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
We&#39;d need the ARM guys to step in and offer some more specific advice.<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000b79de0064222e274--

