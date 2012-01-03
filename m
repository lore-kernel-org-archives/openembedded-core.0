Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Ri86B-0006X5-9O
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 18:24:31 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q03HH9Hb013535
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Jan 2012 09:17:09 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 3 Jan 2012 09:17:08 -0800
Message-ID: <4F033817.5070608@windriver.com>
Date: Tue, 3 Jan 2012 11:17:11 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <CAPhnLPByP_W+1La9svcgud_yc9WAsP3U9_oCVBGiarZu_YKkdA@mail.gmail.com>
	<1661045.RyWPXMxtTU@helios> <4EF4B4BD.9050005@windriver.com>
	<1343229.xEIsd0XE4e@helios>
In-Reply-To: <1343229.xEIsd0XE4e@helios>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 03 Jan 2012 17:24:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/28/11 5:39 AM, Paul Eggleton wrote:
> On Friday 23 December 2011 11:05:01 Mark Hatle wrote:
>>> On Tuesday 20 December 2011 08:17:22 Flanagan, Elizabeth wrote:
>>>> - In most cases, LICENSE is set for the recipe, however, a recipe that
>>>> contains multiple packages, all of whom may have a distinct LICENSE,
>>>> would throw an inaccurate LICENSE into the manifest. We've seen a few
>>>> examples of LICENSE_<package_name>, but it is a rare occurrence.
>>>
>>> Do you have a feeling as to how common this is? I've not done any
>>> comprehensive study but presumably this is the exception rather than the
>>> rule? (Perhaps this is only a matter of wording in the above.)
>>
>> This is common enough, in my experience, that we have to have a way to
>> support it.  The primary example I have is gettext.  The core gettext
>> binary is GPLv3, while the libraries are still LGPLv2.1.  This can make a
>> huge impact when someone is evaluating weather that can use the current
>> version of gettext or not in a system.
>
> I guess all I was questioning was the wording, I agree we need the mechanism.
> If we say something like "Some recipes may produce output packages where some
> of the packages have a distinct license, in which case the individual package
> licenses should be specified separately using LICENSE_<package_name>".

I'm straying (I suspect) from the original topic.. but it just occurred to me. 
In the gettext case, if we allow it to be built then the package feeds could end 
up with a GPLv3 program that could be sucked into a filesystem image in an 
unintended way.

It might make sense as part of this work, to check (while writing the packages?) 
that the licenses are not in the blacklist.  If they are, we know the item was 
needed for some compilation bit -- but has been whitelisted by the user --  we 
could then avoid actually writing the package into the deploy/feed directory.

In the case of gettext, we would write out libgettext only.

>>>> - The LICENSE operands need to be dealt with through a license
>>>> priority map. The plan is to implement this within the next few weeks.
>>>
>>> Could you elaborate on what the license priority map is?
>>
>> I'd not commented on this before, but I'm not sure that is possible.  Most
>> licenses, that offer multiple choice, are written that it's up to the user
>> to choose the appropriate license.  I believe we can set reasonable
>> defaults within the OE environment.  But in the end the user has to choose
>> the license they want to use for a particular package.  (Some packages I've
>> seen allow you to choose the license on the configure line, which has a
>> side effect of disabling certain functionality -- this is very rare
>> though.)
>
> I guess this might be what the priority map is supposed to do, assuming the
> user can configure the map...?

The users choice of license in package X may affect the behavior of package Y. 
So it's important we have a way for a user to say "I choose this" license. 
(User in this case is an oe-core user.. not an end-user!)

This is where license compliance gets complicated and it's easy to make 
mistakes.  The goal of all of this is to make it easier to prevent and/or catch 
mistakes before they cause (unintended) problems.

