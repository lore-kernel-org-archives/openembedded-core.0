Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1T9krm-0003qZ-LP
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 00:48:07 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q86MZem6023263
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Sep 2012 15:35:40 -0700 (PDT)
Received: from msp-dhcp21.wrs.com (172.25.34.21) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 6 Sep 2012 15:35:40 -0700
Message-ID: <5049253B.4090402@windriver.com>
Date: Thu, 6 Sep 2012 17:35:39 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120824 Thunderbird/15.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1346956528.git.bruce.ashfield@windriver.com>
	<fb717d4aa26b125680f620254cde9eb97ef0708a.1346956528.git.bruce.ashfield@windriver.com>
	<1346969961.7493.24.camel@ted> <504921BD.4040004@windriver.com>
In-Reply-To: <504921BD.4040004@windriver.com>
Subject: Re: [PATCH 1/1] conf/tune: add tune-ppce300c3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 22:48:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/6/12 5:20 PM, Bruce Ashfield wrote:
> On 12-09-06 6:19 PM, Richard Purdie wrote:
>> On Thu, 2012-09-06 at 14:43 -0400, Bruce Ashfield wrote:
>>> It has been pointed out several times that the yocto mpc8315e-rdb
>>> reference was using the wrong tuning (603e), since it is actually
>>> a e300c3 board.
>>>
>>> This commit creates a e300c3 tune file based on the e300c2 variant
>>> already in oe-core.
>>>
>>> This commit also inhibits altivec in flac when this new tuning is
>>> enabled. It was also noticed that the existing tune based overrides
>>> in the flac package would not be triggered since DEFAULTTUNE is not
>>> in the overrides list. To avoid doing per-board disabling of altivec
>>> DEFAULTTUNE is added to the local package OVERRIDES and then used
>>> to disable altivec.
>>>
>>> [YOCTO #1192]
>>>
>>> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
>>>
>>> asdfkljds
>>> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
>>> ---
>>>    meta/conf/machine/include/tune-ppce300c3.inc |   11 +++++++++++
>>>    meta/recipes-multimedia/flac/flac_1.2.1.bb   |    5 +++++
>>>    2 files changed, 16 insertions(+), 0 deletions(-)
>>>    create mode 100644 meta/conf/machine/include/tune-ppce300c3.inc
>>>
>>> diff --git a/meta/conf/machine/include/tune-ppce300c3.inc b/meta/conf/machine/include/tune-ppce300c3.inc
>>> new file mode 100644
>>> index 0000000..3f5ac26
>>> --- /dev/null
>>> +++ b/meta/conf/machine/include/tune-ppce300c3.inc
>>> @@ -0,0 +1,11 @@
>>> +DEFAULTTUNE ?= "ppce300c3"
>>> +
>>> +require conf/machine/include/powerpc/arch-powerpc.inc
>>> +
>>> +TUNEVALID[ppce300c3] = "Enable ppce300c3 specific processor optimizations"
>>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce300c3", "-mcpu=e300c3", "", d)}"
>>> +
>>> +AVAILTUNES += "ppce300c3"
>>> +TUNE_FEATURES_tune-ppce300c3 = "m32 fpu-soft ppce300c3"
>>> +TUNE_PKGARCH_tune-ppce300c3 = "ppce300c3"
>>> +PACKAGE_EXTRA_ARCHS_tune-ppce300c3 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppce300c3"
>>> diff --git a/meta/recipes-multimedia/flac/flac_1.2.1.bb b/meta/recipes-multimedia/flac/flac_1.2.1.bb
>>> index 3c5b73c..25db1c4 100644
>>> --- a/meta/recipes-multimedia/flac/flac_1.2.1.bb
>>> +++ b/meta/recipes-multimedia/flac/flac_1.2.1.bb
>>> @@ -36,9 +36,14 @@ EXTRA_OECONF = "--disable-oggtest --disable-id3libtest \
>>>                    --without-xmms-exec-prefix \
>>>                    --without-libiconv-prefix \
>>>                    --without-id3lib"
>>> +
>>> +FLACOVERRIDE = ":${DEFAULTTUNE}"
>>> +OVERRIDES .= "${FLACOVERRIDE}"
>>> +
>>>    EXTRA_OECONF_prepend_e500mc = "--disable-altivec "
>>>    EXTRA_OECONF_prepend_e5500 = "--disable-altivec "
>>>    EXTRA_OECONF_prepend_e5500-64b = "--disable-altivec "
>>> +EXTRA_OECONF_prepend_ppce300c3 = "--disable-altivec "
>>>
>>
>> This is getting ugly and is kind of unsafe. Perhaps the architecture
>> should be doing something like:
>>
>> MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "ppce300c3", ":noaltivec", "" ,d)}
>>
>> or even in this recipe just do:
>>
>> EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppce300c3", " --disable-altivec", "" ,d)}
>
> I definitely considered this route. I can do that for the new arch, and the
> old ones, but can't test the old ones at the moment.

The problem is actually in the flac.  This recipe sees powerpc as the machine 
type, and immediately enabled altivec.  By default altivec support is disabled 
in OE-Core.

Perhaps one way we could address this is add a tune flag that says if the tune 
has altivec support or not.. then in the flac binary, disable it unless it's 
enabled?

--Mark

> Bruce
>
>>
>> Cheers,
>>
>> Richard
>>
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



