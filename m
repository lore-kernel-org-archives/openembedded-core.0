Received: from smtprelay-b21.telenor.se ([195.54.99.212])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RZ0t3-0001gP-Sc
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 14:53:17 +0100
Received: from ipb5.telenor.se (ipb5.telenor.se [195.54.127.168])
	by smtprelay-b21.telenor.se (Postfix) with ESMTP id 38D52CD5C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2011 14:46:27 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AroeAFsQ4k5T4zgTPGdsb2JhbAAMN6sRAQEBATeCJAEBAQECAQEBATU2CgYLCxUDCRYPCQMCAQIBDwYBGxQTBgIBAYgDCLYbiFiDGgSSS4IlimqHPg
X-IronPort-AV: E=Sophos;i="4.71,326,1320620400"; 
   d="scan'208";a="9292909"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.242]) ([83.227.56.19])
	by ipb5.telenor.se with ESMTP; 09 Dec 2011 14:46:26 +0100
Message-ID: <4EE21138.8070609@emagii.com>
Date: Fri, 09 Dec 2011 14:46:32 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1323286080.git.elizabeth.flanagan@intel.com>	<6c65669e1c223d59020c581750599c11ee222063.1323286080.git.elizabeth.flanagan@intel.com>	<20111207215306.GE6351@sakrah.homelinux.org>	<4EE170C6.2070201@emagii.com>
	<1323431158.5309.126.camel@ted>
In-Reply-To: <1323431158.5309.126.camel@ted>
Subject: Re: [PATCH 4/8] Add copyleft compliance class --- MAJOR BREAKAGE!!!!
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ulf@emagii.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 09 Dec 2011 13:53:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-12-09 12:45, Richard Purdie wrote:
> On Fri, 2011-12-09 at 03:21 +0100, Ulf Samuelsson wrote:
>> On 2011-12-07 22:53, Khem Raj wrote:
>>> On (07/12/11 11:34), Beth Flanagan wrote:
>>>> From: Christopher Larson<kergoth@gmail.com>
>>>>
>>>> Deploys sources for recipes for compliance with copyleft-style licenses
>>>> Defaults to using symlinks, as it's a quick operation, and one can easily
>>>> follow the links when making use of the files (e.g. tar with the -h arg).
>>>>
>>>> By default, includes all GPL and LGPL, and excludes CLOSED and Proprietary.
>>>>
>>>> Signed-off-by: Christopher Larson<kergoth@gmail.com>
>>>> ---
>>>>    meta/classes/copyleft_compliance.bbclass |   94 ++++++++++++++++++++++++++++++
>>>>    1 files changed, 94 insertions(+), 0 deletions(-)
>>>>    create mode 100644 meta/classes/copyleft_compliance.bbclass
>>>>
>>>> diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
>>>> new file mode 100644
>>>> index 0000000..5d9ab11
>>>> --- /dev/null
>>>> +++ b/meta/classes/copyleft_compliance.bbclass
>>>> @@ -0,0 +1,94 @@
>>>> +# Deploy sources for recipes for compliance with copyleft-style licenses
>>>> +# Defaults to using symlinks, as it's a quick operation, and one can easily
>>>> +# follow the links when making use of the files (e.g. tar with the -h arg).
>>>> +#
>>>> +# By default, includes all GPL and LGPL, and excludes CLOSED and Proprietary.
>>>> +#
>>>> +# vi:sts=4:sw=4:et
>>>> +
>>>> +COPYLEFT_SOURCES_DIR ?= '${DEPLOY_DIR}/copyleft_sources'
>>>> +
>>>> +COPYLEFT_LICENSE_INCLUDE ?= 'GPL* LGPL*'
>>>> +COPYLEFT_LICENSE_INCLUDE[type] = 'list'
>>>> +COPYLEFT_LICENSE_INCLUDE[doc] = 'Space separated list of globs which include licenses'
>> If the Ampersand is not accepted in the LICENSE string, then the recipes
>> below are broken.
>>
>>   From my latest build, at least recipes with "&&" fail...
>> This means that nothing really completes that I have tested.
>>
>> MAJOR BREAKAGE!!!!
>>
>> I think it would be better FIRST to fix the recipes, and then introduce
>> checking.
> I think the single ampersand is accepted, the double might no longer be.
Yes, the single ampersand works, but the double ampersand will break the 
build
as well as the slash '/'.


> Certainly oe-core does continue to work. I hadn't realised there were
> incompatibilities introduced by this patch :(
>
> Not sure what we should do about this at this point, probably fix the
> layers :/.
>
True, question is who and when ?

> Cheers,
>
> Richard
>


>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


-- 
Best Regards
Ulf Samuelsson
eMagii



