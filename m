Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QS5zM-0001Xf-NO for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 13:22:56 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QS5wE-00033s-AS
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 13:19:42 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DE6A9A6.4020107@windriver.com>
References: <cover.1306865217.git.scott.a.garman@intel.com>
	<7826575ce92090c4460c7d016e0b06441f84cff7.1306865217.git.scott.a.garman@intel.com>
	<1306921632.2529.18.camel@phil-desktop> <4DE67A4F.5010703@intel.com>
	<4DE6A9A6.4020107@windriver.com>
Organization: Phil Blundell Consulting Ltd
Date: Thu, 02 Jun 2011 12:19:41 +0100
Message-ID: <1307013581.2529.181.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 2/7] shadow: add a -native recipe with customized utilities
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
X-List-Received-Date: Thu, 02 Jun 2011 11:22:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-01 at 16:05 -0500, Mark Hatle wrote:
> The reason I suggested the --root option was primarily for the ease of people
> who are NOT using the automated scripting, i.e. someone manually adding a
> preinst (or similar) to their recipes.

I was thinking about this stuff the other day for update-rc.d.  Really,
it sucks that all the manually-written postinsts have to include all of
this garbage about checking for $D.  It also sucks a bit that this same
code (for both manually-written and auto-generated postinsts) ends up
getting deployed into the packages and onto the target system, where it
is at best a waste of space.

I think maybe a better way of dealing with that whole thing would be for
update-rc.d-native and similar tools to provide a set of wrapper scripts
which would take care of all the machinations required to support
offline root mode, be that adding "--root $D" or doing stuff with chroot
or whatever.  If those were installed into some appropriate place in the
sysroot then we could arrange for the right directory to be prepended to
$PATH during rootfs construction and then everything ought to "just
work" without the postinst scripts needing to take any special measures.

p.





