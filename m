Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4DCFA6B6EA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 13:15:25 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 10 Oct 2016 06:15:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,324,1473145200"; d="scan'208";a="18485528"
Received: from wpfong-mobl.amr.corp.intel.com ([10.254.97.32])
	by orsmga004.jf.intel.com with ESMTP; 10 Oct 2016 06:15:26 -0700
Date: Mon, 10 Oct 2016 06:15:37 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20161010131537.GA42301@wpfong-mobl.amr.corp.intel.com>
References: <20161007030947.12602-1-stephano.cetola@linux.intel.com>
	<20161007030947.12602-2-stephano.cetola@linux.intel.com>
	<1476013468.30475.681.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1476013468.30475.681.camel@linuxfoundation.org>
User-Agent: Mutt/1.7.0 (2016-08-17)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] subprocess: remove strings and migrate to direct arrays
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
X-List-Received-Date: Mon, 10 Oct 2016 13:15:27 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 10/09, Richard Purdie wrote:
> On Thu, 2016-10-06 at 20:09 -0700, Stephano Cetola wrote:
> > 
> > When using subprocess call and check_output, it is better to use
> > arrays
> > rather than strings when possible to avoid whitespace and quoting
> > problems.
> > 
> > [ YOCTO #9342 ]
> > 
> > Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
> > ---
> >  meta/lib/oe/distro_check.py    |   2 +-
> >  meta/lib/oe/package.py         |  13 +--
> >  meta/lib/oe/package_manager.py | 218 ++++++++++++++++++++-----------
> > ----------
> >  3 files changed, 114 insertions(+), 119 deletions(-)
> This triggered a lot of errors on the autobuilder:
> 
> http://autobuilder.yocto.io:8010/builders/build-appliance/builds/70
> http://autobuilder.yocto.io:8010/builders/nightly-x86/builds/75
> http://autobuilder.yocto.io:8010/builders/nightly-x86-64/builds/73
> http://autobuilder.yocto.io:8010/builders/nightly-x86-64-lsb/builds/72
> http://autobuilder.yocto.io:8010/builders/nightly-x86-lsb/builds/73
> http://autobuilder.yocto.io:8010/builders/nightly-wic/builds/73
> http://autobuilder.yocto.io:8010/builders/nightly-qa-extras/builds/55
> http://autobuilder.yocto.io:8010/builders/nightly-oe-selftest/builds/70
> http://autobuilder.yocto.io:8010/builders/nightly-multilib/builds/78
> 
> and similar errors on the main AB. I've confirmed it is this patch
> which causes the issue. Presumably some errors are occurring but are
> currently silently being ignored?

The solution here is probably to write a thorough test for
package_manager.py. I imagine that is the culprit. I'm fine with
moving this to 2.3 and I'll add a bug to create a robust set of
tests. 

> 
> Its probably worth looking into what is going on in case there is some
> real issue here but at this point given the complexity of the changes
> I'm leaning towwards deferring this for 2.3.
> 
> Cheers,
> 
> Richard

