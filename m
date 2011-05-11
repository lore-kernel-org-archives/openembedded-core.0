Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QK7ZJ-0008Rj-7b for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 13:27:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BBOFaJ018398
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 12:24:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17795-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 12:24:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BBO7h8018392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 12:24:07 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <FC1EF862-120F-4563-AF61-17A657491F21@dominion.thruhere.net>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
	<6a6f3589dba7aff0cb89f233807e5d051d8d3e08.1305035617.git.richard.purdie@linuxfoundation.org>
	<CD6AE1D1-3C36-4269-B773-14C648F63736@dominion.thruhere.net>
	<1305104979.30391.310.camel@rex>
	<FC1EF862-120F-4563-AF61-17A657491F21@dominion.thruhere.net>
Date: Wed, 11 May 2011 12:24:01 +0100
Message-ID: <1305113041.30391.347.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/6] bitbake.conf: Include the new default-providers.inc and default-versions.inc files
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
X-List-Received-Date: Wed, 11 May 2011 11:27:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-11 at 12:08 +0200, Koen Kooi wrote:
> Op 11 mei 2011, om 11:09 heeft Richard Purdie het volgende geschreven:
> 
> > On Tue, 2011-05-10 at 16:20 +0200, Koen Kooi wrote:
> >> Op 10 mei 2011, om 16:00 heeft Richard Purdie het volgende geschreven:
> >> 
> >>> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >>> 
> >>> These are the minimal defaults to allow OE-Core to function standalone with
> >>> no distro set and are constucted such that the distro can either override values,
> >>> or totally replace the include file entirely as needed.
> >>> 
> >>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >>> ---
> >>> meta/conf/bitbake.conf                            |    3 +
> >>> meta/conf/distro/include/default-providers.inc    |   34 ++++++++++++
> >>> meta/conf/distro/include/default-versions.inc     |   18 ++++++
> >>> meta/conf/distro/include/poky-fixed-revisions.inc |   27 ---------
> >>> meta/conf/distro/poky.conf                        |   59 +--------------------
> >>> 5 files changed, 56 insertions(+), 85 deletions(-)
> >>> create mode 100644 meta/conf/distro/include/default-providers.inc
> >>> create mode 100644 meta/conf/distro/include/default-versions.inc
> >>> delete mode 100644 meta/conf/distro/include/poky-fixed-revisions.inc
> >>> 
> >> 
> >>> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
> >>> new file mode 100644
> >>> index 0000000..d51ac64
> >>> --- /dev/null
> >>> +++ b/meta/conf/distro/include/default-providers.inc
> >>> @@ -0,0 +1,34 @@
> >>> 
> >>> +PREFERRED_PROVIDER_gconf ?= "gconf-dbus"
> >> 
> >> the dbus port has long been merged upstream, so proper gconf would be
> >> a better choice. We could ignore it and just use dconf in meta-gnome,
> >> though ;)
> > 
> > I agree we should be using gconf, could someone send me the recipe
> > though? ;-).
> 
> I think we want to keep gconf in meta-gnome and pull the dependants out of oe-core

We have a slight dependency conflict here as we've said we want sato in
OECore so we have something we can actually test.

Are we now saying sato also needs to be separated out into its own
layer?

Or can we define meta-gnome as being the gnome pieces without direct
requirements in OECore for a minimal gtk desktop?

Cheers,

Richard




