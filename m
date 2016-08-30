Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1795370030
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 12:00:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 30 Aug 2016 05:00:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,256,1470726000"; d="scan'208";a="1043382904"
Received: from jlock-mobl1.ld.intel.com ([10.103.239.28])
	by orsmga002.jf.intel.com with ESMTP; 30 Aug 2016 05:00:08 -0700
Message-ID: <1472558407.3054.5.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 13:00:07 +0100
In-Reply-To: <921e5cf0-9980-1133-ec0b-bc874ae9c4fb@windriver.com>
References: <cover.1472225461.git.joshua.g.lock@intel.com>
	<387803c1b2b8c0f2b3b29b55be61c27b52b4e7f0.1472225461.git.joshua.g.lock@intel.com>
	<921e5cf0-9980-1133-ec0b-bc874ae9c4fb@windriver.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] oe.path: preserve xattr in copytree() and copyhardlinktree()
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
X-List-Received-Date: Tue, 30 Aug 2016 12:00:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-08-26 at 10:48 -0500, Mark Hatle wrote:
> On 8/26/16 10:43 AM, Joshua Lock wrote:
> > 
> > Pass appropriate options to tar invocations in copytree() and
> > copyhardlinktree() to ensure that any extended attributes on the
> > files
> > are preserved during the copy.
> > 
> > We have to drop the use cpio in "Copy-pass" mode in
> > copyhardlinktree()
> > because cpio doesn't support extended attributes on files. Instead
> > we
> > revert back to using cp with different patterns depending on
> > whether
> > or not the directory contains dot files.
> > 
> > [YOCTO #9857]
> > 
> > Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> > ---
> >  meta/lib/oe/path.py | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
> > index 3c07df3..631c3b4 100644
> > --- a/meta/lib/oe/path.py
> > +++ b/meta/lib/oe/path.py
> > @@ -65,7 +65,7 @@ def copytree(src, dst):
> >      # This way we also preserve hardlinks between files in the
> > tree.
> >  
> >      bb.utils.mkdirhier(dst)
> > -    cmd = 'tar -cf - -C %s -p . | tar -xf - -C %s' % (src, dst)
> > +    cmd = "tar --xattrs --xattrs-include='*' -cf - -C %s -p . |
> > tar --xattrs --xattrs-include='*' -xf - -C %s" % (src, dst)
> >      subprocess.check_output(cmd, shell=True,
> > stderr=subprocess.STDOUT)
> >  
> >  def copyhardlinktree(src, dst):
> > @@ -77,9 +77,14 @@ def copyhardlinktree(src, dst):
> >      if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
> >          # Need to copy directories only with tar first since cp
> > will error if two 
> >          # writers try and create a directory at the same time
> > -        cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p
> > --no-recursion --files-from - | tar -xf - -C %s' % (src, src, dst)
> > +        cmd = "cd %s; find . -type d -print | tar --xattrs --
> > xattrs-include='*' -cf - -C %s -p --no-recursion --files-from - |
> > tar --xattrs --xattrs-include='*' -xf - -C %s" % (src, src, dst)
> >          subprocess.check_output(cmd, shell=True,
> > stderr=subprocess.STDOUT)
> > -        cmd = 'cd %s; find . -print0 | cpio --null -pdlu %s' %
> > (src, dst)
> 
> The reason why cpio was originally used had to do with filenames that
> had spaces
> or other special characters in them.  (this is why the -print0 was
> used)
> 
> I don't object to the change, but we need to make sure that that will
> still work
> properly.
> 
> (Also I thought CPIO -could- do xattrs in the current versions...)

It doesn't preserve xattrs the way we currently invoke it and I can't
see anything about xattrs in the man pages on Ubuntu or Fedora (which
both have different man pages for cpio)

I'm going to submit a v2 of this series that:

a) adds a test to ensure files with spaces and other special characters
are correctly copied.
b) adds a test to ensure that xattr on a file are preserved.

Regards,

Joshua

> 
> --Mark
> 
> > 
> > +        if os.path.isdir(src):
> > +            import glob
> > +            if len(glob.glob('%s/.??*' % src)) > 0:
> > +                src = src + '/.??* '
> > +            src = src + '/*'
> > +        cmd = 'cp -afl --preserve=xattr %s %s' % (src, dst)
> >          subprocess.check_output(cmd, shell=True,
> > stderr=subprocess.STDOUT)
> >      else:
> >          copytree(src, dst)
> > 
> 

