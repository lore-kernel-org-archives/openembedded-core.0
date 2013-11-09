Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 17DD46B1A9
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2013 22:58:35 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA9MwOTu000712; Sat, 9 Nov 2013 22:58:24 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id o-ugBBv5h0m1; Sat,  9 Nov 2013 22:58:24 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA9MwKUe000708
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sat, 9 Nov 2013 22:58:22 GMT
Message-ID: <1384037896.22454.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Sat, 09 Nov 2013 22:58:16 +0000
In-Reply-To: <CAAQYJAv9BxmjsskLP+-26b=HkRWpLYxzsmzQVyo-norREhSUOA@mail.gmail.com>
References: <1383923880.2345.4.camel@ted> <527D0624.3060407@windriver.com>
	<1383926139.2345.7.camel@ted> <527D0A44.7020005@windriver.com>
	<1383929419.2345.11.camel@ted>
	<1383931424.5378.131.camel@dvhart-mobl4.amr.corp.intel.com>
	<CAAQYJAv9BxmjsskLP+-26b=HkRWpLYxzsmzQVyo-norREhSUOA@mail.gmail.com>
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
X-List-Received-Date: Sat, 09 Nov 2013 22:58:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-11-09 at 21:38 +0100, Andrea Adami wrote:
> On Fri, Nov 8, 2013 at 6:23 PM, Hart, Darren <darren.hart@intel.com> wrote:
> > On Fri, 2013-11-08 at 16:50 +0000, Richard Purdie wrote:
> >> On Fri, 2013-11-08 at 10:59 -0500, Bruce Ashfield wrote:
> >> > On 13-11-08 10:55 AM, Richard Purdie wrote:
> >> > > On Fri, 2013-11-08 at 10:41 -0500, Bruce Ashfield wrote:
> >> > >> On 13-11-08 10:18 AM, Richard Purdie wrote:
> >> > >>> The kernel tree is large and doesn't need to be copied. Override
> >> > >>> the default sysroot handling function to use a hardlink copying
> >> > >>> function in python.
> >> > >>>
> >> > >>> This commit also drops the copying of the /lib directory which
> >> > >>> just contains the kernel modules. We never use those in the sysroot
> >> > >>> so there is little point in carrying those around.
> >> > >>>
> >> > >>> For linux-yocto this takes the do_populate_sysroot time 24s -> 14s.
> >> > >>
> >> > >> Fantastic. One less thing for me to dig into later. I thought this
> >> > >> was already in place, so I'm pleasantly surprised that there was a
> >> > >> time savings to be found!
> >> > >
> >> > > I was somewhat surprised too.
> >> > >
> >> > > We still need to optimise what we install in do_install since that is
> >> > > where significant gains can still be made.
> >> >
> >> > Agreed. I started some changes in that area right after ELC-e, I'll
> >> > try and get them out sooner rather than later.
> >>
> >> I thought I'd share this for people's interest:
> >>
> >> http://dan.rpsys.net/kernelbuildissue.png
> >>
> >> Its the output from pybootchart of a bitbake core-image-sato from
> >> scratch. I've zoomed out to put some bars in particular into
> >> perspective.
> >>
> >> The pink colour is linux-yocto:do_install, the cyan is
> >> linux-yocto:do_package and the blue is linux-yocto:do_populate_sysroot.
> >> The uncoloured bar at the bottom is linux-yocto:do_package_write_rpm.
> >>
> >> So the final thing to build is the kernel by quite some margin, its
> >> holding the rest of the build up.
> >>
> >> Hopefully these patches start to improve that a bit!
> >>
> >
> > Yup, linux-yocto do_package is the biggest build-time hindrance for me
> > and something we've wanted to look into for a long time. Great to see
> > some progress.
> >
> > --
> > Darren Hart
> > Intel Open Source Technology Center
> > Yocto Project - Linux Kernel
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> On my old quad core:
> 
> Before: 95.24 seconds
> After: 83.25 seconds

We have some "standard" tests we use for comparison purposes as detailed
on:

https://wiki.yoctoproject.org/wiki/Performance_Test

Some numbers from master and a test branch containing the recent
speedups:

fedora19,master:d6cc7c8ed76c8b1117cf03c7bd4b0742f98f79b3,poky-10.0.0.final-359-gd6cc7c8,1:22:37,12:05.50,1:17:53,4:02.68,0:31.71,0:15.70,0:01.61,26347744,5035816
fedora19,master:d6cc7c8ed76c8b1117cf03c7bd4b0742f98f79b3,poky-10.0.0.final-359-gd6cc7c8,1:22:59,12:09.26,1:17:29,4:06.75,0:31.82,0:15.69,0:01.70,26348556,5035876
fedora19,master:d6cc7c8ed76c8b1117cf03c7bd4b0742f98f79b3,poky-10.0.0.final-359-gd6cc7c8,1:22:21,12:07.23,1:18:21,4:07.44,0:31.79,0:15.63,0:01.62,26351088,5035908
fedora19,master:d6cc7c8ed76c8b1117cf03c7bd4b0742f98f79b3,poky-10.0.0.final-359-gd6cc7c8,1:23:16,12:15.33,1:18:00,4:02.50,0:31.87,0:15.74,0:01.63,26348132,5035848
fedora19,rpurdie/timing:9d8c0ef3349936b3bd0bbf485b50cf81f4feaf80,poky-10.0.0.final-373-g9d8c0ef,1:19:42,10:28.53,1:15:30,4:12.24,0:31.30,0:15.69,0:01.66,26137344,5055628
fedora19,rpurdie/timing2:eb2221d6247c12322ac38b9ac6f24c9de5877e53,poky-10.0.0.final-401-geb2221d,1:18:51,10:44.26,1:16:32,4:13.47,0:31.27,0:15.69,0:01.65,26137828,5055916

So we have 1:23m -> 1:19m for overall buildtime and 12.0m -> 10.5m for
"bitbake virtual/kernel" from cleansstate. Not too bad :)

Thanks to Stefan for running the tests!

Cheers,

Richard


