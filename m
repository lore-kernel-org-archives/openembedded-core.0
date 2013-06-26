Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 167F86AC48
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 13:30:53 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 Jun 2013 06:30:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,944,1363158000"; d="scan'208";a="322856366"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 26 Jun 2013 06:30:51 -0700
Date: Wed, 26 Jun 2013 16:30:50 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Erik =?iso-8859-1?Q?Bot=F6?= <erik.boto@pelagicore.com>
Message-ID: <20130626133049.GJ16785@lpalcu-linux>
References: <CA+AhUGwXGcp3w=j6d=tb4hn1SfGm1OnF86UGaDvMD6q005CA3w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+AhUGwXGcp3w=j6d=tb4hn1SfGm1OnF86UGaDvMD6q005CA3w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Issue with pseudo on 64-bit build host
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
X-List-Received-Date: Wed, 26 Jun 2013 13:30:53 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jun 26, 2013 at 11:33:17AM +0200, Erik Botö wrote:
> Hi,
> 
> In bitbake.conf FAKEROOTBASEENV is set to contain
> "PSEUDO_LIBDIR=${STAGING_BINDIR_NATIVE}/../lib/pseudo/lib" but on my
> buildhost libpseudo.so is in
> ${STAGING_BINDIR_NATIVE}/../lib/pseudo/lib64.
> 
> For me this causes rpm:s that use qemu_run_binary() to do stuff during
> do_rootfs() (using post-install scripts) to fail, since ld.so can't
> find libpseudo.so it gives an error that contains "ERR" which
> package_rpm.bbclass rpm_log_check() picks up.

What's the exact error you're seeing? Is it the one listed below?

ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded:
ignored.

This error appears if we run qemu inside pseudo. That's why we use
PSEUDO_UNLOAD=1 in front of the qemu command. However, qemu_run_binary()
already does that...

More info would be helpful.

Laurentiu

> 
> I git confused for a while since the command used in the post-install
> script worked ok in a devshell but not during do_rootfs(), but this is
> due to the fact that LD_LIBRARY_PATH in the devshell contains:
> <mybuilddir>/tmp/sysroots/x86_64-linux/usr/bin/../lib/pseudo/lib64 . I
> couldn't find where this was added to LD_LIBRARY_PATH for devshells
> though.
> 
> Cheers,
> Erik Botö
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

