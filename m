Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 47A1B7804A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 13:12:01 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 27 Jun 2017 06:12:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,399,1493708400"; d="scan'208";a="872161164"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Jun 2017 06:12:02 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id EAD8158075B;
	Tue, 27 Jun 2017 06:12:01 -0700 (PDT)
Date: Tue, 27 Jun 2017 16:09:59 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170627130959.GA4850@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1498557396.git.ed.bartosh@linux.intel.com>
	<edaa061285116e1d87c27d76adb356352a83e9ef.1498557396.git.ed.bartosh@linux.intel.com>
	<CAJTo0LaOHMuAiw1Rsm2AA-01cCuG2gqD0WhM+qisWpiQD0Ar9g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaOHMuAiw1Rsm2AA-01cCuG2gqD0WhM+qisWpiQD0Ar9g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/7] wic: rootfs: make copied rootfs unique
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
X-List-Received-Date: Tue, 27 Jun 2017 13:12:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 27, 2017 at 01:21:41PM +0100, Burton, Ross wrote:
> Can you squash stuff like this into the first patch, the history doesn't
> need to see your working.
> 
This commit doesn't fit to any other from my point of view.
It's just a fix for rootfs plugin.

I'll try to squash other commits.

> Also, does the hardlink copy get cleaned up?
> 
Yes, it does. It's created in the temporary directory, which
is removed after image is ready.

> Ross
> 
> On 27 June 2017 at 10:57, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> 
> > Used unique suffix (line number from .wks file) for the
> > copied rootfs directory to avoid possible conflicts.
> >
> > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> > ---
> >  scripts/lib/wic/plugins/source/rootfs.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/lib/wic/plugins/source/rootfs.py
> > b/scripts/lib/wic/plugins/source/rootfs.py
> > index e438158..aec720f 100644
> > --- a/scripts/lib/wic/plugins/source/rootfs.py
> > +++ b/scripts/lib/wic/plugins/source/rootfs.py
> > @@ -88,7 +88,7 @@ class RootfsPlugin(SourcePlugin):
> >          if part.exclude_path is not None:
> >              # We need a new rootfs directory we can delete files from.
> > Copy to
> >              # workdir.
> > -            new_rootfs = os.path.realpath(os.path.join(cr_workdir,
> > "rootfs"))
> > +            new_rootfs = os.path.realpath(os.path.join(cr_workdir,
> > "rootfs%d" % part.lineno))
> >
> >              if os.path.lexists(new_rootfs):
> >                  shutil.rmtree(os.path.join(new_rootfs))
> > --
> > 2.1.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >

-- 
--
Regards,
Ed

