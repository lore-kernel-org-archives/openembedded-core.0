Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Re8fF-0006GG-A1
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 18:12:13 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBNH54d9018475
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2011 09:05:04 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 23 Dec 2011 09:05:03 -0800
Message-ID: <4EF4B4BD.9050005@windriver.com>
Date: Fri, 23 Dec 2011 11:05:01 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAPhnLPByP_W+1La9svcgud_yc9WAsP3U9_oCVBGiarZu_YKkdA@mail.gmail.com>
	<1661045.RyWPXMxtTU@helios>
In-Reply-To: <1661045.RyWPXMxtTU@helios>
Subject: Re: [RFC] LICENSE Standards
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
X-List-Received-Date: Fri, 23 Dec 2011 17:12:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/23/11 10:44 AM, Paul Eggleton wrote:
> Hi Beth,
>
> Great work on this. A few comments below:
>
> On Tuesday 20 December 2011 08:17:22 Flanagan, Elizabeth wrote:
>> - In most cases, LICENSE is set for the recipe, however, a recipe that
>> contains multiple packages, all of whom may have a distinct LICENSE,
>> would throw an inaccurate LICENSE into the manifest. We've seen a few
>> examples of LICENSE_<package_name>, but it is a rare occurrence.
>
> Do you have a feeling as to how common this is? I've not done any
> comprehensive study but presumably this is the exception rather than the rule?
> (Perhaps this is only a matter of wording in the above.)

This is common enough, in my experience, that we have to have a way to support 
it.  The primary example I have is gettext.  The core gettext binary is GPLv3, 
while the libraries are still LGPLv2.1.  This can make a huge impact when 
someone is evaluating weather that can use the current version of gettext or not 
in a system.

>> - The LICENSE operands need to be dealt with through a license
>> priority map. The plan is to implement this within the next few weeks.
>
> Could you elaborate on what the license priority map is?

I'd not commented on this before, but I'm not sure that is possible.  Most 
licenses, that offer multiple choice, are written that it's up to the user to 
choose the appropriate license.  I believe we can set reasonable defaults within 
the OE environment.  But in the end the user has to choose the license they want 
to use for a particular package.  (Some packages I've seen allow you to choose 
the license on the configure line, which has a side effect of disabling certain 
functionality -- this is very rare though.)

Perhaps a companion variable to LICENSE that the user can set, that details 
their choice.  (Other then the existing black listed license, in the future I 
can see someone write an audit tool that looks for possible licensing conflicts 
-- it's more likely to be needed then.)

>> Proposed Solutions
>> ================
>>
>> Decide on a standard.
>> ------------------------------
>>
>> I would suggest that new recipes follow the SPDX naming convention
>> with support for the OE convention maintained for a period of time (my
>> suggestions is 24 months to enable layer maintainers to update with
>> warnings turned on if this RFC is adopted). LICENSE fields not
>> following SPDX should be corrected as they are audited.
>
> Sounds reasonable, I think that we additionally ought to put in warnings for
> mapped licenses now if we go ahead with this - perhaps if we're going to
> update oelint.bbclass (something I came across recently) it could be extended
> to understand and report mappings?

I firmly believe using SPDX naming is a good first approach.. specifically for 
the items listed below.  (For items outside of the SPDX naming, there should be 
a way to specify "other" and what that other means..  consider it a namespace, 
with the default namespace being SPDX.)

>> Adopting SPDX will do a few things for us:
>>
>> - This will allow us to support an open source project dedicated to
>> license standards, allowing us to leverage their work and expertise.
>>
>> - It will also allow us to support recipes that use (or are planning
>> to use) the SPDX standard .
>>
>> - It gets us out of the business of maintaining a licensing standard.
>
> I think OE history has shown we're not great at this by ourselves so this
> definitely sounds good.

Whenever the SPDX tooling and license data starts to be produced, we'll want to 
have a way to include this with the recipes.  I suspect we have enough 
facilities today to be able to do this, so nothing special will be needed.

>> LICENSE audit
>> ----------------------
>> Some LICENSE fields are either unparsable, have no version when one is
>> required (GPL/GPL-2.0), or are factually wrong. I would suggest we
>> spend time auditing these fields over the next few months using the
>> following guidelines
>>
>> - All LICENSE fields must be ast parsable.
>>
>> - All LICENSE fields should be updated to whatever standard is decided
>> upon and documented, with mapping for other conventions for a period
>> of time
>>
>> - All LICENSE fields should support
>
> Should support ... ?
>
>> - If a LICENSE field references a non-existent common-license, we
>> either add the common-license or ask the author if we may be permitted
>> to license under a generic (see less for an example).
>
> I'm wondering about another possibility - for those pieces of software where
> we cannot get permission for a generic license, have a mechanism for the
> recipe to point to the license file within the source that should be copied to
> the output, thus avoiding "uncommon" licenses being copied into the common
> license dir. It could even be as simple as an additional flag for one of the
> files listed in LIC_FILES_CHKSUM. Would that work and be worthwhile?

That seems reasonable.  Annoying as it is, I've seen a few packages where the 
license text is simply a magic URL.  So adding the facility to fetch the license 
text from a URL and include it is likely a good idea as well.  (Since my 
understanding is you are bound by the license at the time you download the 
software -- so matching the download to the license text is a good safety net. 
This could also have ramifications of caching/mirroring downloads as well..) 
Again, this is rare, but something I've run into before.  (It seems fairly scary 
to me that the only license text for a program would be on a web page that the 
copyright holder is allowed to modify at any time they choose.. which is why 
mirroring the text is important in that case.)

