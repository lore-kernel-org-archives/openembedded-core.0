Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 420AF6CC8C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 22:42:42 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAJMgbAw029429; Tue, 19 Nov 2013 22:42:37 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tzzZx6CLjYiq; Tue, 19 Nov 2013 22:42:36 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAJMgU6x029424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 19 Nov 2013 22:42:31 GMT
Message-ID: <1384900947.16887.32.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 19 Nov 2013 22:42:27 +0000
In-Reply-To: <CADkTA4ODwRaRMVehxmjjoA=iozbH2LhBKqiHyNLwvB_9n_D_mg@mail.gmail.com>
References: <cover.1381266484.git.bruce.ashfield@windriver.com>
	<9f62e2e632692c5919a0de25a785d17d477a64b3.1381266484.git.bruce.ashfield@windriver.com>
	<20131119173725.GA13018@mcrowe.com>
	<1384883174.23724.116.camel@phil-desktop.brightsign>
	<CADkTA4Pd1pqS8wf-BbGRy2becWpQNtzx9V0cmrrEy9OOc9N+mg@mail.gmail.com>
	<CADkTA4PSaf3PQOAnpv_mt769WRgb6vj2TGM04T9=O++p+9_9jw@mail.gmail.com>
	<5E5EE01A-4572-41FA-88DC-9F08DA17B040@gmail.com>
	<CADkTA4ODwRaRMVehxmjjoA=iozbH2LhBKqiHyNLwvB_9n_D_mg@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kernel: restore scripts in the sysroot
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
X-List-Received-Date: Tue, 19 Nov 2013 22:42:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-11-19 at 17:37 -0500, Bruce Ashfield wrote:
> 
> Exactly. And I had windriver bug with the same symptoms as yours. It
> was a package
> that built its own modules, and hence never called this either.
> 
> > and my recipes did override module_do_compile task but not do_compile like below
> >
> > module_do_compile() {
> >         oe_runmake
> > }
> >
> > so, is comment wrong there should it say module_do_compile instead ?
> >
> > will it work with sstate always ?
> >
> > it will be OK to revert it if thats the case.
> 
> I'll come up with something that works in all cases. The sstate fix is
> better from the point
> of view that it is transparent to the recipes, and they don't need to
> do anything special
> for the support.
> 
> So my proposal is this:
> 
>  - fix the new bug at hand by making the sstate change depend on the
> toolchain (I agree
>    that patching the scripts to not reference the target toolchain
> isn't a good idea since not
>   all kernels get the rix).

Can we please not do this? Adding in toolchain dependencies into the
sstate code whilst possible, is going to massively complicate the
dependency chains and is a last possible resort. I bought that argument
in the useradd case since there are horrible issues there. We don't have
that issue here.

In kernel terms, its safer/easier to hack the kernel makefiles than
expecting sstate to work well with dependencies like that embedded in
it.

>  - remove the modules-base.bbclass scripts recreation, so we only have
> one scripts
>    restore in the tree.
> 
> Alternatively, recipes need to be fixed to call the
> modules-base.bbclass routine to restore
> scripts, and I think it is obvious that won't work in all cases.

Which cases won't that work in?

As far as I'm concerned, people using module-base are taking a loaded
gun and are expected to use it safely (which means calling
do_make_scripts somehow). People wanting a safer ride can use module
which adds the appropriate task for them.

The comments in the bbclass files do need fixing but that is trivial to
sort out.

> I'll wait for comments/concensus before sending a new patch (which
> needs to be tested
> on all the cases), but in the meantime, the patches to the list to fix
> the sstate solution are good to be applied.

I will respectfully disagree ;-).

Cheers,

Richard


