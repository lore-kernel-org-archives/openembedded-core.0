Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 143387CBE7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 02:53:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4T2rqIC005205
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 May 2019 19:53:52 -0700 (PDT)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 28 May 2019 19:53:51 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <12580c58f5d64b60ca87f5077b43924af5d746d2.camel@linuxfoundation.org>
	<1559036425-276422-1-git-send-email-mingli.yu@windriver.com>
	<5a62beea5ad46e24bc1e59c5cf9938799c0e3d12.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5CEDF5A3.9030403@windriver.com>
Date: Wed, 29 May 2019 10:59:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <5a62beea5ad46e24bc1e59c5cf9938799c0e3d12.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.170]
Subject: Re: [PATCH v2] elfutils: fix ptest failures
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
X-List-Received-Date: Wed, 29 May 2019 02:53:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年05月28日 18:01, richard.purdie@linuxfoundation.org wrote:
> On Tue, 2019-05-28 at 17:40 +0800, mingli.yu@windriver.com wrote:
>> From: Mingli Yu <Mingli.Yu@windriver.com>
>>
>> * Add missing -ptest package dependencies (needs
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
>> * Don't split the -debug package for elfutils as
>>    most cases needs the binary to have .symtab.
>
> Can you provide more details on what this last item means?

That means elfutils tests need the binary not stripped, so we need below 
logic:

INHIBIT_PACKAGE_STRIP = "1"
INHIBIT_PACKAGE_DEBUG_SPLIT = "1"

>
> Do you mean elfutils is generally broken without the symtab section?
> That seems unusual? Or do you mean the tests need it to be present?

Not sure whether elfutils is broken, but at least it is broken with 
regard to test part. If strip the binary, the test result:
--------------------------------------------
     Recipe   | Passed    | Failed   | Skipped
     --------------------------------------------
     elfutils | 184       | 15        | 4
--------------------------------------------

And all the failed case as below is because the binary is stripped.
 

FAIL: test-nlist
FAIL: run-strip-reloc.sh
FAIL: run-strip-strmerge.sh
FAIL: run-nm-self.sh
FAIL: run-readelf-self.sh
FAIL: run-varlocs-self.sh
FAIL: run-exprlocs-self.sh
FAIL: run-backtrace-native.sh
FAIL: run-backtrace-data.sh
FAIL: run-backtrace-native-core.sh
FAIL: run-deleted.sh
FAIL: run-dwarf-die-addr-die.sh
FAIL: run-get-units-invalid.sh
FAIL: run-get-units-split.sh
FAIL: run-unit-info.sh

For the test-nlist, the upstream also said the binary cannot be stripped 
to guarantee the test pass as 
https://sourceware.org/ml/elfutils-devel/2019-q2/msg00098.html and 
https://sourceware.org/ml/elfutils-devel/2019-q2/msg00103.html


So to fix this kind of below failures, we need to make the binary not 
stripped.

runtest /usr/lib64/elfutils/ptest/tests/..//src/strip
/usr/bin/eu-readelf: cannot get debug context descriptor: No DWARF 
information found
*** failure readelf -w debugfile1 
/usr/lib64/elfutils/ptest/tests/..//src/strip
/usr/bin/eu-readelf: cannot get debug context descriptor: No DWARF 
information found
*** failure readelf -w debugfile2 
/usr/lib64/elfutils/ptest/tests/..//src/strip
runtest /usr/lib64/elfutils/ptest/tests/..//src/strip.o
runtest strip-uncompressed.o
runtest strip-compressed.o
runtest testfile-debug-rel-ppc64.o
runtest testfile-debug-rel-ppc64-z.o
runtest testfile-debug-rel-ppc64-g.o
FAIL: run-strip-reloc.sh

/usr/lib64/elfutils/ptest/tests/..//tests/elfstrmerge: 
/usr/lib64/elfutils/ptest/tests/..//tests/elfstrmerge: couldn't get 
symtab data: no error
FAIL: run-strip-strmerge.sh

/usr/bin/eu-nm: /usr/lib64/elfutils/ptest/tests/..//src/nm: no symbols
FAIL: run-nm-self.sh

>
> Not striping the binary at all is likely to cause a significant size
> increase for elfutils and we want to avoid that, particularly if its
> only to fix tests. We will probably have to find a different solution
> (e.g. second copy with the symtab section in the ptest package, added
> to PATH in the runner?)

During my test, if we strip the debug info to elfutils-dbg, first we 
need to make elfutils-ptest rdepends on elfutils-dbg and second the test 
still fails as above even the elfutils-dbg package deployed as below:
# pwd
/usr/lib64/elfutils/ptest
root@qemux86-64:/usr/lib64/elfutils/ptest# ls src/strip
src/strip
root@qemux86-64:/usr/lib64/elfutils/ptest# ls src/.debug/strip
src/.debug/strip
/.debug/strip64:/usr/lib64/elfutils/ptest# rpm -qf 
/usr/lib64/elfutils/ptest/src/.debug/strip
elfutils-dbg-0.176-r0.core2_64

Thanks,

>
> Cheers,
>
> Richard
>
>
>
>

