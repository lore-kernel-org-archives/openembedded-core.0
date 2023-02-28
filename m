Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7608DC64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 14:59:19 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.25469.1677596356567154575
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 06:59:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=flyupW5p;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C3C59E000B;
	Tue, 28 Feb 2023 14:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677596354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e3zSjLWpF8fucgqmPD3cFt4t482vVbJPnDmwFJE8LRc=;
	b=flyupW5phihL0OqP1k+7x4WfMx7sT1fzYkXqBJHi5kSmb7CFRgr+jLniDi+e3Y8oMdBqcr
	o7EQ1KfeTBGWuqBgeP+B9s24dc5o3vrnku2QFMjwqNnP+RFCGINRK3qj+YyH9scVmAL0f1
	iB7NN10EOj++BKvq+w0vavvsDhPIdmK2KK8V1gfhh+6L80G44HJ7K49ske9ccYOHftS82Q
	2VtVt8hEWTthBOAZBRhrlSEzBdqbgCtPox2IaTN3LWriM44VOs18EvFUhbyNwnz1F5c5tp
	HQfvlwG8HbQLGHyMa8DS0wdf9/vHmBKwNxZhQZQMWuOV2LZJlJi8Agmh+lC1Fg==
Date: Tue, 28 Feb 2023 15:59:13 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] make: update from 4.4 to 4.4.1
Message-ID: <Y/4WwWQxM7t+PZvp@mail.local>
References: <20230228013619.2211278-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228013619.2211278-1-Randy.MacLeod@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 14:59:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177836

Hello,

This causes:

WARNING: make-4.4.1-r0 do_package_qa: QA Issue: File /usr/bin/make in package make contains reference to TMPDIR [buildpaths]

On 27/02/2023 17:36:19-0800, Randy MacLeod wrote:
> Drop the backported sigpipe.patch
> 
> NEWS:
> Version 4.4.1 (26 Feb 2023)
> 
> This release is primarily a bug-fix release.
> A complete list of bugs fixed in this version is available here:
> 
> https://sv.gnu.org/bugs/index.php?group=make&report_id=111&fix_release_id=110&set=custom
> 
> * WARNING: Backward-incompatibility!
>   In previous releases it was not well-defined when updates to MAKEFLAGS made
>   inside a makefile would be visible.  This release ensures they are visible
>   immediately, even when invoking $(shell ...) functions.  Also, command line
>   variable assignments are now always present in MAKEFLAGS, even when parsing
>   makefiles.
>   Implementation provided by Dmitry Goncharov <dgoncharov@users.sf.net>
> 
> * New feature: Parallel builds of archives
>   Previously it was not possible to use parallel builds with archives.  It is
>   still not possible using the built-in rules, however you can now override
>   the built-in rules with a slightly different set of rules and use parallel
>   builds with archive creation.  See the "Dangers When Using Archives" section
>   of the GNU Make manual, and https://savannah.gnu.org/bugs/index.php?14927
> 
> * Previously target-specific variables would inherit their "export" capability
>   from parent target-specific variables even if they were marked private.  Now
>   private parent target-specific variables have no affect.  For more details
>   see https://savannah.gnu.org/bugs/index.php?61463
> 
> * Disable FIFO jobserver on GNU/Hurd and Cygwin
>   Experimentation shows that the new FIFO-based jobserver doesn't work well on
>   GNU/Hurd or Cygwin: revert these systems to use the pipe-based jobserver.
> 
> * Updates to allow building on OS/2
>   Provided by KO Myung-Hun <komh78@gmail.com>
> 
> * New platform: GNU Make is supported on z/OS
>   Thanks to Igor Todorovski <itodorov@ca.ibm.com> for the patches and testing
>   assistance.
> 
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta/recipes-devtools/make/make/sigpipe.patch | 42 -------------------
>  .../make/{make_4.4.bb => make_4.4.1.bb}       |  3 +-
>  2 files changed, 1 insertion(+), 44 deletions(-)
>  delete mode 100644 meta/recipes-devtools/make/make/sigpipe.patch
>  rename meta/recipes-devtools/make/{make_4.4.bb => make_4.4.1.bb} (70%)
> 
> diff --git a/meta/recipes-devtools/make/make/sigpipe.patch b/meta/recipes-devtools/make/make/sigpipe.patch
> deleted file mode 100644
> index a7270fdbda..0000000000
> --- a/meta/recipes-devtools/make/make/sigpipe.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 92ab2e642d2c04b3dcb5a736ae6193680bfd5f74 Mon Sep 17 00:00:00 2001
> -From: Paul Smith <psmith@gnu.org>
> -Date: Sun, 6 Nov 2022 15:22:02 -0500
> -Subject: * src/main.c (main): [SV 63307] Handle SIGPIPE as a fatal signal
> -
> -Always ignoring SIGPIPE is visible to child processes.
> -
> -Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/make.git/commit/?id=92ab2e642d2c04b3dcb5a736ae6193680bfd5f74]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - src/main.c | 8 +++-----
> - 1 file changed, 3 insertions(+), 5 deletions(-)
> -
> -diff --git a/src/main.c b/src/main.c
> -index eec9365..f2caf7a 100644
> ---- a/src/main.c
> -+++ b/src/main.c
> -@@ -1182,11 +1182,6 @@ main (int argc, char **argv, char **envp)
> -   /* Useful for attaching debuggers, etc.  */
> -   SPIN ("main-entry");
> - 
> --  /* Don't die if our stdout sends us SIGPIPE.  */
> --#ifdef SIGPIPE
> --  bsd_signal (SIGPIPE, SIG_IGN);
> --#endif
> --
> - #ifdef HAVE_ATEXIT
> -   if (ANY_SET (check_io_state (), IO_STDOUT_OK))
> -     atexit (close_stdout);
> -@@ -1265,6 +1260,9 @@ main (int argc, char **argv, char **envp)
> - #ifdef SIGQUIT
> -   FATAL_SIG (SIGQUIT);
> - #endif
> -+#ifdef SIGPIPE
> -+  FATAL_SIG (SIGPIPE);
> -+#endif
> -   FATAL_SIG (SIGINT);
> -   FATAL_SIG (SIGTERM);
> - 
> --- 
> -cgit v1.1
> -
> diff --git a/meta/recipes-devtools/make/make_4.4.bb b/meta/recipes-devtools/make/make_4.4.1.bb
> similarity index 70%
> rename from meta/recipes-devtools/make/make_4.4.bb
> rename to meta/recipes-devtools/make/make_4.4.1.bb
> index 6642c708d8..c73751ddcb 100644
> --- a/meta/recipes-devtools/make/make_4.4.bb
> +++ b/meta/recipes-devtools/make/make_4.4.1.bb
> @@ -4,11 +4,10 @@ require make.inc
>  
>  SRC_URI += " \
>             file://0001-m4-getloadavg.m4-restrict-AIX-specific-test-on-AIX.patch \
> -           file://sigpipe.patch \
>             "
>  
>  EXTRA_OECONF += "--without-guile"
>  
> -SRC_URI[sha256sum] = "581f4d4e872da74b3941c874215898a7d35802f03732bdccee1d4a7979105d18"
> +SRC_URI[sha256sum] = "dd16fb1d67bfab79a72f5e8390735c49e3e8e70b4945a15ab1f81ddb78658fb3"
>  
>  BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.39.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177812): https://lists.openembedded.org/g/openembedded-core/message/177812
> Mute This Topic: https://lists.openembedded.org/mt/97281588/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

