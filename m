Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 497EE62252
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 12:19:18 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1WUxew-0004RM-19; Tue, 01 Apr 2014 14:19:18 +0200
Message-ID: <1396354757.5879.26.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Denys Dmytriyenko <denis@denix.org>
Date: Tue, 01 Apr 2014 13:19:17 +0100
In-Reply-To: <20140328172824.GJ3370@denix.org>
References: <1366735649.5732.21.camel@phil-desktop.brightsign>
	<20140328172824.GJ3370@denix.org>
X-Mailer: Evolution 3.8.5-2+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Fri, 2014-03-28 at 13:28 -0400,
	Denys Dmytriyenko wrote:
	> > KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH}" > >
	-KERNEL_LD
	= "${CCACHE}${HOST_PREFIX}ld ${HOST_LD_KERNEL_ARCH}" > > +KERNEL_LD =
	"${CCACHE}${HOST_PREFIX}ld.bfd
	${HOST_LD_KERNEL_ARCH}" > > KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar
	${HOST_AR_KERNEL_ARCH}"
	> > I know this is almost a year-old change. > > The question I have is
	-
	what should one do when using an external toolchain > that doesn't have
	ld.bfd provided? I know these days with gold vs. BFD linker,
	> it's common to have ld.bfd,
	but there could be exceptions... > > Should this assignment be
	conditional, 
	so it's easier to override from > local.conf or distro? [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-arch: Always use ld.bfd to link the kernel
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Apr 2014 12:19:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-03-28 at 13:28 -0400, Denys Dmytriyenko wrote:
> >  KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH}"
> > -KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld ${HOST_LD_KERNEL_ARCH}"
> > +KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
> >  KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
> 
> I know this is almost a year-old change.
> 
> The question I have is - what should one do when using an external toolchain 
> that doesn't have ld.bfd provided? I know these days with gold vs. BFD linker, 
> it's common to have ld.bfd, but there could be exceptions...
> 
> Should this assignment be conditional, so it's easier to override from 
> local.conf or distro?

Making those assignments all be conditional doesn't sound like a totally
unreasonable plan to me.  (I think it would be a bad idea to make
KERNEL_LD alone be conditional; if we change one then we should change
all four.)

Alternatively I guess you could take the view that the external
toolchain packaging ought to be providing an ld.bfd symlink if there
isn't already one.  There are other places in oe-core which mention
ld.bfd (one of them is gcc-cross-initial, which probably wouldn't be an
issue for external toolchains, but another is u-boot which might be) and
fixing the problem in the external toolchain would avoid the need to
find and fix every place that refers to ld.bfd.  So I think this would
be my preference.

p.



