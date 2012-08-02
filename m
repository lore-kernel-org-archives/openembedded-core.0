Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sx1sC-0002F7-7y for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 22:19:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q72K8GeQ010901;
	Thu, 2 Aug 2012 21:08:16 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09311-05; Thu,  2 Aug 2012 21:08:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q72K87Lv010894
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 2 Aug 2012 21:08:08 +0100
Message-ID: <1343938089.9756.98.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 02 Aug 2012 21:08:09 +0100
In-Reply-To: <fe3056c0364345c518f66266a7f92c1116763156.1343937363.git.andrei@gherzan.ro>
References: <cover.1343937363.git.andrei@gherzan.ro>
	<fe3056c0364345c518f66266a7f92c1116763156.1343937363.git.andrei@gherzan.ro>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] pseudo: Use fxstatat64 in unlinkat
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
X-List-Received-Date: Thu, 02 Aug 2012 20:19:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Adding seebs to the cc since I suspect he may prefer to merge this
upstream or he may have feedback?

Cheers,

Richard

On Thu, 2012-08-02 at 23:00 +0300, Andrei Gherzan wrote:
> This is done to avoid "Value too large for defined data type" error while trying to
> remove a file > 2GB.
> 
> [Yocto #2881]
> 
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>  .../pseudo/files/unlinkat-use-fxstatat64.patch     |   30 ++++++++++++++++++++
>  meta/recipes-devtools/pseudo/pseudo_1.4.bb         |    5 ++--
>  2 files changed, 33 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-devtools/pseudo/files/unlinkat-use-fxstatat64.patch
> 
> diff --git a/meta/recipes-devtools/pseudo/files/unlinkat-use-fxstatat64.patch b/meta/recipes-devtools/pseudo/files/unlinkat-use-fxstatat64.patch
> new file mode 100644
> index 0000000..987c4c8
> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/files/unlinkat-use-fxstatat64.patch
> @@ -0,0 +1,30 @@
> +pseudo: Use fxstatat64 in unlinkat
> +
> +This is done to avoid "Value too large for defined data type" error while trying to
> +remove a file > 2GB.
> +
> +Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> +Upstream-Status: Pending
> +
> +Index: pseudo-1.4/ports/unix/guts/unlinkat.c
> +===================================================================
> +--- pseudo-1.4.orig/ports/unix/guts/unlinkat.c	2012-07-27 23:30:37.000000000 +0300
> ++++ pseudo-1.4/ports/unix/guts/unlinkat.c	2012-08-02 22:43:26.826645748 +0300
> +@@ -8,7 +8,7 @@
> +  */
> + 	pseudo_msg_t *msg;
> + 	int save_errno;
> +-	struct stat buf;
> ++	struct stat64 buf;
> + 	int old_db_entry;
> + 
> + #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
> +@@ -31,7 +31,7 @@
> + #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
> + 	rc = real_lstat(path, &buf);
> + #else
> +-	rc = real___fxstatat(_STAT_VER, dirfd, path, &buf, AT_SYMLINK_NOFOLLOW);
> ++	rc = real___fxstatat64(_STAT_VER, dirfd, path, &buf, AT_SYMLINK_NOFOLLOW);
> + #endif
> + 	if (rc == -1) {
> + 		return rc;
> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.4.bb b/meta/recipes-devtools/pseudo/pseudo_1.4.bb
> index e1e1f6f..4c21172 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_1.4.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_1.4.bb
> @@ -1,8 +1,9 @@
>  require pseudo.inc
>  
> -PR = "r12"
> +PR = "r13"
>  
> -SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
> +SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
> +           file://unlinkat-use-fxstatat64.patch"
>  
>  SRC_URI[md5sum] = "bc04c6c9d13cfdb789ffc2f3cca9ab08"
>  SRC_URI[sha256sum] = "147fa7b177061a145d330b9e159529a185be94550f123c6acb0d3b75d480c5b4"




