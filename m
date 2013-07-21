Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id A205F606AC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2013 16:12:02 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kl13so115328pab.34
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2013 09:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=FlVTNFgR1+cO8j9rlo+kMxmLwpec8U9zu+8pesstIX0=;
	b=CgIh/TmdTpCePcsHm/bVQkYaw29H8rNCkF6jvFa8lnBW1pyGY8yo9jUixVi4q8MLWn
	aFxB4/TRZXdUyUjLJxE+iUK6fFLGjUPCqp7me8SDsByHKszk+CZGI4XwebAPqoDgn3Cj
	23Opa0lELT+lKuAUrmzQ5rMRd1IXUpQzzyNCZjUixEjHUdsHrXMyW0Syq4Gujc9Owntf
	ZCLew5aNTsfan3VyyunK5aaZp6C7MfxTTa9GXYmq5DRJitHN357dxRrhFmZFtD9SY/S2
	dpBZRxb4wypkCYicJfoHnCyNIyYFFqPAld+bUqxJyW+SovxNbehdJ0SFSgCtG+L2g6YV
	NsiA==
X-Received: by 10.66.190.101 with SMTP id gp5mr27341532pac.19.1374423122977;
	Sun, 21 Jul 2013 09:12:02 -0700 (PDT)
Received: from ddeviny-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id eg3sm34275611pac.1.2013.07.21.09.12.01
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 21 Jul 2013 09:12:02 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1374401262-6077-1-git-send-email-net147@gmail.com>
Date: Sun, 21 Jul 2013 09:12:01 -0700
Message-Id: <23B07C65-4D10-4A79-9139-6AAB23D34491@gmail.com>
References: <1374401262-6077-1-git-send-email-net147@gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc-4.8: fix compiling GCC when /usr/lib/libstdc++.so is present
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
X-List-Received-Date: Sun, 21 Jul 2013 16:12:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 21, 2013, at 3:07 AM, Jonathan Liu <net147@gmail.com> wrote:

> libtool is picking up libstdc++.so from /usr/lib when trying to link
> libasan due to libstdc++.la containing libdir=3D"/usr/lib". If =
compiling

Can you also see if this change works on target and SDK environments ?

> for x86 and the host has 64-bit /usr/lib/libstdc++.so, the compilation
> fails linking libasan with:
> /usr/lib/libstdc++.so: could not read symbols: File in wrong format
>=20
> To resolve this, patch libtool to look for the library in the path the
> .la is contained in rather than use the libdir which usually points to
> a host path.
>=20
> [YOCTO #4879]
>=20
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
> meta/recipes-devtools/gcc/gcc-4.8.inc                 |  1 +
> .../gcc/gcc-4.8/0041-libtool-avoid-libdir.patch       | 19 =
+++++++++++++++++++
> 2 files changed, 20 insertions(+)
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.8/0041-libtool-avoid-libdir.patch
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc =
b/meta/recipes-devtools/gcc/gcc-4.8.inc
> index dafa241..42355f2 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.8.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
> @@ -70,6 +70,7 @@ SRC_URI =3D =
"${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
> 	   file://0038-gcc-4.8-build-args.patch \
> 	   file://0039-gcc-4.8-PR57717.patch \
> 	   file://0040-fix-g++-sysroot.patch \
> +	   file://0041-libtool-avoid-libdir.patch \
> 	  "
> SRC_URI[md5sum] =3D "3b2386c114cd74185aa3754b58a79304"
> SRC_URI[sha256sum] =3D =
"545b44be3ad9f2c4e90e6880f5c9d4f0a8f0e5f67e1ffb0d45da9fa01bb05813"
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.8/0041-libtool-avoid-libdir.patch =
b/meta/recipes-devtools/gcc/gcc-4.8/0041-libtool-avoid-libdir.patch
> new file mode 100644
> index 0000000..2dd9610
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-4.8/0041-libtool-avoid-libdir.patch
> @@ -0,0 +1,19 @@
> +Avoid using libdir from .la which usually points to a host path
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +Signed-off-by: Jonathan Liu <net147@gmail.com>
> +
> +diff --git a/ltmain.sh b/ltmain.sh
> +index a03433f..1902a90 100644
> +--- a/ltmain.sh
> ++++ b/ltmain.sh
> +@@ -5628,6 +5628,9 @@ func_mode_link ()
> + 	    absdir=3D"$abs_ladir"
> + 	    libdir=3D"$abs_ladir"
> + 	  else
> ++	    # Instead of using libdir from .la which usually points to a =
host path,
> ++	    # use the path the .la is contained in.
> ++	    libdir=3D"$abs_ladir"
> + 	    dir=3D"$libdir"
> + 	    absdir=3D"$libdir"
> + 	  fi
> --=20
> 1.8.3.2
>=20


