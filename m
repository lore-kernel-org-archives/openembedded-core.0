Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E97C471ACF;
	Fri, 18 Nov 2016 18:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uAII67j3011784; Fri, 18 Nov 2016 18:06:07 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mKkXEJNEmhmc; Fri, 18 Nov 2016 18:06:07 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uAII652T011780
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 18 Nov 2016 18:06:07 GMT
Message-ID: <1479492365.28508.113.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, "Burton, Ross" <ross.burton@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Date: Fri, 18 Nov 2016 18:06:05 +0000
In-Reply-To: <70e3fff2-d9a5-37c3-5e14-5dbcc4e4d37b@gmail.com>
References: <CAJTo0LbvGwRpzxfOL0505w+Vz=Jhf6O3QOr5Z8SX9XaFqaZ7eg@mail.gmail.com>
	<70e3fff2-d9a5-37c3-5e14-5dbcc4e4d37b@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: [Openembedded-architecture] Enabling uninative by default in oe-core?
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
X-List-Received-Date: Fri, 18 Nov 2016 18:06:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-11-18 at 08:28 -0800, akuster808 wrote:
> On 11/17/2016 09:31 AM, Burton, Ross wrote:
> > Background: uninative is a class that downloads a precompiled host
> > glibc for use in the sysroot, thus isolating the native sysroot
> > from the host environment.  This means greater sstate reuse, as
> > instead of native builds being dependent on the host system they're
> > able to be shared between all hosts.  There is a reference tarball
> > hosted on www.yoctoproject.org, and the URL can be overridden by
> > distros if you would prefer to build your own.
> > 
> > We enable this in Poky so that we get greater reuse on the
> > autobuilders, and due to some issues with the C++ ABI the eSDK
> > generation in master now requires uninative to be enabled.  The
> > question is: do we now enable uninative by default in oe-core's
> > nodistro (pointing at the yoctoproject tarball), or do we keep it
> > disabled by default and require the user to enable uninative if
> > they wish to build an eSDK?
>  
> If Poky wants the default to use a prebuilt uninative that is fine,
> but it should be not be the default in OE.  In the spirit of Bitbake,
> uninative should be a build dependency for eSDK with the option of
> using a prebuilt one.

Its not that simple. Using uninative requires certain options passed in
when compiling native recipes for example, e.g. to pick particular C++
abis. If you start the build without those set (since uninative is
disabled), you can't get native sstate built in the right way for it to
work with eSDK. We could of course add a new BBCLASSEXTEND, "native2"
which is native specially for use in the eSDK but that seems silly.

I guess we could move the configuration uninative requires into global
bitbake.conf but not require the actual binary shim to be enabled. That
would let eSDK work in OE-Core just not make OE-Core require uninative.
It would mean the compiler options for native would be a little
different. That might be an acceptable compromise?

> > Though enabling uninative globally does mean everything works out
> > of the box, so following the principle of Least Surprise that's
> > what we should do.
>  
> I see there are multiple versions, which one works with which
> release?

The one configured in meta/conf/distro/include/yocto-uninative.inc.
By putting a standard include there its easy for anyone to opt into
this should they wish to.

Cheers,

Richard