>> - We should actually split common-licenses into spdx-licenses and
>> alternative-licenses. This will allow us to pull license text from
>> SPDX and maintain spdx-licenses as a pure form of the provided
>> licenses. There is already a bug opened with the SPDX group to provide
>> some sore of repository for this. Additional licenses that are non-OSI
>> compliant (like Adobe's free license) should be moved to
>> alternative-licenses. Licenses that are OSI compliant should be
>> upstreamed to SPDX.
>
> Unless "alternative" is a term SPDX uses I would suggest using "other" or some
> other word since "alternative" implies some form of choice. Otherwise this
> sounds reasonable.

Let me clarify something about SPDX.  There is no such thing as an 
"spdx-license".  What they have done is created a set of common names that refer 
to common license texts.  It's up to the recipe creator to verify that the 
common text is what is within the package.

SPDX really refers to an XML format for meta data related to a given software 
package.  This file will include the standardized naming for a given license (if 
there is one), along with key information relating to copyright and license 
statements within every source file in that package.  The SPDX data is designed 
to go down to the file level and give someone performing a license audit all of 
the information they may potentially need to determine the (legal) suitability 
of a piece of software for their needs.

>> For licenses that are non-OSI compliant, I would suggest we use the SPDX
>> format:
>>
>> Where there is a specified version of the license:
>> <LICENSE_ABBREVIATION>-<VERSION>
>> Example: AFL-1.3
>>
>> Where no specified version of the license exists:
>> <LICENSE_ABBREVIATION>
>> Example: Adobe
>
> Clearly this is just an example, but I imagine we would want to be more
> specific as I'm sure like many commercial vendors, Adobe has many licenses
> under which they have released software.

Going back to the namespace idea.. perhaps:  Other:Adobe   This would clearly 
label the item as not being in the SPDX namespace.

>> Field Operators
>> ----------------------
>> The LICENSE parser currently does not act upon Field Operators. It
>> grabs all licenses mentioned within the LICENSE field. The plan is to
>> implement LICENSE priority, which will utilize field these operators
>> and decides on the correct license based on priority. For example, if
>> we were to weight BSD as a higher priority than GPL-2.0, when the
>> parser hit "BSD | GPL-2.0" it would use BSD for the package. However,
>> there seems to be no clear definition around how field operators are
>> used.
>>
>> I would suggest the following:
>>
>> &  : This package/recipe includes multiple files with different
>> licenses. These licenses must be included together
>>
>> | : This package/recipe is dual licensed.
>>
>> + : This package/recipe has a voluntary upgrade path
>>
>> () : Used to group licenses decision parameters.
>
> Sounds like it should cover all the bases.
>
>> I've seen reference to "/" and "&&" and ",". I don't see a purpose for these
>> operators and short of a clear need, I would suggest their removal.

& and | I believe are "obvious".  And cover the case of the "/", "&&" and "," 
above.  I'm not sure exactly how using the "+" and "()" will be.  The single 
"license" field has to the cover the package as whole -- anything at a split 
level will need to be covered by license_pn -- and anything that is file level 
will need to be rolled up into the license_pn for the associated split item.

I would expect in the gettext example that something like the following is in 
the recipe:

LICENSE = "GPLv3 & LGPLv2.1"
LICENSE_gettext = "GPLv3"
LICENSE_libgettext = "LGPLv2.1"

That way it's clear what the overall source license is, as well as the split 
package licenses.  (Of course this is a corner case, as most things the package 
license and the split package license are the same.)

--Mark

>
> Definitely agreed.
>
> Cheers,
> Paul
>



