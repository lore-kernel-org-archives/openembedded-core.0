Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEBA9C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 16:15:21 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.103868.1701792912761459012
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 08:15:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MqMwQp5n;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 698A41BF207;
	Tue,  5 Dec 2023 16:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701792910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w1LUNpuJEOLtm6IC+PWeB8HBZKBNA7yager0LhiNEk0=;
	b=MqMwQp5nFL2f9V/p5X/MXtw+x+tx2J/yNB7mcRFpk+bMeINEMd9+C96sd3Rnj8bQJC7gKU
	AFi8UIM61OCsgXtyjMMPpo79l7Y/nxkm6kRyqne4XgAvXl3jXK5HfY9OZ2FXum87aZWmz2
	nAncm5qkPdbKUqOuDh0dQIKQ8o0d6jcHwKUCLaYeltwLRSHOit1YZtYT7eca4mTjwpyQ3U
	lpg1CHb18FVn5at355Ur2toS/+B6IeXyac91EvNsgHpxwtj2szsNKR4bUpaOFpf6qT4ZcM
	8J8vseHTBhusUuUW03n55X4CUhcfVK/ci/1IrGnTMVfG6ezRgqQ/gpQKB2ojuw==
Date: Tue, 5 Dec 2023 17:15:10 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: liezhi.yang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] nfs-utils: Upgrade 2.6.3 -> 2.6.4
Message-ID: <2023120516151051240b68@mail.local>
References: <cover.1701758555.git.liezhi.yang@windriver.com>
 <934ad5f4e633993781ba459bfda8183d95749e00.1701758555.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <934ad5f4e633993781ba459bfda8183d95749e00.1701758555.git.liezhi.yang@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 16:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191846

Hello,

This fail for musl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/8237/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/8267/steps/12/logs/stdio

On 04/12/2023 22:44:10-0800, Robert Yang via lists.openembedded.org wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
> 
> Remove backported patch 0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  ...event-and-libsqlite3-checked-when-nf.patch | 80 -------------------
>  ...{nfs-utils_2.6.3.bb => nfs-utils_2.6.4.bb} |  3 +-
>  2 files changed, 1 insertion(+), 82 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
>  rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.6.3.bb => nfs-utils_2.6.4.bb} (97%)
> 
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
> deleted file mode 100644
> index 5afc714f190..00000000000
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
> +++ /dev/null
> @@ -1,80 +0,0 @@
> -From b62a3fe424026b73ec6b1934483b16863c7dff23 Mon Sep 17 00:00:00 2001
> -From: Wiktor Jaskulski <wjaskulski@adva.com>
> -Date: Thu, 11 May 2023 15:28:23 -0400
> -Subject: [PATCH] configure.ac: libevent and libsqlite3 checked when nfsv4 is
> - disabled
> -
> -Upstream-Status: Backport
> -(http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=bc4a5deef9f820c55fdac3c0070364c17cd91cca)
> -
> -Signed-off-by: Steve Dickson <steved@redhat.com>
> -Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ----
> - configure.ac | 38 +++++++++++++++-----------------------
> - 1 file changed, 15 insertions(+), 23 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 4ade528d..519cacbf 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -335,42 +335,34 @@ AC_CHECK_HEADER(rpc/rpc.h, ,
> -                 AC_MSG_ERROR([Header file rpc/rpc.h not found - maybe try building with --enable-tirpc]))
> - CPPFLAGS="${nfsutils_save_CPPFLAGS}"
> - 
> -+dnl check for libevent libraries and headers
> -+AC_LIBEVENT
> -+
> -+dnl Check for sqlite3
> -+AC_SQLITE3_VERS
> -+
> -+case $libsqlite3_cv_is_recent in
> -+yes) ;;
> -+unknown)
> -+   dnl do not fail when cross-compiling
> -+   AC_MSG_WARN([assuming sqlite is at least v3.3]) ;;
> -+*)
> -+   AC_MSG_ERROR([nfsdcld requires sqlite-devel]) ;;
> -+esac
> -+
> - if test "$enable_nfsv4" = yes; then
> --  dnl check for libevent libraries and headers
> --  AC_LIBEVENT
> - 
> -   dnl check for the keyutils libraries and headers
> -   AC_KEYUTILS
> - 
> --  dnl Check for sqlite3
> --  AC_SQLITE3_VERS
> --
> -   if test "$enable_nfsdcld" = "yes"; then
> - 	AC_CHECK_HEADERS([libgen.h sys/inotify.h], ,
> - 		AC_MSG_ERROR([Cannot find header needed for nfsdcld]))
> --
> --    case $libsqlite3_cv_is_recent in
> --    yes) ;;
> --    unknown)
> --      dnl do not fail when cross-compiling
> --      AC_MSG_WARN([assuming sqlite is at least v3.3]) ;;
> --    *)
> --      AC_MSG_ERROR([nfsdcld requires sqlite-devel]) ;;
> --    esac
> -   fi
> - 
> -   if test "$enable_nfsdcltrack" = "yes"; then
> - 	AC_CHECK_HEADERS([libgen.h sys/inotify.h], ,
> - 		AC_MSG_ERROR([Cannot find header needed for nfsdcltrack]))
> --
> --    case $libsqlite3_cv_is_recent in
> --    yes) ;;
> --    unknown)
> --      dnl do not fail when cross-compiling
> --      AC_MSG_WARN([assuming sqlite is at least v3.3]) ;;
> --    *)
> --      AC_MSG_ERROR([nfsdcltrack requires sqlite-devel]) ;;
> --    esac
> -   fi
> - 
> - else
> --- 
> -2.41.0
> -
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
> similarity index 97%
> rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb
> rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
> index 35cf6af6d46..31290f6d44c 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
> @@ -30,11 +30,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
>             file://bugfix-adjust-statd-service-name.patch \
>             file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
>             file://clang-warnings.patch \
> -           file://0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch \
>  	   file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
>  	   file://0001-tools-locktest-Use-intmax_t-to-print-off_t.patch \
>             "
> -SRC_URI[sha256sum] = "38d89e853a71d3c560ff026af3d969d75e24f782ff68324e76261fe0344459e1"
> +SRC_URI[sha256sum] = "01b3b0fb9c7d0bbabf5114c736542030748c788ec2fd9734744201e9b0a1119d"
>  
>  # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
>  # pull in the remainder of the dependencies.
> -- 
> 2.42.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191800): https://lists.openembedded.org/g/openembedded-core/message/191800
> Mute This Topic: https://lists.openembedded.org/mt/102987610/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

