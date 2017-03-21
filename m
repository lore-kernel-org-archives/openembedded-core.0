Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1A421719BD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 14:05:45 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id d188so94880639vka.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 07:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vVqKD55xDwqs+lq+wfg38e5N5Nlw0YHyg4+dhMBVBe4=;
	b=Pv3O5WcdtaGWO0KCRUxHLkc4Mti9NALeiAowaRalCfB0tRGnc6u7RDutuhM3y/fysD
	3QJT0qK7QtgZPFGy6nasbBqTyB/06gXRG1cNyJ+gw+A5DJ8HjUxxkUlylVrv3GqssY0D
	grzWjbsrYyYEhmvwbAyTYLZ0yWOnzVinHSU1PsJqEqdpt40PSp6+r4w1IcT5uRCmUvur
	Ut68IpTAeNggqZdWOp37ToOxrUFB/Y+tok6+2IFJ/JDSaGRWX53/lc01U61G0lTpyHDy
	Q2bvSKmx33sszoP4aUbr/E+LnNKLq5zbUDNSdAD1VbR9oUtXH48csA442WJxTRqsUvC/
	nwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vVqKD55xDwqs+lq+wfg38e5N5Nlw0YHyg4+dhMBVBe4=;
	b=FP28KRyVRPu35LRx0fF9RolKezSK+Zo0rtNlCxhLyQHyZRDef3ZxcqzUGmaJtXHKw5
	IOVvqQpawiojIGx+Pu/9+9cs257U6tRYT7/b7QtuaUhxDORkFz49vi6kPZq40oPeWhQ0
	69E/4g1p3UdlCByLT4CQG+kzjPTuYbiSdMlrY+m1j4MULN8Yq0ErJ7l+caZSlT9JzYkm
	zL2DFlHmmPZh91xwoitn9DsRP7nD4MaPMSrB+4wul/vIjG+GUz0WDHgkHcv26SHQXJJe
	j+B186dEVYIMjCvujfOEzlKbmRQ2JbOJ0A/5syzVLavh1P2i5YgkG+dUQdiITgwFsh5I
	F5Ow==
X-Gm-Message-State: AFeK/H2iwbDGVwTkh5PPosCTyaBp2TFeBIe/OFH6O1KxbfTdo1Mt7S1427/1UyHMSMnvdG/mioltQUMAP6eyug==
X-Received: by 10.176.3.163 with SMTP id 32mr5173336uau.96.1490105146256; Tue,
	21 Mar 2017 07:05:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.76.218 with HTTP; Tue, 21 Mar 2017 07:05:45 -0700 (PDT)
In-Reply-To: <VI1PR0301MB1919C266E20E5F0BFE546554E33D0@VI1PR0301MB1919.eurprd03.prod.outlook.com>
References: <1490057703-12819-1-git-send-email-liu.ming50@gmail.com>
	<20170321010032.GF15664@denix.org>
	<VI1PR0301MB1919C266E20E5F0BFE546554E33D0@VI1PR0301MB1919.eurprd03.prod.outlook.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 21 Mar 2017 15:05:45 +0100
Message-ID: <CALatG=5p9Lw=guvOVXj3OiJ1GWivGp+mqE0rweoYQxSdeAzZwQ@mail.gmail.com>
To: Peter Liu <peter.x.liu@external.atlascopco.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] Fix some issues of kernel/image recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Mar 2017 14:05:50 -0000
Content-Type: multipart/alternative; boundary=94eb2c061876ebb410054b3e235a

--94eb2c061876ebb410054b3e235a
Content-Type: text/plain; charset=UTF-8

Hi,

I've just done some more tests, and found the patch "kernel.bbclass: handle
kernel-vmlinux in KERNEL_IMAGETYPES" is problematic, it causes some issues
when processing dtb, fitimage, the vmlinux will be included even it is not
included by KERNEL_IMAGETYPE, so I will remove that patch in V3.

the best,
thank you

2017-03-21 3:35 GMT+01:00 Peter Liu <peter.x.liu@external.atlascopco.com>:

> Yes, this is the V2 version, sorry, forgot to mention that.
>
> //Ming Liu
> ------------------------------
> *From:* Denys Dmytriyenko <denis@denix.org>
> *Sent:* Tuesday, March 21, 2017 2:00:32 AM
> *To:* liu.ming50@gmail.com
> *Cc:* openembedded-core@lists.openembedded.org; Peter Liu
> *Subject:* Re: [OE-core] [PATCH 0/5] Fix some issues of kernel/image
> recipes
>
> On Tue, Mar 21, 2017 at 01:54:58AM +0100, liu.ming50@gmail.com wrote:
> > From: Peter Liu <peter.x.liu@external.atlascopco.com>
>
> What version of the patchset is this?
>
>
> > The changes include:
> > kernel.bbclass: fix some incorrect inter-task dependencies
> > kernel.bbclass: introduce INITRAMFS_IMAGE_NAME
> > kernel.bbclass: handle kernel-vmlinux in KERNEL_IMAGETYPES
> > image.bbclass: remove initramfs bundle related code
> > kernel-initramfs: add recipe
> >
> > Ming Liu (5):
> >   kernel.bbclass: fix some incorrect inter-task dependencies
> >   kernel.bbclass: introduce INITRAMFS_IMAGE_NAME
> >   kernel.bbclass: handle kernel-vmlinux in KERNEL_IMAGETYPES
> >   image.bbclass: remove initramfs bundle related code
> >   kernel-initramfs: add recipe
> >
> >  meta/classes/image.bbclass                    |  13 ----
> >  meta/classes/kernel-fitimage.bbclass          |  10 +--
> >  meta/classes/kernel.bbclass                   |  73 +++++++++----------
> >  meta/recipes-kernel/linux/kernel-initramfs.bb | 100
> ++++++++++++++++++++++++++
> >  meta/recipes-kernel/linux/linux-yocto.inc     |   1 -
> >  5 files changed, 139 insertions(+), 58 deletions(-)
> >  create mode 100644 meta/recipes-kernel/linux/kernel-initramfs.bb
> >
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c061876ebb410054b3e235a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I&#39;ve just done some more tests,=
 and found the patch &quot;kernel.bbclass: handle kernel-vmlinux in KERNEL_=
