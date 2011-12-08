Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RYhcc-000265-94
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 18:19:02 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RYhW2-0001Un-NA
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 18:12:14 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Dec 2011 17:12:13 +0000
In-Reply-To: <1323363345.5309.42.camel@ted>
References: <cover.1323327959.git.xiaofeng.yan@windriver.com>
	<7ceb01f6db6edfad6c78c5a7ebc685c23bb11358.1323327959.git.xiaofeng.yan@windriver.com>
	<67C6F211-C6C2-4655-889A-A254F4E0D7D9@dominion.thruhere.net>
	<1323363345.5309.42.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1323364334.26081.383.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 04/10] gtk.inc: add feature based on directfb
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
X-List-Received-Date: Thu, 08 Dec 2011 17:19:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-08 at 16:55 +0000, Richard Purdie wrote:
> The question is whether it makes sense to have directfb and X based gtk
> in the same builds and package feeds or not. I can see that it might be
> desired and that it likely is possible.

This is true, though there's nothing to stop a distro that particularly
wants this from inventing their own stub recipes which just set
PACKAGECONFIG appropriately and then require the generic version.  So
it's really just a question of what we want to be the default in
oe-core.

Also note that, although you can parallel install multiple versions of
the gtk+ runtime on the target system, if you want the build system to
be deterministic then (in the absence of per-recipe sysroot
construction) you need some way to decide which one gets to provide the
gtk+-2.0.pc that other recipes will build against.  (The different
targets have different library sonames so you can't just swap them out
at run time: a given binary will remain coupled to the particular Gtk
variant that it was compiled against.)  And if the two variants could
conceivably be different versions of GTK then you also need a way to
deconflict ${includedir}/gtk-2.0.  

So it isn't quite as simple as just having the two recipes, there is a
bit of extra policy involved as well.  And of course there would be all
the normal overhead in terms of parse time, memory footprint and
maintenance burden associated with having more recipes.  

So, in light of all the above plus the fact that everything is different
with Gtk+3 anyway, my preference for supporting directfb on gtk+2 in
oe-core would be to use PACKAGECONFIG and not have separate recipe
files.

p.




