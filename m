Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHqoB-0000Tq-AU
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 07:09:04 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 May 2011 22:06:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,318,1301900400"; d="scan'208";a="430846111"
Received: from unknown (HELO [10.255.13.11]) ([10.255.13.11])
	by azsmga001.ch.intel.com with ESMTP; 04 May 2011 22:06:21 -0700
Message-ID: <4DC2304D.70205@linux.intel.com>
Date: Wed, 04 May 2011 22:06:21 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1303889119.git.sgw@linux.intel.com>	<ed1614da74a5bf5820855d9d5bd9ab6213bc36de.1303889119.git.sgw@linux.intel.com>	<1303981290.21461.39.camel@rex>	<BANLkTimx4ry=vZdiNzYna1EE121Q85mUOA@mail.gmail.com>	<1304424898.21461.107.camel@rex>	<20110503180447.GB5436@sakrah.homelinux.org>	<1304462379.21461.144.camel@rex>	<BANLkTi=y+rFFeojpoX_OB2uoswF373P_Ww@mail.gmail.com>
	<20110505041912.GA10374@sakrah.homelinux.org>
In-Reply-To: <20110505041912.GA10374@sakrah.homelinux.org>
Subject: Re: [PATCH 36/52] gettext.bbclass: Use _append instead of =+
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
X-List-Received-Date: Thu, 05 May 2011 05:09:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2011 09:19 PM, Khem Raj wrote:
> On (04/05/11 18:07), Khem Raj wrote:
>> On Tue, May 3, 2011 at 3:39 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org>  wrote:
>>> On Tue, 2011-05-03 at 11:04 -0700, Khem Raj wrote:
>>>> This has the same problem It empties out DEPENDS_GETTEXT after they have
>>>> have already been added to DEPENDS via virtclass e.g. when you build
>>>> gcc-runtime-nativesdk it will report a dep loop since now it depends on
>>>> virtual/gettext-nativesdk (added by gettext class)
>>>> and virtual/gettext-nativesdk depends on compilerlibs
>>>> provided by gcc-runtime-nativesdk. This was same problem I was trying to
>>>> circumvent
>>>
>>> Ok, how about this version:
>>>
>>> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>>> index 4f20bc2..3b83e42 100644
>>> --- a/meta/classes/base.bbclass
>>> +++ b/meta/classes/base.bbclass
>>> @@ -89,9 +89,11 @@ def base_dep_prepend(d):
>>>                         deps += " virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs virtual/libc "
>>>         return deps
>>>
>>> -DEPENDS_prepend="${@base_dep_prepend(d)} "
>>> -DEPENDS_virtclass-native_prepend="${@base_dep_prepend(d)} "
>>> -DEPENDS_virtclass-nativesdk_prepend="${@base_dep_prepend(d)} "
>>> +BASEDEPENDS = "${@base_dep_prepend(d)}"
>>> +
>>> +DEPENDS_prepend="${BASEDEPENDS} "
>>> +DEPENDS_virtclass-native_prepend="${BASEDEPENDS} "
>>> +DEPENDS_virtclass-nativesdk_prepend="${BASEDEPENDS} "
>>>
>>>   FILESPATH = "${@base_set_filespath([ "${FILE_DIRNAME}/${PF}", "${FILE_DIRNAME}/${P}", "${FILE_DIRNAME}/${PN}", "${FILE_DIRNAME}/${BP}", "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files", "${FILE_DIRNAME}" ], d)}"
>>>   # THISDIR only works properly with imediate expansion as it has to run
>>> diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
>>> index a40e74f..6f79e5e 100644
>>> --- a/meta/classes/gettext.bbclass
>>> +++ b/meta/classes/gettext.bbclass
>>> @@ -1,17 +1,17 @@
>>> -def gettext_after_parse(d):
>>> -    # Remove the NLS bits if USE_NLS is no.
>>> -    if bb.data.getVar('USE_NLS', d, 1) == 'no':
>>> -        cfg = oe_filter_out('^--(dis|en)able-nls$', bb.data.getVar('EXTRA_OECONF', d, 1) or "", d)
>>> -        cfg += " --disable-nls"
>>> -        depends = bb.data.getVar('DEPENDS', d, 1) or ""
>>> -        bb.data.setVar('DEPENDS', oe_filter_out('^(virtual/libiconv|virtual/libintl)$', depends, d), d)
>>> -        bb.data.setVar('EXTRA_OECONF', cfg, d)
>>> +def gettext_dependencies(d):
>>> +    if d.getVar('USE_NLS', True) == 'no':
>>> +        return ""
>>> +    if bb.data.getVar('INHIBIT_DEFAULT_DEPS', d, True) and not oe.utils.inherits(d, 'cross-canadian'):
>>> +        return ""
>>> +    return d.getVar('DEPENDS_GETTEXT', False)
>>>
>>> -python () {
>>> -    gettext_after_parse(d)
>>> -}
>>> +def gettext_oeconf(d):
>>> +    # Remove the NLS bits if USE_NLS is no.
>>> +    if d.getVar('USE_NLS', True) == 'no':
>>> +        return '--disable-nls'
>>> +    return "--enable-nls"
>>>
>>> -DEPENDS_GETTEXT = "gettext gettext-native"
>>> +DEPENDS_GETTEXT = "virtual/gettext gettext-native"
>>>
>>> -DEPENDS =+ "${DEPENDS_GETTEXT}"
>>> -EXTRA_OECONF += "--enable-nls"
>>> +BASEDEPENDS =+ "${@gettext_dependencies(d)}"
>>> +EXTRA_OECONF += "${@gettext_oeconf(d)}"
>>>
>>>
>>
>> a build from scratch revealed few more issues with this patch too.
>>
>> 1. We have to only remove gettext from dependencies if its a target
>> package for all other it still it needed otherwise all native and
>> cross tools start failing to build
>>   e.g. binutils-cross this can be easily solved by a patch
>>
>> iff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
>> index 6f79e5e..cc39204 100644
>> --- a/meta/classes/gettext.bbclass
>> +++ b/meta/classes/gettext.bbclass
>> @@ -1,5 +1,5 @@
>>   def gettext_dependencies(d):
>> -    if d.getVar('USE_NLS', True) == 'no':
>> +    if d.getVar('USE_NLS', True) == 'no' and not oe.utils.inherits(d,
>> 'native', 'nativesdk', 'cross')
>>           return ""
>>       if bb.data.getVar('INHIBIT_DEFAULT_DEPS', d, True) and not
>> oe.utils.inherits(d, 'cross-canadian')
>>           return ""
>>
>>
>> second problem is that EXTRA_OECONF when recipes override it instead
>> of += or appending etc.
>> then --enable|--disable-nls that we added via gettext_oeconf() is lost
>> as a result some packages complain about config.rpath
>> when USE_NLS is set to no the reason is their configure is missing the
>> argument --disable-nls this works ok
>> for eglibc based targets since default is to enable-nls if nothing is
>> specified but uclibc fails. As a testcase try to preprocess
>> utils-linux
>> recipe and check the contents of EXTRA_OECONF
>
> attached is a patch on top of this patch which fixes both the issues I
> mentioned. I also thought of defining USE_NLS to yes in
> native/cross/nativesdk classes but then I resorted to add the check in
> gettext.bbclass
>
Khem,

Are you refering to the changes above?  If so, it would be better to 
have it in a proper patch email, if you could resend with just the patch 
and comments that would be most appreciated.

Thanks
	Sau!

> Please review and apply if appropriate
>
> Thanks
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


