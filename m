Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1REkDU-0001i5-Gh
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 18:02:36 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9EFumrL008185
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 08:56:49 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 14 Oct 2011 08:56:48 -0700
Message-ID: <4E985BBE.9010605@windriver.com>
Date: Fri, 14 Oct 2011 10:56:46 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1315409916-2298-1-git-send-email-yanok@emcraft.com>
	<4E973C99.4080402@emcraft.com>
In-Reply-To: <4E973C99.4080402@emcraft.com>
Subject: Re: [PATCH] arch-powerpc: set PACKAGE_EXTRA_ARCHS
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
X-List-Received-Date: Fri, 14 Oct 2011 16:02:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 10/13/11 2:31 PM, Ilya Yanok wrote:
> Hi guys,
> 
> any comments on this patch?
> 
> Regards, Ilya.
> 
> On 07.09.2011 19:38, Ilya Yanok wrote:
>> Set PACKAGE_EXTRA_ARCHS for the generic tunes ("powerpc" and
>> "powerpc-nf") thus allowing to use them instead of tuning to the
>> specific CPU.
>>
>> Signed-off-by: Ilya Yanok <yanok@emcraft.com>
>> ---
>>  meta/conf/machine/include/powerpc/arch-powerpc.inc |    6 ++++--
>>  meta/conf/machine/include/tune-ppc603e.inc         |    2 +-
>>  meta/conf/machine/include/tune-ppce300c2.inc       |    2 +-
>>  meta/conf/machine/include/tune-ppce500mc.inc       |    2 +-
>>  4 files changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
>> index da1a1d6..8347f86 100644
>> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
>> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
>> @@ -25,9 +25,11 @@ TUNE_PKGARCH ?= "${PPCPKGARCH}"
>>  
>>  # Basic tune definitions
>>  AVAILTUNES += "powerpc powerpc-nf" 
>> -TUNE_FEATURES_tune-powerpc ?= "m32 fpu-hard"
>> -BASE_LIB_tune-powerpc = "lib"
>>  TUNE_FEATURES_tune-powerpc-nf ?= "m32 fpu-soft"
>>  BASE_LIB_tune-powerpc-nf = "lib"
>> +PACKAGE_EXTRA_ARCHS_tune-powerpc-nf = "powerpc-nf"
>> +TUNE_FEATURES_tune-powerpc ?= "m32 fpu-hard"
>> +BASE_LIB_tune-powerpc = "lib"
>> +PACKAGE_EXTRA_ARCHS_tune-powerpc = "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} powerpc"

Usually we try to match the order of the AVAILTUNES, it just makes it easier to
look at, has no real technical consideration.  So I'd change the order of what
you have above.

The last line thought is wrong.  powerpc-nf and powerpc are not compatible with
each other.  You can't list them both in the same EXTRA_ARCHS, as that indicates
to the package feed a compatible set of packaging ABIs.

This is a place that people familiar with ARM architectures often get confused
on PowerPC.  The two ABIs often times can run together with limited problems,
but there WILL be problems as register passing and context switching
(setjmp/longjmp) are defined differently in the two ABIs.

So based on that, it appears to me that the only thing missing is:
PACKAGE_EXTRA_ARCHS_tune-powerpc-nf = "powerpc-nf"

Which I thought was automatic if the tune selected with powerpc-nf.

>>  
>> diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
>> index c743dde..663f220 100644
>> --- a/meta/conf/machine/include/tune-ppc603e.inc
>> +++ b/meta/conf/machine/include/tune-ppc603e.inc
>> @@ -8,7 +8,7 @@ TUNE_PKGARCH = "${@bb.utils.contains('TUNE_FEATURES', 'ppc603e', 'ppc603e', '${P
>>  
>>  AVAILTUNES = "ppc603e"
>>  TUNE_FEATURES_tune-ppc603e = "m32 fpu-hard ppc603e"
>> -PACKAGE_EXTRA_ARCHS_tune-ppc603e = "powerpc ppc603e"
>> +PACKAGE_EXTRA_ARCHS_tune-ppc603e = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc603e"

The above (assumine the previous comment on powerpc-nf) would result in the same
thing.  This should be ok, but I'm not sure I see any advantage to doing it this
way.

>>  # glibc configure options to get 603e specific library (for sqrt)
>>  GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "-with-cpu=603e", "", d)}"
>> diff --git a/meta/conf/machine/include/tune-ppce300c2.inc b/meta/conf/machine/include/tune-ppce300c2.inc
>> index 5eea4a6..bdca1aa 100644
>> --- a/meta/conf/machine/include/tune-ppce300c2.inc
>> +++ b/meta/conf/machine/include/tune-ppce300c2.inc
>> @@ -8,4 +8,4 @@ TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce300c2", "ppce300c2",
>>  
>>  AVAILTUNES += "ppce300c2"
>>  TUNE_FEATURES_tune-ppce300c2 = "m32 fpu-soft ppce300c2"
>> -PACKAGE_EXTRA_ARCHS_tune-ppce300c2 = "powerpc-nf ppce300c2"
>> +PACKAGE_EXTRA_ARCHS_tune-ppce300c2 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppce300c2"

Same as above...

>> diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
>> index 33820ef..950c46d 100644
>> --- a/meta/conf/machine/include/tune-ppce500mc.inc
>> +++ b/meta/conf/machine/include/tune-ppce500mc.inc
>> @@ -8,7 +8,7 @@ TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "ppce500mc",
>>  
>>  AVAILTUNES = "ppce500mc"
>>  TUNE_FEATURES_tune-ppce500mc = "m32 fpu-hard ppce500mc"
>> -PACKAGE_EXTRA_ARCHS_tune-ppce500mc = "powerpc ppce500mc"
>> +PACKAGE_EXTRA_ARCHS_tune-ppce500mc = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce500mc"

Same as above..

>>  # glibc configure options to get e500mc specific library (for sqrt)
>>  GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "-with-cpu=e500mc", "", d)}"
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



