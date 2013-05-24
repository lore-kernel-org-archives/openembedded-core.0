Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 83D6161F47
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 08:52:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2013 01:50:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,734,1363158000"; d="scan'208";a="339361495"
Received: from unknown (HELO helios.localnet) ([10.255.12.195])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2013 01:52:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 May 2013 09:52 +0100
Message-ID: <2953870.4rIkZfJEeW@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-21-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <519E2A73.3020509@windriver.com>
References: <1369296115-20823-1-git-send-email-ming.liu@windriver.com>
	<519E2A73.3020509@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH] libpam: fix multilib packaging issue for pam-plugins
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
X-List-Received-Date: Fri, 24 May 2013 08:52:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 23 May 2013 09:40:51 Mark Hatle wrote:
> On 5/23/13 3:01 AM, Ming Liu wrote:
> > libpam might miss ABI specific dependencies for pam-plugins-*, for RPM
> > uses
> > generic names to check the packages depending on it and doesn't consider
> > the arch, which will lead to packaging issues in multilib build.
> > 
> > pam_plugin_hook is added because the plugin packages are dynamically
> > generated, so we need to manually process multilib names by add baselib to
> > RPROVIDES/RDEPENDS as ABI specific tag.
> > 
> > [YOCTO #4532]
> > [ CQID: WIND00416824 ]
> > 
> > Signed-off-by: Ming Liu <ming.liu@windriver.com>
> 
> I worked with Ming Liu on this particular issue.  You may wonder why this is
> necessary let me attempt to explain the underlying causes.
> 
> In deb/ipk on a multilib package, the package name has specific multilib
> references in it.  I.e. the alternative libraries start with something like
> lib32-...  This was done primarily because deb/ipk do not allow two packages
> with the same name (but different architectures) to be installed at the
> same time.  So the name has to be unique.
> 
> In RPM however, the names of the packages and matches with the architectures
> and if they are not the same we can do these multilib installs.  This
> matches the behavior of other RPM based distributions and in many ways the
> tools people are used to working with RPM.  For the most part this works
> fine in multilib configurations because additional per-file dependencies
> are added that capture the shared library dependencies with ABI specific
> information.  This unfortunately fails in a few cases where plugins are
> dynamically loaded via dlopen -- such as libpam.
> 
> One possible fix is simply to follow the deb/ipk package naming, but this
> causes a design advantage of rpm.  When a package has a dependency on
> 'bash', we really don't care what bash is installed, only that -a- bash is
> installed.  In the deb/ipk case, the lib32- packages would end up with a
> lib32-bash dependency and you could potentially end up with two 'bash'
> packages being installed.
> 
> So the fix I recommended for the issue was to add the baselib path to the
> internal dependencies.  Since we know that the libpam installed in 'lib'
> needs the modules that were compiled to also work with the 'lib' version of
> libpam. While the libpam in 'lib64' need the modules to work with the
> 'lib64' version of the plugins.
> 
> Existing dependencies are preserved so there is no impact in the ipk/deb
> case, the RPM case is resolved as the additional dependency information is
> now present for the package manager to select the package we really want.
> 
> If anyone else has a suggestion for an alternative fix, we're interested --
> but this is the best answer we could come up with.  (If any of the above
> should be added to the commit message, the YP bug, or documentation, please
> let me know and I'll make sure it gets added.)

This is the same problem as bug 4408:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=4408

It's a bit nasty to have to solve this on a per-recipe basis; we need some 
kind of generic solution. At the moment I'm not sure what that would be 
however.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

