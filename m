Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TOn68-00005k-Nx for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 12:13:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9I9xfbD016890;
	Thu, 18 Oct 2012 10:59:41 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16459-08; Thu, 18 Oct 2012 10:59:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9I9xXFE016884
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 18 Oct 2012 10:59:35 +0100
Message-ID: <1350554381.2185.169.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Thu, 18 Oct 2012 10:59:41 +0100
In-Reply-To: <1350514593.4470.175.camel@x121e.pbcl.net>
References: <1348577801.31293.71.camel@phil-desktop>
	<50785717.8000606@linux.intel.com>
	<1350294414.3259.128.camel@phil-desktop>
	<507E2722.9020904@linux.intel.com>
	<1350514593.4470.175.camel@x121e.pbcl.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] eglibc: Move perl- and bash-using scripts to separate recipes
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
X-List-Received-Date: Thu, 18 Oct 2012 10:13:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-10-17 at 23:56 +0100, Phil Blundell wrote:
> On Tue, 2012-10-16 at 20:33 -0700, Saul Wold wrote:
> > Another edge case?
> > > ERROR: Function failed: do_evacuate_scripts (see /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-eglibc-initial-2.16-r16+svnr20393/temp/log.do_evacuate_scripts.1600 for further information)
> > > ERROR: Logfile of failure stored in: /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-eglibc-initial-2.16-r16+svnr20393/temp/log.do_evacuate_scripts.1600
> > > Log data follows:
> > > | DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i686-linux', 'common']
> > > | DEBUG: Executing shell function do_evacuate_scripts
> > > | cp: cannot stat `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-eglibc-initial-2.16-r16+svnr20393/image/opt/poky/1.3+snapshot/sysroots/i686-pokysdk-linux/usr/bin/mtrace': No such file or directory
> > > | ERROR: Function failed: do_evacuate_scripts (see /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-eglibc-initial-2.16-r16+svnr20393/temp/log.do_evacuate_scripts.1600 for further information)
> > > NOTE: recipe nativesdk-eglibc-initial-2.16-r16+svnr20393: task do_evacuate_scripts: Failed
> > > NOTE: recipe gupnp-av-0.8.0-r2: task do_compile: Started
> > > ERROR: Task 1593 (virtual:nativesdk:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/meta/recipes-core/eglibc/eglibc-initial_2.16.bb, do_evacuate_scripts) failed with exit code '1'
> > 
> > This was a build for the meta-toolchain-gmae, but I also saw this with 
> > the multilib build.
> 
> The issue with meta-toolchain-gmae is that eglibc-package.inc needs to
> declare an empty do_evacuate_scripts_pn-nativesdk-eglibc-initial(), like
> it does for pn-eglibc-initial.  Something along the lines of:
> 
> --- a/meta/recipes-core/eglibc/eglibc-package.inc
> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
> @@ -121,6 +121,10 @@ do_evacuate_scripts_pn-eglibc-initial () {
>         :
>  }
>  
> +do_evacuate_scripts_pn-nativesdk-eglibc-initial () {
> +       :
> +}
> +
>  addtask evacuate_scripts after do_install before do_populate_sysroot do_package
>  
>  PACKAGE_PREPROCESS_FUNCS += "eglibc_package_preprocess"
> 
> Do you have an easy way to reproduce the multilib failure?

Its basically the same problem, the mulitlib libc-initial needs to be
set too. The reproducer would be something like:

local.conf:
MACHINE = qemux86
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
baselib_virtclass-multilib-lib32 = "lib32"

$ bitbake eglibc

The easiest solution is probably to change the do_evacuate_scripts
function to check for "-initial" in PN.

Cheers,

Richard







