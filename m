Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Tzrby-0002U1-3i for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 17:31:10 +0100
Received: from cpc14-cmbg17-2-0-cust423.5-4.cable.virginmedia.com
	([86.14.229.168] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1TzrMl-0001v6-UK; Mon, 28 Jan 2013 17:15:28 +0100
Message-ID: <1359389722.7131.33.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 28 Jan 2013 16:15:22 +0000
In-Reply-To: <ly1ud5l3cg.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <fdad95c5f7fc287a6b173d5c30447ab05fab0778.1359049755.git.ross.burton@intel.com>
	<1359377661.22371.54.camel@ted>
	<lypq0pl8ee.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<4710226.v3bfS80rgU@helios>
	<ly622hl5r0.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1359385200.7131.11.camel@phil-desktop.brightsign>
	<ly1ud5l3cg.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] base: make feature backfilling happen earlier
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
X-List-Received-Date: Mon, 28 Jan 2013 16:31:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-01-28 at 16:44 +0100, Enrico Scholz wrote:
> afaik, DISTRO_FEATURES_BACKFILL + _CONSIDERED exist to allow the first
> two point without an '-=' operator which lacks in bitbake.

That wasn't really the intention.  The original purpose of
DISTRO_FEATURES_BACKFILL was to allow behaviour that currently defaults
to "on" to be brought under the control of a DISTRO_FEATURE without
breaking existing distros that were relying on it.

The idea was that DISTROs would set DISTRO_FEATURES_BACKFILL_CONSIDERED
to list the features that they are aware of but don't want (and would
never alter the value of DISTRO_FEATURES_BACKFILL).  Any feature that
ends up in the latter but not in the former is considered to post-date
the DISTRO and is, consequently, spliced into DISTRO_FEATURES by the
backwards-compatibility code.

Admittedly I'm not sure that this was ever documented anywhere other
than the mailing list archives so I guess it's understandable that you
(and quite likely others) are going a bit off-piste with it.  But the
primary use-case is what I described above, and this is the one that
needs to take precedence if there is a conflict between differing
requirements.

Incidentally, regarding your other comment about pulseaudio not
belonging in DISTRO_FEATURES_BACKFILL, it transpires that pulseaudio was
in fact the very feature that spurred the creation of this mechanism and
hence the first to be backfilled.  See:

http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/10941/focus=13033

and the following thread.

p.





