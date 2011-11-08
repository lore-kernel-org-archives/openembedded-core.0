Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RNsOe-0006M1-8y for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 21:35:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8KTZC1005908;
	Tue, 8 Nov 2011 20:29:35 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05508-01; Tue,  8 Nov 2011 20:29:31 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8KTPEK005894
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 8 Nov 2011 20:29:26 GMT
Message-ID: <1320784166.10843.109.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 08 Nov 2011 20:29:26 +0000
In-Reply-To: <CAKZ=5EVjCrBdH2NBrVD_4UD52h6ZG=p6m-QS5L9K8xfpUcUr1g@mail.gmail.com>
References: <1319505532-23199-1-git-send-email-julian.pidancet@gmail.com>
	<CAEsOVNen8kUVPge_jZDq5LjhC7BAG0YKx=wxO+ZysNGAd_KwQg@mail.gmail.com>
	<CAKZ=5EVjCrBdH2NBrVD_4UD52h6ZG=p6m-QS5L9K8xfpUcUr1g@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH] Introduce biarch DISTRO_FEATURE
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
X-List-Received-Date: Tue, 08 Nov 2011 20:35:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-11-07 at 23:14 +0000, Julian Pidancet wrote:
> On Wed, Oct 26, 2011 at 3:09 AM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
> > On Mon, Oct 24, 2011 at 8:18 PM, Julian Pidancet
> > <julian.pidancet@gmail.com> wrote:
> >> This patch introduces a distro feature which enables gcc to produce
> >> both 32bit and 64bit code, and enables binutils to operate on both
> >> 32bit and 64bit binaries. It differs from multilib toolchains in
> >> that it does not require to compile a version of the libc for each
> >> architecture variant. However, the code produced for the secondary
> >> architecture will not be linkable against the libc.
> >>
> >> This patch only works with x86 and x86_64 architectures, but can
> >> probably be extended to support other architectures as well.
> >>
> >> One use-case would be when one wants to compile a system which runs
> >> 32bit userspace applications with a 64bit kernel without having to
> >> deal with two separate libc.
> >
> > What happens with the native gcc on the root file system. And what
> > about meta-toolchain? Any effect?
> >
> 
> Hi Matthew, sorry for the late answer.
> 
> I'm affraid I don't quite see what you mean by "the native gcc on the
> root file system". Are you refering to the version of GCC present on
> the build machine and built by OE ? Or are you refering instead about
> a potential version of GCC running on the target ?
> 
> This patch should only make gcc-cross, and gcc running on the target
> "biarch". It would also probably make sense to build a biarch GCC in
> the meta-toolchain case.
> 
> To be honest, I have not really considered the meta-toolchain case as
> I've never used it before and not quite sure how it works.
> 
> I can respin a patch to handle the meta-toolchain case. But in the
> mean-time, it would be nice if I could get an opinion on wether this
> "biarch" feature is a good idea or not, or, if not, maybe some
> suggestions about how to address this specific 32bit/64bit use-case
> differently.

I'm left wondering how useful the resulting compiler is to most users.
In most cases a user would expect full libc support and hence this is
likely to confuse them. I do appreciate people do have usecases for a
compiler that can handle the other bit format though.

I think my biggest worry is the "--enable-targets=all" option which may
or may not enable things we might not want enabled. I've not had a
chance to go and look at gcc and convince myself that piece is safe. The
other pieces looked less worrying.

Cheers,

Richard






