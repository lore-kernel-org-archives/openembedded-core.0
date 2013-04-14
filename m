Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1URPCr-0008TY-2o for openembedded-core@lists.openembedded.org;
	Sun, 14 Apr 2013 17:51:28 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3EFXd9u005469; Sun, 14 Apr 2013 16:33:40 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id x6O2H86EYUUp; Sun, 14 Apr 2013 16:33:39 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3EFXY3R005461
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sun, 14 Apr 2013 16:33:36 +0100
Message-ID: <1365953596.8670.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Colin Walters <walters@verbum.org>
Date: Sun, 14 Apr 2013 16:33:16 +0100
In-Reply-To: <1365944532.5651.12.camel@localhost>
References: <1365848719.16702.74.camel@ted>
	<1365944532.5651.12.camel@localhost>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Burton, openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sun, 14 Apr 2013 15:51:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2013-04-14 at 09:02 -0400, Colin Walters wrote:
> Is "libpng" the new canonical name for 1.6?

Its a symlink to libpng16.pc which is something libpng upstream's "make
install" provides.

>   I assume there was a reason
> it was listed last.  It looks like the current logic came from:
> 
> https://git.gnome.org/browse/gdk-pixbuf/commit/?id=ddedf5a2c2c63bfe8d6f04376cf2bba215a5eb19
>
> Which is a not very enlightening commit message.  It looks like the
> Fedora 18 "libpng" package provides both libpng.pc and libpng15.pc.
> RHEL6 has the same except it's libpng12.pc too.  My Ubuntu 12.10 VM has
> libpng12 with just libpng12.pc, no libpng.pc.

The more interesting change is:

https://git.gnome.org/browse/gdk-pixbuf/commit/configure.ac?id=d430bc4df3314a88cd538474d26ff7764d1f408c

and following that to the bugzilla 'For this to make sense, I changed
the order so that a version specific dep, such as libpng15 or libpng12,
is found before just "libpng".'

I'm not sure I entirely follow that logic.

> My main concern with this patch was ensuring that people aren't getting
> a suddenly ancient and deprecated libpng, but that seems unlikely, so
> unless there are other comments I can take care of turning this into
> "git format-patch" style and pushing upstream.

I think the intent of the symlink is to provide the system with a
default libpng to use in the absence of a specific version requirement.
As the code stands today, each time a new libpng comes out, gdk-pixbuf
will need changes before it will be able to use it. In the meantime, it
will potentially link against something old, e.g. 1.2, since 1.2 is in
the LSB 4.X spec so most LSB like systems would have 1.6 and 1.2.

If we can justify changing this upstream, that would be great :). It may
be worth adding libpng16 into the list too so everything is covered too.

Cheers,

Richard



