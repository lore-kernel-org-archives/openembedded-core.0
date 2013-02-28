Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UBDcX-00044S-DY for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 01:14:41 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r21041it004028; Fri, 1 Mar 2013 00:05:36 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eJSMpKHc6E68; Fri,  1 Mar 2013 00:05:35 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2105VVr004051
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 1 Mar 2013 00:05:33 GMT
Message-ID: <1362095877.1055.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Feb 2013 23:57:57 +0000
In-Reply-To: <CAMKF1spTzzKjh+6+z2vEjXApLVFPU8MS0NrXVxa9UA=viOj8mQ@mail.gmail.com>
References: <cover.1362033854.git.hongxu.jia@windriver.com>
	<CAJTo0LaFN=Q7kJQoJGTqrZamC=OT_pRD9qYrsO2854TWcG9Q0w@mail.gmail.com>
	<CAMKF1spTzzKjh+6+z2vEjXApLVFPU8MS0NrXVxa9UA=viOj8mQ@mail.gmail.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 0/2]fix native package compile error with gcc 4.3.4 on x86 host
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
X-List-Received-Date: Fri, 01 Mar 2013 00:14:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-02-28 at 07:49 -0800, Khem Raj wrote:
> On Thu, Feb 28, 2013 at 3:06 AM, Burton, Ross <ross.burton@intel.com> wrote:
> > On 28 February 2013 07:09, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> >> Change from V2: as Khem Raj suggested, use `-march=native' to cause the
> >> compiler to auto-detect the architecture of the build computer, if the
> >> auto-detect is unsuccessful the option has no effect.
> >
> > What happens if you're in an environment where you're sharing sstate
> > between multiple developers, and the build machine is an i7 but
> > another developer's machine is a Core2?    These machines have
> > different sets of extensions available
> 
> yes I thought about it later on. adding march=i686 when host is 32bit
> and march=x86-64 which build host is 64bit in bitbake.conf is probably
> one way but I feel its overkill to please an old compiler and for one recipe
> so may be you should try to deduce the version of gcc. i think best is to
> fix the autoconf on glib-2.0 where you would add a test to find the version
> of compiler and inject the needed option to flags
> 
> 
> >
> > Using the architecture as determined by bitbake seems like a better
> > idea (which was V1, right?) as that's embedded in the sstate hash.

How about we patch sanity.bbclass to test the gcc version and if its
4.3.4 and march isn't in BUILD_CFLAGS, we ask the user to add:

BUILD_CFLAGS_append = " -march=native"

to their local.conf, mentioning this is to fix an issue with older gccs?

Cheers,

Richard




