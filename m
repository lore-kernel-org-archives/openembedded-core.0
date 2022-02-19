Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <6bba214d8ca17f438191ca84b3a8c3a97da41e1d.camel@linuxfoundation.org>
Subject: Re: [oe] INCOMPATIBLE_LICENSES and WHITELIST_<license> usage
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Sat, 19 Feb 2022 00:44:37 +0000
In-Reply-To: <e7cbd76bf80a4403b1cf6fd0c4adc555@axis.com>
References: <7d187920-92f0-a0fe-22b9-a77a1c98fd7d@windriver.com>
	 <df167d230c66ea8a975e7bc4b8d731cf58798e81.camel@linuxfoundation.org>
	 <e7cbd76bf80a4403b1cf6fd0c4adc555@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Saul Wold <Saul.Wold@windriver.com>, "openembedded-architecture@lists.openembedded.org" <openembedded-architecture@lists.openembedded.org>, OE-core <openembedded-core@lists.openembedded.org>, OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>

On Fri, 2022-02-18 at 23:34 +0000, Peter Kjellerstedt wrote:
> Warning: wall of text ahead. Sorry about that, but I believe it is 
> important that we get this right if we are redesigning it.
> 
> TL;DR: see the end for the new suggested licensing variables.
> 
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-
> > devel@lists.openembedded.org> On Behalf Of Richard Purdie
> > Sent: den 18 februari 2022 15:14
> > To: Saul Wold <Saul.Wold@windriver.com>; openembedded-
> > architecture@lists.openembedded.org; OE-core <openembedded-
> > core@lists.openembedded.org>; OpenEmbedded Devel List <openembedded-
> > devel@lists.openembedded.org>
> > Subject: Re: [oe] INCOMPATIBLE_LICENSES and WHITELIST_<license> usage
> > 
> > On Thu, 2022-02-17 at 15:01 -0800, Saul Wold wrote:
> > > I am working on a proposal to re-write how INCOMPATIBLE_LICENSES is used
> > > and processed to possibly include a COMPATIBLE_LICENSES variable as
> > > well, see PeterK's email [0]
> > > 
> > > I am trying to determine the usage of WHITELIST_<license> which would be
> > > used to override a license that might be listed in INCOMPATIBLE_LICENSES
> > > variable.
> > > 
> > > Randy and I have done a quick and dirty survey of a 100 or so layers
> > > (thanks Randy) and could not find any real usage other than what's
> > > currently in OE-Core for WHITELIST_GPL-3.0.
> > > 
> > > If you are using WHITELIST_<license>, please let me reply with your
> > > usage.
> > > 
> > > 
> > > [0] https://lists.openembedded.org/g/openembedded-devel/message/95166
> > 
> > We need to be mindful that we need to resolve this to unblock the other
> > language changes and feature creep here is potentially problematic. I do 
> > think it is worth trying to improve things rather than blindly allowing 
> > the horrible syntax in this variable to continue though.
> > 
> > The test case we have for this currently is:
> > 
> > WHITELIST_GPL-3.0:pn-core-image-minimal = "bash"
> > 
> > so I'd wondered about an alternative of:
> > 
> > INCOMPATIBLE_LICENSE_EXCEPTIONS:pn-core-image-minimal = "bash:GPL-3.0"
> 
> You do not really need the license here (more than possibly as 
> information to anyone reading the code). Specifying that a package is 
> allowed in an image regardless of its licenses can just as well be 
> done by allowing the variable to take a list of packages:
> 
> INCOMPATIBLE_LICENSE_EXCEPTIONS:pn-core-image-minimal = "bash readline"

I'm not sure I agree with that. I get the feeling some people want to allow
these packages as long as they're with license X. Licenses can change over time
and this allows a safety net that if it changes, the exception has to be updated
too.

> An alternative (and in my opinion better) variable name would be:
> 
> IMAGE_ALLOW_PACKAGES:pn-core-image-minimal = "bash readline"
> 
> focusing on that this is a list of _packages_ allowed for a given 
> _image_. This does not explicitly mention licenses, but I do not 
> believe that is needed.

If you assume this isn't being done on license reasons, sure. Except see above,
I think this does need to account for licenses, at least the way many use it.

> After all there could be multiple reasons a package is not allowed in 
> an image and this variable would allow to 
> ignore them all because that is typically what you want to do: 
> specify that you really want that package in that image. I guess 
> this is in some sense the opposite of PACKAGE_EXCLUDE. And I guess 
> like :append vs :remove, if someone for some reason specifies a 
> package in both IMAGE_ALLOW_PACKAGES and PACKAGE_EXCLUDE, then the 
> later should win (to err on the side of caution).

How would IMAGE_ALLOW_PACKAGES work and be different to IMAGE_INSTALL? This
interface would likely confuse more users than it would help.

> For the case where you want to allow a recipe to be built despite 
> it using licenses that are otherwise not allowed you can simply use 
> 
> INCOMPATIBLE_LICENSE:pn-foo = ""
> 
> and don't really need a separate variable for it.

That is a good point and perhaps should influence how an
INCOMPATIBLE_LICENSE_EXCEPTIONS should be package based rather than recipe. I
doubt the pn- override existed when that variable was originally added.

