Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F20BC54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 13:44:50 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web11.102079.1674827087683213255
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jan 2023 05:44:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WK0V6xFd;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id b4so285498ioj.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 05:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Jhpvd5p2kN6/jN8d2mcKgozIV6pt6J1jYa+Ktk1oeY=;
        b=WK0V6xFdkpx2iAUkjXClcs9hBo1zgZUrFbPLx/Eo/k+ox+0UumRmWt9wQXCjMBYSJI
         TH12LpbEHepP/TFMDUW1mPYgVn4RC9BkHUs2eGBuGyeqKJSFr+JEe0izuZEEW6haRWqn
         sSXFyUiqCNp+CyCygPW1rpoeVaCvbFBDEZiC9jOP+bnVdQ7L0LxEO7iR+TyoiEraUl5v
         xSY15GVSqkFVBdb7YyGXyj0+hBfeQmvLMB5a+FhM6hZyLjAs8tfSJ93A4yWysxNoG4Y5
         gXsQUQB+f8FcMjFULlUKPHi+3f4drljG9k2e0eyDuCLfbKSsgGdeESo1ASs6ki+kkXpC
         pfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Jhpvd5p2kN6/jN8d2mcKgozIV6pt6J1jYa+Ktk1oeY=;
        b=WXCLxEyyFNlVJIF9ujq+R2dj4c9GkShjPs3ID/YK9ODxLENfdUYt8hOoR8IWq/79gL
         z/diKFAWSFp8ShyXEDuiKxxjC5Sirwh60MKnNuXMPzp1fFHvDQbYJL4Lq42IvPxOLz4B
         pqqBaiPTGG5XXaEVQ+dHF5eUfohI0X9e9syT398QBTzExc9TgK7GFdOAXyc8zX9sCz5r
         ZMTWOTv/9oPjbpigVhurDlqL6g6Aj7yeuXUzDNGFVldnwlHQHWmbfjxjblDxCqOCIwW1
         I/IcSitqdHZRbU7q6iGipsg91cf0lQpNd7hcN0wbmCDkde56Pr13GJoplrRkxUwZTJoQ
         loiQ==
X-Gm-Message-State: AFqh2koDQb7qNVZWthLzzN2VJmrHEwx9/eCd+uRokztMPY6NByYk4/GK
	EzK2gE7RosOVMzXJCSKaJDCpP9xSJ0Y4fi/FXGI=
X-Google-Smtp-Source: AMrXdXsjTKOZxXVhBkAHCzoUcL6MrghBIrxIumscP8oSgX88odjIQ033Qc3eYhmN7OH783H22puUUYn9eScs8ykvxmw=
X-Received: by 2002:a02:1642:0:b0:374:25b8:6fb with SMTP id
 a63-20020a021642000000b0037425b806fbmr5523356jaa.28.1674827086846; Fri, 27
 Jan 2023 05:44:46 -0800 (PST)
MIME-Version: 1.0
References: <20230127102729.2623316-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230127102729.2623316-1-richard.purdie@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 27 Jan 2023 08:44:35 -0500
Message-ID: <CADkTA4MYR-AL_VVR0g4iudqS8-4f2=xsNLQ7UDKCPiVamDn-Ow@mail.gmail.com>
Subject: Re: [PATCH] make-mod-scripts: Ensure kernel build output is deterministic
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 13:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176446

On Fri, Jan 27, 2023 at 5:27 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> The definitions in linux-kernel-base are needed to ensure the generated headers
> are consistent. This was a small step that was missing from the previous
> changes to linux-kernel-base as both kernel-devsrc and make-mod-scripts
> need this information defined consistently.
>

Aha! yes, another spot that the generation of header files could be triggered.

It was more likely this recipe that was doing the clobbering,
triggered by devsrc and racing with the kernel. Since devsrc doesn't
do any building, i couldn't find a path where it did it alone.

I consider this the root cause, when coupled with 6.1 doing more
aggressive generation of the headers than previous kernel versions.

Bruce

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> index 9afd6714f0d..38282e58f10 100644
> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://www.yoctoproject.org/"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
>
> -inherit kernel-arch
> +inherit kernel-arch linux-kernel-base
>  inherit pkgconfig
>
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> --
> 2.37.2
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

