Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB467C25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 18:44:26 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.4446.1716835463862890064
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 11:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=OaQAvzD/;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=mkS9RUl5FlUKkXQqPnBao3bzAiJxrwNbbxFZULeTIpk=; b=OaQAvzD/4FTyLhv69v4V7aZRUY
	m3S/36ETFLYW4rI2sK7yEgczWX7wyvowQSxqfQE6VLcGfGDhpA9RtmLTsXy+LMy9yu/kP2XfgW9Qa
	IW5cQ2tht9nt8u7WrPxlQ+FkE96kotJbMcRUTn0eFWBB+D7PkYbUTiWU9Bum97mgdVbboTvg1aJXS
	ffXsRwVRW81f/Ar2DS6MWKOYM55fqivo14HjupnEayK2HNElAxl0mYmuVtMQywmjKXoGQCVcRJOtk
	5tMX8bDmdpakWFpf0ZqwU+yopI4tbg5XkVdlUhItE66DFLbp9DejvdfIOVw3o/qzLVRC5z1QIDMCr
	FRSSBk2A==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1sBfKX-000BXi-Kg; Mon, 27 May 2024 20:44:21 +0200
Received: from [85.184.138.13] (helo=[192.168.8.223])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1sBfKX-000KlK-2H;
	Mon, 27 May 2024 20:44:21 +0200
Message-ID: <53a4f4e254f420646acfa8833bee8319326ded4f.camel@geanix.com>
Subject: Re: [OE-core] [PATCH] qemu: upgrade 8.2.1 -> 9.0.0
From: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 27 May 2024 20:44:20 +0200
In-Reply-To: <20240527183832f87e5236@mail.local>
References: <20240522132838.2519681-1-martin@geanix.com>
	 <20240527183832f87e5236@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27288/Mon May 27 10:29:01 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 18:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199933

On Mon, 2024-05-27 at 20:38 +0200, Alexandre Belloni wrote:
> This conflicts with "qemu: enable parallel builds when using the
> jobserver class" that I'm currently carrying, should I drop it?
>=20

It's.. complicated... :)

This qemu update includes the change you mention, so upgrading is
probably the preferred way forward.

But qemu is also a key component in parts of many builds, so upgrading
it might lead to regressions.

How sure are we about an upgrade like this if it passes the
autobuilder?

Anyways, you can drop the jobserver series regardless. I'm currently
upstreaming the ninja part of the series, so upgrading both qemu and
ninja will make the jobserver series smaller.

// Martin

