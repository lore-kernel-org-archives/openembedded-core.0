Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 12CB56E8EC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 17:26:26 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id b10so2448526eae.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 09:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=c42+BFsFE7s4v70XOcF+iItpTogMU/t2Xuqo1VvCb40=;
	b=fcxNWCPeqFwlDoIe3o+spE0gzHM9k3FGQsOw74AFrbEnBWCZFN3uweBQ1zPMlcTh0X
	ORcyBwCEykFaqySXk9gTfAOmkuza0hjS5bOYhKnmfzcGpv/9lIIpOCZo0BhXs2YCDrWU
	391t+XWQ7+5uSrWvIK4uL3Rmj6vUyTHi4VkNe0bdEwF+zwQ7rRmmzB/RW36GIceaXKut
	EJDccRpOU7wUPFshJwxCidX1kwRnvbEOLm5PQQhbXtpYCLnknOzDgFXjxXUQv1WwPO9I
	Axbzn7oD0n+jFdtdXKRfHRTWquXhmi68Ucu0d7KaTXphIDyQJDk58f0ByxSjBjYiSw0Q
	zGeg==
X-Received: by 10.14.204.9 with SMTP id g9mr5012421eeo.82.1391189187571;
	Fri, 31 Jan 2014 09:26:27 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	o43sm39107927eef.12.2014.01.31.09.26.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 09:26:25 -0800 (PST)
Date: Fri, 31 Jan 2014 18:26:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Holger Hans Peter Freyther <holger@moiji-mobile.com>
Message-ID: <20140131172633.GV3718@jama>
References: <1391161517-25628-1-git-send-email-holger@moiji-mobile.com>
MIME-Version: 1.0
In-Reply-To: <1391161517-25628-1-git-send-email-holger@moiji-mobile.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc: Include patch scheduled for GCC 4.8.3 to fix epilogue on ARM
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
X-List-Received-Date: Fri, 31 Jan 2014 17:26:28 -0000
X-Groupsio-MsgNum: 49734
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MTFjS3R2zZZVGaSB"
Content-Disposition: inline

--MTFjS3R2zZZVGaSB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2014 at 10:45:17AM +0100, Holger Hans Peter Freyther wrote:
> GCC 4.8.0, 4.8.1 and 4.8.2 can generate broken epilogues for the
> ABI used by the kernel. Apply the patch that is included for GCC
> 4.8.3 from http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D58854.
>=20
> The issue was found on Yocto/Dora and the patch should be backported
> to this branch. A kernel built with Dora's GCC 4.8.1 misbehaved on:
>=20
>  while true;
>  do
>     (for i in `seq 1 100`;
>         do
>             echo "Log message... $RANDOM";
>         done) | logger;
>  done
>=20
> busybox's syslogd would from time to read a huge negative value and
> then exit, strace would get stuck waiting on a syscall. After this
> patch it appears to work better.
>=20
> Signed-off-by: Holger Hans Peter Freyther <holger@moiji-mobile.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.8.inc              |  1 +
>  .../0048-PR58854_fix_arm_apcs_epilogue.patch       | 23 ++++++++++++++++=
++++++
>  2 files changed, 24 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0048-PR58854_fix_ar=
m_apcs_epilogue.patch
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtool=
s/gcc/gcc-4.8.inc
> index a140573..fdd0c12 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.8.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
> @@ -68,6 +68,7 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.=
bz2 \
>  	   file://0045-gcc-4.8-PR57717-PowerPC-E500v2.patch \
>  	   file://0046-libatomic-deptracking.patch \
>  	   file://0047-repomembug.patch \
> +	   file://0048-PR58854_fix_arm_apcs_epilogue.patch \

You're not the first in this file, but please don't mix tabs and spaces
for indentation.

>  	  "
>  SRC_URI[md5sum] =3D "a3d7d63b9cb6b6ea049469a0c4a43c9d"
>  SRC_URI[sha256sum] =3D "09dc2276c73424bbbfda1dbddc62bbbf900c9f185acf7f3e=
1d773ce2d7e3cdc8"
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0048-PR58854_fix_arm_apcs_=
epilogue.patch b/meta/recipes-devtools/gcc/gcc-4.8/0048-PR58854_fix_arm_apc=
s_epilogue.patch
> new file mode 100644
> index 0000000..0ef245a
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0048-PR58854_fix_arm_apcs_epilogu=
e.patch
> @@ -0,0 +1,23 @@
> +Backport fix for PR target/58854
> +
> +2013-11-11  Ramana Radhakrishnan  <ramana.radhakrishnan@arm.com>
> +
> +       Backported from mainline
> +        2013-10-30  Ramana Radhakrishnan  <ramana.radhakrishnan@arm.com>
> +
> +       PR target/58854
> +       * config/arm/arm.c (arm_expand_epilogue_apcs_frame): Emit blockage
> +
> +
> +Upstream-Status: Backport
> +
> +--- gcc-4_8-branch/gcc/config/arm/arm.c	2013/11/11 08:00:45	204664
> ++++ gcc-4_8-branch/gcc/config/arm/arm.c	2013/11/11 09:38:14	204665
> +@@ -23555,6 +23555,7 @@
> +   num_regs =3D bit_count (saved_regs_mask);
> +   if ((offsets->outgoing_args !=3D (1 + num_regs)) || cfun->calls_alloc=
a)
> +     {
> ++      emit_insn (gen_blockage ());
> +       /* Unwind the stack to just below the saved registers.  */
> +       emit_insn (gen_addsi3 (stack_pointer_rtx,
> +                              hard_frame_pointer_rtx,
> --=20
> 1.8.5.2
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MTFjS3R2zZZVGaSB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLr3MkACgkQN1Ujt2V2gBwc8ACeKwhVXZaN4IjF6FCVgirm8R1H
tWkAoLZ77pt/c3OWHWaCBpI2K1BKOZSt
=Fe+R
-----END PGP SIGNATURE-----

--MTFjS3R2zZZVGaSB--
