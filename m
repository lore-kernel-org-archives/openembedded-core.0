Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RaPbK-0004Bs-7p for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 11:28:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBDALp5k007692
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 10:21:51 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06635-07 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 10:21:47 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBDALgbj007686
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 10:21:43 GMT
Message-ID: <1323771701.2731.43.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2011 10:21:41 +0000
In-Reply-To: <CAGiJk9cfqfhg6DqY4hMBVXnABaCw1Ff9Gbojoa1B=+TvWvU9DA@mail.gmail.com>
References: <CAGiJk9cfqfhg6DqY4hMBVXnABaCw1Ff9Gbojoa1B=+TvWvU9DA@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Dependency resolving ignores changed sstate-cache?
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
X-List-Received-Date: Tue, 13 Dec 2011 10:28:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-12-13 at 10:30 +0100, Samuel Stirtzel wrote:
> it seems that I accidentally deleted fbset from my
> .../tmp-eglibc/work/... dir while cleaning out old builds for another
> recipe.
> For some reason I had a r0 directory from the past of the recipe which
> is now r1.
> So I deleted it manually and fbset too, but I didn't notice.
> 
> Thereafter I built an image that has been already built before,
> but it had some IMAGE_INSTALL changes.
> Everything was alright until opkg encountered the following error:
> | Collected errors:
> |  * satisfy_dependencies_for: Cannot satisfy the following
> dependencies for qt4-x11-free:
> |  *    fbset *
> |  * opkg_install_cmd: Cannot install package qt4-x11-free.
> 
> Of course it could not find fbset, as it was deleted previously,
> so I did a "bitbake -ccleansstate fbset" but the error still occurred.
> 
> 
> This leads me to the conclusion, that the sstate-cache change was not
> noticed by bitbake?
> Or is there higher cache instance file that makes bitbake believe that
> fbset was built?
> 
> After I built fbset with bitbake manually everything went back to normal,
> so there is no problem just confusion :)
> 
> 
> 
> For the reason of understanding it, is there any recent documentation
> about the dependency caching of bitbake?

Usually the above is a sign of a dependency bitbake has not been aware
of. Could you see which .ipk has the dependency on fbset?

Its likely some recipe doesn't have fbset in DEPENDS but is somehow
depending on it if it happened to be built before that recipe and was
present in the sysroot. Usually this happens with libraries so I'm a
little puzzled why it would happen with a binary unless there is a lib
in that package too.

Cheers,

Richard