IMAGETYPES&quot; is problematic, it causes some issues when processing dtb,=
 fitimage, the vmlinux will be included even it is not included by=C2=A0KER=
NEL_IMAGETYPE, so I will remove that patch in V3.</div><div><br></div><div>=
the best,</div><div>thank you</div></div><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote">2017-03-21 3:35 GMT+01:00 Peter Liu <span dir=3D"lt=
r">&lt;<a href=3D"mailto:peter.x.liu@external.atlascopco.com" target=3D"_bl=
ank">peter.x.liu@external.atlascopco.com</a>&gt;</span>:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">





<div>
<div>Yes, this is the V2 version, sorry, forgot to mention that.<br>
<br>
//Ming Liu
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_3391442475691297071x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"=
Calibri, sans-serif" color=3D"#000000" style=3D"font-size:11pt"><b>From:</b=
> Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org" target=3D"_blank=
">denis@denix.org</a>&gt;<br>
<b>Sent:</b> Tuesday, March 21, 2017 2:00:32 AM<br>
<b>To:</b> <a href=3D"mailto:liu.ming50@gmail.com" target=3D"_blank">liu.mi=
ng50@gmail.com</a><br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.<wbr>openembedded.org</a>; Peter Liu<=
br>
<b>Subject:</b> Re: [OE-core] [PATCH 0/5] Fix some issues of kernel/image r=
ecipes</font>
<div>=C2=A0</div>
</div>
</div><div><div class=3D"h5">
<font size=3D"2"><span style=3D"font-size:10pt">
<div class=3D"m_3391442475691297071PlainText">On Tue, Mar 21, 2017 at 01:54=
:58AM +0100, <a href=3D"mailto:liu.ming50@gmail.com" target=3D"_blank">liu.=
ming50@gmail.com</a> wrote:<br>
&gt; From: Peter Liu &lt;<a href=3D"mailto:peter.x.liu@external.atlascopco.=
com" target=3D"_blank">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br>
<br>
What version of the patchset is this?<br>
<br>
<br>
&gt; The changes include:<br>
&gt; kernel.bbclass: fix some incorrect inter-task dependencies<br>
&gt; kernel.bbclass: introduce INITRAMFS_IMAGE_NAME<br>
&gt; kernel.bbclass: handle kernel-vmlinux in KERNEL_IMAGETYPES<br>
&gt; image.bbclass: remove initramfs bundle related code<br>
&gt; kernel-initramfs: add recipe<br>
&gt; <br>
&gt; Ming Liu (5):<br>
&gt;=C2=A0=C2=A0 kernel.bbclass: fix some incorrect inter-task dependencies=
<br>
&gt;=C2=A0=C2=A0 kernel.bbclass: introduce INITRAMFS_IMAGE_NAME<br>
&gt;=C2=A0=C2=A0 kernel.bbclass: handle kernel-vmlinux in KERNEL_IMAGETYPES=
<br>
&gt;=C2=A0=C2=A0 image.bbclass: remove initramfs bundle related code<br>
&gt;=C2=A0=C2=A0 kernel-initramfs: add recipe<br>
&gt; <br>
&gt;=C2=A0 meta/classes/image.bbclass=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 13 ----<br>
&gt;=C2=A0 meta/classes/kernel-fitimage.<wbr>bbclass=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +--<br>
&gt;=C2=A0 meta/classes/kernel.bbclass=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 73 +++++++++----------<br>
&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://kernel-initramfs.bb"=
 target=3D"_blank">kern<wbr>el-initramfs.bb</a> | 100 +++++++++++++++++++++=
+++++<br>
&gt;=C2=A0 meta/recipes-kernel/linux/<wbr>linux-yocto.inc=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 1 -<br>
&gt;=C2=A0 5 files changed, 139 insertions(+), 58 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-kernel/linux/<a href=3D"http://k=
ernel-initramfs.bb" target=3D"_blank">kern<wbr>el-initramfs.bb</a><br>
&gt; <br>
&gt; -- <br>
&gt; 2.7.4<br>
&gt; <br>
&gt; -- <br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.openembedded.org/<wbr>mailman/listinf=
o/openembedded-<wbr>core</a><br>
</div>
</span></font>
</div></div></div>

</blockquote></div><br></div>

--94eb2c061876ebb410054b3e235a--