> > I'm still of the opinion the AVAILABLE_LICENSES variable is something we
> > should be aiming to remove ultimately too, it has horrible issues with 
> > layers changing hashes for all recipes.
> 
> Since I was the one to introduce it, I will answer to that. It was 
> introduced so that it is possible to specify compatible licenses 
> instead of incompatible licenses by basically calculating the 
> incompatible licenses by taking the set of available licenses minus 
> the set of compatible licenses. If a mechanism to do that is 
> introduced, e.g., by adding support for a COMPATIBLE_LICENSES in 
> addition to INCOMPATIBLE_LICENSE, then I am of the opinion that we 
> can remove AVAILABLE_LICENSES again.
> 
> We also need this mechanism in the code for handling allowed vs 
> disallowed licenses because the current code really cannot handled a 
> list of many hundreds of incompatible licenses, which is what we got 
> after all SPDX licenses were added to OE-Core. The code is extremely 
> inefficient and evaluates the list of incompatible licenses over and 
> over again. In our case that meant the recipe IMAGE_ALLOW_PACKAGESparsing time tripled.

Ironically, part of the reason I want to change the design of WHITELIST_XXX is
that it forces code that doesn't perform well. You may be surprised to find that
this change actually improves that 3x issue you've seen. If not, I think it
would lead us in a direction where it can certainly help.

> That said, we really need two sets of variables. One for blocking 
> the building of recipes because of its license(s), and one for 
> preventing packages with disallowed licenses to be included in a 
> given image. These are very different use cases and they take 
> totally different lists of items (recipes vs packages). The current 
> mess where the same variables are used for both cases needs to be 
> resolved.
> 
> So why do we need both cases? The first case where recipes are 
> prevented from being built makes it possible to, e.g., prevent a 
> newer versioned recipe that uses GPL-3.0-or-later to be built and 
> instead build an older version that uses GPL-2.0-or-later (i.e., 
> what meta-gplv2 can be used for today). 
> 
> The second case allows to build code that uses disallowed licenses, 
> as long as the packages are not added to the image. Why is this 
> useful? Because many recipes are built for some packages that are 
> never used in the given image, and it is then much easier to allow 
> them to be built as long as their output is not used. E.g., very 
> many recipes depend on bash which is GPL-3.0-or-later, making it 
> near impossible to avoid having to build it. However, it is 
> perfectly possible to build production images that do not need bash 
> to be installed.
> 
> I believe for this second case we should have two variables, 
> IMAGE_COMPATIBLE_LICENSES and IMAGE_INCOMPATIBLE_LICENSES. And to 
> make the naming clear for the first case, I would suggest calling 
> those variables RECIPE_COMPATIBLE_LICENSES and 
> RECIPE_INCOMPATIBLE_LICENSES.
> 
> Also note that the use of RECIPE_COMPATIBLE_LICENSES and 
> RECIPE_INCOMPATIBLE_LICENSES is mutually exclusive, as is the use 
> of IMAGE_COMPATIBLE_LICENSES and IMAGE_INCOMPATIBLE_LICENSES. I.e., 
> you will have to choose whether to specify what licenses to allow 
> or what licenses to disallow. You cannot do both. This is because 
> specifying a list of compatible licenses means that all other 
> licenses are by definition incompatible, and vice versa. However, 
> this also means that it makes perfect sense to be able to, e.g., 
> specify a few RECIPE_INCOMPATIBLE_LICENSES together with a list of 
> IMAGE_COMPATIBLE_LICENSES.

I suspect there will be people who will want configurations where they specify
that they are happy with X and definitely don't want Y to work. The unspecified
licenses would effectively be compatible but not be explicitly specified. It
seems like an odd setup but I can imagine people configuring it and wanting it
to work.

I am very worried about the performance implications in this "every license" in
a compatible list. Obviously for the case your legal department cares about, you
have to do it but I'm not sure we want to force it onto everyone (and
AVAILABLE_LICENSES already heads in that direction).

> Oh, and another thing I would like to take the opportunity to raise 
> is whether we should continue to support patterns in these list, or 
> if we should change it so that the lists of licenses need to 
> explicitly specify all licenses. The latter would greatly simplify 
> the code, especially when combined with only allowing SPDX names.
> If we decide to remove support for patterns, and based on the 
> assumption that the pattern is typically used to specify "*GPL-3.0*", 
> we could make available a variable or two that contain the typical 
> sets of GPL licenses. This would also allow us to remove the code 
> that handles how an or-later licenses specified as '<license>+' 
> should be treated in combination with patterns.

I'd love to remove it but it is something which people want and now expect from
the code. You might not like it, others do. How do we please everyone? I don't
think we'd be able to remove that, only perhaps limit it a little more.

> So, to reiterate, these are the variables that I suggest we adopt 
> to be able to handle the various use cases regarding licenses:
> 
> RECIPE_COMPATIBLE_LICENSES   - list of compatible licenses for 
>                                recipes
> RECIPE_INCOMPATIBLE_LICENSES - list of incompatible licenses for 
>                                recipes
> IMAGE_COMPATIBLE_LICENSES    - list of compatible licenses for 
>                                packages in images
> IMAGE_INCOMPATIBLE_LICENSES  - list of incompatible licenses for 
>                                packages in images
> IMAGE_ALLOW_PACKAGES         - list of packages allowed in the 
>                                image regardless of licenses and 
>                                other restrictions
> 
> This also means that the old WHITELIST_*, INCOMPATIBLE_LICENSE 
> and AVAILABLE_LICENSES variables are removed. I also suggest we 
> remove the support for patterns in the new variables.

Whilst I don't just want to map WHITELIST_* to something renamed, I think the
above is a bit too radical to get into this late in the release cycle so I
suspect we'll have to compromise. This discussion needed to happen early in the
cycle with people actively working on it.

Just to be really clear, in particular I detest IMAGE_ALLOW_PACKAGES as a
variable name. I think you're trying to be too wide in scope with "other
restrictions" and it will just confuse people.

Cheers,

Richard


