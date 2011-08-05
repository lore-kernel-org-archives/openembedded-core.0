Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QpIpK-0003Ji-8N for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 13:44:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75Be6DX011375
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 12:40:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10683-04 for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2011 12:40:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75Bdvb1011362
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 12:39:58 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1312541976.6733.12.camel@phil-desktop>
References: <cover.1312182844.git.sgw@linux.intel.com>
	<d383462fb2d94c991d3d67ab07f444b0d6ac2c3a.1312182844.git.sgw@linux.intel.com>
	<1312204479.2344.442.camel@rex> <1312541976.6733.12.camel@phil-desktop>
Date: Fri, 05 Aug 2011 12:39:34 +0100
Message-ID: <1312544374.14274.98.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Fri, 05 Aug 2011 11:44:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-05 at 11:59 +0100, Phil Blundell wrote:
> On Mon, 2011-08-01 at 14:14 +0100, Richard Purdie wrote:
> > On Mon, 2011-08-01 at 00:36 -0700, Saul Wold wrote:
> > > From: Khem Raj <raj.khem@gmail.com>
> > > 
> > > This will decouple the compiling in thumb mode from having thumb
> > > capable cores.
> > > 
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  .../conf/machine/include/arm/feature-arm-thumb.inc |    6 ++++--
> > >  1 files changed, 4 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> > > index e7d392e..533eab9 100644
> > > --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> > > +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> > > @@ -4,9 +4,11 @@
> > >  # encoded RISC sub-set. Thumb code is smaller (maybe 70% of the ARM size)
> > >  # but requires more instructions (140% for 70% smaller code) so may be
> > >  # slower.
> > > -TUNEVALID[thumb] = "Use thumb instructions instead of ARM"
> > > -ARM_THUMB_M_OPT = "${@['-mno-thumb', '-mthumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) == 'thumb']}"
> > > +TUNEVALID[thumb] = "Use thumb instructions instead of ARM if ARM_INSTRUCTION_SET != arm"
> > > +ARM_THUMB_M_OPT = "${@['-mthumb', '-mno-thumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) != 'arm']}"
> > >  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "${ARM_THUMB_M_OPT}", d)}"
> > > +
> > > +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "-mthumb", "-mno-thumb", d)}"
> > >  OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "thumb", ":thumb", "", d)}"
> > >  
> > >  # Note armv7 will hit on armv7a as well
> > 
> > The original change committed into master in my absence is broken. This
> > patch is just making things even worse and more broken :(
> 
> What's the current situation with this?  As far as I can tell from the
> git log, there doesn't appear to have been any significant change in
> this area since last week: the head of feature-arm-thumb.inc is still at
> the allegedly-broken commit e23f9ce92.  
> 
> Does anybody have a summary of what exactly is broken at the moment and
> what is being done about it?

ARM_THUMB_M_OPT = "${@['-mno-thumb', '-mthumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) == 'thumb']}"
TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "${ARM_THUMB_M_OPT}", d)}"

Master has the above. This means it can set -mthumb for machines that don't have the thumb feature which seems wrong to me. I suspect it should be:

TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "-mno-thumb", d)}"

or if gcc can't cope with that,

TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "", d)}"

instead.

Cheers,

Richard



