Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QtGov-0007vN-HD for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 12:24:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7GAJrpN026375
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 11:19:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26132-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 11:19:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7GAJgx9026369
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 11:19:44 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <21E0E8C4-433D-417B-ADAE-F4D444C9B35C@dominion.thruhere.net>
References: <075afb79207fbd6b862f7821cf5077ffbf0b71c8.1313413181.git.jiajun.xu@intel.com>
	<34d0c69915195c65e082c2575dc233716bf9ab57.1313413181.git.jiajun.xu@intel.com>
	<21E0E8C4-433D-417B-ADAE-F4D444C9B35C@dominion.thruhere.net>
Date: Tue, 16 Aug 2011 11:19:37 +0100
Message-ID: <1313489977.13995.13.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/2] libsdl: enable opengl for libsdl
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
X-List-Received-Date: Tue, 16 Aug 2011 10:24:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-16 at 09:52 +0200, Koen Kooi wrote:
> Op 15 aug. 2011, om 15:05 heeft Jiajun Xu het volgende geschreven:
> 
> > To enable opengl for libsdl, we need DEPENDS on virtual/libgl. Add a check for
> > "opengl" in DISTRO_FEATURES and when it's set, "--enable-video-opengl"
> > and "virtual/libgl" will be added into EXTRA_CONF and DEPENDS.
> 
> Is that really a distro feature? Opengl has always been a machine feature in OE, so with this the situation gets a lot worse.

Not really. This is one of the flags that makes sense at both a machine
*and* distro level. The distro flag means "build GL components" or can
be used to globally disable GL. The machine flag means the hardware can
support accelerated GL. This isn't the only such flag and was
anticipated long ago and why we have COMBINED_FEATURES (or whatever its
called).

The tricky piece to fit into this is software rendering. There are some
cases where we might want to build and include mesa-xlib even though we
know it will be slow (e.g. qemu machines to allow fuller testing).
Should or shouldn't those machines list opengl? Should we always fall
back to software rendering or error? Those questions are harder to
answer.

Cheers,

Richard



