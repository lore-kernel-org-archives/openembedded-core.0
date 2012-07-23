Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1St8ST-0004Lu-1K
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 04:33:17 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6N2Lnmd001681
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 19:21:49 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sun, 22 Jul 2012 19:21:49 -0700
Message-ID: <500CB53B.70205@windriver.com>
Date: Mon, 23 Jul 2012 10:21:47 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
References: <cover.1342772908.git.liezhi.yang@windriver.com>
	<5735964eb9bdb685cf35d2ecdbb1694f5f6a5036.1342772908.git.liezhi.yang@windriver.com>
	<5009F538.6090007@linux.intel.com>
In-Reply-To: <5009F538.6090007@linux.intel.com>
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] createrepo 0.4.11: fix the RDEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jul 2012 02:33:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/21/2012 08:18 AM, Saul Wold wrote:
> On 07/20/2012 02:49 AM, Robert Yang wrote:
>> The libxml2-native and rpm-native should be ready before createrepo
>> runs since it needs "import libxml2 rpm".
>>
>> The target createrepo needs libxml2-python when run, but the libxml2
>> doesn't generate the python module (disabled). We may need to fix it
>> or rename the recipe to createrepo-native_0.4.11.bb.
>>
>> This recipe is only for the rpm backend system.
>>
>> [YOCTO #2753]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../createrepo/createrepo_0.4.11.bb                |    4 +++-
>>   1 files changed, 3 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-support/createrepo/createrepo_0.4.11.bb
>> b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
>> index 060ed59..7a4d059 100644
>> --- a/meta/recipes-support/createrepo/createrepo_0.4.11.bb
>> +++ b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
>> @@ -4,7 +4,9 @@ HOMEPAGE = "http://createrepo.baseurl.org/"
>>   LICENSE = "GPLv2+"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
>>
>> -PR = "r3"
>> +RDEPENDS_${PN}_virtclass-native += "libxml2-native rpm-native"
>> +
> This should not be required here since the package_rpm.bbclass contains a line:
> PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
>
> We might need to add libxml2-native to the PACKAGEINDEXDEPS
>

Thanks, but we may manually run createrepo, if we just "bitbake createrepo" and
manually run createrepo, it would be failed if rpm-native is not ready.

> This was merged into OE-0Core, but the real issue turned out to be sstate across
> different distros.
>

I had tried to use sstate across different distros (ubuntu 12.04 64bit and FC 17 
64 bit),
there were strange errors.

// Robert

> Sau!
>
>
>
>> +PR = "r4"
>>
>>   SRC_URI= "http://createrepo.baseurl.org/download/${BP}.tar.gz \
>>             file://fix-native-install.patch \
>>
>
>
>



