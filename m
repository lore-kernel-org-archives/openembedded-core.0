Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 279B475D4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 17:42:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 27 Oct 2015 10:41:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,206,1444719600"; d="scan'208";a="804572355"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 27 Oct 2015 10:41:41 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id C0EF06A4005;
	Tue, 27 Oct 2015 10:40:39 -0700 (PDT)
Date: Tue, 27 Oct 2015 19:41:36 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
Message-ID: <20151027174136.GA28537@linux.intel.com>
References: <20151027134031.GA12305@linux.intel.com>
	<365E1805BC95084CBE82381A0B8699940121B4E446@EU-MBX-03.mgc.mentorg.com>
	<20151027152729.GA14663@linux.intel.com>
	<365E1805BC95084CBE82381A0B8699940121B4E51B@EU-MBX-03.mgc.mentorg.com>
MIME-Version: 1.0
In-Reply-To: <365E1805BC95084CBE82381A0B8699940121B4E51B@EU-MBX-03.mgc.mentorg.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: U-boot file is being removed when image-recipe is rebuild which uses wic.bz2
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
X-List-Received-Date: Tue, 27 Oct 2015 17:42:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 27, 2015 at 03:40:49PM +0000, Ahsan, Noor wrote:
> This is my wks file 
> 
> part u-boot --source rawcopy --sourceparams="file=u-boot-mx6-solox.imx" --ondisk mmcblk --no-table --align 1
> part /boot --source bootimg-partition --ondisk mmcblk --fstype=vfat --label boot --active --align 4096 --size 8M --extra-space 0
> part / --source rootfs --ondisk mmcblk --fstype=ext4 --label root --align 4096
> 
> u-boot-mx6-solox.imx gets removed after wic is called.
> 
> It is in fsimage.py. see os.rename(source, image_file + '.p%d' % part['num']).
> 
> 
> def assemble(self, image_file):
>         msger.debug("Installing partitions")
> 
>         for part in self.partitions:
>             source = part['source_file']
>             if source:
>                 # install source_file contents into a partition
>                 cmd = "dd if=%s of=%s bs=%d seek=%d count=%d conv=notrunc" % \
>                       (source, image_file, self.sector_size,
>                        part['start'], part['size'])
>                 exec_cmd(cmd)
> 
>                 msger.debug("Installed %s in partition %d, sectors %d-%d, "
>                             "size %d sectors" % \
>                             (source, part['num'], part['start'],
>                              part['start'] + part['size'] - 1, part['size']))
> 
>                 os.rename(source, image_file + '.p%d' % part['num'])
> 

Thank you for the info! I'll try to reproduce the issue.

Wild guess: would copying a file instead of renaming it solve the issue?


Regards,
Ed

> -----Original Message-----
> From: Ed Bartosh [mailto:ed.bartosh@linux.intel.com] 
> Sent: Tuesday, October 27, 2015 8:27 PM
> To: Ahsan, Noor
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: U-boot file is being removed when image-recipe is rebuild which uses wic.bz2
> 
> On Tue, Oct 27, 2015 at 02:28:02PM +0000, Ahsan, Noor wrote:
> > Hello,
> > 
> > I have identified the issue and sent and RFC on mailing list. One feedback I received was replace dd_cmd = "cp src dst" with dd_cmd = "cp %s %s" % (src, dst) which was and off sight from me. I need more detailed review of it.
> 
> Can you point me out where the renaming you've mentioned is happening?
> 
> Anyway it would be good if I could reproduce the issue to better understand it. Can you provide more details about your configuration?
> 
> Regards,
> Ed
> 
> 
> > 
> > Noor
> > 
> > -----Original Message-----
> > From: Ed Bartosh [mailto:ed.bartosh@linux.intel.com]
> > Sent: Tuesday, October 27, 2015 6:41 PM
> > To: Ahsan, Noor
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: U-boot file is being removed when image-recipe is rebuild 
> > which uses wic.bz2
> > 
> > Hi Noor,
> > 
> > Sorry for delay. I missed your e-mail somehow.
> > 
> > Can you please show your recipe, wks file and the details of your build configuration(MACHINE, bblayers, etc) ?
> > 
> > ---
> > Regards,
> > Ed
> 
> > Date: Thu, 22 Oct 2015 10:14:02 +0000
> > From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
> > To: "openembedded-core@lists.openembedded.org"
> >  <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] [RFC] rawcopy.py: Copy source file in image 
> > creation  build folder
> > 
> > 
> > 
> > -----Original Message-----
> > From: Ahsan, Noor
> > Sent: Wednesday, October 21, 2015 9:04 PM
> > To: openembedded-core@lists.openembedded.org
> > Cc: Ahsan, Noor
> > Subject: [RFC] rawcopy.py: Copy source file in image creation build 
> > folder
> > 
> > From: Noor <noor_ahsan@mentor.com>
> > 
> > * When a file is given using --sourceparams then wic directly use that file
> >   instead of copying them to build folder. At time of assmebling it os.rename
> >   is called which rename all the files to name. In that process the original
> >   file get renamed. When image recipe is rebuilt then wic complains about
> >   missing file which renamed in previous build.
> > 
> > Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> > ---
> >  scripts/lib/wic/plugins/source/rawcopy.py |    4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/scripts/lib/wic/plugins/source/rawcopy.py 
> > b/scripts/lib/wic/plugins/source/rawcopy.py
> > index f0691ba..f17da27 100644
> > --- a/scripts/lib/wic/plugins/source/rawcopy.py
> > +++ b/scripts/lib/wic/plugins/source/rawcopy.py
> > @@ -74,6 +74,10 @@ class RawCopyPlugin(SourcePlugin):
> >              dd_cmd = "dd if=%s of=%s ibs=%s skip=1 conv=notrunc" % \
> >                      (src, dst, source_params['skip'])
> >              exec_cmd(dd_cmd)
> > +        else:
> > +            dst = os.path.join(cr_workdir, source_params['file'])
> > +            dd_cmd = "cp src dst"
> > +            exec_cmd(dd_cmd)
> > 
> > 
> > dd_cmd will be replaced by cp_cmd but I need review of all impact of this so that I can send proper patch.
> > 
> > 
> >          # get the size in the right units for kickstart (kB)
> >          du_cmd = "du -Lbks %s" % dst
> > --
> > 1.7.9.5
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 
> --
> --
> Regards,
> Ed

-- 
--
Regards,
Ed

