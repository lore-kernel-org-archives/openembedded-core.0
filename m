Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2C4D860807
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 21:37:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x71LbRBX002221
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 1 Aug 2019 14:37:27 -0700 (PDT)
Received: from [192.168.10.15] (172.25.59.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 1 Aug 2019 14:37:26 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <seebs@seebs.net>
References: <20190801200354.119252-1-jason.wessel@windriver.com>
Message-ID: <8934e4e0-aaf6-5eb6-5d1b-355063bee94a@windriver.com>
Date: Thu, 1 Aug 2019 16:37:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190801200354.119252-1-jason.wessel@windriver.com>
Subject: Re: [PATCH v2] pseudo: Upgrade to latest to fix openat() with a directory symlink [NAK]
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
X-List-Received-Date: Thu, 01 Aug 2019 21:37:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

While this is a real problem.  We need to put this patch on hold.

It seems to have caused really odd problems with the oe link management that were not there previously, such as:


WARNING: pinentry-1.1.0-r0 do_package_qa: QA Issue: pinentry: /usr/bin/pinentry is owned by uid 5002, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]

I'll continue to look into the problem.

Cheers,
Jason.

On 8/1/19 3:03 PM, Jason Wessel wrote:
> While working with ostree disk generation in conjunction with wic, I
> found a problem with pseudo where it tried to resolve a symlink when
> it shouldn't, based on openat() flags.  I narrowed down the problem to
> a simple c program to reproduce the issue:
>
> int main()
> {
>      /* Tested with: gcc -Wall -o app app.c ; echo "no pseudo" ; ./app ; echo "pseudo"; pseudo ./app */
>      system("rm -rf tdir tlink");
>      system("mkdir tdir");
>      system("ln -s tdir tlink");
>      DIR *dir = opendir(".");
>      int dfd = dirfd(dir);
>
>      int target_dfd = openat (dfd, "tlink", O_RDONLY | O_NONBLOCK | O_DIRECTORY | O_CLOEXEC | O_NOFOLLOW);
>      if (target_dfd == -1) {
>          printf("This is right\n");
>      } else {
>          printf("This is broken\n");
>      }
>      return 0;
> }
>
> Many thanks to Peter Seebach for fixing the problem in the pseudo code
> to use the same logic which was already there for the
> AT_SYMLINK_NOFOLLOW.
>
> Also updated is the license MD5 checksum since the master branch of
> pseudo has had teh SPDX data updated.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>   meta/recipes-devtools/pseudo/pseudo.inc    | 2 +-
>   meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
> index 8b05735bb1..8b34909726 100644
> --- a/meta/recipes-devtools/pseudo/pseudo.inc
> +++ b/meta/recipes-devtools/pseudo/pseudo.inc
> @@ -4,7 +4,7 @@
>   
>   SUMMARY = "Pseudo gives fake root capabilities to a normal user"
>   HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/pseudo"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=a1d8023a6f953ac6ea4af765ff62d574"
>   SECTION = "base"
>   LICENSE = "LGPL2.1"
>   DEPENDS = "sqlite3 attr"
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
> index 51db84c4d4..3350c3fabd 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -8,7 +8,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo \
>              file://toomanyfiles.patch \
>              "
>   
> -SRCREV = "3fa7c853e0bcd6fe23f7524c2a3c9e3af90901c3"
> +SRCREV = "097ca3e245200c4a4333964af59a106c42ff3bca"
>   S = "${WORKDIR}/git"
>   PV = "1.9.0+git${SRCPV}"
>   



