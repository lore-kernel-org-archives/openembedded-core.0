Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 78B9A6FA5E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jun 2014 16:37:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5AGbgsh023170
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jun 2014 09:37:42 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Tue, 10 Jun 2014 09:37:42 -0700
Message-ID: <53973455.9050203@windriver.com>
Date: Tue, 10 Jun 2014 11:37:41 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1402417936.12440.317.camel@ted>
In-Reply-To: <1402417936.12440.317.camel@ted>
Subject: Re: [PATCH] rpm: Fix cpio 32 bit overflow issues on 64 bit inode filesystems
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
X-List-Received-Date: Tue, 10 Jun 2014 16:37:47 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/14, 11:32 AM, Richard Purdie wrote:
> When building on XFS filesystems, the resulting rpms can be corrupted
> with the same inode number being used for multiple hardlinked files.
> There are two fixes, one to stop rpm crashing when accessing a broken
> binary rpm, the other to stop generating them in the first places. Full
> descriptions in the patch headers.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/recipes-devtools/rpm/rpm/rpm-hardlink-segfault-fix.patch b/meta/recipes-devtools/rpm/rpm/rpm-hardlink-segfault-fix.patch
> new file mode 100644
> index 0000000..d49de6f
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/rpm/rpm-hardlink-segfault-fix.patch
> @@ -0,0 +1,43 @@
> +We need to sanity check that the nlink size and our linksLeft counter
> +do match. If an rpm is badly constucted with identical inode values

s/constucted/constructed

> +for multiple hardlinked files, such an rpm will overwise access memory

s/overwise/otherwise

> +out of array bounds and cause memory corruption and crashes.
> +
> +The fix is to add in the sanity check and exit if bad circumstances
> +are found. We need to fix the caller to check the return code too.
> +
> +RP 10/6/1024

2014?

> +Upstream-Status: Pending
> +
> +Index: rpm-5.4.9/lib/fsm.c
> +===================================================================
> +--- rpm-5.4.9.orig/lib/fsm.c	2014-06-10 10:54:08.601049402 +0000
> ++++ rpm-5.4.9/lib/fsm.c	2014-06-10 10:55:45.633046077 +0000
> +@@ -495,6 +495,11 @@
> +     }
> +
> +     if (fsm->goal == IOSM_PKGBUILD) --fsm->li->linksLeft;
> ++    if (fsm->li->linksLeft > st->st_nlink) {
> ++	rpmlog(RPMLOG_ERR, _("Corrupted hardlinks found (count %d does not match %d), exitting.\n"), fsm->li->linksLeft, st->st_nlink);

exiting

> ++	return -1;
> ++    }
> ++
> +     fsm->li->filex[fsm->li->linksLeft] = fsm->ix;
> +     /*@-observertrans -dependenttrans@*/
> +     fsm->li->nsuffix[fsm->li->linksLeft] = fsm->nsuffix;
> +@@ -1876,8 +1881,13 @@
> + 	fsm->postpone = iosmFileActionSkipped(fsm->action);
> + 	if (fsm->goal == IOSM_PKGINSTALL || fsm->goal == IOSM_PKGBUILD) {
> + 	    /*@-evalorder@*/ /* FIX: saveHardLink can modify fsm */
> +-	    if (S_ISREG(st->st_mode) && st->st_nlink > 1)
> ++	    if (S_ISREG(st->st_mode) && st->st_nlink > 1) {
> + 		fsm->postpone = saveHardLink(fsm);
> ++		if (fsm->postpone < 0) {
> ++		    rc = RPMRC_FAIL;
> ++		    break;
> ++		}
> ++	    }
> + 	    /*@=evalorder@*/
> + 	}
> + if (fsmGetFi(fsm)->mapflags & IOSM_PAYLOAD_LIST) fsm->postpone = 1;
> diff --git a/meta/recipes-devtools/rpm/rpm/rpm-payload-use-hashed-inode.patch b/meta/recipes-devtools/rpm/rpm/rpm-payload-use-hashed-inode.patch
> new file mode 100644
> index 0000000..f054546
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/rpm/rpm-payload-use-hashed-inode.patch
> @@ -0,0 +1,39 @@
> +If we run builds on a filesystem with 64 bit inodes like XFS, we need to
> +map the inode numbers to something 32 bit since the cpio header only allows
> +for 32 bit inode values. If we don't do this:
> +
> +#define SET_NUM_FIELD(phys, val, space) \
> +        sprintf(space, "%8.8lx", (unsigned long) (val)); \
> +        memcpy(phys, space, 8)
> +
> +from cpio.c will print larger that 8 character values and then truncate the
> +LSBs. This generates cpio files where hardlinked files may have the same
> +inode number. The resulting rpms are then corrupted.
> +
> +There is a sperate patch for the crash the identical inode numbers causes

separate

> +when extracting the rpm.
> +
> +Patch taken from http://git.pld-linux.org/?p=packages/rpm.git;a=commitdiff;h=10526c23aac60b7b636e4c93862887dbef8e8f15
> +
> +RP 10/6/2014
> +
> +Upstream-Status: Pending
> +
> +--- rpm-5.4.10/lib/fsm.c~
> ++++ rpm-5.4.10/lib/fsm.c
> +@@ -898,6 +898,7 @@ int fsmMapAttrs(IOSM_t fsm)
> +
> +     if (fi && i >= 0 && i < (int) fi->fc) {
> + 	mode_t perms = (S_ISDIR(st->st_mode) ? fi->dperms : fi->fperms);
> ++	ino_t finalInode = (fi->finodes ? (ino_t)fi->finodes[i] : 0);
> + 	mode_t finalMode = (fi->fmodes ? (mode_t)fi->fmodes[i] : perms);
> + 	dev_t finalRdev = (dev_t)(fi->frdevs ? fi->frdevs[i] : 0);
> + 	rpmuint32_t finalMtime = (fi->fmtimes ? fi->fmtimes[i] : 0);
> +@@ -937,6 +938,7 @@ int fsmMapAttrs(IOSM_t fsm)
> + 	    if ((S_ISCHR(st->st_mode) || S_ISBLK(st->st_mode))
> + 	    && st->st_nlink == 0)
> + 		st->st_nlink = 1;
> ++	    st->st_ino = finalInode;
> + 	    st->st_rdev = finalRdev;
> + 	    st->st_mtime = finalMtime;
> + 	}
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> index 43f46ed..6934749 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> @@ -91,6 +91,8 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
>   	   file://rpm-lsb-compatibility.patch \
>   	   file://rpm-tag-generate-endian-conversion-fix.patch \
>   	   file://rpm-verify-files.patch \
> +	   file://rpm-payload-use-hashed-inode.patch \
> +	   file://rpm-hardlink-segfault-fix.patch \
>   	  "
>
>   # Uncomment the following line to enable platform score debugging
>
>


