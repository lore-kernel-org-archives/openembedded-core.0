Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4F8D160111
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 09:02:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5Q92F2d011479
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Jun 2019 02:02:15 -0700 (PDT)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Wed, 26 Jun 2019 02:02:14 -0700
To: Matt Madison <matt@madison.systems>, Khem Raj <raj.khem@gmail.com>, Robert
	Yang <liezhi.yang@windriver.com>
References: <20180304210937.29727-1-matt@madison.systems>
	<20180304210937.29727-7-matt@madison.systems>
	<5D0C9F8B.8060109@windriver.com>
	<CAGgRHJoXVPEq-L9iHniD9mQtvC3CGq3-jP7NincOx1gVqCps3g@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5D1335A3.6060508@windriver.com>
Date: Wed, 26 Jun 2019 17:06:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAGgRHJoXVPEq-L9iHniD9mQtvC3CGq3-jP7NincOx1gVqCps3g@mail.gmail.com>
X-Originating-IP: [128.224.162.170]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 06/13] go.bbclass: ptest cleanup and improvements
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
X-List-Received-Date: Wed, 26 Jun 2019 09:02:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年06月25日 20:23, Matt Madison wrote:
> On Fri, Jun 21, 2019 at 2:08 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>
>> Hi Matt,
>>
>> I noticed your commit is the latest update for go-dep ptest. But the
>> go-dep ptest doesn't work in my environment. I'm trying to figure out
>> what's wrong is here though I didn't know much about go.
>
> I went back over the commits, and I don't think I did anything with
> go-dep specifically. I can see that the tests are failing for it, and
> it looks like it's because go-dep's test programs make some
> assumptions about the environment.  For one thing, it needs the go
> compiler installed. It also looks like it's expecting some source
> files to be present... in other words, it's not really designed for a
> cross-build setup, with tests run on the cross-built target. It could
> be messy to work around that, and I'm not sure how useful it would be
> anyway, seeing as how go-dep is more of a build tool.  Might be better
> to just disable ptests for it completely.

Many thanks Matt for your information!
Did you ever run go-dep ptest?
Go through the run-ptest script for go-dep, it actually runs the 
/usr/lib64/go-dep/ptest/github.com/golang/dep/cmd/dep/dep.test whose 
source file is 
https://github.com/golang/dep/blob/master/cmd/dep/dep_test.go.

# pwd
/usr/lib64/go-dep/ptest/github.com/golang/dep/cmd/dep
# ./dep.test
building testdep failed: exit status 1
can't load package: package .: no Go files in 
/usr/lib64/go-dep/ptest/github.com/golang/dep/cmd/dep

Check the logic for 
https://github.com/golang/dep/blob/master/cmd/dep/dep_test.go, it try to 
run "go build -o testdep" at its start. And the go compiler exist on our 
target, but I don't know what go files the dep_test.go expects.

Hi Khem,

Do you have any suggestion?

Thanks,

