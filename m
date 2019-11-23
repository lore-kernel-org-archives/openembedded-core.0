Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CCE9E7F9A7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 22:15:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xANMFohM024153
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 23 Nov 2019 14:15:50 -0800 (PST)
Received: from [128.224.23.181] (128.224.23.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Sat, 23 Nov 2019 14:15:49 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20191121174318.4512-1-Trevor.Gamblin@windriver.com>
	<20191121174318.4512-2-Trevor.Gamblin@windriver.com>
	<259c97ddeba6c67c8506eba66a8e4fdbc502dc1d.camel@linuxfoundation.org>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <73d24dc7-e50e-b9a2-992d-e8cad7a1f77a@windriver.com>
Date: Sat, 23 Nov 2019 17:15:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <259c97ddeba6c67c8506eba66a8e4fdbc502dc1d.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/1] coreutils: add ptest
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
X-List-Received-Date: Sat, 23 Nov 2019 22:15:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11/23/19 7:50 AM, Richard Purdie wrote:
> On Thu, 2019-11-21 at 12:43 -0500, Trevor Gamblin wrote:
>> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>>
>> coreutils has a large number of tests, (and potential RDEPENDS
>> to support them), including tests added with the flags
>> RUN_EXPENSIVE_TESTS and RUN_VERY_EXPENSIVE_TESTS that add
>> significant run time for their coverage. The RUN_VERY_EXPENSIVE_TESTS
>> option has been omitted from the run-ptest script to reduce
>> some of this run time, even though this increases the SKIP count
>> in the results. Also, the ptest directory for coreutils is given
>> blanket permissions at runtime with chmod -R 777 to ensure that
>> the user created for the tests will be able to run the test
>> scripts and create the necessary files in the process.
>>
>> There is still room to improve the results of this ptest without
>> the aforementioned additions. Of the tests marked SKIP, there
>> are 30 tests that are currently counted as SKIP because they
>> require root permissions, and another 21 that require membership
>> in multiple user groups. It is important to know that coreutils
>> has tests for both root and non-root users. Testing showed that
>> 42 tests are skipped when running as root versus 30 when running
>> as a non-root user, so the decision was made to run the suite as
>> the latter.
>>
>> Finally, note that the ptest suite for coreutils has a short
>> runtime on x86-64/kvm of approximately 4.5 minutes, in contrast
>> to the arm64 runtime of ~70 minutes.
> Its good to see this coming together thanks. Unfortunately it failed in
> testing.
>
>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>> ---
>>   .../coreutils/coreutils/run-ptest             | 17 +++++++++
>>   meta/recipes-core/coreutils/coreutils_8.31.bb | 38 +++++++++++++++++++
>>   2 files changed, 55 insertions(+)
>>   create mode 100755 meta/recipes-core/coreutils/coreutils/run-ptest
>>
>> diff --git a/meta/recipes-core/coreutils/coreutils/run-ptest b/meta/recipes-core/coreutils/coreutils/run-ptest
>> new file mode 100755
>> index 0000000000..683fedee7a
>> --- /dev/null
>> +++ b/meta/recipes-core/coreutils/coreutils/run-ptest
>> @@ -0,0 +1,17 @@
>> +#!/bin/bash
>> +
>> +COREUTILSLIB=/usr/lib/coreutils
>> +LOG="${COREUTILSLIB}/ptest/coreutils_ptest_$(date +%Y%m%d-%H%M%S).log"
>> +
>> +addgroup usergroup1
>> +adduser --ingroup usergroup1 tester
>> +
>> +su tester -c "make check-TESTS RUN_EXPENSIVE_TESTS=yes top_srcdir=. srcdir=." | tee -a ${LOG}
>> +deluser tester
>> +delgroup usergroup1
>> +
>> +passed=`grep PASS ${LOG}|wc -l`
>> +failed=`grep FAIL ${LOG}|wc -l`
>> +skipped=`grep -E SKIP ${LOG}|wc -l`
>> +all=$((passed + failed + skipped))
>> +
>> diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb b/meta/recipes-core/coreutils/coreutils_8.31.bb
>> index 57b2c1bdba..5ce2730048 100644
>> --- a/meta/recipes-core/coreutils/coreutils_8.31.bb
>> +++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
>> @@ -143,3 +143,41 @@ python __anonymous() {
>>   }
>>   
>>   BBCLASSEXTEND = "native nativesdk"
>> +
>> +inherit ptest
>> +
>> +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
>> +
>> +SRC_URI += 	"file://run-ptest"
>
> Parsing recipes...WARNING: /home/pokybuild/yocto-worker/musl-qemux86/build/meta/recipes-core/coreutils/coreutils_8.31.bb: Unable to get checksum for coreutils SRC_URI entry run-ptestfile: file could not be found
>
> I think this is a whitespace problem in SRC_URI where file from another
> url is being added to the string above.
>
>> +RDEPENDS_${PN}-ptest += "bash findutils gawk gdb glibc libconvert-asn1-perl liberror-perl libmodule-build-perl libtimedate-perl liburi-perl make perl perl-module-file-stat python strace"
> Using glibc here breaks musl builds.
>
>
> In the next version could you please also update:
>
> meta/conf/distro/include/ptest-packagelists.inc
>
> (this would be a slow ptest)
Will do - v2 incoming. Thanks for the catch.
> Cheers,
>
> Richard
>

