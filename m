Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web08.637.1619190759382111658
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 08:12:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4FRd7b1bb6z5tl9;
	Fri, 23 Apr 2021 17:12:27 +0200 (CEST)
Date: Fri, 23 Apr 2021 17:12:25 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Sourabh Banerjee <sbanerje@codeaurora.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Need suggestions: in case where linux-lib-headers and the kernel versions differ
Message-ID: <20210423151225.hsighf6xahntxlnb@qschulz>
References: <Gvtb.1619190188941654950.yc90@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <Gvtb.1619190188941654950.yc90@lists.openembedded.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sourabh,

On Fri, Apr 23, 2021 at 08:03:08AM -0700, Sourabh Banerjee wrote:
> Hi All,
> I need your suggestion on how to reconcile if the linux-libc-headers an=
d kernel versions are different?
> For this discussion let's consider we are using the LTS branch YP-3.1 (=
Dunfell).
> With Dunfell let's consider following 3 cases:
>=20
> 1) Machine is supported on 5.4 kernel
> *Kernel Recipe:* linux-yocto_5.4.bb
> *libc-headers:* meta/recipes-kernel/linux-libc-headers/linux-libc-heade=
rs_5.4.bb
> There is no conflict in this case as libc-headers and linux-yocto are o=
n same version.
>=20
> 2) Machine is supported on a higher kernel (let's say 5.10)
> *Kernel Recipe:* Let's assume provided by a BSP layer, linux_5.10.bb
> *libc-headers:* meta/recipes-kernel/linux-libc-headers/linux-libc-heade=
rs_5.4.bb
> The kernel version is higher in this case. But, should be okay as 5.10 =
UAPI is backward compatible and supports=A0 linux-libc-headers_5.4=A0comp=
letely.
>=20
> 3) Machine is supported on a lower kernel (let's say 4.19)
> Kernel Recipe: Let's assume provided by a BSP layer, linux_4.19.bb
> libc-headers: meta/recipes-kernel/linux-libc-headers/linux-libc-headers=
_5.4.bb
> The kernel version is lower in this case. I suppose, this may lead to s=
ome runtime issues? As the kernel built from 4.19 will not be able to sup=
port 5.4 UAPI fully.
> What's the recommendation here? Should the BSP provider port linux-libc=
-header_4.19.bb in BSP layer and set=A0PREFERRED_VERSION_linux-libc-heade=
rs =3D "4.19%"
>=20

The issue is that linux-libc-headers is not machine-specific, only
distro-specific, so you'd need this PREFERRED_VERSION_linux-libc-headers
specified in a distro (or local.conf for that matter, but... NO, please
NO :) ).

You could also technically provide your own linux-libc-headers in a
layer of a higher priority and then PREFERRED_VERSION_linux-libc-headers
won't matter as the highest prio layer's recipe will take precedence.
But that is IMO bad practice as it means your distro has a different
linux-libc-headers depending on whether a layer is included or not.

I don't have a solution personally, just wanted to share why the last
suggestion does not seem correct to me.

Cheers,
Quentin
