Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7C0EE780BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 07:47:56 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4U7lthE032114
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 30 May 2017 08:47:56 +0100
Message-ID: <1496130475.25229.160.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 30 May 2017 08:47:55 +0100
In-Reply-To: <CAHUNapREVWXEaWYDYon8cYByzXcAdEu=_uWMAHCbOjU6VXrghg@mail.gmail.com>
References: <20170526212248.16374-1-twoerner@gmail.com>
	<1496100337.25229.147.camel@linuxfoundation.org>
	<CAHUNapREVWXEaWYDYon8cYByzXcAdEu=_uWMAHCbOjU6VXrghg@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 30 May 2017 08:47:56 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: potentially enable texture float for gallium
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
X-List-Received-Date: Tue, 30 May 2017 07:47:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-05-30 at 01:28 -0400, Trevor Woerner wrote:
> On Mon, May 29, 2017 at 7:25 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Fri, 2017-05-26 at 17:22 -0400, Trevor Woerner wrote:
> > > 
> > > Somewhere along the path from OpenGL ES 2.0 to OpenGL ES 3.0 are
> > > some
> > > algorithms that are encumbered by patents. These algorithms are
> > > enabled with
> > > mesa's --enable-texture-float configure flag. However, if
> > > hardware
> > > acceleration is being used and the hardware supports --enable-
> > > texture-float,
> > > it means the hardware vendor has paid for the patents.
> > > 
> > > This patch will add --enable-texture-float for any hardware-
> > > backed
> > > gallium
> > > mesa driver. In other words, if you are only using the software
> > > backup
> > > (swrast) you'll need to enable this flag if you know what you're
> > > doing (which
> > > assumes you are complying with the patent). Otherwise we enable
> > > this
> > > flag so
> > > the software can take full advantage of the hardware.
> > Does this handle the case where the driver may or may not run on a
> > platform with the relevant hardware?
> The choice of gallium driver should be set based on the MACHINE
> setting, so hopefully this is being set correctly from the BSP.
> Presumably the user isn't building gallium with "swrast,imx,etnaviv"
> then trying to run that on intel hardware! In which case, you are
> right: the imx/etnaviv code will not be able to initialize the
> hardware, and the code will fallback to use swrast (if it was in the
> list).

The issue is that mesa isn't built per MACHINE, nor is it machine
specific, we build it once, enabling all the drivers for a given
architecture and then packaging them separately in some cases.

We then RDEPEND on specific sets of drivers for specific machines.


> > Some platforms add swrast as well
> > as hardware acceleration which based on what I read above, may
> > breach
> > patents depending on which hardware its run on?
> My understanding (from chatting with airlied on #dri-devel) is that
> it's one or the other, there is no fallback: "the drivers don't
> dynamically fallback ever"
> 
> If the driver can't initialize the graphics hardware, then it will
> fall back (fully) to swrast... if it was listed. This makes me wonder
> if "swrast" should be always added to the list of gallium drivers
> built on those platforms with hardware-supported gallium drivers?
> Wouldn't it be better to have the graphics system fail to come up if
> something is configured wrong, rather than to fallback to software
> rasterization and let the user think everything is okay?

See above, mesa is not machine specific (nor should it be).

> Currently the OE code initializes the list of gallium drivers to be
> built to "swrast" then potentially adds others based on
> PACAKGECONFIGs
> which are expected to point to which hardware is expected. Maybe the
> OE code should try to set a hardware-specific gallium driver, and use
> --enable-texture-float. If, at the end, no gallium drivers are
> listed,
> then the OE code should set the list to "swrast" and not include
> --enable-texture-float?
> 
> If you're running mesa on platforms that have hardware support, the
> "swrast" is not required (as is my understanding, but I could look
> into this).

Right, that makes sense. We do run on platforms where we do need
swrast, e.g. all our qemu testing. We also support generic platforms
like genericx86 where we don't know which hardware we'll run on.

> According to Dave Airlie, Fedora builds now include this option.
> Specifically: "there is a fedora patch that mostly does that \n
> disable the float just for swrast". Then later: "actually the patch
> it
> ships now just bars float on llvmpipe and softpipe". This requires
> some "reading between the lines", however. Of some interest might be
> that Arch also includes this option by default (2011) [1] as does
> "Intel mesa" (2012) [2]. I can't find anything definitive, but it
> looks like Ubuntu also includes this option by default (starting with
> 14?).
> 
> Sadly, if we don't add this option, mesa's advertisement will be
> limited to open gl (es) 2, even in cases where the hardware would
> support 3 (and greater?).
> 
> [1] http://www.phoronix.com/scan.php?page=news_item&px=OTUxMg
> [2] http://www.phoronix.com/scan.php?page=news_item&px=MTIwOTg

We should look at how Fedora "just bars float on llvmpipe and softpipe"
and perhaps look at copying that? Not that we enable llvmpipe at the
moment either mind so presumably we're using softpipe.

Cheers,

Richard



