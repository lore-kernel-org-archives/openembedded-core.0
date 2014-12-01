Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3AAF4718FB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 15:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sB1FDAHp005785; Mon, 1 Dec 2014 15:13:10 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EraEDfeeD-nQ; Mon,  1 Dec 2014 15:13:10 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sB1FCrWB005778
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 1 Dec 2014 15:13:05 GMT
Message-ID: <1417446810.15614.28.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 01 Dec 2014 15:13:30 +0000
In-Reply-To: <CAJTo0Lbk2eOtBbOFj5d8oEpW6N9p3wmuw5kUMEqzsRKPyakt6w@mail.gmail.com>
References: <1407438629-13369-1-git-send-email-marex@denx.de>
	<201409190914.03281.marex@denx.de> <1411111512.4736.11.camel@ted>
	<201409211802.17872.marex@denx.de>
	<CAJTo0Lbk2eOtBbOFj5d8oEpW6N9p3wmuw5kUMEqzsRKPyakt6w@mail.gmail.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 01 Dec 2014 15:14:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-12-01 at 15:05 +0000, Burton, Ross wrote:
> On 21 September 2014 at 17:02, Marek Vasut <marex@denx.de> wrote:
>         -TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host
>         packagegroup-cross-
>         canadian-${MACHINE}"
>         +TOOLCHAIN_HOST_TASK ?= "                               \
>         +       nativesdk-packagegroup-sdk-host                 \
>         +       packagegroup-cross-canadian-${MACHINE}          \
>         +       nativesdk-python-modules       
> 
> Thanks to Laszlo for pinging this.  We fixed a similar problem in the
> buildtools tarball by pulling in python-modules but the situation was
> different there - the buildtools tarball always contained some of
> Python so it's logical to make it pull in all of python.
>
> It's nativesdk-packagegroup-sdk-host that's pulling in parts of Python
> via it's dependency on smartpm.  This makes me think we need two
> changes here:
>
> 1) The toolchain should contain the packaging tools for the selected
> packaging format of the images, not just smartpm.  So a SDK for a
> opkg-based image should be shipping opkg, not smartpm.

Agreed on smartpm, rpm is a bit of a different story due to where it
gets used in the packaging process. As the SDK and build systems
converge this gets a bit fuzzy :/.
> 
> 2) Toolchains should either ship no Python or all Python, because
> dropping a partial Python into $PATH breaks user's expectations (the
> same argument that was used for the buildtools).  Not sure how to do
> this though, maybe the construction should inspect the installed
> package list and if anything Python was installed, ensure
> python-modules is also installed.
>
> Comments?
> 
Make nativesdk-python-core RRECOMMEND python-modules?

Cheers,

Richard



