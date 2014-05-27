Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E3116FA52
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 01:33:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4R1XQWS025152
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 26 May 2014 18:33:26 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Mon, 26 May 2014 18:33:26 -0700
Message-ID: <5383EB63.40208@windriver.com>
Date: Tue, 27 May 2014 09:33:23 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Tudor Florea <Tudor.Florea@enea.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1401096040.git.Chong.Lu@windriver.com>
	<b381184d550cfdb6f044e9fde7660a69877708cc.1401096040.git.Chong.Lu@windriver.com>
	<26724FB0BFCB3D4C91BDE184751AA3A428A495A1@SESTOEX04.enea.se>
In-Reply-To: <26724FB0BFCB3D4C91BDE184751AA3A428A495A1@SESTOEX04.enea.se>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH 1/1] ethtool: fix ptest execution failure
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
X-List-Received-Date: Tue, 27 May 2014 01:33:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 05/27/2014 12:02 AM, Tudor Florea wrote:
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>> Of Chong Lu
>> Sent: Monday, May 26, 2014 12:22
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH 1/1] ethtool: fix ptest execution failure
>>
>> Modify ptest suite to make it enabled on new version.
>>
>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>> ---
>>   meta/recipes-extended/ethtool/ethtool/run-ptest |  2 +-
>>   meta/recipes-extended/ethtool/ethtool_3.14.bb   | 16 ++++++++++------
>>   2 files changed, 11 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta/recipes-extended/ethtool/ethtool/run-ptest
>> b/meta/recipes-extended/ethtool/ethtool/run-ptest
>> index 1e245da..a359387 100644
>> --- a/meta/recipes-extended/ethtool/ethtool/run-ptest
>> +++ b/meta/recipes-extended/ethtool/ethtool/run-ptest
>> @@ -1,2 +1,2 @@
>>   #!/bin/sh
>> -make -k runtest-TESTS
>> +make -k check-TESTS
>> diff --git a/meta/recipes-extended/ethtool/ethtool_3.14.bb
>> b/meta/recipes-extended/ethtool/ethtool_3.14.bb
>> index 2a3ca70..9729f65 100644
>> --- a/meta/recipes-extended/ethtool/ethtool_3.14.bb
>> +++ b/meta/recipes-extended/ethtool/ethtool_3.14.bb
>> @@ -13,16 +13,20 @@ SRC_URI[md5sum] =
>> "997e20c25c43ad5800f8ae3204455a8a"
>>   SRC_URI[sha256sum] =
>> "b1a988d6e397bd9d5d73cfd64329f85121936a050174bbfe90f8701fd893a1df"
>>
>>   inherit autotools ptest
>> -RDEPENDS_${PN}-ptest += "make"
>> +RDEPENDS_${PN}-ptest += "make bash gawk"
> Isn't possible to avoid bash and gawk dependency here?
> Regards,
>    Tudor
Ok, it's possible. But it needs to change Makefile more.
I will resend a V2.

Best Regards
Chong
>>   do_compile_ptest() {
>>      oe_runmake test-cmdline test-features
>>   }
>>
>>   do_install_ptest () {
>> -   cp ${B}/Makefile                 ${D}${PTEST_PATH}
>> -   install ${B}/test-cmdline        ${D}${PTEST_PATH}
>> -   install ${B}/test-features       ${D}${PTEST_PATH}
>> -   install ${B}/ethtool             ${D}${PTEST_PATH}/ethtool
>> -   sed -i 's/^Makefile/_Makefile/'  ${D}${PTEST_PATH}/Makefile
>> +   for i in Makefile test-cmdline test-features; do \
>> +       install ${B}/$i ${D}${PTEST_PATH}; done
>> +   install ${S}/test-driver ${D}${PTEST_PATH}
>> +   sed -e 's/^Makefile/_Makefile/' \
>> +       -e 's/^test_cmdline_OBJECTS/#test_cmdline_OBJECTS/' \
>> +       -e 's/^test_features_OBJECTS/#test_features_OBJECTS/' \
>> +       -e 's/^top_srcdir = \(.*\)/top_srcdir = ./' \
>> +       -e '/^all:/,+1d' \
>> +       -i ${D}${PTEST_PATH}/Makefile
>>   }
>> --
>> 1.8.1.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


