Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 2CB2D60102
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 15:13:05 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=tp13)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1bsAM5-000404-27; Thu, 06 Oct 2016 17:13:05 +0200
Message-ID: <1475766778.3605.22.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>, Andreas Oberritter
	<obi@opendreambox.org>, openembedded-core@lists.openembedded.org
Date: Thu, 06 Oct 2016 16:12:58 +0100
In-Reply-To: <1475761616.13655.59.camel@linux.intel.com>
References: <1475676667-24280-1-git-send-email-markus.lehtonen@linux.intel.com>
	<b32b7b2f-68cc-31d6-d687-2eeb12aa196a@opendreambox.org>
	<1475743775.13655.55.camel@linux.intel.com>
	<1475748742.16008.29.camel@pbcl.net>
	<1475761616.13655.59.camel@linux.intel.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH] update-rc.d.bbclass: check that init script exists before running it
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
X-List-Received-Date: Thu, 06 Oct 2016 15:13:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-10-06 at 16:46 +0300, Markus Lehtonen wrote:
> 
It was moved to prerm earlier to fix some other problems:
> http://git.openembedded.org/openembedded-core/commit/meta/classes/upd
> ate-al
> ternatives.bbclass?id=2a5484a90513b58c829a916bfe5268a0fde3512a

The commit message for that checkin is a bit vague about exactly what
problem it was solving.  It mentions that it "fixes deinstalling
alternatives for programs needed by the postrm script, e.g. /bin/sh"
but it's rather hard to see how that actually works.  If postrm
requires /bin/sh and prerm has deleted it then it's not obvious how
this is an improvement.

> So I think moving it back and forth between prerm and postrm doesn't
> get us
> anywhere :)

That is a fair point, though I am not entirely convinced that the
commit you mentioned above is the correct solution to whatever problem
it thinks it's solving.

As it stands, with both things in prerm, you will get essentially
random behaviour depending on the order in which the two classes (u-
rc.d and u-a) are inherited by the recipe.  If u-a comes first then u-
rc.d will not be able to run the "stop" script (and the services will
not be stopped on package uninstallation), and vice versa.

So maybe these two classes just need to be taught to play together
better.

p.

