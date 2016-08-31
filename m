Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D642065CBA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 10:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7VAuZ9Z018232; Wed, 31 Aug 2016 11:56:35 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cLMQyFlq4ers; Wed, 31 Aug 2016 11:56:35 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7VAuWGu018229
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 31 Aug 2016 11:56:34 +0100
Message-ID: <1472640992.29583.78.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>, Joshua Lock
	<joshua.g.lock@intel.com>, openembedded-core@lists.openembedded.org
Date: Wed, 31 Aug 2016 11:56:32 +0100
In-Reply-To: <d59ac9ac-f01a-685f-7315-efae6806ae80@windriver.com>
References: <cover.1472562256.git.joshua.g.lock@intel.com>
	<5e6cdf1c7dc3acf0c262a6c34318e4bb103a2129.1472562256.git.joshua.g.lock@intel.com>
	<d59ac9ac-f01a-685f-7315-efae6806ae80@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v2 2/3] oe.path: preserve xattr in copytree() and copyhardlinktree()
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
X-List-Received-Date: Wed, 31 Aug 2016 10:56:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-08-31 at 08:41 +0800, Mark Hatle wrote:
> On 8/30/16 9:05 PM, Joshua Lock wrote:
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
> > Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> > ---
> >  meta/lib/oe/path.py | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
> > index 3c07df3..631c3b4 100644
> > --- a/meta/lib/oe/path.py
> > +++ b/meta/lib/oe/path.py
> > @@ -65,7 +65,7 @@ def copytree(src, dst):
> >      # This way we also preserve hardlinks between files in the
> > tree.
> >  
> >      bb.utils.mkdirhier(dst)
> > -    cmd = 'tar -cf - -C %s -p . | tar -xf - -C %s' % (src, dst)
> > +    cmd = "tar --xattrs --xattrs-include='*' -cf - -C %s -p . |
> > tar --xattrs --xattrs-include='*' -xf - -C %s" % (src, dst)
> >      subprocess.check_output(cmd, shell=True,
> > stderr=subprocess.STDOUT)
> >  
> >  def copyhardlinktree(src, dst):
> > @@ -77,9 +77,14 @@ def copyhardlinktree(src, dst):
> >      if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
> >          # Need to copy directories only with tar first since cp
> > will error if two 
> >          # writers try and create a directory at the same time
> > -        cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p -
> > -no-recursion --files-from - | tar -xf - -C %s' % (src, src, dst)
> > +        cmd = "cd %s; find . -type d -print | tar --xattrs -
> > -xattrs-include='*' -cf - -C %s -p --no-recursion --files-from - |
> > tar --xattrs --xattrs-include='*' -xf - -C %s" % (src, src, dst)
> >          subprocess.check_output(cmd, shell=True,
> > stderr=subprocess.STDOUT)
> > -        cmd = 'cd %s; find . -print0 | cpio --null -pdlu %s' %
> > (src, dst)
> > +        if os.path.isdir(src):
> > +            import glob
> > +            if len(glob.glob('%s/.??*' % src)) > 0:
> > +                src = src + '/.??* '
> > +            src = src + '/*'
> > +        cmd = 'cp -afl --preserve=xattr %s %s' % (src, dst)
> 
> 'cp -a' is a gnu-ism.  I'm not sure if this will cause any problems,
> but it has
> in the past when people have used non coreutils 'cp'.
> 
> (I'm not sure if we're using 'cp -a' anywhere, but I know most of the
> time we
> try to use the discrete set of arguments instead as they're more
> POSIX.)

We have a number of cp -a calls around. I'm not against fixing that but
for now I'm going to take the patch as I have bigger problems to deal
with.

Cheers,

Richard



