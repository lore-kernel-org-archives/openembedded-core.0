Return-Path: <net147@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 95B9E71044
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 15:37:46 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id p10so13837266pdj.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Sep 2014 08:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=wP8bgqaqQmatYLsa6kwjuqFosR+8LyjqJ3VfW+E9F+U=;
	b=oBcHZgbpo6Rt69gvKU4ytptENnTFsuGYjJzAmhmdCS1ATxroCKKIEUd4dXmAniGW6c
	EcHMvdKo377Ub1TmOTwU7W7GoYgEzsDW5uRNCci4xKNnLbKuT3JTwoF+LbeAlFaK4kjn
	4Sld9c9r+PRs8OMPesmFkJyC7MV94y5S1bYZxJWOOnHZFiITEpkpNGYaNHqMRmO8ede6
	NQL8AzwcN9cuE8UjIGlkQF/TWfY++wTyMA/ZyHb6qxiLdjgPD2ZAUR772Nv5dW3N3HUS
	+OOcNVlHLBU7croN20BmHxoSwQfDoKCISRIe5wDi3GNtFax73H7LzTEBp4NPQ0IKUfIy
	JhJQ==
X-Received: by 10.66.190.169 with SMTP id gr9mr9520629pac.3.1409845066004;
	Thu, 04 Sep 2014 08:37:46 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id b4sm2005019pdh.21.2014.09.04.08.37.43
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Sep 2014 08:37:45 -0700 (PDT)
Message-ID: <54088743.1010604@gmail.com>
Date: Fri, 05 Sep 2014 01:37:39 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Dan McGregor <danismostlikely@gmail.com>
References: <CACS+7ZS3J37=hLKBTfs7GvEEcXmVU1RPr_Ryvty2BawoBw+BVQ@mail.gmail.com>	<5408781E.3070708@gmail.com>
	<CACS+7ZQYOB6-nwmQ=dyHbj4Bg29Ce_iAuMtUBTZGkfDc8GfW+A@mail.gmail.com>
In-Reply-To: <CACS+7ZQYOB6-nwmQ=dyHbj4Bg29Ce_iAuMtUBTZGkfDc8GfW+A@mail.gmail.com>
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
X-List-Received-Date: Thu, 04 Sep 2014 15:37:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/09/2014 1:28 AM, Dan McGregor wrote:
> On 4 September 2014 08:33, Jonathan Liu <net147@gmail.com> wrote:
>> On 30/08/2014 7:15 AM, Dan McGregor wrote:
>>> From: Dan McGregor <dan.mcgregor@usask.ca>
>>>
>>> ASan and TSan are useful debugging tools, enable them on the
>>> target and add the packages to packagegroup-core-sdk.
>>>
>>> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
>>> ---
>>>    .../recipes-core/packagegroups/packagegroup-core-sdk.bb |  4 +++-
>>>    meta/recipes-devtools/gcc/gcc-runtime.inc               | 17
>>> +++++++++++++++++
>>>    2 files changed, 20 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
>>> b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
>>> index a544bbd..378336e 100644
>>> --- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
>>> +++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
>>> @@ -28,7 +28,9 @@ RDEPENDS_packagegroup-core-sdk = "\
>>>
>>>    RRECOMMENDS_packagegroup-core-sdk = "\
>>>        libgomp \
>>> -    libgomp-dev"
>>> +    libgomp-dev \
>>> +    libsanitizer \
>>> +    libsanitizer-dev"
>>>
>>>    #python generate_sdk_pkgs () {
>>>    #    poky_pkgs = read_pkgdata('packagegroup-core', d)['PACKAGES']
>>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
>>> b/meta/recipes-devtools/gcc/gcc-runtime.inc
>>> index 7ce84f1..109f8dd 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
>>> @@ -11,6 +11,8 @@ EXTRA_OECONF_PATHS = "\
>>>    EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
>>>
>>>    RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic"
>>> +RUNTIMETARGET_append_arm = " libsanitizer"
>>> +RUNTIMETARGET_append_x86 = " libsanitizer"
>>>    #  ?
>>>    # libiberty
>>>    # libmudflap
>>> @@ -88,6 +90,9 @@ PACKAGES = "\
>>>        libatomic \
>>>        libatomic-dev \
>>>        libatomic-staticdev \
>>> +    libsanitizer \
>>> +    libsanitizer-dev \
>>> +    libsanitizer-staticdev \
>>>    "
>>>    # The base package doesn't exist, so we clear the recommends.
>>>    RRECOMMENDS_${PN}-dbg = ""
>>> @@ -171,6 +176,18 @@ FILES_libatomic-dev = "\
>>>    "
>>>    FILES_libatomic-staticdev = "${libdir}/libatomic.a"
>>>
>>> +FILES_libsanitizer = "${libdir}/libasan.so.* ${libdir}/libubsan.so.*"
>>> +FILES_libsanitizer-dev = " \
>>> +  ${libdir}/libsanitizer.spec \
>>> +  ${libdir}/libasan_preinit.o \
>>> +  ${libdir}/libasan.so \
>>> +  ${libdir}/libubsan.so \
>>> +  ${libdir}/libasan.la \
>>> +  ${libdir}/libubsan.la"
>>> +FILES_libsanitizer-staticdev = " \
>>> +  ${libdir}/libasan.a \
>>> +  ${libdir}/libubsan.a"
>>> +
>>>    do_package_write_ipk[depends] +=
>>> "virtual/${MLPREFIX}libc:do_packagedata"
>>>    do_package_write_deb[depends] +=
>>> "virtual/${MLPREFIX}libc:do_packagedata"
>>>    do_package_write_rpm[depends] +=
>>> "virtual/${MLPREFIX}libc:do_packagedata"
>> I get the following error during do_install for gcc-runtime on Arch Linux
>> x86_64 host when it is linking libasan:
>> /usr/lib/libpthread.a: error adding symbols: File format not recognized
>>
> What machine are you building for? Or is this the SDK that's failing?
> This error looks like it's trying to link against the host's pthread library.
>
> I tested this on Fedora 20 x86_64.
I am building for ARMv7 device. I tested your v3 "gcc-runtime: enable 
sanitizer" patch as well with the same result (bitbake gcc-runtime).
It is same issue as posted on opemembedded-devel some months ago: 
http://permalink.gmane.org/gmane.comp.handhelds.openembedded/63689
When running do_install for gcc-runtime, it relinks libasan and has 
-L/usr/lib in the command line when linking libasan.so because 
libasan.la contains:
libdir='/usr/lib'.

The log.do_install file indicates:
warning: library search path "/usr/lib" is unsafe for cross-compilation

On your host system, do you have /usr/lib/libpthread.a?
Does your log.do_install indicate the that libasan.so is linked with 
-L/usr/lib search path with "warning: library search path "/usr/lib" is 
unsafe for cross-compilation"?

Regards,
Jonathan

