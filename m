Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 660E46D689
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 07:44:36 +0000 (UTC)
Received: from pb by hetzner.pbcl.net with local (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1VgV7u-00085N-0l; Wed, 13 Nov 2013 08:44:38 +0100
Date: Wed, 13 Nov 2013 08:44:38 +0100
From: Phil Blundell <pb@pbcl.net>
To: Lei Liu <layliu@gmail.com>
Message-ID: <20131113074438.GA31074@pbcl.net>
References: <52805D73.4050306@gmail.com>
	<1384300735.3828.40.camel@x121e.pbcl.net>
	<5282EBCC.4020401@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5282EBCC.4020401@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Disable building libgcc with -O0
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
X-List-Received-Date: Wed, 13 Nov 2013 07:44:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Nov 13, 2013 at 11:02:36AM +0800, Lei Liu wrote:
> On 2013年11月13日 07:58, Phil Blundell wrote:
> > On Mon, 2013-11-11 at 12:30 +0800, Lei Liu wrote:
> >> +def get_optimization(d):
> >> +    selected_optimization = d.getVar("SELECTED_OPTIMIZATION", True)
> >> +    if base_contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
> >> +        bb.note("libgcc can't be built with -O0, -O2 will be used instead.")
> >> +        return selected_optimization.replace("-O0", "-O2")
> >> +    return selected_optimization
> >> +
> >> +SELECTED_OPTIMIZATION := "${@get_optimization(d)}"
> > Do we really need a Python function for this?  It seems like a rather
> > heavyweight mechanism to detect what is basically just a distro
> > misconfiguration.
> 
> The python function is copied from eglibc recipe which does similar
> job to force build the package with optimization enabled.  I think
> it's not just a distro misconfiguration.  Sometimes it would be
> convenient for user to select a global -O0 optimization level (to
> create a more debug-friendly rootfs) for most packages, while
> automatically switching to -O2 for those which can't be built without
> optimizations.

Sometimes, perhaps, but automatically switching seems to violate the 
principle of least surprise.  If I've set CFLAGS to "-O0" in my distro 
configuration then that's what I would expect the recipes to be using.  
I would not expect random recipes to start second-guessing me and 
selecting different CFLAGS.

If I wanted to build libgcc with -O but everything else with -O0 then 
that's easy enough to achieve:

SELECTED_OPTIMIZATION = "-O0"
SELECTED_OPTIMIZATION_libgcc = "-O"

or whatever.

p.

