Received: from pbcl.net (pbcl.net [159.69.221.92])
 by mx.groups.io with SMTP id smtpd.web11.8228.1590656476685900879
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 02:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pbcl.net, ip: 159.69.221.92, mailfrom: pb@pbcl.net)
Received: from pb by pbcl.net with local (Exim 4.92)
	(envelope-from <pb@pbcl.net>)
	id 1jeEPY-0000Pz-Kr; Thu, 28 May 2020 11:01:12 +0200
Date: Thu, 28 May 2020 11:01:12 +0200
From: "Phil Blundell" <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Cc: Andre McCurdy <armccurdy@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Denys Dmytriyenko <denis@denix.org>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] linux-libc-headers: Check for asm/bpf_perf_event.h before multilibbing
Message-ID: <20200528090112.GA1314@pbcl.net>
References: <20200527155011.3165976-1-raj.khem@gmail.com>
 <20200527155957.GK17660@denix.org>
 <765f3daeb6ce5f28c2d1e258dd303f5707363678.camel@linuxfoundation.org>
 <CAMKF1spMw=6ZfkBWy3=+rSiHknxLvVC6uPH3Q8z_UiGdOECVdw@mail.gmail.com>
 <20200527215251.GA20867@pbcl.net>
 <CAJ86T=X=su_-PaAG_fqs-AjFb_ZFPtvRJTFvP9ZOce1Kv1Z3nQ@mail.gmail.com>
 <CAMKF1spE6tvmsJuoFciA9-MPBZLH0GpOQiDcohL5qtJzF_BzbQ@mail.gmail.com>
 <CAMKF1spUHqFeyhr6R+3rQ8_1foDFZf6HgFNN70OOHgtFijjWaQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spUHqFeyhr6R+3rQ8_1foDFZf6HgFNN70OOHgtFijjWaQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 27, 2020 at 05:02:00PM -0700, Khem Raj wrote:
> https://github.com/torvalds/linux/commit/052876f8e5aec887d22c4d06e54aa5531ffcec75
> 
> this change e.g. in userspace checks for UINPUT_VERSION and decides to
> use one method
> or legacy to setup the device but this is really not gonna work with
> kernels where these ioctls
> are not available, it perhaps can be fixed to not check for
> UINPUT_VERSION but then there
> could be many such cases, how many can we chase.

There's nothing inherently incompatible about that kernel change.  The
compile-time UINPUT_VERSION tells you that things like struct uinput_setup
have been declared.  If you want to be compatible with both old and new
kernels at run time, the right way to do it is either to call
ioctl(UI_GET_VERSION) or just to handle the appropriate error returns
from the newly introduced ioctls.  It's entirely possible that there
is userspace code out there that's doing something silly with this,
but if there is then again I would take the view that it's just a bug
and ought to be fixed.

In terms of OE, the theory is that generated binaries ought to work with
any kernel of ${OLDEST_KERNEL} or newer.  Obviously, individual distros
are welcome to do whatever is tactically appropriate for them, that's
always fine.  If they know that they are only shipping a single kernel
version then it might be reasonable to compile against the matching
linux-libc-headers and set OLDEST_KERNEL to the same version in order
to minimise compatibility issues.  Of course, that then means they're
likely to be building against a different linux-libc-headers to
everyone else and that might introduce a different set of problems,
but it's a reasonable tradeoff to consider.

p.