>> Perhaps a companion variable to LICENSE that the user can set, that details
>> their choice.  (Other then the existing black listed license, in the future
>> I can see someone write an audit tool that looks for possible licensing
>> conflicts -- it's more likely to be needed then.)
>
> I was thinking along these lines and I know Beth was also. Whatever scheme is
> used, IMO the user needs to be warned when the system makes a LICENSE
> selection, particularly if the "reasonable defaults" are being used.
>
>> Annoying as it is, I've seen a few packages where
>> the license text is simply a magic URL.  So adding the facility to fetch
>> the license text from a URL and include it is likely a good idea as well.
>> (Since my understanding is you are bound by the license at the time you
>> download the software -- so matching the download to the license text is a
>> good safety net. This could also have ramifications of caching/mirroring
>> downloads as well..) Again, this is rare, but something I've run into
>> before.  (It seems fairly scary to me that the only license text for a
>> program would be on a web page that the copyright holder is allowed to
>> modify at any time they choose.. which is why mirroring the text is
>> important in that case.)
>
> I would say when we come across such packages we should be strongly
> encouraging the authors to include the license within the distributed source.
> Of course they may very likely just ignore our request, but we should make it
> all the same.
>
>>>> - We should actually split common-licenses into spdx-licenses and
>>>> alternative-licenses. This will allow us to pull license text from
>>>> SPDX and maintain spdx-licenses as a pure form of the provided
>>>> licenses. There is already a bug opened with the SPDX group to provide
>>>> some sore of repository for this. Additional licenses that are non-OSI
>>>> compliant (like Adobe's free license) should be moved to
>>>> alternative-licenses. Licenses that are OSI compliant should be
>>>> upstreamed to SPDX.
>>>
>>> Unless "alternative" is a term SPDX uses I would suggest using "other"
>>> or some other word since "alternative" implies some form of choice.
>>> Otherwise this sounds reasonable.
>>
>> Let me clarify something about SPDX.  There is no such thing as an
>> "spdx-license".  What they have done is created a set of common names that
>> refer to common license texts.  It's up to the recipe creator to verify
>> that the common text is what is within the package.
>
> Sure, I understand this.
>
>> SPDX really refers to an XML format for meta data related to a given
>> software package.  This file will include the standardized naming for a
>> given license (if there is one), along with key information relating to
>> copyright and license statements within every source file in that package.
>> The SPDX data is designed to go down to the file level and give someone
>> performing a license audit all of the information they may potentially need
>> to determine the (legal) suitability of a piece of software for their
>> needs.
>
> Right, I recall reading about this part of SPDX that we don't yet make use of
> in the past.
>
>>>> Where no specified version of the license exists:
>>>> <LICENSE_ABBREVIATION>
>>>> Example: Adobe
>>>
>>> Clearly this is just an example, but I imagine we would want to be more
>>> specific as I'm sure like many commercial vendors, Adobe has many
>>> licenses under which they have released software.
>>
>> Going back to the namespace idea.. perhaps:  Other:Adobe   This would
>> clearly label the item as not being in the SPDX namespace.
>
> That could work, yes. I'm a little bit wary of introducing any more complexity
> to the LICENSE field but if we're adopting SPDX license naming then having a
> separate "namespace" (perhaps we ought to just use the word "prefix" to keep
> things simple) would be a useful distinction.
>
>> &  and | I believe are "obvious".  And cover the case of the "/", "&&" and
>> "," above.  I'm not sure exactly how using the "+" and "()" will be.
>
> If you want to express the "GPL, version 2 of the license or (at your option)
> any later version" then you need +, or the field just becomes too unweildy. The
> brackets start to make things complicated, but there are some pieces of
> software out there where the authors have made the licensing very complicated;
> if&  and |  are to be combined in the one LICENSE field you need to make it
> clear which "operator" applies first.

The SPDX naming already has the "or at your option" factored into the naming in 
some way.  I believe it already uses the "+".  (I was thinking when I originally 
read that that you were saying GPLv2 + GPLv3.. which is why I didn't understand 
the context.)

I'd treat the "+" as simply part of the name of the license, with no specific 
contextual meaning.

Any tools that are created that do any type of auditing will need to know that a 
package with name XYZ is or is not compatible with a package with the name ABC. 
  Also the permutations that with the user being able to "select" a license. 
They could simply state I chose to license this as GPLv3 (even though it was a 
GPLv2+)..  Lots of permutations, I don't think we'll capture all of the corner 
cases.. but it's something to be aware of.

>> I would expect in the gettext example that something like the following is
>> in the recipe:
>>
>> LICENSE = "GPLv3&  LGPLv2.1"
>> LICENSE_gettext = "GPLv3"
>> LICENSE_libgettext = "LGPLv2.1"
>>
>> That way it's clear what the overall source license is, as well as the split
>> package licenses.  (Of course this is a corner case, as most things the
>> package license and the split package license are the same.)
>
> If we express it this way and continue to have the INCOMPATIBLE_LICENSE check
> at recipe selection time, we will continue to need a whitelist for gettext
> (unless this check is changed to use only the projected package contents of
> the image).

Goes back to my earlier comment.  We should have a way to generate just the 
LGPLv2.1 portion of the code.  My concern is this could be tricky if someone 
copies something directly to the sysroot and it's used for later development... 
so we need some protection around this particular corner case.

gettext itself is blacklisted, and I wouldn't want it in the feed.. but 
libgettext should be allowed....

--Mark

> Cheers,
> Paul
>



