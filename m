Received: from smtp1.ingenico.com ([217.108.148.240])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Matthieu.CRAPET@ingenico.com>) id 1SukiB-00067Q-3v
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 15:36:11 +0200
X-IronPort-AV: E=Sophos;i="4.77,667,1336341600"; d="scan'208";a="13576304"
Received: from frsnprexc1.usr.ingenico.loc ([10.23.2.11])
	by antispam1.usr.ingenico.loc with ESMTP; 27 Jul 2012 15:24:41 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 27 Jul 2012 15:24:05 +0200
Message-ID: <D9D7124626ED1E43963D86B2657D5CCD03A6A552@FRSNPREXC1.usr.ingenico.loc>
In-Reply-To: <50117246.2030502@windriver.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [OE-core] SDK and external toolchain
Thread-Index: Ac1rTPhgZ6JxHrcDTd2qFsLydg3Z2wArNXCA
References: <D9D7124626ED1E43963D86B2657D5CCD03A69B7A@FRSNPREXC1.usr.ingenico.loc>
	<50117246.2030502@windriver.com>
From: "Matthieu CRAPET" <Matthieu.CRAPET@ingenico.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: SDK and external toolchain
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
X-List-Received-Date: Fri, 27 Jul 2012 13:36:11 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

@Mark

Still have the 3 errors. I added to my tcmode include file (without =
success):

PREFERRED_PROVIDER_eglibc =3D "external-linaro-toolchain"
PREFERRED_PROVIDER_binutils-cross =3D "external-linaro-toolchain"
PREFERRED_PROVIDER_gcc-cross =3D "external-linaro-toolchain"
# eglibc-locale
PREFERRED_PROVIDER_virtual/libc-locale =3D "external-linaro-toolchain"
# eglibc-nativesdk
PREFERRED_PROVIDER_virtual/libc-nativesdk =3D =
"external-linaro-toolchain"
PREFERRED_PROVIDER_virtual/libiconv-nativesdk =3D  =
"external-linaro-toolchain"

This is not so important now, as I patched toolchain-scripts.bbclass.

@Christopher

http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026659.h=
tml
Tried it, this is just fine here!

Thanks for your support guys.

Best regards,
Matthieu


-----Message d'origine-----
De=A0: openembedded-core-bounces@lists.openembedded.org =
[mailto:openembedded-core-bounces@lists.openembedded.org] De la part de =
Mark Hatle
Envoy=E9=A0: jeudi 26 juillet 2012 18:37
=C0=A0: openembedded-core@lists.openembedded.org
Objet=A0: Re: [OE-core] SDK and external toolchain

On 7/26/12 2:14 AM, Matthieu CRAPET wrote:
> Greetings,
>
> Updated recently my oe-core and faced an unwanted side effect.
> You need to know that I'm using an externel (linaro) toolchain (my=20
> .bb/.inc are a clone of "sourcery" toolchain example).
> My toolchain is compiled against a custom (external) eglibc 2.15.
>
> Since commit a0de2a56f19ae4d8cd88e46e96917a7a019fe1ab --
> image.bbclass: Add support to build the SDK in parallel with the image
> =
http://cgit.openembedded.org/openembedded-core/commit/?id=3Da0de2a56f19a
> e4
> d8cd88e46e96917a7a019fe1ab

I have run into similar failures.  Your are missing some items in the =
PROVIDES most likely, and as for the multiple providers the =
PREFERRED_PROVIDER is the right answer.

We list a preferred provider for:

linux-libc-headers, linux-libc-headers-dev, virtual/${TARGET_PREFIX}gcc, =
virtual/${TARGET_PREFIX}gcc-initial, =
virtual/${TARGET_PREFIX}gcc-intermediate,
virtual/${TARGET_PREFIX}g++, virtual/${TARGET_PREFIX}binutils, =
virtual/${TARGET_PREFIX}libc-for-gcc, =
virtual/${TARGET_PREFIX}compilerlibs,
libgcc, virtual/libc, virtual/libintl, virtual/libiconv, =
glibc-thread-db, virtual/linux-libc-headers, eglibc, binutils-cross, =
gcc-cross

(We have some more, but they are only useful when building an SDK with a =
custom import script...)

