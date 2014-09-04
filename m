Return-Path: <danismostlikely@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id BE4A6713FD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 20:49:36 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id q108so3484878qgd.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Sep 2014 13:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=nLmiV5tXGmub+hTs2N/HZPJ0xv8htK/9sVqB/bRwPqk=;
	b=f/37aio2qw0fNeaM0x7MsBs1pXATpxQHpd2k8i3X55TND4P1xh7gaSYyEBdt3BYrQN
	divC4oO8ZVfIrbf9uiFJEM68XaEU1pTcCsVO/7BofIA4QnDx80XOx7MZaAzRCom+ss9i
	yUCsT8zgKic97BkkqS5gOBqpU7ppYACo4hh6/VgyZXsGcPShNjd7WLaEPpfATDVKkRGd
	y9/mZBbR74uht3yvKx2fAHZQPRdCN+Vrj+gWsRuBT5fAj30XjuHYrbM12twzVWzxclI8
	VcLg98BDT/r7Dbfx2b5aozC3Gt2zUCtyOWqYfHCI+hUdk1+T+ImkeR3Fg0HXv+8Ve8ZZ
	eIjA==
MIME-Version: 1.0
X-Received: by 10.229.188.9 with SMTP id cy9mr132722qcb.6.1409863774460; Thu,
	04 Sep 2014 13:49:34 -0700 (PDT)
Received: by 10.96.205.134 with HTTP; Thu, 4 Sep 2014 13:49:34 -0700 (PDT)
In-Reply-To: <54088743.1010604@gmail.com>
References: <CACS+7ZS3J37=hLKBTfs7GvEEcXmVU1RPr_Ryvty2BawoBw+BVQ@mail.gmail.com>
	<5408781E.3070708@gmail.com>
	<CACS+7ZQYOB6-nwmQ=dyHbj4Bg29Ce_iAuMtUBTZGkfDc8GfW+A@mail.gmail.com>
	<54088743.1010604@gmail.com>
Date: Thu, 4 Sep 2014 14:49:34 -0600
Message-ID: <CACS+7ZSVRRGQXpbv=V6HCpGL7HmJZG552SbvPyfoSsewd8SMag@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Jonathan Liu <net147@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] gcc-runtime: enable asan and tsan
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
X-List-Received-Date: Thu, 04 Sep 2014 20:49:40 -0000
Content-Type: text/plain; charset=UTF-8

