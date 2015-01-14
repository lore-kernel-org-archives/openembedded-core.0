Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 62CB871634
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 17:24:47 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id r10so10879808pdi.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 09:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=6CBR5GPcZI/WMSHZYXxipThdwCL/+/2rIJfOqv+Nfb0=;
	b=iqcCcVyicCItQLPV1N571ab4GnuUBJKj0HiBu/ssJ3R2aIqtCDzA4xzMPiVJQIVdOV
	XRfxp0urolp623WA3++Nz++0Az8hgu5+ebZAuW6AXDpLnQeaHrue5xDuTaUtyDdANeRS
	fdUFjcBlozM6GdQL8jlrZ1ZQ3fRkzYUbY8+eXTB0m8AEEZq3itzIESvJqsKxsAVcDLwT
	PcPDCCtfYrmsuWkQNOIsFtN+i67dBt3YUtFWYilN6AXIyflIVk+S7GTQ1murl/xdhQDC
	gPDULJ3p1pbdUDP71klN2ql1YI18h4epSWUaGvyy1dTJum1oIY6BVeBZoyVUpOtItUQZ
	Ebog==
X-Received: by 10.68.69.80 with SMTP id c16mr7216799pbu.125.1421256288022;
	Wed, 14 Jan 2015 09:24:48 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:edb3:1e58:19af:ddb9?
	([2601:9:3580:84c:edb3:1e58:19af:ddb9])
	by mx.google.com with ESMTPSA id
	gi3sm20154668pbc.83.2015.01.14.09.24.46
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 14 Jan 2015 09:24:47 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1421235149-13079-1-git-send-email-koen.kooi@linaro.org>
Date: Wed, 14 Jan 2015 09:24:46 -0800
Message-Id: <D4B5A5D3-8D56-4ACA-AEE0-9FD7931D9780@gmail.com>
References: <1421235149-13079-1-git-send-email-koen.kooi@linaro.org>
To: Koen Kooi <koen.kooi@linaro.org>
X-Mailer: Apple Mail (2.1993)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libgpg-error 1.17: simplify tupple handling and add armv8b support
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
X-List-Received-Date: Wed, 14 Jan 2015 17:24:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Jan 14, 2015, at 3:32 AM, Koen Kooi <koen.kooi@linaro.org> wrote:
>=20
> Add a default option to the case statement and remove the duplicates. =
Also add support for armv8b architectures.
>=20
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
> meta/recipes-support/libgpg-error/libgpg-error_1.17.bb | 8 ++------
> 1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.17.bb =
b/meta/recipes-support/libgpg-error/libgpg-error_1.17.bb
> index c905bd1..843b9ae 100644
> --- a/meta/recipes-support/libgpg-error/libgpg-error_1.17.bb
> +++ b/meta/recipes-support/libgpg-error/libgpg-error_1.17.bb
> @@ -28,18 +28,14 @@ do_compile_prepend() {
> 	fi
>=20
> 	case ${TARGET_ARCH} in
> -	  aarch64)    TUPLE=3Daarch64-unknown-linux-gnu ;;
> +	  aarch64_be) TUPLE=3Daarch64-unknown-linux-gnu ;;
> 	  arm)	      TUPLE=3Darm-unknown-linux-gnueabi ;;

this can move to default case too.

> 	  armeb)      TUPLE=3Darm-unknown-linux-gnueabi ;;
> 	  i586)       TUPLE=3Di486-pc-linux-gnu ;;
> -	  mipsel)     TUPLE=3Dmipsel-unknown-linux-gnu ;;
> 	  mips64el)   TUPLE=3Dmipsel-unknown-linux-gnu ;;
> 	  mips64)     TUPLE=3Dmips-unknown-linux-gnu ;;
> -	  mips)       TUPLE=3Dmips-unknown-linux-gnu ;;
> -	  powerpc64)  TUPLE=3Dpowerpc64-unknown-linux-gnu ;;
> -	  powerpc)    TUPLE=3Dpowerpc-unknown-linux-gnu ;;
> -	  sh4)	      TUPLE=3Dsh4-unknown-linux-gnu ;;
> 	  x86_64)     TUPLE=3Dx86_64-pc-linux-gnu ;;

this as well.

> +	  *)          TUPLE=3D${TARGET_ARCH}-unknown-linux-gnu ;;=20
> 	esac
>=20
> 	cp ${S}/src/syscfg/lock-obj-pub.$TUPLE.h \
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


