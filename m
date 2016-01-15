Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4F4ED731CD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 11:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0FBFJPw015541; Fri, 15 Jan 2016 11:15:41 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JsNMwOYd1vD4; Fri, 15 Jan 2016 11:15:41 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0FBFb5R015558
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 15 Jan 2016 11:15:38 GMT
Message-ID: <1452856537.28375.142.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 15 Jan 2016 11:15:37 +0000
In-Reply-To: <2f2bda63c8a7f435e76c5d4ea1c5c529847f7f65.1452823464.git.liezhi.yang@windriver.com>
References: <cover.1452823464.git.liezhi.yang@windriver.com>
	<2f2bda63c8a7f435e76c5d4ea1c5c529847f7f65.1452823464.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] e2fsprogs: 1.42.9 -> 1.43-WIP
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
X-List-Received-Date: Fri, 15 Jan 2016 11:15:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-01-14 at 18:05 -0800, Robert Yang wrote:
> Upgrade to 1.43-WIP to make "mke2fs -d" support xattr, so that the
> layer
> which requires xattr such as meta-selinux can populate images easily.
> 
> * Remove the following patches since they are alredy in the source.
>   0001-e2fsprogs-fix-cross-compilation-problem.patch
>   0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch
>   0001-mke2fs-add-the-ability-to-copy-files-from-a-given-di.patch
>   0002-misc-create_inode.c-copy-files-recursively.patch
>   0003-misc-create_inode.c-create-special-file.patch
>   0004-misc-create_inode.c-create-symlink.patch
>   0005-misc-create_inode.c-copy-regular-file.patch
>   0006-misc-create_inode.c-create-directory.patch
>   0007-misc-create_inode.c-set-owner-mode-time-for-the-inod.patch
>   0008-mke2fs.c-add-an-option-d-root-directory.patch
>   0009-misc-create_inode.c-handle-hardlinks.patch
>   0010-debugfs-use-the-functions-in-misc-create_inode.c.patch
>   0011-mke2fs.8.in-update-the-manual-for-the-d-option.patch
>   0012-Fix-musl-build-failures.patch
>   CVE-2015-0247.patch
>   copy-in-create-hardlinks-with-the-correct-directory-.patch
>   fix-icache.patch
>   misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch
> 
> * Remove cache_inode.patch since it is not needed any more
> 
> * Updated mkdir.patch and ptest.patch
> 
> * Add --enable-libblkid to EXTRA_OECONF since libblkid is not created
> by
>   default.
> 
> * Time of core-image-sato-sdk do_rootfs:
>   - Before upgrade
>     real    3m18.508s
>     user    7m42.088s
>     sys     1m1.984s
> 
>   - After upgrade
>     real    3m21.552s
>     user    7m38.496s
>     sys     1m0.644s
> 
>    The are nearly the same
> 
> * The "fsck -fn" shows the image is OK, and also can boot.
> 
> [YOCTO #8622]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
[...]

> -SRC_URI[md5sum] = "3f8e41e63b432ba114b33f58674563f7"
> -SRC_URI[sha256sum] =
> "2f92ac06e92fa00f2ada3ee67dad012d74d685537527ad1241d82f2d041f2802"
> +SRCREV = "0f26747167cc9d82df849b0aad387bf824f04544"
> +PV = "1.43-WIP+git${SRCPV}"

What happens when 1.43 is released? 1.43 < 1.43-WIP so we'd have to
bump PE.

Can we just call this 1.42+1.43-git${SRCPV}?

I agree with moving to this btw, I just don't like the idea of "WIP" in
the version string and we need to keep upgrade paths in mind.

Cheers,

Richard

