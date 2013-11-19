Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 40A9D6CC8C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 22:42:37 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.7]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1Viu0E-000706-Kp; Tue, 19 Nov 2013 23:42:38 +0100
Message-ID: <1384904501.4213.2.camel@x121e.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Nov 2013 23:41:41 +0000
In-Reply-To: <5E5EE01A-4572-41FA-88DC-9F08DA17B040@gmail.com>
References: <cover.1381266484.git.bruce.ashfield@windriver.com>
	<9f62e2e632692c5919a0de25a785d17d477a64b3.1381266484.git.bruce.ashfield@windriver.com>
	<20131119173725.GA13018@mcrowe.com>
	<1384883174.23724.116.camel@phil-desktop.brightsign>
	<CADkTA4Pd1pqS8wf-BbGRy2becWpQNtzx9V0cmrrEy9OOc9N+mg@mail.gmail.com>
	<CADkTA4PSaf3PQOAnpv_mt769WRgb6vj2TGM04T9=O++p+9_9jw@mail.gmail.com>
	<5E5EE01A-4572-41FA-88DC-9F08DA17B040@gmail.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Tue, 2013-11-19 at 14:29 -0800,
	Khem Raj wrote: > Well
	reproducer case is that build from sstate but such that an external
	module
	needs to be rebuilt > if external module also comes from sstate then it
	all
	is fine. Its only when everything is coming from > sstate except this
	external
	module which needs to be rebuilt then you see this problem. > > now,
	I see
	the code in module-base.class > > # > # Ensure the hostprogs are
	available
	for module compilation. Modules that > # inherit this recipe and
	override
	do_compile() should be sure to call > # do_make_scripts() or ensure the
	scripts
	are built independently. > # > do_make_scripts() { > unset CFLAGS
	CPPFLAGS
	CXXFLAGS LDFLAGS > make CC="${KERNEL_CC}" LD="${KERNEL_LD}"
	AR="${KERNEL_AR}"
	\ > -C ${STAGING_KERNEL_DIR} scripts > } > > so it expects that,
	do_make_scripts
	is explicitly called by external module recipes > > and my recipes did
	override
	module_do_compile task but not do_compile like below > >
	module_do_compile() { > oe_runmake > } > > so,
	is comment wrong there should it say module_do_compile
	instead ? [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
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
X-List-Received-Date: Tue, 19 Nov 2013 22:42:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-11-19 at 14:29 -0800, Khem Raj wrote:
> Well reproducer case is that build from sstate but such that an external module needs to be rebuilt
> if external module also comes from sstate then it all is fine. Its only when everything is coming from
> sstate except this external module which needs to be rebuilt then you see this problem.
> 
> now, I see the code in module-base.class
> 
> #
> # Ensure the hostprogs are available for module compilation. Modules that
> # inherit this recipe and override do_compile() should be sure to call
> # do_make_scripts() or ensure the scripts are built independently.
> #
> do_make_scripts() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS 
>         make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
>                    -C ${STAGING_KERNEL_DIR} scripts
> }
> 
> so it expects that, do_make_scripts is explicitly called by external module recipes
> 
> and my recipes did override module_do_compile task but not do_compile like below
> 
> module_do_compile() {
>         oe_runmake
> }
> 
> so, is comment wrong there should it say module_do_compile instead ?

The comment is slightly wrong, yes.  For correct results you need to
either:

1. inherit module (not module-base), which does:

addtask make_scripts after do_patch before do_compile

and will ensure that the scripts are built before your module is
compiled without you needing to do anything else.  Or...

2. inherit module-base and arrange to call do_make_scripts() explicitly
from your own recipe.

p.



