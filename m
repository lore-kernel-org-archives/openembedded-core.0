Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T3Ooi-0003NA-KJ
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 12:02:40 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Aug 2012 02:50:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,796,1336374000"; d="scan'208";a="210930734"
Received: from unknown (HELO helios.localnet) ([10.252.121.92])
	by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2012 02:50:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <philb@gnu.org>
Date: Mon, 20 Aug 2012 10:50:26 +0100
Message-ID: <5299780.5uPXUKxR1v@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1345452500.24626.83.camel@x121e.pbcl.net>
References: <1345452476-5231-1-git-send-email-paul.eggleton@linux.intel.com>
	<1345452500.24626.83.camel@x121e.pbcl.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] classes/sanity: remove texi2html from required host utilities
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
X-List-Received-Date: Mon, 20 Aug 2012 10:02:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 20 August 2012 09:48:20 Phil Blundell wrote:
> On Mon, 2012-08-20 at 09:47 +0100, Paul Eggleton wrote:
> > texi2html is not actually required to build world of OE-Core anymore,
> > so we don't need to mandate it. The only difference without it (verified
> > with buildhistory) is that groff doesn't produce HTML documentation; the
> > rest of its docs are still produced and packaged and no other packages
> > are affected.
> 
> Can we fix groff to make it not even try to use texi2html even if it's
> installed?  It seems a bit undesirable for the amount of documentation
> you get to vary depending on the host environment.

Actually, upon closer inspection, texi2html has nothing to do with this. The 
host needs to have pnmcut, pnmcrop, pnmtopng, psselect, pnmtops and gs 
installed or neither the HTML nor PDF backends for groff will be enabled.

This leaves us with two alternatives:

1) Make groff depend on ghostscript, and that would at least enable the PDF 
backend, but for HTML it still leaves netpbm (for pnm*) and psutils (for 
psselect), neither of which we have in OE-Core.

2) Alternatively I can add --without-gs to the groff configure options which 
will always disable both backends.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


