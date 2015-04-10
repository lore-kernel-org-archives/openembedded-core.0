Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7ED5E6E277
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 16:10:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3AGAjjb008391
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 10 Apr 2015 09:10:45 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.224.2; Fri, 10 Apr 2015 09:10:45 -0700
Message-ID: <5527F604.3050804@windriver.com>
Date: Fri, 10 Apr 2015 11:10:44 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1428674774-29364-1-git-send-email-Martin.Jansa@gmail.com>
	<5527E5CE.7050706@windriver.com> <20150410153808.GA2338@jama>
In-Reply-To: <20150410153808.GA2338@jama>
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
X-List-Received-Date: Fri, 10 Apr 2015 16:10:47 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 4/10/15 10:38 AM, Martin Jansa wrote:
> On Fri, Apr 10, 2015 at 10:01:34AM -0500, Mark Hatle wrote:
>> I'm a bit confused by this.  Why is symlink saving space over hardlink?
>>
>> The hardlinked items should retain their hard link status through the packaging
>> and into the image.  If not, it sounds like there is a bug in the packaging
>> mechanism you are using (opkg, deb, rpm?) and/or the image generation.

The original implementation of split and strip did pay attention to hardlinks
and would only split-strip one, and then correct the links.  This must have
broken along the way.  It's definitely what I would suggest fixing.

> Yes there is bug in package.py:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7586

The commit referenced in there:

commit 7c0fd561bad0250a00cef63e3d787573112a59cf
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Wed Jan 21 11:34:50 2015 +0000
> 
> lib/oe/package: Ensure strip breaks hardlinks
>     
> Normally, strip preserves hardlinks which in the case of the way our hardlink
> rather than copy functionality works, is a disadvantage and leads to non-deterministic
> builds. This adds a move into place after the strip operation to ensure hardlinks
> are broken and we bring back build determinism.

Definitely seems like that caused the problem and is something we really need to
figure out the right answer for.

The hard part, from a determinism standpoint is to know -which- hardlink is the
original of the set.  But there should be no reason to "break" the link, as the
strip operation should only happen on one of them in the pair, setting the
gnu_debuglink to whatever that "one is".  (The rest will follow.)  From a
determinism standpoint, setting some kind of rule, path name (shortest),
timestamp (written first), etc could be used to ensure the produced packages
(and -dbg) have the same contents.

--Mark

>> And just because 'ls' shows the sizes, the fact they are hard linked means
>> they're not taking up duplicate space.
> 
> I know what hardlink is, but if you read the message carefully then
> you'll see that without this change we're installing 1 stripped binary
> and one unstripped with 3 hardlinks and I don't want any unstripped
> binaries in my small recovery rootfs. Symlinks help with that until
> package.py is fixed.
> 
>> I know there is a lot more then just e2fsprogs that does a hard link vs symlinks
>> for various command, which is why I'm trying to understand where we might have a
>> problem.
> 
> Yes package.py still needs to be fixed to fix other recipes as well,
> this one was just most important for me, because our rootfs doesn't fit
> into recovery partition since upgrade to Dizzy.


> Cheers,
> 
>> On 4/10/15 9:06 AM, Martin Jansa wrote:
>>> * install populate-extfs.sh from contrib, be aware that in order
>>>   to use it you need to set DEBUGFS shell variable, otherwise it will
>>>   try to use debugfs from relative path which is almost always
>>>   incorrect:
>>>     CONTRIB_DIR=$(dirname $(readlink -f $0))
>>>     DEBUGFS="$CONTRIB_DIR/../debugfs/debugfs"
>>>
>>> * use symlinks to install e2fsck, mke2fs, without this option we have:
>>>   $ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-r0/image/sbin/
>>>   ...
>>>   101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 e2fsck
>>>   101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 fsck.ext2
>>>   101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 fsck.ext3
>>>   101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 fsck.ext4
>>>   101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 fsck.ext4dev
>>>   ...
>>>   101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mke2fs
>>>   101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mkfs.ext2
>>>   101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mkfs.ext3
>>>   101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mkfs.ext4
>>>   101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mkfs.ext4dev
>>>   ...
>>>
>>>   which would be OK, because they are hadlinks, but after runstrip in
>>>   do_package we get one stripped binary and 4 hardlinks to the original
>>>   one:
>>>
>>>   $ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-r0/packages-split/e2fsprogs-e2fsck/sbin
>>>   101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15:43 e2fsck
>>>   101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15:43 fsck.ext2
>>>   101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15:43 fsck.ext3
>>>   101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15:43 fsck.ext4
>>>   101983136 -rwxr-xr-x 2 bitbake bitbake 185K Apr 10 15:43 fsck.ext4dev
>>>   $ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-r0/packages-split/e2fsprogs-mke2fs/sbin/
>>>   101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15:43 mke2fs
>>>   101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15:43 mkfs.ext2
>>>   101988266 -rwxr-xr-x 2 bitbake bitbake  72K Apr 10 15:43 mkfs.ext3
>>>   101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15:43 mkfs.ext4
>>>   101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15:43 mkfs.ext4dev
>>>
>>>   That's super annoying for big files like this which are often include
>>>   in small recovery images. Using --enable-symlink-install option results
>>>   in one stripped binary and 4 symlinks:
>>>
>>>   $ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-r0/packages-split/e2fsprogs-e2fsck/sbin/
>>>   102113806 -rwxr-xr-x 2 bitbake bitbake 185K Apr 10 15:50 e2fsck
>>>   102113813 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 fsck.ext2 -> e2fsck
>>>   102113814 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 fsck.ext3 -> e2fsck
>>>   102113812 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 fsck.ext4 -> e2fsck
>>>   102113815 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 fsck.ext4dev -> e2fsck
>>>   $ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-r0/packages-split/e2fsprogs-mke2fs/sbin/
>>>   102113804 -rwxr-xr-x 2 bitbake bitbake  72K Apr 10 15:50 mke2fs
>>>   102113825 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 mkfs.ext2 -> mke2fs
>>>   102113826 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 mkfs.ext3 -> mke2fs
>>>   102113823 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 mkfs.ext4 -> mke2fs
>>>   102113824 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 mkfs.ext4dev -> mke2fs
>>>
>>>   Saving cca 1,5MB.
>>>
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>>  meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
>>> index 66065bc..95b4550 100644
>>> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
>>> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
>>> @@ -26,7 +26,7 @@ SRC_URI += "file://acinclude.m4 \
>>>  SRC_URI[md5sum] = "3f8e41e63b432ba114b33f58674563f7"
>>>  SRC_URI[sha256sum] = "2f92ac06e92fa00f2ada3ee67dad012d74d685537527ad1241d82f2d041f2802"
>>>  
>>> -EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-elf-shlibs --disable-libuuid --disable-uuidd --enable-verbose-makecmds"
>>> +EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-elf-shlibs --disable-libuuid --disable-uuidd --enable-verbose-makecmds --enable-symlink-install"
>>>  EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
>>>  
>>>  do_configure_prepend () {
>>> @@ -54,6 +54,8 @@ do_install () {
>>>  	oe_multilib_header ext2fs/ext2_types.h
>>>  	install -d ${D}${base_bindir}
>>>  	mv ${D}${bindir}/chattr ${D}${base_bindir}/chattr.e2fsprogs
>>> +
>>> +	install -v -m 755 ${S}/contrib/populate-extfs.sh ${D}${base_sbindir}/
>>>  }
>>>  
>>>  do_install_append_class-target() {
>>>
>>
> 


