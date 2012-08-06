Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SyTTh-0005KM-A9
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 22:00:37 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SyTIM-00042s-FX
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 21:48:54 +0200
Message-ID: <1344282424.4874.13.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 06 Aug 2012 20:47:04 +0100
In-Reply-To: <1344261864.9756.164.camel@ted>
References: <cover.1343926021.git.ross.burton@intel.com>
	<94E6EEF2-BA2A-4B68-A9CB-98133061274E@dominion.thruhere.net>
	<8242048D6F2A4934B1D6E6CB30CF8C3A@intel.com>
	<C94E9933-5642-406C-ACBC-2F0A13E6AB41@dominion.thruhere.net>
	<EC2F754A1E854583B06C4E1BF18AB5F9@intel.com>
	<132C9DB1-9203-4938-A080-7496B592D723@dominion.thruhere.net>
	<1344257012.9756.143.camel@ted>
	<1D87F6F5-E962-4348-A240-97BFA89CB913@dominion.thruhere.net>
	<1344261864.9756.164.camel@ted>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH V3 00/11] Mesa upgrade/improvements
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
X-List-Received-Date: Mon, 06 Aug 2012 20:00:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-08-06 at 15:04 +0100, Richard Purdie wrote:
> Ok, we need to do something about this mess, period. Its not going to
> get any better and we need to sort it out. I can't "force" changes in
> but on the other hand I'm not going to tie the hands of everyone just
> because the ARM world in particular is a total mess in this area.
> 
> As such, I'm likely going to allow architecture overrides in core mesa
> so for example, IA can enable gles and egl for everyone and cleanup
> their binary blobs to override them on platforms where it makes sense. I
> suspect someone will start sending patches to enable a generic arm core
> and I am going to have a *really* hard time refusing the patches due to
> any one silicon provider's binary blob issues.

It's not obvious to me that this is really an architecture-level problem
or that having different Mesa feature sets enabled on different
architectures is a positive thing. 

I'm also not totally convinced that any insurmountable problem actually
exists today with evil vendor blobs.  If they install themselves into
some directory that isn't /usr/lib and arrange for the dynamic linker to
find their libEGL.so (etc) ahead of the Mesa one then it seems like
everything should "just work" with today's technology.  As you observed,
sort of the whole point of the EGL/GL/GLES abstraction is that you have
a common API/ABI to write to irrespective of the implementation.

(Realistically, it seems fairly unlikely that there are very many
situations where using Mesa libGL on top of a vendor libEGL is going to
make much sense.  If you have vendor libEGL but not libGL then the
chances are you have GLES instead and this is probably what you want to
be using.)

So, all in all, I tend to think that we should just apply these patches
and then do whatever else is necessary for the evil-binary-vendor stuff
to be correctly packageable.

p.




