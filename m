Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 965D16FB75
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 01:25:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4S1PDk3018484
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 May 2014 18:25:13 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Tue, 27 May 2014 18:25:13 -0700
Message-ID: <53853AF6.9020001@windriver.com>
Date: Wed, 28 May 2014 09:25:10 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Tudor Florea <Tudor.Florea@enea.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1401174102.git.Chong.Lu@windriver.com>
	<c1e7421f8317b0dfb0988044e511dc95e5265af1.1401174102.git.Chong.Lu@windriver.com>
	<26724FB0BFCB3D4C91BDE184751AA3A428A49EA5@SESTOEX04.enea.se>
In-Reply-To: <26724FB0BFCB3D4C91BDE184751AA3A428A49EA5@SESTOEX04.enea.se>
X-Originating-IP: [128.224.162.204]
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
X-List-Received-Date: Wed, 28 May 2014 01:25:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 05/27/2014 11:16 PM, Tudor Florea wrote:
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
Ok. Thanks for your suggestion.

Best Regards
Chong
>
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
>


