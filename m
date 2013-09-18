Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id BC8FD60664
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 16:23:35 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8IGbrjq013021; Wed, 18 Sep 2013 17:37:53 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ynC5_AkQmwn2; Wed, 18 Sep 2013 17:37:52 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8IGblPs013015
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 18 Sep 2013 17:37:48 +0100
Message-ID: <1379521400.18603.33.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 18 Sep 2013 17:23:20 +0100
In-Reply-To: <CADkTA4PiypPNYUnx6h_MrijUpo_AL5w09KR+m6Ks_cuJMuOuvg@mail.gmail.com>
References: <1379512264-8755-1-git-send-email-otavio@ossystems.com.br>
	<ly38p2urzf.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CADkTA4N+LdRpRW-497U0K8ZTFbFvy5Yr+2QznKbcg0yxSaBPww@mail.gmail.com>
	<lytxhitawh.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAP9ODKqWGteXc+_kR5o6rmifWXmnKD3vUjQkOUzxR1Fp+Bkqmg@mail.gmail.com>
	<lyli2ut9r0.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CADkTA4PEPFjA5Adi_NJm8gXof4HNcr6AC5XqvJHhWBY5js5tVw@mail.gmail.com>
	<1379520153.18603.27.camel@ted>
	<CADkTA4PiypPNYUnx6h_MrijUpo_AL5w09KR+m6Ks_cuJMuOuvg@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Add LDFLAGS to allow build of old kernels without patching
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
X-List-Received-Date: Wed, 18 Sep 2013 16:23:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-09-18 at 12:14 -0400, Bruce Ashfield wrote:
> On Wed, Sep 18, 2013 at 12:02 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2013-09-18 at 11:54 -0400, Bruce Ashfield wrote:
> >> On Wed, Sep 18, 2013 at 11:44 AM, Enrico Scholz
> >> <enrico.scholz@sigma-chemnitz.de> wrote:
> >> > Otavio Salvador <otavio@ossystems.com.br> writes:
> >> >
> >> >> I don't agree on this. perf is tied to kernel and part of its code so
> >> >> I think same exception rule apply for it as well.
> >> >
> >> > perf ships with the kernel but is a pure userspace program.  It does not
> >> > require any special setup ('make configure'), it links against complex
> >> > userspace gui frameworks and uses userspace headers.
> >>
> >> yes, we realize this .. we have a long a complicated history with perf and the
> >> related build issues.
> >>
> >> We are stating our general policy, interfere with it's build as little
> >> as possible.
> >> Use extension variables, not clobber variables, etc.
> >>
> >> Otherwise, we end up creating our own issues, and have the bugs to prove it :)
> >
> > For the record, I do think Enrico does have a valid point here. We do
> > put things in CFLAGS and LDFLAGS which we expect *all* userspace to be
> > built with. Things like the hash style, preferred debugging symbol
> > options and so on are expected to be used for all userspace binaries.
> >
> > So somehow we do need to ensure that when the kernel is building
> > userspace binaries, it does use the options we expect and match the rest
> > of the system.
> >
> > Equally, I do understand the kernel build system is a complex beast in
> > its own right.
> >
> > We don't have to solve this instantly, but in general its considered a
> > bug if things like the hash-style in LDFLAGS don't make it to the linker
> > commandline. We do have QA tests that check for this, however they don't
> > function as they used to since we hard set the option on when we compile
> > the linker now :/.
> 
> Right, don't get me wrong in my comments. I'm just saying that I'd rather
> add to the flags, versus completely clobber them. Since us imposing the
> complete set of flags, is what has caused us the pain .. not adding to them.

Isn't that what the patch at the start of this thread is doing though
(clobbering, not adding)?  :/

I really need to figure out whether to take this patch or not and it
looks like there isn't an easy answer...

Cheers,

Richard


