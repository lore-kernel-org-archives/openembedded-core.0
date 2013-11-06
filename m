Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2AA526D2DB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2013 11:35:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Nov 2013 03:35:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="430636221"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2013 03:35:01 -0800
Resent-From: Laurentiu Palcu <laurentiu.palcu@intel.com>
Resent-Date: Wed, 6 Nov 2013 13:35:00 +0200
Resent-Message-ID: <20131106113500.GG27969@lpalcu-linux>
Resent-To: openembedded-core@lists.openembedded.org
Date: Wed, 6 Nov 2013 12:39:17 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Message-ID: <20131106103917.GF27969@lpalcu-linux>
References: <cover.1383663447.git.laurentiu.palcu@intel.com>
	<f61f1d9fc224cc017996769e23b08d0af13f3722.1383663447.git.laurentiu.palcu@intel.com>
	<ly38nau8lu.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <ly38nau8lu.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] flex: fix m4 issue on target
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
X-List-Received-Date: Wed, 06 Nov 2013 11:35:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Enrico,

On Tue, Nov 05, 2013 at 05:16:45PM +0100, Enrico Scholz wrote:
> 
> 
> Laurentiu Palcu
> <laurentiu.palcu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> writes:
> 
> > Flex needs m4 to run (see below) and, since the create_wrapper
> > introduces a bash dependency, export the right m4 path when /etc/profile
> > is sourced by the shell.
> >
> > Snippet from the flex documentation:
> > "The macro processor m4 must be installed wherever flex is installed.
> > <...>
> > m4 is only required at the time you run flex."
> 
> Content at profile.d/ won't be evaluated when program is started without
> a shell (e.g. by 'execlp("flex", "flex", ...)').  
> 
> 
> > [YOCTO #5329]
> 
> This should be solved by defining a correct path for the m4 binary at
> build time.
> 
> EXTRA_OECONF += " ac_cv_path_M4=${M4}"
> EXTRA_OEMAKE += " m4=${M4_class-native}"
This is, indeed, a better solution for the target issue. But, I don't
think we can remove the wrapper scripts for native/nativesdk packages
(as you suggested in bugzilla). And the reason for that are those guys
using sstate from build machines. They'll end up with flex searching for
m4 in a path belonging to the build machine.

I'll prepare a v2.

Laurentiu
> 
> is probably a better solution.
> 
> 
> 
> Enrico
> 

