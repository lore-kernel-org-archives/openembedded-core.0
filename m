Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6ECD171AC9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 18:07:59 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id z45so9316458wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jul 2017 11:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fLHG3Zh0NT6Dxl3P9O7aFRRsqCl9x1iylHk8gICar/4=;
	b=mgDU6H2wDvUE2vXZO9/NgRZDpZOu+g8hDmVYAHeDrrF3faSe2W5Bb5vno+gkhLqO17
	l9o0emqykkODJnGU/HJwo1Zeptib5bRXx+cEr2SVrEfV8zJwdchT694DzVdNerEh6oEN
	Z4jrVJ4612kbwGZ7LGpL0qlabjO53jYvIpPInT/h9IDRTcdUZRqdP3+/+b//wJipPuP/
	8tkJuSHRb5k6Fd8RWHbg7moMlA2larCtSVT7yXw7TEfYGbHIroydV4xVw8FyqlLhngct
	MOFc9xTpK+TU6WKLOjPCs1OfPX62XTaJlozmhWjIk+b7WJRgdaQnVP2MGqf3EzZ56vh9
	TagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fLHG3Zh0NT6Dxl3P9O7aFRRsqCl9x1iylHk8gICar/4=;
	b=Ju5E0M7QLCL4nTCiZGnhiD96WnhbdgXEnkHh+r4n2otLWBRiGQQWmnjEvnl27I5lBz
	/iRqxAYuT1v8lUxUv1gARcPg8ifJSxdkqwjEIyNt40lYuBh/54ygSL2yat/pe8mizRb7
	SlJ0B8BmfkUUueFRBBWHeKjj3gj3AsbSSzCV998TTpcAXGWtLYnMkUeXIxI0FPzyNOGy
	D64XaA8VcnN2DxOghUI8ctLwQ+1VgqJfcFlwWJ5nJYiLIz5EJtr5O477Ep3zyMSUVzG9
	mRnafGd8eSSOJCLE57qUa3EnJThugfO2TRbisFh54sVLnx6FZpc0Qrkb7PaoXcT2/jSu
	luuQ==
X-Gm-Message-State: AIVw1134qLMeTFXfWLDMrrTYGaaQ8dau0JsVh2jmAee9sd/AF/AEa3D2
	GPwxN4We01jIkQ9593SRsYh5I0vMpQ==
X-Received: by 10.80.162.38 with SMTP id 35mr3023676edl.99.1499450879981; Fri,
	07 Jul 2017 11:07:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.165.198 with HTTP; Fri, 7 Jul 2017 11:07:29 -0700 (PDT)
In-Reply-To: <20170707153119.26162-1-alexandru.vasiu@ni.com>
References: <20170707153119.26162-1-alexandru.vasiu@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Jul 2017 11:07:29 -0700
Message-ID: <CAMKF1spupaXgfeY1qSV_crNuagjj=DmHBsDA_cvrq6qqiUyt5Q@mail.gmail.com>
To: Alexandru Vasiu <alexandru.vasiu@ni.com>
Cc: will.page@ni.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dkms: Add new recipe for supporting dkms
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
X-List-Received-Date: Fri, 07 Jul 2017 18:08:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 7, 2017 at 8:31 AM, Alexandru Vasiu <alexandru.vasiu@ni.com> wr=
ote:
> Dkms is a tool used to compile out of tree modules directly on
> target devices (sometimes you have sources or binaries which
> need to be compiled directly on target, outside OE).
> I used a simple module and a dkms config to test it, and dkms
> compiled and installed the module on target.
>
> For example:
> .
> =E2=94=9C=E2=94=80=E2=94=80 dkms.conf
> =E2=94=94=E2=94=80=E2=94=80 src
>     =E2=94=9C=E2=94=80=E2=94=80 hello.c
>     =E2=94=94=E2=94=80=E2=94=80 Makefile
>
> hello.c:
>         #include <linux/module.h>
>
>         int init_module(void)
>         {
>                 printk("Hello World!\n");
>                 return 0;
>         }
>
>         void cleanup_module(void)
>         {
>                 printk("Goodbye Cruel World!\n");
>         }
>
>         MODULE_LICENSE("GPL");
>
> Makefile:
>         obj-m +=3D hello.o
>
>         KERNELDIR ?=3D /lib/modules/$(shell uname -r)/build
>
>         PWD :=3D $(shell pwd)
>
>         install:
>                 $(MAKE) -C $(KERNELDIR) M=3D$(PWD) modules
>
>         clean:
>                 rm -rf *.o *.ko *~ core .depend .*.cmd *.mod.c modules.or=
der Module.symvers
>
> dkms.conf:
>         MAKE=3D"make -C src/ KERNELDIR=3D/lib/modules/${kernelver}/build"
>         CLEAN=3D"make -C src/ clean"
>         BUILT_MODULE_NAME=3Dhello
>         DEST_MODULE_LOCATION=3D/kernel/drivers/scsi
>         BUILT_MODULE_LOCATION=3Dsrc/
>         PACKAGE_NAME=3Dhello
>         PACKAGE_VERSION=3D0.1
>         AUTOINSTALL=3Dyes
>         REMAKE_INITRD=3Dyes
>
> All files should be in /usr/src/<package-name>-<package-version>,
> in our case in /urs/src/hello-0.1.
>
> Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
> ---
>  meta/recipes-kernel/dkms/dkms_2.4.0.bb | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 meta/recipes-kernel/dkms/dkms_2.4.0.bb
>
> diff --git a/meta/recipes-kernel/dkms/dkms_2.4.0.bb b/meta/recipes-kernel=
/dkms/dkms_2.4.0.bb
> new file mode 100644
> index 0000000000..4516546ab5
> --- /dev/null
> +++ b/meta/recipes-kernel/dkms/dkms_2.4.0.bb
> @@ -0,0 +1,12 @@
> +SUMMARY =3D "DKMS Recipe - Adds DKMS tool for target"
> +HOMEPAGE =3D "https://github.com/dell/dkms/"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3"
> +
> +SRC_URI =3D "https://github.com/dell/${PN}/archive/v${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "d2e74dd79086c564a924b5763794091b"
> +
> +RDEPENDS_${PN} +=3D "bash"
> +
> +inherit autotools-brokensep
> --

This recipe should also ensure that needed tools
to compile the modules are in its DEPENDS section
and end up in final image

> 2.13.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

