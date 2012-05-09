Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SSCfl-0006LI-Qy for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 21:35:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q49JPnhT025463
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 20:25:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23680-07 for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2012 20:25:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q49JPdHq025456
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 20:25:42 +0100
Message-ID: <1336591537.2494.64.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 09 May 2012 20:25:37 +0100
In-Reply-To: <230ca87131ff1d90b63c277422b4c2386b638654.1336579481.git.mark.hatle@windriver.com>
References: <cover.1336579481.git.mark.hatle@windriver.com>
	<230ca87131ff1d90b63c277422b4c2386b638654.1336579481.git.mark.hatle@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/2] blacklist.bbclass: Rename to OE_BLACKLIST and minor cleanup
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
X-List-Received-Date: Wed, 09 May 2012 19:35:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-09 at 11:08 -0500, Mark Hatle wrote:
> Revise the handling from ANGSTROM_BLACKLIST to OE_BLACKLIST.  Preserved
> references to ANGSTROM_BLACKLIST for compatibility with existing users.
> 
> Rearrange a bit of the code to avoid unncessary steps if the package does
> not have a blacklist.
> 
> Change the message generation from a note to debug, adjust the SkipPackage
> message from:
> 
> <distro> DOES NOT support <recipe> because <reason>
> 
> to:
> 
> Recipe <recipe> is blacklisted: <reason>
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/blacklist.bbclass |   21 ++++++++++++---------
>  1 files changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/classes/blacklist.bbclass b/meta/classes/blacklist.bbclass
> index 7bf4a73..4bf6629 100644
> --- a/meta/classes/blacklist.bbclass
> +++ b/meta/classes/blacklist.bbclass
> @@ -1,20 +1,23 @@
>  # anonymous support class from angstrom
>  # 
> +# To use the blacklist, a distribution should include this
> +# class in the INHERIT_DISTRO
> +#
> +# Modified to allow default to OE_BLACKLIST, with a fallback
> +# to ANGSTROM_BLACKLIST for compatibility
> +#
>  # Features:
>  #
> -# * blacklist handling, set ANGSTROM_BLACKLIST_pn-blah = "message"
> +# * blacklist handling, set OE_BLACKLIST_pn-blah = "message"
>  #
>  
>  python () {
> -    import bb
> -
> -    blacklist = bb.data.getVar("ANGSTROM_BLACKLIST", d, 1)
> -    pkgnm = bb.data.getVar("PN", d, 1)
> -    distro = bb.data.getVar("DISTRO", d, 1)
> +    blacklist = d.getVar("OE_BLACKLIST", True) or d.getVar("ANGSTROM_BLACKLIST", True)

OE is pointless as a prefix here.

How about PNBLACKLIST?

I'm also adversed to underscores, particularly on short sets of letter
due to overrides (note to self about considering changing the override
character).

>      if blacklist:
> -	bb.note("%s DOES NOT support %s because %s" % (distro,pkgnm, blacklist))
> -        raise bb.parse.SkipPackage("%s DOES NOT support %s because %s" % (distro,pkgnm, blacklist))
> -
> +        distro = d.getVar("DISTRO", True)
> +        pkgnm = d.getVar("PN", True)
> +        bb.debug(2, "%s DOES NOT support %s because %s" % (distro, pkgnm, blacklist))
> +        raise bb.parse.SkipPackage("Recipe %s is blacklisted: %s" % (pkgnm, blacklist))
>  }

Lets also drop the distro bit and just say "Configured policy does not
support %s since %s".

We should also add a proper reason in here so how about we make
PNBLACKLIST a set of flags? This breaks compatibility but improves
usability and the message is a big part why we need this class in the
first place.

So the usage would be:

PNBLACKLIST[gconf-dbus] = "dbus support was merged into gconf"

Cheers,

Richard








