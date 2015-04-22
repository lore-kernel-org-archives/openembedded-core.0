Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id DFEE96E268
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 01:32:39 +0000 (UTC)
Received: by pdbqd1 with SMTP id qd1so258921227pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 18:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=phLF0dKGl+c1eoqPOHeUk5mmNf/BVMUs9n3PoUa58Lw=;
	b=lhxgq4BWKavjGd1QLr2jS482e0btg30dmi2jUiRHjSihRkGMqigyh7RJ0Pd6rRJ8h2
	d5q9LB8nInYGqgHBLcK87hoTBDyqCypjGZqaMuIgQdEvkYfSV6Fk7/scN/r1yBUO/948
	V8pyD+4/VAcmJTc9anKHqmb6bv/sZwlqhg/uO685gD3aYXnU34LYOaZ998FZ40wWG/aZ
	SETqFD48/NqRRoQypry4YMTGvhCYB3BmChQo3iin60VzjJIrvX9HGRTnPB78dDKIxBnB
	7tDN0p9ibs6M76hWjp670389CkKZ0ZKSsP0oar4rsbH05S7MT/lFdSWn2EaEpgJL/4zf
	Dgew==
X-Received: by 10.70.27.196 with SMTP id v4mr42156238pdg.122.1429666360420;
	Tue, 21 Apr 2015 18:32:40 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:d437:6da1:248:2a1a?
	([2601:9:3580:84c:d437:6da1:248:2a1a])
	by mx.google.com with ESMTPSA id vh2sm3213657pbc.49.2015.04.21.18.32.39
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 21 Apr 2015 18:32:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <2014020bb14ab84e8d6d50a83c1de4e0d559dac9.1429517108.git.liezhi.yang@windriver.com>
Date: Tue, 21 Apr 2015 18:32:38 -0700
Message-Id: <21CFB078-5E3A-420E-8058-1901F23F5482@gmail.com>
References: <cover.1429517108.git.liezhi.yang@windriver.com>
	<2014020bb14ab84e8d6d50a83c1de4e0d559dac9.1429517108.git.liezhi.yang@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] libunwind: use gold for all archs
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
X-List-Received-Date: Wed, 22 Apr 2015 01:32:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Apr 20, 2015, at 1:05 AM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>=20
> At least the following boards have build errors without using gold:
> qemux86, qemux86-64, qemuarm, qemuaarch64, qemuppc.
>=20
> The error is:
> ld: copy reloc against protected `_Uaarch64_local_addr_space' is =
invalid
> ld: failed to set dynamic section sizes: Bad value
> ld: copy reloc against protected `_Uaarch64_local_addr_space' is =
invalid
> ld: failed to set dynamic section sizes: Bad value
> | collect2: error: ld returned 1 exit status
>=20
> So use gold for all archs to fix the problem.

Please test it with gold on mips, before we apply this patch

>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
> meta/recipes-support/libunwind/libunwind.inc |    5 +----
> 1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-support/libunwind/libunwind.inc =
b/meta/recipes-support/libunwind/libunwind.inc
> index 56905c2..c4a7b5e 100644
> --- a/meta/recipes-support/libunwind/libunwind.inc
> +++ b/meta/recipes-support/libunwind/libunwind.inc
> @@ -23,10 +23,7 @@ LIBATOMICS_armv5 =3D "-latomic_ops"
> LIBATOMICS_armv4 =3D "-latomic_ops"
> LIBATOMICS ?=3D ""
>=20
> -LDFLAGS_append_x86 =3D " -fuse-ld=3Dgold"
> -LDFLAGS_append_x86-64 =3D " -fuse-ld=3Dgold"
> -
> -LDFLAGS_append_aarch64 =3D " -fuse-ld=3Dgold"
> +LDFLAGS_append =3D " -fuse-ld=3Dgold"
>=20
> DEPENDS +=3D "${DEPLIBATOMICS}"
> DEPLIBATOMICS_armv5 =3D "libatomics-ops"
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


