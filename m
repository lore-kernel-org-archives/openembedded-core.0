Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QpIC6-0002YK-Aj
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 13:03:58 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QpI7s-0005O7-0w
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 12:59:36 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 05 Aug 2011 11:59:34 +0100
In-Reply-To: <1312204479.2344.442.camel@rex>
References: <cover.1312182844.git.sgw@linux.intel.com>
	<d383462fb2d94c991d3d67ab07f444b0d6ac2c3a.1312182844.git.sgw@linux.intel.com>
	<1312204479.2344.442.camel@rex>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312541976.6733.12.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 22/22] feature-arm-thumb: Take ARM_INSTRUCTION_SET into account to decide thumb mode
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
X-List-Received-Date: Fri, 05 Aug 2011 11:03:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 14:14 +0100, Richard Purdie wrote:
> On Mon, 2011-08-01 at 00:36 -0700, Saul Wold wrote:
> > From: Khem Raj <raj.khem@gmail.com>
> > 
> > This will decouple the compiling in thumb mode from having thumb
> > capable cores.
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../conf/machine/include/arm/feature-arm-thumb.inc |    6 ++++--
> >  1 files changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> > index e7d392e..533eab9 100644
> > --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> > +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> > @@ -4,9 +4,11 @@
> >  # encoded RISC sub-set. Thumb code is smaller (maybe 70% of the ARM size)
> >  # but requires more instructions (140% for 70% smaller code) so may be
> >  # slower.
> > -TUNEVALID[thumb] = "Use thumb instructions instead of ARM"
> > -ARM_THUMB_M_OPT = "${@['-mno-thumb', '-mthumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) == 'thumb']}"
> > +TUNEVALID[thumb] = "Use thumb instructions instead of ARM if ARM_INSTRUCTION_SET != arm"
> > +ARM_THUMB_M_OPT = "${@['-mthumb', '-mno-thumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) != 'arm']}"
> >  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "${ARM_THUMB_M_OPT}", d)}"
> > +
> > +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "-mthumb", "-mno-thumb", d)}"
> >  OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "thumb", ":thumb", "", d)}"
> >  
> >  # Note armv7 will hit on armv7a as well
> 
> The original change committed into master in my absence is broken. This
> patch is just making things even worse and more broken :(

What's the current situation with this?  As far as I can tell from the
git log, there doesn't appear to have been any significant change in
this area since last week: the head of feature-arm-thumb.inc is still at
the allegedly-broken commit e23f9ce92.  

Does anybody have a summary of what exactly is broken at the moment and
what is being done about it?

thanks

p.




