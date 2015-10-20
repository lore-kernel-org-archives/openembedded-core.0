Return-Path: <armccurdy@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3DCA976FDE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 03:38:12 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so25821769wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 20:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=5WP7iWQaUZt9d9XvOgiJxCv4EEBFkxAdnDCXHPJOYs4=;
	b=hJpKgDMbQSLOFJDqyooGJtBLK1lPUtKc5LUit5H+b0NKKxDcGwmEiMkt5Up21RCYLA
	WS78jA4LwlCZe9zXA0FzH13T1XJgmYVPhnTabLpPwaeYWmcgysQ/y7rmKWxyVCey3dve
	L++XmIbkve2L0TxzUvgJFYpIwaUkB0W1S9kGsJeNopBoOeCGh8g04WldDWpNZHnvheQm
	+Bpy5iqPXndQDQJ7VBrWKMKPvW0UzvwuvsFoZu4tLt4sNQjtr9hvKsXbtRlf+mKkTHhF
	r0IvTwszXUuoyiQZm6ZQFkxP2DizG0UwmxVgwksGPn4L8rr9g9Dj7mJ0YwhVuRBuK4Ow
	w4iA==
MIME-Version: 1.0
X-Received: by 10.194.62.112 with SMTP id x16mr1142816wjr.132.1445312292481;
	Mon, 19 Oct 2015 20:38:12 -0700 (PDT)
Received: by 10.194.140.38 with HTTP; Mon, 19 Oct 2015 20:38:12 -0700 (PDT)
In-Reply-To: <3B495823-4B5B-4DC7-8718-66578F037D27@gmail.com>
References: <1445309772-4373-1-git-send-email-armccurdy@gmail.com>
	<3B495823-4B5B-4DC7-8718-66578F037D27@gmail.com>
Date: Mon, 19 Oct 2015 20:38:12 -0700
Message-ID: <CAJ86T=VAuc_ZHEGWe4Q7fdkeYZ1KyrZidu3805qc_cBwNnDqsg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python: don't append -D__SOFTFP__ to TARGET_CC_ARCH for armv6/armv7a
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
X-List-Received-Date: Tue, 20 Oct 2015 03:38:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2015 at 8:20 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Oct 19, 2015, at 7:56 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> Remove obsolete hack which seems to date back to (at least) 2009. It's
>> potentially harmful as python TARGET_CC_ARCH flags can leak through to
>> other packages via the sysroot _sysconfigdata.py.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>> meta/recipes-devtools/python/python3_3.4.3.bb | 5 +----
>> meta/recipes-devtools/python/python_2.7.9.bb  | 5 -----
>> 2 files changed, 1 insertion(+), 9 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/python/python3_3.4.3.bb b/meta/recipe=
s-devtools/python/python3_3.4.3.bb
>> index f61d278..a33f10f 100644
>> --- a/meta/recipes-devtools/python/python3_3.4.3.bb
>> +++ b/meta/recipes-devtools/python/python3_3.4.3.bb
>> @@ -56,10 +56,7 @@ CACHED_CONFIGUREVARS =3D "ac_cv_have_chflags=3Dno \
>>                 ac_cv_file__dev_ptmx=3Dyes \
>>                 ac_cv_file__dev_ptc=3Dno \
>> "
>> -# The 3 lines below are copied from the libffi recipe, ctypes ships its=
 own copy of the libffi sources
>> -#Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=3Dsoftp :(
>> -TARGET_CC_ARCH_append_armv6 =3D " -D__SOFTFP__"
>> -TARGET_CC_ARCH_append_armv7a =3D " -D__SOFTFP__=E2=80=9D
>
> this is OK although, it would be interesting to know if you build any mod=
ules that used ctypes.so

-D__SOFTFP__ shows up unexpectedly on the gcc command line when
building gpsd from meta-oe.

> even if it did work it seems wrong to pass this flag atleast it should ch=
eck for callconvention=3Dhard
>
>> +
>
>> TARGET_CC_ARCH +=3D "-DNDEBUG -fno-inline"
>> EXTRA_OEMAKE +=3D "CROSS_COMPILE=3Dyes"
>> EXTRA_OECONF +=3D "CROSSPYTHONPATH=3D${STAGING_LIBDIR_NATIVE}/python${PY=
THON_MAJMIN}/lib-dynload/ --without-ensurepip"
>> diff --git a/meta/recipes-devtools/python/python_2.7.9.bb b/meta/recipes=
-devtools/python/python_2.7.9.bb
>> index f7e2f27..bc20417 100644
>> --- a/meta/recipes-devtools/python/python_2.7.9.bb
>> +++ b/meta/recipes-devtools/python/python_2.7.9.bb
>> @@ -34,11 +34,6 @@ inherit autotools multilib_header python-dir pythonna=
tive
>>
>> CONFIGUREOPTS +=3D " --with-system-ffi "
>>
>> -# The 3 lines below are copied from the libffi recipe, ctypes ships its=
 own copy of the libffi sources
>> -#Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=3Dsoftp :(
>> -TARGET_CC_ARCH_append_armv6 =3D " -D__SOFTFP__"
>> -TARGET_CC_ARCH_append_armv7a =3D " -D__SOFTFP__"
>> -
>> # The following is a hack until we drop ac_cv_sizeof_off_t from site fil=
es
>> EXTRA_OECONF +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', =
'ac_cv_sizeof_off_t=3D8', '', d)} ac_cv_file__dev_ptmx=3Dyes ac_cv_file__de=
v_ptc=3Dno"
>>
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

