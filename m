Received: from pbcl.net (pbcl.net [159.69.221.92])
 by mx.groups.io with SMTP id smtpd.web11.40845.1589804601452173032
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 05:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pbcl.net, ip: 159.69.221.92, mailfrom: pb@pbcl.net)
Received: from pb by pbcl.net with local (Exim 4.92)
	(envelope-from <pb@pbcl.net>)
	id 1jaenf-0001fu-9x; Mon, 18 May 2020 14:23:19 +0200
Date: Mon, 18 May 2020 14:23:19 +0200
From: "Phil Blundell" <pb@pbcl.net>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>,
	Andreas Oberritter <obi@opendreambox.org>
Subject: Re: [OE-core] [PATCH] glibc: move ld.so.conf back to main package
Message-ID: <20200518122319.GD20108@pbcl.net>
References: <20200518113617.31831-1-rasmus.villemoes@prevas.dk>
 <CA+chaQdZQRYMwbaAdE-TE9SNuJpwO=0Z6Qy7SR6kZxN7kpJ3qA@mail.gmail.com>
 <0397befe-9f5d-a704-be07-00926fd3fffa@prevas.dk>
MIME-Version: 1.0
In-Reply-To: <0397befe-9f5d-a704-be07-00926fd3fffa@prevas.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2020 at 02:12:43PM +0200, Rasmus Villemoes wrote:
> I'm certainly open to other ways of solving this. But can we agree that
> it is a bug that the ldconfig done at build-time does not take
> /etc/ld.so.conf.d/* into account, and that that should not depend on
> whether one has ldconfig-the-binary on target?

Yes, nowadays that's probably true.

When the USE_LDCONFIG flag (predecessor to the ldconfig DISTRO_FEATURE)
was originally added, the primary usecase was distros that didn't want
any of the ld.so.conf mechanism at all because they knew that the
libraries would always be installed in the first place that ld.so
would look for them.  In fact the commit message from when the
DISTRO_FEATURE flag was added basically says as much:

    USE_LDCONFIG could previously be set to 0 by distros which do not
    require ldconfig or ld.so.conf on the target. Since more and more
    recipes may need to respect that option, replace the ad-hoc variable
    with a distro feature.

But you're right that there's also a perfectly valid usecase for
folks who want to be able to use ld.so.conf to control the search paths
but don't actually want the ldconfig binary in the rootfs.  I guess at
that point the question becomes whether setting both read-only-rootfs
and ldconfig should cause the actual ldconfig binary to be left out
on the grounds that it can't do anything useful on a read-only rootfs,
or whether there ought to be a slightly different flag to represent
the usecase you're interested in.

p.
