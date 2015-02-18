Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7343A6E614
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Feb 2015 22:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1IM8HLh028904; Wed, 18 Feb 2015 22:08:19 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XZqAAbsuFtaV; Wed, 18 Feb 2015 22:08:19 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1IM86cQ028821
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 18 Feb 2015 22:08:18 GMT
Message-ID: <1424297286.11836.22.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Wed, 18 Feb 2015 22:08:06 +0000
In-Reply-To: <ly8ufvf55i.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
	<3ea41bead98e76dfc98d8db94bee711d1d2a88e4.1423150740.git.akuster808@gmail.com>
	<ly8ufvf55i.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 37/61] lib/oe/package: Ensure strip breaks hardlinks
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
X-List-Received-Date: Wed, 18 Feb 2015 22:08:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-02-18 at 19:25 +0100, Enrico Scholz wrote:
> Armin Kuster <akuster808-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> writes:
> 
> > Normally, strip preserves hardlinks which in the case of the way our
> > hardlink rather than copy functionality works,
> 
> This breaks stripping of hardlinked files.  'package.bbclass' contains
> logic to run 'strip' only once per hardlinked file.  With this patch,
> only one instance gets stripped.
> 
> E.g. the 'e2fsprogs-mke2fs' package contains now
> 
> -rwxr-xr-x    4 root     root        350025 Feb 18 01:42 /sbin/mke2fs
> -rwxr-xr-x    4 root     root        350025 Feb 18 01:42 /sbin/mkfs.ext2
> -rwxr-xr-x    4 root     root        350025 Feb 18 01:42 /sbin/mkfs.ext3
> -rwxr-xr-x    4 root     root        350025 Feb 18 01:42 /sbin/mkfs.ext4
> -rwxr-xr-x    1 root     root         84700 Feb 18 01:42 /sbin/mkfs.ext4dev
> 
> where the first 4 programs (which are one inode with 4 hardlinks) are
> not stripped.

There is a problem here for sure. The issue is that for
space/performance reasons we hardlink the files in the sysroot with the
ones in the packaging process amongst other places. If one set gets
stripped, before this patch they'd all get stripped and the process was
not deterministic. Were the files in the sysroot stripped or unstripped
for example?

So the patch addresses a real issue.


> > -    stripcmd = "'%s' %s '%s'" % (strip, extraflags, file)
> > +    # Use mv to break hardlinks
> > +    stripcmd = "'%s' %s '%s' -o '%s.tmp' && mv '%s.tmp' '%s'" % (strip, extraflags, file, file, file, file)
> 
> How are these files then merged again?

They're not :(. So we have a different problem introduced by the patch.
I'll give this a bit more thought overnight. We might need to implement
some code to merge these back given we already maintain the lists of
files.

Cheers,

Richard




