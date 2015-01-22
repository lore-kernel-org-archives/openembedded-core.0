Return-Path: <jurobystricky@hotmail.com>
X-Greylist: delayed 301 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 22 Jan 2015 20:57:38 UTC
Received: from BAY004-OMC3S26.hotmail.com (bay004-omc3s26.hotmail.com
	[65.54.190.164])
	by mail.openembedded.org (Postfix) with ESMTP id A293C71637
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 20:57:38 +0000 (UTC)
Received: from BAY179-W3 ([65.54.190.187]) by BAY004-OMC3S26.hotmail.com over
	TLS secured channel with Microsoft SMTPSVC(7.5.7601.22751); 
	Thu, 22 Jan 2015 12:52:37 -0800
X-TMN: [1O06rCV/9/ZkRa43iv7ApZffGLGqdqQV]
X-Originating-Email: [jurobystricky@hotmail.com]
Message-ID: <BAY179-W31475BA463A068FF83E83BB490@phx.gbl>
From: Juro Bystricky <jurobystricky@hotmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Jan 2015 12:52:37 -0800
Importance: Normal
In-Reply-To: <BLU437-SMTP65FA876B595D639FFD2DD6BB750@phx.gbl>
References: <BLU437-SMTP65FA876B595D639FFD2DD6BB750@phx.gbl>
MIME-Version: 1.0
X-OriginalArrivalTime: 22 Jan 2015 20:52:37.0625 (UTC)
	FILETIME=[5AD5B690:01D03685]
Subject: Re: [PATCH] eglibc-use-option-groups.patch: Various fixups
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
X-List-Received-Date: Thu, 22 Jan 2015 20:57:50 -0000
Content-Type: multipart/alternative;
	boundary="_77b9171c-c296-4e75-bd85-b882a33424b4_"

--_77b9171c-c296-4e75-bd85-b882a33424b4_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

ping.


