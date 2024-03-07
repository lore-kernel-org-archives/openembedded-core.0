Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91028C48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 08:14:08 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.18499.1709799240456424621
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 00:14:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b4qVfVfz;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d27fef509eso7419351fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 00:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709799238; x=1710404038; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EFP5tYRCQ73HY2y8JIj8uxsM0XMxrggwZAAp0PTCPjk=;
        b=b4qVfVfzhZobBGWMXsC83ZIf0pUw2U0KiaaRHHHfdPXjr6ys94ked97QH1KxHEKucE
         j8x2PCezHyiwMqi3OQvG2pCFbjnVY8FB90tIkzL3QMsMTyYebYahzmK5Yy69+T5YyJbf
         uDfDpIIYeemxnvKOUwhOC0irycb4zyiq2aDaZhwbZrak4Upg8T0SIehEz7tG81ZXoh0I
         7TW3MfgSpARiHnBip4IB0ZQlNu2+IAfJPvX+GF2Zh8Hp7Iy7cgHpOQz1jVXPmdNTtyXD
         SGIov+rWhsdMPU+C9FRIWeHiOILMsdMeg3ae7vBpu3vfgKcB/41qH/21lC4ZauIKxxs9
         bWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709799238; x=1710404038;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EFP5tYRCQ73HY2y8JIj8uxsM0XMxrggwZAAp0PTCPjk=;
        b=bPEqmMusphKGz2LJXoae1t1Rp4s8deuqZzi8phXM/y6KBBntVTyvrzwxgh+TRGT67Y
         RdwrTy9ovamz3YYDizX1zgzwUoLnqyJuEf+wf9vL/BKniKe7Z03LS2U0257UDeXU2K/I
         WJxBSj2dXlzDM6CCbnvDylCd4InlzHBW6BY6BD1HZjABeF8oJo+7PtbgDV0rZ41SVlEp
         SEoropDazEI7ZpUDFzm0CWNwZLsXPSpzV3TuiOOj8bpzkLUqaFAypni7HEk+ihFhRcRO
         trbGGKbleBPuXwBhnZrlEZB8dVZBXyIaRB+V9CvPfRAm04Vox6eyL5lMCghw/ENqhAkT
         5j5w==
X-Gm-Message-State: AOJu0Yy1UWpT2aJASN9PpyBiOmaAlvpcGYCwRS+0nbRKPW40R0f77q+7
	UYGxyDZdtRNLGd84rVAeuBbapppHC3AWXOVEn3Mpoj72JX8qIbtLagr0tQaaOhGgqQnOGCNyYcA
	oDWI1ukjegF4fCVUZWGtu50/GWNE=
X-Google-Smtp-Source: AGHT+IHzywzqN8Di1f4P6WR5qvQT5BMDZAPH5SizA9qfkn/BWmiY+aAWDuHJShIAqgjWSlRTAYfq1dnLmftSzK1hs+I=
X-Received: by 2002:a2e:8817:0:b0:2d2:a3ae:b339 with SMTP id
 x23-20020a2e8817000000b002d2a3aeb339mr775210ljh.48.1709799238060; Thu, 07 Mar
 2024 00:13:58 -0800 (PST)
MIME-Version: 1.0
References: <20240307064856.879596-1-changqing.li@windriver.com>
In-Reply-To: <20240307064856.879596-1-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Mar 2024 09:13:46 +0100
Message-ID: <CANNYZj_Vk4i4MmJ-GQ_ry-VUrNCp7p50fwUZ_QtW2jNyxH8zzg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] dnf: remove log_lock.pid before exit
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 08:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196776

Thanks, the patch is ok, but you need to actually open a dnf pull
request with the patch, and not just the ticket (also 'Submitted'
means that the patch was actually provided to upstream). It's okay if
upstream then rejects the patch. We'll at least try to convince them
:)

Alex