> my images generation are failing because it tries to compile eglib=20
> 2.16 and do_configure fails. I have also 3 errors:
> ERROR: Multiple .bb files are due to be built which each provide=20
> virtual/libc (.../meta/recipes-core/eglibc/eglibc_2.15.bb
> .../meta-ingenico/recipes/external-linaro-toolchain/external-linaro-to
> ol
> chain.bb).

virtual/libc is the item for the above

>   This usually means one provides something the other doesn't and =
should.
> ERROR: Multiple .bb files are due to be built which each provide=20
> virtual/arm-ingenico-linux-gnueabi-libc-for-gcc
> (.../meta/recipes-core/eglibc/eglibc_2.15.bb
> .../meta-ingenico/recipes/external-linaro-toolchain/external-linaro-to
> ol
> chain.bb).

virtual/${TARGET_PREFIX}libc-for-gcc is the item for the above

>   This usually means one provides something the other doesn't and =
should.
> ERROR: Multiple .bb files are due to be built which each provide=20
> virtual/libiconv (.../meta/recipes-core/eglibc/eglibc_2.15.bb
> .../meta-ingenico/recipes/external-linaro-toolchain/external-linaro-to
> ol
> chain.bb).
>   This usually means one provides something the other doesn't and =
should.

and virtual/libiconv is the item for the above...

> Notice that "PREFERRED_PROVIDER"s are correctly defined (like in=20
> distro/include/tcmode-external-sourcery.inc). And I use bitbake =
1.15.3.

We had to add additional preferred_providers to the =
tcmode-external-sourcey.inc.=20
  We (similar to you) have a custom binary toolchain... so the tailoring =
was required to get our stuff to work right.

> For now I fixed it crudely, because I don't need SDK.
>
> diff --git a/meta/classes/toolchain-scripts.bbclass
> b/meta/classes/toolchain-scripts.bbclass
> index 44284c3..f5fd4d7 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -136,7 +136,7 @@ toolchain_create_sdk_env_script_for_installer () {
>   #we get the cached site config in the runtime
>   TOOLCHAIN_CONFIGSITE_NOCACHE =3D "${@siteinfo_get_files(d, True)}"
>   TOOLCHAIN_CONFIGSITE_SYSROOTCACHE =3D
> "${STAGING_DATADIR}/${TARGET_SYS}_config_site.d"
> -TOOLCHAIN_NEED_CONFIGSITE_CACHE =3D "${TCLIBC} ncurses"
> +TOOLCHAIN_NEED_CONFIGSITE_CACHE =3D "ncurses"

That is incorrect.. the CONFIGSITE_CACHE should be generated for the =
TCLIBC.  If you don't do that, then you will be running the same =
configure steps -- looking for basic glibc information over and over and =
over, causing a fairly expensive performance penalty.

>
>   #This function create a site config file
>   toolchain_create_sdk_siteconfig () {
> ---
>
> populate_sdk_base.bbclass inheric toolchain-scripts which adds the
> (unwanted) eglibc dependency.

It's not an "eglibc" dependency, it's a libc dependency.  You definitely =
want that!  Otherwise you can end up with an SDK w/o a libc...

> Maybe this should be conditional from TOOLCHAIN_TARGET_TASK value?  Or =

> dependencies should be added only when calling=20
> task-core-standalone-sdk-target?
> In my use case, when I bitbake an image recipe, I don't want to deal=20
> with SDK.

I don't know the exact bitbake version numbers, but a fairly recent =
bitbake change (approx the same time as the patch you referred to) =
resolves an issue where un-used tasks were adding in build dependencies =
and causing the system to take longer to execute.)  So as long as you =
have a recent bitbake to match the recent oe-core, you should be ok.

> Concerning errors, is there a way to see what's not provided in order=20
> to fix virtual/libc message (bitbake -e) ?

bitbake -e, grep for PREFERRED_PROVIDER to see what you -do- have =
listed..=20
Otherwise no, you just have to go off of the error messages and add =
things until you've listed everything.

General rule of thumb, anything thats listed in the PROVIDES of the =
recipe will be needed in the PREFERRED_PROVIDER as well.

--Mark

> Best regards,
> Matthieu
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


