Received: from pbcl.net (pbcl.net [159.69.221.92])
 by mx.groups.io with SMTP id smtpd.web12.22647.1590701619814401694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 14:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pbcl.net, ip: 159.69.221.92, mailfrom: pb@pbcl.net)
Received: from pb by pbcl.net with local (Exim 4.92)
	(envelope-from <pb@pbcl.net>)
	id 1jeQ9g-000432-Fu; Thu, 28 May 2020 23:33:36 +0200
Date: Thu, 28 May 2020 23:33:36 +0200
From: "Phil Blundell" <pb@pbcl.net>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Adrian Bunk <bunk@stusta.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Denys Dmytriyenko <denis@denix.org>, Khem Raj <raj.khem@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] linux-libc-headers: Check for asm/bpf_perf_event.h before multilibbing
Message-ID: <20200528213336.GB14586@pbcl.net>
References: <20200527155011.3165976-1-raj.khem@gmail.com>
 <20200527155957.GK17660@denix.org>
 <765f3daeb6ce5f28c2d1e258dd303f5707363678.camel@linuxfoundation.org>
 <20200527231145.GO17660@denix.org>
 <f8ee3144eaa92a32d6661f397d7042da9a7db46d.camel@linuxfoundation.org>
 <20200528133912.GB12536@localhost>
 <CAJ86T=WmE-3Q4Y4ezZs56RRbZ21P=tomBHiSpzyyir_j6wV27w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WmE-3Q4Y4ezZs56RRbZ21P=tomBHiSpzyyir_j6wV27w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 28, 2020 at 10:38:15AM -0700, Andre McCurdy wrote:
> And where does it leave OLDEST_KERNEL (currently set to 3.2.0)? If
> even kernel 4.1 is too old to be used with OE master then
> OLDEST_KERNEL looks like it should be updated to avoid giving users
> with older kernels false hope.

Yes.  Ultimately, OLDEST_KERNEL is really a distro decision, but
it shouldn't be set to an unnecessarily old version.  Glibc in
particular uses that variable to decide how much compatibility code
it needs to include to support old kernels, and there is sometimes
a runtime performance cost associated with that.

And as you say, if a user sees OLDEST_KERNEL = "3.2.0" then one
couldn't really blame them for assuming that this means they can
use such a kernel.  I don't personally know any reason why a 3.2
kernel wouldn't work just fine with most of oe-core, and I think
that's still the minimum required kernel version for the current
version of glibc, but perhaps others know of reasons why newer
kernels are nowadays needed.

p.
