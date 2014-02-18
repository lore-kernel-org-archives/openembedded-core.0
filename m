Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3D91B6E908
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 19:08:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Feb 2014 11:08:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,502,1389772800"; d="scan'208";a="485361389"
Received: from unknown (HELO [10.255.13.243]) ([10.255.13.243])
	by orsmga002.jf.intel.com with ESMTP; 18 Feb 2014 11:08:41 -0800
Message-ID: <5303AFB8.2090605@linux.intel.com>
Date: Tue, 18 Feb 2014 11:08:40 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Zhu Yanjun <yanjun.zhu@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1392632257-4669-1-git-send-email-yanjun.zhu@windriver.com>
In-Reply-To: <1392632257-4669-1-git-send-email-yanjun.zhu@windriver.com>
Subject: Re: [PATCH] pseudo-1.5.1: keep install command directory mode
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
X-List-Received-Date: Tue, 18 Feb 2014 19:08:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/17/2014 02:17 AM, Zhu Yanjun wrote:
> From: "yanjun.zhu" <yanjun.zhu@windriver.com>
>
> CQID:LIN5-17788
>
> when install command sets the created directory mode, pseudo will change
> the mode of the directory to 0700 incorrectly.
>
> Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
> ---
>   .../pseudo-1.5.1-install-directory-mode.patch      |   10 ++++++++++
>   meta/recipes-devtools/pseudo/pseudo_1.5.1.bb       |    3 ++-
>   2 files changed, 12 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-directory-mode.patch
>
> diff --git a/meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-directory-mode.patch b/meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-directory-mode.patch
> new file mode 100644
> index 0000000..02e3da2

There is no patch header here, also have you checked with Peter S on 
this change?

> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-directory-mode.patch
> @@ -0,0 +1,10 @@
> +--- a/ports/unix/guts/mkdirat.c
> ++++ b/ports/unix/guts/mkdirat.c
> +@@ -25,6 +25,7 @@
> + 		stat_rc = base_fstatat(dirfd, path, &buf, AT_SYMLINK_NOFOLLOW);
> + #endif
> + 		if (stat_rc != -1) {
> ++			buf.st_mode = PSEUDO_DB_MODE(buf.st_mode, mode);
> + 			pseudo_client_op(OP_MKDIR, 0, -1, dirfd, path, &buf);
> + 		} else {
> + 			pseudo_debug(1, "mkdir of %s succeeded, but stat failed: %s\n",
> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
> index bc92856..64115ca 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
> @@ -1,11 +1,12 @@
>   require pseudo.inc
>
> -PR = "r4"
> +PR = "r5"
>
No PR Bumps needed any longer

Sau!


>   SRC_URI = " \
>       http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
>       file://0001-pseudo_has_unload-add-function.patch \
>       file://shutdownping.patch \
> +    file://pseudo-1.5.1-install-directory-mode.patch \
>   "
>
>   SRC_URI[md5sum] = "5ec67c7bff5fe68c56de500859c19172"
>

