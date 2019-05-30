Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 88D457E33D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 05:58:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4U5vwRh012782
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 May 2019 22:58:08 -0700
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Wed, 29 May 2019 22:57:47 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <5a62beea5ad46e24bc1e59c5cf9938799c0e3d12.camel@linuxfoundation.org>
	<1559120138-3450-1-git-send-email-mingli.yu@windriver.com>
	<ba81c9ea11db351bde7fec1c40c2f57495c3fdec.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5CEF723B.2060709@windriver.com>
Date: Thu, 30 May 2019 14:03:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <ba81c9ea11db351bde7fec1c40c2f57495c3fdec.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.170]
Subject: Re: [PATCH v3] elfutils: fix ptest failures
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
X-List-Received-Date: Thu, 30 May 2019 05:58:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年05月29日 18:13, richard.purdie@linuxfoundation.org wrote:
> On Wed, 2019-05-29 at 16:55 +0800, mingli.yu@windriver.com wrote:
>> From: Mingli Yu <Mingli.Yu@windriver.com>
>>
>> * Add missing -ptest package dependency (needs
>>    ${PN}-dev)
>>
>> * Add missing files which needed by ptest test
>>    to fix the ptest failures such as:
>>    | sh: ../src/elflint: No such file or directory
>>    | FAIL: asm-tst4
>>
>> * Rework 0001-skip-the-test-when-gcc-not-deployed.patch
>>    to skip the tests which depend on gcc
>>
>> * Define INHIBIT_PACKAGE_STRIP_FILES for elfutils to
>>    avoid stripping some generated binaries otherwise
>>    some of the tests such as test-nlist, run-strip-reloc.sh,
>>    run-strip-strmerge.sh and so on will fail
>>
>> Before:
>> --------------------------------------------
>> Recipe   | Passed    | Failed   | Skipped
>> --------------------------------------------
>> elfutils | 176       | 23       | 4
>> --------------------------------------------
>>
>> After:
>> --------------------------------------------
>> Recipe   | Passed    | Failed   | Skipped
>> --------------------------------------------
>> elfutils | 199       | 0       | 4
>> --------------------------------------------
>>
>> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>> ---
>>   meta/recipes-devtools/elfutils/elfutils_0.176.bb   | 34 ++++++++++++++++++-
>>   .../0001-skip-the-test-when-gcc-not-deployed.patch | 38 +++++++++++++++++++---
>>   2 files changed, 66 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.176.bb b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
>> index 157551e..93d0c78 100644
>> --- a/meta/recipes-devtools/elfutils/elfutils_0.176.bb
>> +++ b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
>> @@ -44,7 +44,7 @@ inherit autotools gettext ptest
>>
>>   EXTRA_OECONF = "--program-prefix=eu- --without-lzma"
>>   EXTRA_OECONF_append_class-native = " --without-bzlib"
>> -RDEPENDS_${PN}-ptest = "libasm libelf bash make coreutils ${PN}-binutils ${PN}"
>> +RDEPENDS_${PN}-ptest = "libasm libelf bash make coreutils ${PN}-binutils ${PN} ${PN}-dev"
>>
>>   EXTRA_OECONF_append_class-target += "--disable-tests-rpath"
>>
>> @@ -61,6 +61,16 @@ do_compile_ptest() {
>>
>>   do_install_ptest() {
>>   	if [ ${PTEST_ENABLED} = "1" ]; then
>> +		# copy the files which needed by the cases
>> +		TEST_FILES="strip strip.o addr2line elfcmp objdump readelf size.o nm.o nm elflint"
>> +		install -d -m 755                       ${D}${PTEST_PATH}/src
>> +		install -d -m 755                       ${D}${PTEST_PATH}/libelf
>> +		install -d -m 755                       ${D}${PTEST_PATH}/libdw
>> +		for test_file in ${TEST_FILES}; do
>> +			cp -r ${B}/src/${test_file} ${D}${PTEST_PATH}/src
>> +		done
>> +		ln -s ${libdir}/libelf.so ${D}${PTEST_PATH}/libelf/libelf.so
>> +		ln -s ${libdir}/libdw.so ${D}${PTEST_PATH}/libdw/libdw.so
>>   		cp -r ${S}/tests/                       ${D}${PTEST_PATH}
>>   		cp -r ${B}/tests/*                      ${D}${PTEST_PATH}/tests
>>   		cp -r ${B}/config.h                     ${D}${PTEST_PATH}
>> @@ -109,3 +119,25 @@ FILES_libdw  = "${libdir}/libdw-${PV}.so ${libdir}/libdw.so.* ${libdir}/elfutils
>>
>>   # The package contains symlinks that trip up insane
>>   INSANE_SKIP_${MLPREFIX}libdw = "dev-so"
>> +INSANE_SKIP_${PN}-ptest += "dev-deps"
>> +
>> +# avoid stripping some generated binaries otherwise some of the tests such as test-nlist,
>> +# run-strip-reloc.sh, run-strip-strmerge.sh and so on will fail
>> +INHIBIT_PACKAGE_STRIP_FILES = "\
>> +    ${PKGD}${PTEST_PATH}/tests/test-nlist \
>> +    ${PKGD}${PTEST_PATH}/tests/elfstrmerge \
>> +    ${PKGD}${PTEST_PATH}/tests/backtrace-child \
>> +    ${PKGD}${PTEST_PATH}/tests/backtrace-data \
>> +    ${PKGD}${PTEST_PATH}/tests/deleted \
>> +    ${PKGD}${PTEST_PATH}/src/strip \
>> +    ${PKGD}${PTEST_PATH}/src/addr2line \
>> +    ${PKGD}${PTEST_PATH}/src/elfcmp \
>> +    ${PKGD}${PTEST_PATH}/src/objdump \
>> +    ${PKGD}${PTEST_PATH}/src/readelf \
>> +    ${PKGD}${PTEST_PATH}/src/nm \
>> +    ${PKGD}${PTEST_PATH}/src/elflint \
>> +    ${PKGD}${libdir}/libelf-${PV}.so \
>> +    ${PKGD}${libdir}/libdw-${PV}.so \
>
> This looks better, except for the two libdir lines above. This will
> inflate main image sizes just to make tests work :(.

>
> We're going to need to fine another way to handle this as I'd imagine
> the size increase is substancial.
>
> It may be worth asking upstream whether they'd accept the tests using
> the debug link mechanism we use to find extra symbol information?

Without the two libdir lines, most cases will fail. And even upstream 
changes to the debug link mechanism, we still need to make -ptest 
rdepends on -dbg. But I'm not sure upstream can make some move.

BTW, How about use the below solution? if so, all tests pass and we 
don't need -ptest rdepends on -dev and -dbg anyway. Will send out V4.

+ cp ${D}${libdir}/libelf-${PV}.so ${D}${PTEST_PATH}/libelf/libelf.so
+ cp ${D}${libdir}/libdw-${PV}.so ${D}${PTEST_PATH}/libdw/libdw.so

Thanks,

>
> Cheers,
>
> Richard
>
>

