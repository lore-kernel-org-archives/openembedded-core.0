Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id 4BFFF65E4D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Apr 2014 10:07:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,871,1389744000"; d="scan'208";a="65101364"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 16 Apr 2014 11:07:28 +0100
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>)
	id 1WaMkY-0002i8-Cn; Wed, 16 Apr 2014 11:07:26 +0100
Date: Wed, 16 Apr 2014 11:07:26 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140416100726.GA10280@mcrowe.com>
References: <1397640696-21281-1-git-send-email-mac@mcrowe.com>
	<33281528.ls5nyFEmlx@peggleto-mobl5.ger.corp.intel.com>
	<20140416095359.GA9773@mcrowe.com>
	<19970662.Q9VEOkvyDS@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <19970662.Q9VEOkvyDS@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] native.bbclass: Override TARGET_ flags too
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
X-List-Received-Date: Wed, 16 Apr 2014 10:07:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wednesday 16 April 2014 at 10:59:27 +0100, Paul Eggleton wrote:
> On Wednesday 16 April 2014 10:53:59 Mike Crowe wrote:
> > On Wednesday 16 April 2014 at 10:49:48 +0100, Paul Eggleton wrote:
> > > On Wednesday 16 April 2014 10:31:36 Mike Crowe wrote:
> > > > TARGET_LDFLAGS is currently defined in bitbake.conf to contain
> > > > ${TARGET_LINK_HASH_STYLE} which differs between MIPS and other
> > > > targets. Since TARGET_LDFLAGS is an exported variable it affects the
> > > > hash
> > > > of every shell task even if it is not used.
> > > > 
> > > > We don't want native recipe tasks to have different hashes purely
> > > > because
> > > > they happen to have been built in order to satisfy dependencies for
> > > > different MACHINEs since this causes lots of churn in the native sysroot
> > > > when switching between MACHINEs.
> > > > 
> > > > Making native.bbclass override TARGET_LDFLAGS to use BUILD_LDFLAGS
> > > > ensures
> > > > consistent hashes and is a sensible thing to be doing anyway.
> > > 
> > > Just to be clear, for a native recipe how is TARGET_LDFLAGS entering the
> > > signatures? AIUI there ought to be indirection such that LDFLAGS is used
> > > and that is set from BUILD_LDFLAGS for a native recipe rather than
> > > TARGET_LDFLAGS.
> > 
> > Because TARGET_LDFLAGS is an exported variable. LDFLAGS is set from
> > TARGET_LDFLAGS but (prior to this patch) only LDFLAGS is set to
> > BUILD_LDFLAGS; TARGET_LDFLAGS remains unchanged.
> > 
> > See thread "export TARGET_LDFLAGS and native sstate"
> > <20140407155333.GA19351@mcrowe.com> .
> > 
> > Should I improve the commit message?
> 
> Sorry, I had missed the other thread. If it's exported then we probably do 
> need it to have the correct value.
> 
> Since this doesn't look like something recent though I'd like to understand 
> why it being effectively wrong hasn't been an issue up to this point.

Perhaps few people are building in the same source tree for both MIPS and
non-MIPS. I don't think you'd notice otherwise.

Even then we only noticed because it seems to be a good way provoke races
in building whilst unpopulating the sysroot (e.g. my recent fix for
cmake-native vs libacl.)

Thanks.

Mike.

