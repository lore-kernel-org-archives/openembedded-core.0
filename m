Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 5A12B65DB8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Apr 2014 09:59:29 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 Apr 2014 02:59:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,871,1389772800"; d="scan'208";a="419719218"
Received: from dmilliga-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.64])
	by azsmga001.ch.intel.com with ESMTP; 16 Apr 2014 02:59:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mike Crowe <mac@mcrowe.com>
Date: Wed, 16 Apr 2014 10:59:27 +0100
Message-ID: <19970662.Q9VEOkvyDS@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.4 (Linux/3.13.9-200.fc20.x86_64; KDE/4.12.4; x86_64; ; )
In-Reply-To: <20140416095359.GA9773@mcrowe.com>
References: <1397640696-21281-1-git-send-email-mac@mcrowe.com>
	<33281528.ls5nyFEmlx@peggleto-mobl5.ger.corp.intel.com>
	<20140416095359.GA9773@mcrowe.com>
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 16 Apr 2014 09:59:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 16 April 2014 10:53:59 Mike Crowe wrote:
> On Wednesday 16 April 2014 at 10:49:48 +0100, Paul Eggleton wrote:
> > On Wednesday 16 April 2014 10:31:36 Mike Crowe wrote:
> > > TARGET_LDFLAGS is currently defined in bitbake.conf to contain
> > > ${TARGET_LINK_HASH_STYLE} which differs between MIPS and other
> > > targets. Since TARGET_LDFLAGS is an exported variable it affects the
> > > hash
> > > of every shell task even if it is not used.
> > > 
> > > We don't want native recipe tasks to have different hashes purely
> > > because
> > > they happen to have been built in order to satisfy dependencies for
> > > different MACHINEs since this causes lots of churn in the native sysroot
> > > when switching between MACHINEs.
> > > 
> > > Making native.bbclass override TARGET_LDFLAGS to use BUILD_LDFLAGS
> > > ensures
> > > consistent hashes and is a sensible thing to be doing anyway.
> > 
> > Just to be clear, for a native recipe how is TARGET_LDFLAGS entering the
> > signatures? AIUI there ought to be indirection such that LDFLAGS is used
> > and that is set from BUILD_LDFLAGS for a native recipe rather than
> > TARGET_LDFLAGS.
> 
> Because TARGET_LDFLAGS is an exported variable. LDFLAGS is set from
> TARGET_LDFLAGS but (prior to this patch) only LDFLAGS is set to
> BUILD_LDFLAGS; TARGET_LDFLAGS remains unchanged.
> 
> See thread "export TARGET_LDFLAGS and native sstate"
> <20140407155333.GA19351@mcrowe.com> .
> 
> Should I improve the commit message?

Sorry, I had missed the other thread. If it's exported then we probably do 
need it to have the correct value.

Since this doesn't look like something recent though I'd like to understand 
why it being effectively wrong hasn't been an issue up to this point.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