On 4 September 2014 09:37, Jonathan Liu <net147@gmail.com> wrote:
> On 5/09/2014 1:28 AM, Dan McGregor wrote:
>>
>> On 4 September 2014 08:33, Jonathan Liu <net147@gmail.com> wrote:
>>>
>>> On 30/08/2014 7:15 AM, Dan McGregor wrote:
>>>>
>>>> From: Dan McGregor <dan.mcgregor@usask.ca>
>>>>
>>>> ASan and TSan are useful debugging tools, enable them on the
>>>> target and add the packages to packagegroup-core-sdk.
>>>>
>>>> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
>>>> ---
>>>>    .../recipes-core/packagegroups/packagegroup-core-sdk.bb |  4 +++-
>>>>    meta/recipes-devtools/gcc/gcc-runtime.inc               | 17
>>>> +++++++++++++++++
>>>>    2 files changed, 20 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
>>>> b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
>>>> index a544bbd..378336e 100644
>>>> --- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
>>>> +++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
>>>> @@ -28,7 +28,9 @@ RDEPENDS_packagegroup-core-sdk = "\
>>>>
>>>>    RRECOMMENDS_packagegroup-core-sdk = "\
>>>>        libgomp \
>>>> -    libgomp-dev"
>>>> +    libgomp-dev \
>>>> +    libsanitizer \
>>>> +    libsanitizer-dev"
>>>>
>>>>    #python generate_sdk_pkgs () {
>>>>    #    poky_pkgs = read_pkgdata('packagegroup-core', d)['PACKAGES']
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
>>>> b/meta/recipes-devtools/gcc/gcc-runtime.inc
>>>> index 7ce84f1..109f8dd 100644
>>>> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
>>>> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
>>>> @@ -11,6 +11,8 @@ EXTRA_OECONF_PATHS = "\
>>>>    EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
>>>>
>>>>    RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic"
>>>> +RUNTIMETARGET_append_arm = " libsanitizer"
>>>> +RUNTIMETARGET_append_x86 = " libsanitizer"
>>>>    #  ?
>>>>    # libiberty
>>>>    # libmudflap
>>>> @@ -88,6 +90,9 @@ PACKAGES = "\
>>>>        libatomic \
>>>>        libatomic-dev \
>>>>        libatomic-staticdev \
>>>> +    libsanitizer \
>>>> +    libsanitizer-dev \
>>>> +    libsanitizer-staticdev \
>>>>    "
>>>>    # The base package doesn't exist, so we clear the recommends.
>>>>    RRECOMMENDS_${PN}-dbg = ""
>>>> @@ -171,6 +176,18 @@ FILES_libatomic-dev = "\
>>>>    "
>>>>    FILES_libatomic-staticdev = "${libdir}/libatomic.a"
>>>>
>>>> +FILES_libsanitizer = "${libdir}/libasan.so.* ${libdir}/libubsan.so.*"
>>>> +FILES_libsanitizer-dev = " \
>>>> +  ${libdir}/libsanitizer.spec \
>>>> +  ${libdir}/libasan_preinit.o \
>>>> +  ${libdir}/libasan.so \
>>>> +  ${libdir}/libubsan.so \
>>>> +  ${libdir}/libasan.la \
>>>> +  ${libdir}/libubsan.la"
>>>> +FILES_libsanitizer-staticdev = " \
>>>> +  ${libdir}/libasan.a \
>>>> +  ${libdir}/libubsan.a"
>>>> +
>>>>    do_package_write_ipk[depends] +=
>>>> "virtual/${MLPREFIX}libc:do_packagedata"
>>>>    do_package_write_deb[depends] +=
>>>> "virtual/${MLPREFIX}libc:do_packagedata"
>>>>    do_package_write_rpm[depends] +=
>>>> "virtual/${MLPREFIX}libc:do_packagedata"
>>>
>>> I get the following error during do_install for gcc-runtime on Arch Linux
>>> x86_64 host when it is linking libasan:
>>> /usr/lib/libpthread.a: error adding symbols: File format not recognized
>>>
>> What machine are you building for? Or is this the SDK that's failing?
>> This error looks like it's trying to link against the host's pthread
>> library.
>>
>> I tested this on Fedora 20 x86_64.
>
> I am building for ARMv7 device. I tested your v3 "gcc-runtime: enable
> sanitizer" patch as well with the same result (bitbake gcc-runtime).
> It is same issue as posted on opemembedded-devel some months ago:
> http://permalink.gmane.org/gmane.comp.handhelds.openembedded/63689
> When running do_install for gcc-runtime, it relinks libasan and has
> -L/usr/lib in the command line when linking libasan.so because libasan.la
> contains:
> libdir='/usr/lib'.
>
> The log.do_install file indicates:
> warning: library search path "/usr/lib" is unsafe for cross-compilation
>
> On your host system, do you have /usr/lib/libpthread.a?
> Does your log.do_install indicate the that libasan.so is linked with
> -L/usr/lib search path with "warning: library search path "/usr/lib" is
> unsafe for cross-compilation"?
>

I'm not getting the QA warning. I'm not sure why; in my logs I'm
seeing that it's trying to use /usr/lib,
but ld continues on its merry way after it finds the real library in
the sysroot. I'm noting two problems with my change:

1) gcc-runtime now depends on glibc being in the sysroot

and

2) libsanitizer insists on using adding -L/usr/lib to the link
command. It seems to be because it uses libstc++'s .la file that was
just built AND the one installed already.
I wonder what happens if libsanitizer gets installed before libstdc++.

> Regards,
> Jonathan

