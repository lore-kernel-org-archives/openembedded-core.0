Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id C797672376
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 15:39:10 +0000 (UTC)
Received: by wiun10 with SMTP id n10so27292113wiu.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 May 2015 08:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=iMoUvKTKVIWez7KvRilGzlSF4e9I2FBJfz6MPskEhVg=;
	b=vFUetaIPKmfmYqx+WoGnB00fTjKFpGNC6Xb3QINJCftSp5Vf6OGE22W8Y9+PfXvIJA
	ilNOz2JGfjFE6njDd8mnkYWALMZaigyFuoFv/iTz90JdHEOwsUU0mat6wIJeB2rrB5E/
	8hoPH4fzB6SvOxvN7yiwzH+QW5ynb9HyDBP7dDcA3SQZqvrQr/GYqhd8yBBuv9dTBFGC
	UaoWh9mvxMyvfdR+xkB5ufQWy8oz1stKFgWOqMQzYULTjy/tN6E9uS0MZZ6QGafgxz8y
	55xZbUK/r62DXTKU1kliwutvtQjpzrZ3YiZXzOJdYDDcR1mzSB94pQGMMRxZi0A8o+IN
	6cbA==
X-Received: by 10.180.10.102 with SMTP id h6mr5862319wib.37.1430926750986;
	Wed, 06 May 2015 08:39:10 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id gs7sm2721282wib.10.2015.05.06.08.39.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 May 2015 08:39:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 6 May 2015 17:39:33 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20150506153933.GC2067@jama>
References: <1430502462-26698-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1430502462-26698-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [dizzy][PATCH] mesa: update --with-llvm-shared-libs configure option
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
X-List-Received-Date: Wed, 06 May 2015 15:39:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2015 at 07:47:42PM +0200, Martin Jansa wrote:
> From: Andre McCurdy <armccurdy@gmail.com>
>=20
> As per the Mesa 10.2 release notes, "--with-llvm-shared-libs"
> has been renamed to "--enable-llvm-shared-libs".
>=20
>   http://www.mesa3d.org/relnotes/10.2.html

Be aware that this correctly enables gallium-llvm, but then
gbm_gallium_drm can fail to find LLVM libs:

ld: cannot find -lLLVMMCJIT
| collect2: error: ld returned 1 exit status
| make[3]: *** [gbm_gallium_drm.la] Error 1

at least in some configurations, I'm looking what's the difference in
builds I'm seeing failing.

>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 1857f3c..658bd3a 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -62,7 +62,7 @@ PACKAGECONFIG[gallium]      =3D "--with-gallium-drivers=
=3D${GALLIUMDRIVERS}, --witho
>  PACKAGECONFIG[gallium-egl]  =3D "--enable-gallium-egl, --disable-gallium=
-egl"
>  PACKAGECONFIG[gallium-gbm]  =3D "--enable-gallium-gbm, --disable-gallium=
-gbm"
>  MESA_LLVM_RELEASE ?=3D "3.3"
> -PACKAGECONFIG[gallium-llvm] =3D "--enable-gallium-llvm --with-llvm-share=
d-libs, --disable-gallium-llvm, llvm${MESA_LLVM_RELEASE} \
> +PACKAGECONFIG[gallium-llvm] =3D "--enable-gallium-llvm --enable-llvm-sha=
red-libs, --disable-gallium-llvm, llvm${MESA_LLVM_RELEASE} \
>                                 ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_=
ENABLED} else ''}"
>  export WANT_LLVM_RELEASE =3D "${MESA_LLVM_RELEASE}"
> =20
> --=20
> 2.3.5
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

