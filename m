Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0118175B0C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 15:23:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 24 Jun 2015 08:23:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,672,1427785200"; d="scan'208";a="593979673"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 24 Jun 2015 08:23:58 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 5B2F52E055B;
	Wed, 24 Jun 2015 08:23:18 -0700 (PDT)
Date: Wed, 24 Jun 2015 18:23:17 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Philip Balister <philip@balister.org>
Message-ID: <20150624152317.GA28330@linux.intel.com>
References: <1435053182-8028-1-git-send-email-ed.bartosh@linux.intel.com>
	<1435053182-8028-5-git-send-email-ed.bartosh@linux.intel.com>
	<55894189.50102@balister.org>
MIME-Version: 1.0
In-Reply-To: <55894189.50102@balister.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [wic][PATCH 4/6] wic: Implement image compressing
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
X-List-Received-Date: Wed, 24 Jun 2015 15:23:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 23, 2015 at 07:22:49AM -0400, Philip Balister wrote:
> Can you add a way to enable multiple threads for xz? I found this helps
> speed up file creation.
>
I thought about this and other compressor options, but didn't find a good
way to add them. Introducing new commandline option or config value doesn't
look convenient to use from my point of view.

Can you propose something better than that?

Regards,
Ed

> Philip
> 
> On 06/23/2015 05:53 AM, Ed Bartosh wrote:
> > Implemented compressing result image with specified compressor.
> > Updated reporting code to show compressed image.
> > 
> > [YOCTO #7593]
> > 
> > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> > 
> > diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
> > index f3f20e0..2ea7e4e 100644
> > --- a/scripts/lib/wic/imager/direct.py
> > +++ b/scripts/lib/wic/imager/direct.py
> > @@ -33,6 +33,7 @@ from wic.utils.partitionedfs import Image
> >  from wic.utils.errors import CreatorError, ImageError
> >  from wic.imager.baseimager import BaseImageCreator
> >  from wic.plugin import pluginmgr
> > +from wic.utils.oe.misc import exec_cmd
> >  
> >  disk_methods = {
> >      "do_install_disk":None,
> > @@ -71,6 +72,7 @@ class DirectImageCreator(BaseImageCreator):
> >          self.bootimg_dir = bootimg_dir
> >          self.kernel_dir = kernel_dir
> >          self.native_sysroot = native_sysroot
> > +        self.compressor = compressor
> >  
> >      def __get_part_num(self, num, parts):
> >          """calculate the real partition number, accounting for partitions not
> > @@ -318,6 +320,13 @@ class DirectImageCreator(BaseImageCreator):
> >                                                          self.bootimg_dir,
> >                                                          self.kernel_dir,
> >                                                          self.native_sysroot)
> > +        # Compress the image
> > +        if self.compressor:
> > +            for disk_name, disk in self.__image.disks.items():
> > +                full_path = self._full_path(self.__imgdir, disk_name, "direct")
> > +                msger.debug("Compressing disk %s with %s" % \
> > +                            (disk_name, self.compressor))
> > +                exec_cmd("%s %s" % (self.compressor, full_path))
> >  
> >      def print_outimage_info(self):
> >          """
> > @@ -328,7 +337,11 @@ class DirectImageCreator(BaseImageCreator):
> >          parts = self._get_parts()
> >  
> >          for disk_name, disk in self.__image.disks.items():
> > -            full_path = self._full_path(self.__imgdir, disk_name, "direct")
> > +            extension = "direct" + {"gzip": ".gz",
> > +                                    "bzip2": ".bz2",
> > +                                    "xz": ".xz",
> > +                                    "": ""}.get(self.compressor)
> > +            full_path = self._full_path(self.__imgdir, disk_name, extension)
> >              msg += '  %s\n\n' % full_path
> >  
> >          msg += 'The following build artifacts were used to create the image(s):\n'
> > 

-- 
--
Regards,
Ed

