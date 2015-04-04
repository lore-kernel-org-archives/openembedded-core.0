Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AD8C873CBD
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Apr 2015 21:34:06 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 04 Apr 2015 14:34:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,524,1422950400"; d="scan'208";a="551115359"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 04 Apr 2015 14:34:08 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id E79E36A408F;
	Sat,  4 Apr 2015 14:33:45 -0700 (PDT)
Date: Sun, 5 Apr 2015 00:34:01 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20150404213401.GA10453@linux.intel.com>
References: <1428168028-6476-1-git-send-email-ed.bartosh@linux.intel.com>
	<CAP9ODKprO_BWYjr4x0w2PXELXrZa6Y4C2=XgKMWXE+ppULZXTQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKprO_BWYjr4x0w2PXELXrZa6Y4C2=XgKMWXE+ppULZXTQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [wic][PATCH] wic: extended list of paths in find_binary_path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ed.bartosh@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 04 Apr 2015 21:34:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 04, 2015 at 03:34:59PM -0300, Otavio Salvador wrote:
> Em 04/04/2015 14:21, "Ed Bartosh" <ed.bartosh@linux.intel.com> escreveu:
> >
> > wic requires tools that are not always possible to find in $PATH.
> > This causes wic to fail with confusing errors like this:
> >  External command 'parted' not found, exiting.
> >    (Please install 'parted' on your host system)
> >
> > Adding ~/bin/, /usr/local/sbin, /usr/local/bin, /usr/sbin, /usr/bin,
> > /sbin and /bin to the list of paths makes find_binary_path to
> > produce more reliable results.
> >
> > [YOCTO #7122]
> >
> > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> 
> I think we shouldn't do that. If user wants something to be found the PATH
> environment variable should have them included.
> 
Some users think that this is confusing: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7122
For current implementation of wic it practically means that it must be always run as "PATH=/usr/sbin:$PATH wic" on OpenSUSE systems.

> This also brings one serious error off wic which is it relying on host
> utilities. It should use parted from native sysroot instead otherwise we
> cannot be sure if witch version we will be using.

This makes sense to me. Not sure how easy is to do it as I suspect that not only parted is used this way.

BTW, this approach conflicts with this feature request: https://bugzilla.yoctoproject.org/show_bug.cgi?id=6558
So, should wic rely on system utilities or not?
If it should not then what would you suggest to do with #6558?

--
Regards,
Ed

