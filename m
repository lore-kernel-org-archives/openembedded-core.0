Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 42D0271A68
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 16:31:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 25 Nov 2016 08:31:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,547,1473145200"; 
   d="scan'208";a="9369912"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 25 Nov 2016 08:31:33 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id BC6066A4006;
	Fri, 25 Nov 2016 08:30:49 -0800 (PST)
Date: Fri, 25 Nov 2016 18:31:03 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <20161125163103.GA4830@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1480068955-17053-1-git-send-email-kristian.amlie@mender.io>
	<1480069993.6873.98.camel@intel.com>
	<f1699a69-1949-9cb3-8bef-adf9b68f385b@mender.io>
MIME-Version: 1.0
In-Reply-To: <f1699a69-1949-9cb3-8bef-adf9b68f385b@mender.io>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v1] wic: Add --exclude-path option to rootfs source plugin.
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
X-List-Received-Date: Fri, 25 Nov 2016 16:31:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 25, 2016 at 01:07:34PM +0100, Kristian Amlie wrote:
> On 25/11/16 11:33, Patrick Ohly wrote:
> > On Fri, 2016-11-25 at 11:15 +0100, Kristian Amlie wrote:
> >> +            if os.stat(real_rootfs_dir).st_dev ==
> >> os.stat(cr_workdir).st_dev:
> >> +                # Optimization if both directories are on the same
> >> file system:
> >> +                # copy using hardlinks.
> >> +                cp_args = "-al"
> >> +            else:
> >> +                cp_args = "-a"
> >> +            exec_cmd("cp %s %s %s" % (cp_args, real_rootfs_dir,
> >> new_rootfs))
> > 
> > Not a full review (I'll leave that to Ed), just one thing which caught
> > my eye: when the rootfs contains xattrs, they get lost here.
> > 
> > Use oe.path.copyhardlinktree() instead, it also does the hardlinking
> > trick.
> 
> Thanks, that's a good tip! I'll include that in the next patchset.
> 

Thank you for so fast implementation!

Sorry for not answering on original e-mail. I've lost it somehow.

My comments so far:

What's the reason of insisting that path must be absolute?
May be it's just me, but I find it a bit scaring to use absolute path in .wks
The patch is relative to the rootfs directory from my point of view.

It also looks quite strange in the code to insist on absolute path
+                if not os.path.isabs(path):
+                    msger.error("Must be absolute: --exclude-path=%s" %

and then immediately making it relative:
+
+                while os.path.isabs(path):
+                    path = path[1:]


I know, this is just a matter of taste, but I'd not use brackets around
head, tail here. They're redundant and the code looks better without
them from my point of view.
+                    (head, tail) = os.path.split(remaining)

This causes rmtree to throw NotADirectoryError on files:
+                    for entry in os.listdir(full_path):
+                        shutil.rmtree(os.path.join(full_path, entry))

--
Regards,
Ed

