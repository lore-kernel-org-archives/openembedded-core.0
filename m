Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TdRjN-0005In-6S for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 21:26:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qARKBs6V006839;
	Tue, 27 Nov 2012 20:11:54 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06570-06; Tue, 27 Nov 2012 20:11:50 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qARKBhr9006833
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 27 Nov 2012 20:11:44 GMT
Message-ID: <1354047102.21863.105.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 27 Nov 2012 20:11:42 +0000
In-Reply-To: <20121127154129.GC3692@jama.jama.net>
References: <20121127154129.GC3692@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RDEPENDS of packages created by PACKAGES_DYNAMIC not built before image rootfs
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
X-List-Received-Date: Tue, 27 Nov 2012 20:26:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-11-27 at 16:41 +0100, Martin Jansa wrote:
> Hi,
> 
> pulseaudio has
> RDEPENDS_pulseaudio-module-console-kit =+ "consolekit"
> 
> and pulseaudio-module-console-kit is dynamic package
> PACKAGES_DYNAMIC += "^pulseaudio-lib.* ^pulseaudio-module.* ^libpulse-lib.* ^libpulse-module.* "
> 
> If you have image where consolekit is pulled to image only by 
> pulseaudio-module-console-kit (e.g. through pulseaudio-server). 
> Then consolekit is not built before image do_rootfs is executed and do_rootfs fails.
> 
> Easy way to reproduce this is to build e.g. core-image-minimal with 
> pulseaudio-module-console-kit or pulseaudio-server added to IMAGE_INSTALL. 
> Will fail with:
>   * satisfy_dependencies_for: Cannot satisfy the following dependencies for pulseaudio-server:
>   *    consolekit *
>   * opkg_install_cmd: Cannot install package pulseaudio-server.
> 
> 
> Not sure what's proper fix, bitbake probably just checks that right provider for 
> pulseaudio-module-console-kit is pulseaudio because of PACKAGES_DYNAMIC, but does not check 
> RDEPENDS_pulseaudio-module-console-kit after that.
> 
> We can add consolekit to build time deps like it was before, but that's just 
> work around and not correct fix.
> 
> Also filled as
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3498

Well, you can't have this both ways :)

Bitbake doesn't know which modules this package will produce since its
using PACKAGES_DYNAMIC. It does its best effort to try and find DEPENDS
but it can't take the regexps and come up with
"pulseaudio-module-console-kit", hence it doesn't see the RDEPENDS.
There isn't any generic way we can teach it to do that either. If it
did, it would simply always build consolekit which you say you don't
want so its not relevant anyway.

So basically, you need to decide whether you want consolekit enabled or
not and build accordingly, there is nothing you can do within bitbake to
"mind read" what the image is going to want...

Cheers,

Richard




