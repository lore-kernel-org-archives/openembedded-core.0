Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 768AA60D74
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 22:46:05 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAJMk0YG029662; Tue, 19 Nov 2013 22:46:00 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Nev7TCLtY4qE; Tue, 19 Nov 2013 22:46:00 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAJMjtUL029659
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 19 Nov 2013 22:45:57 GMT
Message-ID: <1384901152.16887.34.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Nov 2013 22:45:52 +0000
In-Reply-To: <B5287BC8-6DCA-44B5-84FC-72E6E271A4F0@gmail.com>
References: <cover.1381266484.git.bruce.ashfield@windriver.com>
	<9f62e2e632692c5919a0de25a785d17d477a64b3.1381266484.git.bruce.ashfield@windriver.com>
	<20131119173725.GA13018@mcrowe.com>
	<1384883174.23724.116.camel@phil-desktop.brightsign>
	<CADkTA4Pd1pqS8wf-BbGRy2becWpQNtzx9V0cmrrEy9OOc9N+mg@mail.gmail.com>
	<CADkTA4PSaf3PQOAnpv_mt769WRgb6vj2TGM04T9=O++p+9_9jw@mail.gmail.com>
	<5E5EE01A-4572-41FA-88DC-9F08DA17B040@gmail.com>
	<1384900579.16887.28.camel@ted>
	<B5287BC8-6DCA-44B5-84FC-72E6E271A4F0@gmail.com>
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
X-List-Received-Date: Tue, 19 Nov 2013 22:46:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-11-19 at 14:39 -0800, Khem Raj wrote:
> On Nov 19, 2013, at 2:36 PM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> 
> > On Tue, 2013-11-19 at 14:29 -0800, Khem Raj wrote:
> > 
> >> Well reproducer case is that build from sstate but such that an external module needs to be rebuilt
> >> if external module also comes from sstate then it all is fine. Its only when everything is coming from
> >> sstate except this external module which needs to be rebuilt then you see this problem.
> >> 
> >> now, I see the code in module-base.class
> >> 
> >> #
> >> # Ensure the hostprogs are available for module compilation. Modules that
> >> # inherit this recipe and override do_compile() should be sure to call
> >> # do_make_scripts() or ensure the scripts are built independently.
> >> #
> >> do_make_scripts() {
> >>        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS 
> >>        make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> >>                   -C ${STAGING_KERNEL_DIR} scripts
> >> }
> >> 
> >> so it expects that, do_make_scripts is explicitly called by external module recipes
> >> 
> >> and my recipes did override module_do_compile task but not do_compile like below
> >> 
> >> module_do_compile() {
> >>        oe_runmake
> >> }
> >> 
> >> so, is comment wrong there should it say module_do_compile instead ?
> >> 
> >> will it work with sstate always ?
> >> 
> >> it will be OK to revert it if thats the case.
> > 
> > Did you inherit module-base or module? I think the wording applies to
> > module and not module-base. I think the function used to be in module
> > and was moved along with the comment which is now incorrect.
> > 
> 
> inherit module 

So in that case there is:

addtask make_scripts after do_patch before do_compile
do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
do_make_scripts[deptask] = "do_populate_sysroot"

which forces the make_scripts task to run before compile. I don't see
how that could therefore fail? :/

Do you have a copy of the exact log? I'm wondering if this is another
variant of the bitbake dependency bug I just tracked down
(http://git.yoctoproject.org/cgit.cgi/poky-contrib/patch/?id=7b49d336c4672f3dfa78e1c3f1f5c7384264a118)

Cheers,

Richard


