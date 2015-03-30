Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6CBB06013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 09:17:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 30 Mar 2015 02:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,492,1422950400"; d="scan'208";a="700020352"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 30 Mar 2015 02:17:22 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 42E9F6A408D;
	Mon, 30 Mar 2015 02:17:00 -0700 (PDT)
Date: Mon, 30 Mar 2015 12:17:15 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150330091715.GA2050@linux.intel.com>
References: <1427706018-1695-1-git-send-email-ed.bartosh@linux.intel.com>
	<1427706673.14020.246.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1427706673.14020.246.camel@linuxfoundation.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package_manager: Run createrepo sequentially
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
X-List-Received-Date: Mon, 30 Mar 2015 09:17:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 30, 2015 at 10:11:13AM +0100, Richard Purdie wrote:
> On Mon, 2015-03-30 at 12:00 +0300, Ed Bartosh wrote:
> > Running multiple createrepo in parallel can cause raice conditions
> > when creating/accessing rpm database. Createrepo fails with the
> > error "package_manager: rpmdb: BDB0060 PANIC: fatal region error detected"
> > in such cases.
> > 
> > Running createrepo sequentially should fix the race as rpm database
> > will not be accessed by multiple createrepo at the same time.
> > 
> > [YOCTO #6571]
> > 
> > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> > ---
> >  meta/lib/oe/package_manager.py | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> > 
> > diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> > index c9a8084..c956116 100644
> > --- a/meta/lib/oe/package_manager.py
> > +++ b/meta/lib/oe/package_manager.py
> > @@ -108,25 +108,22 @@ class RpmIndexer(Indexer):
> >          archs = archs.union(set(sdk_pkg_archs))
> >  
> >          rpm_createrepo = bb.utils.which(os.getenv('PATH'), "createrepo")
> > -        index_cmds = []
> >          rpm_dirs_found = False
> >          for arch in archs:
> >              arch_dir = os.path.join(self.deploy_dir, arch)
> >              if not os.path.isdir(arch_dir):
> >                  continue
> >  
> > -            index_cmds.append("%s --update -q %s" % (rpm_createrepo, arch_dir))
> > -
> >              rpm_dirs_found = True
> >  
> > +            result = create_index("%s --update -q %s" % (rpm_createrepo, arch_dir))
> > +            if result:
> > +                bb.fatal(result)
> > +
> >          if not rpm_dirs_found:
> >              bb.note("There are no packages in %s" % self.deploy_dir)
> >              return
> >  
> > -        result = oe.utils.multiprocess_exec(index_cmds, create_index)
> > -        if result:
> > -            bb.fatal('%s' % ('\n'.join(result)))
> > -
> >  
> >  class OpkgIndexer(Indexer):
> >      def write_index(self):
> 
> Running these in parallel gives us a significant speed improvement.
> Could we instead point them at separate directories for the RPM database
> (within WORKDIR to address the previous issue too)?
> 
I didn't see any noticeable performance gain at least for minimal image. I measured the time of
bitbake build before and after this change. It was practically the same.

Regards,
Ed

