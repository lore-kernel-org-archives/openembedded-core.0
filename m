Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UHsic-0000mQ-CK
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 10:20:31 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 3EDF5D22E8; Tue, 19 Mar 2013 10:03:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 357D3D20D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 10:03:23 +0100 (CET)
Message-ID: <514829D6.3060607@linaro.org>
Date: Tue, 19 Mar 2013 10:03:18 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <D9D7124626ED1E43963D86B2657D5CCD03A69B7A@FRSNPREXC1.usr.ingenico.loc>
	<50117246.2030502@windriver.com>
	<CABcZAN=nH-rkHyVm8QwaFMyXmGPe=H3cAkM0kJkPsMLp82PEKw@mail.gmail.com>
	<50118D35.6070105@windriver.com> <1343332730.9574.4.camel@ted>
In-Reply-To: <1343332730.9574.4.camel@ted>
X-Enigmail-Version: 1.4.6
Subject: Re: SDK and external toolchain
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
X-List-Received-Date: Tue, 19 Mar 2013 09:20:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 26.07.2012 21:58, Richard Purdie pisze:
> On Thu, 2012-07-26 at 13:32 -0500, Mark Hatle wrote:
>> On 7/26/12 1:14 PM, Chris Larson wrote:
>>> On Thu, Jul 26, 2012 at 9:37 AM, Mark Hatle <mark.hatle at windriver.com> wrote:
>>>>> index 44284c3..f5fd4d7 100644
>>>>> --- a/meta/classes/toolchain-scripts.bbclass
>>>>> +++ b/meta/classes/toolchain-scripts.bbclass
>>>>> @@ -136,7 +136,7 @@ toolchain_create_sdk_env_script_for_installer () {
>>>>>    #we get the cached site config in the runtime
>>>>>    TOOLCHAIN_CONFIGSITE_NOCACHE = "${@siteinfo_get_files(d, True)}"
>>>>>    TOOLCHAIN_CONFIGSITE_SYSROOTCACHE =
>>>>> "${STAGING_DATADIR}/${TARGET_SYS}_config_site.d"
>>>>> -TOOLCHAIN_NEED_CONFIGSITE_CACHE = "${TCLIBC} ncurses"
>>>>> +TOOLCHAIN_NEED_CONFIGSITE_CACHE = "ncurses"
>>>>
>>>>
>>>> That is incorrect.. the CONFIGSITE_CACHE should be generated for the TCLIBC.
>>>> If you don't do that, then you will be running the same configure steps --
>>>> looking for basic glibc information over and over and over, causing a fairly
>>>> expensive performance penalty.
>>>
>>> No, he's right, this is a bug in toolchain-scripts.bbclass. We could
>>> work around it in the recipe via RPROVIDES_${PN}, but
>>> TOOLCHAIN_NEED_CONFIGSITE_CACHE feeds directly into task 'depends', so
>>> it's pulling in ${TCLIBC} explicitly rather than the more accurate
>>> 'virtual/libc'.
>>>
>>
>> The config site file though isn't called "virtual/libc".  My understanding what 
>> that all that variable did was set the list of config site files, but didn't 
>> directly affect the dependency mapping.  If it does, then there is a definite 
>> issue w/ dependency vs file mappings.
> 
> The trouble as I understand it is we need to know both the dependency
> name and the config/site cache name.
> 
> We'll probably have to change siteconfig.bbclass to generate libc_config
> instead of ${PN}_config (create an intermediate variable the libc
> recipes override).
> 
> We can then specify something like virtual/libc:libc in
> TOOLCHAIN_NEED_CONFIGSITE_CACHE. Of course that probably still won't
> work if you actually try and build meta-toolchain, we might just have to
> skip things that don't exist...

Issue is still present ;(



