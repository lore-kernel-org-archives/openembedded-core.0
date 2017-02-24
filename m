Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with ESMTP id A803072F12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 20:39:18 +0000 (UTC)
Received: (qmail 1810 invoked by uid 1003); 24 Feb 2017 20:39:20 -0000
Received: from unknown (HELO ?172.16.133.249?)
	(philip@opensdr.com@192.94.38.34)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	24 Feb 2017 20:39:20 -0000
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <1487908800-18064-1-git-send-email-joe_macdonald@mentor.com>
	<CAMKF1sr0OxcRYC9OZsJBieR-MVFnw5XbfuKr+go8xnhgYDHstA@mail.gmail.com>
	<CA+chaQdJprDqs_aiMuWy6pRDB0WDM=fjnM6RqtLGv28EUCLOxg@mail.gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <d0fc6e64-0602-0389-5c2e-f89161b3885a@balister.org>
Date: Fri, 24 Feb 2017 12:39:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQdJprDqs_aiMuWy6pRDB0WDM=fjnM6RqtLGv28EUCLOxg@mail.gmail.com>
Cc: Joe MacDonald <joe_macdonald@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] deprecated.bbclass: Add a PNDEPRECATED variable for recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2017 20:39:20 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 02/24/2017 01:16 AM, Martin Jansa wrote:
>> If nobody speaks up within some
> amount of time the maintainer considers reasonable (I'm thinking a Yocto
> release
> cycle) then it's fair game to remove the recipe in question.
> 
> Maybe this is different case with at least some PNBLACKLIST entries we
> currently have, but
> I don't remove PNBLACKLISTed recipes, because as we discussed it's always
> easier to unblacklist
> recipe from e.g. DISTRO config if the issue doesn't affect you for whatever
> reason and causes
> less churn in the metadata when it gets unblacklisted.
> 
> And many PNBLACKLISTed recipes are also abandonware.
> 

I think we need to use a different "flag" for recipes that need
updating, and have maintained upstreams from recipes that have upstreams
that are abandoned.

So blacklist broken recipes with good upstreams and deprecate recipes
with dead upstreams.

Philip



> So my question is, if we will remove PNDEPRECATed recipes after one cycle,
> should we start
> removing PNBLACKLISTed recipes as well (maybe after 2 cycles?). In both
> cases it might backfire
> when someone will fail to find recipe for his favorite abandonware and will
> try to add completely
> new recipe for it, or we see someone restoring these recipes (e.g. in own
> layers instead of fixing
> the PNBLACKLIST/PNDEPRECATED reasons in original layer).
> 
> On Fri, Feb 24, 2017 at 5:55 AM, Khem Raj <raj.khem@gmail.com> wrote:
> 
>>
>> On Thu, Feb 23, 2017 at 8:00 PM Joe MacDonald <joe_macdonald@mentor.com>
>> wrote:
>>
>>> Based on the blacklist behaviour, recipes can be tagged as deprecated.
>>> Such recipes will produce a warning message when included in a build but
>>> unlike blacklisted recipes, the build will continue.
>>
>>
>> Perhaps this should also be documented in manuals
>>
>>>
>>>
>>> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>>> ---
>>>
>>> I threw this together a long time ago and never got around to sending it
>>> out for
>>> consideration, but after the excitement last week and this, I got
>>> thinking about
>>> it again and thought it might be useful.  My specific use-case for this is
>>> recipes I see in meta-networking that I know are largely abandonware but
>>> that I
>>> don't want to completely throw out without giving some kind of heads up.
>>> Obviously this is purely informational, there's no mechanism set up for
>>> purging
>>> deprecated recipes, that's intended to be a maintainer activity, but the
>>> idea
>>> would be that the maintainer would flag a recipe as deprecated (probably
>>> when
>>> it's become more trouble than it seems to be worth) and thereafter users
>>> would
>>> have fair warning that this thing is on notice.  If nobody speaks up
>>> within some
>>> amount of time the maintainer considers reasonable (I'm thinking a Yocto
>>> release
>>> cycle) then it's fair game to remove the recipe in question.
>>>
>>>  meta/classes/deprecated.bbclass    | 16 ++++++++++++++++
>>>  meta/conf/distro/defaultsetup.conf |  3 ++-
>>>  2 files changed, 18 insertions(+), 1 deletion(-)
>>>  create mode 100644 meta/classes/deprecated.bbclass
>>>
>>> diff --git a/meta/classes/deprecated.bbclass b/meta/classes/deprecated.
>>> bbclass
>>> new file mode 100644
>>> index 0000000..3dcdadb
>>> --- /dev/null
>>> +++ b/meta/classes/deprecated.bbclass
>>> @@ -0,0 +1,16 @@
>>> +# To use the deprecated recipe check, a distribution should
>>> +# include this class in the INHERIT_DISTRO
>>> +#
>>> +# Features:
>>> +#
>>> +# * To add a package to the deprecated list, set:
>>> +#   PNDEPRECATED[pn] = "message"
>>> +#
>>> +
>>> +addtask check_deprecated before do_fetch
>>> +python do_check_deprecated () {
>>> +    deprecated = d.getVarFlag('PNDEPRECATED', d.getVar('PN', True),
>>> False)
>>> +
>>> +    if deprecated:
>>> +        bb.warn("Recipe is deprecated: ", (deprecated))
>>> +}
>>> diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/
>>> defaultsetup.conf
>>> index ca2f917..16ece3a 100644
>>> --- a/meta/conf/distro/defaultsetup.conf
>>> +++ b/meta/conf/distro/defaultsetup.conf
>>> @@ -20,5 +20,6 @@ CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['',
>>> '/' + str(d.getVar('MACHINE'
>>>  USER_CLASSES ?= ""
>>>  PACKAGE_CLASSES ?= "package_ipk"
>>>  INHERIT_BLACKLIST = "blacklist"
>>> +INHERIT_DEPRECATED = "deprecated"
>>>  INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool"
>>> -INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO}
>>> ${INHERIT_BLACKLIST}"
>>> +INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO}
>>> ${INHERIT_BLACKLIST} ${INHERIT_DEPRECATED}"
>>> --
>>> 1.9.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
> 
> 
> 

