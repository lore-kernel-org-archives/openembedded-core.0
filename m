Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 88E5D76536
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 13:17:22 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 30 Aug 2015 06:17:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,434,1437462000"; d="scan'208";a="793751575"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 30 Aug 2015 06:17:23 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 2A5816A4005;
	Sun, 30 Aug 2015 06:16:31 -0700 (PDT)
Date: Sun, 30 Aug 2015 16:17:17 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150830131717.GA29330@linux.intel.com>
References: <cover.1440071413.git.ed.bartosh@linux.intel.com>
	<db48ab408d16d06aa46cbae805d88217f24f64c2.1440071413.git.ed.bartosh@linux.intel.com>
	<1440933888.32588.68.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1440933888.32588.68.camel@linuxfoundation.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/17] image.py: write bitbake variables to .env file
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
X-List-Received-Date: Sun, 30 Aug 2015 13:17:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 30, 2015 at 12:24:48PM +0100, Richard Purdie wrote:
> On Thu, 2015-08-20 at 14:56 +0300, Ed Bartosh wrote:
> > Write set of bitbake variables associated with the image into
> > build/tmp/sysroots/<machine>/imagedata/<image>.env
> > 
> > This is needed for wic to be able to get bitbake variables without
> > running 'bitbake -e'.
> 
> I've just realised what this code is doing, its writing out nearly the
> whole data store :(
I'd not say so. The code filters out a lot of content and that filtering can
be improved if needed.

Here is a real example of the file sizes:
$ ls -lh tmp/sysroots/nuc/imgdata/
total 124K
-rw-r--r-- 1 ed users 41K Aug 27 11:34 core-image-minimal.env
-rw-r--r-- 1 ed users 40K Aug 27 11:29 core-image-minimal-initramfs.env
-rw-r--r-- 1 ed users 39K Aug 27 11:35 wic-image-minimal.env

Are they still too big from your point of view?

> Is there no way we can know which variables wic may later need?
Theoretically there is no way to know it. It depends on what wic
plugin writers would want to use.

However, I can make .env files contain only variables that wic
already uses. This would require explicit addition of every new variable
to the code when wic starts to use it, but it's not a big deal as
most probably it will not happen to often.

Frankly, I thought that 40K in size .env file per image is not a big
deal either, but looks like it is.

> I'm not
> keen at all to see an iteration of d.keys() and the list of things not
> to write out looks arbitrary at best :(
It's not arbitrary. It's a result of filtering out variables which wic
will most probably not require and variables with the biggest
content size.

> We need to find a better way of doing this...
See my proposal above.

> I'd also prefer we only do this if we know we're going to be writing a
> wic image.
Any suggestion how to do this?
The problem is that any previously built image can be potentially
used by wic if it's mentioned in .ks file. We can find this out when
we build wic image, but we can't generate .env files on this step.


Regards,
Ed
> > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> > ---
> >  meta/lib/oe/image.py | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
> > index 699c30f..a7fdefa 100644
> > --- a/meta/lib/oe/image.py
> > +++ b/meta/lib/oe/image.py
> > @@ -321,6 +321,27 @@ class Image(ImageDepGraph):
> >  
> >          return image_cmd_groups
> >  
> > +    def _write_env(self):
> > +        """
> > +        Write environment variables
> > +        to tmp/sysroots/<machine>/imgdata/<image>.env
> > +        """
> > +        stdir = self.d.getVar('STAGING_DIR_TARGET', True)
> > +        outdir = os.path.join(stdir, 'imgdata')
> > +        if not os.path.exists(outdir):
> > +            os.makedirs(outdir)
> > +        basename = self.d.getVar('IMAGE_BASENAME', True)
> > +        with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
> > +            for var in sorted(self.d.keys()):
> > +                # filter out as much as we can to reduce file size
> > +                if var.startswith('_') or var.startswith('BB_') \
> > +                   or not var.isupper() or self.d.getVarFlag(var, "func") \
> > +                   or var in ('BBINCLUDED', 'SRCPV', 'MIRRORS'):
> > +                    continue
> > +                value = self.d.getVar(var, True)
> > +                if value:
> > +                    envf.write('%s="%s"\n' % (var, value.strip()))
> > +
> >      def create(self):
> >          bb.note("###### Generate images #######")
> >          pre_process_cmds = self.d.getVar("IMAGE_PREPROCESS_COMMAND", True)
> > @@ -332,6 +353,8 @@ class Image(ImageDepGraph):
> >  
> >          image_cmd_groups = self._get_imagecmds()
> >  
> > +        self._write_env()
> > +
> >          for image_cmds in image_cmd_groups:
> >              # create the images in parallel
> >              nproc = multiprocessing.cpu_count()
> > -- 
> > 2.1.4
> > 
> 
> 

-- 
--
Regards,
Ed

