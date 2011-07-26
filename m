Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qlkgu-0000lW-9y for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 18:41:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6QGatmD023143
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 17:36:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22682-04 for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 17:36:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6QGaklX023137
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 17:36:47 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E2ED5F2.3090306@windriver.com>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<992efbf4ec3d7c55346953dbe82f9745590e64bf.1311683981.git.richard.purdie@linuxfoundation.org>
	<4E2ED5F2.3090306@windriver.com>
Date: Tue, 26 Jul 2011 17:36:38 +0100
Message-ID: <1311698198.2344.279.camel@rex>
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
X-List-Received-Date: Tue, 26 Jul 2011 16:41:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-26 at 09:57 -0500, Mark Hatle wrote:
> On 7/26/11 7:44 AM, Richard Purdie wrote:
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/conf/machine/include/powerpc/arch-powerpc.inc |   45 +++++++++++++++++++-
> >  meta/conf/machine/include/tune-ppc603e.inc         |   12 ++++-
> >  meta/conf/machine/include/tune-ppce300c2.inc       |   12 ++++-
> >  meta/conf/machine/include/tune-ppce500.inc         |   13 ++++--
> >  meta/conf/machine/include/tune-ppce500mc.inc       |   12 ++++-
> >  meta/conf/machine/include/tune-ppce500v2.inc       |   12 ++++-
> >  6 files changed, 88 insertions(+), 18 deletions(-)
> > 
> > diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> > index 17ace32..3f7befb 100644
> > --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
> > +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> > @@ -1,3 +1,44 @@
> > -TUNE_ARCH = "powerpc"
> > +# Power Architecture definition
> > +# Four defined ABIs, all combinations of:
> > +# *) Hard/Soft Floating Point
> > +# *) 32-bit/64-bit
> > +
> > +DEFAULTTUNE ?= "powerpc"
> > +
> > +TUNEVALID[m32] = "Power ELF32 standard ABI"
> > +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32", "", d)}"
> > +
> > +TUNEVALID[m32-arch] = "Enable powerpc package architecture"
> > +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m32-arch" ], "powerpc", "", d)}"
> > +
> > +TUNEVALID[m64] = "Power ELF64 standard ABI"
> > +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "n64", "-m64", "", d)}"
> > +
> > +TUNEVALID[m64-arch] = "Enable powerpc64 package architecture"
> > +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64-arch" ], "powerpc64", "", d)}"
> 
> Why m32-arch and m64-arch?  If m32 or m64 is selected then it should mean
> powerpc or powerpc64.

I've gotten confused here and mixed up TUNE_ARCH and TUNE_PKGARCH but
there was a reason.

The missing piece is 

TUNE_PKGARCH ?= "${TUNE_ARCH}"

and the trouble comes when a tune file wants to change this only when
its tune config is in action.

I'm thinking ahead to trying a mixed ppc 32 and 64 bit build where
TUNE_PKGARCH needs to take on the values for both configs.

> > +TUNEVALID[fpu-hard] = "Use hardware FPU."
> > +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", "-mhard-float", "", d)}"
> > +
> > +TUNEVALID[fpu-soft] = "Use software FPU."
> > +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "-msoft-float", "", d)}"
> > +TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}"
> 
> Why specify both fpu-hard and fpu-soft?  The "unusual" ABI is fpu-soft.  It
> would simplify it to only have to specify one, and you get the other automatically.

The trouble is the spe pieces which seemed to imply TARGET_FPU should
take on a value of other than "soft". Setting it to "soft" if fpu-hard
isn't in TUNE_FEATURES therefore wasn't enough...

> > +TUNEVALID[spe] = "Enable SPE ABI extensions"
> > +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe", "", d)}"
> > +
> > +ABIEXTENSION = "${@['','spe'][d.getVar('TARGET_FPU', True) in ['ppc-efd', 'ppc-efs']]}"
> 
> SPE instructions are specific to certain processors and not generic across all
> of PPC.  I would move this to each of the tunes where it may be used.

