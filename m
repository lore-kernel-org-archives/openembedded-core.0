Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QoOFl-0002x1-C0
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 01:20:01 +0200
Received: by pzk1 with SMTP id 1so437368pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2011 16:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=ZsriNOE0jxnqNGPpJBz7DF47/1YOIFMFgCsKVEVB7Zo=;
	b=xrgfUUGWqwMEKkSaWhrSOCCqsQI71qY+72bUjZHXjoeKuWF++kgRNSynpqh+LXr2g8
	7zJcfFUOnqHgzHr7jpswmvGSk/iLihWl43LRiEnqvfoWMk8PzIuS2zAHuEwLN9mjMeO/
	VDOwZrH8HDeW9q9S8WvezHhuMPhvkz8fwGd40=
Received: by 10.142.149.31 with SMTP id w31mr542495wfd.31.1312326932070; Tue,
	02 Aug 2011 16:15:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.65.130 with HTTP; Tue, 2 Aug 2011 16:15:02 -0700 (PDT)
In-Reply-To: <1312324397-1923-1-git-send-email-galak@kernel.crashing.org>
References: <1312324397-1923-1-git-send-email-galak@kernel.crashing.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Aug 2011 16:15:02 -0700
Message-ID: <CAMKF1sq8Qq-UdXbzYtEwn5nVq7mb-99DO9mS-P7OpQ7MMz5pSQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] gcc: Fix setting of GLIBC_DYNAMIC_LINKER
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
X-List-Received-Date: Tue, 02 Aug 2011 23:20:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 2, 2011 at 3:33 PM, Kumar Gala <galak@kernel.crashing.org> wrot=
e:
> The sed regex in do_configure_prepend was producing the following result:
>
> =C2=A0#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "/lib64/ld-linux-x86-=
64.so.2"
>
> instead of removing the leading "/lib" or "/lib64".
>
> Now we have it do:
>
> =C2=A0#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2=
"
>
> Additionally, with the regex fixed the manipulation of SYSTEMLIBS_DIR
> needs to be removed.

its better one.
Doesn't apply cleanly but I have fixed that. I am testing this on x86_64

>
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> ---
> * cleanup regex so we dont add in / explicity but just pull it in from
> =C2=A0how SYSTEMLIBS_DIR is set.
>
> =C2=A0meta/recipes-devtools/gcc/gcc-4.6.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0meta/recipes-devtools/gcc/gcc-configure-common.inc | =C2=A0 12 ++++=
++++----
> =C2=A0meta/recipes-devtools/gcc/gcc_4.5.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +-
> =C2=A04 files changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtool=
s/gcc/gcc-4.6.inc
> index b054266..3a6f273 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
> @@ -1,6 +1,6 @@
> =C2=A0require gcc-common.inc
>
> -PR =3D "r3"
> +PR =3D "r4"
>
> =C2=A0# Third digit in PV should be incremented after a minor release
> =C2=A0# happens from this branch on gcc e.g. currently its 4.6.0
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/re=
cipes-devtools/gcc/gcc-configure-common.inc
> index aac6d69..238496f 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -66,11 +66,15 @@ SYSTEMLIBS1 =3D "${target_libdir}/"
> =C2=A0do_configure_prepend () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# Change the default dynamic linker path, only=
 useful for SDK, other's value
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# are not changed according to the SYSTEMLIBS_=
DIR
> + =C2=A0 =C2=A0 =C2=A0 #
> + =C2=A0 =C2=A0 =C2=A0 # We want something like the following:
> + =C2=A0 =C2=A0 =C2=A0 # =C2=A0 =C2=A0 =C2=A0 #define GLIBC_DYNAMIC_LINKE=
R64 "/lib64/ld-linux-x86-64.so.2"
> + =C2=A0 =C2=A0 =C2=A0 # becomes
> + =C2=A0 =C2=A0 =C2=A0 # =C2=A0 =C2=A0 =C2=A0 #define GLIBC_DYNAMIC_LINKE=
R64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2"
> + =C2=A0 =C2=A0 =C2=A0 #
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i ${S}/gcc/config/*/linux*.h -e \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 's#\(GLIBC_DYNAMIC_LIN=
KER[^ ]*\)\( *"/lib.*\)#\1 SYSTEMLIBS_DIR\2#'
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 's#\(GLIBC_DYNAMIC_LIN=
KER[^ ]*\) \( *"/lib.*\)/\(.*\)#\1 SYSTEMLIBS_DIR "\3#'
>
> - =C2=A0 =C2=A0 =C2=A0 SYSTEMLIBS_DIR=3D`dirname ${SYSTEMLIBS}`
> - =C2=A0 =C2=A0 =C2=A0 [ "$SYSTEMLIBS_DIR" =3D "/" ] && SYSTEMLIBS_DIR=3D=
""
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# teach gcc to find correct target includedir =
when checking libc ssp support
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${B}/gcc
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "NATIVE_SYSTEM_HEADER_DIR =3D ${SYSTEMHEA=
DERS}" > ${B}/gcc/t-oe
> @@ -85,7 +89,7 @@ do_configure_prepend () {
> =C2=A0#ifndef STANDARD_STARTFILE_PREFIX_2
> =C2=A0#define STANDARD_STARTFILE_PREFIX_2 "${SYSTEMLIBS1}"
> =C2=A0#endif
> -#define SYSTEMLIBS_DIR "$SYSTEMLIBS_DIR"
> +#define SYSTEMLIBS_DIR "${SYSTEMLIBS}"
> =C2=A0#endif /* ! GCC_DEFAULTS_H */
> =C2=A0_EOF
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mv ${B}/gcc/defaults.h.new ${B}/gcc/defaults.h
> diff --git a/meta/recipes-devtools/gcc/gcc_4.5.1.bb b/meta/recipes-devtoo=
ls/gcc/gcc_4.5.1.bb
> index f036cb1..75901ba 100644
> --- a/meta/recipes-devtools/gcc/gcc_4.5.1.bb
> +++ b/meta/recipes-devtools/gcc/gcc_4.5.1.bb
> @@ -1,4 +1,4 @@
> -PR =3D "r8"
> +PR =3D "r9"
> =C2=A0require gcc-${PV}.inc
> =C2=A0require gcc-configure-target.inc
> =C2=A0require gcc-package-target.inc
> diff --git a/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb b/meta/recip=
es-devtools/gcc/gcc_csl-arm-2008q1.bb
> index 9fd2b0a..1bbab50 100644
> --- a/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
> +++ b/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
> @@ -1,4 +1,4 @@
> -PR =3D "r5"
> +PR =3D "r6"
>
> =C2=A0require gcc-${PV}.inc
> =C2=A0require gcc-configure-target.inc
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


