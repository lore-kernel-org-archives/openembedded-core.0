Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TOuKt-00017j-RS for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 19:56:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9IHhRo4021781;
	Thu, 18 Oct 2012 18:43:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20972-09; Thu, 18 Oct 2012 18:43:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9IHhJv7021775
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 18 Oct 2012 18:43:20 +0100
Message-ID: <1350582198.2520.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Thu, 18 Oct 2012 18:43:18 +0100
In-Reply-To: <508005D9.2060507@linaro.org>
References: <508005D9.2060507@linaro.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Can we trust to sstate-cache?
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
X-List-Received-Date: Thu, 18 Oct 2012 17:56:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-10-18 at 15:36 +0200, Marcin Juszkiewicz wrote:
> Today I bumped gcc-linaro from 4.7-r5 to 4.7-r6. First version was plain
> 2012.10 release while second one was tarball from bzr repository with
> huge set of ICE related fixes for AArch64 architecture.
> 
> To do fast clean build I removed TMPDIR and started new build of
> core-image-minimal target.
> 
> But then I noticed ugly thing:
> 
> 0: eglibc-2.16-r18+svnr20393 do_populate_sysroot_setscene (pid 30106)
> 1: eglibc-2.16-r18+svnr20393 do_package_setscene (pid 30107)
> 3: eglibc-initial-2.16-r18+svnr20393 do_package_setscene (pid 28921)
> 
> Why eglibc was taken from sstate-cache instead of being rebuilt (like it
> was with 'db')? This makes me sad as it shows that I cannot trust
> sstate-cache so each new build will take hours instead of minutes.
> 
> Or maybe I am wrong?

In order to try and stop people going entirely insane and to illustrate
the kind of controls that are possible, we have some default sstate
policy in:

http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/lib/oe/sstatesig.py

which basically stops the sstate sigs at the native/cross to target
boundary.

So in your specific case, it wouldn't rebuild eglibc even though you
changed gcc and this was expected. You could customise sstatesig.py to
change that (remove the isCross() bits).

Cheers,

Richard



