Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SHMAW-0000I8-Ia
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 23:30:36 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q39LLJ8a015060
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Apr 2012 14:21:19 -0700 (PDT)
Received: from msp-dhcp17.wrs.com (172.25.34.17) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 9 Apr 2012 14:21:18 -0700
Message-ID: <4F8352CD.7070500@windriver.com>
Date: Mon, 9 Apr 2012 16:21:17 -0500
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
In-Reply-To: <1334005382.3382.10.camel@x121e.pbcl.net>
Subject: ARM tunings was Re: [PATCH 3/7] conf/machine/include: Cleanup MIPS tunings to match README
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
X-List-Received-Date: Mon, 09 Apr 2012 21:30:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/12 4:03 PM, Phil Blundell wrote:
> On Mon, 2012-04-09 at 15:25 -0500, Mark Hatle wrote:
>> And just to be extra clear, I consider it a defect if we can produce a package
>> with the same name for two different tune settings.. (the exception being the
>> hell that is ARM and thumb namings.)
>
> While you might consider that a defect (and it probably is a defensible
> position to do so), it hasn't historically been considered such in OE.
> The PACKAGE_ARCH value has, traditionally, been concerned purely with
> ISA and ABI (i.e. answering the question "can I execute this code?")
> rather than optimisations.
>
> For example, the tune-arm926ejs.inc and tune-xscale.inc files in current
> oe-core both end up setting PACKAGE_ARCH to "armv5tte" (sic).  But those
> are quite different processors and have different tuning requirements,
> so the binaries you get are unlikely to be the same.  If you were to
> take the view that the PACKAGE_ARCH must uniquely identify one set of
> binaries then obviously each of these tunings (and probably all the ARM
> cpu-specific tunings) would need to set PACKAGE_ARCH to some unique
> value.

I do, and thus the hell that is ARM.  I could not currently generate a single 
package feed that work would on a variety of devices (like a traditional 
workstaton/server Linux OS would.)  While this isn't a big issue in the embedded 
space where we should hopefully be aware of the tunings and configuration were 
are using, it is still a problem.  As the systems get larger, the requirement 
for common pages feeds increases, leading to the problem being, well a problem. 
  (ARM is starting to be considered for Carrier Grade systems, many of which 
have very common requirements to traditional server Linux.  A set of established 
binaries and the vendors just want to drop in optimized applications.)

On ARM what we currently have defined is:
(tune) - (package arch)

arm1136jfs - armv6-vfp
arm920t - armv4t
arm926ejs - armv5te
arm9tdmi - armv4t
armv4b - armv4b
armv4tb - armv4tb
armv4 - armv4
armv4t - armv4t
armv5b - armv5b
armv5b-vfp - armv5b-vfp
armv5eb - armv5eb
armv5eb-vfp - armv5eb-vfp
armv5ehfb-vfp - armv5ehfb-vfp
armv5ehf-vfp - armv5ehf-vfp
armv5e-vfp - armv5e-vfp
armv5hfb-vfp - armv5hfb-vfp
armv5hf-vfp - armv5hf-vfp
armv5tb - armv5tb
armv5tb-vfp - armv5b-vfp
armv5teb - armv5teb
armv5teb-vfp - armv5teb-vfp
armv5tehfb-vfp - armv5tehfb-vfp
armv5tehf-vfp - armv5tehf-vfp
armv5te - armv5te
armv5te-vfp - armv5te-vfp
armv5thfb-vfp - armv5hfb-vfp
armv5thf-vfp - armv5hf-vfp
armv5 - armv5
armv5t - armv5t
armv5t-vfp - armv5-vfp
armv5-vfp - armv5-vfp
armv6b - armv6b-vfp
armv6hfb - armv6hfb-vfp
armv6hf - armv6hf-vfp
armv6tb - armv6tb-vfp
armv6thfb - armv6thfb-vfp
armv6thf - armv6thf-vfp
armv6 - armv6-vfp
armv6t - armv6t-vfp
armv7ab-neon - armv7ab-vfp-neon
armv7ab - armv7ab-vfp
armv7ahfb-neon - armv7ahfb-vfp-neon
armv7ahfb - armv7ahfb-vfp
armv7ahf-neon - armv7ahf-vfp-neon
armv7ahf - armv7ahf-vfp
armv7a-neon - armv7a-vfp-neon
armv7atb-neon - armv7ab-vfp-neon
armv7atb - armv7ab-vfp
armv7athfb - armv7ahfb-vfp
armv7athf-neon - armv7ahf-vfp-neon
armv7athf - armv7ahf-vfp
armv7a - armv7a-vfp
armv7at-neon - armv7a-vfp-neon
armv7at - armv7a-vfp
cortexa8hf-neon - armv7ahf-vfp-neon
cortexa8hf - armv7ahf-vfp
cortexa8-neon - armv7a-vfp-neon
cortexa8thf - armv7ahf-vfp
cortexa8 - armv7a-vfp
cortexa8t - armv7a-vfp
cortexa9hf-neon - armv7ahf-vfp-neon
cortexa9hf - armv7ahf-vfp
cortexa9-neon - armv7a-vfp-neon
cortexa9thf - armv7ahf-vfp
cortexa9 - armv7a-vfp
cortexa9t - armv7a-vfp
cortexm1 - armv7a-vfp
cortexm3 - armv7m-vfp
cortexr4 - armv7r-vfp
ep9312 - ep9312
iwmmxt - iwmmxt
strongarm - armv4

Add in to that one of the tunings -- not indicated by the package arch of thumb 
enabled or not, and its difficult to know exactly what is in a package without 
extracting and examining it.  But I consider this to be a quirk of the ARM 
architecture as implemented in OE.

--Mark

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



