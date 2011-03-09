Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PxUtR-0007p5-PO for openembedded-core@lists.openembedded.org;
	Thu, 10 Mar 2011 02:42:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2A1eee6000571;
	Thu, 10 Mar 2011 01:40:40 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32684-06; Thu, 10 Mar 2011 01:40:36 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2A1eO0M000559
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 10 Mar 2011 01:40:30 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <AANLkTin6pW+Om2qF1Ey5=ftWfkNh3FtzRB01fqCmo+EP@mail.gmail.com>
References: <4D6675E0.2040703@mlbassoc.com> <4D6B3BA3.9050303@intel.com>
	<4D6F9018.1000605@mlbassoc.com> <4D704768.2090100@intel.com>
	<4D70CE46.7040104@mlbassoc.com> <1299634187.602.546.camel@rex>
	<4D77C9F9.4040309@mlbassoc.com> <1299697497.602.866.camel@rex>
	<3FBA67DC-6150-4EFE-A5C4-57D895BA697D@dominion.thruhere.net>
	<AANLkTin6pW+Om2qF1Ey5=ftWfkNh3FtzRB01fqCmo+EP@mail.gmail.com>
Date: Wed, 09 Mar 2011 15:04:07 -0800
Message-ID: <1299711847.602.1015.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Poky <poky@lists.pokylinux.org>, Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] Is sstate broken
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
X-List-Received-Date: Thu, 10 Mar 2011 01:42:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-03-09 at 13:51 -0800, Khem Raj wrote:
> On Wed, Mar 9, 2011 at 11:30 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >
> > Op 9 mrt 2011, om 20:04 heeft Richard Purdie het volgende geschreven:
> >
> >> On Wed, 2011-03-09 at 11:42 -0700, Gary Thomas wrote:
> >>> I updated to master (fab742bd4693ed3092690a20dd32d53fe27c3d4c) and tried again.
> >>> I don't see any difference - the run using the sstate cache as a mirror
> >>> seems to do all the same work as without.  Here's how I tested it.
> >>>
> >>> * Build original tree
> >>>   % POKYCONF=meta-cobra3530p60/conf . /tmp/poky-amltd/poky-init-build-env /local/p60_step1
> >>>   ... adjust conf/local.conf
> >>>   % bitbake amltd-console-image
> >>>
> >>> * Rebuild, using previous result for SSTATE_MIRRORS
> >>>   % POKYCONF=meta-cobra3530p60/conf . /tmp/poky-amltd/poky-init-build-env /local/p60_step2
> >>>   ... adjust conf/local.conf
> >>>   % bitbake amltd-console-image
> >>>
> >>> The only difference between the two runs is enabling SSTATE_MIRRORS in local.conf
> >>>   %  diff -u /local/p60_step?/conf/local.conf
> >>>    --- /local/p60_step1/conf/local.conf    2011-03-09 08:28:18.266933061 -0700
> >>>    +++ /local/p60_step2/conf/local.conf    2011-03-09 09:57:51.365932951 -0700
> >>>    @@ -53,4 +53,7 @@
> >>>     IMAGE_LINGUAS ?= "en-us"
> >>>
> >>>     # Minimize feature set
> >>>     DISTRO_FEATURES ?= "alsa"
> >>>    +SSTATE_MIRRORS ?= "\
> >>>    +file://.* file:///local/p60_step1/sstate-cache/"
> >>>
> >>> The results seem to have gone through all the same steps (or nearly so).  The output
> >>> from the runs is at
> >>>   http://www.mlbassoc.com/poky/build.step1
> >>>   http://www.mlbassoc.com/poky/build.step2
> >>>
> >>> Comparing the two build trees:
> >>>   % ls /local/p60_step1/tmp/work/*/*/temp/log.do_compile | wc
> >>>     144     144   12521
> >>>   % ls /local/p60_step2/tmp/work/*/*/temp/log.do_compile | wc
> >>>     143     143   12427
> >>>   % du -s /local/p60_step?
> >>>   15229296        /local/p60_step1
> >>>   15162760        /local/p60_step2
> >>>
> >>> I know this procedure used to work (or at least close).  Am I doing
> >>> something wrong?
> >>
> >> You're not doing anything wrong and this is the same scenario I've been
> >> testing with. After I'd fixed the origin problem it created a problem
> >> with file urls containing globing. I managed to break the original patch
> >> with the globing fix. The good news is the problem is simple and I've
> >> pushed a fix.
> >
> > Is that fix in oe-core as well?
> 
> I guess its hardening in yocto and eventually will make into oe-core
> which is good.

Its a bitbake change and will head into bitbake as soon as we've got
some positive test reports back from Gary and Yocto's QA people.

Cheers,

Richard



