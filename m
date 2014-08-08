Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id C4D7F609B2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 05:22:07 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hi2so408380wib.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Aug 2014 22:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=6mpJxzwG83cZZeBYVH9zHH9Dc+RtKG9HRcIEEqpLNdc=;
	b=XjWyM2DU1fnVbIRD2FxOJEuQCdCFQlRnXzTfkJlqkqCiJ0ZnVwe9VjCSpgD1rKu4HY
	/YY6TVdaWYSlR3pxnkltFSpv11DTiAv5igc4B3jbY5U8c0IX+9uMjZvn4hjXHl/XHDq7
	AvF9fL/D7JICBCoz/cOU2vXRHTqCpfGMZOULr0uQtxe4ThEjoqvLWXZEMqhn4NRPce+1
	7Yzq/0n68wDVvhlM/B0Fjw3t/XCwpJ1piizGv1/IbsZTtVEUqt7yZa8dvhm0rwAGyBfI
	d7ajqyEg5vMOVoj2bCJw4hQKmK0AJnMSsBjOjO8YWMw22wURaVZ6FbqgB4C3B0QsaZ/T
	acAw==
X-Gm-Message-State: ALoCoQly4y9Ctc6QGjr/CnSVYE//7tkmfVHZq8wc2GzraeN/9E9yxyRK/OP9ZHfVWiUZlvlIGssx
X-Received: by 10.194.95.66 with SMTP id di2mr22840737wjb.47.1407475328410;
	Thu, 07 Aug 2014 22:22:08 -0700 (PDT)
Received: from ?IPv6:2001:610:612::ac99:cd44:c629:56a6?
	([2001:610:612:0:ac99:cd44:c629:56a6])
	by mx.google.com with ESMTPSA id u3sm3502197wif.12.2014.08.07.22.22.06
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Aug 2014 22:22:07 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1407438629-13369-1-git-send-email-marex@denx.de>
Date: Fri, 8 Aug 2014 07:22:04 +0200
Message-Id: <3FD4F336-0653-4641-899F-DDD2AF178A20@dominion.thruhere.net>
References: <1407438629-13369-1-git-send-email-marex@denx.de>
To: Marek Vasut <marex@denx.de>
X-Mailer: Apple Mail (2.1878.6)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Yocto: Install full set of python modules in Qt SDK toolchain
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
X-List-Received-Date: Fri, 08 Aug 2014 05:22:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Since 'yocto' is a project like freedesktop.org your commit message =
doesn't make sense, it should be something like:

meta-toolchain-qt:  Install full set of python modules

Op 7 aug. 2014, om 21:10 heeft Marek Vasut <marex@denx.de> het volgende =
geschreven:

> The Qt SDK toolchain pulls in python via =
packagegroup-cross-canadian-${MACHINE}
> and ships it. But the python is missing many modules and is rather =
incomplete.
>=20
> The environment-setup-* script configures the PATH variable to point =
into
> it's own sysroot first, it means the python from the SDK is used as =
well
> when the environment is configured. It actually does make sense to use =
the
> python from the SDK, since the SDK should provide the tools needed to =
build
> additional software.
>=20
> The problem is, the python in the SDK image is stripped to a bare =
minimum
> of modules, which prevents some software from being built with the SDK =
as
> is. Add the same python modules as the buildtools-tarball.bb adds to =
make
> the python shipped with the SDK complete.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> meta/recipes-qt/meta/meta-toolchain-qt.inc | 32 =
+++++++++++++++++++++++++++++-
> 1 file changed, 31 insertions(+), 1 deletion(-)
>=20
> NOTE: This lets me build U-Boot git HEAD , which now has Kconfig in it
>      and that depends on the "subprocess" module. But instead of =
adding
>      just one module, I want to fix this properly and future-proof =
this.
>=20
> diff --git a/meta/recipes-qt/meta/meta-toolchain-qt.inc =
b/meta/recipes-qt/meta/meta-toolchain-qt.inc
> index 6b162bd..99d5e64 100644
> --- a/meta/recipes-qt/meta/meta-toolchain-qt.inc
> +++ b/meta/recipes-qt/meta/meta-toolchain-qt.inc
> @@ -1,4 +1,34 @@
> -TOOLCHAIN_HOST_TASK =3D =
"nativesdk-packagegroup-${QTNAME}-toolchain-host =
packagegroup-cross-canadian-${MACHINE}"
> +TOOLCHAIN_HOST_TASK =3D " \
> +	nativesdk-packagegroup-${QTNAME}-toolchain-host \
> +	packagegroup-cross-canadian-${MACHINE} \
> +	nativesdk-python-core \
> +	nativesdk-python-textutils \
> +	nativesdk-python-sqlite3 \
> +	nativesdk-python-pickle \
> +	nativesdk-python-logging \
> +	nativesdk-python-elementtree \
> +	nativesdk-python-curses \
> +	nativesdk-python-compile \
> +	nativesdk-python-compiler \
> +	nativesdk-python-fcntl \
> +	nativesdk-python-shell \
> +	nativesdk-python-misc \
> +	nativesdk-python-multiprocessing \
> +	nativesdk-python-subprocess \
> +	nativesdk-python-xmlrpc \
> +	nativesdk-python-netclient \
> +	nativesdk-python-netserver \
> +	nativesdk-python-distutils \
> +	nativesdk-python-unixadmin \
> +	nativesdk-python-compression \
> +	nativesdk-python-json \
> +	nativesdk-python-unittest \
> +	nativesdk-python-mmap \
> +	nativesdk-python-difflib \
> +	nativesdk-python-pprint \
> +	nativesdk-python-git \
> +	nativesdk-python-pkgutil \
> +	"
> TOOLCHAIN_TARGET_TASK =3D "packagegroup-${QTNAME}-toolchain-target"
> TOOLCHAIN_OUTPUTNAME =3D =
"${SDK_NAME}-toolchain-${QTNAME}-${DISTRO_VERSION}"
>=20
> --=20
> 2.0.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


