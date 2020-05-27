Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web10.7547.1590590834627454780
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 07:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 49XDFC1k7gz5tlJ;
	Wed, 27 May 2020 16:47:11 +0200 (CEST)
Date: Wed, 27 May 2020 16:47:09 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/5 v2] multilib/recipes: Use new RecipePostKeyExpansion event
Message-ID: <20200527144709.jdp5ehgrfxhbyidw@qschulz>
References: <20200526215725.992258-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <20200526215725.992258-1-richard.purdie@linuxfoundation.org>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Richard,

On Tue, May 26, 2020 at 10:57:21PM +0100, Richard Purdie wrote:
> There are issues with multilib due to the ordering of events where some
> functions see the remapped multilib dependencies and some do not. A significant
> problem is that the multilib class needs to make some changes before key expansion
> and some afterwards but by using existing event handlers, some code sees things
> in a partially translated state, leading to bugs.
> 
> This patch changes things to use a new event handler from bitbake which makes the
> ordering of the changes explcit.
> 
> The challenge in doing this is that it breaks some existing anonymous python and
> dyanmic assignments. In some cases these used to be translated and no longer are,
> meaning MLPREFIX has to be added. In some cases these are now translated and the
> MLPREFIX can be removed.
> 
> This change does now make it very clear when MLPREFIX is required and when it is
> not, its just the migration path which is harder. The patch changes the small number
> of cases where fixes are needed.
> 
> In particular, where a variable like RDEPENDS is conditionally extended (e.g.
> with an override), MLPREFIX is now required.
> 
> This patch also reverts:
> base: Revert 'base.bbclass: considering multilib when setting LICENSE_EXCLUSION'
> 
> This reverts 6597130256a1609c3e05ec5891aceaf549c37985 as the changes
> to multilib datastore handling mean its no longer necessary.
> 

Is it possible to link the bugzilla entry in the commit log?

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13865

Otherwise, the main question is: do builds actually show warnings or
fail if MLPREFIX is forgotten in some places? I'm thinking about other
layers needing similar changes.

In either case, maybe a proper "note" in the migration steps for the
impacted release would be a good addition I think?

Some nitpicking/cosmetic review:

[...]
> -        self.d.setVar(varname, bb.utils.join_deps(newdeps, False).replace("EXTENDPKGV", "${EXTENDPKGV}"))
> +        if not varname.endswith("_NONML"):
> +            #if varname == "DEPENDS":

Is it an actual comment or is it a leftover of some debugging session?

[...]
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index fede691d6ff..bb43a9a8b65 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -212,18 +212,20 @@ python __anonymous() {
>                ("gles", "libgles3",)):
>          if not p[0] in pkgconfig:
>              continue
> -        fullp = p[1] + "-mesa"
> -        pkgs = " ".join(p[1:])
> +        mlprefix = d.getVar("MLPREFIX")
> +        fullp = mlprefix + p[1] + "-mesa"
> +        mlprefix = d.getVar("MLPREFIX")

Duplicate mlprefix = d.getVar("MLPREFIX"). Any reason for that?

[...]

Thanks a bunch for the patches, I know it was painful.
Quentin