I guess this should be a feature file like thumb on arm?

> Also I see the ABIEXTENSION, but where is it being set?

I'm just migrating the existing code in that regard, I'm also puzzled as
to where that is getting set currently.

> > +# Basic tune definitions
> > +AVAILTUNES += "powerpc powerpc-nf" 
> > +TUNE_FEATURES_tune-powerpc ?= "m32 m32-arch fpu-hard"
> > +BASE_LIB_tune-powerpc = "lib"
> > +TUNE_FEATURES_tune-powerpc-nf ?= "m32 m32-arch fpu-soft"
> > +BASE_LIB_tune-powerpc-nf = "lib"
> > +
> > +AVAILTUNES += "powerpc64 powerpc64-nf"
> > +TUNE_FEATURES_tune-powerpc64 ?= "m64 m64-arch fpu-hard"
> > +BASE_LIB_tune-powerpc64 = "lib64"
> > +TUNE_FEATURES_tune-powerpc64-nf ?= "m64 m64-arch fpu-soft"
> > +BASE_LIB_tune-powerpc64-nf = "lib64"
> >  
> > -ABIEXTENSION = "${@['','spe'][bb.data.getVar('TARGET_FPU',d,1) in ['ppc-efd', 'ppc-efs']]}"
> > diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
> > index 61c0669..6991ae0 100644
> > --- a/meta/conf/machine/include/tune-ppc603e.inc
> > +++ b/meta/conf/machine/include/tune-ppc603e.inc
> > @@ -1,5 +1,11 @@
> > +DEFAULTTUNE ?= "ppc603e"
> > +
> >  require conf/machine/include/powerpc/arch-powerpc.inc
> >  
> > -TUNE_CCARGS = "-mcpu=603e  -mhard-float"
> > -TUNE_PKGARCH = "ppc603e"
> > -PACKAGE_EXTRA_ARCHS = "powerpc ppc603e"
> > +TUNEVALID[ppc603e] = "Enable ppc603e specific processor optimizations"
> > +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "-mcpu=603e", "", d)}"
> > +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "ppc603e", "", d)}"
> > +
> > +AVAILTUNES += "ppc603e"
> > +TUNE_FEATURES_tune-ppc603e = "m32 fpu-hard ppc603e"
> > +PACKAGE_EXTRA_ARCHS_tune-ppc603e = "powerpc ppc603e"
> 
> Going back to my original comment, the m32-arch is missing... or m32 should mean
> "powerpc" (my suggestion).

No, TUNE_ARCH should be TUNE_PKGARCH above, then this makes more
sense...

