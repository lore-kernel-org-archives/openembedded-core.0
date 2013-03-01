Received: from mail-pa0-f53.google.com ([209.85.220.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UBSL0-00088h-Lr
	for Openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 16:57:44 +0100
Received: by mail-pa0-f53.google.com with SMTP id bg4so1877284pad.12
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2013 07:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:references:mime-version:in-reply-to:content-type
	:content-transfer-encoding:message-id:cc:x-mailer:from:subject:date
	:to; bh=9XRuSs7yV31sB9T6SaWaNOJfg83+63PGc3JP1hmez2E=;
	b=URx0fg+S6VsxdNaDZW1K8e5uCpf5BQUM2BArKumSbAb5oNEbvmWNurn5sRkv9fabv1
	3N/NxdHm1D52oMMFc+vqqMoSTIjkt5kCDCmw5nSojvSoNuI1a+Mc8U8aXl/Mn12HUPlm
	l0AoAk7XzhrO3iIpf6mU07FgOLVAeyQIlCzwASocHrDEdq3YoJUILj6c99ugI2H++jQQ
	xIb41mV51/nW7vr36k58d+sOfl2M7GAAKNjb0hZD2TF7njUM8zGfZSQfRfWRRGf9WECl
	EbuFS+3F6DMTgDFI79vcNrR4rrBxsYMxtIqm6MHcp1L79RaPIlafXNpwTbas83iFr6e1
	6AzA==
X-Received: by 10.68.251.167 with SMTP id zl7mr15119653pbc.116.1362152470386; 
	Fri, 01 Mar 2013 07:41:10 -0800 (PST)
Received: from [192.168.1.68] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id y9sm13484773paw.1.2013.03.01.07.41.08
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 01 Mar 2013 07:41:09 -0800 (PST)
References: <1362147965-42559-1-git-send-email-jason.wessel@windriver.com>
Mime-Version: 1.0 (1.0)
In-Reply-To: <1362147965-42559-1-git-send-email-jason.wessel@windriver.com>
Message-Id: <63365A65-965A-48CE-888F-2D751A2991DE@gmail.com>
X-Mailer: iPad Mail (10B146)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Mar 2013 07:41:09 -0800
To: Jason Wessel <jason.wessel@windriver.com>
Cc: "<Openembedded-core@lists.openembedded.org>"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu.inc: Non deterministic compile of qemu
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Mar 2013 15:57:53 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 1, 2013, at 6:26 AM, Jason Wessel <jason.wessel@windriver.com> wrot=
e:

> When you using a qemuppc target and sstate you might end up with
> the problem:
>=20
> qemu-system-ppc: error while loading shared libraries:
>   libfdt.so.1: cannot open shared object file: No such file or directory
>=20
> The way you can force this to happen assuming you are using sstate is
> as follows:
>=20
> bitbake dtc-native
> bitbake -c cleansstate qemu-native
> bitbake qemu-native
> bitbake -c clean dtc-native
>=20
> Now go start qemu and it will fail.  The solution is to always build
> the dtc libraries since they are used and needed by the qemuppc
> simulator.


I am carrying a local fix for same reason

Acked-by: Khem Raj <raj.khem@gmail.com>
>=20
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
> meta/recipes-devtools/qemu/qemu.inc |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools=
/qemu/qemu.inc
> index 6c44b31..eb60d43 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -2,8 +2,8 @@ DESCRIPTION =3D "open source processor emulator"
> HOMEPAGE =3D "http://qemu.org"
> LICENSE =3D "GPLv2 & LGPLv2.1"
> DEPENDS =3D "glib-2.0 zlib alsa-lib virtual/libx11 pixman"
> -DEPENDS_class-native =3D "zlib-native alsa-lib-native glib-2.0-native p=
ixman-native"
> -DEPENDS_class-nativesdk =3D "nativesdk-zlib nativesdk-libsdl nativesdk-=
glib-2.0 nativesdk-pixman"
> +DEPENDS_class-native =3D "zlib-native alsa-lib-native glib-2.0-native p=
ixman-native dtc-native"
> +DEPENDS_class-nativesdk =3D "nativesdk-zlib nativesdk-libsdl nativesdk-=
glib-2.0 nativesdk-pixman nativesdk-dtc"
> RDEPENDS_${PN}_class-nativesdk =3D "nativesdk-libsdl"
>=20
> require qemu-targets.inc
> --=20
> 1.7.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


