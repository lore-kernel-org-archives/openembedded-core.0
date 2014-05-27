Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (unknown [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EE5086B8B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 15:23:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 May 2014 08:23:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,920,1392192000"; d="scan'208";a="545560740"
Received: from unknown (HELO [10.255.12.174]) ([10.255.12.174])
	by fmsmga002.fm.intel.com with ESMTP; 27 May 2014 08:23:19 -0700
Message-ID: <5384ADE7.6090307@linux.intel.com>
Date: Tue, 27 May 2014 08:23:19 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Tudor Florea <Tudor.Florea@enea.com>, Chong Lu <Chong.Lu@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1401174102.git.Chong.Lu@windriver.com>	<c1e7421f8317b0dfb0988044e511dc95e5265af1.1401174102.git.Chong.Lu@windriver.com>
	<26724FB0BFCB3D4C91BDE184751AA3A428A49EA5@SESTOEX04.enea.se>
In-Reply-To: <26724FB0BFCB3D4C91BDE184751AA3A428A49EA5@SESTOEX04.enea.se>
Subject: Re: [PATCH 1/1] strace: fix ptest execution failure
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
X-List-Received-Date: Tue, 27 May 2014 15:23:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/27/2014 08:16 AM, Tudor Florea wrote:
>
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>> Of Chong Lu
>> Sent: Tuesday, May 27, 2014 10:03
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH 1/1] strace: fix ptest execution failure
>>
>> Modify ptest suite to make it execute successfully.
>>
>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>> ---
>>   meta/recipes-devtools/strace/strace-4.8/run-ptest | 2 +-
>>   meta/recipes-devtools/strace/strace_4.8.bb        | 6 ++++++
>>   2 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/strace/strace-4.8/run-ptest
>> b/meta/recipes-devtools/strace/strace-4.8/run-ptest
>> index 133cf92..66639fb 100755
>> --- a/meta/recipes-devtools/strace/strace-4.8/run-ptest
>> +++ b/meta/recipes-devtools/strace/strace-4.8/run-ptest
>> @@ -1,2 +1,2 @@
>>   #!/bin/sh
>> -make -C tests -k runtest-TESTS
>> +make -C tests -k check-TESTS
> I have the same comment as in the previous patch. I'd rather use serial-tests in configure.ac file instead of this change.
>
You mentioned a past patch not merged, can you rebase against master and 
resent if it's still appropriate?

Thanks
	Sau!

>> diff --git a/meta/recipes-devtools/strace/strace_4.8.bb b/meta/recipes-
>> devtools/strace/strace_4.8.bb
>> index 71563d4..9769cd4 100644
>> --- a/meta/recipes-devtools/strace/strace_4.8.bb
>> +++ b/meta/recipes-devtools/strace/strace_4.8.bb
>> @@ -41,6 +41,12 @@ do_compile_ptest() {
>>
>>   do_install_ptest() {
>>   	oe_runmake -C ${TESTDIR} install-ptest BUILDDIR=${B}
>> DESTDIR=${D}${PTEST_PATH} TESTDIR=${TESTDIR}
>> +	install ${S}/test-driver ${D}${PTEST_PATH}
>> +	sed -e 's/bash/sh/' \
>> +	    -e 's/gawk/awk/' \
>> +	    -e 's/^top_srcdir = \(.*\)/top_srcdir = ../' \
>> +	    -e '/^all:/a\\t@:' \
>> +	    -i ${D}${PTEST_PATH}/${TESTDIR}/Makefile
>>   }
>>
>>   BBCLASSEXTEND = "native"
>> --
>> 1.8.1.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

