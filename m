Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1UWugJ-0001W9-KR
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 22:28:22 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3TKBvOx020329; Mon, 29 Apr 2013 21:11:57 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id exlQtJxFhjou; Mon, 29 Apr 2013 21:11:57 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3TKBo7V020325
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 29 Apr 2013 21:11:51 +0100
Message-ID: <1367266208.5379.46.camel@ted>
From: Richard Purdie <rpurdie@rpsys.net>
To: Chris Larson <clarson@kergoth.com>
Date: Mon, 29 Apr 2013 21:10:08 +0100
In-Reply-To: <CABcZAN=jXZYpA4bt=RjvtK+ihusFe8birGaTC7z8FiRu+np2aQ@mail.gmail.com>
References: <1349169606.32611.73.camel@phil-desktop>
	<1349176346.15753.139.camel@ted>
	<1349176541.32611.80.camel@phil-desktop>
	<1349177925.15753.140.camel@ted>
	<1366888374.14512.78.camel@phil-desktop.brightsign>
	<CABcZAN=jXZYpA4bt=RjvtK+ihusFe8birGaTC7z8FiRu+np2aQ@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: layer <openembedded-core@lists.openembedded.org>, Patches
Subject: Debug Packaging (was: rootfs_ipk, image: Add debug capture support)
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
X-List-Received-Date: Mon, 29 Apr 2013 20:29:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-04-27 at 17:15 -0400, Chris Larson wrote:

> On Thu, Apr 25, 2013 at 7:12 AM, Phil Blundell <pb@pbcl.net> wrote:

>         I'm not quite sure what the right way to fix (2) is.  I
>         suppose in an
>         ideal world the -dbg packages would be separated in the same
>         way the
>         parent binary packages are, but that doesn't look entirely
>         straightforward to arrange.
> 
> I had implemented something along these lines back in oe classic, when
> I was at MontaVista.  See
> http://git.openembedded.org/openembedded/tree/classes/package_dbg.bbclass for that implementation. I haven't touched it or tried using it in some time, however.

I have to admit I've been wondering if we shouldn't overhaul the -dbg
part of the system a bit. There are a few things I've been wondering
about:

a) Should we ditch FILES_${PN}-dbg and have it auto constructed from
any .debug directories? This would be a rather nice automation/cleanup.
I can't see a pressing reason not to do this.

b) Consider splitting it to a -dbg package per package where there are
debug files as per above. There are pros and cons to this and I'm torn,
see c).

c) Consider splitting the debug source into a separate package. If we
did do b), the question is where should the sources go?

In the bigger picture we have various dependency chain issues as the
-dbg and -dev dependency changes are horrible. The question has always
been whether X-dbg or X-dev should be usable to pull in sensible
dependencies.

Thinking about the scenarios you might use these in:

a) A binary from package X segfaults. You want to get good gdb data for
why. You therefore install X-dbg. X links against Y. You therefore want
the symbols/code for Y too so you can trace into the problem which may
be in Y.

b) You want to compile against X, you install X-dev. You expect anything
X needs to link with (e.g. through any .pc file) to also be present.

c) You want to rebuild X and hence install X-dev to ensure the build
dependencies are present.

d) There was once an idea that you could do something like install
core-image-minimal-dev to get the equivalent of core-image-minimal with
dev-pkgs. I think we've found better ways to do this kind of thing now?

In a/b/c, the usability fail is if you try to gdb/compile, find a
dependency missing, install it and repeat this cycle several times over.

Given d) is dead, thankfully, does that let us rip some code out and
improve the dependencies?

Cheers,

Richard







