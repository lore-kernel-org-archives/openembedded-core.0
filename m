Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T9ed9-0005SI-LL for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 18:08:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q86Fu4rO019293;
	Thu, 6 Sep 2012 16:56:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05039-02; Thu,  6 Sep 2012 16:55:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q86Ftu4N019286
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 6 Sep 2012 16:55:57 +0100
Message-ID: <1346946956.7493.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 06 Sep 2012 16:55:56 +0100
In-Reply-To: <CAJTo0La9-QHoWJB2v82C2tiM2XFwgHzsP1zda+Duqe_3uTwByw@mail.gmail.com>
References: <CAK18fxEb3gjEEwhvN-du3eJvgUVCbjXU2Ag4kicFFDt6xra6og@mail.gmail.com>
	<CAJTo0LYmPf0g_qv6X+8MefjzfWr4gsr33SaszHsG82PiGg+oEg@mail.gmail.com>
	<644855E8-7D63-45DC-B072-B9A9893058F3@dominion.thruhere.net>
	<CAJTo0La9-QHoWJB2v82C2tiM2XFwgHzsP1zda+Duqe_3uTwByw@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] opengl / libgl / libgles
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
X-List-Received-Date: Thu, 06 Sep 2012 16:08:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-09-06 at 14:51 +0100, Burton, Ross wrote:
> On 6 September 2012 14:25, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > It's not automatic, but you can do something like this:
> >
> >         http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=23b02134
> >
> > That recipe ships multiple copies of the libraries to account for different silicon revisions (the shader compiler will offload different things to the CPU), but we don't want the shlibs code to pickup the copies. So for mesa you can do:
> >
> >         PRIVATE_LIBS_${PN}-dri = "libGL.so"
> >         RPROVIDES_${PN}-dri = $magic_python_function(PACKAGE_CONFIG, sometthing, something, libgl)
> >
> > And in the recipes that link to a GL lib you do:
> >
> >         RDEPENDS_${PN} = "libGL"
> 
> Ah, interesting.  I'm not entirely keen on the manual dependencies but
> that's certainly a step in the right direction.
> 
> If automatic replacement dependencies were added to bitbake, how would
> you implement them?  In Debian, libgl1-mesa installs a
> libgl1-mesa-glx.shlibs file with this contents:
> 
> libGL 1 libgl1-mesa-glx | libgl1
> 
> "when linking to libGL.so, use the dependency 'libgl1-mesa-glx |
> libg1".  All packages which contain libgl.so.1 have Provides: libgl1,
> so they are interchangable.
> 
> Some way of expressing that in the bitbake recipe would be great.

Note that this needs to be expressed at the core level, not recipe level
since it needs to be injected into several places and we don't want to
teach each one this. At best each would have to inherit
opengllib.bbclass.

We might just want to add a table of these and have package.bbclass add
dependencies using the table?

Yes, its suboptimal and not pretty but it would probably be very
effective.

Cheers,

Richard



