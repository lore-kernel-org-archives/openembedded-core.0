Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id D308A76F50
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 22:00:57 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZZnQG-00049F-IU; Thu, 10 Sep 2015 00:00:56 +0200
Message-ID: <1441836049.2948.8.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Date: Wed, 09 Sep 2015 23:00:49 +0100
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B6101E771D@ORSMSX109.amr.corp.intel.com>
References: <1441761543-10979-1-git-send-email-juro.bystricky@intel.com>
	<1441790471.31676.13.camel@pbcl.net>
	<6E51916E4A1F32428260031F4C7CD2B6101E771D@ORSMSX109.amr.corp.intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-arch.bbclass: Allow 'baremetal' CPUs
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
X-List-Received-Date: Wed, 09 Sep 2015 22:01:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I think what I'm saying is that the whole ARCH thing is a linuxism that
should not be popping up in a baremetal (or any other non-linux)
configuration, and hacking map_kernel_arch() to return some
benign-but-bogus value seems like the wrong fix for it.  Particularly if
this hacking is based on the value of TCLIBC which, conceptually, is not
all that tightly bound to a kernel.

If there are places in the metadata that "inherit kernel-arch" in a
non-linux-specific context then I think we should figure out some way to
eliminate them.  In the longer term I think it would make sense to have
a "kernel" -> "linux" renaming to make these assumptions more explicit.

p.

On Wed, 2015-09-09 at 21:27 +0000, Bystricky, Juro wrote:
> I would not call it a real bug. The code just tries to initialize ARCH  (which may not be used
> for baremetal situations). The name "map_kernel_arch" is a bit misleading
> in this (baremetal) context.
> 
> 
> > -----Original Message-----
> > From: Phil Blundell [mailto:pb@pbcl.net]
> > Sent: Wednesday, September 9, 2015 2:21 AM
> > To: Bystricky, Juro
> > Cc: openembedded-core@lists.openembedded.org; Purdie, Richard
> > Subject: Re: [OE-core] [PATCH] kernel-arch.bbclass: Allow 'baremetal' CPUs
> > 
> > On Tue, 2015-09-08 at 18:19 -0700, Juro Bystricky wrote:
> > > Avoid "ERROR: cannot map <cpu> to a linux kernel architecture"
> > > Not being able to map a CPU to a kernel architecture should not be
> > > treated as an error when building baremetal toolchains for CPU <cpu>
> > > which does not have a kernel source tree.
> > 
> > Why is map_kernel_arch() even being invoked for a baremetal
> > configuration?  That sounds like it is the real bug here.
> > 
> > p.
> > 
> 



