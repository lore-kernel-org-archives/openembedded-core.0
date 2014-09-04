Return-Path: <danismostlikely@gmail.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 756E0713E3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 15:28:49 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id x13so10550427qcv.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Sep 2014 08:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=PUpK7L5GXRbkI1jEOsaxPgNsbuGQPVbG/LxFxVfoeqM=;
	b=o++fGe3q0/Ocfws6pRaxdnzSnn81dHJQ+30/8OP124SRNMhjQmf9lNFuDkYXUCaFmV
	itwLJOlXvSHSN0IXMxhdL4oivTtZafHAl0ZAaBAiq8Hh/zto1MkNnM1XvasWCVKfFeQm
	vZX3NCgB1ToY5R+gdncqYDj94oMKYWd+E6RXoPHtSCPOVNSEhnfsw3N8YoFrazHuHCcU
	nM39ioZGVzkhyDbFGSGHBBcvFK8TP1k48d0+rMhUR+6O0f1JqFaY4tV3rkjPYTnpM36l
	FSgIKQ4jyuvfO0fVp3ri/aHQeIXddmD3sokwKTEjh7ZJPTK/buFjbCpzS66ypP966mWU
	8RHA==
MIME-Version: 1.0
X-Received: by 10.224.173.7 with SMTP id n7mr8166516qaz.15.1409844530158; Thu,
	04 Sep 2014 08:28:50 -0700 (PDT)
Received: by 10.96.205.134 with HTTP; Thu, 4 Sep 2014 08:28:50 -0700 (PDT)
In-Reply-To: <5408781E.3070708@gmail.com>
References: <CACS+7ZS3J37=hLKBTfs7GvEEcXmVU1RPr_Ryvty2BawoBw+BVQ@mail.gmail.com>
	<5408781E.3070708@gmail.com>
Date: Thu, 4 Sep 2014 09:28:50 -0600
Message-ID: <CACS+7ZQYOB6-nwmQ=dyHbj4Bg29Ce_iAuMtUBTZGkfDc8GfW+A@mail.gmail.com>
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
X-List-Received-Date: Thu, 04 Sep 2014 15:28:55 -0000
Content-Type: text/plain; charset=UTF-8

On 4 September 2014 08:33, Jonathan Liu <net147@gmail.com> wrote:
> On 30/08/2014 7:15 AM, Dan McGregor wrote:
>>
>> From: Dan McGregor <dan.mcgregor@usask.ca>
>>
>> ASan and TSan are useful debugging tools, enable them on the
>> target and add the packages to packagegroup-core-sdk.
>>
>> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
>> ---
>>   .../recipes-core/packagegroups/packagegroup-core-sdk.bb |  4 +++-
>>   meta/recipes-devtools/gcc/gcc-runtime.inc               | 17
>> +++++++++++++++++
>>   2 files changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
>> b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
>> index a544bbd..378336e 100644
>> --- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
>> +++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
>> @@ -28,7 +28,9 @@ RDEPENDS_packagegroup-core-sdk = "\
>>
>>   RRECOMMENDS_packagegroup-core-sdk = "\
>>       libgomp \
>> -    libgomp-dev"
>> +    libgomp-dev \
>> +    libsanitizer \
>> +    libsanitizer-dev"
>>
>>   #python generate_sdk_pkgs () {
>>   #    poky_pkgs = read_pkgdata('packagegroup-core', d)['PACKAGES']
>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
>> b/meta/recipes-devtools/gcc/gcc-runtime.inc
>> index 7ce84f1..109f8dd 100644
>> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
>> @@ -11,6 +11,8 @@ EXTRA_OECONF_PATHS = "\
>>   EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
>>
>>   RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic"
>> +RUNTIMETARGET_append_arm = " libsanitizer"
>> +RUNTIMETARGET_append_x86 = " libsanitizer"
>>   #  ?
>>   # libiberty
>>   # libmudflap
>> @@ -88,6 +90,9 @@ PACKAGES = "\
>>       libatomic \
>>       libatomic-dev \
>>       libatomic-staticdev \
>> +    libsanitizer \
>> +    libsanitizer-dev \
>> +    libsanitizer-staticdev \
>>   "
>>   # The base package doesn't exist, so we clear the recommends.
>>   RRECOMMENDS_${PN}-dbg = ""
>> @@ -171,6 +176,18 @@ FILES_libatomic-dev = "\
>>   "
>>   FILES_libatomic-staticdev = "${libdir}/libatomic.a"
>>
>> +FILES_libsanitizer = "${libdir}/libasan.so.* ${libdir}/libubsan.so.*"
>> +FILES_libsanitizer-dev = " \
>> +  ${libdir}/libsanitizer.spec \
>> +  ${libdir}/libasan_preinit.o \
>> +  ${libdir}/libasan.so \
>> +  ${libdir}/libubsan.so \
>> +  ${libdir}/libasan.la \
>> +  ${libdir}/libubsan.la"
>> +FILES_libsanitizer-staticdev = " \
>> +  ${libdir}/libasan.a \
>> +  ${libdir}/libubsan.a"
>> +
>>   do_package_write_ipk[depends] +=
>> "virtual/${MLPREFIX}libc:do_packagedata"
>>   do_package_write_deb[depends] +=
>> "virtual/${MLPREFIX}libc:do_packagedata"
>>   do_package_write_rpm[depends] +=
>> "virtual/${MLPREFIX}libc:do_packagedata"
>
> I get the following error during do_install for gcc-runtime on Arch Linux
> x86_64 host when it is linking libasan:
> /usr/lib/libpthread.a: error adding symbols: File format not recognized
>

What machine are you building for? Or is this the SDK that's failing?
This error looks like it's trying to link against the host's pthread library.

I tested this on Fedora 20 x86_64.

> Regards,
> Jonathan

