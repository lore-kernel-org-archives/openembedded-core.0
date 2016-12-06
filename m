Return-Path: <paul@paulbarker.me.uk>
X-Greylist: delayed 4636 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 07 Dec 2016 00:19:42 UTC
Received: from 16.mo3.mail-out.ovh.net (16.mo3.mail-out.ovh.net
	[188.165.56.217])
	by mail.openembedded.org (Postfix) with ESMTP id DC94871B25
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 00:19:42 +0000 (UTC)
Received: from player693.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 69B6F65CE8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 00:02:27 +0100 (CET)
Received: from nuc.betafive.co.uk
	(cpc11-shep11-2-0-cust130.8-3.cable.virginm.net [86.27.96.131])
	(Authenticated sender: paul@betafive.co.uk)
	by player693.ha.ovh.net (Postfix) with ESMTPSA id E200044006A;
	Wed,  7 Dec 2016 00:02:22 +0100 (CET)
Date: Tue, 6 Dec 2016 23:02:22 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20161206230222.5411d7b6@nuc.betafive.co.uk>
In-Reply-To: <1481058881.17535.58.camel@intel.com>
References: <cover.1480711764.git.bruce.ashfield@windriver.com>
	<48f1e3e16ca28e1194d6024689d000cb6ffc303c.1480711764.git.bruce.ashfield@windriver.com>
	<1481058881.17535.58.camel@intel.com>
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.25; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Ovh-Tracer-Id: 4864732026087246273
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrhedugddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] kern-tools: fix processing for no branch meta-data
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
X-List-Received-Date: Wed, 07 Dec 2016 00:19:43 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 06 Dec 2016 22:14:41 +0100
Patrick Ohly <patrick.ohly@intel.com> wrote:

> On Fri, 2016-12-02 at 16:09 -0500, Bruce Ashfield wrote:
> > Lernel meta-data that has patches, but no branches, can trigger an
> > error due to no branch specific patch queue.
> > 
> > This error then cascades to more issues since the tools are using
> > a named file in /tmp to store and display error messages to the
> > user.
> > 
> > We fix both issues though the following kern tools tweaks:
> > 
> >   commit bd9e1d6c9b0a34ff3e19a06999aaf57ffadfd04c
> >   Author: Bruce Ashfield <bruce.ashfield@windriver.com>
> >   Date:   Fri Dec 2 13:09:40 2016 -0500
> > 
> >     scc: use mktemp for consolidated output capture
> > 
> >     To provide useful error messages the tools dump pre-processed
> >     files and messages to a temporary file. If multiple users are
> >     doing builds, this means they either race, or can have permissions
> >     issues.
> > 
> >     By creating the temporary file via mktemp, we avoid both issues.
> >     (We also make sure to clean these up on exit, or /tmp will get
> >     polluted quickly).
> > 
> >   commit a287da4bfe0b4acb8f2b0627bd8e7abd1a1dde26
> >   Author: Bruce Ashfield <bruce.ashfield@windriver.com>
> >   Date:   Fri Dec 2 13:08:08 2016 -0500
> > 
> >     patch: do not assume a branch specific patch queue is needed
> > 
> >     When processing input files per-branch and global patch queues are
> >     generated. If the meta-data has not created any branches in the
> >     repo, no branch specific queue is required.
> > 
> >     The tools assumed that one is always valid, and hence would throw a
> >     non-zero exit code and stop processing.
> > 
> >     By testing for a named per-branch queue, we avoid this issue.
> 
> Ostro OS runs into the problem while trying to use current OE-core
> master:
> 
>  .../patch.cmd: line 29: : No such file or directory
> 
> | ERROR: Function failed: do_kernel_metadata (log file is located ...)
> 
> This commit here fixed it for me. I see that it is already in Ross' mut2
> branch, so hopefully that'll land in master soon.
> 

Ditto for meta-raspberrypi, the kernel doesn't build with current
oe-core master as discussed on the yocto@ list. This patch is needed
to fix things.

Thanks,
Paul Barker

