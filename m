Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 3DBAA6D0D0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 18:44:03 +0000 (UTC)
Received: (qmail 11141 invoked by uid 1003); 8 Jan 2014 18:44:04 -0000
Received: from unknown (HELO ?192.168.1.122?)
	(philip@opensdr.com@71.171.41.155)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	8 Jan 2014 18:44:04 -0000
Message-ID: <52CD9C72.20309@balister.org>
Date: Wed, 08 Jan 2014 13:44:02 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <CAJTo0LZsBfxGm=OJPa++egDjL6L0ZABMebTtTr_Bmw_TdQrohg@mail.gmail.com>
	<52B8DECA.6060704@balister.org>
	<CAJTo0LaEgLWZHk34e-_-+z69Zw3J+S1zGFFJAONjfYBDQ1TehQ@mail.gmail.com>
	<1389200502.6899.112.camel@ted>
In-Reply-To: <1389200502.6899.112.camel@ted>
X-Enigmail-Version: 1.6
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Poky Project <poky@yoctoproject.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Piglit in Poky
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
X-List-Received-Date: Wed, 08 Jan 2014 18:44:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/08/2014 12:01 PM, Richard Purdie wrote:
> On Wed, 2014-01-08 at 16:09 +0000, Burton, Ross wrote:
>> Hi,
>>
>> Despite a good start this thread got rapidly hijacked, so let's try again!
>>
>> On 24 December 2013 01:09, Philip Balister <philip@balister.org> wrote:
>>>> 1) Move piglit and deps to oe-core.  Piglit is for QA purposes only
>>>> and pushes the boundaries of "core platform".  In a sense this is a
>>>> repeat of the discussion we had with Midori...  does oe-core contain
>>>> everything needed to sufficiently exercise the core components it
>>>> ships or not?
>>>
>>> I expect Richard will push back on this, and I would support him here.
>>
>> Probably best to let Richard speak for himself here. :)
> 
> :)
> 
> I have to admit I'm leaning towards pulling in the 4 recipes we need
> since the win is we get to test the GL stacks.
> 
> We do support graphics in the core, we also do particularly badly at
> testing it. That is something I think we need to change. piglit lets us
> do that and its not like it has a significant number of dependencies.
> Having a couple more python modules to test the python stack probably
> isn't a bad idea ether. We pruned quite a number of recipes out, this is
> a case where we can add a small number for a significant win.

Does this mean you will fix the host contamination that occurs when
machines have atals and/or blas devel packages installed :)

We should probably look carefully at the numpy recipe if we go this route,

Philip

> 
>>>> 2) Add piglit and deps to meta-yocto.  Probably a new layer called
>>>> meta-yocto-qa (or similar) because the Yocto Compatible guidelines
>>>> forbid mixing distribution policy and recipes.  We'd need to sync
>>>> meta-yocto-qa with the pieces of meta-oe that we want somehow, but
>>>> that's our problem.
>>>
>>> So meta-yocto is right out. I'm a user of numpy, and I certainly do not
>>> want to include something called meta-yocto-qa just to pick up numpy.
>>
>> Right, so my point with the syncing was that this meta-yocto-qa layer
>> would be a copy of recipes from other places through combo-layer, and
>> would be clearly marked as such.
>>
>> Reviewing the options:
>>
>> 1) Add python-mako, python-numpy, waffle and piglit to oe-core, for
>> all BSPs to use.
>> 2) Add python-mako, python-numpy, waffle and piglit to meta-yocto
>> (effectively read-only clones with combo-layer, maintained in meta-oe
>> still) for Poky to use.
>> 3) Add meta-python layer to Poky, and waffle/piglit to meta-yocto
>> (read-only clones) for Poky to use.
>>
>> Paul raises a good point about other BSPs potentially using Piglit to
>> test their GL stacks.  Do any other BSPs test their GL integration,
>> and if so what tooling to they use?  I'm only pushing for Piglit
>> because it's what the Intel driver team use to test Mesa, but if
>> nobody else wants to use it then that's an argument for keeping it in
>> Poky (or even cloning it into meta-intel?).
> 
> I'm in favour of 1). If there is significant community push back against
> that, I will go for 4) a kind of hybrid of 2/3 which is:
> 
> 4) use combo-layer filtering technology to import just the files we want
> from the meta-oe repo into the poky repo.
> 
> The plus of 4) is that it would showcase a usage of combo-layer which is
> currently underused and IMO should be used more. Equally, I think 4)
> might not be liked by some. If would however fulfil the needs the Yocto
> Project has in this area.
> 
> I would still prefer 1) though.
> 
> Cheers,
> 
> Richard
> 
> 
> 
> 

