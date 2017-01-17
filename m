Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6721B601F2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 15:04:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 17 Jan 2017 07:04:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,245,1477983600"; d="scan'208";a="31665432"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga002.jf.intel.com with ESMTP; 17 Jan 2017 07:04:31 -0800
Date: Tue, 17 Jan 2017 17:05:03 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20170117150502.GA13342@mbabyjoh-desk.ger.corp.intel.com>
References: <1461230647-19298-1-git-send-email-maxin.john@intel.com>
	<1484657977.10018.78.camel@pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1484657977.10018.78.camel@pbcl.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: update flock behavior to match upstream
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
X-List-Received-Date: Tue, 17 Jan 2017 15:04:32 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

On Tue, Jan 17, 2017 at 12:59:37PM +0000, Phil Blundell wrote:
> On Thu, 2016-04-21 at 12:24 +0300, Maxin B. John wrote:
> > 
> +-
> > +-	if (argv[0])
> > +-		return spawn_and_wait(argv);
> > +-
> > ++    if (argv[0]) {
> > ++        cmd_args[0] = getenv("SHELL");
> > ++        if (!cmd_args[0])
> > ++            cmd_args[0] = (char*)DEFAULT_SHELL;
> > ++        cmd_args[1] = (char*)"-c";
> > ++        cmd_args[2] = argv[0];
> > ++        cmd_args[3] = NULL;
> > ++        return spawn_and_wait(cmd_args);
> > ++    }
> > + 	return EXIT_SUCCESS;
> > + }
> > 
> 
> This patch seems to completely break the behaviour of flock when
> invoked without "-c".  For example, compare the behaviour of:
> 
> flock /tmp/lock echo it works
> 
> before and after.  Please revert this patch until and unless it can be
> fixed.

My bad. Thanks for noticing this. Upstream accepted the patch with some
improvements to fix this:
https://git.busybox.net/busybox/commit/?id=e1d426fd65c00a6d01a10d85edf8a294ae8a2d2b

I will backport that patch and send it soon.

> p.

Best Regards,
Maxin

