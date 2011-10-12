Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDy9b-0007pk-PS for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 14:43:23 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CCiIKv003440 for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 13:44:19 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id duXBSveSAFcd
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 13:44:18 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CCiCEF003434
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 13:44:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 12 Oct 2011 13:37:30 +0100
In-Reply-To: <cover.1318371066.git.josh@linux.intel.com>
References: <cover.1318371066.git.josh@linux.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318423059.23801.151.camel@ted>
Mime-Version: 1.0
Subject: Re: [RFC PATCH 0/1] QA check for defined packages
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
X-List-Received-Date: Wed, 12 Oct 2011 12:43:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-10-11 at 15:29 -0700, Joshua Lock wrote:
> I'm looking for some comments on this WIP patch.
> 
> The reason I've added this is because the hob GUI requires us to offer much
> more reliable metadata - we show the user available packages, as defined by
> each recipe, to add to their image. Should a recipe define a package and yet
> not actually create it and the user has included that in their image we cause
> errors at build time.
> 
> However whilst the idea seems sound enough, there are some caveats - running
> a world build with this patch I see failures fairly early on at least a few
> of which I'd expect we'll need to special-case:
> * eglibc-local
> * linux-yocto
> * linux-libc-headers
> * gcc-runtime
> 
> Thoughts?

I think we probably do need to cleanup some of that data.

I have some thoughts about where we're at with hob and this is probably
as good a time as any to share them.

Effectively the problem is that there is a large body of data we only
compute during the build process. This includes what the exact runtime
dependencies of packages are, which packages exactly are generated
(PACKAGES_DYNAMIC), what the size of the packages are, how long they
take to build and so on. Some things we can fix, some things we can hack
around but at the end of the day there are some things we just plain
can't change.

I'm beginning to think we need to have two phases of control of the
system:

a) The build phase

This is the step that generates the package feeds.

b) The image construction phase

This is the step that takes the package feed data and turns it into an
image.

Obviously, you can skip to b) if you already have a package feed.

So we'd be talking about two UI's that could effectively hand off to
each other and share a "build in progress" feedback to the user system.
The image construction dialog would have a "Missing Packages? Build them
here" type switch. This would mean the build system can continue on at
what it does best yet the UI can let the users do what they want to do,
particularly on a prebuilt package feed.

Thoughts?

Cheers,

Richard



