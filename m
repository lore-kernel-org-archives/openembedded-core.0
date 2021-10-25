Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 966A8C433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 18:19:28 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.887.1635185967569098592
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 11:19:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bs5SbcV5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id k7so9778292wrd.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 11:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=x26YNdi8l2x2CMEcsFod9CwOmX5RNqiqxQ+JPD59uwo=;
        b=bs5SbcV5r/eNozeGnqRP+vFLPWHQxXApQ2pktXg51QsH/4RIIf3Q5ODfT5N8JUWddu
         nlj7fCvAJBscajeHIdsQri7ihF6+5Ozz0SCncvh1bSlvkXHf+aBo5mR5nydSxdF8wPZ0
         ZiYEBkXhV7R3t28GSr0G9kdMhtsWJe5Jkr+2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=x26YNdi8l2x2CMEcsFod9CwOmX5RNqiqxQ+JPD59uwo=;
        b=JtWgxQL1IB2UaFkEbvWnDiqctrtqPdbSijsFetzotrMVGkR6sqzWxSgnPrnC80XzTI
         YvZTEgVLP/8wwoUKP5nD0y99li0J6D97kn3VIjsfMXJ7bHlb8+ffGxBhY62ArpZC4hn7
         AOa4/Kh/qRnUTiHgRKNIt8S44iytZS2PSldHZR70Z/vO23IaA9Gd9eJ9RfB8XWnaICM6
         42FuP7X22uIlSGUPU2GGRA1oADiO+JviyvkRXNlAsI8nh7chkAa3kdMcMPdICxNJzgSp
         +LZk4xHIIS3RW9IlulWZ/bFPwbpKMzAGWM9PEPyfGkE2dGm8ujzverJxKr1b8qWkIW+L
         ykfA==
X-Gm-Message-State: AOAM533MrbqXG+f7doxponma7pSmXOARhH9V0ZvLrB8fOIdPQcyPnNaX
	4FVJmnfRm0FsSdgGdzuMwhy6zTQ0wo5jxw==
X-Google-Smtp-Source: 
 ABdhPJxzu4RicTl/eStwazjAwoAfNYZwLQyCvcruEh+UkOssSmR/Rr6FevHwJRQBs7NAGlgYfyKKEg==
X-Received: by 2002:adf:9d89:: with SMTP id p9mr17546074wre.155.1635185966020;
        Mon, 25 Oct 2021 11:19:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5fb2:414a:7b8b:6fb3?
 ([2001:8b0:aba:5f3c:5fb2:414a:7b8b:6fb3])
        by smtp.gmail.com with ESMTPSA id
 w10sm9646282wrp.25.2021.10.25.11.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 11:19:25 -0700 (PDT)
Message-ID: 
 <a1a8788509c485d2d8a575c2adcc7521d0d32ece.camel@linuxfoundation.org>
Subject: Re: [OE-core] [pseudo] pseudo_fix_path: do not expand symlinks in
 /proc
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sakib Sajal <sakib.sajal@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 25 Oct 2021 19:19:22 +0100
In-Reply-To: <20211025180307.24635-1-sakib.sajal@windriver.com>
References: <20211025180307.24635-1-sakib.sajal@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 18:19:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157355

On Mon, 2021-10-25 at 14:03 -0400, Sakib Sajal wrote:
> From: Matt Cowell <matt.cowell@nokia.com>
> 
> Some symlinks in /proc, such as those under /proc/[pid]/fd,
> /proc/[pid]/cwd, and /proc/[pid]/exe that are not real and should not
> have readlink called on them.  These look like symlinks, but behave like
> hardlinks.  Readlink does not return actual paths.  Previously
> pseudo_fix_path would expand files such as /dev/stdin to paths such as
> /proc/6680/fd/pipe:[1270830076] which do not exist.
> 
> This issue affects:
> - deleted files
> - deleted directories
> - fifos
> - sockets
> - anon_inodes (epoll, eventfd, inotify, signalfd, timerfd, etc)
> 
> Testing:
> - run_tests: all tests passed. Checked the test output to make
>              sure the new codepath gets executed.
> - perftest: measured time before and after applying the patch
>             had insignificant differences (roughly ~1%)
> - world build: completed without warning/errors
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  pseudo_util.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/pseudo_util.c b/pseudo_util.c
> index b6980c2..b35a34e 100644
> --- a/pseudo_util.c
> +++ b/pseudo_util.c
> @@ -21,6 +21,8 @@
>  #include <sys/time.h>
>  #include <unistd.h>
>  #include <limits.h>
> +#include <sys/vfs.h>
> +#include <linux/magic.h>
>  
>  /* see the comments below about (*real_regcomp)() */
>  #include <dlfcn.h>
> @@ -29,6 +31,11 @@
>  #include "pseudo_ipc.h"
>  #include "pseudo_db.h"
>  
> +/* O_PATH is defined in glibc 2.16 and later only */
> +#ifndef O_PATH
> +#define O_PATH          010000000
> +#endif
> +
>  struct pseudo_variables {
>  	char *key;
>  	size_t key_len;
> @@ -678,6 +685,26 @@ pseudo_append_element(char *newpath, char *root, size_t allocated, char **pcurre
>  	 */
>  	if (!leave_this && is_dir) {
>  		int is_link = S_ISLNK(buf->st_mode);
> +
> +		/* do not expand symlinks in the proc filesystem, since they may not be real */
> +		if (is_link) {
> +			struct statfs sfs;
> +			int fd;
> +
> +			/* statfs follows symlinks, so use fstatfs */
> +			fd = open(newpath, O_CLOEXEC | O_PATH | O_NOFOLLOW);
> +			if (-1 != fd) {
> +				if (0 == fstatfs(fd, &sfs) && sfs.f_type == PROC_SUPER_MAGIC) {
> +					pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE,
> +						"pae: '%s' is procfs symlink, not expanding\n",
> +						newpath);
> +					is_link = 0;
> +				}
> +
> +				close(fd);
> +			}
> +		}
> +


Above this code, there is a call:

	if (!pseudo_real_lstat || (pseudo_real_lstat(newpath, buf) == -1)) {

so we do have a statfs structure populated. Can we test buf.f_type ==
PROC_SUPER_MAGIC on that instead of calling open()? Or does that not contain the
right information?

Cheers,

Richard



