Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SCeQC-0000qe-IP
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 23:59:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2RLoHtK005726
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 14:50:18 -0700 (PDT)
Received: from msp-dhcp8.wrs.com (172.25.34.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 27 Mar 2012 14:50:18 -0700
Message-ID: <4F723618.6060104@windriver.com>
Date: Tue, 27 Mar 2012 16:50:16 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1332877869-12195-1-git-send-email-kergoth@gmail.com>
	<1332877869-12195-3-git-send-email-kergoth@gmail.com>
	<4F72219A.2020301@windriver.com>
	<CABcZANmm5BNHdMtSJJ_P6WNpkgrQ+1vhbHgDg1-9Dc_FXWbhgQ@mail.gmail.com>
In-Reply-To: <CABcZANmm5BNHdMtSJJ_P6WNpkgrQ+1vhbHgDg1-9Dc_FXWbhgQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] powerpc: define TUNE_PKGARCH for powerpc/powerpc-nf
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
X-List-Received-Date: Tue, 27 Mar 2012 21:59:21 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/27/12 4:05 PM, Chris Larson wrote:
> On Tue, Mar 27, 2012 at 1:22 PM, Mark Hatle<mark.hatle@windriver.com>  wrote:
>> Patch 1 and 2 look fine, but I have questions on this one....
>>
>>
>> On 3/27/12 2:51 PM, Christopher Larson wrote:
>>>
>>> From: Christopher Larson<chris_larson@mentor.com>
>>>
>>> This allows setting DEFAULTTUNE to powerpc or powerpc-nf rather than just
>>> the
>>> more specific cpu/machine tuning.
>>>
>>> Signed-off-by: Christopher Larson<chris_larson@mentor.com>
>>> ---
>>>   meta/conf/machine/include/powerpc/arch-powerpc.inc |    2 ++
>>>   1 files changed, 2 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc
>>> b/meta/conf/machine/include/powerpc/arch-powerpc.inc
>>> index c5fd6b7..3438b46 100644
>>> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
>>> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
>>> @@ -26,6 +26,8 @@ AVAILTUNES += "powerpc powerpc-nf"
>>>   TUNE_FEATURES_tune-powerpc-nf ?= "m32 fpu-soft"
>>>   BASE_LIB_tune-powerpc-nf = "lib"
>>>   PACKAGE_EXTRA_ARCHS_tune-powerpc-nf = "powerpc-nf"
>>> +TUNE_PKGARCH_tune-powerpc-nf = "powerpc-nf"
>>>   TUNE_FEATURES_tune-powerpc ?= "m32 fpu-hard"
>>>   BASE_LIB_tune-powerpc = "lib"
>>>   PACKAGE_EXTRA_ARCHS_tune-powerpc = "powerpc"
>>> +TUNE_PKGARCH_tune-powerpc = "powerpc"
>>
>>
>> Why is the above necessary?
>>
>> TUNE_PKGARCH_append is set to "${PPCPKGSFX_FPU}"
>>
>> PPCPKGSFX_FP is set to either '' or '-nf' based on the existance of
>> fpu-soft.
>>
>> TUNE_PKGARCH is set by a number of the PowerPC tuning files...  If you are
>> looking for generic PowerPC there should be something setting TUNE_PKGARCH
>> to "powerpc" (or "powerpc64" in the default cases...)
>
> This is what I'm saying. If you want to target generic powerpc, you
> have to force TUNE_PKGARCH, as the generic don't have
> TUNE_PKGARCH_tune- definitions. It seems to me in most cases you can
> set DEFAULTTUNE and include an appropriate tune file and not need to
> set TUNE_PKGARCH directly, which is not the case for the generic ones.
> Was it not the intent that this was the case? Should every MACHINE
> have to override TUNE_PKGARCH?

On PowerPC TUNE_PKGARCH should be set to powerpc (or overriden by the machines). 
  On PowerPC64, it should be set to powerpc64.  If this is not happening that is 
the bug, lack of the default TUNE_PKGARCH.  (based on the original implementation.)

It was intended that having to have multiple TUNE_PKGARCH one for powerpc and 
one for powerpc-nf was not the intention.

I'm open to changing it, but I took a lot of "feedback" over the initial 
implementation and that is what ended up in it.

--Mark


