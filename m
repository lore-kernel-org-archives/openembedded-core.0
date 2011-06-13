Received: from [77.233.226.4] (helo=mail.doredevelopment.dk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eha@dev.doredevelopment.dk>) id 1QW6i8-0008CR-25
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 14:57:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.doredevelopment.dk (Postfix) with ESMTP id E22E1CBAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 14:49:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at dev.doredevelopment.dk
Received: from mail.doredevelopment.dk ([127.0.0.1])
	by localhost (public.doredevelopment.dk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id PRkJozGk8cp9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 14:48:59 +0200 (CEST)
Received: from [192.168.2.145] (unknown [94.18.139.21])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: eha)
	by mail.doredevelopment.dk (Postfix) with ESMTPSA id B09B025FB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 14:48:58 +0200 (CEST)
From: Esben Haabendal <eha@dev.doredevelopment.dk>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307965969.15712.279.camel@rex>
References: <1307965969.15712.279.camel@rex>
Organization: DoreDevelopment ApS
Date: Mon, 13 Jun 2011 14:48:56 +0200
Message-ID: <1307969336.28936.16.camel@eha.ulstruplund.dk>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: RFD: Recipe variants, multilib and package handling
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
X-List-Received-Date: Mon, 13 Jun 2011 12:57:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-13 at 12:52 +0100, Richard Purdie wrote:
> Options
> =======
> 
> a) We could introduce some kind of suffix variable ${PKGSFX} which would
> contain the variant, maybe in conjuction with BPN instead of PN:
> 
> PACKAGES = "${BPN}${PKGSFX} ${BPN}-dev${PKGSFX}"
> FILES_${BPN}-dev${PKGSFX} = "x"
> 
> This has the downside of having to touch the whole metadata and it looks
> ugly.

In OE-lite, we have tried out this option a.  It works out pretty well,
but is ugly, and does to some degree make it more complex to manage
simple recipe meta-data.

For this reason, next OE-lite version will transition to something more
like the option b you suggest.

> b) We could try and remap all the variables at BBCLASSEXTEND time. This
> would mean remapping PACKAGES and renaming all the package specific
> variables such as FILES, SUMMARY, DESCRIPTION, RDEPENDS, RRECOMMENDS,
> RSUGGESTS, RPROVIDES, RREPLACES, ALLOW_EMPTY, SECTION and likely others.

In next OE-lite version, I have introduce something called "recipe
type", which is nothing else than the name from "BBCLASSEXEND", or
"machine" for default recipe type.

When resolving dependencies, I have introduced a recipe type context.
One for DEPENDS for each recipe type, and one for RDEPENDS for the
recipe types that is relevant for run-time dependency handling.

In recipe meta-data, you can fx. say

DEPENDS = "libncurses native:libtool"

Based on the recipe type context, the "libncurses" is prefixed with the
recipe type of the context, fx. "machine:libncurses" for machine recipe
type.

To further simplify recipe meta-data, I have introduced some generic
prefix aliases.  I have "host" and "target", and "host-cross" and
"target-cross", which is then mapped to the proper recipe type based on
the context.

This seems to work out very nicely.  I seems effective in reducing the
need for recipe type specfic overrides of DEPENDS variables, and makes
recipe meta-data much easier to read IMHO.

Of-course, OE-lite does only have package based dependencies, and I
haven't given any thought to how this would work out for OE's recipe
based build dependencies.

But perhaps it would also be a good choice for OE.

> I knew were were going to have to read through some of those variables
> and remap the dependencies but having to totally move them into new
> namespaces is a scary thought (but still possible).

Hehe.  In danish, we have a saying: "Hvo intet vover, intet vinder",
which I belive is something like "Nothing ventured, nothing gained" in
english.

> c) Switch to prepending to PN. This would only break cases where we have
> packages which don't start with ${PN} of which there are comparatively
> few. We could make the simplifying assumption that all PACKAGES start
> with ${PN} meaning that all manipulations would be simple prepends. If
> we do this, problems i) and ii) above are no longer an issue.
> 
> Discussion
> ==========
> 
> I don't think option a) above is viable and the current plan implies
> we'd do b) but its extremely ugly. I'm therefore tempted to look more
> seriously at c). The bigger issues would appear to be:
> 
> * It breaks with convention/tradition for OE (xxx-native vs native:xxx)
> * It would add the constraint of packaging starting with ${PN}
> * It would require changes to the likes of debian.bbclass to account 
>   for package prefixes when performing auto renaming
> * It would break a small set of the metadata where packages don't start 
>   with ${PN} (although the class could simply refuse to extend these 
>   automatically).

Looking into the future, wouldn't it make most sense to use the solution
broadly in OE, to avoid making it even harder to get started with OE?

> Things to consider:
> 
> * Would we just do this for multilibs or would we transition native 
>   recipes to the new style of naming? We don't have PACKAGES problems 
>   for native recipes.
> * Likewise, would nativesdk transition? Is has more PACKAGES problems 
>   so likely yes, it would make sense to transition.
> * Would we stick with "-" as a delimiter or switch to something like 
>   ":"?

I decided to switch from "-" to ":", to allow robust translation of
non-prefixed dependency names.

> Thoughts/suggestions/better ideas welcome...

Thanks,

Esben



