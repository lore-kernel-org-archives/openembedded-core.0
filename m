Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A0EBC433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 11:30:00 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.9211.1636630199684501089
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 03:30:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ITXOgb/k;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id c4so9207614wrd.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 03:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=hbAWuBHG6N7v2JDB0ImGVvrfcfDLu1iCreWAYtWxnJA=;
        b=ITXOgb/khF+EAgNGVEycBr/4gOoMCdU4UQ2TvHS9bXfEhNIjxX8uB7YLaBjmBuaaoF
         k75Hwlg167sqV9eXNAtwFIS7U7eyNXC33OCoW6mzIZARDIBzm42Cs1SYqa61heHt7ySh
         E9qO7ReUuGVl95Kjj8POzlSasF3rkXWJneKn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=hbAWuBHG6N7v2JDB0ImGVvrfcfDLu1iCreWAYtWxnJA=;
        b=TBh9FM1bWaG03WJz/OlMeTVgvGd9CS26x6jZpkrR0K8g19g7z96gXpoJdUbldlq0Ee
         S+orek+Ak2hnMPNvnFwUARkbRXN6suRTrnlaoGLXDKvkSpeIeDO6Hk2q4z418LL/MFbK
         bDMZ/dDskl0MwnY/4nvMEH2Eb66uoJBwW6AdOvKErgIWy08nZ3GWIE7XMA0k7ufBQ0W9
         NYQuTyJRzl81KFNGCjMy1C6ek9fxwC/GBjJpkgtYC1gNztlqLCB4ZI6wLAMfCB6Rca+e
         CyPqfpbJo5gpoluDSHrR8r9NVlKq2yR1Ll1AkMqAkkbQZiPankfCnxzoYsZTq+/wgCb9
         N8aA==
X-Gm-Message-State: AOAM533DvQWXQxpr1jgK4HR3lna0ccnn4FzOdMAxJYGZsI50y92onEID
	3/Tjq/5rRCmzFZbkTZv2Z9pZyA==
X-Google-Smtp-Source: 
 ABdhPJy18kx3mhA49WQLgAyAZfnYnLq8G14gCwRqz3JNqlaGMosDe+2yLxFtUEy72WNL/SY34EFhgw==
X-Received: by 2002:a05:6000:143:: with SMTP id
 r3mr8104782wrx.236.1636630197881;
        Thu, 11 Nov 2021 03:29:57 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b19:11f4:a3d9:cabc?
 ([2001:8b0:aba:5f3c:b19:11f4:a3d9:cabc])
        by smtp.gmail.com with ESMTPSA id
 q26sm2679628wrc.39.2021.11.11.03.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 03:29:57 -0800 (PST)
Message-ID: 
 <91a6b862e1e0f695271ee2e11820412aa29bef2a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [pseudo] pseudo_fix_path: do not expand symlinks in
 /proc
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sakib Sajal <sakib.sajal@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 11 Nov 2021 11:29:56 +0000
In-Reply-To: <20211111101143.145750-1-sakib.sajal@windriver.com>
References: <20211111101143.145750-1-sakib.sajal@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 11:30:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158168

On Thu, 2021-11-11 at 05:11 -0500, Sakib Sajal wrote:
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
> - run_tests: all tests passed (3 tests check the new code path).
>              Checked test output to make sure the new codepath gets executed.
> - perftest: measured time before and after applying the patch
>             had insignificant differences (roughly ~1%)
> - world build: completed without warning/errors
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  pseudo_util.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/pseudo_util.c b/pseudo_util.c
> index b6980c2..b9de81e 100644
> --- a/pseudo_util.c
> +++ b/pseudo_util.c
> @@ -29,6 +29,11 @@
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
> @@ -678,6 +683,18 @@ pseudo_append_element(char *newpath, char *root, size_t allocated, char **pcurre
>  	 */
>  	if (!leave_this && is_dir) {
>  		int is_link = S_ISLNK(buf->st_mode);
> +
> +		/* do not expand symlinks in the proc filesystem, since they may not be real
> +		 * check if newpath starts with "/proc/"
> +		 * strlen of "/proc/" = 6
> +		 */
> +		if (is_link && (strncmp("/proc/", newpath, 6) == 0)) {
> +			pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE,
> +				"pae: '%s' is procfs symlink, not expanding\n",
> +				newpath);
> +			is_link = 0;
> +		}
> +
>  		if (link_recursion >= PSEUDO_MAX_LINK_RECURSION && is_link) {
>  			pseudo_diag("link recursion too deep, not expanding path '%s'.\n", newpath);
>  			is_link = 0;

I merged this into the pseudo repo and put an updated pseudo recipe into a
master-next build. This resulted in issues:

https://autobuilder.yoctoproject.org/typhoon/#/builders/122/builds/485/steps/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/116/builds/961
https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/922

I've stopped the build since it is clear there is something wrong.

Cheers,

Richard



