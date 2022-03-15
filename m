Return-Path: <arnout.vandecappelle@essensium.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <90368083-ea8c-fe09-a9ca-b4c23b55b9cd@essensium.com>
Date: Tue, 15 Mar 2022 15:38:36 +0100
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] sdk: support uppercase characters in MACHINE
References: <20220315135646.3687446-1-arnout@mind.be>
 <05c881e9-6518-9525-1182-1c447e865bae@theobroma-systems.com>
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout.vandecappelle@essensium.com>
In-Reply-To: <05c881e9-6518-9525-1182-1c447e865bae@theobroma-systems.com>
Content-Language: en-GB
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>, openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>


On 15/03/2022 15:24, Quentin Schulz wrote:
> Hi Arnout,
>
> On 3/15/22 14:56, Arnout Vandecappelle (Essensium/Mind) wrote:
>> There are no real constraints on the values that MACHINE can take, it's
>> perfectly possible to define a machine with uppercase letters, and
>> building for that machine works fine.
>>
>> However, the (extensible) SDK targets include packages and packagegroups
>> that have MACHINE in their name, and uppercase letters are not allowed
>> in package names.
>>
>> Therefore, convert the machine name to lowercase when it's used as a
>> package name: for meta-environment, meta-environment-extsdk,
>> packagegroup-cross-canadian, packagegroup-go-cross-canadian and
>> packagegroup-rust-cross-canadian. Propagate this change to other places
>> where those packages are referred to.
>>
>> Alternatively, it would be possible to outright disallow uppercase
>> letters in MACHINE. However, this would affect any existing
>> configuration that currently works fine except for building the SDK.
>>
>
> Overrides for machines starting with an uppercase letter have been broken and 
> might still be (I was bitten by this on Thud). I don't know if this issue 
> still applies after the migration to the newer override syntax though.
>
> e.g. FOO_Machine will not override FOO for Machine, it'll just create a new 
> variable named FOO_Machine instead.
>
> Also, I seem to recall some weird issue with uppercase letter in the middle of 
> package/recipe names. Bootlin discovered that issue in their training based on 
> Rocko (?) a few years back because of people trying to use nInvaders as the 
> recipe name instead of ninvaders. Pretty sure it was Alexandre who found the 
> issue (don't remember if we ultimately found out what the issue was or just 
> recommended not using uppercase letters at all).
>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>> I have only tested this with the base SDK, not with the extensible SDK.
>> I also haven't tested the changes to tclibc-baremetal, tclibc-newlib,
>> packagegroup-go-cross-canadian, packagegroup-rust-cross-canadian and
>> maintainers.inc. packagegroup-rust-cross-canadian doesn't even seem to
>> be used anywhere, so I guess this change would need to be propagated
>> somewhere externally.
>>
>> Ideally in addition to lowercasing, any other illegal package name
>> variables should also be removed or converted. It's less likely though
>> that other invalid characters would be used, since that will easily
>> break existing recipes. Also I couldn't find a conventient function to
>> make such a conversion.
>
> I'm not sure it's worth the added complexity and confusion instead of the 
> other way to do it which is to check for "harmful" characters in some critical 
> strings and flat out fail the build if one is met. But I guess something needs 
> to be done.
>
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#conditional-metadata 
> is the only place where I could read something about the allowed characters. I 
> guess we should explicit this in some other places, such as MACHINE in the 
> ref-manual.

  Ack, adding the list of allowed characters ([a-z0-9+-] I think - . is also 
allowed in PN but I'm not sure if it's OK for OVERRIDES) to the MACHINE 
documentation seems like an excellent idea.

  Even better would be a check (insane or other) that MACHINE is valid.


  Regards,
  Arnout


