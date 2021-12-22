Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E86BC433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 09:09:10 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.17146.1640164149548407658
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 01:09:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d036uB0r;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id g132so1102236wmg.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 01:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=0Df0bIBJCqpBVK6TAEe/DQLBjnV6mCTL8d/jF4CRRqo=;
        b=d036uB0rEgmNqrrpmECAOCWWeFZTc8inKL6e7jtOWIeCyJE49or3Wl05u3Wm8E5haR
         xssbLZkl24qQT8UiLoK2f67AcYLk0Fnamv6+uuCvfXyAvMIhB2nLkzSW6COt7krQxGV9
         vA/bTRB8kMmran5m5qQCtyVXeTG6oD1IkvYZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0Df0bIBJCqpBVK6TAEe/DQLBjnV6mCTL8d/jF4CRRqo=;
        b=YcwU2lVsromujc2ogupW6RvL+CgWNkTZmS31xOkDQlAwLh9zBIzAnIuL/7pGmSnx0r
         rmk0rJJ3ItQgs508AJ63BfyAw65OfB2asok64eJBX7CDVgowmLFOutH5OeS7FNjPFteT
         TDRzTRD+CJCQE0eXIJaI+jnP/GYucxcxTtjjqQgF3gYns91I6SKVdMo1x3ayLYT/OdTp
         Munketjc67kx2Ch2bqG6JZjfwZw28npWBkcnpEyG4zbrAfbXlVUcpwMX6iHtBMQpBrCy
         U4FJJXmwS7cI1hx2h4PyQomWkWDFuuWeFo4uWIKZLjdM7zP73y3yQ3k5fCk0JM7s/fS1
         Uxkw==
X-Gm-Message-State: AOAM531F9uVhBVgRYrIlDgZE4CIEZjnczJ18Ubn+qx8bPz0Nkzgvt3nX
	QuvZuqulDnOLrY6MnNh5qx72bA==
X-Google-Smtp-Source: 
 ABdhPJxoSPzhDMlFOhMVntkmeBxRWLjL9qbtHaT3GnJipHAKYk3brQy/3iEF6t5aKVpvObfb3SEvvw==
X-Received: by 2002:a05:600c:1d07:: with SMTP id
 l7mr241591wms.12.1640164147901;
        Wed, 22 Dec 2021 01:09:07 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:cfd6:850f:93ba:e301?
 ([2001:8b0:aba:5f3c:cfd6:850f:93ba:e301])
        by smtp.gmail.com with ESMTPSA id
 n1sm1404940wri.46.2021.12.22.01.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 01:09:07 -0800 (PST)
Message-ID: 
 <0137a7550504afc03ed41d8bc7e7fe26e7dba9d5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] package.bbclass: don't skip kernel and
 kernel modules
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <Saul.Wold@windriver.com>,
	openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com
Date: Wed, 22 Dec 2021 09:09:04 +0000
In-Reply-To: <20211221190809.89882-3-saul.wold@windriver.com>
References: <20211221190809.89882-1-saul.wold@windriver.com>
	 <20211221190809.89882-3-saul.wold@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Dec 2021 09:09:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159943

On Tue, 2021-12-21 at 11:08 -0800, Saul Wold wrote:
> Stop ignoring or skipping the kernel and kernel modules code in the
> split debug and striping functions, this will allow create_spdx to
> process the kernel and modules.
> 
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  meta/classes/package.bbclass | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 84eafbd529..4b7fe4f1e1 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -390,10 +390,6 @@ def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir,
>      dvar = d.getVar('PKGD')
>      objcopy = d.getVar("OBJCOPY")
>  
> -    # We ignore kernel modules, we don't generate debug info files.
> -    if file.find("/lib/modules/") != -1 and file.endswith(".ko"):
> -        return (file, sources)
> -
>      newmode = None
>      if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
>          origmode = os.stat(file)[stat.ST_MODE]
> @@ -1147,7 +1143,7 @@ python split_and_strip_files () {
>  
>                  if file.endswith(".ko") and file.find("/lib/modules/") != -1:
>                      kernmods.append(file)
> -                    continue
> +
>                  if oe.package.is_static_lib(file):
>                      staticlibs.append(file)
>                      continue
> @@ -1165,7 +1161,7 @@ python split_and_strip_files () {
>                      continue
>                  # Check its an executable
>                  if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH) \
> -                        or ((file.startswith(libdir) or file.startswith(baselibdir)) and (".so" in f or ".node" in f)):
> +                        or ((file.startswith(libdir) or file.startswith(baselibdir)) and (".so" in f or ".node" in f)) or (f.startswith('vmlinux') or ".ko" in f):
>  
>                      if cpath.islink(file):
>                          checkelflinks[file] = ltarget

edgerouter:
https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/4513
https://autobuilder.yoctoproject.org/typhoon/#/builders/111/builds/2507/steps/11/logs/stdio

qemux86 musl cryptodev:
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/4512/steps/11/logs/stdio

qemux86-64 musl cryptodev:
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/4526

qemux86 cryptodev:
https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/4476/steps/11/logs/stdio

selftest failure in linux-yocto:
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/2981/steps/14/logs/stdio
(file truncated makes it sound like a race?)

stap kernel module failure:
https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/3395/steps/13/logs/stdio
(race/intermittent?)

another kernel module race:
https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/4480/steps/16/logs/stdio

Cheers,

Richard