> From: jurobystricky@hotmail.com
> To: openembedded-core@lists.openembedded.org
> CC: sgw@linux.intel.com=3B peter.seebach@windriver.com
> Subject: [PATCH] eglibc-use-option-groups.patch: Various fixups
> Date: Sun=2C 23 Nov 2014 09:44:17 -0800
>=20
> Build suppport for mutibyte character handling only when
> __OPTION_EGLIBC_LOCALE_CODE evaluates to 1.
> Fixes missing .out suffix for several tests to be built.
> Fixes building of locales needed for several tests. Do not use
> cross-localedef to build locales. Use localedef built with the
> newly built libgc instead.
>=20
> Fixes:
> [YOCTO #6809] [YOCTO #6796] [YOCTO #6797]
>=20
> Signed-off-by: Juro Bystricky <jurobystricky@hotmail.com>
> ---
>  .../glibc/glibc/eglibc-use-option-groups.patch     | 43 ++--------------=
------
>  1 file changed=2C 4 insertions(+)=2C 39 deletions(-)
>=20
> diff --git a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch=
 b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
> index 40c7832..0e2f0c6 100644
> --- a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
> +++ b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
> @@ -2434=2C24 +2434=2C7 @@ Index: git/localedata/Makefile
>  =20
>   ifeq ($(run-built-tests)=2Cyes)
>   # We have to generate locales
> -@@ -143=2C9 +161=2C13 @@
> - $(addprefix $(objpfx)=2C$(CTYPE_FILES)): %: \
> -   gen-locale.sh $(common-objpfx)locale/localedef Makefile \
> -   $(addprefix charmaps/=2C$(CHARMAPS)) $(addprefix locales/=2C$(LOCALE_=
SRCS))
> --	@$(SHELL) gen-locale.sh $(common-objpfx) \
> --		  '$(built-program-cmd-before-env)' '$(run-program-env)' \
> --		  '$(built-program-cmd-after-env)' $@=3B \
> -+	@$(SHELL) gen-locale.sh $(common-objpfx)	\
> -+		 '$(if $(cross-localedef)=2C 		\
> -+		       $(cross-localedef)=2C		\
> -+		       $(built-program-cmd-before-env)  \
> -+		       $(run-program-env)		\
> -+		       $(built-program-cmd-after-env))' \
> -+		       $@=3B \
> - 	$(evaluate-test)
> -=20
> - $(addsuffix .out=2C$(addprefix $(objpfx)=2C$(tests))): %: \
> -@@ -213=2C6 +235=2C11 @@
> +@@ -213=2C6 +231=2C11 @@
>  =20
>   include SUPPORTED
>  =20
> @@ -4783=2C7 +4766=2C7 @@ Index: git/posix/fnmatch.c
>   #  endif
>  =20
>  -#  if (HAVE_MBSTATE_T && HAVE_MBSRTOWCS) || _LIBC
> -+#  if (HAVE_MBSTATE_T && HAVE_MBSRTOWCS) || (_LIBC && __OPTION_EGLIBC_L=
OCALE_CODE)
> ++#  if (HAVE_MBSTATE_T && HAVE_MBSRTOWCS && _LIBC && __OPTION_EGLIBC_LOC=
ALE_CODE)
>   /* In this case we are implementing the multibyte character handling.  =
*/
>   #   define HANDLE_MULTIBYTE	1
>   #  endif
> @@ -5065=2C8 +5048=2C8 @@ Index: git/posix/Makefile
>   		 $(objpfx)bug-glob2-mem.out $(objpfx)tst-vfork3-mem.out \
>   		 $(objpfx)tst-fnmatch-mem.out $(objpfx)bug-regex36-mem.out
>  +ifeq (y=2C$(OPTION_POSIX_REGEXP_GLIBC))
> -+tests-special +=3D $(objpfx)bug-regex14-mem $(objpfx)tst-rxspencer-no-u=
tf8-mem \
> -+  		 $(objpfx)tst-pcre-mem $(objpfx)tst-boost-mem
> ++tests-special +=3D $(objpfx)bug-regex14-mem.out $(objpfx)tst-rxspencer-=
no-utf8-mem.out \
> ++  		 $(objpfx)tst-pcre-mem.out $(objpfx)tst-boost-mem.out
>  +endif
>  +
>   xtests-special +=3D $(objpfx)bug-ga2-mem.out
> @@ -16458=2C24 +16441=2C6 @@ Index: git/sysdeps/nptl/small-macros-fns.c
>  +libc_hidden_def (__libc_lock_unlock_recursive_fn)=3B
>  +
>  +#endif /*defined _LIBC && (!defined NOT_IN_libc || defined IS_IN_libpth=
read)*/
> -Index: git/include/libc-symbols.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/include/libc-symbols.h	2014-08-29 20:00:47.144070587 -0700
> -+++ git/include/libc-symbols.h	2014-08-29 20:01:15.248070587 -0700
> -@@ -60=2C8 +60=2C11 @@
> - /* Define these macros for the benefit of portable GNU code that wants =
to check
> -    them.  Of course=2C STDC_HEADERS is never false when building libc! =
 */
> - #define STDC_HEADERS	1
> --#define HAVE_MBSTATE_T	1
> --#define HAVE_MBSRTOWCS	1
> -+
> -+#if __OPTION_EGLIBC_LOCALE_CODE
> -+# define HAVE_MBSTATE_T	1
> -+# define HAVE_MBSRTOWCS	1
> -+#endif
> - #define HAVE_LIBINTL_H	1
> - #define HAVE_WCTYPE_H	1
> - #define HAVE_ISWCTYPE	1
>  Index: git/crypt/crypt_common.c
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> --=20
> 1.9.1
>=20
 		 	   		  =

