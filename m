Received: from pbcl.net (pbcl.net [159.69.221.92])
 by mx.groups.io with SMTP id smtpd.web08.8235.1613050037355703057
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 05:27:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pbcl.net, ip: 159.69.221.92, mailfrom: pb@pbcl.net)
Received: from pb by pbcl.net with local (Exim 4.92)
	(envelope-from <pb@pbcl.net>)
	id 1lAC02-0005Ws-Cy; Thu, 11 Feb 2021 14:27:14 +0100
Date: Thu, 11 Feb 2021 14:27:14 +0100
From: "Phil Blundell" <pb@pbcl.net>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Ray Smith <raymsmithuk@gmail.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Andrey Zhizhikin <andrey.z@gmail.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] mesa: Remove dependency on opengl or vulkan DISTRO_FEATURES
Message-ID: <20210211132714.GO3066@pbcl.net>
References: <20210210111113.17318-1-raymsmithuk@gmail.com>
 <CAP9ODKqqrhboqgEGa_7MRprs2OZhE8GMRFCS3K77Jt2-4G9KKw@mail.gmail.com>
 <CAHS1ALKpm9+5Fa+roQ8ZJ3m3jGa3m=yymWpG8ftfEkVdAk+RqA@mail.gmail.com>
 <CAHtQpK7rFBrGHUJ2TG-Xke4V-kZc2jJF4hZgO5LtdGef4vNQfA@mail.gmail.com>
 <CAP9ODKorRTxwsCdJPGT4hzG5cd560EUuOeGzVgnJ6CNLAhxjYQ@mail.gmail.com>
 <CAHS1ALL+u0sRMTVb5uXJg67aLdxm4aYoCriv-1vM4WKNfyh0Qw@mail.gmail.com>
 <20210211120520.7h32qy5sqasyplv7@jama>
MIME-Version: 1.0
In-Reply-To: <20210211120520.7h32qy5sqasyplv7@jama>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 11, 2021 at 01:05:20PM +0100, Martin Jansa wrote:
> Or you can read it as that it makes sense to build mesa recipe only when
> DISTRO supports opengl or vulkan or opengles,

It's never been the intent of DISTRO_FEATURES to determine which recipes 
it "makes sense" to build, above and beyond those that are actually
impossible to compile in a given configuration.  If there were certain 
recipes that are fundamentally and completely incompatible with a 
particular DISTRO_FEATURE to the extent that you simply couldn't build 
them at all then it might make sense to exclude them in this way, but 
I can't honestly think of even a single case where that would be true.  
Even at a fundamental level, there's no reason that a musl-based 
DISTRO couldn't also build glibc for example.  Conversely, if a recipe
simply needs some aspect of a given DISTRO_FEATURE to work then, in
general, the solution to that is just to declare it as a dependency.
Recipes that necessarily and unavoidably need OpenGL should just have
virtual/libgl in their DEPENDS and there is no need for them to be
checking DISTRO_FEATURES to see whether OpenGL is "available" in some
abstract sense.

If a particular DISTRO wants to actively prohibit mesa or any other
recipe from being built (because it wants to ensure that certain code
never leaks into the build artifacts due to a dependency error) then
there are other mechanisms for that.

The intent of the "opengl" DISTRO_FEATURE is that it gives you a single
central place to control the configuration of packages that either have
an optional dependency on OpenGL, or are selectable between OpenGL and
Vulkan at configure time.  Even this is a tiny bit half-baked because
it doesn't really distinguish between the myriad variants of OpenGL(ES)
but in general that distinction is a matter of platform capability 
rather than DISTRO choice (i.e. if your graphics stack only supports 
OpenGL ES 1.x, no amount of oe-core configuration is going to make it 
support OpenGL 4.)  And the DISTRO_FEATURE does at least let you assert
at the whole-distribution level that you have a preference for Vulkan
over OpenGL, or vice versa.

If you add opengl to DISTRO_FEATURES then you will start getting OpenGL
support enabled in recipes like cairo.  With the way the Mesa recipe
is currently constituted, anybody who wants to build Mesa for some
ancillary purpose but doesn't want everything else to start using 
OpenGL needs to add opengl to DISTRO_FEATURES and then engage in a 
game of whack-a-mole to go round turning it back off again in all 
the individual PACKAGECONFIGs.  I don't think that's a rational state
of affairs.

p.
