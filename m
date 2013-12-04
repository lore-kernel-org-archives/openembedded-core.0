Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id CCE406D99E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 14:19:09 +0000 (UTC)
Received: from [192.168.14.151] (192.168.14.151) by SESTOEX03.enea.se
	(172.21.1.38) with Microsoft SMTP Server (TLS) id 14.3.158.1;
	Wed, 4 Dec 2013 15:19:07 +0100
Message-ID: <529F39D9.3050003@enea.com>
Date: Wed, 4 Dec 2013 16:19:05 +0200
From: Tudor Florea <tudor.florea@enea.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
References: <1386110965-24404-1-git-send-email-tudor.florea@enea.com>
	<1386154242.4463.152.camel@ted>
	<69319FFFA2D4F748B9BB5083FA28E56F25AFBD6A@sestoex09.enea.se>
In-Reply-To: <69319FFFA2D4F748B9BB5083FA28E56F25AFBD6A@sestoex09.enea.se>
X-Originating-IP: [192.168.14.151]
Cc: bjst@enea.se
Subject: Re: FW: [PATCH] ethtool: use serial-tests to generate targets used by ptest.
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
X-List-Received-Date: Wed, 04 Dec 2013 14:19:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Richard Purdie
> Sent: Wednesday, December 04, 2013 12:51 PM
> To: Tudor Florea
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] ethtool: use serial-tests to generate targets used by ptest.
>
> On Tue, 2013-12-03 at 23:49 +0100, Tudor Florea wrote:
>> buildtest-TESTS and runtest-TESTS targets are required by ptest.
>> In order to have those targets in automake 1.13.4 serial-tests should
>> be specified since parallel-tests is assumed by default and
>> serial-tests is optional.
>>
>>
>> Signed-off-by: Tudor Florea <tudor.florea@enea.com>
>> ---
>>   .../ethtool/ethtool-3.12.1/use_serial_tests.patch  |   20 ++++++++++++++++++++
>>   meta/recipes-extended/ethtool/ethtool_3.12.1.bb    |    6 ++++--
>>   2 files changed, 24 insertions(+), 2 deletions(-)  create mode 100644
>> meta/recipes-extended/ethtool/ethtool-3.12.1/use_serial_tests.patch
> This patch and the others imply we're going to have to patch every autoconf recipe to add serial-tests?
>
> Could we change the default in automake instead?
Unfortunately, changing the default in automake is not straightforward 
though this was my first option to consider.
(This imply reverting this commit and all depending commits: 
http://repo.or.cz/w/automake.git/commit/5e771b27e52cda72b1bfde18ed7a4f118fad24e0)
If my investigation is correct there are no more packages affected (in 
the same way) by the upgrade of automake.
This should be seen as a temporary fix until a proper fix will be added 
in automake so that ptest will work with parallel test harness.

Regards,
   Tudor.

>
> Cheers,
>
> Richard
>
>> diff --git
>> a/meta/recipes-extended/ethtool/ethtool-3.12.1/use_serial_tests.patch
>> b/meta/recipes-extended/ethtool/ethtool-3.12.1/use_serial_tests.patch
>> new file mode 100644
>> index 0000000..e036edc
>> --- /dev/null
>> +++ b/meta/recipes-extended/ethtool/ethtool-3.12.1/use_serial_tests.pa
>> +++ tch
>> @@ -0,0 +1,20 @@
>> +ptest needs buildtest-TESTS and runtest-TESTS targets.
>> +serial-tests is required to generate those targets.
>> +
>> +Signed-off-by: Tudor Florea <tudor.florea@enea.com>
>> +Upstream-Status: Inappropriate
>> +(default automake behavior incompatible with ptest)
>> +
>> +diff -ruN a/configure.ac b/configure.ac
>> +--- a/configure.ac	2013-12-03 10:37:40.773157142 +0100
>> ++++ b/configure.ac	2013-12-03 10:37:21.521992831 +0100
>> +@@ -2,7 +2,7 @@
>> + AC_INIT(ethtool, 3.12.1, netdev@vger.kernel.org)
>> + AC_PREREQ(2.52)
>> + AC_CONFIG_SRCDIR([ethtool.c])
>> +-AM_INIT_AUTOMAKE([gnu])
>> ++AM_INIT_AUTOMAKE([gnu serial-tests])
>> + AC_CONFIG_HEADERS([ethtool-config.h])
>> +
>> + AM_MAINTAINER_MODE
>> diff --git a/meta/recipes-extended/ethtool/ethtool_3.12.1.bb
>> b/meta/recipes-extended/ethtool/ethtool_3.12.1.bb
>> index 6615009..5e7559c 100644
>> --- a/meta/recipes-extended/ethtool/ethtool_3.12.1.bb
>> +++ b/meta/recipes-extended/ethtool/ethtool_3.12.1.bb
>> @@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>>                       file://ethtool.c;beginline=4;endline=17;md5=c19b30548c582577fc6b443626fc1216"
>>   
>>   SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
>> -           file://run-ptest"
>> +           file://run-ptest \
>> +           file://use_serial_tests.patch \
>> +          "
>>   
>>   SRC_URI[md5sum] = "5a1058efe8eb4f3473f5028967729078"
>>   SRC_URI[sha256sum] = "45190d70e5ce1b4d87def4f71fb5bf04f8a4f4dc5f9e0f38c49c16c462fb59d9"
>> @@ -16,7 +18,7 @@ inherit autotools ptest  RDEPENDS_${PN}-ptest +=
>> "make"
>>   
>>   do_compile_ptest() {
>> -   oe_runmake test-cmdline test-features
>> +   oe_runmake buildtest-TESTS
>>   }
>>   
>>   do_install_ptest () {
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


