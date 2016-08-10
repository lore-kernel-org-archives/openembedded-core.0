Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C6CE4700F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 05:34:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7A5YPEH002594
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2016 22:34:25 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.25]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0248.002;
	Tue, 9 Aug 2016 22:34:24 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] cross-canadian.bbclass: Add
	BASECANADIANEXTRAOS	to specify main extraos
Thread-Index: AQHRMTdlNvC0bUmLDE2RuLT4f9KF76BDLMvw
Date: Wed, 10 Aug 2016 05:34:23 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA0131030FF5@ALA-MBA.corp.ad.wrs.com>
References: <1449524171-2835-1-git-send-email-mark.hatle@windriver.com>
In-Reply-To: <1449524171-2835-1-git-send-email-mark.hatle@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.143]
MIME-Version: 1.0
Subject: Re: [PATCH] cross-canadian.bbclass: Add BASECANADIANEXTRAOS	to specify main extraos
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
X-List-Received-Date: Wed, 10 Aug 2016 05:34:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping!

I don't see any objection on this but this is not merged yet, is it ignored=
?

Thanks,
Jackie

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-
> bounces@lists.openembedded.org] On Behalf Of Mark Hatle
> Sent: Tuesday, December 08, 2015 5:36 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] cross-canadian.bbclass: Add BASECANADIANEXTRAO=
S to specify main
> extraos
>=20
> By default the system will expand the extra os entries for uclibc and mus=
l
> even if they are not enabled in the build.  There was no way to prevent t=
his
> behavior while still getting the expansion for things like x32 or spe.
>=20
> The change adds a new setting which a distribution creator can override
> easily, setting the base set of canadianextraos components.  The other
> expansions are then based on this setting.
>=20
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/cross-canadian.bbclass | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-can=
adian.bbclass
> index ea17f09..799844b 100644
> --- a/meta/classes/cross-canadian.bbclass
> +++ b/meta/classes/cross-canadian.bbclass
> @@ -15,7 +15,8 @@ STAGING_BINDIR_TOOLCHAIN =3D
> "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${S
>  # Update BASE_PACKAGE_ARCH and PACKAGE_ARCHS
>  #
>  PACKAGE_ARCH =3D "${SDK_ARCH}-${SDKPKGSUFFIX}"
> -CANADIANEXTRAOS =3D "linux-uclibc linux-musl"
> +BASECANADIANEXTRAOS ?=3D "linux-uclibc linux-musl"
> +CANADIANEXTRAOS =3D "${BASECANADIANEXTRAOS}"
>  CANADIANEXTRAVENDOR =3D ""
>  MODIFYTOS ??=3D "1"
>  python () {
> @@ -34,8 +35,13 @@ python () {
>=20
>      tos =3D d.getVar("TARGET_OS", True)
>      whitelist =3D []
> +    extralibcs =3D [""]
> +    if "uclibc" in d.getVar("BASECANADIANEXTRAOS", True):
> +        extralibcs.append("uclibc")
> +    if "musl" in d.getVar("BASECANADIANEXTRAOS", True):
> +        extralibcs.append("musl")
>      for variant in ["", "spe", "x32", "eabi", "n32"]:
> -        for libc in ["", "uclibc", "musl"]:
> +        for libc in extralibcs:
>              entry =3D "linux"
>              if variant and libc:
>                  entry =3D entry + "-" + libc + variant
> @@ -59,14 +65,20 @@ python () {
>      if tarch =3D=3D "x86_64":
>          d.setVar("LIBCEXTENSION", "")
>          d.setVar("ABIEXTENSION", "")
> -        d.appendVar("CANADIANEXTRAOS", " linux-gnux32 linux-uclibcx32 li=
nux-muslx32")
> +        d.appendVar("CANADIANEXTRAOS", " linux-gnux32")
> +        for extraos in d.getVar("BASECANADIANEXTRAOS", True).split():
> +            d.appendVar("CANADIANEXTRAOS", " " + extraos + "x32")
>      elif tarch =3D=3D "powerpc":
>          # PowerPC can build "linux" and "linux-gnuspe"
>          d.setVar("LIBCEXTENSION", "")
>          d.setVar("ABIEXTENSION", "")
> -        d.appendVar("CANADIANEXTRAOS", " linux-gnuspe linux-uclibcspe li=
nux-muslspe")
> +        d.appendVar("CANADIANEXTRAOS", " linux-gnuspe")
> +        for extraos in d.getVar("BASECANADIANEXTRAOS", True).split():
> +            d.appendVar("CANADIANEXTRAOS", " " + extraos + "spe")
>      elif tarch =3D=3D "mips64":
> -        d.appendVar("CANADIANEXTRAOS", " linux-gnun32 linux-uclibcn32 li=
nux-musln32")
> +        d.appendVar("CANADIANEXTRAOS", " linux-gnun32")
> +        for extraos in d.getVar("BASECANADIANEXTRAOS", True).split():
> +            d.appendVar("CANADIANEXTRAOS", " " + extraos + "n32")
>      if tarch =3D=3D "arm" or tarch =3D=3D "armeb":
>          d.setVar("TARGET_OS", "linux-gnueabi")
>      else:
> --
> 1.9.3
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

