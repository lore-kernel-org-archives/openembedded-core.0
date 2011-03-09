Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PxPxG-000793-Bp for openembedded-core@lists.openembedded.org;
	Wed, 09 Mar 2011 21:25:58 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p29Jx2dJ023833;
	Wed, 9 Mar 2011 19:59:02 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21021-10; Wed,  9 Mar 2011 19:58:58 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p29JwnmE023816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 9 Mar 2011 19:58:52 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4D7707E9.3080702@gmail.com>
References: <cover.1299633840.git.nitin.a.kamble@intel.com>
	<33b26ba051fa171e480bce3a1e4497a619241176.1299633840.git.nitin.a.kamble@intel.com>
	<4D7707E9.3080702@gmail.com>
Date: Wed, 09 Mar 2011 11:58:46 -0800
Message-ID: <1299700726.602.988.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Jingdong Lu <jingdong.lu@windriver.com>, poky@yoctoproject.org
Subject: Re: [PATCH 1/1] gcc-runtime: fix LSB library checks for libstdc++.so.6
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
X-List-Received-Date: Wed, 09 Mar 2011 20:25:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-03-08 at 20:54 -0800, Khem Raj wrote:
> On 3/8/2011 5:26 PM, Nitin A Kamble wrote:
> > From: Nitin A Kamble<nitin.a.kamble@intel.com>
> >
> > [YOCTO #795]
> >
> > When we run library check of LSB on qemux86 and qemuppc, we got some failures
> > about 'libstdc++.so.6'.
> >
> > Test environment:
> > Platform: Qemu-x86, Qemu-ppc
> > lsb image: poky-image-lsb-qemux86-test.ext3(Feb 26th, auto-build server)
> > Library check of LSB: 4.1.0-1
> >
> > The error log:
> > Did not find _ZNKSt5ctypeIcE8do_widenEPKcS2_Pc (GLIBCXX_3.4) in libstdc++.so.6
> > Unmangled symbol name: std::ctype<char>::do_widen(char const*, char const*,
> > char*) const
> > ...
> >
> >   found that some weak symbols ('W') change into local ('t') during link time
> > and be stripped. According to compiling log, the option
> > "-fvisibility-inlines-hidden" is used for gcc. And this option caused some weak
> > symbols change into local.
> >
> > see http://bugzilla.pokylinux.org/show_bug.cgi?id=795 for more information on the bug.
> >
> > Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> > Signed-off-by: Jingdong Lu<jingdong.lu@windriver.com>
> > Signed-off-by: Khem Raj<raj.khem@gmail.com>
> 
> thank you. Applied it to openembedded-core

This raises some questions about how the pull model works as I'd been
holding off the python RDEPENDS change until I'd had time to check
something out yet you've applied it. I haven't had the time to be able
to make any informed feedback on the patch yet whether it was ok or not
and being able to give any informed feedback takes time.

My basic concern that that the RDEPENDS shouldn't be having that effect
on native packages and it if it, we probably have a bug somewhere else
that likely needs fixing.

So the question is whether we are going truly for the pull model, who
are the people top of tree, what code review applies to patches from
those people, how absence might get handled and so forth.

As an illustration, it would have been much more useful for me if
someone had pulled the individual patches together into a single git
branch and presented that. This helps me as it highlights the
outstanding patches and is what Saul does with many of the Yocto
patches.

I'm aware there are a few patches pending review and I'm thinking the
best approach may be some kind of staging/-next type branch where we
keep these as we review and then either accept, reject or ask for
improvements.

One other thing I noticed is that Khem merged a patch known to be broken
and then a fixup for it several commits later. I don't like to do that
for known breakage since it means things are not bisectable and in that
case I'd have squashed the changes with an update to the commit message
about the change. Its not a major issue but something to keep in mind
going forwards.

Cheers,

Richard




