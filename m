Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <e47d11b76cd90e456330dd111f9ca37fbd39bb4e.camel@linuxfoundation.org>
Subject: Re: [OE-core] ERROR: Task (.../kernel-module-something.bb:do_package) failed with exit code '134'
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Tue, 28 Sep 2021 18:15:47 +0100
In-Reply-To: <W5wi.1632764687377274770.mOgu@lists.openembedded.org>
References: <W5wi.1632764687377274770.mOgu@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Vasyl Vavrychuk <vvavrychuk@gmail.com>, openembedded-core@lists.openembedded.org

On Mon, 2021-09-27 at 10:44 -0700, Vasyl Vavrychuk wrote:
> I have external kernel module recipe, let's call it kernel-module-
> something.bb.
> 
> Sometimes, it fails with
> 
>   ERROR: Task (.../kernel-module-something.bb:do_package) failed with exit
> code
> '134'
> 
> I have checked pseudo.log, it looks like this
> 
>   inode mismatch: '.../kernel-module-something/1.0-
> r0/image/lib/modules/5.10.25-yocto-standard/extra/something.ko' ino 240205743
> in db, 240631184 in request.
>   creat ignored for existing file '.../kernel-module-something/1.0-
> r0/image/lib/modules/5.10.25-yocto-standard/extra/something.ko'.
>   inode mismatch: '.../kernel-module-something/1.0-
> r0/image/lib/modules/5.10.25-yocto-standard/extra/something.ko' ino 240205743
> in db, 240631184 in request.
>   ...
>   a lot of inode mismatch prints
>   ...
>   inode mismatch: '.../kernel-module-something/1.0-r0/sstate-build-
> package/package/lib/modules/5.10.25-yocto-standard/extra/something.ko' ino
> 240207118 in db, 240631442 in request.
>   path mismatch [2 links]: ino 240631442 db '.../kernel-module-something/1.0-
> r0/sstate-build-package/packages-split/kernel-module-something-5.10.25-yocto-
> standard/lib/modules/5.10.25-yocto-standard/extra/something.ko' req
> '.../kernel-module-something/1.0-r0/sstate-build-
> package/package/lib/modules/5.10.25-yocto-standard/extra/something.ko'.
>  
> Can't debug it further since it is rarely reproducible, next run failure will
> be some consequence of this, and after cleansstate this won't be reproducible
> for a while.
> 
> My recipe is simple:
> 
>   inherit module
>   
>   SRC_URI = " \
>     file://Kbuild \
>     file://Makefile \
>     file://something.c \
>     file://something.h \
>   "
>   
>   S = "${WORKDIR}"
>   
>   KERNEL_MODULE_AUTOLOAD = "something"
> 
> Using Yocto 3.1.10.


Even if you can't reproduce the error, you can likely look at the pseudo
database (in WORKDIR/pseudo/) as it is a relatively simple sqlite3 database. You
can check the inode numbers in the database compared to the files on disk and
the issue is fixed when the numbers match up.

Cheers,

Richard


