Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id B741F6F90B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 16:35:50 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id f10so7190017yha.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 09:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=GgT2S4KTQ1beo7abEcT3ApwXN3oDw8P0fn8CB0g1Cho=;
	b=piB2aiKJCFQzTUTd5tPCFwV3xBlkhL0H55NwENJBTWMVVhz562JphUGC8jKg2m0ACa
	brXaojUCtjgJNUFrUECkghZS6ratiLWsWx6V43nN4qj4DHYsSLsWKUResyo+o8/hyHw7
	B2WHK3CTZV6mJ3dEqigA+t4S2vUYrvu6NP4IeU7uoLxEl8riFt8ZfJgNDWpyiQsG2u0d
	LXmU3Vg7tGUpEOFp6f9ER5SG6kQT4vIGcxzmd9Qzv82ZAWdvZjnAn/PYKWOrUH0wU1hN
	xvA1UdxuaRBI9N9Rf0Uz0d31BWCn6okCb5XXafQMDrUadjB9MMhK6YlrhxAv90O4kmTb
	NtFA==
MIME-Version: 1.0
X-Received: by 10.236.16.83 with SMTP id g59mr19250390yhg.14.1395160551279;
	Tue, 18 Mar 2014 09:35:51 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Tue, 18 Mar 2014 09:35:51 -0700 (PDT)
In-Reply-To: <1395158745-9424-1-git-send-email-joaohf@gmail.com>
References: <1395158745-9424-1-git-send-email-joaohf@gmail.com>
Date: Tue, 18 Mar 2014 13:35:51 -0300
X-Google-Sender-Auth: PN2I0s8ALSOPcQx2hQRqvIyOzzY
Message-ID: <CAP9ODKpKYfqvO=bYWQS-rd8JmzC1roH-wZS0QACyNoWTbTMb=g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Jo=E3o_Henrique_Ferreira_de_Freitas?= <joaohf@gmail.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: Add SD/MMC-Cards support
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
X-List-Received-Date: Tue, 18 Mar 2014 16:35:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2014 at 1:05 PM, Jo=E3o Henrique Ferreira de Freitas
<joaohf@gmail.com> wrote:
> If the following .wks is set up to mmcblk0 (sdcard)
>
> part /boot --source bootimg-pcbios --ondisk mmcblk0 --fstype=3Dmsdos --la=
bel boot --active --align 1024
> part / --source rootfs --ondisk mmcblk0 --fstype=3Dext3 --label platform =
--align 1024
>
> bootloader  --timeout=3D0  --append=3D"rootwait rootfstype=3Dext3 video=
=3Dvesafb vga=3D0x318 console=3Dtty0"
>
> And the user inspect this file /var/tmp/wic/build/hdd/boot/syslinux.cfg,
> the 'root=3D' will be '/dev/mmcblk02' instead of '/dev/mmcblk0p2'.
>
> This patch add the support to constrain the disk and make the adjusts whe=
n
> mmcblk devices are used.
>
> I am not sure if is not necessary to fix others places. Until now it's th=
e single point.

I think this is a sub-optimal solution; we ought to add support for
UUID as this is ensure to be stable across boot iterations; we cannot
guarantee all kernels will enumerate the devices in same order,
specially in DeviceTree time where this is async. There are some
patches merged in master to partially address this issue for the grub
and maybe you could see if a similar approach fits here as well.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

