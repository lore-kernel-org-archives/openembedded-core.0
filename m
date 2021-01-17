Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.18870.1610893842479408291
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jan 2021 06:30:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=KcApINs/;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from fringe.fritz.box (unknown [87.123.119.238])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7088620B7192;
	Sun, 17 Jan 2021 06:30:36 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7088620B7192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1610893841;
	bh=VB9FnCVhCrBx6IzpzNG22AoxzyQx//a5ZJ25xQ7ZBEA=;
	h=Subject:From:Reply-To:To:Cc:Date:In-Reply-To:References:From;
	b=KcApINs/VvwA+9LhfMSyxA1Xj3d44r8DP+SczLJEZeD5jupEXvmNU4ETfCoQjQsXk
	 02rCILLnJx6JqnFgMpno31+kgSm+M04qCjrNozjAa//4/L+mFWIXf838avhKJEmhXq
	 vVWNVLEtg7pYsuDsmtl4lG+c01hellNIr1beTNDU=
Message-ID: <59bf265e9724eee2308436da081d6ecaf6396fd6.camel@linux.microsoft.com>
Subject: Re: [OE-core] [meta-oe][PATCH v2 1/3] runqemu: Add support for VHD/VHDX rootfs
From: "Anatol Belski" <anbelski@linux.microsoft.com>
Reply-To: anbelski@linux.microsoft.com
To: openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>, Richard Purdie
	 <richard.purdie@linuxfoundation.org>, Paul Barker <pbarker@konsulko.com>
Date: Sun, 17 Jan 2021 15:30:18 +0100
In-Reply-To: <165B0B23C63810C7.10240@lists.openembedded.org>
References: <165B0B23C63810C7.10240@lists.openembedded.org>
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

please note the bitbake part sent separately to bitbake-devel@

https://lists.openembedded.org/g/bitbake-devel/message/11907

Thanks

Anatol

On Sun, 2021-01-17 at 15:25 +0100, Anatol Belski wrote:
> From: Sinan Kaya <okaya@kernel.org>
>=20
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
> ---
> =C2=A0scripts/runqemu | 8 +++++---
> =C2=A01 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/scripts/runqemu b/scripts/runqemu
> index e5e66f3453..dd92a64553 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -94,11 +94,13 @@ Examples:
> =C2=A0=C2=A0 runqemu qemux86-64 core-image-sato ext4
> =C2=A0=C2=A0 runqemu qemux86-64 wic-image-minimal wic
> =C2=A0=C2=A0 runqemu path/to/bzImage-qemux86.bin path/to/nfsrootdir/ ser=
ial
> -=C2=A0 runqemu qemux86
> iso/hddimg/wic.vmdk/wic.qcow2/wic.vdi/ramfs/cpio.gz...
> +=C2=A0 runqemu qemux86
> iso/hddimg/wic.vmdk/wic.vhd/wic.vhdx/wic.qcow2/wic.vdi/ramfs/cpio.gz.
> ..
> =C2=A0=C2=A0 runqemu qemux86 qemuparams=3D"-m 256"
> =C2=A0=C2=A0 runqemu qemux86 bootparams=3D"psplash=3Dfalse"
> =C2=A0=C2=A0 runqemu path/to/<image>-<machine>.wic
> =C2=A0=C2=A0 runqemu path/to/<image>-<machine>.wic.vmdk
> +=C2=A0 runqemu path/to/<image>-<machine>.wic.vhdx
> +=C2=A0 runqemu path/to/<image>-<machine>.wic.vhd
> =C2=A0""")
> =C2=A0
> =C2=A0def check_tun():
> @@ -179,7 +181,7 @@ class BaseConfig(object):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.portlocks =3D {}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.bitbake_e =3D ''
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.snapshot =3D False
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.wictypes =3D ('wic', 'w=
ic.vmdk', 'wic.qcow2', 'wic.vdi')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.wictypes =3D ('wic', 'w=
ic.vmdk', 'wic.qcow2', 'wic.vdi',
> "wic.vhd", "wic.vhdx")
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.fstypes =3D ('ext2=
', 'ext3', 'ext4', 'jffs2', 'nfs',
> 'btrfs',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '=
cpio.gz', 'cpio', 'ramfs', 'tar.bz2',
> 'tar.gz')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.vmtypes =3D ('hddi=
mg', 'iso')
> @@ -1203,7 +1205,7 @@ class BaseConfig(object):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if 'wic.' in self.fstyp=
e:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 self.fstype =3D self.fstype[4:]
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rootfs_format =3D self.fstyp=
e if self.fstype in ('vmdk',
> 'qcow2', 'vdi') else 'raw'
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rootfs_format =3D self.fstyp=
e if self.fstype in ('vmdk',
> 'vhd', 'vhdx', 'qcow2', 'vdi') else 'raw'
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qb_rootfs_opt =3D self.=
get('QB_ROOTFS_OPT')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if qb_rootfs_opt:
>=20
>=20
>=20


