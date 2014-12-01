Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 80164723FA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 15:21:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Dec 2014 07:21:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,494,1413270000"; d="scan'208";a="616694997"
Received: from fodonogx-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.21.108])
	by orsmga001.jf.intel.com with ESMTP; 01 Dec 2014 07:21:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 01 Dec 2014 15:21:16 +0000
Message-ID: <3316034.dGek4aGvY6@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.3-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <1417446810.15614.28.camel@linuxfoundation.org>
References: <1407438629-13369-1-git-send-email-marex@denx.de>
	<CAJTo0Lbk2eOtBbOFj5d8oEpW6N9p3wmuw5kUMEqzsRKPyakt6w@mail.gmail.com>
	<1417446810.15614.28.camel@linuxfoundation.org>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] Yocto: Install full set of python modules in Qt SDK toolchain
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
X-List-Received-Date: Mon, 01 Dec 2014 15:21:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 01 December 2014 15:13:30 Richard Purdie wrote:
> On Mon, 2014-12-01 at 15:05 +0000, Burton, Ross wrote:
> > On 21 September 2014 at 17:02, Marek Vasut <marex@denx.de> wrote:
> >         -TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host
> >         packagegroup-cross-
> >         canadian-${MACHINE}"
> >         +TOOLCHAIN_HOST_TASK ?= "                               \
> >         +       nativesdk-packagegroup-sdk-host                 \
> >         +       packagegroup-cross-canadian-${MACHINE}          \
> >         +       nativesdk-python-modules
> > 
> > Thanks to Laszlo for pinging this.  We fixed a similar problem in the
> > buildtools tarball by pulling in python-modules but the situation was
> > different there - the buildtools tarball always contained some of
> > Python so it's logical to make it pull in all of python.
> > 
> > It's nativesdk-packagegroup-sdk-host that's pulling in parts of Python
> > via it's dependency on smartpm.  This makes me think we need two
> > changes here:
> > 
> > 1) The toolchain should contain the packaging tools for the selected
> > packaging format of the images, not just smartpm.  So a SDK for a
> > opkg-based image should be shipping opkg, not smartpm.
> 
> Agreed on smartpm, rpm is a bit of a different story due to where it
> gets used in the packaging process. As the SDK and build systems
> converge this gets a bit fuzzy :/.

I'm not entirely sure python-smartpm should have been added by default in the 
first place. I'd say having it there ought to be the choice of the person 
creating the SDK, just as with a lot of other tools one might want in the SDK. 
For most people I suspect it's superfluous.

> > 2) Toolchains should either ship no Python or all Python, because
> > dropping a partial Python into $PATH breaks user's expectations (the
> > same argument that was used for the buildtools).  Not sure how to do
> > this though, maybe the construction should inspect the installed
> > package list and if anything Python was installed, ensure
> > python-modules is also installed.
> > 
> > Comments?
> 
> Make nativesdk-python-core RRECOMMEND python-modules?

This sounds like a reasonable option to me. The split as it is at the moment 
exists mainly for trimming the target; the SDK is perhaps less sensitive to 
size constraints.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

