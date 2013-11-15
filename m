Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id B9C696DA67
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 12:19:02 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAFCIwB6009530; Fri, 15 Nov 2013 12:18:58 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NPVZyS_GsfKZ; Fri, 15 Nov 2013 12:18:58 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAFCIs2X009526
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 15 Nov 2013 12:18:55 GMT
Message-ID: <1384517930.6460.151.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 15 Nov 2013 12:18:50 +0000
In-Reply-To: <52859586.5040001@windriver.com>
References: <52859586.5040001@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] let PACKAGES_DYNAMIC be optional ?
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
X-List-Received-Date: Fri, 15 Nov 2013 12:19:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-11-15 at 11:31 +0800, Robert Yang wrote:
> Currently, the recipe which uses PACKAGES_DYNAMIC usually generates
> a lot of packages which costs a lot of time on building the recipe
> and do_rootfs, for example, the perl and kernel:
> 
> $ ls tmp/deploy/rpm/armv5te/perl-module-* | wc -l
> 621
> 
> $ ls tmp/deploy/rpm/qemux86/kernel-module-* | wc -l
> 268
> 
> Also, the eglibc-locale generates more than 300 packages.
> 
> Take perl as an example:
> 
> 1) We generate 621 perl-module-* packages, but the package *perl-modules*
>     requires all of them, so once *perl-modules* is installed, all the other
>     perl-module-* will be installed and we can't remove any of them since
>     perl-modules rdepends on it, if there is a way to package all of these
>     perl-module-* into one package (they are about 10MB), it would save a lot
>     of time on do_package* and do_rootfs.
> 
> 2) The nativesdk.bbclass can't support PACKAGES_DYNAMIC, for example, it can't
>     change the perl-module-app-cpan to nativesdk-perl-module-app-cpan since
>     there is no perl-module-app-cpan in PACKAGES when nativesdk.bbclass
>     changes the variable's name.
> 
> Can we add a way to let the PACKAGES_DYNAMIC be optional ? for example,
> 
> PACKAGES_DYNAMIC[perl] = "0"
> 
> will disable the perl's PACKAGES_DYNAMIC, and will pack the files as other
> recipes do, and of course we need to do some work on the recipe.

Before we consider doing this, I'd actually like to see real numbers
about how big this problem is.

Why? Speaking as someone who has looked specifically at perl and the
kernel, I don't believe there is a huge amount of time spent dealing
with the individual packages and that maintaining two build paths is
actually worse than they minimal performance impact this has.

In particular, I'd note that the locale generation happens in parallel
with other parts of the build and is not a significant factor in overall
build times.

The time would be better spent reducing the size of the kernel source
installed into the sysroot for example (Bruce is planning action on
this).

Cheers,

Richard


