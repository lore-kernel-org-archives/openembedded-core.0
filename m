Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UX8Lz-000458-Ch for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 13:04:31 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UX84H-0005h3-RO; Tue, 30 Apr 2013 12:45:53 +0200
Message-ID: <1367318753.14512.165.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <rpurdie@rpsys.net>
Date: Tue, 30 Apr 2013 11:45:53 +0100
In-Reply-To: <1367266208.5379.46.camel@ted>
References: <1349169606.32611.73.camel@phil-desktop>
	<1349176346.15753.139.camel@ted>
	<1349176541.32611.80.camel@phil-desktop>
	<1349177925.15753.140.camel@ted>
	<1366888374.14512.78.camel@phil-desktop.brightsign>
	<CABcZAN=jXZYpA4bt=RjvtK+ihusFe8birGaTC7z8FiRu+np2aQ@mail.gmail.com>
	<1367266208.5379.46.camel@ted>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: Chris Larson <clarson@kergoth.com>, Patches,
	oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: Debug Packaging (was: rootfs_ipk, image: Add debug capture support)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Apr 2013 11:04:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-04-29 at 21:10 +0100, Richard Purdie wrote:
> a) Should we ditch FILES_${PN}-dbg and have it auto constructed from
>any .debug directories? This would be a rather nice automation/cleanup.
>I can't see a pressing reason not to do this.
>
> b) Consider splitting it to a -dbg package per package where there are
> debug files as per above. There are pros and cons to this and I'm torn,
> see c).
> 
> c) Consider splitting the debug source into a separate package. If we
> did do b), the question is where should the sources go?

I think (b) would definitely be desirable for the reasons I mentioned
previously.  The obvious answer to (c) is that the sources should go in
a new ${PN}-debug-source kind of package and all the ${PN}-foo-dbg
packages can recommend it.

If we do do (b) then it seems as though (a) would just fall out in the
wash so there's probably no need to consider that explicitly.

I'd also quite like to separate the sources from the debug data since I
have at least some use-cases where I want the latter installed but not
the former.

> a) A binary from package X segfaults. You want to get good gdb data for
> why. You therefore install X-dbg. X links against Y. You therefore want
> the symbols/code for Y too so you can trace into the problem which may
> be in Y.

That's true up to a point, although most people probably don't need/want
the debugging symbols for (say) glibc installed even though their
program might well link against it.  There have been some other
occasions when I've wanted to deliberately exclude the debug data for
library dependencies, most notably webkit which has such a vast amount
of debug info that GDB can take several minutes to start when it's
installed.

Also, the above does apply specifically to the "links against" case, not
necessarily for everything in RDEPENDS.  For example, if I have a
package which includes a bash script and RDEPENDS on bash, that doesn't
mean that I want my X-dbg to start dragging in bash's debug data.

> b) You want to compile against X, you install X-dev. You expect anything
> X needs to link with (e.g. through any .pc file) to also be present.

Correct.  But again, this doesn't necessarily mean installing Y-dev for
every Y that X depends on; ideally the logic wants to be a bit smarter
than that.  Nowadays you probably can get most/all of the necessary bits
from pkgconfig for the majority of packages.

> c) You want to rebuild X and hence install X-dev to ensure the build
> dependencies are present.

I think this one is a separate issue and should be handled differently,
for example by encoding the build dependencies as a Build-Depends: field
in X's control data, or by generating an extra X-build-depends output
package which just depends on all the necessary things, or (for those
people using rpm at least) generating an SRPM which contains the right
bits in its spec file.  

Note that the set of things that X needs installed in order to build
itself might well be larger than the set of things that need installing
under scenario (b) above.  

> d) There was once an idea that you could do something like install
> core-image-minimal-dev to get the equivalent of core-image-minimal with
> dev-pkgs. I think we've found better ways to do this kind of thing now?

Agreed.

p.



