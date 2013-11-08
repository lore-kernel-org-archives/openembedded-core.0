Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 626B16A467
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 16:50:38 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA8GoRIj028882; Fri, 8 Nov 2013 16:50:27 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zcnBeJ3GL3OW; Fri,  8 Nov 2013 16:50:26 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA8GoN3k028879
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 8 Nov 2013 16:50:24 GMT
Message-ID: <1383929419.2345.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Fri, 08 Nov 2013 16:50:19 +0000
In-Reply-To: <527D0A44.7020005@windriver.com>
References: <1383923880.2345.4.camel@ted> <527D0624.3060407@windriver.com>
	<1383926139.2345.7.camel@ted> <527D0A44.7020005@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Use hardlinks for do_populate_sysroot for speed
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
X-List-Received-Date: Fri, 08 Nov 2013 16:50:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-11-08 at 10:59 -0500, Bruce Ashfield wrote:
> On 13-11-08 10:55 AM, Richard Purdie wrote:
> > On Fri, 2013-11-08 at 10:41 -0500, Bruce Ashfield wrote:
> >> On 13-11-08 10:18 AM, Richard Purdie wrote:
> >>> The kernel tree is large and doesn't need to be copied. Override
> >>> the default sysroot handling function to use a hardlink copying
> >>> function in python.
> >>>
> >>> This commit also drops the copying of the /lib directory which
> >>> just contains the kernel modules. We never use those in the sysroot
> >>> so there is little point in carrying those around.
> >>>
> >>> For linux-yocto this takes the do_populate_sysroot time 24s -> 14s.
> >>
> >> Fantastic. One less thing for me to dig into later. I thought this
> >> was already in place, so I'm pleasantly surprised that there was a
> >> time savings to be found!
> >
> > I was somewhat surprised too.
> >
> > We still need to optimise what we install in do_install since that is
> > where significant gains can still be made.
> 
> Agreed. I started some changes in that area right after ELC-e, I'll
> try and get them out sooner rather than later.

I thought I'd share this for people's interest:

http://dan.rpsys.net/kernelbuildissue.png

Its the output from pybootchart of a bitbake core-image-sato from
scratch. I've zoomed out to put some bars in particular into
perspective.

The pink colour is linux-yocto:do_install, the cyan is
linux-yocto:do_package and the blue is linux-yocto:do_populate_sysroot.
The uncoloured bar at the bottom is linux-yocto:do_package_write_rpm.

So the final thing to build is the kernel by quite some margin, its
holding the rest of the build up.

Hopefully these patches start to improve that a bit!

Cheers,

Richard