--_77b9171c-c296-4e75-bd85-b882a33424b4_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<style><!--
.hmmessage P
{
margin:0px=3B
padding:0px
}
body.hmmessage
{
font-size: 12pt=3B
font-family:Calibri
}
--></style></head>
<body class=3D'hmmessage'><div dir=3D'ltr'>ping.<br><br><br><div>&gt=3B Fro=
m: jurobystricky@hotmail.com<br>&gt=3B To: openembedded-core@lists.openembe=
dded.org<br>&gt=3B CC: sgw@linux.intel.com=3B peter.seebach@windriver.com<b=
r>&gt=3B Subject: [PATCH] eglibc-use-option-groups.patch: Various fixups<br=
>&gt=3B Date: Sun=2C 23 Nov 2014 09:44:17 -0800<br>&gt=3B <br>&gt=3B Build =
suppport for mutibyte character handling only when<br>&gt=3B __OPTION_EGLIB=
C_LOCALE_CODE evaluates to 1.<br>&gt=3B Fixes missing .out suffix for sever=
al tests to be built.<br>&gt=3B Fixes building of locales needed for severa=
l tests. Do not use<br>&gt=3B cross-localedef to build locales. Use localed=
ef built with the<br>&gt=3B newly built libgc instead.<br>&gt=3B <br>&gt=3B=
 Fixes:<br>&gt=3B [YOCTO #6809] [YOCTO #6796] [YOCTO #6797]<br>&gt=3B <br>&=
gt=3B Signed-off-by: Juro Bystricky &lt=3Bjurobystricky@hotmail.com&gt=3B<b=
r>&gt=3B ---<br>&gt=3B  .../glibc/glibc/eglibc-use-option-groups.patch     =
| 43 ++--------------------<br>&gt=3B  1 file changed=2C 4 insertions(+)=2C=
 39 deletions(-)<br>&gt=3B <br>&gt=3B diff --git a/meta/recipes-core/glibc/=
glibc/eglibc-use-option-groups.patch b/meta/recipes-core/glibc/glibc/eglibc=
-use-option-groups.patch<br>&gt=3B index 40c7832..0e2f0c6 100644<br>&gt=3B =
--- a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch<br>&gt=
=3B +++ b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch<br>&=
gt=3B @@ -2434=2C24 +2434=2C7 @@ Index: git/localedata/Makefile<br>&gt=3B  =
 <br>&gt=3B   ifeq ($(run-built-tests)=2Cyes)<br>&gt=3B   # We have to gene=
rate locales<br>&gt=3B -@@ -143=2C9 +161=2C13 @@<br>&gt=3B - $(addprefix $(=
objpfx)=2C$(CTYPE_FILES)): %: \<br>&gt=3B -   gen-locale.sh $(common-objpfx=
)locale/localedef Makefile \<br>&gt=3B -   $(addprefix charmaps/=2C$(CHARMA=
PS)) $(addprefix locales/=2C$(LOCALE_SRCS))<br>&gt=3B --	@$(SHELL) gen-loca=
le.sh $(common-objpfx) \<br>&gt=3B --		  '$(built-program-cmd-before-env)' =
'$(run-program-env)' \<br>&gt=3B --		  '$(built-program-cmd-after-env)' $@=
=3B \<br>&gt=3B -+	@$(SHELL) gen-locale.sh $(common-objpfx)	\<br>&gt=3B -+	=
	 '$(if $(cross-localedef)=2C 		\<br>&gt=3B -+		       $(cross-localedef)=
=2C		\<br>&gt=3B -+		       $(built-program-cmd-before-env)  \<br>&gt=3B -+=
		       $(run-program-env)		\<br>&gt=3B -+		       $(built-program-cmd-aft=
er-env))' \<br>&gt=3B -+		       $@=3B \<br>&gt=3B - 	$(evaluate-test)<br>&=
gt=3B - <br>&gt=3B - $(addsuffix .out=2C$(addprefix $(objpfx)=2C$(tests))):=
 %: \<br>&gt=3B -@@ -213=2C6 +235=2C11 @@<br>&gt=3B +@@ -213=2C6 +231=2C11 =
