Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E105D7F27B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 19:55:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x71JtDPn024174
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Aug 2019 12:55:13 -0700 (PDT)
Received: from [192.168.10.15] (172.25.59.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 1 Aug 2019 12:55:12 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
References: <20190801175545.63356-1-jason.wessel@windriver.com>
Message-ID: <2ffc17d7-b964-56fb-119c-ebf2b633af34@windriver.com>
Date: Thu, 1 Aug 2019 14:55:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190801175545.63356-1-jason.wessel@windriver.com>
Subject: Re: [PATCH] pseudo: Upgrade to latest to fix openat() with a directory symlink
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
X-List-Received-Date: Thu, 01 Aug 2019 19:55:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Looks like the checksum license changed between the prior commit and now.  So I'll send a v2, because we don't want to break the master branch of oe-core.

Cheers,
Jason.

On 8/1/19 12:55 PM, Jason Wessel wrote:
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
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>   meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
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



