Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QrIeY-0002YZ-Vf
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 01:57:39 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Aug 2011 16:53:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="37312813"
Received: from unknown (HELO [10.255.14.248]) ([10.255.14.248])
	by orsmga001.jf.intel.com with ESMTP; 10 Aug 2011 16:53:07 -0700
Message-ID: <4E4319E2.30008@linux.intel.com>
Date: Wed, 10 Aug 2011 16:53:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1312840108-10685-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1312840108-10685-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] uclibc_0.9.32: Sync mount.h from eglibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Aug 2011 23:57:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2011 02:48 PM, Khem Raj wrote:
> mount.h has few more defines that are being used by newer
> applications such as systemd
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   .../uclibc/uclibc-0.9.32/mount.h-update.patch      |   85 ++++++++++++++++++++
>   meta/recipes-core/uclibc/uclibc_0.9.32.bb          |    3 +-
>   2 files changed, 87 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/mount.h-update.patch
>
> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/mount.h-update.patch b/meta/recipes-core/uclibc/uclibc-0.9.32/mount.h-update.patch
> new file mode 100644
> index 0000000..3508e0e
> --- /dev/null
> +++ b/meta/recipes-core/uclibc/uclibc-0.9.32/mount.h-update.patch
> @@ -0,0 +1,85 @@
> +Sync mount.h from glibc this is needed to get missing defines
> +that some apps e.g. systemd are depending on
> +
> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +
> +Index: git/include/sys/mount.h
> +===================================================================
> +--- git.orig/include/sys/mount.h	2011-07-21 14:37:27.134255747 -0700
> ++++ git/include/sys/mount.h	2011-07-21 14:39:53.844470932 -0700
> +@@ -1,5 +1,5 @@
> + /* Header file for mounting/unmount Linux filesystems.
> +-   Copyright (C) 1996,1997,1998,1999,2000,2004 Free Software Foundation, Inc.
> ++   Copyright (C) 1996-2000, 2004, 2010 Free Software Foundation, Inc.
> +    This file is part of the GNU C Library.
> +
> +    The GNU C Library is free software; you can redistribute it and/or
> +@@ -47,23 +47,46 @@
> + #define MS_REMOUNT	MS_REMOUNT
> +   MS_MANDLOCK = 64,		/* Allow mandatory locks on an FS.  */
> + #define MS_MANDLOCK	MS_MANDLOCK
> +-  S_WRITE = 128,		/* Write on file/directory/symlink.  */
> +-#define S_WRITE		S_WRITE
> +-  S_APPEND = 256,		/* Append-only file.  */
> +-#define S_APPEND	S_APPEND
> +-  S_IMMUTABLE = 512,		/* Immutable file.  */
> +-#define S_IMMUTABLE	S_IMMUTABLE
> ++  MS_DIRSYNC = 128,		/* Directory modifications are synchronous.  */
> ++#define MS_DIRSYNC	MS_DIRSYNC
> +   MS_NOATIME = 1024,		/* Do not update access times.  */
> + #define MS_NOATIME	MS_NOATIME
> +   MS_NODIRATIME = 2048,		/* Do not update directory access times.  */
> + #define MS_NODIRATIME	MS_NODIRATIME
> +   MS_BIND = 4096,		/* Bind directory at different place.  */
> + #define MS_BIND		MS_BIND
> ++  MS_MOVE = 8192,
> ++#define MS_MOVE		MS_MOVE
> ++  MS_REC = 16384,
> ++#define MS_REC		MS_REC
> ++  MS_SILENT = 32768,
> ++#define MS_SILENT	MS_SILENT
> ++  MS_POSIXACL = 1<<  16,	/* VFS does not apply the umask.  */
> ++#define MS_POSIXACL	MS_POSIXACL
> ++  MS_UNBINDABLE = 1<<  17,	/* Change to unbindable.  */
> ++#define MS_UNBINDABLE	MS_UNBINDABLE
> ++  MS_PRIVATE = 1<<  18,		/* Change to private.  */
> ++#define MS_PRIVATE	MS_PRIVATE
> ++  MS_SLAVE = 1<<  19,		/* Change to slave.  */
> ++#define MS_SLAVE	MS_SLAVE
> ++  MS_SHARED = 1<<  20,		/* Change to shared.  */
> ++#define MS_SHARED	MS_SHARED
> ++  MS_RELATIME = 1<<  21,	/* Update atime relative to mtime/ctime.  */
> ++#define MS_RELATIME	MS_RELATIME
> ++  MS_KERNMOUNT = 1<<  22,	/* This is a kern_mount call.  */
> ++#define MS_KERNMOUNT	MS_KERNMOUNT
> ++  MS_I_VERSION =  1<<  23,	/* Update inode I_version field.  */
> ++#define MS_I_VERSION	MS_I_VERSION
> ++  MS_STRICTATIME = 1<<  24,	/* Always perform atime updates.  */
> ++#define MS_STRICTATIME	MS_STRICTATIME
> ++  MS_ACTIVE = 1<<  30,
> ++#define MS_ACTIVE	MS_ACTIVE
> ++  MS_NOUSER = 1<<  31
> ++#define MS_NOUSER	MS_NOUSER
> + };
> +
> + /* Flags that can be altered by MS_REMOUNT  */
> +-#define MS_RMT_MASK (MS_RDONLY|MS_SYNCHRONOUS|MS_MANDLOCK|MS_NOATIME \
> +-		     |MS_NODIRATIME)
> ++#define MS_RMT_MASK (MS_RDONLY|MS_SYNCHRONOUS|MS_MANDLOCK|MS_I_VERSION)
> +
> +
> + /* Magic mount flag number. Has to be or-ed to the flag values.  */
> +@@ -100,8 +123,10 @@
> + #define MNT_FORCE MNT_FORCE
> +   MNT_DETACH = 2,		/* Just detach from the tree.  */
> + #define MNT_DETACH MNT_DETACH
> +-  MNT_EXPIRE = 4		/* Mark for expiry.  */
> ++  MNT_EXPIRE = 4,		/* Mark for expiry.  */
> + #define MNT_EXPIRE MNT_EXPIRE
> ++  UMOUNT_NOFOLLOW = 8		/* Don't follow symlink on umount.  */
> ++#define UMOUNT_NOFOLLOW UMOUNT_NOFOLLOW
> + };
> +
> +
> diff --git a/meta/recipes-core/uclibc/uclibc_0.9.32.bb b/meta/recipes-core/uclibc/uclibc_0.9.32.bb
> index 8dcb260..235b436 100644
> --- a/meta/recipes-core/uclibc/uclibc_0.9.32.bb
> +++ b/meta/recipes-core/uclibc/uclibc_0.9.32.bb
> @@ -1,7 +1,7 @@
>   SRCREV="9152c4d67c763fde5712e2d181d92c0d7e1e2ab9"
>
>   require uclibc.inc
> -PR = "${INC_PR}.2"
> +PR = "${INC_PR}.3"
>   PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
>
>   SRC_URI = "git://uclibc.org/uClibc.git;branch=${PV};protocol=git \
> @@ -29,5 +29,6 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=${PV};protocol=git \
>   	file://uclibc-execvpe.patch \
>   	file://uclibc_scheduler_update.patch \
>   	file://sync_file_range2.patch \
> +	file://mount.h-update.patch \
>   	"
>   S = "${WORKDIR}/git"

Merged into OE-Core

Thanks
	Sau!


