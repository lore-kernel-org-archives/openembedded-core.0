Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qr7n5-0007Sz-Pl for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 14:21:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ACHDwD021409
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 13:17:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20866-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 13:17:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ACH6rX021403
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 13:17:06 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <C10D3FB0CD45994C8A51FEC1227CE22F2FA7674FDB@shsmsx502.ccr.corp.intel.com>
References: <cover.1312565996.git.nitin.a.kamble@intel.com>
	<d6226c2a156d6c9d53237f98385e252c34a1e74d.1312565996.git.nitin.a.kamble@intel.com>
	<C10D3FB0CD45994C8A51FEC1227CE22F2FA7674FDB@shsmsx502.ccr.corp.intel.com>
Date: Wed, 10 Aug 2011 13:16:32 +0100
Message-ID: <1312978592.14274.358.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/3] x86 tune inc files: add x32 abi tune parameters
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
X-List-Received-Date: Wed, 10 Aug 2011 12:21:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-10 at 10:28 +0800, Lu, Lianhao wrote:
> nitin.a.kamble@intel.com wrote on 2011-08-06:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> > 
> > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > ---
> >  meta/conf/machine/include/ia32/arch-ia32.inc |   19 +++++++++++++++++--
> >  meta/conf/machine/include/tune-core2.inc     |    4 ++++
> >  meta/conf/machine/include/tune-x86_64.inc    |    2 +-
> >  3 files changed, 22 insertions(+), 3 deletions(-)
> > diff --git a/meta/conf/machine/include/ia32/arch-ia32.inc
> > b/meta/conf/machine/include/ia32/arch-ia32.inc index 2709440..96980d2
> > 100644 --- a/meta/conf/machine/include/ia32/arch-ia32.inc +++
> > b/meta/conf/machine/include/ia32/arch-ia32.inc @@ -9,13 +9,22 @@
> > X86ARCH64 ?= "x86_64"
> > 
> >  # ELF32 ABI
> >  TUNEVALID[m32] = "IA32 ELF32 standard ABI"
> > -TUNECONFLICTS[m32] = "m64"
> > +TUNECONFLICTS[m32] = "m64 mx32"
> >  TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m32",
> >  "${X86ARCH32}", "" ,d)}" TUNE_CCARGS +=
> >  "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32",
> > "", d)}"
> > 
> > +# x32 ABI
> > +TUNEVALID[mx32] = "IA32e (x86_64) ELF32 standard ABI"
> > +TUNECONFLICTS[mx32] = "m64 m32"
> > +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "mx32",
> > "${X86ARCH64}", "" ,d)}"
> > +ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", "x32",
> > "" ,d)}"
> > +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32",
> > "-mx32", "", d)}"
> > +TUNE_LDARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-m
> > elf32_x86_64", "", d)}"
> > +TUNE_ASARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32",
> > "", d)}"
> > +
> >  # ELF64 ABI
> >  TUNEVALID[m64] = "IA32e (x86_64) ELF64 standard ABI"
> > -TUNECONFLICT[m64] = "m32"
> > +TUNECONFLICT[m64] = "m32 mx32"
> >  TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m64",
> >  "${X86ARCH64}", "" ,d)}" TUNE_CCARGS +=
> >  "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64",
> > "", d)}"
> > 
> > @@ -31,3 +40,9 @@ AVAILTUNES += "x86-64"
> >  TUNE_FEATURES_tune-x86-64 ?= "m64"
> >  BASE_LIB_tune-x86-64 ?= "lib64"
> >  PACKAGE_EXTRA_ARCHS_tune-x86-64 = "x86_64"
> > + +AVAILTUNES += "x86-64-x32" +TUNE_FEATURES_tune-x86-64-x32 ?= "mx32"
> > +BASE_LIB_tune-x86-64-x32 ?= "lib" +PACKAGE_EXTRA_ARCHS_tune-x86-64-x32
> > = "x86_64-x32" +TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES",
> > "mx32", +"-x32", "", d)}" diff --git
> > a/meta/conf/machine/include/tune-core2.inc
> > b/meta/conf/machine/include/tune-core2.inc index 25c2226..78f8f4d 100644
> > --- a/meta/conf/machine/include/tune-core2.inc +++
> > b/meta/conf/machine/include/tune-core2.inc @@ -18,3 +18,7 @@
> > TUNE_FEATURES_tune-core2-64 ?= "${TUNE_FEATURES_tune-x86-64} core2"
> >  BASE_LIB_tune-core2-64 ?= "lib64"
> >  PACKAGE_EXTRA_ARCHS_tune-core2-64 =
> > "${PACKAGE_EXTRA_ARCHS_tune-x86-64} core2-64"
> > 
> > +AVAILTUNES += "core2-64-x32" +TUNE_FEATURES_tune-core2-64-x32 ?=
> > "${TUNE_FEATURES_tune-x86-64-x32} core2" +BASE_LIB_tune-core2-64-x32 ?=
> > "lib" +PACKAGE_EXTRA_ARCHS_tune-core2-64-x32 =
> > "${PACKAGE_EXTRA_ARCHS_tune-x86-64-x32} core2-64-x32" diff --git
> > a/meta/conf/machine/include/tune-x86_64.inc
> > b/meta/conf/machine/include/tune-x86_64.inc index 04b0f96..50f20ba
> > 100644 --- a/meta/conf/machine/include/tune-x86_64.inc +++
> > b/meta/conf/machine/include/tune-x86_64.inc @@ -1,3 +1,3 @@
> >  require conf/machine/include/ia32/arch-ia32.inc
> > -DEFAULTTUNE = "x86-64"
> > +DEFAULTTUNE ?= "x86-64"
> 
> Well, it seems this "?=" has no effect here because DEFAULTTUNE is already "?="ed in arch-ia32.inc. Now machine qemux86-64 has the incorrect TUNE_ARCH of i586.

Good catch, it should be *before* the require too (like many of the
other similar files). I'll fix this.

Cheers,

Richard



