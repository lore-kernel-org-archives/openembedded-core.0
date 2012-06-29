Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Skb0d-0006EC-Ls
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 15:13:15 +0200
Received: by qcad10 with SMTP id d10so699012qca.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 06:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=6DaBJw24+469XBNT7pcUb7w6b3CIsK1Xk3C1A7N03kE=;
	b=iQQwVguBA/v3uPV023vzb/k039phVAUNah/BB90iQQFR5Dsc/oBGGRwYI/gqJzUpjE
	9mKJcZUPk92ss7i5rCbJQQob+7DBysduYpzkcbUZy0DTbyVaGRv9eGPbYXRDRIVHw61u
	KyGKactp5/i8N+jfqYiuKsDegrl1Ou8NCyScX3FU86Wwg1w8fhVFPKpIyFosB7xL4hx+
	+9R1nUY3pnSyWlPruAkAKeBnQ2tbhPlX1PmMTQspqvvkYcyQNF+R8sYS0okXAj65ppDe
	W8fKcyeBo8Z/QcPvGQtoBb/FWyCEnX3TBJE2+fT1YBxs5lQn1BFLuCmLzKf+BqSTPjIM
	s1wA==
MIME-Version: 1.0
Received: by 10.229.137.84 with SMTP id v20mr652669qct.36.1340974939462; Fri,
	29 Jun 2012 06:02:19 -0700 (PDT)
Received: by 10.229.41.5 with HTTP; Fri, 29 Jun 2012 06:02:19 -0700 (PDT)
In-Reply-To: <4263ffefaa6f3b0069bc41c0f7578d36717edcfc.1340942930.git.dvhart@linux.intel.com>
References: <cover.1340942930.git.dvhart@linux.intel.com>
	<4263ffefaa6f3b0069bc41c0f7578d36717edcfc.1340942930.git.dvhart@linux.intel.com>
Date: Fri, 29 Jun 2012 09:02:19 -0400
Message-ID: <CADkTA4MUhn4nUEkUdxG_TkV6qg8VHorhoPjYpeFOqAPrxEr4=A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 1/4] linux-libc-headers-yocto: Do not include linux-yocto
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jun 2012 13:13:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 29, 2012 at 12:17 AM, Darren Hart <dvhart@linux.intel.com> wrot=
e:
> The only bit we seem to need from the linux-yocto include is the
> SRCREV_FORMAT. If we define this explicitly, we can avoid including the
> linux-yocto include.
>
> This is desirable so that linux-yocto can require kernel and simplify
> the PR update process of all the linux-yocto* recipes. Pulling in
> kernel to the linux-libc-headers-yocto recipes causes build failures by
> pulling in "update-modules-nativesdk".

I'm familiar with this particular issue .. and I've tried to fix it
myself (I have
something that does largely work with both kernel and kernel yocto
included), but I didn't know you were looking into this, so I'll toss
that out :)

There's something missing with this change, that I had restored the ability
to patch and modify the tree, but I'll bolt that on later when I fix up tho=
se
nativesdk parts.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> CC: Bruce Ashfield <bruce.ashfield@windriver.com>
> CC: Tom Zanussi <tom.zanussi@intel.com>
> ---
> =A0.../linux-libc-headers/linux-libc-headers-yocto_git.bb =A0 =A0 =A0 =A0=
 =A0 =A0 =A0| =A0 =A03 ++-
> =A01 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-yocto/recipes-kernel/linux-libc-headers/linux-libc-head=
ers-yocto_git.bb b/meta-yocto/recipes-kernel/linux-libc-headers/linux-libc-=
headers-yocto_git.bb
> index b4222f1..8ab4fb1 100644
> --- a/meta-yocto/recipes-kernel/linux-libc-headers/linux-libc-headers-yoc=
to_git.bb
> +++ b/meta-yocto/recipes-kernel/linux-libc-headers/linux-libc-headers-yoc=
to_git.bb
> @@ -1,5 +1,4 @@
> =A0require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> -include recipes-kernel/linux/linux-yocto.inc
>
> =A0B =3D "${S}"
>
> @@ -13,6 +12,8 @@ SRCREV =3D "a1cdb60720c452c3965eaec3ec2cd10f06261cc5"
> =A0PV =3D "3.4+git-${SRCPV}"
> =A0PR =3D "r6"
>
> +SRCREV_FORMAT ?=3D "meta_machine"
> +
> =A0SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=
=3Dgit;nocheckout=3D1;branch=3D${KBRANCH},meta;name=3Dmachine,meta"
>
> =A0# force this to empty to prevent installation failures, we aren't
> --
> 1.7.10.2
>
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


