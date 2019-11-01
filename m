Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 939407FCA0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2019 20:53:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xA1KrMfu021855
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Nov 2019 13:53:22 -0700 (PDT)
Received: from [147.11.119.227] (147.11.119.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 1 Nov 2019 13:53:22 -0700
To: Trevor Gamblin <Trevor.Gamblin@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <20191101183724.32131-1-Trevor.Gamblin@windriver.com>
	<20191101183724.32131-2-Trevor.Gamblin@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <d4298ef6-dd92-83d1-458f-739fe36b0374@windriver.com>
Date: Fri, 1 Nov 2019 13:53:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191101183724.32131-2-Trevor.Gamblin@windriver.com>
X-Originating-IP: [147.11.119.227]
Subject: Re: [RFC 1/1] coreutils: add ptest
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
X-List-Received-Date: Fri, 01 Nov 2019 20:53:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 11/1/19 11:37 AM, Trevor Gamblin wrote:
> From: Trevor Gamblin <trevor.gamblin@windriver.com>

For the non-RFC you need a longer log including
the current test results on qemux86-64/arm64.

> 
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../coreutils/coreutils/run-ptest             | 21 ++++++++++
>   meta/recipes-core/coreutils/coreutils_8.31.bb | 39 +++++++++++++++++++
>   2 files changed, 60 insertions(+)
>   create mode 100755 meta/recipes-core/coreutils/coreutils/run-ptest
> 
> diff --git a/meta/recipes-core/coreutils/coreutils/run-ptest b/meta/recipes-core/coreutils/coreutils/run-ptest
> new file mode 100755
> index 0000000000..07f34a8d3e
> --- /dev/null
> +++ b/meta/recipes-core/coreutils/coreutils/run-ptest
> @@ -0,0 +1,21 @@
> +#!/bin/bash
> +
> +COREUTILSLIB=/usr/lib/coreutils
> +LOG="${COREUTILSLIB}/ptest/coreutils_ptest_$(date +%Y%m%d-%H%M%S).log"
> +
> +addgroup usergroup1

[add|del][group|user] programs are friendlier perl scripts
[group|user][add|del] programs are native executables.

It's probably better to use the smaller executables unless you already
need perl to run the tests.

> +sleep 1
hmmm....
> +adduser --ingroup usergroup1 tester
> +chmod -R 777 ../ptest
> +sleep 2
ugh!

Why did you add the sleeps?

It's not much of a delay given how long the ptests take to run
but it's odd to see and none of the run-ptests in oe-core or meta-oe
call sleep so it would be setting a bad precedent.

> +
> +su tester -c "make check-TESTS top_srcdir=. srcdir=." | tee -a ${LOG}
> +sleep 1
nix.

> +deluser tester
> +delgroup usergroup1
> +
> +passed=`grep PASS ${LOG}|wc -l`
> +failed=`grep FAIL ${LOG}|wc -l`
> +skipped=`grep -E SKIP ${LOG}|wc -l`
> +all=$((passed + failed + skipped))
> +
> diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb b/meta/recipes-core/coreutils/coreutils_8.31.bb
> index 57b2c1bdba..c9c9df0cfa 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.31.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
> @@ -143,3 +143,42 @@ python __anonymous() {
>   }
>   
>   BBCLASSEXTEND = "native nativesdk"
> +
> +inherit ptest
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> +
> +SRC_URI += 	"file://run-ptest"
> +RDEPENDS_${PN}-ptest += "bash gdb perl gawk strace perl-module-file-stat libconvert-asn1-perl liberror-perl libmodule-build-perl libtimedate-perl liburi-perl"

> +
> +do_install_ptest () {
> +	install -d ${D}${PTEST_PATH}/tests
> +	cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests
> +	sed -i 's/ginstall/install/g'  `grep -R ginstall ${D}${PTEST_PATH}/tests | awk -F: '{print $1}' | uniq`
> +	install -d ${D}${PTEST_PATH}/build-aux
> +	install ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
> +	cp ${B}/Makefile ${D}${PTEST_PATH}/
> +	cp ${S}/init.cfg ${D}${PTEST_PATH}/
> +	cp -r ${B}/src ${D}${PTEST_PATH}/
> +	cp -r ${S}/src/*.c ${D}${PTEST_PATH}/src
> +	cd ${D}${PTEST_PATH}
> +	tar -czvf ${D}${PTEST_PATH}/src.tar.gz ./src
> +	cd -
> +	rm -rf ${D}${PTEST_PATH}/src
> +	sed -i '/^VPATH/s/= .*$/= ./g' ${D}${PTEST_PATH}/Makefile
> +	sed -i '/^PROGRAMS/s/^/#/g' ${D}${PTEST_PATH}/Makefile
> +	sed -i '/^Makefile: /s/^.*$/Makefile:/g' ${D}${PTEST_PATH}/Makefile
> +	sed -i '/^abs_srcdir/s/= .*$/= \$\{PWD\}/g' ${D}${PTEST_PATH}/Makefile
> +	sed -i '/^abs_top_builddir/s/= .*$/= \$\{PWD\}/g' ${D}${PTEST_PATH}/Makefile
> +	sed -i '/^abs_top_srcdir/s/= .*$/= \$\{PWD\}/g' ${D}${PTEST_PATH}/Makefile
> +	sed -i '/^built_programs/s/ginstall/install/g' ${D}${PTEST_PATH}/Makefile
> +
> +	# Disable subcase stty-pairs.sh, it will cause test framework hang
> +	sed -i '/stty-pairs.sh/d' ${D}${PTEST_PATH}/Makefile
> +	install ${B}/src/getlimits ${D}/${bindir}
> +}
> +
> +FILES_${PN}-ptest += "${bindir}/getlimits"
> +
> +INSANE_SKIP_${PN}-ptest += "ldflags"
> +INSANE_SKIP_${PN}-ptest += "rpaths"
> 

I think it's a good start for ptests in coreutils.

-- 
# Randy MacLeod
# Wind River Linux