> On 22/05/2024 15:28:38+0200, Martin Hundeb?ll wrote:
> > Remove pacthes accepted upstream, and refresh the remaining ones.
> > Remove
> > patches required by ubuntu 18.04, as those are unmaintainable.
> >=20
> > Remove CVE status for CVEs not applicable to the new version.
> >=20
> > Exclude hppa-firmware{,64}.img files from stripping during
> > packaging, as
> > those (binary) files are already stripped.
> >=20
> > Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
> > ---
> >=20
> > I'm no sure about the CVE changes, but the one I removed didn't
> > have
> > qemu-9.* listed as a vulnerable configuration.
> >=20
> > This has been tested with runqemu on a standard qemux86-64 machine.
> > If
> > it breaks miserably elsewhere, then at least there's a starting
> > point.
> >=20
> > =C2=A0meta/conf/distro/include/tcmode-default.inc=C2=A0=C2=A0 |=C2=A0=
=C2=A0 2 +-
> > =C2=A0...u-native_8.2.1.bb =3D> qemu-native_9.0.0.bb} |=C2=A0=C2=A0 0
> > =C2=A0...e_8.2.1.bb =3D> qemu-system-native_9.0.0.bb} |=C2=A0=C2=A0 0
> > =C2=A0meta/recipes-devtools/qemu/qemu.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 58 +---
> > =C2=A0...4-Handle-the-vsyscall-page-in-open_s.patch |=C2=A0 56 ----
> > =C2=A0...n-environment-space-to-boot-loader-q.patch |=C2=A0 18 +-
> > =C2=A0... 0002-apic-fixup-fallthrough-to-PIC.patch} |=C2=A0 18 +-
> > =C2=A0...ongarch64-Remove-TARGET_FORCE_SHMLBA.patch |=C2=A0 43 ---
> > =C2=A0...d-pkg-config-handling-for-libgcrypt.patch} |=C2=A0 18 +-
> > =C2=A0...0003-linux-user-Add-strace-for-shmat.patch |=C2=A0 71 -----
> > =C2=A0...0004-linux-user-Rewrite-target_shmat.patch | 236 -------------=
-
> > -
> > =C2=A0...u-Do-not-include-file-if-not-exists.patch} |=C2=A0 18 +-
> > =C2=A0...r-space-mmap-tweaks-to-address-musl.patch} |=C2=A0 18 +-
> > =C2=A0...that-shmat-does-not-break-proc-self-.patch |=C2=A0 85 ------
> > =C2=A0...atch =3D> 0006-qemu-Determinism-fixes.patch} |=C2=A0 18 +-
> > =C2=A0...-use-relative-path-to-refer-to-file.patch} |=C2=A0 20 +-
> > =C2=A0...nd-MAP_SHARED_VALIDATE-on-needed-li.patch} |=C2=A0 16 +-
> > =C2=A0...e-use-of-lfs64-related-functions-an.patch} |=C2=A0 61 ++--
> > =C2=A0...ure-lookup-meson-exutable-from-PATH.patch} |=C2=A0 21 +-
> > =C2=A0...t-against-buggy-or-malicious-guest-d.patch |=C2=A0 40 ---
> > =C2=A0...round-for-missing-MAP_FIXED_NOREPLAC.patch | 282 -------------=
-
> > ----
> > =C2=A0...nd-the-python-venv-aren-t-used-for-.patch} |=C2=A0 26 +-
> > =C2=A0...round-for-missing-MAP_SHARED_VALIDAT.patch |=C2=A0 51 ----
> > =C2=A0...79ad8629b57a43daa62e46cc7af6e1078116.patch |=C2=A0 60 ----
> > =C2=A0.../qemu/qemu/CVE-2023-6683.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 91 ------
> > =C2=A0.../qemu/{qemu_8.2.1.bb =3D> qemu_9.0.0.bb}=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 0
> > =C2=A026 files changed, 163 insertions(+), 1164 deletions(-)
> > =C2=A0rename meta/recipes-devtools/qemu/{qemu-native_8.2.1.bb =3D> qemu=
-
> > native_9.0.0.bb} (100%)
> > =C2=A0rename meta/recipes-devtools/qemu/{qemu-system-native_8.2.1.bb =
=3D>
> > qemu-system-native_9.0.0.bb} (100%)
> > =C2=A0delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-
> > user-x86_64-Handle-the-vsyscall-page-in-open_s.patch
> > =C2=A0rename meta/recipes-devtools/qemu/qemu/{0003-apic-fixup-
> > fallthrough-to-PIC.patch =3D> 0002-apic-fixup-fallthrough-to-
> > PIC.patch} (80%)
> > =C2=A0delete mode 100644 meta/recipes-devtools/qemu/qemu/0002-linux-
> > user-loongarch64-Remove-TARGET_FORCE_SHMLBA.patch
> > =C2=A0rename meta/recipes-devtools/qemu/qemu/{0004-configure-Add-pkg-
> > config-handling-for-libgcrypt.patch =3D> 0003-configure-Add-pkg-
> > config-handling-for-libgcrypt.patch} (73%)
> > =C2=A0delete mode 100644 meta/recipes-devtools/qemu/qemu/0003-linux-
> > user-Add-strace-for-shmat.patch
> > =C2=A0delete mode 100644 meta/recipes-devtools/qemu/qemu/0004-linux-
> > user-Rewrite-target_shmat.patch
> > =C2=A0rename meta/recipes-devtools/qemu/qemu/{0005-qemu-Do-not-include-
> > file-if-not-exists.patch =3D> 0004-qemu-Do-not-include-file-if-not-
> > exists.patch} (67%)
> > =C2=A0rename meta/recipes-devtools/qemu/qemu/{0006-qemu-Add-some-user-
> > space-mmap-tweaks-to-address-musl.patch =3D> 0005-qemu-Add-some-user-
> > space-mmap-tweaks-to-address-musl.patch} (80%)
> > =C2=A0delete mode 100644 meta/recipes-devtools/qemu/qemu/0005-tests-tcg=
-
> > Check-that-shmat-does-not-break-proc-self-.patch
> > =C2=A0rename meta/recipes-devtools/qemu/qemu/{0007-qemu-Determinism-
> > fixes.patch =3D> 0006-qemu-Determinism-fixes.patch} (71%)
> > =C2=A0rename meta/recipes-devtools/qemu/qemu/{0008-tests-meson.build-
> > use-relative-path-to-refer-to-file.patch =3D> 0007-tests-meson.build-
> > use-relative-path-to-refer-to-file.patch} (76%)
> > =C2=A0rename meta/recipes-devtools/qemu/qemu/{0009-Define-MAP_SYNC-and-
> > MAP_SHARED_VALIDATE-on-needed-li.patch =3D> 0008-Define-MAP_SYNC-and-
> > MAP_SHARED_VALIDATE-on-needed-li.patch} (80%)
> > =C2=A0rename meta/recipes-devtools/qemu/qemu/{0002-linux-user-Replace-
> > use-of-lfs64-related-functions-an.patch =3D> 0009-linux-user-Replace-
> > use-of-lfs64-related-functions-an.patch} (81%)
> > =C2=A0rename meta/recipes-devtools/qemu/qemu/{fixedmeson.patch =3D> 001=
0-
> > configure-lookup-meson-exutable-from-PATH.patch} (53%)
> > =C2=A0delete mode 100644 meta/recipes-devtools/qemu/qemu/0010-hw-pvrdma=
-
> > Protect-against-buggy-or-malicious-guest-d.patch
> > =C2=A0delete mode 100644 meta/recipes-devtools/qemu/qemu/0011-linux-
> > user-workaround-for-missing-MAP_FIXED_NOREPLAC.patch
> > =C2=A0rename meta/recipes-devtools/qemu/qemu/{no-pip.patch =3D> 0011-qe=
mu-
> > Ensure-pip-and-the-python-venv-aren-t-used-for-.patch} (70%)
> > =C2=A0delete mode 100644 meta/recipes-devtools/qemu/qemu/0012-linux-
> > user-workaround-for-missing-MAP_SHARED_VALIDAT.patch
> > =C2=A0delete mode 100644 meta/recipes-
> > devtools/qemu/qemu/4a8579ad8629b57a43daa62e46cc7af6e1078116.patch
> > =C2=A0delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-
> > 6683.patch
> > =C2=A0rename meta/recipes-devtools/qemu/{qemu_8.2.1.bb =3D> qemu_9.0.0.=
bb}
> > (100%)
> >=20
> > diff --git a/meta/conf/distro/include/tcmode-default.inc
> > b/meta/conf/distro/include/tcmode-default.inc
> > index 23d5aa6de8..a55258dfbe 100644
> > --- a/meta/conf/distro/include/tcmode-default.inc
> > +++ b/meta/conf/distro/include/tcmode-default.inc
> > @@ -22,7 +22,7 @@ BINUVERSION ?=3D "2.42%"
> > =C2=A0GDBVERSION ?=3D "14.%"
> > =C2=A0GLIBCVERSION ?=3D "2.39%"
> > =C2=A0LINUXLIBCVERSION ?=3D "6.6%"
> > -QEMUVERSION ?=3D "8.2%"
> > +QEMUVERSION ?=3D "9.0%"
> > =C2=A0GOVERSION ?=3D "1.22%"
> > =C2=A0RUSTVERSION ?=3D "1.75%"
> > =C2=A0
> > diff --git a/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb
> > b/meta/recipes-devtools/qemu/qemu-native_9.0.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/qemu/qemu-native_8.2.1.bb
> > rename to meta/recipes-devtools/qemu/qemu-native_9.0.0.bb
> > diff --git a/meta/recipes-devtools/qemu/qemu-system-native_8.2.1.bb
> > b/meta/recipes-devtools/qemu/qemu-system-native_9.0.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/qemu/qemu-system-native_8.2.1.bb
> > rename to meta/recipes-devtools/qemu/qemu-system-native_9.0.0.bb
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-
> > devtools/qemu/qemu.inc
> > index f76cbbb5cb..3b5775c31b 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -22,62 +22,31 @@ SRC_URI =3D
> > "https://download.qemu.org/${BPN}-${PV}.tar.xz=C2=A0\
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file=
://powerpc_rom.bin=C2=A0\
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file=
://run-ptest=C2=A0\
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
> > =C2=A0\
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://00=
03-apic-fixup-fallthrough-to-PIC.patch=C2=A0\
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://0004-configure-Add-pkg-config-handling-for-libgcrypt.patch=C2=A0=
\
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://0005-qemu-Do-not-include-file-if-not-exists.patch=C2=A0\
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://0006-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
> > =C2=A0\
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://00=
07-qemu-Determinism-fixes.patch=C2=A0\
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://0008-tests-meson.build-use-relative-path-to-refer-to-file.patch
> > =C2=A0\
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
> > =C2=A0\
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch
> > =C2=A0\
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch
> > =C2=A0\
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://fi=
xedmeson.patch=C2=A0\
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://no=
-pip.patch=C2=A0\
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://4a=
8579ad8629b57a43daa62e46cc7af6e1078116.patch=C2=A0\
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://0001-linux-user-x86_64-Handle-the-vsyscall-page-in-open_s.patch
> > =C2=A0\
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://0002-linux-user-loongarch64-Remove-TARGET_FORCE_SHMLBA.patch
> > =C2=A0\
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://00=
03-linux-user-Add-strace-for-shmat.patch=C2=A0\
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://00=
04-linux-user-Rewrite-target_shmat.patch=C2=A0\
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://0005-tests-tcg-Check-that-shmat-does-not-break-proc-self-.patch
> > =C2=A0\
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://CV=
E-2023-6683.patch=C2=A0\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://00=
02-apic-fixup-fallthrough-to-PIC.patch=C2=A0\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://0003-configure-Add-pkg-config-handling-for-libgcrypt.patch=C2=A0=
\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://0004-qemu-Do-not-include-file-if-not-exists.patch=C2=A0\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
> > =C2=A0\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://00=
06-qemu-Determinism-fixes.patch=C2=A0\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
> > =C2=A0\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
> > =C2=A0\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch
> > =C2=A0\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://0010-configure-lookup-meson-exutable-from-PATH.patch=C2=A0\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
> > =C2=A0\
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file=
://qemu-guest-agent.init=C2=A0\
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file=
://qemu-guest-agent.udev=C2=A0\
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> > =C2=A0UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
> > =C2=A0
> > -# SDK_OLDEST_KERNEL is set below 4.17, which is the minimum
> > version required by QEMU >=3D 8.1
> > -# This is due to two MMAP flags being used at certain points
> > -SRC_URI:append:class-nativesdk =3D " \
> > -
> > 	file://0011-linux-user-workaround-for-missing-MAP_FIXED_NOREPLAC.patch=
=C2=A0\
> > -
> > 	file://0012-linux-user-workaround-for-missing-MAP_SHARED_VALIDAT.patch=
=C2=A0\
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> > -
> > -# Support building and using native version on pre 4.17 kernels
> > -SRC_URI:append:class-native =3D " \
> > -
> > 	file://0011-linux-user-workaround-for-missing-MAP_FIXED_NOREPLAC.patch=
=C2=A0\
> > -
> > 	file://0012-linux-user-workaround-for-missing-MAP_SHARED_VALIDAT.patch=
=C2=A0\
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> > -
> > -SRC_URI[sha256sum] =3D
> > "8562751158175f9d187c5f22b57555abe3c870f0325c8ced12c34c6d987729be"
> > +SRC_URI[sha256sum] =3D
> > "32708ac66c30d8c892633ea968c771c1c76d597d70ddead21a0d22ccf386da69"
> > =C2=A0
> > =C2=A0CVE_STATUS[CVE-2007-0998] =3D "not-applicable-config: The VNC ser=
ver
> > can expose host files uder some circumstances. We don't enable it
> > by default."
> > =C2=A0
> > =C2=A0# https://bugzilla.redhat.com/show_bug.cgi?id=3D1609015#c11
> > =C2=A0CVE_STATUS[CVE-2018-18438] =3D "disputed: The issues identified b=
y
> > this CVE were determined to not constitute a vulnerability."
> > =C2=A0
> > -# As per https://nvd.nist.gov/vuln/detail/CVE-2023-0664
> > -# https://bugzilla.redhat.com/show_bug.cgi?id=3D2167423
> > -CVE_STATUS[CVE-2023-0664] =3D "not-applicable-platform: Issue only
> > applies on Windows"
> > -
> > =C2=A0# As per https://bugzilla.redhat.com/show_bug.cgi?id=3D2203387
> > =C2=A0CVE_STATUS[CVE-2023-2680] =3D "not-applicable-platform: RHEL
> > specific issue."
> > =C2=A0
> > -CVE_STATUS[CVE-2023-3019] =3D "cpe-incorrect: Applies only against
> > versions before 8.2.0"
> > -
> > -CVE_STATUS[CVE-2023-5088] =3D "cpe-incorrect: Applies only against
> > version 8.2.0 and earlier"
> > -
> > -CVE_STATUS[CVE-2023-6693] =3D "cpe-incorrect: Applies only against
> > version 8.2.0 and earlier"
> > -
> > =C2=A0COMPATIBLE_HOST:mipsarchn32 =3D "null"
> > =C2=A0COMPATIBLE_HOST:mipsarchn64 =3D "null"
> > =C2=A0COMPATIBLE_HOST:riscv32 =3D "null"
> > @@ -292,6 +261,11 @@ python split_qemu_packages () {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar('RDEPENDS:=
' + mipspackage, ' ' +
> > d.getVar("MLPREFIX") + 'bash')
> > =C2=A0}
> > =C2=A0
> > +INHIBIT_PACKAGE_STRIP_FILES +=3D " \
> > +=C2=A0=C2=A0=C2=A0 ${PKGD}${datadir}/qemu/hppa-firmware.img \
> > +=C2=A0=C2=A0=C2=A0 ${PKGD}${datadir}/qemu/hppa-firmware64.img \
> > +"
> > +
> > =C2=A0# Put the guest agent in a separate package
> > =C2=A0PACKAGES =3D+ "${PN}-guest-agent"
> > =C2=A0SUMMARY:${PN}-guest-agent =3D "QEMU guest agent"
> > diff --git a/meta/recipes-devtools/qemu/qemu/0001-linux-user-
> > x86_64-Handle-the-vsyscall-page-in-open_s.patch b/meta/recipes-
> > devtools/qemu/qemu/0001-linux-user-x86_64-Handle-the-vsyscall-page-
> > in-open_s.patch
> > deleted file mode 100644
> > index 2eaebe883c..0000000000
> > --- a/meta/recipes-devtools/qemu/qemu/0001-linux-user-x86_64-
> > Handle-the-vsyscall-page-in-open_s.patch
> > +++ /dev/null
> > @@ -1,56 +0,0 @@
> > -From 4517e2046610722879761bcdb60edbb2b929c848 Mon Sep 17 00:00:00
> > 2001
> > -From: Richard Henderson <richard.henderson@linaro.org>
> > -Date: Wed, 28 Feb 2024 10:25:14 -1000
> > -Subject: [PATCH 1/5] linux-user/x86_64: Handle the vsyscall page
> > in
> > - open_self_maps_{2,4}
> > -
> > -This is the only case in which we expect to have no host memory
> > backing
> > -for a guest memory page, because in general linux user processes
> > cannot
> > -map any pages in the top half of the 64-bit address space.
> > -
> > -Upstream-Status: Submitted
> > [https://www.mail-archive.com/qemu-devel@nongnu.org/msg1026793.html
> > ]
> > -
> > -Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2170
> > -Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ----
> > - linux-user/syscall.c | 16 ++++++++++++++++
> > - 1 file changed, 16 insertions(+)
> > -
> > -diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> > -index a114f29a8..8307a8a61 100644
> > ---- a/linux-user/syscall.c
> > -+++ b/linux-user/syscall.c
> > -@@ -7922,6 +7922,10 @@ static void open_self_maps_4(const struct
> > open_self_maps_data *d,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 path =3D "[heap]";
> > -=C2=A0=C2=A0=C2=A0=C2=A0 } else if (start =3D=3D info->vdso) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 path =3D "[vdso]";
> > -+#ifdef TARGET_X86_64
> > -+=C2=A0=C2=A0=C2=A0 } else if (start =3D=3D TARGET_VSYSCALL_PAGE) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 path =3D "[vsyscall]";
> > -+#endif
> > -=C2=A0=C2=A0=C2=A0=C2=A0 }
> > -=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0 /* Except null device (MAP_ANON), adjust offs=
et for this
> > fragment. */
> > -@@ -8010,6 +8014,18 @@ static int open_self_maps_2(void *opaque,
> > target_ulong guest_start,
> > -=C2=A0=C2=A0=C2=A0=C2=A0 uintptr_t host_start =3D (uintptr_t)g2h_untag=
ged(guest_start);
> > -=C2=A0=C2=A0=C2=A0=C2=A0 uintptr_t host_last =3D (uintptr_t)g2h_untagg=
ed(guest_end - 1);
> > -=20
> > -+#ifdef TARGET_X86_64
> > -+=C2=A0=C2=A0=C2=A0 /*
> > -+=C2=A0=C2=A0=C2=A0=C2=A0 * Because of the extremely high position of =
the page within
> > the guest
> > -+=C2=A0=C2=A0=C2=A0=C2=A0 * virtual address space, this is not backed =
by host memory
> > at all.
> > -+=C2=A0=C2=A0=C2=A0=C2=A0 * Therefore the loop below would fail.=C2=A0=
 This is the only
> > instance
> > -+=C2=A0=C2=A0=C2=A0=C2=A0 * of not having host backing memory.
> > -+=C2=A0=C2=A0=C2=A0=C2=A0 */
> > -+=C2=A0=C2=A0=C2=A0 if (guest_start =3D=3D TARGET_VSYSCALL_PAGE) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return open_self_maps_3(op=
aque, guest_start, guest_end,
> > flags);
> > -+=C2=A0=C2=A0=C2=A0 }
> > -+#endif
> > -+
> > -=C2=A0=C2=A0=C2=A0=C2=A0 while (1) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IntervalTreeNode *n =
=3D
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 interval_tree_iter_first(d->host_maps, host_start,
> > host_start);
> > ---=20
> > -2.34.1
> > -
> > diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-
> > addition-environment-space-to-boot-loader-q.patch b/meta/recipes-
> > devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-
> > boot-loader-q.patch
> > index c65508017d..2333cc8432 100644
> > --- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-
> > environment-space-to-boot-loader-q.patch
> > +++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-
> > environment-space-to-boot-loader-q.patch
> > @@ -1,7 +1,7 @@
> > -From de64af82950a6908f9407dfc92b83c17e2af3eab Mon Sep 17 00:00:00
> > 2001
> > +From e9baf07a667a1c04b57e14776cc4fa387448c908 Mon Sep 17 00:00:00
> > 2001
> > =C2=A0From: Jason Wessel <jason.wessel@windriver.com>
> > =C2=A0Date: Fri, 28 Mar 2014 17:42:43 +0800
> > -Subject: [PATCH 01/12] qemu: Add addition environment space to
> > boot loader
> > +Subject: [PATCH 01/11] qemu: Add addition environment space to
> > boot loader
> > =C2=A0 qemu-system-mips
> > =C2=A0
> > =C2=A0Upstream-Status: Inappropriate - OE uses deep paths
> > @@ -13,16 +13,15 @@ to only 256 bytes. This patch expands the
> > limit.
> > =C2=A0
> > =C2=A0Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> > =C2=A0Signed-off-by: Roy Li <rongqing.li@windriver.com>
> > -
> > =C2=A0---
> > =C2=A0 hw/mips/malta.c | 2 +-
> > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> > =C2=A0
> > -Index: qemu-8.0.0/hw/mips/malta.c
> > -
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- qemu-8.0.0.orig/hw/mips/malta.c
> > -+++ qemu-8.0.0/hw/mips/malta.c
> > -@@ -64,7 +64,7 @@
> > +diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> > +index af74008c82..a588b9ad4e 100644
> > +--- a/hw/mips/malta.c
> > ++++ b/hw/mips/malta.c
> > +@@ -63,7 +63,7 @@
> > =C2=A0 #define ENVP_PADDR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x2000
> > =C2=A0 #define ENVP_VADDR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 cpu_mips_phys_to_kseg0(NULL,
> > ENVP_PADDR)
> > =C2=A0 #define ENVP_NB_ENTRIES=C2=A0=C2=A0=C2=A0=C2=A0 16
> > @@ -31,3 +30,6 @@ Index: qemu-8.0.0/hw/mips/malta.c
> > =C2=A0=20
> > =C2=A0 /* Hardware addresses */
> > =C2=A0 #define FLASH_ADDRESS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1e00=
0000ULL
> > +--=20
> > +2.44.0
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0003-apic-fixup-
> > fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-
> > apic-fixup-fallthrough-to-PIC.patch
> > similarity index 80%
> > rename from meta/recipes-devtools/qemu/qemu/0003-apic-fixup-
> > fallthrough-to-PIC.patch
> > rename to meta/recipes-devtools/qemu/qemu/0002-apic-fixup-
> > fallthrough-to-PIC.patch
> > index e85f8202e9..5f8fe4faa3 100644
> > --- a/meta/recipes-devtools/qemu/qemu/0003-apic-fixup-fallthrough-
> > to-PIC.patch
> > +++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-
> > to-PIC.patch
> > @@ -1,7 +1,7 @@
> > -From dc2a8ccd440ee3741b61606eafed3f7e092f4312 Mon Sep 17 00:00:00
> > 2001
> > +From 23bf534e463bf4c1ba2e1356eaf17be0b23b192e Mon Sep 17 00:00:00
> > 2001
> > =C2=A0From: Mark Asselstine <mark.asselstine@windriver.com>
> > =C2=A0Date: Tue, 26 Feb 2013 11:43:28 -0500
> > -Subject: [PATCH 03/12] apic: fixup fallthrough to PIC
> > +Subject: [PATCH 02/11] apic: fixup fallthrough to PIC
> > =C2=A0
> > =C2=A0Commit 0e21e12bb311c4c1095d0269dc2ef81196ccb60a [Don't route PIC
> > =C2=A0interrupts through the local APIC if the local APIC config says
> > so.]
> > @@ -24,16 +24,15 @@ serviced, is -1.
> > =C2=A0Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > =C2=A0Upstream-Status: Submitted
> > [https://lists.gnu.org/archive/html/qemu-devel/2013-04/msg00878.htm
> > l]
> > =C2=A0Signed-off-by: He Zhe <zhe.he@windriver.com>
> > -
> > =C2=A0---
> > =C2=A0 hw/intc/apic.c | 2 +-
> > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> > =C2=A0
> > -Index: qemu-8.0.0/hw/intc/apic.c
> > -
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- qemu-8.0.0.orig/hw/intc/apic.c
> > -+++ qemu-8.0.0/hw/intc/apic.c
> > -@@ -607,7 +607,7 @@ int apic_accept_pic_intr(DeviceState *de
> > +diff --git a/hw/intc/apic.c b/hw/intc/apic.c
> > +index 4186c57b34..43cd805a96 100644
> > +--- a/hw/intc/apic.c
> > ++++ b/hw/intc/apic.c
> > +@@ -759,7 +759,7 @@ int apic_accept_pic_intr(DeviceState *dev)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 APICCommonState *s =3D APIC(dev);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t lvt0;
> > =C2=A0=20
> > @@ -42,3 +41,6 @@ Index: qemu-8.0.0/hw/intc/apic.c
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lvt0 =3D s->lvt[APIC_LVT_LINT0];
> > +--=20
> > +2.44.0
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0002-linux-user-
> > loongarch64-Remove-TARGET_FORCE_SHMLBA.patch b/meta/recipes-
> > devtools/qemu/qemu/0002-linux-user-loongarch64-Remove-
> > TARGET_FORCE_SHMLBA.patch
> > deleted file mode 100644
> > index 3f01aaa644..0000000000
> > --- a/meta/recipes-devtools/qemu/qemu/0002-linux-user-loongarch64-
> > Remove-TARGET_FORCE_SHMLBA.patch
> > +++ /dev/null
> > @@ -1,43 +0,0 @@
> > -From 5bf65b24414d3ff8339f6f1beb221c7c35c91e5d Mon Sep 17 00:00:00
> > 2001
> > -From: Richard Henderson <richard.henderson@linaro.org>
> > -Date: Wed, 28 Feb 2024 10:25:15 -1000
> > -Subject: [PATCH 2/5] linux-user/loongarch64: Remove
> > TARGET_FORCE_SHMLBA
> > -
> > -The kernel abi was changed with
> > -
> > -=C2=A0=C2=A0=C2=A0 commit d23b77953f5a4fbf94c05157b186aac2a247ae32
> > -=C2=A0=C2=A0=C2=A0 Author: Huacai Chen <chenhuacai@kernel.org>
> > -=C2=A0=C2=A0=C2=A0 Date:=C2=A0=C2=A0 Wed Jan 17 12:43:08 2024 +0800
> > -
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LoongArch: Change SHMLBA fr=
om SZ_64K to PAGE_SIZE
> > -
> > -during the v6.8 cycle.
> > -
> > -Upstream-Status: Submitted
> > [https://www.mail-archive.com/qemu-devel@nongnu.org/msg1026793.html
> > ]
> > -
> > -Reviewed-by: Song Gao <gaosong@loongson.cn>
> > -Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ----
> > - linux-user/loongarch64/target_syscall.h | 7 -------
> > - 1 file changed, 7 deletions(-)
> > -
> > -diff --git a/linux-user/loongarch64/target_syscall.h b/linux-
> > user/loongarch64/target_syscall.h
> > -index 8b5de5212..39f229bb9 100644
> > ---- a/linux-user/loongarch64/target_syscall.h
> > -+++ b/linux-user/loongarch64/target_syscall.h
> > -@@ -38,11 +38,4 @@ struct target_pt_regs {
> > - #define TARGET_MCL_FUTURE=C2=A0 2
> > - #define TARGET_MCL_ONFAULT 4
> > -=20
> > --#define TARGET_FORCE_SHMLBA
> > --
> > --static inline abi_ulong target_shmlba(CPULoongArchState *env)
> > --{
> > --=C2=A0=C2=A0=C2=A0 return 64 * KiB;
> > --}
> > --
> > - #endif
> > ---=20
> > -2.34.1
> > -
> > diff --git a/meta/recipes-devtools/qemu/qemu/0004-configure-Add-
> > pkg-config-handling-for-libgcrypt.patch b/meta/recipes-
> > devtools/qemu/qemu/0003-configure-Add-pkg-config-handling-for-
> > libgcrypt.patch
> > similarity index 73%
> > rename from meta/recipes-devtools/qemu/qemu/0004-configure-Add-pkg-
> > config-handling-for-libgcrypt.patch
> > rename to meta/recipes-devtools/qemu/qemu/0003-configure-Add-pkg-
> > config-handling-for-libgcrypt.patch
> > index f981a64a54..30e269f8f4 100644
> > --- a/meta/recipes-devtools/qemu/qemu/0004-configure-Add-pkg-
> > config-handling-for-libgcrypt.patch
> > +++ b/meta/recipes-devtools/qemu/qemu/0003-configure-Add-pkg-
> > config-handling-for-libgcrypt.patch
> > @@ -1,7 +1,7 @@
> > -From d8265abdce5dc2bf74b3fccdf2b7257b4f3894f0 Mon Sep 17 00:00:00
> > 2001
> > +From e4f6c6b9f43b28271bc9dc6cbcafad53f80387e0 Mon Sep 17 00:00:00
> > 2001
> > =C2=A0From: He Zhe <zhe.he@windriver.com>
> > =C2=A0Date: Wed, 28 Aug 2019 19:56:28 +0800
> > -Subject: [PATCH 04/12] configure: Add pkg-config handling for
> > libgcrypt
> > +Subject: [PATCH 03/11] configure: Add pkg-config handling for
> > libgcrypt
> > =C2=A0
> > =C2=A0libgcrypt may also be controlled by pkg-config, this patch adds
> > pkg-config
> > =C2=A0handling for libgcrypt.
> > @@ -9,16 +9,15 @@ handling for libgcrypt.
> > =C2=A0Upstream-Status: Denied
> > [https://lists.nongnu.org/archive/html/qemu-devel/2019-08/msg06333.
> > html]
> > =C2=A0
> > =C2=A0Signed-off-by: He Zhe <zhe.he@windriver.com>
> > -
> > =C2=A0---
> > =C2=A0 meson.build | 2 +-
> > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> > =C2=A0
> > -Index: qemu-8.1.0/meson.build
> > -
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- qemu-8.1.0.orig/meson.build
> > -+++ qemu-8.1.0/meson.build
> > -@@ -1481,7 +1481,7 @@ endif
> > +diff --git a/meson.build b/meson.build
> > +index 91a0aa64c6..e8373d55b8 100644
> > +--- a/meson.build
> > ++++ b/meson.build
> > +@@ -1655,7 +1655,7 @@ endif
> > =C2=A0 if not gnutls_crypto.found()
> > =C2=A0=C2=A0=C2=A0 if (not get_option('gcrypt').auto() or have_system) =
and not
> > get_option('nettle').enabled()
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gcrypt =3D dependency('libgcrypt', versi=
on: '>=3D1.8',
> > @@ -27,3 +26,6 @@ Index: qemu-8.1.0/meson.build
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 required: get_option('gcrypt'))
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Debian has removed -lgpg-error from li=
bgcrypt-config
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # as it "spreads unnecessary dependencie=
s" which in
> > +--=20
> > +2.44.0
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0003-linux-user-Add-
> > strace-for-shmat.patch b/meta/recipes-devtools/qemu/qemu/0003-
> > linux-user-Add-strace-for-shmat.patch
> > deleted file mode 100644
> > index 0c601c804a..0000000000
> > --- a/meta/recipes-devtools/qemu/qemu/0003-linux-user-Add-strace-
> > for-shmat.patch
> > +++ /dev/null
> > @@ -1,71 +0,0 @@
> > -From e8f06676c6c88e12cd5f4f81a839b7111c683596 Mon Sep 17 00:00:00
> > 2001
> > -From: Richard Henderson <richard.henderson@linaro.org>
> > -Date: Wed, 28 Feb 2024 10:25:16 -1000
> > -Subject: [PATCH 3/5] linux-user: Add strace for shmat
> > -
> > -Upstream-Status: Submitted
> > [https://www.mail-archive.com/qemu-devel@nongnu.org/msg1026793.html
> > ]
> > -
> > -Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ----
> > - linux-user/strace.c=C2=A0=C2=A0=C2=A0 | 23 +++++++++++++++++++++++
> > - linux-user/strace.list |=C2=A0 2 +-
> > - 2 files changed, 24 insertions(+), 1 deletion(-)
> > -
> > -diff --git a/linux-user/strace.c b/linux-user/strace.c
> > -index cf26e5526..47d6ec326 100644
> > ---- a/linux-user/strace.c
> > -+++ b/linux-user/strace.c
> > -@@ -670,6 +670,25 @@ print_semctl(CPUArchState *cpu_env, const
> > struct syscallname *name,
> > - }
> > - #endif
> > -=20
> > -+static void
> > -+print_shmat(CPUArchState *cpu_env, const struct syscallname
> > *name,
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ab=
i_long arg0, abi_long arg1, abi_long arg2,
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ab=
i_long arg3, abi_long arg4, abi_long arg5)
> > -+{
> > -+=C2=A0=C2=A0=C2=A0 static const struct flags shmat_flags[] =3D {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FLAG_GENERIC(SHM_RND),
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FLAG_GENERIC(SHM_REMAP),
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FLAG_GENERIC(SHM_RDONLY),
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FLAG_GENERIC(SHM_EXEC),
> > -+=C2=A0=C2=A0=C2=A0 };
> > -+
> > -+=C2=A0=C2=A0=C2=A0 print_syscall_prologue(name);
> > -+=C2=A0=C2=A0=C2=A0 print_raw_param(TARGET_ABI_FMT_ld, arg0, 0);
> > -+=C2=A0=C2=A0=C2=A0 print_pointer(arg1, 0);
> > -+=C2=A0=C2=A0=C2=A0 print_flags(shmat_flags, arg2, 1);
> > -+=C2=A0=C2=A0=C2=A0 print_syscall_epilogue(name);
> > -+}
> > -+
> > - #ifdef TARGET_NR_ipc
> > - static void
> > - print_ipc(CPUArchState *cpu_env, const struct syscallname *name,
> > -@@ -683,6 +702,10 @@ print_ipc(CPUArchState *cpu_env, const struct
> > syscallname *name,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print_ipc_cmd(arg3);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_log(",0x" TARGET=
_ABI_FMT_lx ")", arg4);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > -+=C2=A0=C2=A0=C2=A0 case IPCOP_shmat:
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print_shmat(cpu_env, &(con=
st struct syscallname){ .name =3D
> > "shmat" },
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arg1, arg4, arg2, 0, 0, 0);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > -=C2=A0=C2=A0=C2=A0=C2=A0 default:
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_log(("%s("
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TARGET_ABI_FMT_ld ","
> > -diff --git a/linux-user/strace.list b/linux-user/strace.list
> > -index 6655d4f26..dfd4237d1 100644
> > ---- a/linux-user/strace.list
> > -+++ b/linux-user/strace.list
> > -@@ -1398,7 +1398,7 @@
> > - { TARGET_NR_sgetmask, "sgetmask" , NULL, NULL, NULL },
> > - #endif
> > - #ifdef TARGET_NR_shmat
> > --{ TARGET_NR_shmat, "shmat" , NULL, NULL, print_syscall_ret_addr
> > },
> > -+{ TARGET_NR_shmat, "shmat" , NULL, print_shmat,
> > print_syscall_ret_addr },
> > - #endif
> > - #ifdef TARGET_NR_shmctl
> > - { TARGET_NR_shmctl, "shmctl" , NULL, NULL, NULL },
> > ---=20
> > -2.34.1
> > -
> > diff --git a/meta/recipes-devtools/qemu/qemu/0004-linux-user-
> > Rewrite-target_shmat.patch b/meta/recipes-devtools/qemu/qemu/0004-
> > linux-user-Rewrite-target_shmat.patch
> > deleted file mode 100644
> > index 88c3ed40b0..0000000000
> > --- a/meta/recipes-devtools/qemu/qemu/0004-linux-user-Rewrite-
> > target_shmat.patch
> > +++ /dev/null
> > @@ -1,236 +0,0 @@
> > -From cb48d5d1592e63ebd0d4a3e300ef98e38e6306d7 Mon Sep 17 00:00:00
> > 2001
> > -From: Richard Henderson <richard.henderson@linaro.org>
> > -Date: Wed, 28 Feb 2024 10:25:17 -1000
> > -Subject: [PATCH 4/5] linux-user: Rewrite target_shmat
> > -
> > -Handle combined host and guest alignment requirements.
> > -Handle host and guest page size differences.
> > -Handle SHM_EXEC.
> > -
> > -Upstream-Status: Submitted
> > [https://www.mail-archive.com/qemu-devel@nongnu.org/msg1026793.html
> > ]
> > -
> > -Resolves: https://gitlab.com/qemu-project/qemu/-/issues/115
> > -Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ----
> > - linux-user/mmap.c | 166 +++++++++++++++++++++++++++++++++++++----
> > -----
> > - 1 file changed, 133 insertions(+), 33 deletions(-)
> > -
> > -diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> > -index 18fb3aaf7..6a2f649bb 100644
> > ---- a/linux-user/mmap.c
> > -+++ b/linux-user/mmap.c
> > -@@ -1062,69 +1062,161 @@ static inline abi_ulong
> > target_shmlba(CPUArchState *cpu_env)
> > - }
> > - #endif
> > -=20
> > -+#if defined(__arm__) || defined(__mips__) || defined(__sparc__)
> > -+#define HOST_FORCE_SHMLBA 1
> > -+#else
> > -+#define HOST_FORCE_SHMLBA 0
> > -+#endif
> > -+
> > - abi_ulong target_shmat(CPUArchState *cpu_env, int shmid,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_u=
long shmaddr, int shmflg)
> > - {
> > -=C2=A0=C2=A0=C2=A0=C2=A0 CPUState *cpu =3D env_cpu(cpu_env);
> > --=C2=A0=C2=A0=C2=A0 abi_ulong raddr;
> > -=C2=A0=C2=A0=C2=A0=C2=A0 struct shmid_ds shm_info;
> > -=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
> > --=C2=A0=C2=A0=C2=A0 abi_ulong shmlba;
> > -+=C2=A0=C2=A0=C2=A0 int h_pagesize;
> > -+=C2=A0=C2=A0=C2=A0 int t_shmlba, h_shmlba, m_shmlba;
> > -+=C2=A0=C2=A0=C2=A0 size_t t_len, h_len, m_len;
> > -=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0 /* shmat pointers are always untagged */
> > -=20
> > --=C2=A0=C2=A0=C2=A0 /* find out the length of the shared memory segmen=
t */
> > -+=C2=A0=C2=A0=C2=A0 /*
> > -+=C2=A0=C2=A0=C2=A0=C2=A0 * Because we can't use host shmat() unless t=
he address is
> > sufficiently
> > -+=C2=A0=C2=A0=C2=A0=C2=A0 * aligned for the host, we'll need to check =
both.
> > -+=C2=A0=C2=A0=C2=A0=C2=A0 * TODO: Could be fixed with softmmu.
> > -+=C2=A0=C2=A0=C2=A0=C2=A0 */
> > -+=C2=A0=C2=A0=C2=A0 t_shmlba =3D target_shmlba(cpu_env);
> > -+=C2=A0=C2=A0=C2=A0 h_pagesize =3D qemu_real_host_page_size();
> > -+=C2=A0=C2=A0=C2=A0 h_shmlba =3D (HOST_FORCE_SHMLBA ? SHMLBA : h_pages=
ize);
> > -+=C2=A0=C2=A0=C2=A0 m_shmlba =3D MAX(t_shmlba, h_shmlba);
> > -+
> > -+=C2=A0=C2=A0=C2=A0 if (shmaddr) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (shmaddr & (m_shmlba - =
1)) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (shmflg & SHM_RND) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /*
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The guest is allowing the kernel to round the
> > address.
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Assume that the guest is ok with us rounding
> > to the
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 * host required alignment too.=C2=A0 Anyway if =
we
> > don't, we'll
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 * get an error from the kernel.
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 shmaddr &=3D ~(m_shmlba - 1);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (shmaddr =3D=3D 0 && (shmflg & SHM_REMAP)) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -TARGET_EINVAL;
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } =
else {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 int require =3D TARGET_PAGE_SIZE;
> > -+#ifdef TARGET_FORCE_SHMLBA
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 require =3D t_shmlba;
> > -+#endif
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /*
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Include host required alignment, as otherwise
> > we cannot
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 * use host shmat at all.
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 require =3D MAX(require, h_shmlba);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (shmaddr & (require - 1)) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -TARGET_EINVAL;
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > -+=C2=A0=C2=A0=C2=A0 } else {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (shmflg & SHM_REMAP) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn -TARGET_EINVAL;
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > -+=C2=A0=C2=A0=C2=A0 }
> > -+=C2=A0=C2=A0=C2=A0 /* All rounding now manually concluded. */
> > -+=C2=A0=C2=A0=C2=A0 shmflg &=3D ~SHM_RND;
> > -+
> > -+=C2=A0=C2=A0=C2=A0 /* Find out the length of the shared memory segmen=
t. */
> > -=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D get_errno(shmctl(shmid, IPC_STAT, &sh=
m_info));
> > -=C2=A0=C2=A0=C2=A0=C2=A0 if (is_error(ret)) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* can't get length, =
bail out */
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> > -=C2=A0=C2=A0=C2=A0=C2=A0 }
> > -+=C2=A0=C2=A0=C2=A0 t_len =3D TARGET_PAGE_ALIGN(shm_info.shm_segsz);
> > -+=C2=A0=C2=A0=C2=A0 h_len =3D ROUND_UP(shm_info.shm_segsz, h_pagesize)=
;
> > -+=C2=A0=C2=A0=C2=A0 m_len =3D MAX(t_len, h_len);
> > -=20
> > --=C2=A0=C2=A0=C2=A0 shmlba =3D target_shmlba(cpu_env);
> > --
> > --=C2=A0=C2=A0=C2=A0 if (shmaddr & (shmlba - 1)) {
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (shmflg & SHM_RND) {
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sh=
maddr &=3D ~(shmlba - 1);
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn -TARGET_EINVAL;
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > --=C2=A0=C2=A0=C2=A0 }
> > --=C2=A0=C2=A0=C2=A0 if (!guest_range_valid_untagged(shmaddr, shm_info.=
shm_segsz))
> > {
> > -+=C2=A0=C2=A0=C2=A0 if (!guest_range_valid_untagged(shmaddr, m_len)) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -TARGET_EINVAL=
;
> > -=C2=A0=C2=A0=C2=A0=C2=A0 }
> > -=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0 WITH_MMAP_LOCK_GUARD() {
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *host_raddr;
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool mapped =3D false;
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *want, *test;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_ulong last;
> > -=20
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (shmaddr) {
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ho=
st_raddr =3D shmat(shmid, (void
> > *)g2h_untagged(shmaddr), shmflg);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!shmaddr) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sh=
maddr =3D mmap_find_vma(0, m_len, m_shmlba);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (shmaddr =3D=3D -1) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return -TARGET_ENOMEM;
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ma=
pped =3D !reserved_va;
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (shmflg & SHM_RE=
MAP) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * If host page size > target page size, the host
> > shmat may map
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * more memory than the guest expects.=C2=A0 Reject a
> > mapping that
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * would replace memory in the unexpected gap.
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * TODO: Could be fixed with softmmu.
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 */
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (t_len < h_len &&
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 !page_check_range_empty(shmaddr + t_len,
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 shmaddr + h_len - 1)) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return -TARGET_EINVAL;
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ab=
i_ulong mmap_start;
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (!page_check_range_empty(shmaddr, shmaddr + m_len
> > - 1)) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return -TARGET_EINVAL;
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > -=20
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=
 In order to use the host shmat, we need to honor
> > host SHMLBA.=C2=A0 */
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mm=
ap_start =3D mmap_find_vma(0, shm_info.shm_segsz,
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 MAX(SHMLBA, shmlba));
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* All placement is now co=
mplete. */
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 want =3D (void *)g2h_untag=
ged(shmaddr);
> > -=20
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (mmap_start =3D=3D -1) {
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return -TARGET_ENOMEM;
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Map anonymous page=
s across the entire range, then
> > remap with
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the shared memory.=
=C2=A0 This is required for a number of
> > corner
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * cases for which ho=
st and guest page sizes differ.
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (h_len !=3D t_len) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in=
t mmap_p =3D PROT_READ | (shmflg & SHM_RDONLY ? 0 :
> > PROT_WRITE);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in=
t mmap_f =3D MAP_PRIVATE | MAP_ANONYMOUS
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | (reserved=
_va || (shmflg & SHM_REMAP)
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ? MAP_FIXED : MAP_FIXED_NOREPLACE);
> > -+
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 te=
st =3D mmap(want, m_len, mmap_p, mmap_f, -1, 0);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (unlikely(test !=3D want)) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /* shmat returns EINVAL not EEXIST like mmap. */
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ret =3D (test =3D=3D MAP_FAILED && errno !=3D EEXIST
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ? get_errno=
(-1) : -TARGET_EINVAL);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (mapped) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do_munmap(want, m_len);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return ret;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 }
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ho=
st_raddr =3D shmat(shmid, g2h_untagged(mmap_start),
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shmflg | SHM_REMAP);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ma=
pped =3D true;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > -=20
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (host_raddr =3D=3D (voi=
d *)-1) {
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn get_errno(-1);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (reserved_va || mapped)=
 {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sh=
mflg |=3D SHM_REMAP;
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test =3D shmat(shmid, want=
, shmflg);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (test =3D=3D MAP_FAILED=
) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
t =3D get_errno(-1);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (mapped) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 do_munmap(want, m_len);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn ret;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raddr =3D h2g(host_raddr);
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 last =3D raddr + shm_info.=
shm_segsz - 1;
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert(test =3D=3D want);
> > -=20
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 page_set_flags(raddr, last=
,
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 last =3D shmaddr + m_len -=
 1;
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 page_set_flags(shmaddr, la=
st,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PAGE_=
VALID | PAGE_RESET | PAGE_READ |
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (shmflg & S=
HM_RDONLY ? 0 : PAGE_WRITE));
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (shmflg & S=
HM_RDONLY ? 0 : PAGE_WRITE) |
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (shmflg & S=
HM_EXEC ? PAGE_EXEC : 0));
> > -=20
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shm_region_rm_complete(rad=
dr, last);
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shm_region_add(raddr, last=
);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shm_region_rm_complete(shm=
addr, last);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shm_region_add(shmaddr, la=
st);
> > -=C2=A0=C2=A0=C2=A0=C2=A0 }
> > -=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > -@@ -1138,7 +1230,15 @@ abi_ulong target_shmat(CPUArchState
> > *cpu_env, int shmid,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tb_flush(cpu);
> > -=C2=A0=C2=A0=C2=A0=C2=A0 }
> > -=20
> > --=C2=A0=C2=A0=C2=A0 return raddr;
> > -+=C2=A0=C2=A0=C2=A0 if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FILE *f =3D qemu_log_trylo=
ck();
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (f) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fp=
rintf(f, "page layout changed following shmat\n");
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pa=
ge_dump(f);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qe=
mu_log_unlock(f);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > -+=C2=A0=C2=A0=C2=A0 }
> > -+=C2=A0=C2=A0=C2=A0 return shmaddr;
> > - }
> > -=20
> > - abi_long target_shmdt(abi_ulong shmaddr)
> > ---=20
> > -2.34.1
> > -
> > diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Do-not-
> > include-file-if-not-exists.patch b/meta/recipes-
> > devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-
> > exists.patch
> > similarity index 67%
> > rename from meta/recipes-devtools/qemu/qemu/0005-qemu-Do-not-
> > include-file-if-not-exists.patch
> > rename to meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-
> > file-if-not-exists.patch
> > index 38aa4c3bbe..d9cab428c4 100644
> > --- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Do-not-include-
> > file-if-not-exists.patch
> > +++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-
> > file-if-not-exists.patch
> > @@ -1,7 +1,7 @@
> > -From f39e7bfc5ed07b5ecaeb705c4eae4855ca120d47 Mon Sep 17 00:00:00
> > 2001
> > +From 5223d46a8d5302396f9fc7cc5d830769e87242fe Mon Sep 17 00:00:00
> > 2001
> > =C2=A0From: Oleksiy Obitotskyy <oobitots@cisco.com>
> > =C2=A0Date: Wed, 25 Mar 2020 21:21:35 +0200
> > -Subject: [PATCH 05/12] qemu: Do not include file if not exists
> > +Subject: [PATCH 04/11] qemu: Do not include file if not exists
> > =C2=A0
> > =C2=A0Script configure checks for if_alg.h and check failed but
> > =C2=A0if_alg.h still included.
> > @@ -11,16 +11,15 @@ Signed-off-by: Oleksiy Obitotskyy
> > <oobitots@cisco.com>
> > =C2=A0
> > =C2=A0[update patch context]
> > =C2=A0Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> > -
> > =C2=A0---
> > =C2=A0 linux-user/syscall.c | 2 ++
> > =C2=A0 1 file changed, 2 insertions(+)
> > =C2=A0
> > -Index: qemu-8.0.0/linux-user/syscall.c
> > -
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- qemu-8.0.0.orig/linux-user/syscall.c
> > -+++ qemu-8.0.0/linux-user/syscall.c
> > -@@ -115,7 +115,9 @@
> > +diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> > +index 3df2b94d9a..18f09f1f07 100644
> > +--- a/linux-user/syscall.c
> > ++++ b/linux-user/syscall.c
> > +@@ -116,7 +116,9 @@
> > =C2=A0 #include <linux/blkpg.h>
> > =C2=A0 #include <netpacket/packet.h>
> > =C2=A0 #include <linux/netlink.h>
> > @@ -30,3 +29,6 @@ Index: qemu-8.0.0/linux-user/syscall.c
> > =C2=A0 #include <linux/rtc.h>
> > =C2=A0 #include <sound/asound.h>
> > =C2=A0 #ifdef HAVE_BTRFS_H
> > +--=20
> > +2.44.0
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Add-some-
> > user-space-mmap-tweaks-to-address-musl.patch b/meta/recipes-
> > devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-
> > address-musl.patch
> > similarity index 80%
> > rename from meta/recipes-devtools/qemu/qemu/0006-qemu-Add-some-
> > user-space-mmap-tweaks-to-address-musl.patch
> > rename to meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-
> > space-mmap-tweaks-to-address-musl.patch
> > index 5d1d7c6881..3c7f5776ff 100644
> > --- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Add-some-user-
> > space-mmap-tweaks-to-address-musl.patch
> > +++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-
> > space-mmap-tweaks-to-address-musl.patch
> > @@ -1,7 +1,7 @@
> > -From 375cae3dd6151ef33cae8f243f6a2c2da6c0c356 Mon Sep 17 00:00:00
> > 2001
> > +From 1c295069857b9850f15f2cd6b33b133ea641a454 Mon Sep 17 00:00:00
> > 2001
> > =C2=A0From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > =C2=A0Date: Fri, 8 Jan 2021 17:27:06 +0000
> > -Subject: [PATCH 06/12] qemu: Add some user space mmap tweaks to
> > address musl
> > +Subject: [PATCH 05/11] qemu: Add some user space mmap tweaks to
> > address musl
> > =C2=A0 32 bit
> > =C2=A0
> > =C2=A0When using qemu-i386 to build qemux86 webkitgtk on musl, it sits
> > in an
> > @@ -18,16 +18,15 @@ rather than ENOMEM so adjust the other part of
> > the test to this.
> > =C2=A0
> > =C2=A0Upstream-Status: Submitted
> > [https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01355.htm
> > l]
> > =C2=A0Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> > -
> > =C2=A0---
> > =C2=A0 linux-user/mmap.c | 10 +++++++---
> > =C2=A0 1 file changed, 7 insertions(+), 3 deletions(-)
> > =C2=A0
> > -Index: qemu-8.0.0/linux-user/mmap.c
> > -
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- qemu-8.0.0.orig/linux-user/mmap.c
> > -+++ qemu-8.0.0/linux-user/mmap.c
> > -@@ -776,12 +776,16 @@ abi_long target_mremap(abi_ulong old_add
> > +diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> > +index be3b9a68eb..481286f01d 100644
> > +--- a/linux-user/mmap.c
> > ++++ b/linux-user/mmap.c
> > +@@ -1060,12 +1060,16 @@ abi_long target_mremap(abi_ulong old_addr,
> > abi_ulong old_size,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int prot;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *host_addr;
> > =C2=A0=20
> > @@ -47,3 +46,6 @@ Index: qemu-8.0.0/linux-user/mmap.c
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0=20
> > +--=20
> > +2.44.0
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0005-tests-tcg-Check-
> > that-shmat-does-not-break-proc-self-.patch b/meta/recipes-
> > devtools/qemu/qemu/0005-tests-tcg-Check-that-shmat-does-not-break-
> > proc-self-.patch
> > deleted file mode 100644
> > index 5afb35ea0c..0000000000
> > --- a/meta/recipes-devtools/qemu/qemu/0005-tests-tcg-Check-that-
> > shmat-does-not-break-proc-self-.patch
> > +++ /dev/null
> > @@ -1,85 +0,0 @@
> > -From 1234063488134ad1f541f56dd30caa7896905f06 Mon Sep 17 00:00:00
> > 2001
> > -From: Ilya Leoshkevich <iii@linux.ibm.com>
> > -Date: Wed, 28 Feb 2024 10:25:18 -1000
> > -Subject: [PATCH 5/5] tests/tcg: Check that shmat() does not break
> > - /proc/self/maps
> > -
> > -Add a regression test for a recently fixed issue, where shmat()
> > -desynced the guest and the host view of the address space and
> > caused
> > -open("/proc/self/maps") to SEGV.
> > -
> > -Upstream-Status: Submitted
> > [https://www.mail-archive.com/qemu-devel@nongnu.org/msg1026793.html
> > ]
> > -
> > -Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > -Message-Id:
> > <jwyuvao4apydvykmsnvacwshdgy3ixv7qvkh4dbxm3jkwgnttw@k4wpaayou7oq>
> > -Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ----
> > - tests/tcg/multiarch/linux/linux-shmat-maps.c | 55
> > ++++++++++++++++++++
> > - 1 file changed, 55 insertions(+)
> > - create mode 100644 tests/tcg/multiarch/linux/linux-shmat-maps.c
> > -
> > -diff --git a/tests/tcg/multiarch/linux/linux-shmat-maps.c
> > b/tests/tcg/multiarch/linux/linux-shmat-maps.c
> > -new file mode 100644
> > -index 000000000..0ccf7a973
> > ---- /dev/null
> > -+++ b/tests/tcg/multiarch/linux/linux-shmat-maps.c
> > -@@ -0,0 +1,55 @@
> > -+/*
> > -+ * Test that shmat() does not break /proc/self/maps.
> > -+ *
> > -+ * SPDX-License-Identifier: GPL-2.0-or-later
> > -+ */
> > -+#include <assert.h>
> > -+#include <fcntl.h>
> > -+#include <stdlib.h>
> > -+#include <sys/ipc.h>
> > -+#include <sys/shm.h>
> > -+#include <unistd.h>
> > -+
> > -+int main(void)
> > -+{
> > -+=C2=A0=C2=A0=C2=A0 char buf[128];
> > -+=C2=A0=C2=A0=C2=A0 int err, fd;
> > -+=C2=A0=C2=A0=C2=A0 int shmid;
> > -+=C2=A0=C2=A0=C2=A0 ssize_t n;
> > -+=C2=A0=C2=A0=C2=A0 void *p;
> > -+
> > -+=C2=A0=C2=A0=C2=A0 shmid =3D shmget(IPC_PRIVATE, 1, IPC_CREAT | 0600)=
;
> > -+=C2=A0=C2=A0=C2=A0 assert(shmid !=3D -1);
> > -+
> > -+=C2=A0=C2=A0=C2=A0 /*
> > -+=C2=A0=C2=A0=C2=A0=C2=A0 * The original bug required a non-NULL addre=
ss, which
> > skipped the
> > -+=C2=A0=C2=A0=C2=A0=C2=A0 * mmap_find_vma step, which could result in =
a host mapping
> > smaller
> > -+=C2=A0=C2=A0=C2=A0=C2=A0 * than the target mapping.=C2=A0 Choose an a=
ddress at random.
> > -+=C2=A0=C2=A0=C2=A0=C2=A0 */
> > -+=C2=A0=C2=A0=C2=A0 p =3D shmat(shmid, (void *)0x800000, SHM_RND);
> > -+=C2=A0=C2=A0=C2=A0 if (p =3D=3D (void *)-1) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Because we are now=
 running the testcase for all guests
> > for which
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * we have a cross-co=
mpiler, the above random address
> > might conflict
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * with the guest exe=
cutable in some way.=C2=A0 Rather than
> > stopping,
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * continue with a sy=
stem supplied address, which should
> > never fail.
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p =3D shmat(shmid, NULL, 0=
);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert(p !=3D (void *)-1);
> > -+=C2=A0=C2=A0=C2=A0 }
> > -+
> > -+=C2=A0=C2=A0=C2=A0 fd =3D open("/proc/self/maps", O_RDONLY);
> > -+=C2=A0=C2=A0=C2=A0 assert(fd !=3D -1);
> > -+=C2=A0=C2=A0=C2=A0 do {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n =3D read(fd, buf, sizeof=
(buf));
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert(n >=3D 0);
> > -+=C2=A0=C2=A0=C2=A0 } while (n !=3D 0);
> > -+=C2=A0=C2=A0=C2=A0 close(fd);
> > -+
> > -+=C2=A0=C2=A0=C2=A0 err =3D shmdt(p);
> > -+=C2=A0=C2=A0=C2=A0 assert(err =3D=3D 0);
> > -+=C2=A0=C2=A0=C2=A0 err =3D shmctl(shmid, IPC_RMID, NULL);
> > -+=C2=A0=C2=A0=C2=A0 assert(err =3D=3D 0);
> > -+
> > -+=C2=A0=C2=A0=C2=A0 return EXIT_SUCCESS;
> > -+}
> > ---=20
> > -2.34.1
> > -
> > diff --git a/meta/recipes-devtools/qemu/qemu/0007-qemu-Determinism-
> > fixes.patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-
> > Determinism-fixes.patch
> > similarity index 71%
> > rename from meta/recipes-devtools/qemu/qemu/0007-qemu-Determinism-
> > fixes.patch
> > rename to meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-
> > fixes.patch
> > index d3f965e070..f07054f19a 100644
> > --- a/meta/recipes-devtools/qemu/qemu/0007-qemu-Determinism-
> > fixes.patch
> > +++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-
> > fixes.patch
> > @@ -1,7 +1,7 @@
> > -From 50bab5c2605b609ea7ea154f57a9be96d656725a Mon Sep 17 00:00:00
> > 2001
> > +From 9d32df80e33a7541658858497f45bed1e59e3621 Mon Sep 17 00:00:00
> > 2001
> > =C2=A0From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > =C2=A0Date: Mon, 1 Mar 2021 13:00:47 +0000
> > -Subject: [PATCH 07/12] qemu: Determinism fixes
> > +Subject: [PATCH 06/11] qemu: Determinism fixes
> > =C2=A0
> > =C2=A0When sources are included within debug information, a couple of
> > areas of the
> > =C2=A0qemu build are not reproducible due to either full buildpaths or
> > timestamps.
> > @@ -11,16 +11,15 @@ meson to pass relative paths but we can fix
> > that in the script.
> > =C2=A0
> > =C2=A0Upstream-Status: Pending [some version of all/part of this may be
> > accepted]
> > =C2=A0RP 2021/3/1
> > -
> > =C2=A0---
> > =C2=A0 scripts/decodetree.py | 2 +-
> > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> > =C2=A0
> > -Index: qemu-8.0.0/scripts/decodetree.py
> > -
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- qemu-8.0.0.orig/scripts/decodetree.py
> > -+++ qemu-8.0.0/scripts/decodetree.py
> > -@@ -1328,7 +1328,7 @@ def main():
> > +diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> > +index e8b72da3a9..5cd86b1428 100644
> > +--- a/scripts/decodetree.py
> > ++++ b/scripts/decodetree.py
> > +@@ -1558,7 +1558,7 @@ def main():
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 toppat =3D ExcMultiPattern(0)
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for filename in args:
> > @@ -29,3 +28,6 @@ Index: qemu-8.0.0/scripts/decodetree.py
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f =3D open(filen=
ame, 'rt', encoding=3D'utf-8')
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parse_file(f, to=
ppat)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f.close()
> > +--=20
> > +2.44.0
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0008-tests-
> > meson.build-use-relative-path-to-refer-to-file.patch
> > b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-
> > relative-path-to-refer-to-file.patch
> > similarity index 76%
> > rename from meta/recipes-devtools/qemu/qemu/0008-tests-meson.build-
> > use-relative-path-to-refer-to-file.patch
> > rename to meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-
> > use-relative-path-to-refer-to-file.patch
> > index a84364ccc1..74de158b2e 100644
> > --- a/meta/recipes-devtools/qemu/qemu/0008-tests-meson.build-use-
> > relative-path-to-refer-to-file.patch
> > +++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-
> > relative-path-to-refer-to-file.patch
> > @@ -1,7 +1,7 @@
> > -From 2bf9388b801d4389e2d57e95a7897bfc1c42786e Mon Sep 17 00:00:00
> > 2001
> > +From 77ebf67d0c96f51da91c8499200ebd13f4dcdd68 Mon Sep 17 00:00:00
> > 2001
> > =C2=A0From: Changqing Li <changqing.li@windriver.com>
> > =C2=A0Date: Thu, 14 Jan 2021 06:33:04 +0000
> > -Subject: [PATCH 08/12] tests/meson.build: use relative path to
> > refer to files
> > +Subject: [PATCH 07/11] tests/meson.build: use relative path to
> > refer to files
> > =C2=A0
> > =C2=A0Fix error like:
> > =C2=A0Fatal error: can't create tests/ptimer-test.p/..._qemu-
> > 5.2.0_hw_core_ptimer.c.o: File name too long
> > @@ -12,16 +12,15 @@ filename too long. Fixed by using relative path
> > to refer to files
> > =C2=A0Upstream-Status: Submitted [send to qemu-devel]
> > =C2=A0
> > =C2=A0Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > -
> > =C2=A0---
> > =C2=A0 tests/unit/meson.build | 4 ++--
> > =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
> > =C2=A0
> > -Index: qemu-8.0.0/tests/unit/meson.build
> > -
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- qemu-8.0.0.orig/tests/unit/meson.build
> > -+++ qemu-8.0.0/tests/unit/meson.build
> > -@@ -46,7 +46,7 @@ tests =3D {
> > +diff --git a/tests/unit/meson.build b/tests/unit/meson.build
> > +index 228a21d03c..272fb4c6ca 100644
> > +--- a/tests/unit/meson.build
> > ++++ b/tests/unit/meson.build
> > +@@ -47,7 +47,7 @@ tests =3D {
> > =C2=A0=C2=A0=C2=A0 'test-keyval': [testqapi],
> > =C2=A0=C2=A0=C2=A0 'test-logging': [],
> > =C2=A0=C2=A0=C2=A0 'test-uuid': [],
> > @@ -30,7 +29,7 @@ Index: qemu-8.0.0/tests/unit/meson.build
> > =C2=A0=C2=A0=C2=A0 'test-qapi-util': [],
> > =C2=A0=C2=A0=C2=A0 'test-interval-tree': [],
> > =C2=A0=C2=A0=C2=A0 'test-xs-node': [qom],
> > -@@ -136,7 +136,7 @@ if have_system
> > +@@ -138,7 +138,7 @@ if have_system
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'test-util-sockets': ['socket-helpers.c'=
],
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'test-base64': [],
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'test-bufferiszero': [],
> > @@ -39,3 +38,6 @@ Index: qemu-8.0.0/tests/unit/meson.build
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'test-vmstate': [migration, io],
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'test-yank': ['socket-helpers.c', qom, i=
o, chardev]
> > =C2=A0=C2=A0=C2=A0 }
> > +--=20
> > +2.44.0
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0009-Define-MAP_SYNC-
> > and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-
> > devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-
> > needed-li.patch
> > similarity index 80%
> > rename from meta/recipes-devtools/qemu/qemu/0009-Define-MAP_SYNC-
> > and-MAP_SHARED_VALIDATE-on-needed-li.patch
> > rename to meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-
> > MAP_SHARED_VALIDATE-on-needed-li.patch
> > index 4de6cc2445..2e28590e11 100644
> > --- a/meta/recipes-devtools/qemu/qemu/0009-Define-MAP_SYNC-and-
> > MAP_SHARED_VALIDATE-on-needed-li.patch
> > +++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-
> > MAP_SHARED_VALIDATE-on-needed-li.patch
> > @@ -1,7 +1,7 @@
> > -From ebf4bb2f51da83af0c61480414cfa156f7308b34 Mon Sep 17 00:00:00
> > 2001
> > +From 21b159a11bbcb1eeb26f12456e4c3fd62a06cbec Mon Sep 17 00:00:00
> > 2001
> > =C2=A0From: Khem Raj <raj.khem@gmail.com>
> > =C2=A0Date: Mon, 21 Mar 2022 10:09:38 -0700
> > -Subject: [PATCH 09/12] Define MAP_SYNC and MAP_SHARED_VALIDATE on
> > needed linux
> > +Subject: [PATCH 08/11] Define MAP_SYNC and MAP_SHARED_VALIDATE on
> > needed linux
> > =C2=A0 systems
> > =C2=A0
> > =C2=A0linux only wires MAP_SYNC and MAP_SHARED_VALIDATE for
> > architectures
> > @@ -13,15 +13,14 @@ Upstream-Status: Submitted
> > [https://lists.nongnu.org/archive/html/qemu-devel/202
> > =C2=A0Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > =C2=A0Cc: Zhang Yi <yi.z.zhang@linux.intel.com>
> > =C2=A0Cc: Michael S. Tsirkin <mst@redhat.com>
> > -
> > =C2=A0---
> > =C2=A0 util/mmap-alloc.c | 10 +++++++---
> > =C2=A0 1 file changed, 7 insertions(+), 3 deletions(-)
> > =C2=A0
> > -Index: qemu-8.0.0/util/mmap-alloc.c
> > -
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- qemu-8.0.0.orig/util/mmap-alloc.c
> > -+++ qemu-8.0.0/util/mmap-alloc.c
> > +diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
> > +index ed14f9c64d..038f5b4b55 100644
> > +--- a/util/mmap-alloc.c
> > ++++ b/util/mmap-alloc.c
> > =C2=A0@@ -10,14 +10,18 @@
> > =C2=A0=C2=A0 * later.=C2=A0 See the COPYING file in the top-level direc=
tory.
> > =C2=A0=C2=A0 */
> > @@ -44,3 +43,6 @@ Index: qemu-8.0.0/util/mmap-alloc.c
> > =C2=A0 #include "qemu/mmap-alloc.h"
> > =C2=A0 #include "qemu/host-utils.h"
> > =C2=A0 #include "qemu/cutils.h"
> > +--=20
> > +2.44.0
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0002-linux-user-
> > Replace-use-of-lfs64-related-functions-an.patch b/meta/recipes-
> > devtools/qemu/qemu/0009-linux-user-Replace-use-of-lfs64-related-
> > functions-an.patch
> > similarity index 81%
> > rename from meta/recipes-devtools/qemu/qemu/0002-linux-user-
> > Replace-use-of-lfs64-related-functions-an.patch
> > rename to meta/recipes-devtools/qemu/qemu/0009-linux-user-Replace-
> > use-of-lfs64-related-functions-an.patch
> > index ceae67be64..7577249d39 100644
> > --- a/meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-
> > of-lfs64-related-functions-an.patch
> > +++ b/meta/recipes-devtools/qemu/qemu/0009-linux-user-Replace-use-
> > of-lfs64-related-functions-an.patch
> > @@ -1,7 +1,7 @@
> > -From 71f14902256e3c3529710b713e1ea43100bf4c40 Mon Sep 17 00:00:00
> > 2001
> > +From 23de30079dbf47a8026faddd550a9e181d609c8f Mon Sep 17 00:00:00
> > 2001
> > =C2=A0From: Khem Raj <raj.khem@gmail.com>
> > =C2=A0Date: Sat, 17 Dec 2022 08:37:46 -0800
> > -Subject: [PATCH 2/2] linux-user: Replace use of lfs64 related
> > functions and
> > +Subject: [PATCH 09/11] linux-user: Replace use of lfs64 related
> > functions and
> > =C2=A0 macros
> > =C2=A0
> > =C2=A0Builds defines -D_FILE_OFFSET_BITS=3D64 which makes the original
> > functions
> > @@ -16,11 +16,11 @@ Cc: Laurent Vivier <laurent@vivier.eu>
> > =C2=A0 linux-user/syscall.c | 153 +++++++++++--------------------------=
-
> > -----
> > =C2=A0 1 file changed, 39 insertions(+), 114 deletions(-)
> > =C2=A0
> > -Index: qemu-8.0.0/linux-user/syscall.c
> > -
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- qemu-8.0.0.orig/linux-user/syscall.c
> > -+++ qemu-8.0.0/linux-user/syscall.c
> > -@@ -761,8 +761,8 @@ safe_syscall6(ssize_t, copy_file_range,
> > +diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> > +index 18f09f1f07..1b7c50a2a7 100644
> > +--- a/linux-user/syscall.c
> > ++++ b/linux-user/syscall.c
> > +@@ -761,8 +761,8 @@ safe_syscall6(ssize_t, copy_file_range, int,
> > infd, loff_t *, pinoff,
> > =C2=A0=C2=A0 */
> > =C2=A0 #define safe_ioctl(...) safe_syscall(__NR_ioctl, __VA_ARGS__)
> > =C2=A0 /* Similarly for fcntl. Note that callers must always:
> > @@ -31,7 +31,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
> > =C2=A0=C2=A0 * This will then work and use a 64-bit offset for both 32-=
bit
> > and 64-bit hosts.
> > =C2=A0=C2=A0 */
> > =C2=A0 #ifdef __NR_fcntl64
> > -@@ -6813,13 +6813,13 @@ static int target_to_host_fcntl_cmd(int
> > +@@ -6739,13 +6739,13 @@ static int target_to_host_fcntl_cmd(int
> > cmd)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D cmd;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case TARGET_F_GETLK:
> > @@ -48,7 +48,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case TARGET_F_GETOWN:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D F_GETOWN=
;
> > -@@ -6833,17 +6833,6 @@ static int target_to_host_fcntl_cmd(int
> > +@@ -6759,17 +6759,6 @@ static int target_to_host_fcntl_cmd(int
> > cmd)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case TARGET_F_SETSIG:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D F_SETSIG=
;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > @@ -66,7 +66,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case TARGET_F_SETLEASE:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D F_SETLEA=
SE;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > -@@ -6895,8 +6884,8 @@ static int target_to_host_fcntl_cmd(int
> > +@@ -6821,8 +6810,8 @@ static int target_to_host_fcntl_cmd(int cmd)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * them to 5, 6 and 7 before making=
 the syscall(). Since we
> > make the
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * syscall directly, adjust to what=
 is supported by the
> > kernel.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > @@ -77,7 +77,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0 #endif
> > =C2=A0=20
> > -@@ -6929,55 +6918,11 @@ static int host_to_target_flock(int type
> > +@@ -6855,55 +6844,11 @@ static int host_to_target_flock(int type)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return type;
> > =C2=A0 }
> > =C2=A0=20
> > @@ -136,7 +136,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_short l_type;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_short l_whence;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_llong l_start;
> > -@@ -6985,10 +6930,10 @@ struct target_oabi_flock64 {
> > +@@ -6911,10 +6856,10 @@ struct target_oabi_flock64 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abi_int=C2=A0=C2=A0 l_pid;
> > =C2=A0 } QEMU_PACKED;
> > =C2=A0=20
> > @@ -149,7 +149,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int l_type;
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!lock_user_struct(VERIFY_READ, targe=
t_fl,
> > target_flock_addr, 1)) {
> > -@@ -7009,10 +6954,10 @@ static inline abi_long copy_from_user_oa
> > +@@ -6935,10 +6880,10 @@ static inline abi_long
> > copy_from_user_oabi_flock64(struct flock64 *fl,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > =C2=A0 }
> > =C2=A0=20
> > @@ -163,7 +163,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 short l_type;
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!lock_user_struct(VERIFY_WRITE, targ=
et_fl,
> > target_flock_addr, 0)) {
> > -@@ -7030,10 +6975,10 @@ static inline abi_long copy_to_user_oabi
> > +@@ -6956,10 +6901,10 @@ static inline abi_long
> > copy_to_user_oabi_flock64(abi_ulong target_flock_addr,
> > =C2=A0 }
> > =C2=A0 #endif
> > =C2=A0=20
> > @@ -176,7 +176,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int l_type;
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!lock_user_struct(VERIFY_READ, targe=
t_fl,
> > target_flock_addr, 1)) {
> > -@@ -7054,10 +6999,10 @@ static inline abi_long copy_from_user_fl
> > +@@ -6980,10 +6925,10 @@ static inline abi_long
> > copy_from_user_flock64(struct flock64 *fl,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > =C2=A0 }
> > =C2=A0=20
> > @@ -190,7 +190,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 short l_type;
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!lock_user_struct(VERIFY_WRITE, targ=
et_fl,
> > target_flock_addr, 0)) {
> > -@@ -7076,7 +7021,7 @@ static inline abi_long copy_to_user_floc
> > +@@ -7002,7 +6947,7 @@ static inline abi_long
> > copy_to_user_flock64(abi_ulong target_flock_addr,
> > =C2=A0=20
> > =C2=A0 static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
> > =C2=A0 {
> > @@ -199,7 +199,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
> > =C2=A0 #ifdef F_GETOWN_EX
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct f_owner_ex fox;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct target_f_owner_ex *target_fox;
> > -@@ -7089,6 +7034,7 @@ static abi_long do_fcntl(int fd, int cmd
> > +@@ -7015,6 +6960,7 @@ static abi_long do_fcntl(int fd, int cmd,
> > abi_ulong arg)
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch(cmd) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case TARGET_F_GETLK:
> > @@ -207,7 +207,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D copy_fro=
m_user_flock(&fl64, arg);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return ret;
> > -@@ -7098,32 +7044,11 @@ static abi_long do_fcntl(int fd, int cmd
> > +@@ -7024,32 +6970,11 @@ static abi_long do_fcntl(int fd, int cmd,
> > abi_ulong arg)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ret =3D copy_to_user_flock(arg, &fl64);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > @@ -241,7 +241,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return ret;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > -@@ -7348,7 +7273,7 @@ static inline abi_long target_truncate64
> > +@@ -7278,7 +7203,7 @@ static inline abi_long
> > target_truncate64(CPUArchState *cpu_env, const char *arg1
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arg2 =3D arg3;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arg3 =3D arg4;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > @@ -250,7 +250,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
> > =C2=A0 }
> > =C2=A0 #endif
> > =C2=A0=20
> > -@@ -7362,7 +7287,7 @@ static inline abi_long target_ftruncate6
> > +@@ -7292,7 +7217,7 @@ static inline abi_long
> > target_ftruncate64(CPUArchState *cpu_env, abi_long arg1,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arg2 =3D arg3;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arg3 =3D arg4;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > @@ -259,7 +259,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
> > =C2=A0 }
> > =C2=A0 #endif
> > =C2=A0=20
> > -@@ -8598,7 +8523,7 @@ static int do_getdents(abi_long dirfd, a
> > +@@ -8667,7 +8592,7 @@ static int do_getdents(abi_long dirfd,
> > abi_long arg2, abi_long count)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *tdirp;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int hlen, hoff, toff;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int hreclen, treclen;
> > @@ -268,7 +268,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hdirp =3D g_try_malloc(count);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!hdirp) {
> > -@@ -8651,7 +8576,7 @@ static int do_getdents(abi_long dirfd, a
> > +@@ -8720,7 +8645,7 @@ static int do_getdents(abi_long dirfd,
> > abi_long arg2, abi_long count)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 * Return what we have, resetting the file pointer to
> > the
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 * location of the first record not returned.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 */
> > @@ -277,7 +277,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 break;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0=20
> > -@@ -8685,7 +8610,7 @@ static int do_getdents64(abi_long dirfd,
> > +@@ -8754,7 +8679,7 @@ static int do_getdents64(abi_long dirfd,
> > abi_long arg2, abi_long count)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *tdirp;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int hlen, hoff, toff;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int hreclen, treclen;
> > @@ -286,7 +286,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hdirp =3D g_try_malloc(count);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!hdirp) {
> > -@@ -8727,7 +8652,7 @@ static int do_getdents64(abi_long dirfd,
> > +@@ -8796,7 +8721,7 @@ static int do_getdents64(abi_long dirfd,
> > abi_long arg2, abi_long count)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 * Return what we have, resetting the file pointer to
> > the
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 * location of the first record not returned.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 */
> > @@ -295,7 +295,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 break;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0=20
> > -@@ -11158,7 +11083,7 @@ static abi_long do_syscall1(CPUArchState
> > +@@ -11527,7 +11452,7 @@ static abi_long do_syscall1(CPUArchState
> > *cpu_env, int num, abi_long arg1,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -TARGET_EFAULT;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 }
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > @@ -304,7 +304,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unlock_user(p, a=
rg2, ret);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case TARGET_NR_pwrite64:
> > -@@ -11175,7 +11100,7 @@ static abi_long do_syscall1(CPUArchState
> > +@@ -11544,7 +11469,7 @@ static abi_long do_syscall1(CPUArchState
> > *cpu_env, int num, abi_long arg1,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -TARGET_EFAULT;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 }
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > @@ -313,7 +313,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unlock_user(p, a=
rg2, 0);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> > =C2=A0 #endif
> > -@@ -11998,14 +11923,14 @@ static abi_long do_syscall1(CPUArchState
> > +@@ -12404,14 +12329,14 @@ static abi_long do_syscall1(CPUArchState
> > *cpu_env, int num, abi_long arg1,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case TARGET_NR_fcntl64:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int cmd;
> > @@ -333,7 +333,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0 #endif
> > =C2=A0=20
> > -@@ -12015,7 +11940,7 @@ static abi_long do_syscall1(CPUArchState
> > +@@ -12421,7 +12346,7 @@ static abi_long do_syscall1(CPUArchState
> > *cpu_env, int num, abi_long arg1,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch(arg2) {
> > @@ -342,7 +342,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ret =3D copyfrom(&fl, arg3);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (ret) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > -@@ -12026,8 +11951,8 @@ static abi_long do_syscall1(CPUArchState
> > +@@ -12432,8 +12357,8 @@ static abi_long do_syscall1(CPUArchState
> > *cpu_env, int num, abi_long arg1,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 }
> > =C2=A0=C2=A0	=C2=A0=C2=A0=C2=A0 break;
> > =C2=A0=20
> > @@ -353,3 +353,6 @@ Index: qemu-8.0.0/linux-user/syscall.c
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ret =3D copyfrom(&fl, arg3);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (ret) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > +--=20
> > +2.44.0
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/fixedmeson.patch
> > b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-
> > exutable-from-PATH.patch
> > similarity index 53%
> > rename from meta/recipes-devtools/qemu/qemu/fixedmeson.patch
> > rename to meta/recipes-devtools/qemu/qemu/0010-configure-lookup-
> > meson-exutable-from-PATH.patch
> > index 9047f66dc3..98ce85a8cf 100644
> > --- a/meta/recipes-devtools/qemu/qemu/fixedmeson.patch
> > +++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-
> > exutable-from-PATH.patch
> > @@ -1,10 +1,18 @@
> > +From e12a93174f9b652604dda8d8464b9559b62b29d5 Mon Sep 17 00:00:00
> > 2001
> > +From: =3D?UTF-8?q?Martin=3D20Hundeb=3DC3=3DB8ll?=3D <martin@geanix.com=
>
> > +Date: Wed, 22 May 2024 14:02:55 +0200
> > +Subject: [PATCH 10/11] configure: lookup meson exutable from PATH
> > +
> > =C2=A0Upstream-Status: Inappropriate [workaround, would need a real fix
> > for upstream]
> > +---
> > + configure | 7 +------
> > + 1 file changed, 1 insertion(+), 6 deletions(-)
> > =C2=A0
> > -Index: qemu-8.2.0/configure
> > -
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- qemu-8.2.0.orig/configure
> > -+++ qemu-8.2.0/configure
> > -@@ -955,12 +955,7 @@ fi
> > +diff --git a/configure b/configure
> > +index 3cd736b139..482a1f8ef3 100755
> > +--- a/configure
> > ++++ b/configure
> > +@@ -956,12 +956,7 @@ fi
> > =C2=A0 $mkvenv ensuregroup --dir "${source_path}/python/wheels" \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${source_path}/pythondeps.toml mes=
on || exit 1
> > =C2=A0=20
> > @@ -18,3 +26,6 @@ Index: qemu-8.2.0/configure
> > =C2=A0=20
> > =C2=A0 # Conditionally ensure Sphinx is installed.
> > =C2=A0=20
> > +--=20
> > +2.44.0
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0010-hw-pvrdma-
> > Protect-against-buggy-or-malicious-guest-d.patch b/meta/recipes-
> > devtools/qemu/qemu/0010-hw-pvrdma-Protect-against-buggy-or-
> > malicious-guest-d.patch
> > deleted file mode 100644
> > index 6caf35b634..0000000000
> > --- a/meta/recipes-devtools/qemu/qemu/0010-hw-pvrdma-Protect-
> > against-buggy-or-malicious-guest-d.patch
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -CVE: CVE-2022-1050
> > -Upstream-Status: Submitted
> > [https://lore.kernel.org/qemu-devel/20220403095234.2210-1-yuval.sha
> > ia.ml@gmail.com/]
> > -Signed-off-by: Ross Burton <ross.burton@arm.com>
> > -
> > -From dbdef95c272e8f3ec037c3db4197c66002e30995 Mon Sep 17 00:00:00
> > 2001
> > -From: Yuval Shaia <yuval.shaia.ml@gmail.com>
> > -Date: Sun, 3 Apr 2022 12:52:34 +0300
> > -Subject: [PATCH] hw/pvrdma: Protect against buggy or malicious
> > guest driver
> > -
> > -Guest driver might execute HW commands when shared buffers are not
> > yet
> > -allocated.
> > -This could happen on purpose (malicious guest) or because of some
> > other
> > -guest/host address mapping error.
> > -We need to protect againts such case.
> > -
> > -Fixes: CVE-2022-1050
> > -
> > -Reported-by: Raven <wxhusst@gmail.com>
> > -Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
> > ----
> > - hw/rdma/vmw/pvrdma_cmd.c | 6 ++++++
> > - 1 file changed, 6 insertions(+)
> > -
> > -Index: qemu-8.0.0/hw/rdma/vmw/pvrdma_cmd.c
> > -
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- qemu-8.0.0.orig/hw/rdma/vmw/pvrdma_cmd.c
> > -+++ qemu-8.0.0/hw/rdma/vmw/pvrdma_cmd.c
> > -@@ -782,6 +782,12 @@ int pvrdma_exec_cmd(PVRDMADev *dev)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 goto out;
> > -=C2=A0=C2=A0=C2=A0=C2=A0 }
> > -=20
> > -+=C2=A0=C2=A0=C2=A0 if (!dsr_info->dsr) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=
 Buggy or malicious guest driver */
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rd=
ma_error_report("Exec command without dsr, req or
> > rsp buffers");
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go=
to out;
> > -+=C2=A0=C2=A0=C2=A0 }
> > -+
> > -=C2=A0=C2=A0=C2=A0=C2=A0 if (dsr_info->req->hdr.cmd >=3D sizeof(cmd_ha=
ndlers) /
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(stru=
ct cmd_handler)) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rdma_error_report("Un=
supported command");
> > diff --git a/meta/recipes-devtools/qemu/qemu/0011-linux-user-
> > workaround-for-missing-MAP_FIXED_NOREPLAC.patch b/meta/recipes-
> > devtools/qemu/qemu/0011-linux-user-workaround-for-missing-
> > MAP_FIXED_NOREPLAC.patch
> > deleted file mode 100644
> > index cc53b1eedd..0000000000
> > --- a/meta/recipes-devtools/qemu/qemu/0011-linux-user-workaround-
> > for-missing-MAP_FIXED_NOREPLAC.patch
> > +++ /dev/null
> > @@ -1,282 +0,0 @@
> > -From fa9bcabe2387bb230ef82d62827ad6f93b8a1e61 Mon Sep 17 00:00:00
> > 2001
> > -From: Frederic Konrad <fkonrad@amd.com>
> > -Date: Wed, 17 Jan 2024 18:15:06 +0000
> > -Subject: [PATCH 1/2] linux-user/*: workaround for missing
> > MAP_FIXED_NOREPLACE
> > -
> > -QEMU v8.1.0 recently requires MAP_FIXED_NOREPLACE flags
> > implementation for mmap.
> > -
> > -This is missing from ubuntu 18.04, thus this patch catches the
> > mmap calls which
> > -could use that new flag and forwards them to mmap when
> > MAP_FIXED_NOREPLACE
> > -flag isn't set or emulates them by checking the returned address
> > w.r.t the
> > -requested address.
> > -
> > -Signed-off-by: Frederic Konrad <fkonrad@amd.com>
> > -Signed-off-by: Francisco Iglesias <francisco.iglesias@amd.com>
> > -
> > -Upstream-Status: Inappropriate [OE specific]
> > -
> > -The upstream only supports the last two major releases of an OS.=C2=A0
> > The ones
> > -they have declared all have kernel 4.17 or newer.
> > -
> > -See:
> > -https://xilinx.slack.com/archives/D04G2647CTV/p1705074697942019
> > -
> > -https://www.qemu.org/docs/master/about/build-platforms.html
> > -
> > - The project aims to support the most recent major version at all
> > times for up
> > - to five years after its initial release. Support for the previous
> > major
> > - version will be dropped 2 years after the new major version is
> > released or
> > - when the vendor itself drops support, whichever comes first.
> > -
> > -Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> > ----
> > - linux-user/elfload.c=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++--
> > - linux-user/meson.build=C2=A0 |=C2=A0 1 +
> > - linux-user/mmap-fixed.c | 63
> > +++++++++++++++++++++++++++++++++++++++++
> > - linux-user/mmap-fixed.h | 39 +++++++++++++++++++++++++
> > - linux-user/mmap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 31 ++++++++++=
+---------
> > - linux-user/syscall.c=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > - 6 files changed, 125 insertions(+), 17 deletions(-)
> > - create mode 100644 linux-user/mmap-fixed.c
> > - create mode 100644 linux-user/mmap-fixed.h
> > -
> > -Index: qemu-8.2.1/linux-user/elfload.c
> > -
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- qemu-8.2.1.orig/linux-user/elfload.c
> > -+++ qemu-8.2.1/linux-user/elfload.c
> > -@@ -22,6 +22,7 @@
> > - #include "qemu/error-report.h"
> > - #include "target_signal.h"
> > - #include "accel/tcg/debuginfo.h"
> > -+#include "mmap-fixed.h"
> > -=20
> > - #ifdef TARGET_ARM
> > - #include "target/arm/cpu-features.h"
> > -@@ -2765,9 +2766,9 @@ static abi_ulong create_elf_tables(abi_u
> > - static int pgb_try_mmap(uintptr_t addr, uintptr_t addr_last, bool
> > keep)
> > - {
> > -=C2=A0=C2=A0=C2=A0=C2=A0 size_t size =3D addr_last - addr + 1;
> > --=C2=A0=C2=A0=C2=A0 void *p =3D mmap((void *)addr, size, PROT_NONE,
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAP_ANONYMOUS | MAP_PRIVATE |
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAP_NORESERVE | MAP_FIXED_NOREPLACE=
, -1, 0);
> > -+=C2=A0=C2=A0=C2=A0 void *p =3D mmap_fixed_noreplace((void *)addr, siz=
e, PROT_NONE,
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAP_ANONYMOUS =
| MAP_PRIVATE |
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAP_NORESERVE =
|
> > MAP_FIXED_NOREPLACE, -1, 0);
> > -=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
> > -=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0 if (p =3D=3D MAP_FAILED) {
> > -Index: qemu-8.2.1/linux-user/meson.build
> > -
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- qemu-8.2.1.orig/linux-user/meson.build
> > -+++ qemu-8.2.1/linux-user/meson.build
> > -@@ -14,6 +14,7 @@ linux_user_ss.add(files(
> > -=C2=A0=C2=A0 'linuxload.c',
> > -=C2=A0=C2=A0 'main.c',
> > -=C2=A0=C2=A0 'mmap.c',
> > -+=C2=A0 'mmap-fixed.c',
> > -=C2=A0=C2=A0 'signal.c',
> > -=C2=A0=C2=A0 'strace.c',
> > -=C2=A0=C2=A0 'syscall.c',
> > -Index: qemu-8.2.1/linux-user/mmap-fixed.c
> > -
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- /dev/null
> > -+++ qemu-8.2.1/linux-user/mmap-fixed.c
> > -@@ -0,0 +1,63 @@
> > -+/*
> > -+ * Workaround for MAP_FIXED_NOREPLACE
> > -+ *
> > -+ * Copyright (c) 2024, Advanced Micro Devices, Inc.
> > -+ * Developed by Fred Konrad <fkonrad@amd.com>
> > -+ *
> > -+ * Permission is hereby granted, free of charge, to any person
> > obtaining a copy
> > -+ * of this software and associated documentation files (the
> > "Software"), to deal
> > -+ * in the Software without restriction, including without
> > limitation the rights
> > -+ * to use, copy, modify, merge, publish, distribute, sublicense,
> > and/or sell
> > -+ * copies of the Software, and to permit persons to whom the
> > Software is
> > -+ * furnished to do so, subject to the following conditions:
> > -+ *
> > -+ * The above copyright notice and this permission notice shall be
> > included in
> > -+ * all copies or substantial portions of the Software.
> > -+ *
> > -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
> > KIND, EXPRESS OR
> > -+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > MERCHANTABILITY,
> > -+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
> > EVENT SHALL
> > -+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
> > DAMAGES OR OTHER
> > -+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> > OTHERWISE, ARISING FROM,
> > -+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> > DEALINGS IN
> > -+ * THE SOFTWARE.
> > -+ */
> > -+
> > -+#include <sys/mman.h>
> > -+#include <errno.h>
> > -+
> > -+#ifndef MAP_FIXED_NOREPLACE
> > -+#include "mmap-fixed.h"
> > -+
> > -+void *mmap_fixed_noreplace(void *addr, size_t len, int prot, int
> > flags,
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int fd, off_t offset=
)
> > -+{
> > -+=C2=A0=C2=A0=C2=A0 void *retaddr;
> > -+
> > -+=C2=A0=C2=A0=C2=A0 if (!(flags & MAP_FIXED_NOREPLACE)) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* General case, use the r=
egular mmap.=C2=A0 */
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return mmap(addr, len, pro=
t, flags, fd, offset);
> > -+=C2=A0=C2=A0=C2=A0 }
> > -+
> > -+=C2=A0=C2=A0=C2=A0 /* Since MAP_FIXED_NOREPLACE is not implemented, t=
ry to
> > emulate it.=C2=A0 */
> > -+=C2=A0=C2=A0=C2=A0 flags =3D flags & ~(MAP_FIXED_NOREPLACE | MAP_FIXE=
D);
> > -+=C2=A0=C2=A0=C2=A0 retaddr =3D mmap(addr, len, prot, flags, fd, offse=
t);
> > -+=C2=A0=C2=A0=C2=A0 if ((retaddr =3D=3D addr) || (retaddr =3D=3D MAP_F=
AILED)) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Either the map wor=
ked and we get the good address so
> > it can be
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * returned, or it fa=
iled and would have failed the same
> > with
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * MAP_FIXED*, in whi=
ch case return MAP_FAILED.
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return retaddr;
> > -+=C2=A0=C2=A0=C2=A0 } else {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Page has been mapp=
ed but not at the requested
> > address.. unmap it and
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * return EEXIST.
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 munmap(retaddr, len);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 errno =3D EEXIST;
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return MAP_FAILED;
> > -+=C2=A0=C2=A0=C2=A0 }
> > -+}
> > -+
> > -+#endif
> > -Index: qemu-8.2.1/linux-user/mmap-fixed.h
> > -
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- /dev/null
> > -+++ qemu-8.2.1/linux-user/mmap-fixed.h
> > -@@ -0,0 +1,39 @@
> > -+/*
> > -+ * Workaround for MAP_FIXED_NOREPLACE
> > -+ *
> > -+ * Copyright (c) 2024, Advanced Micro Devices, Inc.
> > -+ * Developed by Fred Konrad <fkonrad@amd.com>
> > -+ *
> > -+ * Permission is hereby granted, free of charge, to any person
> > obtaining a copy
> > -+ * of this software and associated documentation files (the
> > "Software"), to deal
> > -+ * in the Software without restriction, including without
> > limitation the rights
> > -+ * to use, copy, modify, merge, publish, distribute, sublicense,
> > and/or sell
> > -+ * copies of the Software, and to permit persons to whom the
> > Software is
> > -+ * furnished to do so, subject to the following conditions:
> > -+ *
> > -+ * The above copyright notice and this permission notice shall be
> > included in
> > -+ * all copies or substantial portions of the Software.
> > -+ *
> > -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
> > KIND, EXPRESS OR
> > -+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > MERCHANTABILITY,
> > -+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
> > EVENT SHALL
> > -+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
> > DAMAGES OR OTHER
> > -+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> > OTHERWISE, ARISING FROM,
> > -+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> > DEALINGS IN
> > -+ * THE SOFTWARE.
> > -+ */
> > -+
> > -+#ifndef MMAP_FIXED_H
> > -+#define MMAP_FIXED_H
> > -+
> > -+#ifndef MAP_FIXED_NOREPLACE
> > -+#define MAP_FIXED_NOREPLACE 0x100000
> > -+
> > -+void *mmap_fixed_noreplace(void *addr, size_t len, int prot, int
> > flags,
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 int fd, off_t offset);
> > -+
> > -+#else /* MAP_FIXED_NOREPLACE */
> > -+#define mmap_fixed_noreplace mmap
> > -+#endif /* MAP_FIXED_NOREPLACE */
> > -+
> > -+#endif /* MMAP_FIXED_H */
> > -Index: qemu-8.2.1/linux-user/mmap.c
> > -
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- qemu-8.2.1.orig/linux-user/mmap.c
> > -+++ qemu-8.2.1/linux-user/mmap.c
> > -@@ -25,6 +25,7 @@
> > - #include "user-mmap.h"
> > - #include "target_mman.h"
> > - #include "qemu/interval-tree.h"
> > -+#include "mmap-fixed.h"
> > -=20
> > - #ifdef TARGET_ARM
> > - #include "target/arm/cpu-features.h"
> > -@@ -273,7 +274,7 @@ int target_mprotect(abi_ulong start, abi
> > - static int do_munmap(void *addr, size_t len)
> > - {
> > -=C2=A0=C2=A0=C2=A0=C2=A0 if (reserved_va) {
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *ptr =3D mmap(addr, l=
en, PROT_NONE,
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *ptr =3D=C2=A0 mmap_f=
ixed_noreplace(addr, len, PROT_NONE,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 MAP_FIXED | MAP_ANONYMOUS
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | MAP_PRIVATE | MAP_NORESERVE, -1, 0);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ptr =3D=3D add=
r ? 0 : -1;
> > -@@ -319,9 +320,9 @@ static bool mmap_frag(abi_ulong real_sta
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * outside of th=
e fragment we need to map.=C2=A0 Allocate a
> > new host
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * page to cover=
, discarding whatever else may have been
> > present.
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *p =3D mmap(host_star=
t, qemu_host_page_size,
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 target_to_h=
ost_prot(prot),
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags | MAP=
_ANONYMOUS, -1, 0);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *p =3D mmap_fixed_nor=
eplace(host_start,
> > qemu_host_page_size,
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 target_to_host_prot(prot),
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 flags | MAP_ANONYMOUS, -1,
> > 0);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (p !=3D host_start=
) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (p !=3D MAP_FAILED) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 munmap(p, qemu_host_page_size);
> > -@@ -420,8 +421,9 @@ abi_ulong mmap_find_vma(abi_ulong start,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0 - mrema=
p() with MREMAP_FIXED flag
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0 - shmat=
() with SHM_REMAP flag
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ptr =3D mmap(g2h_untagged(=
addr), size, PROT_NONE,
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAP_ANONYMOUS | MAP_PRIVATE | MAP_N=
ORESERVE, -
> > 1, 0);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ptr =3D mmap_fixed_norepla=
ce(g2h_untagged(addr), size,
> > PROT_NONE,
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAP_ANONYMOUS =
| MAP_PRIVATE |
> > MAP_NORESERVE,
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -1, 0);
> > -=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* ENOMEM, if host ad=
dress space has no memory */
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ptr =3D=3D MAP_FA=
ILED) {
> > -@@ -615,16 +617,16 @@ abi_long target_mmap(abi_ulong start, ab
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * especially im=
portant if qemu_host_page_size >
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * qemu_real_hos=
t_page_size.
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p =3D mmap(g2h_untagged(st=
art), host_len, host_prot,
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p =3D mmap_fixed_noreplace=
(g2h_untagged(start), host_len,
> > host_prot,
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags | MAP_FIXED |
> > MAP_ANONYMOUS, -1, 0);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (p =3D=3D MAP_FAIL=
ED) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 goto fail;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* update start so th=
at it points to the file position at
> > 'offset' */
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 host_start =3D (uintp=
tr_t)p;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!(flags & MAP_ANO=
NYMOUS)) {
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p =
=3D mmap(g2h_untagged(start), len, host_prot,
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags | MAP_FIXED, fd, =
host_offset);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p =
=3D mmap_fixed_noreplace(g2h_untagged(start), len,
> > host_prot,
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fl=
ags | MAP_FIXED, fd,
> > host_offset);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (p =3D=3D MAP_FAILED) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 munmap(g2h_untagged(start), host_len);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto fail;
> > -@@ -749,8 +751,9 @@ abi_long target_mmap(abi_ulong start, ab
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 len1 =3D real_last - real_start + 1;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 want_p =3D g2h_untagged(real_start);
> > -=20
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p =
=3D mmap(want_p, len1,
> > target_to_host_prot(target_prot),
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags, fd, offset1);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p =
=3D mmap_fixed_noreplace(want_p, len1,
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > target_to_host_prot(target_prot),
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fl=
ags, fd, offset1);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (p !=3D want_p) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (p !=3D MAP_FAILED) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 munmap(p, len1);
> > -Index: qemu-8.2.1/linux-user/syscall.c
> > -
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- qemu-8.2.1.orig/linux-user/syscall.c
> > -+++ qemu-8.2.1/linux-user/syscall.c
> > -@@ -145,6 +145,7 @@
> > - #include "qapi/error.h"
> > - #include "fd-trans.h"
> > - #include "cpu_loop-common.h"
> > -+#include "mmap-fixed.h"
> > -=20
> > - #ifndef CLONE_IO
> > - #define CLONE_IO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x80000000=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /* Clone io
> > context */
> > diff --git a/meta/recipes-devtools/qemu/qemu/no-pip.patch
> > b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-
> > python-venv-aren-t-used-for-.patch
> > similarity index 70%
> > rename from meta/recipes-devtools/qemu/qemu/no-pip.patch
> > rename to meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-
> > the-python-venv-aren-t-used-for-.patch
> > index 92b2edbe9f..c7bb9b1b47 100644
> > --- a/meta/recipes-devtools/qemu/qemu/no-pip.patch
> > +++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-
> > python-venv-aren-t-used-for-.patch
> > @@ -1,4 +1,8 @@
> > -qemu: Ensure pip and the python venv aren't used for meson
> > +From a93c2a6b2c9db9c4bd30298da43c37c5e5c6236e Mon Sep 17 00:00:00
> > 2001
> > +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > +Date: Wed, 22 May 2024 13:58:23 +0200
> > +Subject: [PATCH 11/11] qemu: Ensure pip and the python venv aren't
> > used for
> > + meson
> > =C2=A0
> > =C2=A0Qemu wants to use a supported python version and a specific meson
> > version
> > =C2=A0to "help" users and uses pip and creates a venv to do this. This
> > is a nightmare
> > @@ -21,12 +25,15 @@ as it stands is a workaround.
> > =C2=A0
> > =C2=A0Upstream-Status: Inappropriate [oe specific]
> > =C2=A0Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org=
>
> > +---
> > + configure | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > =C2=A0
> > -Index: qemu-8.2.0/configure
> > -
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- qemu-8.2.0.orig/configure
> > -+++ qemu-8.2.0/configure
> > -@@ -937,7 +937,7 @@ python=3D"$(command -v "$python")"
> > +diff --git a/configure b/configure
> > +index 482a1f8ef3..0da4bf3e4d 100755
> > +--- a/configure
> > ++++ b/configure
> > +@@ -938,14 +938,14 @@ python=3D"$(command -v "$python")"
> > =C2=A0 echo "python determined to be '$python'"
> > =C2=A0 echo "python version: $($python --version)"
> > =C2=A0=20
> > @@ -35,11 +42,14 @@ Index: qemu-8.2.0/configure
> > =C2=A0 if test "$?" -ne 0 ; then
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_exit "python venv creation failed"
> > =C2=A0 fi
> > -@@ -945,6 +945,7 @@ fi
> > +=20
> > =C2=A0 # Suppress writing compiled files
> > =C2=A0 python=3D"$python -B"
> > - mkvenv=3D"$python ${source_path}/python/scripts/mkvenv.py"
> > +-mkvenv=3D"$python ${source_path}/python/scripts/mkvenv.py"
> > =C2=A0+mkvenv=3Dtrue
> > =C2=A0=20
> > =C2=A0 # Finish preparing the virtual environment using vendored .whl
> > files
> > =C2=A0=20
> > +--=20
> > +2.44.0
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/0012-linux-user-
> > workaround-for-missing-MAP_SHARED_VALIDAT.patch b/meta/recipes-
> > devtools/qemu/qemu/0012-linux-user-workaround-for-missing-
> > MAP_SHARED_VALIDAT.patch
> > deleted file mode 100644
> > index 48034a4680..0000000000
> > --- a/meta/recipes-devtools/qemu/qemu/0012-linux-user-workaround-
> > for-missing-MAP_SHARED_VALIDAT.patch
> > +++ /dev/null
> > @@ -1,51 +0,0 @@
> > -From 5c73e53997df800a742f9cd7355f3045861984bb Mon Sep 17 00:00:00
> > 2001
> > -From: Frederic Konrad <fkonrad@amd.com>
> > -Date: Thu, 18 Jan 2024 10:43:44 +0000
> > -Subject: [PATCH 2/2] linux-user/*: workaround for missing
> > MAP_SHARED_VALIDATE
> > -
> > -QEMU v8.1.0 recently requires MAP_SHARED_VALIDATE flags
> > implementation for mmap.
> > -
> > -This is missing from the Ubuntu 18.04 compiler but looks like to
> > be in the
> > -kernel source.
> > -
> > -Signed-off-by: Frederic Konrad <fkonrad@amd.com>
> > -Signed-off-by: Francisco Iglesias <francisco.iglesias@amd.com>
> > -
> > -Upstream-Status: Inappropriate [OE specific]
> > -
> > -The upstream only supports the last two major releases of an OS.=C2=A0
> > The ones
> > -they have declared all have kernel 4.17 or newer.
> > -
> > -See:
> > -https://xilinx.slack.com/archives/D04G2647CTV/p1705074697942019
> > -
> > -https://www.qemu.org/docs/master/about/build-platforms.html
> > -
> > - The project aims to support the most recent major version at all
> > times for up
> > - to five years after its initial release. Support for the previous
> > major
> > - version will be dropped 2 years after the new major version is
> > released or
> > - when the vendor itself drops support, whichever comes first.
> > -
> > -Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> > ----
> > - linux-user/mmap-fixed.h | 4 ++++
> > - 1 file changed, 4 insertions(+)
> > -
> > -diff --git a/linux-user/mmap-fixed.h b/linux-user/mmap-fixed.h
> > -index ef6eef5114..ec86586c1f 100644
> > ---- a/linux-user/mmap-fixed.h
> > -+++ b/linux-user/mmap-fixed.h
> > -@@ -26,6 +26,10 @@
> > - #ifndef MMAP_FIXED_H
> > - #define MMAP_FIXED_H
> > -=20
> > -+#ifndef MAP_SHARED_VALIDATE
> > -+#define MAP_SHARED_VALIDATE 0x03
> > -+#endif
> > -+
> > - #ifndef MAP_FIXED_NOREPLACE
> > - #define MAP_FIXED_NOREPLACE 0x100000
> > -=20
> > ---=20
> > -2.34.1
> > -
> > diff --git a/meta/recipes-
> > devtools/qemu/qemu/4a8579ad8629b57a43daa62e46cc7af6e1078116.patch
> > b/meta/recipes-
> > devtools/qemu/qemu/4a8579ad8629b57a43daa62e46cc7af6e1078116.patch
> > deleted file mode 100644
> > index 5ad859ebe6..0000000000
> > --- a/meta/recipes-
> > devtools/qemu/qemu/4a8579ad8629b57a43daa62e46cc7af6e1078116.patch
> > +++ /dev/null
> > @@ -1,60 +0,0 @@
> > -From 4a8579ad8629b57a43daa62e46cc7af6e1078116 Mon Sep 17 00:00:00
> > 2001
> > -From: Richard Henderson <richard.henderson@linaro.org>
> > -Date: Tue, 13 Feb 2024 10:20:27 -1000
> > -Subject: [PATCH] linux-user: Split out do_munmap
> > -MIME-Version: 1.0
> > -Content-Type: text/plain; charset=3DUTF-8
> > -Content-Transfer-Encoding: 8bit
> > -
> > -Upstream-Status: Submitted
> > [https://gitlab.com/rth7680/qemu/-/commit/4a8579ad8629b57a43daa62e4
> > 6cc7af6e1078116]
> > -
> > -Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > -Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ----
> > - linux-user/mmap.c | 23 ++++++++++++++++-------
> > - 1 file changed, 16 insertions(+), 7 deletions(-)
> > -
> > -diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> > -index 1bbfeb25b14..8ebcca44444 100644
> > ---- a/linux-user/mmap.c
> > -+++ b/linux-user/mmap.c
> > -@@ -267,6 +267,21 @@ int target_mprotect(abi_ulong start,
> > abi_ulong len, int target_prot)
> > -=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> > - }
> > -=20
> > -+/*
> > -+ * Perform munmap on behalf of the target, with host parameters.
> > -+ * If reserved_va, we must replace the memory reservation.
> > -+ */
> > -+static int do_munmap(void *addr, size_t len)
> > -+{
> > -+=C2=A0=C2=A0=C2=A0 if (reserved_va) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *ptr =3D mmap(addr, l=
en, PROT_NONE,
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 MAP_FIXED | MAP_ANONYMOUS
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | MAP_PRIVATE | MAP_NORESERVE, -1, 0);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ptr =3D=3D addr ? 0=
 : -1;
> > -+=C2=A0=C2=A0=C2=A0 }
> > -+=C2=A0=C2=A0=C2=A0 return munmap(addr, len);
> > -+}
> > -+
> > - /* map an incomplete host page */
> > - static bool mmap_frag(abi_ulong real_start, abi_ulong start,
> > abi_ulong last,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int prot, i=
nt flags, int fd, off_t offset)
> > -@@ -854,13 +869,7 @@ static int mmap_reserve_or_unmap(abi_ulong
> > start, abi_ulong len)
> > -=C2=A0=C2=A0=C2=A0=C2=A0 real_len =3D real_last - real_start + 1;
> > -=C2=A0=C2=A0=C2=A0=C2=A0 host_start =3D g2h_untagged(real_start);
> > -=20
> > --=C2=A0=C2=A0=C2=A0 if (reserved_va) {
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *ptr =3D mmap(host_st=
art, real_len, PROT_NONE,
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 MAP_FIXED | MAP_ANONYMOUS
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | MAP_PRIVATE | MAP_NORESERVE, -1, 0);
> > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ptr =3D=3D host_sta=
rt ? 0 : -1;
> > --=C2=A0=C2=A0=C2=A0 }
> > --=C2=A0=C2=A0=C2=A0 return munmap(host_start, real_len);
> > -+=C2=A0=C2=A0=C2=A0 return do_munmap(host_start, real_len);
> > - }
> > -=20
> > - int target_munmap(abi_ulong start, abi_ulong len)
> > ---=20
> > -GitLab
> > -
> > diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-6683.patch
> > b/meta/recipes-devtools/qemu/qemu/CVE-2023-6683.patch
> > deleted file mode 100644
> > index 732cb6af18..0000000000
> > --- a/meta/recipes-devtools/qemu/qemu/CVE-2023-6683.patch
> > +++ /dev/null
> > @@ -1,91 +0,0 @@
> > -From 405484b29f6548c7b86549b0f961b906337aa68a Mon Sep 17 00:00:00
> > 2001
> > -From: Fiona Ebner <f.ebner@proxmox.com>
> > -Date: Wed, 24 Jan 2024 11:57:48 +0100
> > -Subject: [PATCH] ui/clipboard: mark type as not available when
> > there is no
> > - data
> > -MIME-Version: 1.0
> > -Content-Type: text/plain; charset=3DUTF-8
> > -Content-Transfer-Encoding: 8bit
> > -
> > -With VNC, a client can send a non-extended VNC_MSG_CLIENT_CUT_TEXT
> > -message with len=3D0. In qemu_clipboard_set_data(), the clipboard
> > info
> > -will be updated setting data to NULL (because g_memdup(data, size)
> > -returns NULL when size is 0). If the client does not set the
> > -VNC_ENCODING_CLIPBOARD_EXT feature when setting up the encodings,
> > then
> > -the 'request' callback for the clipboard peer is not initialized.
> > -Later, because data is NULL, qemu_clipboard_request() can be
> > reached
> > -via vdagent_chr_write() and vdagent_clipboard_recv_request() and
> > -there, the clipboard owner's 'request' callback will be attempted
> > to
> > -be called, but that is a NULL pointer.
> > -
> > -In particular, this can happen when using the KRDC (22.12.3) VNC
> > -client.
> > -
> > -Another scenario leading to the same issue is with two clients
> > (say
> > -noVNC and KRDC):
> > -
> > -The noVNC client sets the extension VNC_FEATURE_CLIPBOARD_EXT and
> > -initializes its cbpeer.
> > -
> > -The KRDC client does not, but triggers a vnc_client_cut_text()
> > (note
> > -it's not the _ext variant)). There, a new clipboard info with it
> > as
> > -the 'owner' is created and via qemu_clipboard_set_data() is
> > called,
> > -which in turn calls qemu_clipboard_update() with that info.
> > -
> > -In qemu_clipboard_update(), the notifier for the noVNC client will
> > be
> > -called, i.e. vnc_clipboard_notify() and also set vs->cbinfo for
> > the
> > -noVNC client. The 'owner' in that clipboard info is the clipboard
> > peer
> > -for the KRDC client, which did not initialize the 'request'
> > function.
> > -That sounds correct to me, it is the owner of that clipboard info.
> > -
> > -Then when noVNC sends a VNC_MSG_CLIENT_CUT_TEXT message (it did
> > set
> > -the VNC_FEATURE_CLIPBOARD_EXT feature correctly, so a check for it
> > -passes), that clipboard info is passed to qemu_clipboard_request()
> > and
> > -the original segfault still happens.
> > -
> > -Fix the issue by handling updates with size 0 differently. In
> > -particular, mark in the clipboard info that the type is not
> > available.
> > -
> > -While at it, switch to g_memdup2(), because g_memdup() is
> > deprecated.
> > -
> > -Cc: qemu-stable@nongnu.org
> > -Fixes: CVE-2023-6683
> > -Reported-by: Markus Frank <m.frank@proxmox.com>
> > -Suggested-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > -Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
> > -Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > -Tested-by: Markus Frank <m.frank@proxmox.com>
> > -Message-ID: <20240124105749.204610-1-f.ebner@proxmox.com>
> > -
> > -CVE: CVE-2023-6683
> > -
> > -Upstream-Status: Backport
> > [https://github.com/qemu/qemu/commit/405484b29f6548c7b86549b0f961b9
> > 06337aa68a]
> > -Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> > -
> > ----
> > - ui/clipboard.c | 12 +++++++++---
> > - 1 file changed, 9 insertions(+), 3 deletions(-)
> > -
> > -diff --git a/ui/clipboard.c b/ui/clipboard.c
> > -index 3d14bffaf80f..b3f6fa3c9e1f 100644
> > ---- a/ui/clipboard.c
> > -+++ b/ui/clipboard.c
> > -@@ -163,9 +163,15 @@ void
> > qemu_clipboard_set_data(QemuClipboardPeer *peer,
> > -=C2=A0=C2=A0=C2=A0=C2=A0 }
> > -=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0 g_free(info->types[type].data);
> > --=C2=A0=C2=A0=C2=A0 info->types[type].data =3D g_memdup(data, size);
> > --=C2=A0=C2=A0=C2=A0 info->types[type].size =3D size;
> > --=C2=A0=C2=A0=C2=A0 info->types[type].available =3D true;
> > -+=C2=A0=C2=A0=C2=A0 if (size) {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->types[type].data =3D=
 g_memdup2(data, size);
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->types[type].size =3D=
 size;
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->types[type].availabl=
e =3D true;
> > -+=C2=A0=C2=A0=C2=A0 } else {
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->types[type].data =3D=
 NULL;
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->types[type].size =3D=
 0;
> > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->types[type].availabl=
e =3D false;
> > -+=C2=A0=C2=A0=C2=A0 }
> > -=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0 if (update) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_clipboard_update=
(info);
> > diff --git a/meta/recipes-devtools/qemu/qemu_8.2.1.bb
> > b/meta/recipes-devtools/qemu/qemu_9.0.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/qemu/qemu_8.2.1.bb
> > rename to meta/recipes-devtools/qemu/qemu_9.0.0.bb
> > --=20
> > 2.44.0
> >=20
>=20
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#199752):
> > https://lists.openembedded.org/g/openembedded-core/message/199752
> > Mute This Topic:
> > https://lists.openembedded.org/mt/106242475/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> > alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20
>=20
>=20