@@<br>&gt=3B   <br>&gt=3B   include SUPPORTED<br>&gt=3B   <br>&gt=3B @@ -47=
83=2C7 +4766=2C7 @@ Index: git/posix/fnmatch.c<br>&gt=3B   #  endif<br>&gt=
=3B   <br>&gt=3B  -#  if (HAVE_MBSTATE_T &amp=3B&amp=3B HAVE_MBSRTOWCS) || =
_LIBC<br>&gt=3B -+#  if (HAVE_MBSTATE_T &amp=3B&amp=3B HAVE_MBSRTOWCS) || (=
_LIBC &amp=3B&amp=3B __OPTION_EGLIBC_LOCALE_CODE)<br>&gt=3B ++#  if (HAVE_M=
BSTATE_T &amp=3B&amp=3B HAVE_MBSRTOWCS &amp=3B&amp=3B _LIBC &amp=3B&amp=3B =
__OPTION_EGLIBC_LOCALE_CODE)<br>&gt=3B   /* In this case we are implementin=
g the multibyte character handling.  */<br>&gt=3B   #   define HANDLE_MULTI=
BYTE	1<br>&gt=3B   #  endif<br>&gt=3B @@ -5065=2C8 +5048=2C8 @@ Index: git/=
posix/Makefile<br>&gt=3B   		 $(objpfx)bug-glob2-mem.out $(objpfx)tst-vfork=
3-mem.out \<br>&gt=3B   		 $(objpfx)tst-fnmatch-mem.out $(objpfx)bug-regex3=
6-mem.out<br>&gt=3B  +ifeq (y=2C$(OPTION_POSIX_REGEXP_GLIBC))<br>&gt=3B -+t=
ests-special +=3D $(objpfx)bug-regex14-mem $(objpfx)tst-rxspencer-no-utf8-m=
em \<br>&gt=3B -+  		 $(objpfx)tst-pcre-mem $(objpfx)tst-boost-mem<br>&gt=
=3B ++tests-special +=3D $(objpfx)bug-regex14-mem.out $(objpfx)tst-rxspence=
r-no-utf8-mem.out \<br>&gt=3B ++  		 $(objpfx)tst-pcre-mem.out $(objpfx)tst=
-boost-mem.out<br>&gt=3B  +endif<br>&gt=3B  +<br>&gt=3B   xtests-special +=
=3D $(objpfx)bug-ga2-mem.out<br>&gt=3B @@ -16458=2C24 +16441=2C6 @@ Index: =
git/sysdeps/nptl/small-macros-fns.c<br>&gt=3B  +libc_hidden_def (__libc_loc=
k_unlock_recursive_fn)=3B<br>&gt=3B  +<br>&gt=3B  +#endif /*defined _LIBC &=
amp=3B&amp=3B (!defined NOT_IN_libc || defined IS_IN_libpthread)*/<br>&gt=
=3B -Index: git/include/libc-symbols.h<br>&gt=3B -=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt=3B ---- git.orig/include/libc-symbols.h	=
2014-08-29 20:00:47.144070587 -0700<br>&gt=3B -+++ git/include/libc-symbols=
.h	2014-08-29 20:01:15.248070587 -0700<br>&gt=3B -@@ -60=2C8 +60=2C11 @@<br=
>&gt=3B - /* Define these macros for the benefit of portable GNU code that =
wants to check<br>&gt=3B -    them.  Of course=2C STDC_HEADERS is never fal=
se when building libc!  */<br>&gt=3B - #define STDC_HEADERS	1<br>&gt=3B --#=
define HAVE_MBSTATE_T	1<br>&gt=3B --#define HAVE_MBSRTOWCS	1<br>&gt=3B -+<b=
r>&gt=3B -+#if __OPTION_EGLIBC_LOCALE_CODE<br>&gt=3B -+# define HAVE_MBSTAT=
E_T	1<br>&gt=3B -+# define HAVE_MBSRTOWCS	1<br>&gt=3B -+#endif<br>&gt=3B - =
#define HAVE_LIBINTL_H	1<br>&gt=3B - #define HAVE_WCTYPE_H	1<br>&gt=3B - #d=
efine HAVE_ISWCTYPE	1<br>&gt=3B  Index: git/crypt/crypt_common.c<br>&gt=3B =
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt=3B  --- /dev/=
null	1970-01-01 00:00:00.000000000 +0000<br>&gt=3B -- <br>&gt=3B 1.9.1<br>&=
gt=3B <br></div> 		 	   		  </div></body>
</html>=

--_77b9171c-c296-4e75-bd85-b882a33424b4_--
