Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QSR3V-0004GQ-0m for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 11:52:37 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1QSR0P-0003Vu-TF; Fri, 03 Jun 2011 11:49:26 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307089346.27470.624.camel@rex>
References: <cover.1307083232.git.kai.kang@windriver.com>
	<adfc33032da197d9e5438a42e2b5df4681cdbb35.1307083232.git.kai.kang@windriver.com>
	<1307089346.27470.624.camel@rex>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 03 Jun 2011 10:49:23 +0100
Message-ID: <1307094563.2529.226.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Kang@smtp1.linux-foundation.org, poky@yoctoproject.org
Subject: Re: [PATCH 1/1] eglibc: migrate configurability from oe
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
X-List-Received-Date: Fri, 03 Jun 2011 09:52:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-06-03 at 09:22 +0100, Richard Purdie wrote:
> On Fri, 2011-06-03 at 14:47 +0800, Kang Kai wrote:
> > From: Kang Kai <kai.kang@windriver.com>
> > 
> > Migrate configurability from oe, try to shrink minimal image size
> > 
> > The switch is in local.conf.sample, uncomment the line
> > DISTRO_FEATURES_EGLIBC = ""
> > and write what options you want to enable.
> > 
> > If want to disable locale-code charsets or locales, you have to uncomment
> > PACKAGE_NO_GCONV = 1
> > Because without this, it fails on package_do_split_gconvs in libc-package.bbclass
> 
> I have some comments:
> 
> a) I think these should become flags in DISTRO_FEATURES with an
> "eglibc-" prefix so something like "spawn" would become "eglibc-spawn"

I'm not sure I agree with that.  Some, maybe most, of these flags are
not really specific to eglibc (in concept, even if eglibc is the only
package which respects them at the moment).  Some of them (eg ipv6) are
already established DISTRO_FEATURES which are used in various other
places; others, including perhaps your spawn example, are specifically
bound to the contents of the C library but could equally well be
respected by uclibc.  So, for the latter group, I think just
"libc-spawn" would be better than "eglibc-spawn".  Maybe
"libc-has-spawn" would be even better, to make it clear that we're
talking about a feature within libc and not a specific variant of libc.

In an ideal world there would also be a mechanism for packages to
declare that they require a particular feature from libc, i.e. a recipe
could say

DISTRO_REQUIRED_FEATURES = "libc-spawn"

and it would then be a configuration error to try to build that recipe
for a distro that doesn't admit the necessary things.

> b) I think we need to create a local.conf.sample.extended which has
> information about more advanced settings a user can configure. I don't
> want every setting in local.conf as standard as it gives the user the
> impression they have to change them which they don't. Some existing data
> in local.conf.sample can be moved over.

Agreed.

> c) The code triggered by PACKAGE_NO_GCONV should also trigger if you set
> the appropriate eglibc- feature flags automatically. Having two
> variables you have to keep track of the combinations of is just plain
> wrong. They should be controlled by one flag only. If there is generic
> packaging code that handles these we might not need the "eglibc-" prefix
> for those options.

I didn't fully understand the commentary around PACKAGE_NO_GCONV so I'm
not sure that I have a meaningful opinion on that one yet.  As far as I
know, though, there is no generic packaging code for gconvs (unlike
locales, which are handled generically in package.bbclass) but, again,
the concept of gconvs is not eglibc specific and there are other libs
which might provide them.

p.




