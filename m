Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id B534560D74
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 22:46:21 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id z5so2411168lbh.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 14:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=E4/xbxApFx6Og1aappvAHLJc7c221YySRPdEXrlUXmY=;
	b=lP1/6ZRg8I+L4UosLKI+uXxTvyIXNm0/cpGrkcAT1D/rVb9bJIN7eoWMRLior9T5qa
	9WRhL4mV1XpbWqYo8iETCsE6UA0ystU8Oqfyg0U2knVNw4NfkOu5aYertcMoxroFqyoe
	eM4lue0GRnaCme/AYLbcIyT69cltWXf3fSX/z4xw1dTCGhRRFHvpK37NPaEsXVfU4zON
	8ZcPd5Bdaf38QC7Hz/s+E7THeQc8hb4MxaURfvpua4PoLryeyi5cHQ6Hz/j2gnkrmMFy
	Cv73pV7V0q/y922cWbgEM1drsRS22yeRmTMtHI46V1OC2lnv3w9EUdAYi4pfyvzXoweA
	Al0w==
MIME-Version: 1.0
X-Received: by 10.152.121.3 with SMTP id lg3mr20657078lab.0.1384901182971;
	Tue, 19 Nov 2013 14:46:22 -0800 (PST)
Received: by 10.112.14.200 with HTTP; Tue, 19 Nov 2013 14:46:22 -0800 (PST)
In-Reply-To: <1384900947.16887.32.camel@ted>
References: <cover.1381266484.git.bruce.ashfield@windriver.com>
	<9f62e2e632692c5919a0de25a785d17d477a64b3.1381266484.git.bruce.ashfield@windriver.com>
	<20131119173725.GA13018@mcrowe.com>
	<1384883174.23724.116.camel@phil-desktop.brightsign>
	<CADkTA4Pd1pqS8wf-BbGRy2becWpQNtzx9V0cmrrEy9OOc9N+mg@mail.gmail.com>
	<CADkTA4PSaf3PQOAnpv_mt769WRgb6vj2TGM04T9=O++p+9_9jw@mail.gmail.com>
	<5E5EE01A-4572-41FA-88DC-9F08DA17B040@gmail.com>
	<CADkTA4ODwRaRMVehxmjjoA=iozbH2LhBKqiHyNLwvB_9n_D_mg@mail.gmail.com>
	<1384900947.16887.32.camel@ted>
Date: Tue, 19 Nov 2013 17:46:22 -0500
Message-ID: <CADkTA4OrF_h47d25xJSU6ZdhoSV30Bg1XKngTOXS2wqdKXRS+w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kernel: restore scripts in the sysroot
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
X-List-Received-Date: Tue, 19 Nov 2013 22:46:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 19, 2013 at 5:42 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2013-11-19 at 17:37 -0500, Bruce Ashfield wrote:
>>
>> Exactly. And I had windriver bug with the same symptoms as yours. It
>> was a package
>> that built its own modules, and hence never called this either.
>>
>> > and my recipes did override module_do_compile task but not do_compile like below
>> >
>> > module_do_compile() {
>> >         oe_runmake
>> > }
>> >
>> > so, is comment wrong there should it say module_do_compile instead ?
>> >
>> > will it work with sstate always ?
>> >
>> > it will be OK to revert it if thats the case.
>>
>> I'll come up with something that works in all cases. The sstate fix is
>> better from the point
>> of view that it is transparent to the recipes, and they don't need to
>> do anything special
>> for the support.
>>
>> So my proposal is this:
>>
>>  - fix the new bug at hand by making the sstate change depend on the
>> toolchain (I agree
>>    that patching the scripts to not reference the target toolchain
>> isn't a good idea since not
>>   all kernels get the rix).
>
> Can we please not do this? Adding in toolchain dependencies into the
> sstate code whilst possible, is going to massively complicate the
> dependency chains and is a last possible resort. I bought that argument
> in the useradd case since there are horrible issues there. We don't have
> that issue here.
>

Works for me. I just wonder if there's another way to handle things
more gracefully ? i.e. somehow check if the toolchain isn't available
and warn, otherwise continue making the scripts ?

> In kernel terms, its safer/easier to hack the kernel makefiles than
> expecting sstate to work well with dependencies like that embedded in
> it.

It is pretty simple to make the change. Just making it available everywhere
is the trick.

>
>>  - remove the modules-base.bbclass scripts recreation, so we only have
>> one scripts
>>    restore in the tree.
>>
>> Alternatively, recipes need to be fixed to call the
>> modules-base.bbclass routine to restore
>> scripts, and I think it is obvious that won't work in all cases.
>
> Which cases won't that work in?
>
> As far as I'm concerned, people using module-base are taking a loaded
> gun and are expected to use it safely (which means calling
> do_make_scripts somehow). People wanting a safer ride can use module
> which adds the appropriate task for them.

I've got people not using any of the above .. yes, I know they are evil
too :)

>
> The comments in the bbclass files do need fixing but that is trivial to
> sort out.
>
>> I'll wait for comments/concensus before sending a new patch (which
>> needs to be tested
>> on all the cases), but in the meantime, the patches to the list to fix
>> the sstate solution are good to be applied.
>
> I will respectfully disagree ;-).

No patch from me for this then. That's why i waited, I figured it wouldn't
be immediate agreement.

Bruce

>
> Cheers,
>
> Richard
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

