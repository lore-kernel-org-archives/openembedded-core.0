Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2792171985
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 08:13:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jul 2017 01:13:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,310,1496127600"; d="scan'208";a="1147875941"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 05 Jul 2017 01:13:34 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id CF233580562;
	Wed,  5 Jul 2017 01:13:33 -0700 (PDT)
Date: Wed, 5 Jul 2017 11:01:38 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170705080138.GA29283@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1498569961.git.ed.bartosh@linux.intel.com>
	<3d4d64770e679caa28b6a99486bbbad9a610abb2.1498569961.git.ed.bartosh@linux.intel.com>
	<CAJTo0LZC=Ee+ctXnFCO2WtURObsE=UfuaDqUyrJtgW+1u3_hgw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZC=Ee+ctXnFCO2WtURObsE=UfuaDqUyrJtgW+1u3_hgw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/5] wic: copy rootfs directory before changing fstab
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
X-List-Received-Date: Wed, 05 Jul 2017 08:13:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 04, 2017 at 11:16:23PM +0100, Burton, Ross wrote:
> Bad news: the failure this was meant to fix happened again.
> 
> | tar: ./opt/ltp/testcases/bin/dup01: file changed as we read it
> | ERROR: Function failed: do_image_tar (log file is located at
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/beaglebone-poky-linux-gnueabi/core-image-sato-sdk-ptest/1.0-r0/temp/log.do_image_tar.5535)
> 
> As before, image_wic was also running.
> 
> Is there any chance this could still be wic, or should we look at the jffs2
> image generator?
> 

There is always a chance. Which commit is this? I'll try to reproduce this.

Regards,
Ed


> Ross
> 
> On 27 June 2017 at 14:28, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> >
> > wic updates /etc/fstab on root partition if there are
> > valid mount points in .wks
> >
> > When wic runs from bitbake this can cause incorrect results
> > or even breakage of other tasks working with rootfs directory
> > in parallel with do_image_wic.
> >
> > Implemented copying rootfs directory to a temporary location
> > using copyhardlinktree before updating fstab to avoid conflicts with
> > other tasks working with rootfs.
> >
> > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> > ---
> >  scripts/lib/wic/plugins/imager/direct.py | 22 +++++++++++++---------
> >  1 file changed, 13 insertions(+), 9 deletions(-)
> >
> > diff --git a/scripts/lib/wic/plugins/imager/direct.py
> b/scripts/lib/wic/plugins/imager/direct.py
> > index aa9cc9f..f707365 100644
> > --- a/scripts/lib/wic/plugins/imager/direct.py
> > +++ b/scripts/lib/wic/plugins/imager/direct.py
> > @@ -32,6 +32,8 @@ import uuid
> >
> >  from time import strftime
> >
> > +from oe.path import copyhardlinktree
> > +
> >  from wic import WicError
> >  from wic.filemap import sparse_copy
> >  from wic.ksparser import KickStart, KickStartError
> > @@ -115,12 +117,16 @@ class DirectPlugin(ImagerPlugin):
> >              fstab_lines = fstab.readlines()
> >
> >          if self._update_fstab(fstab_lines, self.parts):
> > -            shutil.copyfile(fstab_path, fstab_path + ".orig")
> > +            # copy rootfs dir to workdir to update fstab
> > +            # as rootfs can be used by other tasks and can't be modified
> > +            new_rootfs = os.path.realpath(os.path.join(self.workdir,
> "rootfs_copy"))
> > +            copyhardlinktree(image_rootfs, new_rootfs)
> > +            fstab_path = os.path.join(new_rootfs, 'etc/fstab')
> >
> >              with open(fstab_path, "w") as fstab:
> >                  fstab.writelines(fstab_lines)
> >
> > -            return fstab_path
> > +            return new_rootfs
> >
> >      def _update_fstab(self, fstab_lines, parts):
> >          """Assume partition order same as in wks"""
> > @@ -156,7 +162,10 @@ class DirectPlugin(ImagerPlugin):
> >          filesystems from the artifacts directly and combine them into
> >          a partitioned image.
> >          """
> > -        fstab_path = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
> > +        new_rootfs = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
> > +        if new_rootfs:
> > +            # rootfs was copied to update fstab
> > +            self.rootfs_dir['ROOTFS_DIR'] = new_rootfs
> >
> >          for part in self.parts:
> >              # get rootfs size from bitbake variable if it's not set in
> .ks file
> > @@ -172,12 +181,7 @@ class DirectPlugin(ImagerPlugin):
> >                      if rsize_bb:
> >                          part.size = int(round(float(rsize_bb)))
> >
> > -        try:
> > -            self._image.prepare(self)
> > -        finally:
> > -            if fstab_path:
> > -                shutil.move(fstab_path + ".orig", fstab_path)
> > -
> > +        self._image.prepare(self)
> >          self._image.layout_partitions()
> >          self._image.create()
> >
> > --
> > 2.1.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
--
Regards,
Ed

