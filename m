Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id CCA5965DCA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 15:22:51 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1WeQup-0003xn-A0; Sun, 27 Apr 2014 17:22:51 +0200
Message-ID: <1398612165.4956.60.camel@e130.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 27 Apr 2014 16:22:45 +0100
In-Reply-To: <3284a4ff6415bb88ec8aee87c5fc098a30156c51.1398443925.git.Martin.Jansa@gmail.com>
References: <cover.1398443925.git.Martin.Jansa@gmail.com>
	<3284a4ff6415bb88ec8aee87c5fc098a30156c51.1398443925.git.Martin.Jansa@gmail.com>
Organization: Phil Blundell Consulting Ltd
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
	Content preview:  On Fri, 2014-04-25 at 18:40 +0200,
	Martin Jansa wrote: > Extracted
	from "Cortex-M3 Technical Reference Manual": > "The processor
	implements
	the ARM v7-M architecture. This includes the entire > 16-bit Thumb
	instruction
	set and the base Thumb-2 32-bit instruction set > architecture. The
	processor cannot execute ARM instructions." [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/5] tune-cortexm3.inc: Cortex-M3 doesn't support ARM instructions
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
X-List-Received-Date: Sun, 27 Apr 2014 15:22:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-04-25 at 18:40 +0200, Martin Jansa wrote:
> Extracted from "Cortex-M3 Technical Reference Manual":
> "The processor implements the ARM v7-M architecture. This includes the entire
> 16-bit Thumb instruction set and the base Thumb-2 32-bit instruction set
> architecture. The processor cannot execute ARM instructions."

This is true, though it's worth noting that the Thumb-only restriction
is generic to ARMv7-M and not specific to Cortex-M3.  This tune file
seems to conflate the architecture and the particular CPU slightly and
it seems like some refactoring might be desirable, though obviously that
doesn't make your patch wrong.  Also...

>  PACKAGE_EXTRA_ARCHS_tune-cortexm3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7m-vfp"

... this seems a bit bogus.  Presumably
${PACKAGE_EXTRA_ARCHS_tune-armv7at} will include "arm" and a bunch of
other architectures, some of which (e.g. armv4) are more or less
guaranteed to be 32-bit code.  Without a wholesale rethink of the way
that PACKAGE_ARCHs are done on arm, it doesn't seem very safe for armv7m
machines to admit any earlier architecture at all in their
PACKAGE_EXTRA_ARCHS.

p.



