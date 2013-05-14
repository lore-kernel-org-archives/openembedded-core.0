Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1UcBax-0007tk-Tl
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 11:32:39 +0200
Received: from [192.168.0.2] (host86-137-102-112.range86-137.btcentralplus.com
	[86.137.102.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 8388C952B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2013 10:14:22 +0100 (BST)
Message-ID: <5192006C.1060803@r-finger.com>
Date: Tue, 14 May 2013 10:14:20 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
CC: openembedded-core@lists.openembedded.org
References: <518A6B25.5000108@r-finger.com> <1368026618.27116.52.camel@ted>
	<518A7B37.8050308@r-finger.com> <1368176725.11129.9.camel@ted>
	<518CD26F.3090901@r-finger.com> <1368185566.11129.28.camel@ted>
	<518D22CC.1040002@r-finger.com> <1368206371.11129.46.camel@ted>
	<CAP9ODKqGThBAjFkc1ViF9TJhW6z-xuVwwmDOa9mXg+h=TALJpw@mail.gmail.com>
	<518D5A7D.20606@windriver.com> <5190B2AE.9010102@r-finger.com>
	<1368459699.6920.41.camel@phil-desktop.brightsign>
In-Reply-To: <1368459699.6920.41.camel@phil-desktop.brightsign>
Subject: Re: proposal to move cogl, clutter and related recipes from oe-core to dedicated meta-clutter layer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 May 2013 09:32:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Phil,

On 13/05/13 16:41, Phil Blundell wrote:
> It seems a bit hyperbolic to claim that testing clutter is impossible
> without GPU hardware (either real or emulated).  The majority of the
> code even in cogl, and virtually all the code in clutter itself, is
> mostly independent of the underlying GL implementation.  From the point
> of view of testing whether clutter basically "works" and is correctly
> built/packaged it seems as though this ought to be quite sufficient.

There are too separate issues: testing clutter itself, and using clutter
to test other parts of the graphics stack.

Re the former, all you can say after testing cogl/clutter against mesa
software rasterizer is that a particular configuration and a particular
backend (in oe-core that would be the GLX backend) work with mesa
software rasterizer. This says nothing about any other configuration,
with any other backend or whether it works with any other GL/GLES
implementation.

In reality, cogl/clutter need patches to build against the likes of TI's
GLES (e.g., Beagleboard) or to work on the likes of RaspberryPi, and
these patches cannot be included in oe-core, of course, because oe-core
knows nothing of such machines. Then there are little annoyances, like
the fact that over the last year or so, clutter has tended to have a
dependency on a specific but mostly random versions of libxkbcommon
(from what I can gather, determined more then anything by whatever the
Fedora packager happened to package and what version of Fedora the
clutter maintainer was using), or Clutter's customary insistence on as
recent glib as you can get. This can all be nicely encapsulated in small
layer.

Regarding using clutter to test other parts of the graphics stack, which
is what Richard is wanting clutter in oe-core for, this amounts to
testing mesa sw rasterizer. There is limited value here, it's the one GL
implementation that nobody using Yocto to build images will be deploying
for real, so this is a weak argument for needing clutter in oe-core.

Tomas

-- 
http://sleepfive.com