> > diff --git a/meta/conf/machine/include/tune-ppce300c2.inc b/meta/conf/machine/include/tune-ppce300c2.inc
> > index a38e97c..652422f 100644
> > --- a/meta/conf/machine/include/tune-ppce300c2.inc
> > +++ b/meta/conf/machine/include/tune-ppce300c2.inc
> > @@ -1,5 +1,11 @@
> > +DEFAULTTUNE ?= "ppce300"
> > +
> >  require conf/machine/include/powerpc/arch-powerpc.inc
> >  
> > -TUNE_CCARGS = "-mcpu=e300c2 -msoft-float"
> > -TUNE_PKGARCH = "ppce300"
> > -PACKAGE_EXTRA_ARCHS = "powerpc ppce300"
> > +TUNEVALID[ppce300] = "Enable ppce300 specific processor optimizations"
> > +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce300", "-mcpu=e300c2", "", d)}"
> > +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce300", "ppce300", "", d)}"
> > +
> > +AVAILTUNES += "ppce300"
> > +TUNE_FEATURES_tune-ppce300 = "m32 fpu-soft ppce300"
> > +PACKAGE_EXTRA_ARCHS_tune-ppce300 = "powerpc ppce300"
> 
> There is also a ppce300 as well as the e300c2, so I'd change the option to be
> fully qualified.  (One has floating point one doesn't..)

Fair enough.

> > diff --git a/meta/conf/machine/include/tune-ppce500.inc b/meta/conf/machine/include/tune-ppce500.inc
> > index 22208f0..fe62445 100644
> > --- a/meta/conf/machine/include/tune-ppce500.inc
> > +++ b/meta/conf/machine/include/tune-ppce500.inc
> > @@ -1,6 +1,11 @@
> > +DEFAULTTUNE ?= "ppce500"
> > +
> >  require conf/machine/include/powerpc/arch-powerpc.inc
> >  
> > -TUNE_CCARGS = "-mcpu=8540"
> > -BASE_PACKAGE_ARCH = "ppce500"
> > -TUNE_PKGARCH = "ppce500"
> > -PACKAGE_EXTRA_ARCHS = "powerpc ppce500"
> > +TUNEVALID[ppce500] = "Enable ppce500 specific processor optimizations"
> > +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "-mcpu=8540", "", d)}"
> > +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "ppce500", "", d)}"
> > +
> > +AVAILTUNES += "ppce500"
> > +TUNE_FEATURES_tune-ppce500 = "m32 ppce500"
> > +PACKAGE_EXTRA_ARCHS_tune-ppce500 = "powerpc ppce500"
> 
> This is the single precision e500 -- it should be specifying it's floating point
> type.

which is? :)

> > diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
> > index 182d019..0d3640f 100644
> > --- a/meta/conf/machine/include/tune-ppce500mc.inc
> > +++ b/meta/conf/machine/include/tune-ppce500mc.inc
> > @@ -1,5 +1,11 @@
> > +DEFAULTTUNE ?= "ppce500mc"
> > +
> >  require conf/machine/include/powerpc/arch-powerpc.inc
> >  
> > -TUNE_CCARGS = "-mcpu=e500mc"
> > -TUNE_PKGARCH = "ppce500mc"
> > -PACKAGE_EXTRA_ARCHS = "powerpc ppce500mc"
> > +TUNEVALID[ppce500mc] = "Enable ppce500mc specific processor optimizations"
> > +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "-mcpu=e500mc", "", d)}"
> > +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "ppce500mc", "", d)}"
> > +
> > +AVAILTUNES += "ppce500mc"
> > +TUNE_FEATURES_tune-ppce500mc = "m32 ppce500mc"
> > +PACKAGE_EXTRA_ARCHS_tune-ppce500mc = "powerpc ppce500mc"
> 
> e500mc using the classic "hard-float" floating point unit.

ok, so its hard-fpu...

> > diff --git a/meta/conf/machine/include/tune-ppce500v2.inc b/meta/conf/machine/include/tune-ppce500v2.inc
> > index daf2d58..e6b48a2 100644
> > --- a/meta/conf/machine/include/tune-ppce500v2.inc
> > +++ b/meta/conf/machine/include/tune-ppce500v2.inc
> > @@ -1,5 +1,11 @@
> > +DEFAULTTUNE ?= "ppce500v2"
> > +
> >  require conf/machine/include/powerpc/arch-powerpc.inc
> >  
> > -TUNE_CCARGS = "-mcpu=8548 -mabi=spe -mspe"
> > -TUNE_PKGARCH = "ppce500v2"
> > -PACKAGE_EXTRA_ARCHS = "powerpc ppce500v2"
> > +TUNEVALID[ppce500mc] = "Enable ppce500mc specific processor optimizations"
> > +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "-mcpu=8548", "", d)}"
> > +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "ppce500v2", "", d)}"
> > +
> > +AVAILTUNES += "ppce500v2"
> > +TUNE_FEATURES_tune-ppce500v2 = "m32 spe ppce500v2"
> > +PACKAGE_EXTRA_ARCHS_tune-ppce500v2 = "powerpc ppce500v2"
> 
> This one is double precision.

so hard-fpu?

Cheers,

Richard