On Thu, 7 Mar 2024 at 07:49, Changqing Li
<changqing.li@eng.windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> dnf has a bug, refer [1], it causes that log_lock.pid may not removed
> after dnf exit. And for native dnf, since we change the lock file path
> to /, it will never be removed, and make the rootfs not clean,refer
> [2][3].  This patch is a workaround to fix above issue.
>
> [1] https://github.com/rpm-software-management/dnf/issues/1963
> [2] https://git.openembedded.org/openembedded-core/commit/?id=742a1b71249f4da1c8d8e13e270b0eb6128a3f66
> [3] https://github.com/rpm-software-management/dnf/blob/master/etc/tmpfiles.d/dnf.conf
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  ...n.py-remove-log_lock.pid-before-exit.patch | 41 +++++++++++++++++++
>  meta/recipes-devtools/dnf/dnf_4.18.2.bb       |  3 +-
>  2 files changed, 43 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/dnf/dnf/0001-main.py-remove-log_lock.pid-before-exit.patch
>
> diff --git a/meta/recipes-devtools/dnf/dnf/0001-main.py-remove-log_lock.pid-before-exit.patch b/meta/recipes-devtools/dnf/dnf/0001-main.py-remove-log_lock.pid-before-exit.patch
> new file mode 100644
> index 0000000000..ae036cbbd6
> --- /dev/null
> +++ b/meta/recipes-devtools/dnf/dnf/0001-main.py-remove-log_lock.pid-before-exit.patch
> @@ -0,0 +1,41 @@
> +From bdf17281385cf33ad59267fe75a9e427e6e2ffc4 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 7 Mar 2024 14:03:07 +0800
> +Subject: [PATCH] main.py: remove log_lock.pid before exit
> +
> +dnf has a bug, refer [1], it causes that log_lock.pid may not removed
> +after dnf exit. And for native dnf, since we change the lock file path
> +to /, it will never be removed, and make the rootfs not clean,refer
> +[2][3].  This patch is a workaround to fix above issue.
> +
> +[1] https://github.com/rpm-software-management/dnf/issues/1963
> +[2] https://git.openembedded.org/openembedded-core/commit/?id=742a1b71249f4da1c8d8e13e270b0eb6128a3f66
> +[3] https://github.com/rpm-software-management/dnf/blob/master/etc/tmpfiles.d/dnf.conf
> +
> +Upstream-Status: Submited [ report to https://github.com/rpm-software-management/dnf/issues/1963]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + dnf/cli/main.py | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/dnf/cli/main.py b/dnf/cli/main.py
> +index 2a7f92d54..2f672cff2 100644
> +--- a/dnf/cli/main.py
> ++++ b/dnf/cli/main.py
> +@@ -200,6 +200,12 @@ def user_main(args, exit_code=False):
> +
> +     errcode = main(args)
> +     if exit_code:
> ++        for arg in args:
> ++            if arg.startswith("--installroot="):
> ++                root=arg.split("=")[1]
> ++                if os.path.exists(os.path.join(root, "log_lock.pid")):
> ++                    os.unlink(os.path.join(root, "log_lock.pid"))
> ++                break
> +         sys.exit(errcode)
> +     return errcode
> +
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/dnf/dnf_4.18.2.bb b/meta/recipes-devtools/dnf/dnf_4.18.2.bb
> index dc0c18be5e..7770c9d7e0 100644
> --- a/meta/recipes-devtools/dnf/dnf_4.18.2.bb
> +++ b/meta/recipes-devtools/dnf/dnf_4.18.2.bb
> @@ -17,7 +17,8 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
>             file://0001-set-python-path-for-completion_helper.patch \
>             "
>
> -SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
> +SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch \
> +                               file://0001-main.py-remove-log_lock.pid-before-exit.patch"
>
>  SRCREV = "1c43d0999178d492381ad0b43917ffd9c74016f8"
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196770): https://lists.openembedded.org/g/openembedded-core/message/196770
> Mute This Topic: https://lists.openembedded.org/mt/104782944/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

