Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TOcmp-0001FM-Pj
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 01:12:29 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TOcZy-00024t-Sb; Thu, 18 Oct 2012 00:59:10 +0200
Message-ID: <1350514593.4470.175.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Wed, 17 Oct 2012 23:56:33 +0100
In-Reply-To: <507E2722.9020904@linux.intel.com>
References: <1348577801.31293.71.camel@phil-desktop>
	<50785717.8000606@linux.intel.com>
	<1350294414.3259.128.camel@phil-desktop>
	<507E2722.9020904@linux.intel.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
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
X-List-Received-Date: Wed, 17 Oct 2012 23:12:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-10-16 at 20:33 -0700, Saul Wold wrote:
> Another edge case?
> > ERROR: Function failed: do_evacuate_scripts (see /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-eglibc-initial-2.16-r16+svnr20393/temp/log.do_evacuate_scripts.1600 for further information)
> > ERROR: Logfile of failure stored in: /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-eglibc-initial-2.16-r16+svnr20393/temp/log.do_evacuate_scripts.1600
> > Log data follows:
> > | DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i686-linux', 'common']
> > | DEBUG: Executing shell function do_evacuate_scripts
> > | cp: cannot stat `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-eglibc-initial-2.16-r16+svnr20393/image/opt/poky/1.3+snapshot/sysroots/i686-pokysdk-linux/usr/bin/mtrace': No such file or directory
> > | ERROR: Function failed: do_evacuate_scripts (see /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-eglibc-initial-2.16-r16+svnr20393/temp/log.do_evacuate_scripts.1600 for further information)
> > NOTE: recipe nativesdk-eglibc-initial-2.16-r16+svnr20393: task do_evacuate_scripts: Failed
> > NOTE: recipe gupnp-av-0.8.0-r2: task do_compile: Started
> > ERROR: Task 1593 (virtual:nativesdk:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/meta/recipes-core/eglibc/eglibc-initial_2.16.bb, do_evacuate_scripts) failed with exit code '1'
> 
> This was a build for the meta-toolchain-gmae, but I also saw this with 
> the multilib build.

The issue with meta-toolchain-gmae is that eglibc-package.inc needs to
declare an empty do_evacuate_scripts_pn-nativesdk-eglibc-initial(), like
it does for pn-eglibc-initial.  Something along the lines of:

--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -121,6 +121,10 @@ do_evacuate_scripts_pn-eglibc-initial () {
        :
 }
 
+do_evacuate_scripts_pn-nativesdk-eglibc-initial () {
+       :
+}
+
 addtask evacuate_scripts after do_install before do_populate_sysroot do_package
 
 PACKAGE_PREPROCESS_FUNCS += "eglibc_package_preprocess"

Do you have an easy way to reproduce the multilib failure?

p.




