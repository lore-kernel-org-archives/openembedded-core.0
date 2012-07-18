Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1SrJsR-0008WR-M1
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 04:20:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6I29FsB019594
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 19:09:15 -0700 (PDT)
Received: from [128.224.162.163] (128.224.162.163) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 17 Jul 2012 19:09:14 -0700
Message-ID: <50061AC9.80505@windriver.com>
Date: Wed, 18 Jul 2012 10:09:13 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1342576941-11413-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1342576941-11413-1-git-send-email-rongqing.li@windriver.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q6I29FsB019594
Subject: Re: [PATCH v2] slang: change char type to signed char in macros
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
X-List-Received-Date: Wed, 18 Jul 2012 02:20:48 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

Sorry, Please ignore this patch.

I should send a update to add signed-off-by and Upstream-Status,
not resend whole.

-Roy



On 2012=E5=B9=B407=E6=9C=8818=E6=97=A5 10:02, rongqing.li@windriver.com w=
rote:
> From: Roy.Li <rongqing.li@windriver.com>
>
> Fix [YOCTO 2726]
>
> C language has 3 distinct char types:
>           char
>           unsigned char
>           signed char
> A char has the same range of values as signed char on X86,
> but same as unsigned char on ARM which made Slang's typecast()
> and array_sort() unable to work for char value on ARM, since
> Slang is assuming "char" as "signed char".
>
> Now we change "char" as "signed char" explicitly in
> util/mkslarith2.sl, and use it to regenerate src/slarith2.inc
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>   ...change-char-type-to-signed-char-in-macros.patch |  218 +++++++++++=
+++++++++
>   meta/recipes-extended/slang/slang_2.2.4.bb         |    3 +-
>   2 files changed, 220 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-extended/slang/slang/change-char-type=
-to-signed-char-in-macros.patch
>
> diff --git a/meta/recipes-extended/slang/slang/change-char-type-to-sign=
ed-char-in-macros.patch b/meta/recipes-extended/slang/slang/change-char-t=
ype-to-signed-char-in-macros.patch
> new file mode 100644
> index 0000000..2ea1ffd
> --- /dev/null
> +++ b/meta/recipes-extended/slang/slang/change-char-type-to-signed-char=
-in-macros.patch
> @@ -0,0 +1,218 @@
> +slang: change char type to signed char in macros
> +
> +C language has 3 distinct char types:
> +         char
> +         unsigned char
> +         signed char
> +A char has the same range of values as signed char on X86,
> +but same as unsigned char on ARM which made Slang's typecast()
> +and array_sort() unable to work for char value on ARM, since
> +Slang is assuming "char" as "signed char".
> +
> +Now we change "char" as "signed char" explicitly in
> +util/mkslarith2.sl, and use it to regenerate src/slarith2.inc
> +
> +Upstream-Status: Submitted
> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> +---
> + src/slarith2.inc       |   72 ++++++++++++++++++++++++---------------=
----------
> + src/util/mkslarith2.sl |    2 -
> + 2 files changed, 37 insertions(+), 37 deletions(-)
> +
> +--- a/src/util/mkslarith2.sl
> ++++ b/src/util/mkslarith2.sl
> +@@ -1,7 +1,7 @@
> + #!/usr/bin/env slsh
> +
> + private variable CTypes =3D
> +-  ["char", "unsigned char", "short", "unsigned short", "int", "unsign=
ed int",
> ++  ["signed char", "unsigned char", "short", "unsigned short", "int", =
"unsigned int",
> +    "long", "unsigned long", "long long", "unsigned long long",
> +    "float", "double", "long double"];
> + private variable Is_Int_Type =3D
> +--- a/src/slarith2.inc
> ++++ b/src/slarith2.inc
> +@@ -1,43 +1,43 @@
> + /* DO NOT EDIT -- this file was generated by src/util/mkslarith2.sl *=
/
> +-/* ------------ char ---------- */
> +-DEFUN_1(copy_char_to_char,char,char)
> ++/* ------------ signed char ---------- */
> ++DEFUN_1(copy_char_to_char,signed char,signed char)
> + #define char_to_char	NULL
> + #define copy_char_to_uchar	copy_char_to_char
> + #define char_to_uchar	NULL
> +-DEFUN_1(copy_char_to_short,char,short)
> ++DEFUN_1(copy_char_to_short,signed char,short)
> + #define char_to_short	NULL
> +-DEFUN_1(copy_char_to_ushort,char,unsigned short)
> ++DEFUN_1(copy_char_to_ushort,signed char,unsigned short)
> + #define char_to_ushort	NULL
> +-DEFUN_1(copy_char_to_int,char,int)
> +-DEFUN_2(char_to_int,char,int,copy_char_to_int)
> +-DEFUN_1(copy_char_to_uint,char,unsigned int)
> +-DEFUN_2(char_to_uint,char,unsigned int,copy_char_to_uint)
> +-DEFUN_1(copy_char_to_long,char,long)
> +-DEFUN_2(char_to_long,char,long,copy_char_to_long)
> +-DEFUN_1(copy_char_to_ulong,char,unsigned long)
> +-DEFUN_2(char_to_ulong,char,unsigned long,copy_char_to_ulong)
> ++DEFUN_1(copy_char_to_int,signed char,int)
> ++DEFUN_2(char_to_int,signed char,int,copy_char_to_int)
> ++DEFUN_1(copy_char_to_uint,signed char,unsigned int)
> ++DEFUN_2(char_to_uint,signed char,unsigned int,copy_char_to_uint)
> ++DEFUN_1(copy_char_to_long,signed char,long)
> ++DEFUN_2(char_to_long,signed char,long,copy_char_to_long)
> ++DEFUN_1(copy_char_to_ulong,signed char,unsigned long)
> ++DEFUN_2(char_to_ulong,signed char,unsigned long,copy_char_to_ulong)
> + #if defined(HAVE_LONG_LONG)
> +-DEFUN_1(copy_char_to_llong,char,long long)
> +-DEFUN_2(char_to_llong,char,long long,copy_char_to_llong)
> ++DEFUN_1(copy_char_to_llong,signed char,long long)
> ++DEFUN_2(char_to_llong,signed char,long long,copy_char_to_llong)
> + #endif /* defined(HAVE_LONG_LONG) */
> + #if defined(HAVE_LONG_LONG)
> +-DEFUN_1(copy_char_to_ullong,char,unsigned long long)
> +-DEFUN_2(char_to_ullong,char,unsigned long long,copy_char_to_ullong)
> ++DEFUN_1(copy_char_to_ullong,signed char,unsigned long long)
> ++DEFUN_2(char_to_ullong,signed char,unsigned long long,copy_char_to_ul=
long)
> + #endif /* defined(HAVE_LONG_LONG) */
> + #if SLANG_HAS_FLOAT
> +-DEFUN_1(copy_char_to_float,char,float)
> +-DEFUN_2(char_to_float,char,float,copy_char_to_float)
> ++DEFUN_1(copy_char_to_float,signed char,float)
> ++DEFUN_2(char_to_float,signed char,float,copy_char_to_float)
> + #endif /* SLANG_HAS_FLOAT */
> + #if SLANG_HAS_FLOAT
> +-DEFUN_1(copy_char_to_double,char,double)
> +-DEFUN_2(char_to_double,char,double,copy_char_to_double)
> ++DEFUN_1(copy_char_to_double,signed char,double)
> ++DEFUN_2(char_to_double,signed char,double,copy_char_to_double)
> + #endif /* SLANG_HAS_FLOAT */
> + #if defined(HAVE_LONG_DOUBLE)
> +-DEFUN_1(copy_char_to_ldouble,char,long double)
> +-DEFUN_2(char_to_ldouble,char,long double,copy_char_to_ldouble)
> ++DEFUN_1(copy_char_to_ldouble,signed char,long double)
> ++DEFUN_2(char_to_ldouble,signed char,long double,copy_char_to_ldouble)
> + #endif /* defined(HAVE_LONG_DOUBLE) */
> + #if SLANG_HAS_FLOAT
> +-TO_DOUBLE_FUN(char_to_one_double,char)
> ++TO_DOUBLE_FUN(char_to_one_double,signed char)
> + #endif
> +
> + /* ------------ unsigned char ---------- */
> +@@ -82,7 +82,7 @@ TO_DOUBLE_FUN(uchar_to_one_double,unsign
> + #endif
> +
> + /* ------------ short ---------- */
> +-DEFUN_1(copy_short_to_char,short,char)
> ++DEFUN_1(copy_short_to_char,short,signed char)
> + #define short_to_char	NULL
> + DEFUN_1(copy_short_to_uchar,short,unsigned char)
> + #define short_to_uchar	NULL
> +@@ -123,7 +123,7 @@ TO_DOUBLE_FUN(short_to_one_double,short)
> + #endif
> +
> + /* ------------ unsigned short ---------- */
> +-DEFUN_1(copy_ushort_to_char,unsigned short,char)
> ++DEFUN_1(copy_ushort_to_char,unsigned short,signed char)
> + #define ushort_to_char	NULL
> + DEFUN_1(copy_ushort_to_uchar,unsigned short,unsigned char)
> + #define ushort_to_uchar	NULL
> +@@ -164,7 +164,7 @@ TO_DOUBLE_FUN(ushort_to_one_double,unsig
> + #endif
> +
> + /* ------------ int ---------- */
> +-DEFUN_1(copy_int_to_char,int,char)
> ++DEFUN_1(copy_int_to_char,int,signed char)
> + #define int_to_char	NULL
> + DEFUN_1(copy_int_to_uchar,int,unsigned char)
> + #define int_to_uchar	NULL
> +@@ -205,7 +205,7 @@ TO_DOUBLE_FUN(int_to_one_double,int)
> + #endif
> +
> + /* ------------ unsigned int ---------- */
> +-DEFUN_1(copy_uint_to_char,unsigned int,char)
> ++DEFUN_1(copy_uint_to_char,unsigned int,signed char)
> + #define uint_to_char	NULL
> + DEFUN_1(copy_uint_to_uchar,unsigned int,unsigned char)
> + #define uint_to_uchar	NULL
> +@@ -246,7 +246,7 @@ TO_DOUBLE_FUN(uint_to_one_double,unsigne
> + #endif
> +
> + /* ------------ long ---------- */
> +-DEFUN_1(copy_long_to_char,long,char)
> ++DEFUN_1(copy_long_to_char,long,signed char)
> + #define long_to_char	NULL
> + DEFUN_1(copy_long_to_uchar,long,unsigned char)
> + #define long_to_uchar	NULL
> +@@ -287,7 +287,7 @@ TO_DOUBLE_FUN(long_to_one_double,long)
> + #endif
> +
> + /* ------------ unsigned long ---------- */
> +-DEFUN_1(copy_ulong_to_char,unsigned long,char)
> ++DEFUN_1(copy_ulong_to_char,unsigned long,signed char)
> + #define ulong_to_char	NULL
> + DEFUN_1(copy_ulong_to_uchar,unsigned long,unsigned char)
> + #define ulong_to_uchar	NULL
> +@@ -329,7 +329,7 @@ TO_DOUBLE_FUN(ulong_to_one_double,unsign
> +
> + /* ------------ long long ---------- */
> + #if defined(HAVE_LONG_LONG)
> +-DEFUN_1(copy_llong_to_char,long long,char)
> ++DEFUN_1(copy_llong_to_char,long long,signed char)
> + #define llong_to_char	NULL
> + DEFUN_1(copy_llong_to_uchar,long long,unsigned char)
> + #define llong_to_uchar	NULL
> +@@ -372,7 +372,7 @@ TO_DOUBLE_FUN(llong_to_one_double,long l
> +
> + /* ------------ unsigned long long ---------- */
> + #if defined(HAVE_LONG_LONG)
> +-DEFUN_1(copy_ullong_to_char,unsigned long long,char)
> ++DEFUN_1(copy_ullong_to_char,unsigned long long,signed char)
> + #define ullong_to_char	NULL
> + DEFUN_1(copy_ullong_to_uchar,unsigned long long,unsigned char)
> + #define ullong_to_uchar	NULL
> +@@ -415,7 +415,7 @@ TO_DOUBLE_FUN(ullong_to_one_double,unsig
> +
> + /* ------------ float ---------- */
> + #if SLANG_HAS_FLOAT
> +-DEFUN_1(copy_float_to_char,float,char)
> ++DEFUN_1(copy_float_to_char,float,signed char)
> + #define float_to_char	NULL
> + DEFUN_1(copy_float_to_uchar,float,unsigned char)
> + #define float_to_uchar	NULL
> +@@ -458,7 +458,7 @@ TO_DOUBLE_FUN(float_to_one_double,float)
> +
> + /* ------------ double ---------- */
> + #if SLANG_HAS_FLOAT
> +-DEFUN_1(copy_double_to_char,double,char)
> ++DEFUN_1(copy_double_to_char,double,signed char)
> + #define double_to_char	NULL
> + DEFUN_1(copy_double_to_uchar,double,unsigned char)
> + #define double_to_uchar	NULL
> +@@ -501,7 +501,7 @@ TO_DOUBLE_FUN(double_to_one_double,doubl
> +
> + /* ------------ long double ---------- */
> + #if defined(HAVE_LONG_DOUBLE)
> +-DEFUN_1(copy_ldouble_to_char,long double,char)
> ++DEFUN_1(copy_ldouble_to_char,long double,signed char)
> + #define ldouble_to_char	NULL
> + DEFUN_1(copy_ldouble_to_uchar,long double,unsigned char)
> + #define ldouble_to_uchar	NULL
> +@@ -545,7 +545,7 @@ TO_DOUBLE_FUN(ldouble_to_one_double,long
> + #if SLANG_HAS_FLOAT
> + static To_Double_Fun_Table_Type To_Double_Fun_Table [MAX_ARITHMETIC_T=
YPES] =3D
> + {
> +-   {sizeof(char), char_to_one_double},
> ++   {sizeof(signed char), char_to_one_double},
> +    {sizeof(unsigned char), uchar_to_one_double},
> +    {sizeof(short), short_to_one_double},
> +    {sizeof(unsigned short), ushort_to_one_double},
> +@@ -583,7 +583,7 @@ static To_Double_Fun_Table_Type To_Doubl
> +
> + static Binary_Matrix_Type Binary_Matrix [MAX_ARITHMETIC_TYPES][MAX_AR=
ITHMETIC_TYPES] =3D
> + {
> +-   /* char */
> ++   /* signed char */
> +    {
> +      {(FVOID_STAR)copy_char_to_char, char_to_char},
> +      {(FVOID_STAR)copy_char_to_uchar, char_to_uchar},
> diff --git a/meta/recipes-extended/slang/slang_2.2.4.bb b/meta/recipes-=
extended/slang/slang_2.2.4.bb
> index f17bc0f..72dd99f 100644
> --- a/meta/recipes-extended/slang/slang_2.2.4.bb
> +++ b/meta/recipes-extended/slang/slang_2.2.4.bb
> @@ -10,7 +10,7 @@ to recode S-Lang procedures in C if you need to."
>   HOMEPAGE =3D "http://www.jedsoft.org/slang/"
>   SECTION =3D "libs"
>   DEPENDS =3D "pcre"
> -PR =3D "r8"
> +PR =3D "r9"
>
>   LICENSE =3D "GPLv2"
>   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da52a18a472d4f7e45479b06563=
717c02"
> @@ -19,6 +19,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da52a18a472=
d4f7e45479b06563717c02"
>   SRC_URI =3D "ftp://space.mit.edu/pub/davis/slang/v2.2/slang-${PV}.tar=
.bz2 \
>              file://rpathfix.patch \
>             "
> +SRC_URI_append_arm =3D " file://change-char-type-to-signed-char-in-mac=
ros.patch"
>
>   inherit autotools
>
>

--=20
Best Reagrds,
Roy | RongQing Li




