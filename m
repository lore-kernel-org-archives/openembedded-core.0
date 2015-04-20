Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0B4D06E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 13:05:36 +0000 (UTC)
Received: by widdi4 with SMTP id di4so98299004wid.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 06:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=rT4gA5DZKBQEqEXqsc5zuJjisOCpWGulLDjEgjGZTSc=;
	b=svDN2WO3K68uF/Guy4FAtOIjCV+ZYrhtU+4NxJRej72Zfsr0IcAgEAtoXEYapPXe20
	IxP2gPf4IUmi8sa95EKoLABLhlJiWyqlbmRO+M7cino/SuewQ/MG16yruyF/nLaNZQPY
	1EMzbEBtEn965eV/9iqBBFg4jkTqXE8AM7z7tdZaMVlWg8/sQnpZUL/MCwJv7Cl8qJV4
	p6RFXTvWlwtIneqkvzKTX7iZfVOr9dre1MVXZu0P4LCNynjHOvBob7iPXAZDEf3+Czxt
	ZpBTuoQsPNJo0l/KFTwFXYzZF2XXJtdQ6jQIft2WqtZoVQQfhCj6fge3YgTiFhsfs2uV
	Db+w==
X-Received: by 10.194.59.79 with SMTP id x15mr6426169wjq.81.1429535137524;
	Mon, 20 Apr 2015 06:05:37 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id hu1sm15206983wib.6.2015.04.20.06.05.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Apr 2015 06:05:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 20 Apr 2015 15:05:41 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20150420130541.GD3686@jama>
References: <1428674774-29364-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1428674774-29364-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Mon, 20 Apr 2015 13:05:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2015 at 04:06:14PM +0200, Martin Jansa wrote:
> * install populate-extfs.sh from contrib, be aware that in order
>   to use it you need to set DEBUGFS shell variable, otherwise it will
>   try to use debugfs from relative path which is almost always
>   incorrect:
>     CONTRIB_DIR=3D$(dirname $(readlink -f $0))
>     DEBUGFS=3D"$CONTRIB_DIR/../debugfs/debugfs"
>=20
> * use symlinks to install e2fsck, mke2fs, without this option we have:
>   $ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-r0=
/image/sbin/
>   ...
>   101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 e2fsck
>   101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 fsck.ext2
>   101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 fsck.ext3
>   101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 fsck.ext4
>   101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 fsck.ext4dev
>   ...
>   101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mke2fs
>   101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mkfs.ext2
>   101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mkfs.ext3
>   101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mkfs.ext4
>   101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mkfs.ext4dev
>   ...
>=20
>   which would be OK, because they are hadlinks, but after runstrip in
>   do_package we get one stripped binary and 4 hardlinks to the original
>   one:
>=20
>   $ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-r0=
/packages-split/e2fsprogs-e2fsck/sbin
>   101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15:43 e2fsck
>   101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15:43 fsck.ext2
>   101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15:43 fsck.ext3
>   101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15:43 fsck.ext4
>   101983136 -rwxr-xr-x 2 bitbake bitbake 185K Apr 10 15:43 fsck.ext4dev
>   $ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-r0=
/packages-split/e2fsprogs-mke2fs/sbin/
>   101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15:43 mke2fs
>   101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15:43 mkfs.ext2
>   101988266 -rwxr-xr-x 2 bitbake bitbake  72K Apr 10 15:43 mkfs.ext3
>   101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15:43 mkfs.ext4
>   101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15:43 mkfs.ext4dev
>=20
>   That's super annoying for big files like this which are often include
>   in small recovery images. Using --enable-symlink-install option results
>   in one stripped binary and 4 symlinks:
>=20
>   $ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-r0=
/packages-split/e2fsprogs-e2fsck/sbin/
>   102113806 -rwxr-xr-x 2 bitbake bitbake 185K Apr 10 15:50 e2fsck
>   102113813 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 fsck.ext2 -> e=
2fsck
>   102113814 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 fsck.ext3 -> e=
2fsck
>   102113812 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 fsck.ext4 -> e=
2fsck
>   102113815 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 fsck.ext4dev -=
> e2fsck
>   $ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-r0=
/packages-split/e2fsprogs-mke2fs/sbin/
>   102113804 -rwxr-xr-x 2 bitbake bitbake  72K Apr 10 15:50 mke2fs
>   102113825 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 mkfs.ext2 -> m=
ke2fs
>   102113826 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 mkfs.ext3 -> m=
ke2fs
>   102113823 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 mkfs.ext4 -> m=
ke2fs
>   102113824 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 mkfs.ext4dev -=
> mke2fs
>=20
>   Saving cca 1,5MB.

Ping, this is needed also in fido and dizzy branches.

