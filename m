Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 79DCC6D08D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 13:13:10 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s08DCoc6010294; Wed, 8 Jan 2014 13:12:50 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LY1Yrnu8V0jL; Wed,  8 Jan 2014 13:12:50 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s08DCk52010290
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 8 Jan 2014 13:12:47 GMT
Message-ID: <1389186761.6899.99.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sipke Vriend <sipke.vriend@xilinx.com>, "Stanacar, StefanX"
	<stefanx.stanacar@intel.com>
Date: Wed, 08 Jan 2014 13:12:41 +0000
In-Reply-To: <00beaba3-2d15-4d36-936c-88fd8734ed8a@CO1EHSMHS012.ehs.local>
References: <9bd39deb-0a32-437a-9f50-89abfe43d7d6@CO1EHSMHS004.ehs.local>
	<1389103177.6899.28.camel@ted>
	<00beaba3-2d15-4d36-936c-88fd8734ed8a@CO1EHSMHS012.ehs.local>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC OE-core/meta/lib] BSP Specific Qemurunner
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
X-List-Received-Date: Wed, 08 Jan 2014 13:13:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-01-07 at 22:59 +0000, Sipke Vriend wrote:
> Hi Richard,
> 
> >
> >-----Original Message-----
> >On Wednesday, 8 January 2014 12:00 AM, Richard Purdie wrote:
> >
> >On Tue, 2014-01-07 at 03:09 +0000, Sipke Vriend wrote:
> >> Hi,
> >> 
> >> This RFC is a proposal to allow BSP layers to setup qemu with their specific
> >> requirements for the testimage oe-core functionality.
> >> The suggested changes will be exercised by the 
> >> bitbake -c testimage <image> 
> >> command.
> >> Similarly to the oeqa test cases this proposal extends the meta/lib/oeqa 
> >> python modules to allow inclusion of python utility scripts in the BSP 
> >> layers.
> >> Any BSP layer wishing to supply their own qemu setup would need to create
> >> an appropriate meta-bsplayer/lib/oeqa/utils/<machine>starter.py
> >> The effect is that the lib/oeqa/utils/qemurunner will either allow the 
> >> bsp layer provided <machine>starter to spawn qemu or if not provided, 
> >> spawn qemu via runqemu as currently.
> >> An example bsp layer is available here:
> >> https://github.com/sipke/meta-xilinx/tree/sipke/qemurunner
> >> with all required additions in the meta-xilinx/lib directory.
> >> 
> >> This RFC is triggered by and indirectly related to
> >> Bugzilla report "runqemu shouldn't hard-code machine knowledge"
> >> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4827
> >
> >Why would we do this rather than improve runqemu to be extendable from
> >BSP layers?
> >
> 
> Proposing as an additional way to launch qemu for oeqa testimage functionality,
> Improving runqemu can and probably should still happen.
>  
> To consider:
> * it keeps testimage functionality (for bsp layers specific things) in 
> the lib directly (similar to test cases) and as python.
> * testing (via testimage) may have a different requirement to that of
> running runqemu on the command line, so an alternate way to launch qemu 
> could be useful.
> * should this approach of extending the oeqa testimage functionality 
> into bsp layers be accepted, this could allow also for bsp specific 
> hardware setup for testimage functionality in bsp layers.
> 
> Primary aim is a solution which allows the bsp layer to control the 
> setup of qemu (and eventually hardware) for testimage functionality. This is 
> a proposal towards that goal.

I thought Stefan was already also working on something towards this
goal. I'd like to ensure we don't end up with two things doing the same
thing.

Stefan?

To be clear, I would like to see runqemu enhanced so BSP layers can
extend it, I think that would be useful for everyone. Once we've done
that, I'd like to revisit the qemu abstraction in testimage and figure
out what changes it needs. Some may be required, some may not if we fix
runqemu first, I'm unclear from these commits what those would be
though.

Cheers,

Richard


