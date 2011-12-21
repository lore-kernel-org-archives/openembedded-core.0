Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RdRUW-0002c8-0c
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 20:06:16 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBLIx65I028184
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 10:59:08 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 21 Dec 2011 10:59:06 -0800
Message-ID: <4EF22C79.7080906@windriver.com>
Date: Wed, 21 Dec 2011 12:59:05 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1324441819.git.shane.wang@intel.com>
	<4EF17275.6080202@linux.intel.com>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12ED757FB6@shsmsx501.ccr.corp.intel.com>
	<4EF22273.3000007@linux.intel.com>
	<4EF228C9.6070606@linux.intel.com>
In-Reply-To: <4EF228C9.6070606@linux.intel.com>
Subject: Re: [PATCH 0/1] [RESEND]Create a script for SUMMARY audit in recipes
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
X-List-Received-Date: Wed, 21 Dec 2011 19:06:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/21/11 12:43 PM, Saul Wold wrote:
> On 12/21/2011 10:16 AM, Joshua Lock wrote:
>> On 20/12/11 22:10, Wang, Shane wrote:
>>> Saul Wold wrote on 2011-12-21:
>>>
>>>> On 12/20/2011 08:32 PM, Shane Wang wrote:
>>>>> Here is the script to check which recipe provides SUMMARY and which
>>>>> doesnot. For those which do not, maintainer should add or update to a
>>>>> meaningful summary for HOB to display in description.
>>>>>
>>>> Shane,
>>>>
>>>> I guess I am not understanding why this is needed.  Why can't we use
>>>> DESCRIPTION which is a required entry?  Use the first X Characters of
>>>> DESCRIPTION?
>>
>> There's a huge difference between a purposefully crafted 72 character
>> summary and a free-for all description field that will have to be
>> chopped to be displayed in the GUI. I originally chose summary as a
>> succinct 72 characters would fit much better in the available UI.
>>
>> Aside: according to the Yocto docs the SUMMARY field should fall back to
>> DESCRIPTION anyway. It's just that right now we do that at the package
>> back-end level for each package back-end.
>>
> Seems that's the other way around as coded, DESCRIPTION falls back to
> SUMMARY
>
> meta/conf/bitbake.conf:DESCRIPTION ?= "${SUMMARY}"

Ya, I believe the original work was the reverse.. SUMMARY was the first X number 
of characters from the DESCRIPTION, but that soon changed..

Then the next iteration, all of the descriptions become summary fields and 
DESCRIPTION inherited SUMMARY.

And then a default SUMMARY was added to maintain compatibility with older OE 
recipes.

> Which is why I think this issue is cropping up. So, then the proposal
> should really be to add SUMMARY to all recipes and initially make it a
> warning for now if non-existent SUMMARY as with DESCRIPTION and then
> remove the existing SUMMARY = ${PN}-${PV} ...??
>
> The audit would then be the list of warnings which later becomes error

I agree, this should become some kind of an audit warning, so we can improve the 
quality of the recipe information.  I'm not sure I want it to be an error though 
as it may impact folks with existing OE recipes...

--Mark

> Sau!
>
>>
>>> OK, then HOB has a bug. To use DESCRIPTION instead of SUMMARY. I am OK with that.
>>> Josh, Dongxiao, did you see any problem if I change that?
>>
>> I think it's the wrong solution.
>>
>> Joshua
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



