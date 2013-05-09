Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UaSB3-0000ke-VQ for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 16:50:39 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UaRtb-00089H-2G; Thu, 09 May 2013 16:32:35 +0200
Message-ID: <1368109954.14512.406.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 09 May 2013 15:32:34 +0100
In-Reply-To: <1368105550.27116.97.camel@ted>
References: <1368104132-30116-1-git-send-email-bogdan.a.marinescu@intel.com>
	<1368105550.27116.97.camel@ted>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: Phil Blundell <philb@gnu.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: include libgcc when libpthread is enabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2013 14:50:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-09 at 14:19 +0100, Richard Purdie wrote:
> On Thu, 2013-05-09 at 15:55 +0300, Bogdan Marinescu wrote:
> > diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
> > index 1e04197..24fb05b 100644
> > --- a/meta/recipes-core/eglibc/eglibc.inc
> > +++ b/meta/recipes-core/eglibc/eglibc.inc
> > @@ -35,7 +35,7 @@ siteconfig_do_siteconfig_gencache_prepend = " \
> >  # nptl needs unwind support in gcc, which can't be built without glibc.
> >  DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial linux-libc-headers virtual/${TARGET_PREFIX}libc-initial"
> >  # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this
> > -#RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
> > +RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
> >  PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
> >  PROVIDES += "virtual/libintl virtual/libiconv"
> >  inherit autotools
> 
> Why/when was that line commented out originally? Also, afaik glibc
> doesn't support anything other than nptl these days so we can probably
> drop the GLIBC_ADDONS check. Khem/Phil?

It was commented out by Khem in this patch:

http://git.openembedded.org/openembedded/commit/?id=e96e82cd

for reasons that are slightly obscure but, if I had to guess, I'd say
that it had something to do with avoiding circular dependencies during
the toolchain bootstrap process.  As far as I can tell nothing else was
added to replace it and the dependency just got lost from that point
onwards.  I'm not sure whether the circularity issue still applies but
it would be worth checking that the toolchain really does still
bootstrap with the dependency reinstated.

p.




