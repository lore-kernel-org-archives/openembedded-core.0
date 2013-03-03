Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UC8lz-0006h0-Lb; Sun, 03 Mar 2013 14:16:26 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r23D7Roh027517; Sun, 3 Mar 2013 13:07:27 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xfy221nZWJDu; Sun,  3 Mar 2013 13:07:27 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r23D7IaO027501
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sun, 3 Mar 2013 13:07:21 GMT
Message-ID: <1362315570.4325.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 03 Mar 2013 12:59:30 +0000
In-Reply-To: <20130303123903.GC3285@jama>
References: <20121213174202.GE3356@jama.jama.net> <20130303123903.GC3285@jama>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world
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
X-List-Received-Date: Sun, 03 Mar 2013 13:16:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2013-03-03 at 13:39 +0100, Martin Jansa wrote:
> Updated state of world builds on distroless 
> oe-core+meta-oe+meta-smartphone layers
> this time also on qemux86 and qemux86-64:
> 
> qemuarm:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130301_160601.log/
> qemux86:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130228_235947.log/
> qemux86-64:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130302_074041.log/
> 

> qemuarm:
>   openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb, do_compile

It can't find egl which is probably disabled by opengl being missing
from DISTRO_FEATURES.

> qemux86:
>   openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb, do_compile
>   openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.0.bb, do_compile
> 
> qemux86-64:
>   openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.0.bb, do_compile

opengl isn't in DISTRO_FEATURES which leads xserver-xorg to have
PACKAGECONFIG not containing glx which turns off dri2 which causes the
video driver to fail.

Not sure what we want to do about this :/.

> qemux86-64 has few new QA warnings:
> usbmuxd-git: usbmuxd: Files/directories were installed but not shipped
>   /usr/lib64
>   /usr/lib64/libusbmuxd.so.1.0.8
>   /usr/lib64/libusbmuxd.so.2
>   /usr/lib64/libusbmuxd.so
>   /usr/lib64/.debug
>   /usr/lib64/pkgconfig
>   /usr/lib64/.debug/libusbmuxd.so.1.0.8
>   /usr/lib64/pkgconfig/libusbmuxd.pc

Looks like its ignoring libdir...

> rpm-5.4.9: rpm: Files/directories were installed but not shipped
>   /etc
>   /etc/rcS.d
>   /etc/rcS.d/S98run-postinsts

Bug in master OE-Core we need to fix.

Cheers,

Richard



