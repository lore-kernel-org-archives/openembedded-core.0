Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QoNeE-0001uW-5G for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 00:41:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p72MamOO020402;
	Tue, 2 Aug 2011 23:36:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19250-05; Tue,  2 Aug 2011 23:36:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p72Mae0P020396
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 2 Aug 2011 23:36:41 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <4805A8EA-3CA5-4BE5-A078-0F5B0DAA1710@kernel.crashing.org>
References: <cover.1312182844.git.sgw@linux.intel.com>
	<3e502d7441be9c7c25598237f79c527bdf3ce38e.1312182844.git.sgw@linux.intel.com>
	<1312203799.2344.430.camel@rex>
	<4805A8EA-3CA5-4BE5-A078-0F5B0DAA1710@kernel.crashing.org>
Date: Tue, 02 Aug 2011 23:36:23 +0100
Message-ID: <1312324583.2344.616.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/22] tune/arch-powerpc: Use fpu-soft to set PPCPKGSFX_FPU
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
X-List-Received-Date: Tue, 02 Aug 2011 22:41:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-02 at 13:31 -0500, Kumar Gala wrote:
> On Aug 1, 2011, at 8:03 AM, Richard Purdie wrote:
> 
> > On Mon, 2011-08-01 at 00:36 -0700, Saul Wold wrote:
> >> From: Kumar Gala <galak@kernel.crashing.org>
> >> 
> >> Its more likely that we explicitly set soft-floating point support for a
> >> given target than hard.  So use 'fpu-soft' in TUNE_FEATURES rather than
> >> 'fpu-hard' to determine setting 'nf' (no-float) in PPCPKGSFX_FPU.
> >> 
> >> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> >> ---
> >> meta/conf/machine/include/powerpc/arch-powerpc.inc |    2 +-
> >> 1 files changed, 1 insertions(+), 1 deletions(-)
> >> 
> >> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> >> index 8cc76ab..013755d 100644
> >> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
> >> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> >> @@ -18,7 +18,7 @@ TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}
> >> 
> >> ABIEXTENSION = "${@['','spe'][d.getVar('TARGET_FPU', True) in ['ppc-efd', 'ppc-efs']]}"
> >> 
> >> -PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" , "", "-nf", d)}"
> >> +PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "-nf", "", d)}"
> >> 
> >> TUNE_PKGARCH ?= "${TUNE_ARCH}${PPCPKGSFX_FPU}"
> > 
> > Whilst the change itself may or may not be ok, it would need to change
> > the various boards that are already setting or not setting fpu-hard as a
> > feature so as it stands this change is incomplete.
>
> Maybe I misunderstood when I first read this, did you mean we should
> remove explicitly setting 'fpu-hard' on the boards / tune files that
> are doing this?

Yes, that is what I meant.

Cheers,

Richard



