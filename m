Return-Path: <Kai.Kang@windriver.com>
X-Greylist: delayed 9266 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 04 Feb 2020 12:00:06 UTC
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B1781610D9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 12:00:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0149PdmG014340
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 4 Feb 2020 01:25:40 -0800 (PST)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 4 Feb 2020 01:25:39 -0800
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20200203091406.37643-1-kai.kang@windriver.com>
	<B90E2425-D2BC-411A-B3CF-E3B31614A8DE@gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <4d47a7c5-d60a-2fcc-3a4d-a716727bbcbd@windriver.com>
Date: Tue, 4 Feb 2020 17:24:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <B90E2425-D2BC-411A-B3CF-E3B31614A8DE@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ifupdown: add ptest
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
X-List-Received-Date: Tue, 04 Feb 2020 12:00:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2020/2/3 下午8:50, Alexander Kanavin wrote:
> I think a build configuration for this also needs to be enabled and tested as explained in the email thread from the bug (in magefeatures.py from selftest I think). Otherwise this wouldn’t be built or checked anywhere.

Hi Alex,

In imagefeatures.py, it just run 'bitbake -g core-image-sato' and 
doesn't really build and test RDEPENDS packages of 
packagegroup-core-base-utils.

So for the packages in the RDEPENDS packages of 
packagegroup-core-base-utils but not in any image, they all are not be 
tested.

I didn't find a proper recipe to place these recipes. Maybe a new image 
recipe need to be created.

Regards,
Kai



>
> Alex
>
>> On 3 Feb 2020, at 10.14, <kai.kang@windriver.com> <kai.kang@windriver.com> wrote:
>>
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Add ptest for ifupdown with its own test cases.
>>
>> [Yocto #13736]
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>> meta/recipes-core/ifupdown/files/run-ptest    |  4 ++
>> .../ifupdown/files/tweak-ptest-script.patch   | 49 +++++++++++++++++++
>> meta/recipes-core/ifupdown/ifupdown_0.8.35.bb | 10 +++-
>> 3 files changed, 62 insertions(+), 1 deletion(-)
>> create mode 100644 meta/recipes-core/ifupdown/files/run-ptest
>> create mode 100644 meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
>>
>> diff --git a/meta/recipes-core/ifupdown/files/run-ptest b/meta/recipes-core/ifupdown/files/run-ptest
>> new file mode 100644
>> index 0000000000..8694042392
>> --- /dev/null
>> +++ b/meta/recipes-core/ifupdown/files/run-ptest
>> @@ -0,0 +1,4 @@
>> +#!/bin/sh
>> +
>> +CURDIR=$(dirname `readlink -f $0`)
>> +cd $CURDIR/tests && ./testbuild-linux
>> diff --git a/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch b/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
>> new file mode 100644
>> index 0000000000..d7600cf243
>> --- /dev/null
>> +++ b/meta/recipes-core/ifupdown/files/tweak-ptest-script.patch
>> @@ -0,0 +1,49 @@
>> +Tweak tests of ifupdown to make it work with oe-core ptest framework.
>> +
>> +Upstream-Status: Inappropriate [oe-core specific]
>> +
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +
>> +diff --git a/tests/testbuild-linux b/tests/testbuild-linux
>> +index 1181ea0..d5c1814 100755
>> +--- a/tests/testbuild-linux
>> ++++ b/tests/testbuild-linux
>> +@@ -1,6 +1,7 @@
>> + #!/bin/sh -e
>> +
>> +-dir=tests/linux
>> ++curdir=$(dirname `readlink -f $0`)
>> ++dir=$curdir/linux
>> +
>> + result=true
>> + for test in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18; do
>> +@@ -12,7 +13,7 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18; do
>> +         echo "Testcase $test: $args"
>> +
>> +    exitcode=0
>> +-        ./ifup -v --no-act-commands --force -i $dir/testcase.$test --state-dir=$dir/state.$test $args \
>> ++        ifup -v --no-act-commands --force -i $dir/testcase.$test --state-dir=$dir/state.$test $args \
>> +                 >$dir/up-res-out.$test 2>$dir/up-res-err.$test || exitcode=$?
>> +
>> +         (echo "exit code: $exitcode";
>> +@@ -20,7 +21,7 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18; do
>> +          echo "====stderr===="; cat $dir/up-res-err.$test) > $dir/up-res.$test
>> +
>> +    exitcode=0
>> +-        ./ifdown -v --no-act-commands --force -i $dir/testcase.$test --state-dir=$dir/state.$test $args \
>> ++        ifdown -v --no-act-commands --force -i $dir/testcase.$test --state-dir=$dir/state.$test $args \
>> +                >$dir/down-res-out.$test 2>$dir/down-res-err.$test || exitcode=$?
>> +
>> +         (echo "exit code: $exitcode";
>> +@@ -28,9 +29,9 @@ for test in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18; do
>> +          echo "====stderr===="; cat $dir/down-res-err.$test) > $dir/down-res.$test
>> +
>> +         if diff -ub $dir/up.$test $dir/up-res.$test && diff -ub $dir/down.$test $dir/down-res.$test; then
>> +-                echo "(okay)"
>> ++                echo "PASS: $test"
>> +         else
>> +-                echo "(failed)"
>> ++                echo "FAIL: $test"
>> +                 result=false
>> +         fi
>> +         echo "=========="
>> diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
>> index 0de97fe372..53cb971d33 100644
>> --- a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
>> +++ b/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
>> @@ -11,13 +11,15 @@ SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https \
>>             file://99_network \
>>             file://0001-Define-FNM_EXTMATCH-for-musl.patch \
>>             file://0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch \
>> +           file://run-ptest \
>> +           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'file://tweak-ptest-script.patch', '', d)} \
>>             "
>> SRCREV = "4af76318cfc57f8e4a44d357104188666213bd4b"
>>
>> S = "${WORKDIR}/git"
>>
>>
>> -inherit update-alternatives
>> +inherit ptest update-alternatives
>>
>> do_compile () {
>>     chmod a+rx *.pl *.sh
>> @@ -40,6 +42,12 @@ do_install () {
>>     cd ${D}${mandir}/man8 && ln -s ifup.8 ifdown.8
>> }
>>
>> +do_install_ptest () {
>> +    install -d ${D}${PTEST_PATH}/tests
>> +    cp -r ${S}/tests/testbuild-linux ${D}${PTEST_PATH}/tests/
>> +    cp -r ${S}/tests/linux ${D}${PTEST_PATH}/tests/
>> +}
>> +
>> ALTERNATIVE_PRIORITY = "100"
>> ALTERNATIVE_${PN} = "ifup ifdown"
>>
>> -- 
>> 2.17.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
Kai Kang


