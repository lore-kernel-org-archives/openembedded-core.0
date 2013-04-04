Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UNmp0-0003S6-Kd for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 18:15:31 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r34G8u3h026366; Thu, 4 Apr 2013 17:08:56 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uKyO90vfQYO8; Thu,  4 Apr 2013 17:08:56 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r34G8nSd026338
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 4 Apr 2013 17:08:52 +0100
Message-ID: <1365091084.6526.112.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 04 Apr 2013 16:58:04 +0100
In-Reply-To: <20130404153930.GD1271@jama.dyndns-home.com>
References: <20130320202206.GD3220@jama>
	<1364984074-3636-1-git-send-email-Martin.Jansa@gmail.com>
	<20130404153930.GD1271@jama.dyndns-home.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 1/2] packagedata: show error when there are multiple pkgdata directories
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
X-List-Received-Date: Thu, 04 Apr 2013 16:15:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-04-04 at 17:39 +0200, Martin Jansa wrote:
> On Wed, Apr 03, 2013 at 12:14:33PM +0200, Martin Jansa wrote:
> > * when PACKAGE_ARCH is changed e.g. from MACHINE_ARCH to TUNE_PKGARCH
> >   get_subpkgedata_fn is still reading old MACHINE_ARCH directory instead of newer with TUNE_PKGARCH
> 
> This is too strict in some cases, e.g.:
> 
> ERROR: More then one pkgdata dir found for pkg 'opkg-collateral'
> (
> '/OE/shr-core/tmp-eglibc/pkgdata/cortexa8-vfp-neon-oe-linux-gnueabi/runtime/opkg-collateral',
> '/OE/shr-core/tmp-eglibc/pkgdata/armv5te-oe-linux-gnueabi/runtime/opkg-collateral'),
> returning first
> 
> Why do we need to look in all pkgdatadirs? Why not just PACKAGE_ARCH?

It needs to do resolution, so for example you might have a machine
specific library you'd expect the code to find it first, then
architecture specific and finally all arch only if the others don't work
out.

Having said that, I've had thoughts about making this just look at
machine, package_arch and allarch, not everything. It also gets more
complicated with multilibs.

It may be the different callers might need to specify more about what
exactly they're after as they may want different things.

Cheers,

Richard



