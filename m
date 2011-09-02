Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QzUQS-0008Px-1F for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 16:08:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p82E41F5026320
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Sep 2011 15:04:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25671-06 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2011 15:03:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p82E3oaS026314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Sep 2011 15:03:53 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1314957057.19905.224.camel@phil-desktop>
References: <cover.1306865217.git.scott.a.garman@intel.com>
	<7826575ce92090c4460c7d016e0b06441f84cff7.1306865217.git.scott.a.garman@intel.com>
	<1314895291.19905.197.camel@phil-desktop>
	<4E5FB8AC.1070007@windriver.com>
	<1314896288.19905.199.camel@phil-desktop>
	<4E5FBFEC.3060406@windriver.com>
	<1314906289.2958.7.camel@lenovo.internal.reciva.com>
	<1314914360.5939.574.camel@rex>
	<1314957057.19905.224.camel@phil-desktop>
Date: Fri, 02 Sep 2011 15:03:31 +0100
Message-ID: <1314972211.5939.604.camel@rex>
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
X-List-Received-Date: Fri, 02 Sep 2011 14:08:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-02 at 10:50 +0100, Phil Blundell wrote:
> On Thu, 2011-09-01 at 22:59 +0100, Richard Purdie wrote:
> > The latter sounds like what we'll need to do. I haven't looked at shadow
> > to see what kind of finessing is required though...
> 
> Fixing the immediate problem with shadow turned out to be rather
> straightforward, see attached.  However, with this done, I now encounter
> two new issues.
> 
> 1. the logic around $D in useradd.bbclass seems to be backwards to me
> (and, empirically, isn't working because the supposedly-created users
> are not showing up in my rootfs).  Specifically, it does:
> 
>         useradd_preinst () {
>         OPT=""
>         SYSROOT=""
>         
>         if test "x$D" != "x"; then
>         	# Installing into a sysroot
>         	SYSROOT="${STAGING_DIR_TARGET}"
>         	OPT="--root ${STAGING_DIR_TARGET}"
>         
>         [...]
>         
>         useradd_sysroot () {
>         	export PSEUDO="${STAGING_DIR_NATIVE}/usr/bin/pseudo"
>         	export PSEUDO_LOCALSTATEDIR="${STAGING_DIR_TARGET}/var/pseudo"
>         
>         	# Explicitly set $D since it isn't set to anything
>         	# before do_install
>         	D=${D}
>         	useradd_preinst
>         }
> 
> It looks to me as though the code in useradd_preinst() should be using
> SYSROOT="$D" (and likewise for OPT), and useradd_sysroot() should be
> setting D=${STAGING_DIR_TARGET}.  But maybe there is some clever thing
> going on here that I'm not properly understanding.

It looks like the useradd_sysroot code will work since D is set to
'something' and then is set correctly in the preinst. What won't work
correctly is the rootfs user creation as you point out.

So I'd agree with your change.

> 2. during rootfs construction, the script ordering is wrong.  All the
> preinsts run before all the postinsts, which has always been a bit wrong
> but hasn't caused too much of a problem in the past.  However,
> crucially, this means that the useradd_preinst() runs before
> base-passwd's postinst and hence /etc/passwd doesn't exist at the point
> where useradd tries to modify it.
> 
> I can't think of any reasonable fix for (2) other than to teach
> rootfs_ipk how to track package dependencies and run the scripts in the
> right order.  I guess that wouldn't be impossible by any means but
> trying to do it in a shell script is not a prospect that fills me with a
> lot of enthusiasm.  Any better suggestions?

Write it in python? ;-)

Seriously, does opkg have the logic in it to run this stuff? If so
perhaps we need to teach opkg about offline postinstalls since it should
already know about dependencies?

Cheers,

Richard




