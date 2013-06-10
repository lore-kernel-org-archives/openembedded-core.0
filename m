Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 23EAA6A66B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 12:17:39 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Jun 2013 05:17:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,836,1363158000"; d="scan'208";a="314755633"
Received: from unknown (HELO helios.localnet) ([10.252.122.12])
	by azsmga001.ch.intel.com with ESMTP; 10 Jun 2013 05:17:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: John Stirling <ap.john.stirling@gmail.com>
Date: Mon, 10 Jun 2013 13:17:36 +0100
Message-ID: <1442698.2y5IVPznBc@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-23-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <CABuzA3N_Bk0_AnC3sF4TDqk08F2h2LHcv3ChkWJi4iX=dCKT_g@mail.gmail.com>
References: <CABuzA3PAguwK=KW7xnoe6PJqASWZXktBLB5LTs7LHcw5mopXJQ@mail.gmail.com>
	<2326207.iuBVrRrsbt@helios>
	<CABuzA3N_Bk0_AnC3sF4TDqk08F2h2LHcv3ChkWJi4iX=dCKT_g@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qt4-embedded - image size
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
X-List-Received-Date: Mon, 10 Jun 2013 12:17:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 10 June 2013 12:19:48 John Stirling wrote:
> The Qt application (qtui) is compiled and has some C++, some QML and needs
> to use dbus. I am kicking it off via './qtui -qws'.
> 
> So basically if I had this -
> 
> IMAGE_INSTALL += " \
> qt4-embedded \
> qtui \
> "
> 
> You suggest just cutting it down to
> 
> IMAGE_INSTALL += " \
> qtui \
> "
> and it should work itself out ?

Apart from plugins and anything else that your application doesn't get 
directly linked to, yes.

> I am not entirely sure on the 'inherit qt4e' line.

You do want this here, yes.

> SRC_URI = "git://${SOURCE_REPO}/git/${PN}.git;protocol=ssh;tag=${PV}"

I think you probably should specify SRCREV here, even if it's SRCREV = 
"${AUTOREV}" to build the latest version on the specified branch. For tags that 
won't change, typically we recommend that you specify the full sha1 hash in 
SRCREV and then the system knows it doesn't need to query the git server to 
get the current hash corresponding to the tag.

> PROVIDES = "${PN}_${PV}"

This should not be necessary.

> DEPENDS = "qt4-embedded"

This is already done for you by inheriting qt4e.

> RPROVIDES = "qtui_${PV}"

This should not be necessary either.

> PACKAGES="${PN}"

Unless you have a good reason to do this I would recommend not doing so; the 
standard package splitting should work for most situations and for those where 
it needs to be tweaked slightly that can be done fairly easily.

> FILES_${PN} += "/root/qtui /usr/share/reciva/qml/qtui
> ${sysconfdir}/dbus-1/system.d/"

Typically you would install binaries such as this to ${bindir} rather than 
/root.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

