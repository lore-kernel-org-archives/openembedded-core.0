Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1URhuf-00024j-Kc for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 13:49:42 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FBWBW5005248; Mon, 15 Apr 2013 12:32:12 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eSHcV5Ptltd0; Mon, 15 Apr 2013 12:32:11 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FBW6BS005240
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 15 Apr 2013 12:32:08 +0100
Message-ID: <1366025504.8670.30.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Colin Walters <walters@verbum.org>
Date: Mon, 15 Apr 2013 12:31:44 +0100
In-Reply-To: <1366020508.2896.16.camel@localhost>
References: <1365848719.16702.74.camel@ted>
	<1365944532.5651.12.camel@localhost>  <1365953596.8670.9.camel@ted>
	<1366020508.2896.16.camel@localhost>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Burton, mclasen@redhat.com,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdk-pixbuf: Fix libpng determinism issues
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
X-List-Received-Date: Mon, 15 Apr 2013 11:49:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-04-15 at 06:08 -0400, Colin Walters wrote:
> On Sun, 2013-04-14 at 16:33 +0100, Richard Purdie wrote:
> > On Sun, 2013-04-14 at 09:02 -0400, Colin Walters wrote:
> > The more interesting change is:
> > 
> > https://git.gnome.org/browse/gdk-pixbuf/commit/configure.ac?id=d430bc4df3314a88cd538474d26ff7764d1f408c
> > 
> > and following that to the bugzilla 'For this to make sense, I changed
> > the order so that a version specific dep, such as libpng15 or
> > libpng12,
> > is found before just "libpng".'
> > 
> > I'm not sure I entirely follow that logic.
> 
> I added Matthias to CC as he touched this last then.
> 
> > I think the intent of the symlink is to provide the system with a
> > default libpng to use in the absence of a specific version requirement.
> > As the code stands today, each time a new libpng comes out, gdk-pixbuf
> > will need changes before it will be able to use it. 
> 
> Right, we need configure.ac changes, but the rationale behind that is
> that we'd also need *code* changes for each new major version of libpng.
> But it sounds like what you're saying is that gdk-pixbuf compiles and
> operates correctly with 1.6?  If that's the case, then the least
> invasive change here is to simply add 1.6.

It compiles and operates correctly as far as we can tell, yes.

Given that rationale, I'd suggest "libpng" should be dropped from the
list.

> Blah, I tried changing the gnome-ostree build to fetch libpng's v1.6.1
> git tag to test, but it hard requires Automake 1.13.
> 
> Anyways, if it works (looks like the latest oe-core has it), then
> what about the attached?

It will make our builds work again for now until the next time someone
upgrades libpng and and then it will potentially silently start using an
old version in some builds :(.

We're therefore probably going to get stuck carrying a patch for
this :/.

> > In the meantime, it
> > will potentially link against something old, e.g. 1.2, since 1.2 is in
> > the LSB 4.X spec so most LSB like systems would have 1.6 and 1.2.
> > 
> > If we can justify changing this upstream, that would be great :). It may
> > be worth adding libpng16 into the list too so everything is covered too.
> 
> At this point I'm hoping the parade of libpng versions will
> settle down, so hopefully no further tweaking of the configure script or
> code will be required...

Its the case things silently break that really worry me.

Cheers,

Richard



