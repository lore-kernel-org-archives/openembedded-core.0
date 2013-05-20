Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id 7CF20608C4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 20:59:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.87,709,1363132800"; d="scan'208";a="14871467"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 20 May 2013 21:29:32 +0100
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>)
	id 1UeWi4-0006ae-Fm; Mon, 20 May 2013 21:29:32 +0100
Date: Mon, 20 May 2013 21:29:32 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130520202932.GA25090@mcrowe.com>
References: <1369052565-26170-1-git-send-email-mac@mcrowe.com>
	<B646CCF4-2E7C-4135-AD1D-D72E0827C779@gmail.com>
MIME-Version: 1.0
In-Reply-To: <B646CCF4-2E7C-4135-AD1D-D72E0827C779@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: Add dependency on binutils
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
X-List-Received-Date: Mon, 20 May 2013 20:59:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 20, 2013 at 10:37:08AM -0700, Khem Raj wrote:
> 
> On May 20, 2013, at 5:22 AM, Mike Crowe <mac@mcrowe.com> wrote:
> 
> > Compiling the Linux kernel requires binutils; kernel.bbclass uses
> > INHIBIT_DEFAULT_DEPS so it had better depend on binutils explicitly.
> > 
> > (The lack of this dependency isn't always a problem because binutils
> > is required to build gcc-cross but if gcc-cross is reconstructed from
> > the sstate cache then gcc-cross's dependency on binutils-cross is
> > ignored due to being in the safe dependency list in
> > setscene_depvalid.)
> 
> what good is cross-gcc without cross-binutils. Could it be fixed in gcc recipes instead so
> it pulls binutils-cross 

Perhaps it could do when considering requiring binutils to be an
implementation detail of gcc. Unfortunately sstate.bbclass doesn't honour
the dependency (presumably because other recipes that depend on binutils
directly don't wish to bring in all the binutils build dependencies
unnecessarily.) What is the best way to avoid this?

But, kernel compilation also requires the ability to call binutils directly
so it doesn't feel completely wrong for the kernel class to depend on
binutils directly too.

Mike.

