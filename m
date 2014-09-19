Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 299EA6FD28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 07:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8J7PBPP019848; Fri, 19 Sep 2014 08:25:11 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Lp4T8d1O28Bc; Fri, 19 Sep 2014 08:25:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8J7P9Hj019845
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 19 Sep 2014 08:25:11 +0100
Message-ID: <1411111512.4736.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marek Vasut <marex@denx.de>
Date: Fri, 19 Sep 2014 08:25:12 +0100
In-Reply-To: <201409190914.03281.marex@denx.de>
References: <1407438629-13369-1-git-send-email-marex@denx.de>
	<CAOMwXhOa6rNukzGaCWFgipzvUFczjjcsbgzwOMqJcWwmS3oPiQ@mail.gmail.com>
	<1411047400.4736.3.camel@ted> <201409190914.03281.marex@denx.de>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Yocto: Install full set of python modules in Qt SDK toolchain
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
X-List-Received-Date: Fri, 19 Sep 2014 07:25:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-09-19 at 09:14 +0200, Marek Vasut wrote:
> On Thursday, September 18, 2014 at 03:36:40 PM, Richard Purdie wrote:
> > On Thu, 2014-09-18 at 11:29 +0100, Laszlo Papp wrote:
> > > On Thu, Sep 18, 2014 at 10:30 AM, Marek Vasut <marex@denx.de> wrote:
> > > > On Thursday, September 18, 2014 at 11:23:13 AM, Laszlo Papp wrote:
> > > >> On Thu, Sep 18, 2014 at 10:16 AM, Marek Vasut <marex@denx.de> wrote:
> > > >> > On Thursday, September 18, 2014 at 11:11:45 AM, Laszlo Papp wrote:
> > > >> >> Come on, Yocto maintainers, please...
> > > >> >> 
> > > >> >> Mark sent this change relatively long ago, and it is still in "new"
> > > >> >> state, sadly. The current SDK shipped _breaks_ any third-party
> > > >> >> software that uses standard python with regards to the libraries
> > > >> >> and all that.
> > > >> >> 
> > > >> >> This is is slightly frustrating. We also face the same issue. :(
> > > >> > 
> > > >> > Thanks for the reminder, new version which should fix the issues
> > > >> > with the previous one is on the ML now. You're all on CC.
> > > >> 
> > > >> I do not think this is an explicit Qt issue, and hence fixing on that
> > > >> layer sounds like a weird approach. It seems to be a generic python
> > > >> issue and so, I think it should be addressed in its core. I opened a
> > > >> new report for this:
> > > >> 
> > > >> https://bugzilla.yoctoproject.org/show_bug.cgi?id=6735
> > > > 
> > > > Then you probably want to add nativesdk-packagegroup-python class into
> > > > the other toolchain recipes as well . Or even better, into the base
> > > > SDK toolchain class (is there one?)
> > > 
> > > See, I do not understand why this "feature" was integrated the way it
> > > was. IMHO, it lacks any kind of reality. Has the SDK been ever tested
> > > against python based host development systems? My assumption is no. I
> > > do not think there is any sanity in using a _that_ stripped down
> > > version of python on desktop. It just really hurts the python users
> > > for the SDK, since there is no simple workaround and we cannot get the
> > > SDK to let the system python take precedence. This situation is awful
> > > in my opinion. Who is up for fixing this in the core? Let us have a
> > > _standard_ python shipped with the SDK by default or do not ship any
> > > at all.
> > 
> > If you install nativesdk-python-modules into your SDK, you will get
> > python *and* all its modules installed. If you just install the python
> > core, you get a cut down python and need to install the modules you
> > need.
> > 
> > The python SDK has been tested and used in a number of scenarios. Where
> > a full set of modules is needed, nativesdk-python-modules gets installed
> > and everyone is happy. If there is some problem with
> > nativesdk-python-modules, please let us know.
> 
> git grep nativesdk-python-modules doesn't show any matches in 
> git://git.yoctoproject.org/poky master . Do you mean the nativesdk-packagegroup-
> python I crafted or do you refer to something else please ?
> 
> Also, shouldn't full python be installed into all the SDK toolchains ? I am for 
> example unable to compile U-Boot 2014.10rc with the Yocto SDK toolchain anymore. 
> The SDK is missing python modules and I cannot easily override the usage of 
> python from the SDK . So I agree with Laszlo here, the SDK toolchain is somewhat 
> unusable as it is.

I refer to the package I mentioned:

$ ls -la tmp/deploy/ipk/x86_64-nativesdk/nativesdk-python-modules*
-rw-r--r-- 2 richard richard 1512 Sep 18 17:09 tmp/deploy/ipk/x86_64-nativesdk/nativesdk-python-modules_2.7.3-r0.3.24_x86_64-nativesdk.ipk

See ${PN}-modules defined in python-2.7-manifest.inc.

I agreed there is a problem, I disagree somewhat about how it should be
fixed since you're just installing a set of modules which is defined as
those needed to run bitbake and I don't think this is what you actually
want. There is also the question of whether nativesdk-python should even
be in there...

Cheers,

Richard









