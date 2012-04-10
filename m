Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SHfBF-0001DX-Ri
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 19:48:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3AHdI9e026631
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 10:39:18 -0700 (PDT)
Received: from msp-dhcp19.wrs.com (172.25.34.19) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 10 Apr 2012 10:39:17 -0700
Message-ID: <4F847045.2030203@windriver.com>
Date: Tue, 10 Apr 2012 12:39:17 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
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
	<4F835832.8070905@windriver.com>
	<1334049817.28712.96.camel@phil-desktop>
In-Reply-To: <1334049817.28712.96.camel@phil-desktop>
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
X-List-Received-Date: Tue, 10 Apr 2012 17:48:38 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/10/12 4:23 AM, Phil Blundell wrote:
> On Mon, 2012-04-09 at 16:44 -0500, Mark Hatle wrote:
>> Depends on the distribution and reasons for these feeds.  What is typical is
>> that a base distribution will be generated for a common compatible (reasonable)
>> architecture.. i.e. armv5 -- with specific optimized package (glibc, openssl,
>> etc) for the target arch, i.e. armv7a.  Then you have a couple of packages
>> hand-tuned for size, speed, or other that define or not thumb and add even a
>> higher level of optimization.  It's possible, folks do it today.. but it's not
>> always obvious.  (I have existing customers today that run a mix like I
>> described through their own package feed like system.  They really don't care at
>> all that the core system is tuned for a given processor -- they only care that
>> their specific applications and certain areas are specifically tuned to their
>> use-cases.)  Note, this is not what I would consider a typical use-case!

> Sorry, I'm not quite sure I understand what point you're trying to make
> here.  Are you describing what your customers are currently doing with
> OE, or are you saying that this is something that they would like to do
> with OE but don't feel they are able to at present, or something else?


The company I work for has an existing product that does not use OE.  The 
customers using this have requested from us packages tagged with different 
package architectures to indicate the tuning and optimization information so 
that they can create multiple boards with the same software running on them. 
(This is closer to the traditional workstation/server model in my experience.) 
The multiple boards have a common set of OS applications that run on them. 
ARMv5 for the most part.  The customers then have optimized applications with or 
without thumb, and optimized for a variety of different ARM parts.  They then 
use the binary packages to assemble the filesystems, and perform field upgrades, 
on these boards as they are put into use.  The installation system uses a best 
to least best match when doing assembly actions.  So if the part is an ARMv7a, 
it will first look for ARMv7a w/ thumb, vfp and neon, not finding that, ARMv7a 
w/ thumb and vfp, then ARMv7a w/ thumb, then ARMv5 w/ thumb and vfp, then ARMv5 
w/ thumb, and finally fall back to the ARMv5 binaries.

> I'm still not entirely clear on what you feel is broken about the
> current state of the ARM tunings.  What exactly is the scenario that
> works with the "traditional workstaton/server Linux OS" and can't be
> replicated with OE?

With the current implementation, there is no package differentiation between 
thumb and non-thumb binaries.  I accept why this is in OE-core and I can live 
with that.  However, there are other binaries that are theoretically optimized 
from specific Cortex models to the more generic ARMv7a tunings.  Currently they 
all use the same package arch, which means I can't tell which CPU they're really 
for -- and this model (above) of best to least best match doesn't work.

On a pure embedded model, I doubt anyone would do this.  Thus it is a fairly 
unique embedded use-case, but a common Workstation/Server use case that is being 
replicated.

> But, all that aside, it seems ultimately that the exact way the
> PACKAGE_ARCHs are structured ought to be a DISTRO policy decision and
> not something that's mandated by the underlying infrastructure.  That
> would perhaps remove some of the need for tinkering with these things in
> oe-core itself.

I intend, after this release, to propose changes to differentiate the models in 
oe-core.  If the oe-core folks do not feel this is necessary, they I will 
maintain them on my own as I feel necessary to cover the above use-case.

I can very much understand that in OE, for ARM specifically the package arch is 
simply indicating basic compatibility and not ABI & ISA & Optimization like it 
is on other architectures.

--Mark

> p.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



