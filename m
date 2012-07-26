Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SuT2U-0006xP-IF
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 20:43:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6QIWMds025631
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 11:32:23 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.34.34) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 26 Jul 2012 11:32:22 -0700
Message-ID: <50118D35.6070105@windriver.com>
Date: Thu, 26 Jul 2012 13:32:21 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <D9D7124626ED1E43963D86B2657D5CCD03A69B7A@FRSNPREXC1.usr.ingenico.loc>
	<50117246.2030502@windriver.com>
	<CABcZAN=nH-rkHyVm8QwaFMyXmGPe=H3cAkM0kJkPsMLp82PEKw@mail.gmail.com>
In-Reply-To: <CABcZAN=nH-rkHyVm8QwaFMyXmGPe=H3cAkM0kJkPsMLp82PEKw@mail.gmail.com>
Subject: Re: SDK and external toolchain
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
X-List-Received-Date: Thu, 26 Jul 2012 18:43:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/26/12 1:14 PM, Chris Larson wrote:
> On Thu, Jul 26, 2012 at 9:37 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>> index 44284c3..f5fd4d7 100644
>>> --- a/meta/classes/toolchain-scripts.bbclass
>>> +++ b/meta/classes/toolchain-scripts.bbclass
>>> @@ -136,7 +136,7 @@ toolchain_create_sdk_env_script_for_installer () {
>>>    #we get the cached site config in the runtime
>>>    TOOLCHAIN_CONFIGSITE_NOCACHE = "${@siteinfo_get_files(d, True)}"
>>>    TOOLCHAIN_CONFIGSITE_SYSROOTCACHE =
>>> "${STAGING_DATADIR}/${TARGET_SYS}_config_site.d"
>>> -TOOLCHAIN_NEED_CONFIGSITE_CACHE = "${TCLIBC} ncurses"
>>> +TOOLCHAIN_NEED_CONFIGSITE_CACHE = "ncurses"
>>
>>
>> That is incorrect.. the CONFIGSITE_CACHE should be generated for the TCLIBC.
>> If you don't do that, then you will be running the same configure steps --
>> looking for basic glibc information over and over and over, causing a fairly
>> expensive performance penalty.
>
> No, he's right, this is a bug in toolchain-scripts.bbclass. We could
> work around it in the recipe via RPROVIDES_${PN}, but
> TOOLCHAIN_NEED_CONFIGSITE_CACHE feeds directly into task 'depends', so
> it's pulling in ${TCLIBC} explicitly rather than the more accurate
> 'virtual/libc'.
>

The config site file though isn't called "virtual/libc".  My understanding what 
that all that variable did was set the list of config site files, but didn't 
directly affect the dependency mapping.  If it does, then there is a definite 
issue w/ dependency vs file mappings.

--Mark


