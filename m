Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QzFNK-0004c3-0U for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 00:04:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p81Lxkqr020550
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Sep 2011 22:59:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20162-03 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2011 22:59:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p81LxbDw020544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Sep 2011 22:59:38 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1314906289.2958.7.camel@lenovo.internal.reciva.com>
References: <cover.1306865217.git.scott.a.garman@intel.com>
	<7826575ce92090c4460c7d016e0b06441f84cff7.1306865217.git.scott.a.garman@intel.com>
	<1314895291.19905.197.camel@phil-desktop>
	<4E5FB8AC.1070007@windriver.com>
	<1314896288.19905.199.camel@phil-desktop>
	<4E5FBFEC.3060406@windriver.com>
	<1314906289.2958.7.camel@lenovo.internal.reciva.com>
Date: Thu, 01 Sep 2011 22:59:20 +0100
Message-ID: <1314914360.5939.574.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/7] shadow: add a -native recipe with customized utilities
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
X-List-Received-Date: Thu, 01 Sep 2011 22:04:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-01 at 20:44 +0100, Phil Blundell wrote:
> On Thu, 2011-09-01 at 12:25 -0500, Mark Hatle wrote:
> > On 9/1/11 11:58 AM, Phil Blundell wrote:
> > > And, I guess, if you want to support online package management then it
> > > does make some sense to have the shadow utils there.  But I don't
> > > need/want that in my configuration.
> > 
> > Does busybox or something else provide a compatible adduser?  If so maybe a
> > virtual RDEPENDS is more reasonable in this case.
> 
> I'm not sure offhand (it's actually useradd, not adduser, for what
> that's worth) but, even if busybox does provide those applets, that
> probably isn't quite the point.  The issue here is that I don't really
> want to have any implementation of useradd at all on the target system;
> using one from busybox would be a bit less bad than requiring standalone
> shadow, but still not really ideal.
> 
> One workaround would be to weaken the RDEPENDS to an RRECOMMENDS, which
> would allow me to declare it as a BAD_RECOMMENDATION.  Or I guess we
> could make it be a virtual and I could then provide a dummy-useradd
> package which satisfies the dependency but doesn't actually install any
> files.  
> 
> The approach we take with update-rc.d is to let it be installed and then
> have rootfs_ipk rip it back out again after image construction is done,
> but this won't work with shadow as it stands due to the postinst issue
> in that package.  So a third option would be to find a way to finesse
> the postinst thing somehow and then use the same rootfs_ipk logic with
> shadow too.

The latter sounds like what we'll need to do. I haven't looked at shadow
to see what kind of finessing is required though...

Does opkg have any notion of bitbake's ASSUME_PROVIDED?

Cheers,

Richard



