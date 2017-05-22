Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C7AE860797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 08:46:26 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 22 May 2017 01:46:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,377,1491289200"; d="scan'208";a="971553266"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 22 May 2017 01:46:27 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id D2F566A4006;
	Mon, 22 May 2017 01:46:10 -0700 (PDT)
Date: Mon, 22 May 2017 11:46:22 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <20170522084622.GA7783@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1493219031-12843-1-git-send-email-kristian.amlie@mender.io>
	<534a1d7c-b787-5e3c-e9fe-829c6585124d@mender.io>
MIME-Version: 1.0
In-Reply-To: <534a1d7c-b787-5e3c-e9fe-829c6585124d@mender.io>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: do_image: Adding support for IMAGE_ROOTFS_EXCLUDE_PATH.
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
X-List-Received-Date: Mon, 22 May 2017 08:46:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 22, 2017 at 09:08:41AM +0200, Kristian Amlie wrote:
> Ping. Would be great to get some feedback so I can continue working on this.
> 
I like the idea.

Lately I was working on generic EFI implementation
and thought that it would be nice to be able to package EFI artifacts
and get them installed the same way as other packages. With
IMAGE_ROOTFS_EXCLUDE_PATH = '<directory with efi artifacts>' it would be
possible to not include that directory into the rootfs if needed.

> --
> Kristian
> 
> On 26/04/17 17:03, Kristian Amlie wrote:
> > This is a direct followup from the earlier f6a064d969f414 commit in wic. It
> > works more or less the same way: The variable specifies a list of directories
> > relative to the root of the rootfs, and these directories will be excluded from
> > the resulting rootfs image. If an entry ends with a slash, only the contents are
> > omitted, not the directory itself.
> > 
> > This is early feedback call, and several things are missing here (see
> > below). However, I would like to know if at least the basic approach is
> > acceptable. Reviewers pressed on time really only need to look at the topmost
> > hunk as well as the last couple of lines of the two functions. Those show what
> > the basic idea is.
> > 
> > What's missing:
> > 
> > * Documentation
> > 
> > * Test coverage
> > 
> > * Respecting IMAGE_ROOTFS_EXCLUDE_PATH is a behavior change, and isn't
> >   appropriate for all image creators. In fact, for the the main use case [1] to
> >   work it must not always be respected.
> > 
> > My idea for the last point is that the variable will not be respected by
> > default, and each of the pure filesystem image creators (btrfs, ext2/3/4, etc)
> > will set a flag that mark their image creator as a "pure filesystem", which
> > would respect this variable. Image creators that make partitions, however,
> > should not respect it, because they will use wic for that purpose instead, and
> > then they need to have access to the entire rootfs. Hence they should not set
> > the flag.
> > 
> > I'm imagining something like this:
> > 
> >   d.setVarFlag('do_image_%s' % t, 'respect_exclude_path', '1')
> > 
> > although I'm not sure if that's the best approach (tips are welcome).
> > 
> > [1] The use case for this feature is the following: We are creating two types of
> > images in Mender: One complete partitioned image, and one image containing only
> > the rootfs. In order to be able to populate non-rootfs partitions, we want to
> > use the regular bitbake recipes for building these components, but then exclude
> > certain directories from the rootfs image. Using wic, we are adding those
> > directories back into the partitioned image, but under different
> > partitions. Unlike the rootfs image, the other partitions are not expected to be
> > rebuilt after the first rollout.
> > 
> 

-- 
--
Regards,
Ed

