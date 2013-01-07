Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TsJI6-0008Qm-KE
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 21:27:33 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 Jan 2013 12:12:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,425,1355126400"; d="scan'208";a="240990509"
Received: from unknown (HELO helios.localnet) ([10.252.123.60])
	by azsmga001.ch.intel.com with ESMTP; 07 Jan 2013 12:12:12 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 07 Jan 2013 20:11:58 +0000
Message-ID: <2814359.Bpg095F8KW@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-21-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <1357558573.28649.231.camel@ted>
References: <1357557340-28756-1-git-send-email-Martin.Jansa@gmail.com>
	<1357558573.28649.231.camel@ted>
MIME-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] dropbear: don't use IMAGE_FEATURES
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
X-List-Received-Date: Mon, 07 Jan 2013 20:27:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 07 January 2013 11:36:13 Richard Purdie wrote:
> On Mon, 2013-01-07 at 12:15 +0100, Martin Jansa wrote:
> > * IMAGE_FEATURES are image specific, but dropbear recipe isn't
> > * if you have debug-tweaks in EXTRA_IMAGE_FEATURES or added to
> > 
> >   IMAGE_FEATURES in distro config, then it will set DISTRO_TYPE
> >   to debug as expected, but if you add debug-tweaks only in
> >   your-own-debug-image, then dropbear never sees debug-tweaks and
> >   your-own-debug-image won't allow empty password login.
> > 
> > * best way would be to patch dropbear to enable empty password by
> > 
> >   runtime config or argument and enable it in ROOTFS_POSTPROCESS_COMMAND
> >   like openssh_allow_empty_password does, see
> >   http://permalink.gmane.org/gmane.network.ssh.dropbear/845
> > 
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> > 
> >  meta/recipes-core/dropbear/dropbear.inc | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/recipes-core/dropbear/dropbear.inc
> > b/meta/recipes-core/dropbear/dropbear.inc index aa313df..2c170c6 100644
> > --- a/meta/recipes-core/dropbear/dropbear.inc
> > +++ b/meta/recipes-core/dropbear/dropbear.inc
> > @@ -2,7 +2,7 @@ DESCRIPTION = "Dropbear is a lightweight SSH and SCP
> > implementation"> 
> >  HOMEPAGE = "http://matt.ucc.asn.au/dropbear/dropbear.html"
> >  SECTION = "console/network"
> > 
> > -INC_PR = "r0"
> > +INC_PR = "r1"
> > 
> >  # some files are from other projects and have others license terms:
> >  #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
> > 
> > @@ -40,7 +40,7 @@ EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1
> > PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'> 
> >  EXTRA_OECONF += "\
> >  
> >   ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam',
> >   '--disable-pam', d)}"> 
> > -DISTRO_TYPE ?= "${@base_contains("IMAGE_FEATURES", "debug-tweaks",
> > "debug", "",d)}" +DISTRO_TYPE ?= "debug"
> > 
> >  do_install() {
> >  
> >  	install -d ${D}${sysconfdir} \
> 
> How about we ditch DISTRO_TYPE entirely and check for "debug-tweaks" in
> DISTRO_FEATURES? This would bring it more into line with the other
> places we do things like this.
> 
> FWIW I agree this should ideally be runtime configured and we should
> really add an enhancement request to the bugzilla for that (or patches
> welcome).

There's already a request open:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=2578

I'd suggest leaving the current behaviour (poor as it may be) until that bug 
is fixed.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


