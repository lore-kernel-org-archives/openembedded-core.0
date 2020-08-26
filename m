Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.3493.1598472285335125639
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 13:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: randy.macleod@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 07QK4hHt002010
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 26 Aug 2020 13:04:43 -0700 (PDT)
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 26 Aug
 2020 13:04:42 -0700
Subject: Re: [oe-core][PATCH 1/1] pseudo: fix renaming to self
To: Joe Slater <joe.slater@windriver.com>,
        <openembedded-core@lists.openembedded.org>, Seebs <seebs@seebs.net>
References: <20200826185857.24292-1-joe.slater@windriver.com>
 <20200826185857.24292-2-joe.slater@windriver.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <ef96587f-41d7-d285-27e8-cd6f78737028@windriver.com>
Date: Wed, 26 Aug 2020 16:04:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200826185857.24292-2-joe.slater@windriver.com>
X-Originating-IP: [172.25.44.3]
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-CA


Add Seebs.

Joe,
How did you test this change?

../Randy

On 2020-08-26 2:58 p.m., Joe Slater wrote:
> Pseudo tests for an item being renamed to itself only after
> information about it has been deleted.  Move the test to before
> we change the database.
>
> Note that pseudo does not support renameat2(), but neither does
> glibc.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>   .../pseudo/files/rename.patch                 | 73 +++++++++++++++++++
>   meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
>   2 files changed, 74 insertions(+)
>   create mode 100644 meta/recipes-devtools/pseudo/files/rename.patch
>
> diff --git a/meta/recipes-devtools/pseudo/files/rename.patch b/meta/recipes-devtools/pseudo/files/rename.patch
> new file mode 100644
> index 0000000000..bc344db3b5
> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/files/rename.patch
> @@ -0,0 +1,73 @@
> +pseudo: fix renaming to self
> +
> +The pseudo rename guts test for an item being renamed to
> +itself, only after information about it has been deleted.
> +We move the test to before we play with the database.
> +
> +Note that pseudo does not support renameat2().
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +
> +
> +--- a/ports/unix/guts/rename.c
> ++++ b/ports/unix/guts/rename.c
> +@@ -29,6 +29,14 @@
> + 	newrc = base_lstat(newpath, &newbuf);
> + 	oldrc = base_lstat(oldpath, &oldbuf);
> +
> ++	/* nothing to do for a "rename" of a link to itself */
> ++	if (newrc != -1 && oldrc != -1 &&
> ++	    newbuf.st_dev == oldbuf.st_dev &&
> ++	    newbuf.st_ino == oldbuf.st_ino) {
> ++		pseudo_debug(PDBGF_OP, "rename: paths are the same\n");
> ++		return real_rename(oldpath, newpath);
> ++        }
> ++
> + 	errno = save_errno;
> +
> + 	/* newpath must be removed. */
> +@@ -58,12 +66,6 @@
> + 		return rc;
> + 	}
> + 	save_errno = errno;
> +-	/* nothing to do for a "rename" of a link to itself */
> +-	if (newrc != -1 && oldrc != -1 &&
> +-	    newbuf.st_dev == oldbuf.st_dev &&
> +-	    newbuf.st_ino == oldbuf.st_ino) {
> +-		return rc;
> +-        }
> +
> + 	/* rename(3) is not mv(1).  rename(file, dir) fails; you must provide
> + 	 * the corrected path yourself.  You can rename over a directory only
> +--- a/ports/unix/guts/renameat.c
> ++++ b/ports/unix/guts/renameat.c
> +@@ -41,6 +41,14 @@
> + 	newrc = base_fstatat(newdirfd, newpath, &newbuf, AT_SYMLINK_NOFOLLOW);
> + #endif
> +
> ++	/* nothing to do for a "rename" of a link to itself */
> ++	if (newrc != -1 && oldrc != -1 &&
> ++	    newbuf.st_dev == oldbuf.st_dev &&
> ++	    newbuf.st_ino == oldbuf.st_ino) {
> ++		pseudo_debug(PDBGF_OP, "renameat: paths are the same\n");
> ++		return real_renameat(olddirfd, oldpath, newdirfd, newpath);
> ++        }
> ++
> + 	errno = save_errno;
> +
> + 	/* newpath must be removed. */
> +@@ -71,12 +79,6 @@
> + 		return rc;
> + 	}
> + 	save_errno = errno;
> +-	/* nothing to do for a "rename" of a link to itself */
> +-	if (newrc != -1 && oldrc != -1 &&
> +-	    newbuf.st_dev == oldbuf.st_dev &&
> +-	    newbuf.st_ino == oldbuf.st_ino) {
> +-		return rc;
> +-        }
> +
> + 	/* rename(3) is not mv(1).  rename(file, dir) fails; you must provide
> + 	 * the corrected path yourself.  You can rename over a directory only
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
> index 9a22304bba..8d8cf8d523 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -4,6 +4,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
>              file://0001-configure-Prune-PIE-flags.patch \
>              file://fallback-passwd \
>              file://fallback-group \
> +           file://rename.patch \
>              "
>   
>   SRCREV = "8efb082863ff0ceec7b7e46f9a44750e12f48039"


-- 
# Randy MacLeod
# Wind River Linux

