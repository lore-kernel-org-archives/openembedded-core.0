Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QdjkG-0004UZ-So for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 16:03:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p64DxW95018681;
	Mon, 4 Jul 2011 14:59:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18453-02; Mon,  4 Jul 2011 14:59:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p64DxP3t018675
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 4 Jul 2011 14:59:25 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: celston@katalix.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309780493.20200.17.camel@desktop.home>
References: <1309780493.20200.17.camel@desktop.home>
Date: Mon, 04 Jul 2011 14:58:56 +0100
Message-ID: <1309787936.20015.676.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PROPOSAL] Package feature switches, redux.
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
X-List-Received-Date: Mon, 04 Jul 2011 14:03:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-04 at 12:54 +0100, Chris Elston wrote:
> Since responses to my previous mail were generally positive, I've
> reworked the package feature switches so that the interface is as RP
> suggested.
> 
> In the recipe for foo you would have a set of features defined like
> this:
> 
> PACKAGE_CONFIG[bar] = "--enable-bar, --disable-bar, libbar"
> PACKAGE_CONFIG[baz] = "--enable-baz, --disable-baz, libbaz"
> 
> The default set of features for the package would be defined with:
> 
> PACKAGE_FEATURES ?= "bar baz" 
> 
> Perhaps this set of features could go into a metadata field in the .ipk
> - would this be helpful for feed users?
> 
> The package features can then be tailored in a config/layer with
> something like:
> 
> PACKAGE_FEATURES_pn-foo = "baz pop"
> 
> If a layer requests a feature not supported by the recipe, you get a
> warning (should help distro maintainers detect bitrot in their layer):
> 
> WARNING: foo: Unknown feature 'pop' requested
> 
> The patch below uses gstreamer as an example of something which would
> benefit from this:

Looks good, thanks.

My main concern is still the PACKAGE_FEATURES variable. I've been
meaning to reply to your original email about this.

I understand your issue that you want to be able to do this on a per
package basis. I suspect you also see my concern about maintain this
centrally as a distro decision primarily rather than letting things
descend into more of a free for all.

FWIW, even if done centrally using DISTRO_FEATURES, you can customise on
a per recipe basis if you ever needed to, e.g.:

DISTRO_FEATURES = "a b c ${MYDISTROTWEAKS}"
MYDISTROTWEAKS = "d e f"
MYDISTROTWEAKS_pn-gstreamer = "e"

Now I'd agree this is a bit ugly but I think it would encourage less
misuse of the variable.

Any thoughts on that?

Cheers,

Richard



