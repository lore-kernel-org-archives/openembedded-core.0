Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 3B62A7887A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 13:38:16 +0000 (UTC)
Received: from [10.1.14.230] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 76DE415D3;
	Thu, 19 Jul 2018 15:38:16 +0200 (CEST)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180719100714.9639-1-dv@pseudoterminal.org>
	<20180719110720.GA1436@jama>
	<1eb8494d-fb4b-1585-3502-4142548345a5@pseudoterminal.org>
	<20180719121252.GB1436@jama>
	<bfaa505c-1ffe-3c22-e0f3-9a06f4fab4bc@pseudoterminal.org>
	<20180719132046.GC1436@jama>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <26d1dd91-a30d-a8db-61f9-5f1a3cf59520@pseudoterminal.org>
Date: Thu, 19 Jul 2018 15:38:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180719132046.GC1436@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/6] gstreamer1.0-plugin-base: Update packageconfigs
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
X-List-Received-Date: Thu, 19 Jul 2018 13:38:16 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

The main problem I see with all of this - aside from filling the recipes 
with packageconfigs that may or may not become actually usable in the 
future - is that when the packageconfig recipes don't yet exist, you are 
essentially speculating. Even the *names* of the dependencies may turn 
out to be different in the future (foo vs. libfoo for example). Or 
perhaps you need to include more dependencies, like what can happen with 
OpenGL ES (it also needs libEGL).


On 2018-07-19 15:20, Martin Jansa wrote:
> On Thu, Jul 19, 2018 at 02:47:58PM +0200, Carlos Rafael Giani wrote:
>>
>> On 2018-07-19 14:12, Martin Jansa wrote:
>>> On Thu, Jul 19, 2018 at 01:16:51PM +0200, Carlos Rafael Giani wrote:
>>>> As a general rule, I think adding packageconfigs to an oe-core recipe
>>>> that has dependencies outside of oe-core and meta-openembedded is
>>>> questionable. Take the qt5 packageconfig for example. It is *not* part
>>>> of gstreamer1.0-plugins-good in oe-core, and for good reason - it needs
>>>> extra switches for passing paths to moc, uic etc.
>>> I don't see what's questionable with that. PACKAGECONFIG is just a way
>>> to pass configure options like EXTRA_OECONF just with benefit that it's
>>> easily switched from outside and that it encapsulates build time and
>>> runtime dependencies together with the options.
>>>
>>>> Now, what if a recipe outside of oe-core and meta-openembedded is just
>>>> like that? It needs its own customizations, its own switches. It would
>>>> be better off setting up its own packageconfig, just like what that
>>>> bbappend in meta-qt5 does.
>>> If someone submits PACKAGECONFIG addition for something which only
>>> exists in his own layer, I'm fine with that, why should we make it
>>> harder for people to use oe-core or meta-oe recipes?
>> Adding a .bbappend that adds the packageconfig does not sound hard to
>> me. However, having packageconfigs whose dependencies may or may not be
>> dead (because of the layer being dead) sounds more like a maintenance
>> problem.
> It's not too hard, but completely unnecessary when the PACKAGECONFIG was
> already there in oe-core and you're removing it for no good reason.
> Especially if such PACKAGECONFIG needs to be added by multiple people in
> multiple projects instead of just once in the recipe where it belongs.

libvisual is not in oe-core or meta-openembedded, otherwise I would have 
added it. As for zlib etc. I already added them back in in v2 of the 
patches.

> And it brings annoying issues like the gstreamer bbappend in meta-qt5
> without any good reason.
>
> Carrying libdrm PACKAGECONFIGs in my bbappend was simple enough, but
> then Ross migrated libdrm from autotools to meson and instead of simply
> updating the PACKAGECONFIGs to the format used by meson atomically with
> the meson migration in the same commit I had to update the .bbappend,
> which caused my layer to require new oe-core again (to have the meson
> migration, because the PACKAGECONFIG isn't backwards compatible) and at
> that time I've rather submitted all my PACKAGECONFIGs to oe-core instead
> of maintenance burden to keep them locally.

As said, I can then agree to add packageconfigs for recipes that already 
exist somewhere. But adding them speculatively with not-yet-existing 
dependencies is an entirely different matter. I wouldn't do that. 
Instead, I'd keep the --disable-twolame etc. switches around.

> Congrats! but it still doesn't mean we should add more of them without
> good reasons, right?

Sure, but avoiding them is not a high priority for me. They are more of 
an annoyance than an outright problem.


> And what about people who have libvisual in their layer (from
> meta-debian or meta-qt5-extra or written from scratch) are they also now
> responsible for maintaining bbappend PACKAGECONFIG for gstreamer?

Yeah, at least initially. If some layer introduces a recipe that happens 
to have a corresponding plugin in base/good/bad/ugly, it makes sense to 
add a .bbappend at first. Later on, you can patch oe-core if it sounds 
like having this packageconfig in a central place makes sense. To me, 
this sounds like a more modular approach.


>> Eh, I don't think I can agree with that approach. Having an openexr
>> packageconfig for example implies that this packageconfig is actually
>> usable and gstreamer1.0-plugins-bad can be built with it enabled. But
>> adding it without an openexr dependency? Sounds broken to me. This is
>> why I prefer to keep such features disabled until there is a recipe for
>> them in meta-openembedded.
> It's not broken, it just isn't well tested. Everybody tests only the
> explicitly disabled path until someone actually tries to enable it,
> which is exactly the same for disabled PACKAGECONFIG and --disable-foo
> in EXTRA_OECONF.
>
> I'm not saying that these features should be enabled! Of course not,
> they cannot be for features which require extra dependencies from other
> layers. I'm just saying that --disable-twolame from
> PACKAGECONFIG[twolame] is much better than --disable-twolame from
> EXTRA_OECONF, because is easy to enable without the .bbappend and in
> most cases it will work if you provide necessary dependencies or show
> reasonable error showing what you need to provide.
>

It is not about them being enabled, but about what happens if someone 
sees these packageconfigs and tries to enable them. Then, oops, they 
don't work, because the dependency is non-existent. So, if this 
packageconfig _cannot_ work because the dependency doesn't exist yet 
anywhere in any layer, why is this packageconfig there in the first place?

For example, the libneon recipe got removed because upstream is dead. 
Would you still keep its packageconfig around just in case someone 
decides to bring back the recipe for their own personal layer?
(Ironically, I just noticed that I made a mistake by _not_ removing the 
neon packageconfig while still adding --disable-neon to EXTRA_OECONF ..)

