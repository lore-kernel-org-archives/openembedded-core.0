Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QSRBA-0004ma-Sg for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 12:00:33 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QSR86-0003WT-GM
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 11:57:22 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <201106021806.13486.raj.khem@gmail.com>
References: <cover.1306958862.git.otavio@ossystems.com.br>
	<BANLkTi=q-bMwYtjTAqAXeaB4QQ_n85y8Rw@mail.gmail.com>
	<1307032661.27470.581.camel@rex>
	<201106021806.13486.raj.khem@gmail.com>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 03 Jun 2011 10:57:21 +0100
Message-ID: <1307095041.2529.234.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/3] busybox: enable mdev by default
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
X-List-Received-Date: Fri, 03 Jun 2011 10:00:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-02 at 18:06 -0700, Khem Raj wrote:
> mdev or udev are image features so probably should be controlled by 
> IMAGE_FEATURES or some such

Well, yeah, but this is the thing with busybox: it is a monolithic
executable, so you need to decide at configure time what features it's
going to include.  Although there is a separate busybox-mdev package, it
just contains the auxiliary scripting and the bulk of the mdev code goes
into busybox itself.

This means that making mdev a pure IMAGE_FEATURE isn't practical, since
it would basically require mdev to be always compiled in on the
offchance that some image might want it.  That would lead to code bloat
for those images (probably the majority) which don't.

Equally, having a single straightforward DISTRO_FEATURE to control mdev
is not terribly satisfactory, since some distros might want to configure
busybox with mdev enabled but actually use udev (or nothing) for some or
all of their images.

So, it seems that we really need both: a way for distros to configure
whether busybox is built with mdev on or not, and then an IMAGE_FEATURE
to control whether any given image gets mdev, or udev, or nothing.  The
former of those could be done as a DISTRO_FEATURE but, since it's only
going to affect busybox, I'm not sure that there is much benefit in
doing that; it seems like the distros could just as easily take care of
that by direct manipulation of the busybox configuration.

p.




