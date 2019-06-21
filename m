Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DE3E77E687
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 09:07:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5L97xCF022422
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Jun 2019 02:07:59 -0700 (PDT)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Fri, 21 Jun 2019 02:07:58 -0700
To: Matt Madison <matt@madison.systems>,
	<openembedded-core@lists.openembedded.org>
References: <20180304210937.29727-1-matt@madison.systems>
	<20180304210937.29727-7-matt@madison.systems>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5D0C9F8B.8060109@windriver.com>
Date: Fri, 21 Jun 2019 17:12:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20180304210937.29727-7-matt@madison.systems>
X-Originating-IP: [128.224.162.170]
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
X-List-Received-Date: Fri, 21 Jun 2019 09:07:59 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Matt,

I noticed your commit is the latest update for go-dep ptest. But the 
go-dep ptest doesn't work in my environment. I'm trying to figure out 
what's wrong is here though I didn't know much about go.

BTW, Could you help to check?

root@qemux86-64:~# cd /usr/lib64/go-dep/ptest/
root@qemux86-64:/usr/lib64/go-dep/ptest# cat run-ptest
#!/bin/sh
RC=0
run_test() (
     cd "$1"
     ((((./$2 ; echo $? >&3) | sed -r -e"s,^(PASS|SKIP|FAIL)$,\1: 
$1/$2," >&4) 3>&1) | (read rc; exit $rc)) 4>&1
     exit $?)
run_test github.com/golang/dep/cmd/dep dep.test || RC=1
exit $RC
root@qemux86-64:/usr/lib64/go-dep/ptest# ./run-ptest
building testdep failed: exit status 1
can't load package: package .: no Go files in 
/usr/lib64/go-dep/ptest/github.com/golang/dep/cmd/dep
root@qemux86-64:/usr/lib64/go-dep/ptest#

Thanks,

On 2018年03月05日 05:09, Matt Madison wrote:
> * Don't enable verbose test output (-test.v)
>    by default, as it generates too much noise
>    for automated results parsing
>
> * Override do_install_ptest_base in the bbclass,
>    so recipes can provide their own modifications
>    with do_install_ptest.
>
> * Improve the generated run-ptest script to better
>    handle large numbers of tests, and to generate
>    'status: test name' output similar to Automake
>    tests.
>
> * Install all non-vendored 'testdata' directories
>    from the source into the ptest package, as some
>    packages share test data among multiple tests.
>
> Signed-off-by: Matt Madison <matt@madison.systems>
> ---
>   meta/classes/go.bbclass | 87 +++++++++++++++++++++++++++++--------------------
>   1 file changed, 51 insertions(+), 36 deletions(-)
>
> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> index afd68b5951..a51ba3e9f0 100644
> --- a/meta/classes/go.bbclass
> +++ b/meta/classes/go.bbclass
> @@ -26,7 +26,7 @@ GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} -extldflags '${GO_EXTLDFLAGS
>   export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS}"
>   export GOPATH_OMIT_IN_ACTIONID ?= "1"
>   export GOPTESTBUILDFLAGS ?= "${GOBUILDFLAGS} -c"
> -export GOPTESTFLAGS ?= "-test.v"
> +export GOPTESTFLAGS ?= ""
>   GOBUILDFLAGS_prepend_task-compile = "${GO_PARALLEL_BUILD} "
>
>   export GO = "${HOST_PREFIX}go"
> @@ -76,7 +76,7 @@ go_list_packages() {
>   }
>
>   go_list_package_tests() {
> -    ${GO} list -f '{{.ImportPath}} {{.TestGoFiles}}' ${GOBUILDFLAGS} ${GO_INSTALL} | \
> +	${GO} list -f '{{.ImportPath}} {{.TestGoFiles}}' ${GOBUILDFLAGS} ${GO_INSTALL} | \
>   		grep -v '\[\]$' | \
>   		egrep -v '${GO_INSTALL_FILTEROUT}' | \
>   		awk '{ print $1 }'
> @@ -100,15 +100,16 @@ go_do_compile() {
>   do_compile[dirs] =+ "${GOTMPDIR}"
>   do_compile[cleandirs] = "${B}/bin ${B}/pkg"
>
> -do_compile_ptest() {
> +do_compile_ptest_base() {
>   	export TMPDIR="${GOTMPDIR}"
> -    rm -f ${B}/.go_compiled_tests.list
> +	rm -f ${B}/.go_compiled_tests.list
>   	go_list_package_tests | while read pkg; do
>   		cd ${B}/src/$pkg
>   		${GO} test ${GOPTESTBUILDFLAGS} $pkg
>   		find . -mindepth 1 -maxdepth 1 -type f -name '*.test' -exec echo $pkg/{} \; | \
>   			sed -e's,/\./,/,'>> ${B}/.go_compiled_tests.list
>   	done
> +	do_compile_ptest
>   }
>   do_compile_ptest_base[dirs] =+ "${GOTMPDIR}"
>
> @@ -124,40 +125,54 @@ go_do_install() {
>   	fi
>   }
>
> -do_install_ptest_base() {
> -    test -f "${B}/.go_compiled_tests.list" || exit 0
> -    tests=""
> -    while read test; do
> -        tests="$tests${tests:+ }${test%.test}"
> -        testdir=`dirname $test`
> -        install -d ${D}${PTEST_PATH}/$testdir
> -        install -m 0755 ${B}/src/$test ${D}${PTEST_PATH}/$test
> -        if [ -d "${B}/src/$testdir/testdata" ]; then
> -            cp --preserve=mode,timestamps -R "${B}/src/$testdir/testdata" ${D}${PTEST_PATH}/$testdir
> -        fi
> -    done < ${B}/.go_compiled_tests.list
> -    if [ -n "$tests" ]; then
> -        install -d ${D}${PTEST_PATH}
> -        cat >${D}${PTEST_PATH}/run-ptest <<EOF
> +go_make_ptest_wrapper() {
> +	cat >${D}${PTEST_PATH}/run-ptest <<EOF
>   #!/bin/sh
> -ANYFAILED=0
> -for t in $tests; do
> -    testdir=\`dirname \$t.test\`
> -    if ( cd "${PTEST_PATH}/\$testdir"; "${PTEST_PATH}/\$t.test" ${GOPTESTFLAGS} | tee /dev/fd/9 | grep -q "^FAIL" ) 9>&1; then
> -        ANYFAILED=1
> -    fi
> -done
> -if [ \$ANYFAILED -ne 0 ]; then
> -    echo "FAIL: ${PN}"
> -    exit 1
> -fi
> -echo "PASS: ${PN}"
> -exit 0
> +RC=0
> +run_test() (
> +    cd "\$1"
> +    ((((./\$2 ${GOPTESTFLAGS}; echo \$? >&3) | sed -r -e"s,^(PASS|SKIP|FAIL)\$,\\1: \$1/\$2," >&4) 3>&1) | (read rc; exit \$rc)) 4>&1
> +    exit \$?)
>   EOF
> -        chmod +x ${D}${PTEST_PATH}/run-ptest
> -    else
> -        rm -rf ${D}${PTEST_PATH}
> -    fi
> +
> +}
> +
> +go_stage_testdata() {
> +	oldwd="$PWD"
> +	cd ${S}/src
> +	find ${GO_IMPORT} -depth -type d -name testdata | while read d; do
> +		if echo "$d" | grep -q '/vendor/'; then
> +			continue
> +		fi
> +		parent=`dirname $d`
> +		install -d ${D}${PTEST_PATH}/$parent
> +		cp --preserve=mode,timestamps -R $d ${D}${PTEST_PATH}/$parent/
> +	done
> +	cd "$oldwd"
> +}
> +
> +do_install_ptest_base() {
> +	test -f "${B}/.go_compiled_tests.list" || exit 0
> +	install -d ${D}${PTEST_PATH}
> +	go_stage_testdata
> +	go_make_ptest_wrapper
> +	havetests=""
> +	while read test; do
> +		testdir=`dirname $test`
> +		testprog=`basename $test`
> +		install -d ${D}${PTEST_PATH}/$testdir
> +		install -m 0755 ${B}/src/$test ${D}${PTEST_PATH}/$test
> +	echo "run_test $testdir $testprog || RC=1" >> ${D}${PTEST_PATH}/run-ptest
> +		havetests="yes"
> +	done < ${B}/.go_compiled_tests.list
> +	if [ -n "$havetests" ]; then
> +		echo "exit \$RC" >> ${D}${PTEST_PATH}/run-ptest
> +		chmod +x ${D}${PTEST_PATH}/run-ptest
> +	else
> +		rm -rf ${D}${PTEST_PATH}
> +	fi
> +	do_install_ptest
> +	chown -R root:root ${D}${PTEST_PATH}
>   }
>
>   EXPORT_FUNCTIONS do_unpack do_configure do_compile do_install
>

