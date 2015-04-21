Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1AC5E73D5E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 06:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3L6P4tG014001; Tue, 21 Apr 2015 07:25:04 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cvmXlcV7_zYn; Tue, 21 Apr 2015 07:25:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3L6Opj4013994
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 21 Apr 2015 07:25:02 +0100
Message-ID: <1429597491.26983.66.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, "Bartosh, Eduard"
	<eduard.bartosh@intel.com>
Date: Tue, 21 Apr 2015 07:24:51 +0100
In-Reply-To: <20150420130541.GD3686@jama>
References: <1428674774-29364-1-git-send-email-Martin.Jansa@gmail.com>
	<20150420130541.GD3686@jama>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] e2fsprogs: Package populate-extfs.sh and enable symlink install
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
X-List-Received-Date: Tue, 21 Apr 2015 06:25:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-04-20 at 15:05 +0200, Martin Jansa wrote:
> On Fri, Apr 10, 2015 at 04:06:14PM +0200, Martin Jansa wrote:
> > * install populate-extfs.sh from contrib, be aware that in order
> >   to use it you need to set DEBUGFS shell variable, otherwise it will
> >   try to use debugfs from relative path which is almost always
> >   incorrect:
> >     CONTRIB_DIR=$(dirname $(readlink -f $0))
> >     DEBUGFS="$CONTRIB_DIR/../debugfs/debugfs"
> > 
> > * use symlinks to install e2fsck, mke2fs, without this option we have:
> >   $ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-r0/image/sbin/
> >   ...
> >   101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 e2fsck
> >   101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 fsck.ext2
> >   101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 fsck.ext3
> >   101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 fsck.ext4
> >   101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 fsck.ext4dev
> >   ...
> >   101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mke2fs
> >   101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mkfs.ext2
> >   101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mkfs.ext3
> >   101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mkfs.ext4
> >   101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mkfs.ext4dev
> >   ...
> > 
> >   which would be OK, because they are hadlinks, but after runstrip in
> >   do_package we get one stripped binary and 4 hardlinks to the original
> >   one:
> > 
> >   $ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-r0/packages-split/e2fsprogs-e2fsck/sbin
> >   101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15:43 e2fsck
> >   101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15:43 fsck.ext2
> >   101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15:43 fsck.ext3
> >   101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15:43 fsck.ext4
> >   101983136 -rwxr-xr-x 2 bitbake bitbake 185K Apr 10 15:43 fsck.ext4dev
> >   $ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-r0/packages-split/e2fsprogs-mke2fs/sbin/
> >   101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15:43 mke2fs
> >   101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15:43 mkfs.ext2
> >   101988266 -rwxr-xr-x 2 bitbake bitbake  72K Apr 10 15:43 mkfs.ext3
> >   101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15:43 mkfs.ext4
> >   101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15:43 mkfs.ext4dev
> > 
> >   That's super annoying for big files like this which are often include
> >   in small recovery images. Using --enable-symlink-install option results
> >   in one stripped binary and 4 symlinks:
> > 
> >   $ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-r0/packages-split/e2fsprogs-e2fsck/sbin/
> >   102113806 -rwxr-xr-x 2 bitbake bitbake 185K Apr 10 15:50 e2fsck
> >   102113813 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 fsck.ext2 -> e2fsck
> >   102113814 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 fsck.ext3 -> e2fsck
> >   102113812 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 fsck.ext4 -> e2fsck
> >   102113815 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 fsck.ext4dev -> e2fsck
> >   $ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-r0/packages-split/e2fsprogs-mke2fs/sbin/
> >   102113804 -rwxr-xr-x 2 bitbake bitbake  72K Apr 10 15:50 mke2fs
> >   102113825 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 mkfs.ext2 -> mke2fs
> >   102113826 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 mkfs.ext3 -> mke2fs
> >   102113823 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 mkfs.ext4 -> mke2fs
> >   102113824 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 mkfs.ext4dev -> mke2fs
> > 
> >   Saving cca 1,5MB.
> 
> Ping, this is needed also in fido and dizzy branches.

I'm still hoping we can fix the packaging code so that we avoid this
problem with hardlinked files which is why I'm holding off this
slightly.

Also, are you sure this problem applies in dizzy? The change the
introduced this problem wasn't in dizzy as far as I remember but I could
be wrong...

Cheers,

Richard



