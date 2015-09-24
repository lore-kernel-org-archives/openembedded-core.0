Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 14E9C76FDE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 06:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8O6pAEc001881; Thu, 24 Sep 2015 07:51:10 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MRu1OJtxU2o5; Thu, 24 Sep 2015 07:51:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8O6otpT001870
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 24 Sep 2015 07:51:06 +0100
Message-ID: <1443077455.19044.55.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 24 Sep 2015 07:50:55 +0100
In-Reply-To: <CAP71WjyWRXrvUyi1HvdusRkKLb5Gf3H2gzCNPKkUDAstA4M55A@mail.gmail.com>
References: <CAP71WjyWRXrvUyi1HvdusRkKLb5Gf3H2gzCNPKkUDAstA4M55A@mail.gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Including machine specific mesa-driver
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
X-List-Received-Date: Thu, 24 Sep 2015 06:51:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-09-23 at 22:38 -0700, Nicolas Dechesne wrote:
> in the qemu reference machine we see this pattern:
>
> XSERVER = "xserver-xorg
> \                                                                                                                                                                             
>            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> 'mesa-driver-swrast', '', d)}
> \                                                                                                          
>
> Which is what I had done for my BSP layer as well. However this
> doesn't take into account non X11 based graphics config, such as when
> building a wayland/weston image. The mesa-driver should be
> conditionally pulled when 'mesa' is pulled in.
>
> I cannot find a satisfying way of specifying this better to take both
> cases into account.
>
> we could move 
> ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> 'mesa-driver-swrast', '', d)} 
>
> into MACHINE_RRDEPENS, but that's not quite right, since that driver
> is only needed when any of the mesa binary packages is in the image,
> and non graphics image wouldnt' need that.
>
> Since mesa produces a lot of binary packages , using RDEPENDS_xxx for
> all of them doesn't seem very nice neither..
>
> What would you recommend we do? I think we need to fix the qemu images
> anyways.

The idea was that the machine config can nominate the "X11" config it
needs by indicating the drivers that make sense for this piece of
hardware. The XSERVER variable is then used to decide which pieces of X
to pull in and pulling in the right mesa pieces at the same time made
sense then.

We could split the mesa pieces out into a separate MESADRIVERS variable
and the wayland/weston could just pull those in? Ultimately its still
the machine config which has the knowledge of which drivers make sense
for a given platform. Exactly which piece of the system would pull in
MESADRIVERS is a good question but I've not looked at the metadata just
thinking out loud.

Cheers,

Richard