>
> BTW, you can have the test programs generate verbose output by setting
> GOPTESTFLAGS = "-test.v" in the recipe, which will add that flag to
> their invocation in the wrapper script, or by manually running the
> test program on the target and passing that flag (cd into the
> directory where the test program is located, then run it with
> -test.v).
>
> Regards,
> -Matt
>
>>
>> BTW, Could you help to check?
>>
>> root@qemux86-64:~# cd /usr/lib64/go-dep/ptest/
>> root@qemux86-64:/usr/lib64/go-dep/ptest# cat run-ptest
>> #!/bin/sh
>> RC=0
>> run_test() (
>>       cd "$1"
>>       ((((./$2 ; echo $? >&3) | sed -r -e"s,^(PASS|SKIP|FAIL)$,\1:
>> $1/$2," >&4) 3>&1) | (read rc; exit $rc)) 4>&1
>>       exit $?)
>> run_test github.com/golang/dep/cmd/dep dep.test || RC=1
>> exit $RC
>> root@qemux86-64:/usr/lib64/go-dep/ptest# ./run-ptest
>> building testdep failed: exit status 1
>> can't load package: package .: no Go files in
>> /usr/lib64/go-dep/ptest/github.com/golang/dep/cmd/dep
>> root@qemux86-64:/usr/lib64/go-dep/ptest#
>>
>> Thanks,
>>
>> On 2018年03月05日 05:09, Matt Madison wrote:
>>> * Don't enable verbose test output (-test.v)
>>>     by default, as it generates too much noise
>>>     for automated results parsing
>>>
>>> * Override do_install_ptest_base in the bbclass,
>>>     so recipes can provide their own modifications
>>>     with do_install_ptest.
>>>
>>> * Improve the generated run-ptest script to better
>>>     handle large numbers of tests, and to generate
>>>     'status: test name' output similar to Automake
>>>     tests.
>>>
>>> * Install all non-vendored 'testdata' directories
>>>     from the source into the ptest package, as some
>>>     packages share test data among multiple tests.
>>>
>>> Signed-off-by: Matt Madison <matt@madison.systems>
>>> ---
>>>    meta/classes/go.bbclass | 87 +++++++++++++++++++++++++++++--------------------
>>>    1 file changed, 51 insertions(+), 36 deletions(-)
>>>
>>> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
>>> index afd68b5951..a51ba3e9f0 100644
>>> --- a/meta/classes/go.bbclass
>>> +++ b/meta/classes/go.bbclass
>>> @@ -26,7 +26,7 @@ GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} -extldflags '${GO_EXTLDFLAGS
>>>    export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS}"
>>>    export GOPATH_OMIT_IN_ACTIONID ?= "1"
>>>    export GOPTESTBUILDFLAGS ?= "${GOBUILDFLAGS} -c"
>>> -export GOPTESTFLAGS ?= "-test.v"
>>> +export GOPTESTFLAGS ?= ""
>>>    GOBUILDFLAGS_prepend_task-compile = "${GO_PARALLEL_BUILD} "
>>>
>>>    export GO = "${HOST_PREFIX}go"
>>> @@ -76,7 +76,7 @@ go_list_packages() {
>>>    }
>>>
>>>    go_list_package_tests() {
>>> -    ${GO} list -f '{{.ImportPath}} {{.TestGoFiles}}' ${GOBUILDFLAGS} ${GO_INSTALL} | \
>>> +     ${GO} list -f '{{.ImportPath}} {{.TestGoFiles}}' ${GOBUILDFLAGS} ${GO_INSTALL} | \
>>>                grep -v '\[\]$' | \
>>>                egrep -v '${GO_INSTALL_FILTEROUT}' | \
>>>                awk '{ print $1 }'
>>> @@ -100,15 +100,16 @@ go_do_compile() {
>>>    do_compile[dirs] =+ "${GOTMPDIR}"
>>>    do_compile[cleandirs] = "${B}/bin ${B}/pkg"
>>>
>>> -do_compile_ptest() {
>>> +do_compile_ptest_base() {
>>>        export TMPDIR="${GOTMPDIR}"
>>> -    rm -f ${B}/.go_compiled_tests.list
>>> +     rm -f ${B}/.go_compiled_tests.list
>>>        go_list_package_tests | while read pkg; do
>>>                cd ${B}/src/$pkg
>>>                ${GO} test ${GOPTESTBUILDFLAGS} $pkg
>>>                find . -mindepth 1 -maxdepth 1 -type f -name '*.test' -exec echo $pkg/{} \; | \
>>>                        sed -e's,/\./,/,'>> ${B}/.go_compiled_tests.list
>>>        done
>>> +     do_compile_ptest
>>>    }
>>>    do_compile_ptest_base[dirs] =+ "${GOTMPDIR}"
>>>
>>> @@ -124,40 +125,54 @@ go_do_install() {
>>>        fi
>>>    }
>>>
>>> -do_install_ptest_base() {
>>> -    test -f "${B}/.go_compiled_tests.list" || exit 0
>>> -    tests=""
>>> -    while read test; do
>>> -        tests="$tests${tests:+ }${test%.test}"
>>> -        testdir=`dirname $test`
>>> -        install -d ${D}${PTEST_PATH}/$testdir
>>> -        install -m 0755 ${B}/src/$test ${D}${PTEST_PATH}/$test
>>> -        if [ -d "${B}/src/$testdir/testdata" ]; then
>>> -            cp --preserve=mode,timestamps -R "${B}/src/$testdir/testdata" ${D}${PTEST_PATH}/$testdir
>>> -        fi
>>> -    done < ${B}/.go_compiled_tests.list
>>> -    if [ -n "$tests" ]; then
>>> -        install -d ${D}${PTEST_PATH}
>>> -        cat >${D}${PTEST_PATH}/run-ptest <<EOF
>>> +go_make_ptest_wrapper() {
>>> +     cat >${D}${PTEST_PATH}/run-ptest <<EOF
>>>    #!/bin/sh
>>> -ANYFAILED=0
>>> -for t in $tests; do
>>> -    testdir=\`dirname \$t.test\`
>>> -    if ( cd "${PTEST_PATH}/\$testdir"; "${PTEST_PATH}/\$t.test" ${GOPTESTFLAGS} | tee /dev/fd/9 | grep -q "^FAIL" ) 9>&1; then
>>> -        ANYFAILED=1
>>> -    fi
>>> -done
>>> -if [ \$ANYFAILED -ne 0 ]; then
>>> -    echo "FAIL: ${PN}"
>>> -    exit 1
>>> -fi
>>> -echo "PASS: ${PN}"
>>> -exit 0
>>> +RC=0
>>> +run_test() (
>>> +    cd "\$1"
>>> +    ((((./\$2 ${GOPTESTFLAGS}; echo \$? >&3) | sed -r -e"s,^(PASS|SKIP|FAIL)\$,\\1: \$1/\$2," >&4) 3>&1) | (read rc; exit \$rc)) 4>&1
>>> +    exit \$?)
>>>    EOF
>>> -        chmod +x ${D}${PTEST_PATH}/run-ptest
>>> -    else
>>> -        rm -rf ${D}${PTEST_PATH}
>>> -    fi
>>> +
>>> +}
>>> +
>>> +go_stage_testdata() {
>>> +     oldwd="$PWD"
>>> +     cd ${S}/src
>>> +     find ${GO_IMPORT} -depth -type d -name testdata | while read d; do
>>> +             if echo "$d" | grep -q '/vendor/'; then
>>> +                     continue
>>> +             fi
>>> +             parent=`dirname $d`
>>> +             install -d ${D}${PTEST_PATH}/$parent
>>> +             cp --preserve=mode,timestamps -R $d ${D}${PTEST_PATH}/$parent/
>>> +     done
>>> +     cd "$oldwd"
>>> +}
>>> +
>>> +do_install_ptest_base() {
>>> +     test -f "${B}/.go_compiled_tests.list" || exit 0
>>> +     install -d ${D}${PTEST_PATH}
>>> +     go_stage_testdata
>>> +     go_make_ptest_wrapper
>>> +     havetests=""
>>> +     while read test; do
>>> +             testdir=`dirname $test`
>>> +             testprog=`basename $test`
>>> +             install -d ${D}${PTEST_PATH}/$testdir
>>> +             install -m 0755 ${B}/src/$test ${D}${PTEST_PATH}/$test
>>> +     echo "run_test $testdir $testprog || RC=1" >> ${D}${PTEST_PATH}/run-ptest
>>> +             havetests="yes"
>>> +     done < ${B}/.go_compiled_tests.list
>>> +     if [ -n "$havetests" ]; then
>>> +             echo "exit \$RC" >> ${D}${PTEST_PATH}/run-ptest
>>> +             chmod +x ${D}${PTEST_PATH}/run-ptest
>>> +     else
>>> +             rm -rf ${D}${PTEST_PATH}
>>> +     fi
>>> +     do_install_ptest
>>> +     chown -R root:root ${D}${PTEST_PATH}
>>>    }
>>>
>>>    EXPORT_FUNCTIONS do_unpack do_configure do_compile do_install
>>>
>

