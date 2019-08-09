Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id AED0E7C5FC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2019 11:36:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 464jqw4kztz5p;
	Fri,  9 Aug 2019 13:36:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1565350588;
	bh=mEwPOkRTjjbj3XreTmzQ5m8e1PfOQ1WN/J2+sQCtdQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UZU9igb3Tri4jEjEi+JUFblA6O+i2iataF4iMt+89S6H8rDOb1T7f/f+3Y3gAcfOq
	BV0f0A9YKi7vZ/sx2IfTVmkV7VByoX0EUYaIybQD8jqK81aRdc3ORK7RUi+D2G5P6O
	FVyCzAcprKK7cO8SmnmceMHK/2d0WMv1UUo0qWGnXGC2ruaL5G+K80h2t6vMLLCKVi
	E4JwVAnvt49Q5Bmn4aalrSF8oc9jzeK7/V/062yGFjhwjwALUc+cqkJRbqbm5L+HVR
	3HdmDoYvJsTvG2RoNLjdSrMJiPqtWz0mOHoPtnX8bH9bAzMYQRngs0fjpuHUEOMo77
	z/GNRGohQiQr6u9M5AyFLoaz6ReBQRQC1Pr85tyNSsRmYkNNA4DCoCkjhlTcvS43bP
	xaJ9M67RVGfsRvy+pCealsqKVxwNHChr+xh7RemU0UBw0Z2HrTML6C+QQjWn1hrwhR
	sB3EjqG3pqlD/AB5fWxU4sUHEpP0zzCT5fcwlQFeBWCndiDXbN6NGRPIXtghqHaAfJ
	AKh11cuioaVIwJKnScg0/ZEkYvMkbYndLK3NaqnQ1+Hf4ZouoIBmCILXnUd0vttr5W
	CDyLzPXUrh1UfAdpScFkJ2AbeH5z87MC7vjSvidDTHkifQP9W+0gJSBoEFcwp205qY
	8Lx+Djc4CAtYatnIJwG5T/ak=
Date: Fri, 9 Aug 2019 14:36:22 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190809113622.GA13062@localhost>
References: <20190809111519.54789-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190809111519.54789-1-alex.kanavin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] gcc-cross-canadian: add missing runtime dependencies
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
X-List-Received-Date: Fri, 09 Aug 2019 11:36:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Aug 09, 2019 at 01:15:18PM +0200, Alexander Kanavin wrote:
> The recipe is special in that it does not auto-detect them
> at packaging step (via EXCLUDE_FROM_SHLIBS). With the recursive
> RDEPENDS qa check gone they need to be listed explicitly.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> index 807e47e0ee2..0e626172b5f 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> @@ -152,7 +152,8 @@ do_install () {
>  
>  ELFUTILS = "nativesdk-elfutils"
>  DEPENDS += "nativesdk-gmp nativesdk-mpfr nativesdk-libmpc ${ELFUTILS} nativesdk-zlib"
> -RDEPENDS_${PN} += "nativesdk-mpfr nativesdk-libmpc ${ELFUTILS}"
> +RDEPENDS_${PN} += "nativesdk-mpfr nativesdk-libmpc ${ELFUTILS} nativesdk-glibc nativesdk-libgcc nativesdk-libstdc++ nativesdk-zlib nativesdk-gmp"
> +RDEPENDS_${PN}_remove_sdkmingw32 = "nativesdk-glibc"
>...

These nativesdk-glibc dependencies look wrong for musl builds.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


