Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RYYIy-0005Td-Th
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 08:22:09 +0100
Received: by lahd3 with SMTP id d3so562220lah.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2011 23:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=3SnefLxVPT5gFU/4tP1rv/UydJYBhP/+3sHeH+HggbQ=;
	b=cH7a2JFDVBVUO9+XABl5mzbRh5XNNbTk0/tcDktrqDqstvQZW1y+3LyW4WNevdvFYi
	g3W09PTGlZk4S7CThlYpvNKDS0OETMS3h1blwqqFMINVW24cGTbUMLGDjCowRruv9pAY
	/u8m7SwENAgpVn94KysZq7wsY+pCVvxg741Q4=
Received: by 10.152.104.206 with SMTP id gg14mr1067233lab.41.1323328519328;
	Wed, 07 Dec 2011 23:15:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 7 Dec 2011 23:14:48 -0800 (PST)
In-Reply-To: <7e5d0671426509d061abbe8b320f65f2cfb3a8a0.1323323130.git.nitin.a.kamble@intel.com>
References: <cover.1323323130.git.nitin.a.kamble@intel.com>
	<664f652792df901dbc42d813b299093fa719a66a.1323323130.git.nitin.a.kamble@intel.com>
	<7e5d0671426509d061abbe8b320f65f2cfb3a8a0.1323323130.git.nitin.a.kamble@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Dec 2011 23:14:48 -0800
Message-ID: <CAMKF1spqOpuz-M7e-F5Cwgx_ufQ4m7MTfBv05StCCXE3e5zV4w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: hjl.tools@gmail.com
Subject: Re: [PATCH 05/11] findutils: Fix compilation for x32 toolchain
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
X-List-Received-Date: Thu, 08 Dec 2011 07:22:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 7, 2011 at 9:48 PM,  <nitin.a.kamble@intel.com> wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> Work around gnulib time_t assumption in findutils for x32

if its a workaround can it be applied only to x32 with help of overrides pl=
ease

>
> time_t is 64bit and long int is 32bit on x32. =C2=A0But gnulib used in
> findutils assumes time_t values fit into long int. =C2=A0Such assumption =
is
> invalid for x32 and should be removed.
>
> This patch is a workaround to compile gnulib for x32.
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> Signed-Off-By: H.J. Lu <hjl.tools@gmail.com>
> ---
> =C2=A0.../findutils-4.4.2/findutils_fix_for_x32.patch =C2=A0 =C2=A0| =C2=
=A0 40 ++++++++++++++++++++
> =C2=A0meta/recipes-extended/findutils/findutils_4.4.2.bb | =C2=A0 =C2=A05=
 +-
> =C2=A02 files changed, 43 insertions(+), 2 deletions(-)
> =C2=A0create mode 100644 meta/recipes-extended/findutils/findutils-4.4.2/=
findutils_fix_for_x32.patch
>
> diff --git a/meta/recipes-extended/findutils/findutils-4.4.2/findutils_fi=
x_for_x32.patch b/meta/recipes-extended/findutils/findutils-4.4.2/findutils=
_fix_for_x32.patch
> new file mode 100644
> index 0000000..dd2ab0e
> --- /dev/null
> +++ b/meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_for_x=
32.patch
> @@ -0,0 +1,40 @@
> +UpstreamStatus: Pending
> +
> +Author: H.J. Lu <hjl.tools@gmail.com>
> +
> +Work around gnulib time_t assumption in findutils for x32
> +
> +time_t is 64bit and long int is 32bit on x32. =C2=A0But gnulib used in
> +findutils assumes time_t values fit into long int. =C2=A0Such assumption=
 is
> +invalid for x32 and should be removed.
> +
> +This patch is a workaround to compile gnulib for x32.
> +
> +Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/05
> +
> +
> +Index: findutils-4.4.2/gnulib/lib/getdate.y
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- findutils-4.4.2.orig/gnulib/lib/getdate.y
> ++++ findutils-4.4.2/gnulib/lib/getdate.y
> +@@ -114,7 +114,6 @@
> + =C2=A0 =C2=A0wraps around, but there's no portable way to check for tha=
t at
> + =C2=A0 =C2=A0compile-time. =C2=A0*/
> + verify (TYPE_IS_INTEGER (time_t));
> +-verify (LONG_MIN <=3D TYPE_MINIMUM (time_t) && TYPE_MAXIMUM (time_t) <=
=3D LONG_MAX);
> +
> + /* An integer value, and the number of digits in its textual
> + =C2=A0 =C2=A0representation. =C2=A0*/
> +Index: findutils-4.4.2/gnulib/lib/mktime.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- findutils-4.4.2.orig/gnulib/lib/mktime.c
> ++++ findutils-4.4.2/gnulib/lib/mktime.c
> +@@ -166,7 +166,7 @@ ydhms_diff (long int year1, long int yda
> + {
> + =C2=A0 verify (C99_integer_division, -1 / 2 =3D=3D 0);
> + =C2=A0 verify (long_int_year_and_yday_are_wide_enough,
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0INT_MAX <=3D LONG_MAX / 2 || TIME_T_MAX <=
=3D UINT_MAX);
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0INT_MAX <=3D TIME_T_MAX / 2 || TIME_T_MAX <=
=3D UINT_MAX);
> +
> + =C2=A0 /* Compute intervening leap days correctly even if year is negat=
ive.
> + =C2=A0 =C2=A0 =C2=A0Take care to avoid integer overflow here. =C2=A0*/
> diff --git a/meta/recipes-extended/findutils/findutils_4.4.2.bb b/meta/re=
cipes-extended/findutils/findutils_4.4.2.bb
> index cfc6546..c25ba4c 100644
> --- a/meta/recipes-extended/findutils/findutils_4.4.2.bb
> +++ b/meta/recipes-extended/findutils/findutils_4.4.2.bb
> @@ -1,10 +1,11 @@
> =C2=A0require findutils.inc
>
> -PR =3D "r0"
> +PR =3D "r1"
>
> =C2=A0SRC_URI +=3D "file://01-27017.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://02-28824.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://03-28872.patch"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://03-28872.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://findutils_fix_for_x32.p=
atch "
>
> =C2=A0SRC_URI[md5sum] =3D "351cc4adb07d54877fa15f75fb77d39f"
> =C2=A0SRC_URI[sha256sum] =3D "434f32d171cbc0a5e72cfc5372c6fc4cb0e681f8dce=
566a0de5b6fccd702b62a"
> --
> 1.7.6.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


