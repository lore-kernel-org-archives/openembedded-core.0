Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7F15A6065B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 08:29:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 May 2013 01:29:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,769,1363158000"; d="scan'208";a="321811955"
Received: from unknown (HELO helios.localnet) ([10.252.121.217])
	by orsmga001.jf.intel.com with ESMTP; 30 May 2013 01:29:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Thu, 30 May 2013 09:29:03 +0100
Message-ID: <2488771.kIoG59Gxit@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-22-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <51A668CA.1070205@windriver.com>
References: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
	<1369857580.6644.13.camel@pb-ThinkPad-R50e>
	<51A668CA.1070205@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/21] Add directory information to the pkgdata files
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
X-List-Received-Date: Thu, 30 May 2013 08:29:04 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 29 May 2013 15:44:58 Mark Hatle wrote:
> On 5/29/13 2:59 PM, Phil Blundell wrote:
> > On Wed, 2013-05-29 at 11:30 -0500, Mark Hatle wrote:
> >> It's up to the tooling that are using these files to check if the
> >> directory
> >> exists, if it does not -- then using bitbake -c patch <recipe> will
> >> create it. (even in the sstate-cache case.)
> > 
> > I'm not sure whether checking that the directory exists is all that
> > safe; in the shared-sstate scenario I think it's conceivable that the
> > directory might exist but contain something else, or be unreadable due
> > to permissions, or disappear underneath you while you're using it.
> > 
> > And, of course, "bitbake -c patch ..." won't necessarily create the same
> > ${S} that you got from pkgdata in that case, it will create it in your
> > local TMPDIR.
> 
> On 5/29/13 12:36 PM, Khem Raj wrote:
>  > Hi Mark
>  > 
>  > This won't work well when package is populated from sstate is there a way
>  > for it to work seamlessly across sstate it might be useful
> 
> I was looking at this again.  I thought the pkgdata was reconstructed each
> time in the current TMPDIR.  I didn't realize it was just restored from the
> sstate-cache.  (We've got other patches in layers that trigger pkgdata-like
> files to be generated as well.. and I must have gotten the two confused.)

I think this is new behaviour for 1.4, so that might explain some of the 
confusion. Previously the pkgdata generation happened in do_package, but now 
that do_rootfs and other places rely upon the presence of pkgdata, it is now a 
separate task so it can be accelerated by sstate and do_package doesn't need 
to be re-run.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

