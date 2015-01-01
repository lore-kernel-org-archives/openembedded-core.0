Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id EB590601F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jan 2015 01:31:25 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id g10so21711355pdj.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Dec 2014 17:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Maz9IXn/N1Y/lHb6ya/TLwe7fXE7HoDywPvmzc7Toq8=;
	b=NUpeyzBS4tz7zdOsH+d7+iXctae7wxZB/9Q4maOX+6qm15DNMoVHS2z+/9u+MT794R
	i9kcYGRC20CfIl2bdnEz7Y3Iv5QjgICrrx4bsTOPKdP+nD1chxahh7QRZ8anB/4T2bJI
	qsQPy0YsSlUrjQ2nMOiWyEOlgSXzcGMInWu0T0Mv9YOlOgPbG2q3ITKKyXGzP04xf4g7
	RYT3C5KkonkS6RQrwSysBQENoJPj/jb+rcRDMONwwfPpqmyuhkoKWnq56qhyOFmpylaT
	X2YNBdaFFiQbgdXVd0qVjRZP1b+zM6Kik0u801a7F7kTSRe8/wv2ZmeZg8jkSttQ65t2
	aNUw==
X-Received: by 10.70.15.68 with SMTP id v4mr109029014pdc.21.1420075886584;
	Wed, 31 Dec 2014 17:31:26 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:91e4:f8f7:9c14:a30c?
	([2601:9:3580:84c:91e4:f8f7:9c14:a30c])
	by mx.google.com with ESMTPSA id
	sx4sm42327498pbc.36.2014.12.31.17.31.25
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 31 Dec 2014 17:31:26 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5bf74cfd004ffdc09d42a0c0bb3cf4881e0fc634.1418885577.git.kai.kang@windriver.com>
Date: Wed, 31 Dec 2014 17:31:25 -0800
Message-Id: <57E603C2-04B8-44A7-961D-708A8975173F@gmail.com>
References: <cover.1418885577.git.kai.kang@windriver.com>
	<5bf74cfd004ffdc09d42a0c0bb3cf4881e0fc634.1418885577.git.kai.kang@windriver.com>
To: Kai Kang <kai.kang@windriver.com>
X-Mailer: Apple Mail (2.1993)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/19] linux-yocto: depend on libgcc for aarch64
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
X-List-Received-Date: Thu, 01 Jan 2015 01:31:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Dec 18, 2014, at 12:50 AM, Kai Kang <kai.kang@windriver.com> wrote:
>=20
> Make aarch aarch64 kernel depend on libgcc.
>=20
> In arch/arm64/Makefile, it adds LIBGCC to libs-y:
>=20
> LIBGCC          :=3D $(shell $(CC) $(KBUILD_CFLAGS) =
-print-libgcc-file-name)
> libs-y          +=3D $(LIBGCC)

is this a stop-gap or final solution for aarch64 ?
how do we expect it to work with clang/llvm. someone at Linaro must know

>=20
> In file Makefile in top directory, libs-y is assigned to to var
> KBUILD_VMLINUX_MAIN. It uses script link-vmlinux.sh to link vmlinux.o,
> and when execute function vmlinux_link() in link-vmlinux.sh,
> KBUILD_VMLINUX_MAIN is passed to ${LD}.
>=20
> If build without libgcc, the value of LIBGCC is just libgcc.a without
> parent directory. linux-yocto fails to build:
>=20
> |   LD      vmlinux.o
> | aarch64-poky-linux-ld.bfd: cannot find libgcc.a: No such file or =
directory
>=20
> Add libgcc to aarch64 kernel dependency.
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
> meta/recipes-kernel/linux/linux-yocto.inc | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc =
b/meta/recipes-kernel/linux/linux-yocto.inc
> index 4ed3188..9018985 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> INC_PR =3D "r4"
>=20
> DEPENDS +=3D "xz-native bc-native"
> +DEPENDS_append_aarch64 =3D " libgcc=E2=80=9D

this should be added in kernel bbclass, since I assume it will be needed =
for all kind of variants
supporting aarch64 in addition to linux-yocto=

