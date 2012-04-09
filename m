Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SHMWn-0000j6-ME
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 23:53:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q39LiJsV017808
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Apr 2012 14:44:19 -0700 (PDT)
Received: from msp-dhcp17.wrs.com (172.25.34.17) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 9 Apr 2012 14:44:19 -0700
Message-ID: <4F835832.8070905@windriver.com>
Date: Mon, 9 Apr 2012 16:44:18 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1333481624.git.mark.hatle@windriver.com>
	<c1765e7544603baa60bec27185a947aeee404bee.1333481624.git.mark.hatle@windriver.com>
	<4F7CC6E6.6020006@opendreambox.org>
	<CAMKF1soi+==bbEKMD+FLdk+8BvWNK3Nj24EJVhoyT5e=_5MvDw@mail.gmail.com>
	<4F7F28FB.20600@windriver.com>
	<CAMKF1srkXSBHFtO__F9m9TQ=dJzfn+7kfmXoK4=tWknEdc80eg@mail.gmail.com>
	<4F7F85DC.2000301@windriver.com>
	<4F820472.1080109@opendreambox.org>
	<4F82FD70.9080609@windriver.com>
	<4F83413F.7010608@opendreambox.org>
	<4F8345BD.6090500@windriver.com>
	<1334005382.3382.10.camel@x121e.pbcl.net>
	<4F8352CD.7070500@windriver.com>
	<1334007051.3382.19.camel@x121e.pbcl.net>
In-Reply-To: <1334007051.3382.19.camel@x121e.pbcl.net>
Subject: Re: ARM tunings was Re: [PATCH 3/7] conf/machine/include: Cleanup MIPS tunings to match README
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
X-List-Received-Date: Mon, 09 Apr 2012 21:53:38 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/12 4:30 PM, Phil Blundell wrote:
> On Mon, 2012-04-09 at 16:21 -0500, Mark Hatle wrote:
>> I do, and thus the hell that is ARM.  I could not currently generate a single
>> package feed that work would on a variety of devices (like a traditional
>> workstaton/server Linux OS would.)
>
> Well, actually, you could in fact do exactly that.  What you couldn't
> necessarily do with the tunings as they exist right now is generate a
> package feed which is optimised for (as opposed to "works on") all those
> devices.  But it isn't clear to me that you could do that with a
> "traditional workstaton/server" kind of distribution either.  In the x86
> world, for example, the majority of the big distros do not bother to
> ship individually-tuned binaries for different processor types,
> certainly not for the entire distribution.

Depends on the distribution and reasons for these feeds.  What is typical is 
that a base distribution will be generated for a common compatible (reasonable) 
architecture.. i.e. armv5 -- with specific optimized package (glibc, openssl, 
etc) for the target arch, i.e. armv7a.  Then you have a couple of packages 
hand-tuned for size, speed, or other that define or not thumb and add even a 
higher level of optimization.  It's possible, folks do it today.. but it's not 
always obvious.  (I have existing customers today that run a mix like I 
described through their own package feed like system.  They really don't care at 
all that the core system is tuned for a given processor -- they only care that 
their specific applications and certain areas are specifically tuned to their 
use-cases.)  Note, this is not what I would consider a typical use-case!

>> Add in to that one of the tunings -- not indicated by the package arch
>> of thumb enabled or not
>
> There are multiple reasons why this isn't indicated by the PACKAGE_ARCH.
> Firstly, it's irrelevant: on v5T or newer, the question of whether a
> given package is using Thumb-state or not has no ABI impact and there is
> no reason for anyone to care at a compatibility level.  Second, it may
> be unpredictable: the compiler is at liberty (although current versions
> of gcc don't exploit this latitude) to switch arbitrarily between
> ARM-state and Thumb-state as it sees fit to get the best performance.
> And thirdly, it's just another piece of distro policy in the same way as
> compiling for -O2 vs -Os (which we also don't encode into PACKAGE_ARCH)
> is.

I agree, on ARM the tunings and optimizations between regular and thumb do not 
impact the ABI what-so-ever.  And so far compilers have to be explicitly set to 
do thumb or tranditional ARM mode.. so in the end developers are looking into 
the performance and size impacts of each of these configuration and making 
changes as they see fit to best meet their needs.  These are unique cases 
though, the majority of the software built for the core OS uses a single policy 
-- it's when something needs to be further optimized that this comes into play.

At this point, I'd "like" to better differentiate the ARM package arches..  I 
don't care so much about the thumb enabled or not.. but the other tune settings 
are things I do care about.  I started to change that for the last update and 
decided it was a rat-hole I was not willing to go down at this point.  At some 
point in the future, I will look at, and document the differences in the tunings 
according to GCC configurations -- to get a good idea of what is and isn't 
producing the same binaries based on various arch and tune settings.

--Mark

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



