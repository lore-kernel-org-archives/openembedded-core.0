Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QhBpa-0002Fb-4a
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 04:39:14 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6E2ZDqB026845
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 19:35:13 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 13 Jul 2011 19:35:13 -0700
Message-ID: <4E1E55E0.8040307@windriver.com>
Date: Wed, 13 Jul 2011 21:35:12 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4E1E18AA.2050808@mentor.com>	<4E1E447A.2060703@windriver.com>	<4E1E49FD.3020500@mentor.com>	<4E1E4E08.8040802@windriver.com>
	<4E1E4F46.8030101@mentor.com>
In-Reply-To: <4E1E4F46.8030101@mentor.com>
Subject: Re: siteinfo for recipes oe-core lacks?
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
X-List-Received-Date: Thu, 14 Jul 2011 02:39:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/13/11 9:07 PM, Tom Rini wrote:
> On 07/13/2011 07:01 PM, Mark Hatle wrote:
>> On 7/13/11 8:44 PM, Tom Rini wrote:
>>> On 07/13/2011 06:20 PM, Mark Hatle wrote:
>>>> On 7/13/11 5:14 PM, Tom Rini wrote:
>>>>> Hey all,
>>>>>
>>>>> Do we have an opinion on siteinfo for recipes that oe-core lacks?  I
>>>>> have two easy examples:
>>>>> - mono: neither meta-oe nor oe-core have a recipe, we have siteinfo
>>>>> stuff specific to it.  Ignore it? drop it?  update it with what meta-oe has?
>>>>> - postgresql: meta-oe has it, oe-core lacks it.  Keep in meta-oe only?
>>>>>
>>>>
>>>> For both of them, I'd keep them as local to the recipe as possible.. no recipe,
>>>> no siteinfo listed.
>>>
>>> Well, I think we're missing the forest for the trees.  But that's not
>>> really a workable idea since it's sizeof this and that stuff.
>>>
>>> To give you a third example, I've ported this commit over to oe-core:
>>> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=bb12cd9c0a757e6ef696d57923821829f00ace79
>>>
>>
>> I think I wasn't clear.  What I meant was that the siteinfo stuff should be as
>> close to the recipe as possible.  But that doesn't preclude it from being in a
>> layer specific siteinfo file.
> 
> When you say close do you mean layer/site/ or
> layer/recipes-foo/app/something/ ?  I saw oe-core had some sort of hook
> for site files in yet another place but I also couldn't find anything
> using it (in addition to the sitecache stuff).

I've seen three examples in the system.

meta/recipes-ncurses/ncurses.inc:

CONFIG_SITE =+ "${WORKDIR}/config.cache

which is referring to:

meta/recipes-core/ncurses/ncurses-5.9/config.cache

This is what I consider the recipe level.  The items here should ONLY exist if
it's specific to the one package.. (In the ncurses case, I think that may not be
true, so this example itself might be an example of what not to do.)

and then the fall back is layers/site/.  Each layer should be allowed to have a
set of site files.. the only tricky bit is when there are collisions with
conflicting values.. generally I'd say the last layer included wins.. but I'm
not sure if that is the right answer.

The third level is whats -provided- by (e)glibc, uclibc, ncurses, and zlib.  For
packages that provide functionality, that other items in the system heavily rely
on.  They should be responsible for providing their own site config files to the
system.  The third level (looking at eglibc) works by including a directory
called "site_config" within a recipe.  If that directory exists there is code in
siteconfig.bbclass that will automatically generate a configure script.  Run it
against the current state of the sysroot, and provide those results to be used
for future recipes.

Inside of the site_config directory are three files.  "funcs", "headers" and
"types".  These contains references to function calls, headers and types that we
should be generating the autoconf for so we can pre-populate the cache.  Note,
as currently implemented the items here expect a working autoconf script.  So
this is not a way to provide known values for things that can't be discovered.

There really should be a fourth file here with is known-values.  Then the
contents could be provided in the existing siteinfo format to allow a program to
statically provide configuration information.  This can be used for things like
the mktemp, mkstemp, etc behaviors that programs try to discover but can't due
to being unable to run programs.

The initial purpose of this third type is performance over hard coding values..
prepopulating libc, ncurses, and zlib values made a sizeable configure
performance difference in testing we did a while back.  But the items needed to
be dynamic due to variations in libc configuration, and even ABI configuration
(such as MIPS64 n32 where the void and long sizes don't match either MIPS or
MIPS64.)

Adding the known values would give it the ability to also answer the failure
questions -- and again keep it local to the recipe providing the functionality.

>> Keeping the information as local to recipe as possible helps with maintenance
>> IMHO.  There is nothing worse then after a few years looking over a siteinfo
>> file and seeing 100 entries and having no idea if they are still relevant, or
>> how someone came to specific results.
> 
> Agreed, I'm toying with tossing all of the files out and seeing what's
> needed now (since also there's useless stuff, and probably a few more
> bugs lurking).
> 

I suspect most of the stuff in the existing siteinfo files is bogus -- or should
be local to the recipe that needs it.  My biggest fear with any of this siteinfo
stuff is two packages that use the same variable name but have completely
different intentions with the data.  I have seen this behavior in the past which
is why a global "growing" config.cache doesn't work.. (i.e. using the
config.cache from one recipe to the next.)

--Mark


