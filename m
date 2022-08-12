Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9026C00140
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 20:25:21 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.1992.1660335914137430236
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 13:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g6ts8mzh;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: armccurdy@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id tl27so3828609ejc.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 13:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=tt2Z/H6zyQSuyxkkSniENGTQYhVmIjNVXd7gEvmYdSM=;
        b=g6ts8mzhXk+HYa5IMp+TairgyEwVVtynzm6QMMsNfLWgywAx+taAMuEfGVS92BHjyn
         d5v18RmBkAwk+LpCYnNnjNZKKZV6lCsGo5jviYUxqL1oUd136wxJr7HxjuYy3a9SlFBH
         hUd8SL8/qHxReKO8DzC1pPR5VdIKtDP7aPJAmLKrxW9wF2vuRYl/VPbIjUSAWcQX5skC
         Nzq9vlmzhuwkqckbDd7z7L93MJSIReOu9S0FSKiAPfKRB1qWolYsIPlIPaqeKHxC0eGt
         sBQ83Bbn/l7CrBf99/C66DeIkDpVWYh51Q3yYNBdw8mDa3zFTsiwVByBF4QlP9UtF/Th
         x83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=tt2Z/H6zyQSuyxkkSniENGTQYhVmIjNVXd7gEvmYdSM=;
        b=IfeWRx2wRSZOs/H699S822zZQ9JB9H7gSVg0ldfZ7X8Gg8VXc5yov93T4HtZFyPiCL
         wNsbnQxatfOGpitmy41QGtufdRjSbrobMESMe5f6y5oTRKqJbH0Vu8PSKXVoqA/bg2zp
         d+caZEtepgwEKhB9IdvL4iDqdEK9PYHzGxKgd0S1t7Osswi3RY0Tmm+dajDNWFhmuzYH
         AOVOFLxT8pq1i7sstZxhDF+WNOjcSME0O5a+tKjRdZgWwNu8sxRV1uPSCt/45w2kS87e
         pBUfQwqaRljQs1sUE/2t+M7gUmgDO8WzjtdDjKNjztFTzUKc0oj3ajYCRFFI5P/XTI3/
         VL9w==
X-Gm-Message-State: ACgBeo0ZYfgzg92LgLY7mWAywog5YwAQGJWcrUsHwjx6LzXRYK50zi82
	3fa7HcMevosNrn6MGuFsSOIs2afOaF8Jtz/bzpc=
X-Google-Smtp-Source: 
 AA6agR6mjm90YzQy7cy+Ag+SNNx4/Exq7pCYE3DH0UImrXQGoejmSY5yeAoT9JvO1nlDoyauvHM5hJ+ZXNAWwxQskv4=
X-Received: by 2002:a17:907:6e1b:b0:732:25eb:745c with SMTP id
 sd27-20020a1709076e1b00b0073225eb745cmr3638475ejc.297.1660335912519; Fri, 12
 Aug 2022 13:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220811055433.819522-1-raj.khem@gmail.com>
In-Reply-To: <20220811055433.819522-1-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 12 Aug 2022 13:24:55 -0700
Message-ID: 
 <CAJ86T=W5VXFR5Z+1VCrddFS-y4roaoqpU2QzQiSEGzuRpL=9QQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] zip: Enable largefile support based on
 distro feature
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Aug 2022 20:25:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169291

On Wed, Aug 10, 2022 at 10:54 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> The configure test tries to run a binary during build to determine
> largefile support, which wont work in cross-compile mode, therefore
> specify it when largefile DISTRO_FEATURE is on.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-extended/zip/zip_3.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
> index 07a67b96348..d560c83464b 100644
> --- a/meta/recipes-extended/zip/zip_3.0.bb
> +++ b/meta/recipes-extended/zip/zip_3.0.bb
> @@ -29,6 +29,8 @@ CVE_CHECK_IGNORE += "CVE-2018-13410"
>  # Not for zip but for smart contract implementation for it
>  CVE_CHECK_IGNORE += "CVE-2018-13684"
>
> +CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '-DLARGE_FILE_SUPPORT', '', d)}"

This should be hardcoded to enable LFS. The largefile distro feature
isn't used in oe-core (ie disabling LFS is not supported or even
possible anymore). The distro feature should be removed completely at
some point... when recipes in meta-oe etc have stopped referring to
it. See release notes from OE 2.3 (ie May 2017):

  https://docs.yoctoproject.org/2.3/ref-manual/ref-manual.html#migration-2.3-miscellaneous-changes

>  # zip.inc sets CFLAGS, but what Makefile actually uses is
>  # CFLAGS_NOOPT.  It will also force -O3 optimization, overriding
>  # whatever we set.
> --
> 2.37.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169227): https://lists.openembedded.org/g/openembedded-core/message/169227
> Mute This Topic: https://lists.openembedded.org/mt/92953016/3619030
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [armccurdy@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

