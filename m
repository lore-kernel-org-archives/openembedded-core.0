Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QqRCb-0007KA-Vw for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 16:53:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78EmlMC003484
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Aug 2011 15:48:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03344-01 for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2011 15:48:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78EmeJ4003478
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Aug 2011 15:48:41 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <6CFB9718-52F9-45F5-B157-B0410A70DA08@kernel.crashing.org>
References: <1312575061-27569-1-git-send-email-galak@kernel.crashing.org>
	<6CFB9718-52F9-45F5-B157-B0410A70DA08@kernel.crashing.org>
Date: Mon, 08 Aug 2011 15:48:09 +0100
Message-ID: <1312814889.14274.206.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] tune-ppce5500: Add a tune file for PowerPC e5500 core
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
X-List-Received-Date: Mon, 08 Aug 2011 14:53:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-08 at 09:39 -0500, Kumar Gala wrote:
> On Aug 5, 2011, at 3:11 PM, Kumar Gala wrote:
> 
> > Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> > ---
> > meta/conf/machine/include/tune-ppce5500.inc |   14 ++++++++++++++
> > 1 files changed, 14 insertions(+), 0 deletions(-)
> > create mode 100644 meta/conf/machine/include/tune-ppce5500.inc
> > 
> > diff --git a/meta/conf/machine/include/tune-ppce5500.inc b/meta/conf/machine/include/tune-ppce5500.inc
> > new file mode 100644
> > index 0000000..8e6403d
> > --- /dev/null
> > +++ b/meta/conf/machine/include/tune-ppce5500.inc
> > @@ -0,0 +1,14 @@
> > +DEFAULTTUNE ?= "ppce5500"
> > +
> > +require conf/machine/include/powerpc/arch-powerpc64.inc
> > +
> > +TUNEVALID[ppce5500] = "Enable ppce5500 specific processor optimizations"
> > +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce5500", "-mcpu=e5500", "", d)}"
> > +TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce5500", "ppce5500", "${PPCPKGARCH}", d)}"
> > +
> > +AVAILTUNES += "ppce5500"
> > +TUNE_FEATURES_tune-ppce5500 = "m64 ppce5500"
> > +PACKAGE_EXTRA_ARCHS_tune-ppce5500 = "powerpc64 ppce5500"
> > +
> > +# glibc configure options to get e5500 specific library (for sqrt)
> > +GLIBC_EXTRA_OECONF += "--with-cpu=e5500"
> > -- 
> > 1.7.3.4
> 
> If I want to have a version of this for 32-bit only (or default) and one for 64-bit, how would it be best to handle that?

I was wondering about this. You really need to make it conditional on
something, e.g.

GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "m32", ""--with-cpu=e5500", "", d)}"

however, if you do this you need to ensure that TUNE_PKGARCH is not
powerpc but something e5500 specific at this point since you are
enabling e5500 specific optimisations.

Cheers,

Richard



