Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qll8w-0001fZ-LQ for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 19:10:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6QH5r2K023452
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 18:05:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22682-09 for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 18:05:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6QH5jRp023446
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 18:05:45 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E2EF10A.2030705@windriver.com>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<992efbf4ec3d7c55346953dbe82f9745590e64bf.1311683981.git.richard.purdie@linuxfoundation.org>
	<4E2ED5F2.3090306@windriver.com> <1311698198.2344.279.camel@rex>
	<4E2EF10A.2030705@windriver.com>
Date: Tue, 26 Jul 2011 18:05:37 +0100
Message-ID: <1311699937.2344.289.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/3] Add basic PowerPC core tune config
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
X-List-Received-Date: Tue, 26 Jul 2011 17:10:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-26 at 11:53 -0500, Mark Hatle wrote:
> On 7/26/11 11:36 AM, Richard Purdie wrote:
> > On Tue, 2011-07-26 at 09:57 -0500, Mark Hatle wrote:
> >> On 7/26/11 7:44 AM, Richard Purdie wrote:
> >>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >>> ---
> >>>  meta/conf/machine/include/powerpc/arch-powerpc.inc |   45 +++++++++++++++++++-
> >>>  meta/conf/machine/include/tune-ppc603e.inc         |   12 ++++-
> >>>  meta/conf/machine/include/tune-ppce300c2.inc       |   12 ++++-
> >>>  meta/conf/machine/include/tune-ppce500.inc         |   13 ++++--
> >>>  meta/conf/machine/include/tune-ppce500mc.inc       |   12 ++++-
> >>>  meta/conf/machine/include/tune-ppce500v2.inc       |   12 ++++-
> >>>  6 files changed, 88 insertions(+), 18 deletions(-)
> >>>
> >>> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> >>> index 17ace32..3f7befb 100644
> >>> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
> >>> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> >>> @@ -1,3 +1,44 @@
> >>> -TUNE_ARCH = "powerpc"
> >>> +# Power Architecture definition
> >>> +# Four defined ABIs, all combinations of:
> >>> +# *) Hard/Soft Floating Point
> >>> +# *) 32-bit/64-bit
> >>> +
> >>> +DEFAULTTUNE ?= "powerpc"
> >>> +
> >>> +TUNEVALID[m32] = "Power ELF32 standard ABI"
> >>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32", "", d)}"
> >>> +
> >>> +TUNEVALID[m32-arch] = "Enable powerpc package architecture"
> >>> +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m32-arch" ], "powerpc", "", d)}"
> >>> +
> >>> +TUNEVALID[m64] = "Power ELF64 standard ABI"
> >>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "n64", "-m64", "", d)}"
> >>> +
> >>> +TUNEVALID[m64-arch] = "Enable powerpc64 package architecture"
> >>> +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64-arch" ], "powerpc64", "", d)}"
> >>
> >> Why m32-arch and m64-arch?  If m32 or m64 is selected then it should mean
> >> powerpc or powerpc64.
> > 
> > I've gotten confused here and mixed up TUNE_ARCH and TUNE_PKGARCH but
> > there was a reason.
> > 
> > The missing piece is 
> > 
> > TUNE_PKGARCH ?= "${TUNE_ARCH}"
> > 
> > and the trouble comes when a tune file wants to change this only when
> > its tune config is in action.
> > 
> > I'm thinking ahead to trying a mixed ppc 32 and 64 bit build where
> > TUNE_PKGARCH needs to take on the values for both configs.
> 
> As far as I can tell, in all cases m32 = powerpc and m64 = powerpc64..  There is
> no way to mix a build of ppc32 and ppc64 w/o using the multilib code.
> 
> The m32/m64 is the ABI, so only one can be present in the TUNE_FEATURES.. and
> passed via gcc through the TUNE_CCARGS.

Ok, say I use tune-ppcXXX and it sets TUNE_PKGARCH:

TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "ppc603e", "", d)}"

and I want a multilib config using this as the m32 ABI and also have
powerpc64 as my other multilib. I can't select that as it will get
TUNE_PKGARCH wrong in the 64 bit case since:

TUNE_PKGARCH ?= "${TUNE_ARCH}"

is overwritten. I guess we could do:

TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "ppc603e", "${TUNE_ARCH}", d)}"

?

Cheers,

Richard



