Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A8956184F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 13:37:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01SDaLvj009157
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 28 Feb 2020 05:36:32 -0800
Received: from [128.224.56.228] (128.224.56.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 28 Feb 2020 05:36:11 -0800
To: Anuj Mittal <anuj.mittal@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20200226180746.121476-1-trevor.gamblin@windriver.com>
	<20200226180746.121476-2-trevor.gamblin@windriver.com>
	<9c7ef360-2a30-2783-5c35-3caa7987954c@intel.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <5391de85-0780-5890-b47f-1969861c08b8@windriver.com>
Date: Fri, 28 Feb 2020 08:36:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9c7ef360-2a30-2783-5c35-3caa7987954c@intel.com>
X-Originating-IP: [128.224.56.228]
Subject: Re: [PATCH 1/2 v3] coreutils: add ptest
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
X-List-Received-Date: Fri, 28 Feb 2020 13:37:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 2/27/20 10:59 PM, Anuj Mittal wrote:
>
>
> On 27-Feb-20 02:07 AM, Trevor Gamblin wrote:
>> coreutils has a large number of tests, including some added by the
>> Makefile flags RUN_EXPENSIVE_TESTS and RUN_VERY_EXPENSIVE_TESTS that
>> significantly increase runtime (and which have been disabled). Note
>> that the coreutils ptest directory is given blanket permissions at
>> runtime with chmod -R 777, to ensure that the user created for the
>> tests will be able to run the test scripts and create the necessary
>> files in the process without being impeded by permissions issues.
>>
>> There is still room to improve the results of this ptest without
>> the aforementioned additions. Of the tests marked SKIP, there are
>> 30 tests that are currently counted as SKIP because they require
>> sudo permissions, and another 21 that require membership in
>> multiple user groups. It is important to know that coreutils has
>> tests for both root and non-root users. Testing showed that 42
>> tests are skipped when running as root versus 30 when running as a
>> non-root user, so the decision was made to run the suite as the
>> latter. Additionally, gdb, valgrind, and strace could be included
>> in the RDEPENDS list to increase pass rate, but their total
>> contribution is 13 tests, so they were omitted to reduce image size.
>>
>> Finally, note that at least one ptest (misc/head-write-error.sh) is
>> prone to ERROR on builds of core-image-minimal if extra space is
>> not provided with IMAGE_ROOTFS_EXTRA_SPACE.
>>
>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>> ---
>>   .../coreutils/coreutils/run-ptest             | 17 +++++++++
>>   meta/recipes-core/coreutils/coreutils_8.31.bb | 37 +++++++++++++++++++
>>   2 files changed, 54 insertions(+)
>>   create mode 100755 meta/recipes-core/coreutils/coreutils/run-ptest
>>
>> diff --git a/meta/recipes-core/coreutils/coreutils/run-ptest 
>> b/meta/recipes-core/coreutils/coreutils/run-ptest
>> new file mode 100755
>> index 0000000000..6d4a7b365d
>> --- /dev/null
>> +++ b/meta/recipes-core/coreutils/coreutils/run-ptest
>> @@ -0,0 +1,17 @@
>> +#!/bin/sh
>> +
>> +# remove any stale lock files so that the calls to groupadd/useradd 
>> don't stop
>> +# the ptest if re-using the same image
>> +rm -rf /etc/passwd.lock /etc/group.lock /etc/gshadow.lock
>> +
>> +COREUTILSLIB=@libdir@/coreutils
>> +LOG="${COREUTILSLIB}/ptest/coreutils_ptest_$(date +%Y%m%d-%H%M%S).log"
>> +USERNAME="tester"
>> +groupadd ugroup1
>> +groupadd ugroup2
>> +useradd -G ugroup1,ugroup2 $USERNAME || echo "user $USERNAME already 
>> exists"
>> +
>> +su tester -c "cd ${COREUTILSLIB}/ptest && make check-TESTS 
>> top_srcdir=. srcdir=." 2>&1 | tee -a ${LOG}
>> +userdel $USERNAME
>> +groupdel ugroup1
>> +groupdel ugroup2
>> diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb 
>> b/meta/recipes-core/coreutils/coreutils_8.31.bb
>> index 57b2c1bdba..8bec4e0f3c 100644
>> --- a/meta/recipes-core/coreutils/coreutils_8.31.bb
>> +++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
>> @@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
>> file://0001-uname-report-processor-and-hardware-correctly.patch \
>>              file://disable-ls-output-quoting.patch \
>> file://0001-local.mk-fix-cross-compiling-problem.patch \
>> +           file://run-ptest \
>>             "
>>     SRC_URI_append_libc-musl = 
>> "file://strtod_fix_clash_with_strtold.patch"
>> @@ -143,3 +144,39 @@ python __anonymous() {
>>   }
>>     BBCLASSEXTEND = "native nativesdk"
>> +
>> +inherit ptest
>> +
>> +RDEPENDS_${PN}-ptest += "bash findutils gawk liberror-perl 
>> libmodule-build-perl make perl perl-module-file-stat python3-core sed 
>> shadow"
>> +
>> +do_install_ptest () {
>> +    install -d ${D}${PTEST_PATH}/tests
>> +    cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests
>> +    sed -i 's/ginstall/install/g'  `grep -R ginstall 
>> ${D}${PTEST_PATH}/tests | awk -F: '{print $1}' | uniq`
>> +    install -d ${D}${PTEST_PATH}/build-aux
>> +    install ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
>> +    cp ${B}/Makefile ${D}${PTEST_PATH}/
>> +    cp ${S}/init.cfg ${D}${PTEST_PATH}/
>> +    cp -r ${B}/src ${D}${PTEST_PATH}/
>> +    cp -r ${S}/src/*.c ${D}${PTEST_PATH}/src
>> +    sed -i '/^VPATH/s/= .*$/= ./g' ${D}${PTEST_PATH}/Makefile
>> +    sed -i '/^PROGRAMS/s/^/#/g' ${D}${PTEST_PATH}/Makefile
>> +    sed -i '/^Makefile: /s/^.*$/Makefile:/g' ${D}${PTEST_PATH}/Makefile
>> +    sed -i '/^abs_srcdir/s/= .*$/= \$\{PWD\}/g' 
>> ${D}${PTEST_PATH}/Makefile
>> +    sed -i '/^abs_top_builddir/s/= .*$/= \$\{PWD\}/g' 
>> ${D}${PTEST_PATH}/Makefile
>> +    sed -i '/^abs_top_srcdir/s/= .*$/= \$\{PWD\}/g' 
>> ${D}${PTEST_PATH}/Makefile
>> +    sed -i '/^built_programs/s/ginstall/install/g' 
>> ${D}${PTEST_PATH}/Makefile
>> +    chmod -R 777 ${D}${PTEST_PATH}
>> +
>> +    # Disable subcase stty-pairs.sh, it will cause test framework hang
>> +    sed -i '/stty-pairs.sh/d' ${D}${PTEST_PATH}/Makefile
>> +
>> +    # Tweak test d_type-check to use python3 instead of python
>> +    sed -i "1s@.*@#!/usr/bin/python3@" 
>> ${WORKDIR}/image/usr/lib/coreutils/ptest/tests/d_type-check
>
> This is assuming /usr/lib and failing with multilib:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/1642/steps/8/logs/step3b 
>
Ah! Good catch. Will resend with the fix.
>
> ERROR: Logfile of failure stored in: 
> /home/pokybuild/yocto-worker/multilib/build/build/tmp/work/core2-64-poky-linux/coreutils/8.31-r0/temp/log.do_install_ptest_base.4366
> Log data follows:
> | DEBUG: Executing shell function do_install_ptest_base
> | sed: can't read 
> /home/pokybuild/yocto-worker/multilib/build/build/tmp/work/core2-64-poky-linux/coreutils/8.31-r0/image/usr/lib/coreutils/ptest/tests/d_type-check: 
> No such file or directory
> | WARNING: 
> /home/pokybuild/yocto-worker/multilib/build/build/tmp/work/core2-64-poky-linux/coreutils/8.31-r0/temp/run.do_install_ptest_base.4366:1 
> exit 2 from 'sed -i "1s@.*@#!/usr/bin/python3@" 
> /home/pokybuild/yocto-worker/multilib/build/build/tmp/work/core2-64-poky-linux/coreutils/8.31-r0/image/usr/lib/coreutils/ptest/tests/d_type-check'
> | ERROR: Execution of 
> '/home/pokybuild/yocto-worker/multilib/build/build/tmp/work/core2-64-poky-linux/coreutils/8.31-r0/temp/run.do_install_ptest_base.4366' 
> failed with exit code 2:
> | sed: can't read 
> /home/pokybuild/yocto-worker/multilib/build/build/tmp/work/core2-64-poky-linux/coreutils/8.31-r0/image/usr/lib/coreutils/ptest/tests/d_type-check: 
> No such file or directory
> | WARNING: 
> /home/pokybuild/yocto-worker/multilib/build/build/tmp/work/core2-64-poky-linux/coreutils/8.31-r0/temp/run.do_install_ptest_base.4366:1 
> exit 2 from 'sed -i "1s@.*@#!/usr/bin/python3@" 
> /home/pokybuild/yocto-worker/multilib/build/build/tmp/work/core2-64-poky-linux/coreutils/8.31-r0/image/usr/lib/coreutils/ptest/tests/d_type-check'
> |
>
> Thanks,
>
> Anuj

