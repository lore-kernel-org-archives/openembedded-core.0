Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 347F0CA0FFD
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 09:55:19 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.47653.1756720513956852573
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 02:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oi0pbh9D;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-70ddadde2e9so34003806d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 02:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756720513; x=1757325313; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T/ZGcwvG5sYJFFRqcewouNEjbr8CAs7oVwxnm1D/29Q=;
        b=Oi0pbh9DEz2OUqc3yM5YvtOTgoUmPS54BwyTAldquoJVNuh2tj5UBGb4oAGlns0pNf
         bcOEiifWuLFgWJ1ygfpJ1d9aQGm7P/T848NXICYW0UThauliy5KXd+nMCORWJ3DW/EJa
         bocUxvs+rymkYbP2RVblEzFcYDYcohRTq8TBCozd3k/ij07KLHUOWtLv7Gr2CDwQsX5A
         lx4L1vi/hGakV0qzbUHclQUj1YfNwyTwnZd/uXJEFL7tKakZOusS6lc1TmkVFx7NEeKc
         DRf+jsawbAJRANOFNPxMFXgeZ/TkcqihZd2JBoAdljPuCsn/3+TOnnWJB+FcI16nu56a
         1NOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756720513; x=1757325313;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/ZGcwvG5sYJFFRqcewouNEjbr8CAs7oVwxnm1D/29Q=;
        b=iVh7FblLhzwxg6LP1fuKt4hIiq+IeQx0HW/5TgtYG1IEWSTuRmxKB2fdju/5rEpxi6
         9EFR5hvn/lLCjz2Au8eI5pp5ZHLW6sVJMls/1P49XuExCX/FI1kZQs8/EFhBMVAo2cHg
         9JQfcLFOIc8Utx3FUQIQbkNC0R0jW0CznR+PjkN1tDlHsjCk9AbnT6+cwi8ErVWl75Zc
         lU3WoBHDytLTPEx1/KFhJzGqQ9/l06GzOhFZW+pjrnZc2LvJxe9YvEQVcMvroOH1nxYU
         9r51VASeantASB6j5qzp06vJGW0emjcZvAIM/Rt4N70VpcCm6u0NVyCLnK/uQpM3YSVl
         +lHg==
X-Gm-Message-State: AOJu0YwPA7kHw+LXX/0jO3No3fGsgeI20yW5ZF5WHtr3Buf+KwVtUrpQ
	Bkf97wT6j/tSPyet5jtLTk1Cvp777VD4tCqySoL9G6vxYG+SWTdZxHIhDkI3RdmhDjgj8Ye2TxT
	lHYkAQ3X1u+cqY64LabKbglRzxayJTh0=
X-Gm-Gg: ASbGnctwhYvqrPi44TWEseUJEVbEobLtrxYT+kvfOe4TCS6YgZV2o75NEogh5/h/dpg
	iW/B8M8+8ueTsn1Bxpf2/FBnUfbMc6pEi9jkLhAGm812TANDYjQ3livYeJ4YZnbLGmHEZx6p7am
	enfmvhRLMU0gPHRNsISqQHS3tc6oOtw5N/d6WWdlVdIzBfwzLqVLTW2rmTeaactmy/PcHq64zFQ
	OnobW+tTtryEfhVGHLUjzX6NEIksgjVFJBz2rnkd51gpT92PUWLDzBc1qpKcu/R1pzm3hptDC8Q
	wSi7zaRT8Oh8sdBp
X-Google-Smtp-Source: AGHT+IHAVS26Rq4xOrdGzrTfMV6UQS0ZCgWslIgNPsr6eHQu+VX0GxGYa0MM+THBKp/h74ypSSpPIB9kmymP/jLLOtE=
X-Received: by 2002:a05:6214:c21:b0:70d:ecf7:2102 with SMTP id
 6a1803df08f44-70fac76e538mr73720776d6.15.1756720512776; Mon, 01 Sep 2025
 02:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <Q8cx.1756482238242443264.LmeF@lists.openembedded.org>
In-Reply-To: <Q8cx.1756482238242443264.LmeF@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Sep 2025 11:55:01 +0200
X-Gm-Features: Ac12FXz4r69y_oVur0AIHf-FUzIQDOaycbDCY7x8KflVtI-ND1wPhlyQxOQ-Yq0
Message-ID: <CANNYZj9vDDxkC9KSfuY6G4mmY46GNTKcDs3cPnz6pR4E+-FuMQ@mail.gmail.com>
Subject: Re: [OE-core] Port package-group-meta-filesystems fix to Kirkstone #kirkstone
To: logan.grosz@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 09:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222651

You can propose a patch on openembedded-devel list. Prefix with [kirkstone]

Alex

On Fri, 29 Aug 2025 at 17:44, Logan Grosz via lists.openembedded.org
<logan.grosz=gmail.com@lists.openembedded.org> wrote:
>
> Hi, I was wondering if this patch ported to Kirkstone? I believe there is no workaround for this issue since `PACKAGE_ARCH` needs to be set _before_ inheriting `packagegroup.bbclass`.
>
>
> From c67eab376bc4f5277f0f30356c11411b2f1272dc Mon Sep 17 00:00:00 2001
> From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> Date: Sun, 22 May 2022 20:23:18 +0200
> Subject: [PATCH] packagegroup-meta-filesystems: fix build issue
> The packagegroup has to be arch dependent to address build failure:
> ERROR: packagegroup-meta-filesystems-1.0-r0 do_package_write_rpm: An allarch packagegroup shouldn't depend on packages which are dynamically renamed (fuse to libfuse2)
> ERROR: packagegroup-meta-filesystems-1.0-r0 do_package_write_rpm: An allarch packagegroup shouldn't depend on packages which are dynamically renamed (fuse-dev to libfuse-dev)
> Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../packageconfigs/packagegroup-meta-filesystems.bb              | 1 +
>  1 file changed, 1 insertion(+)
> diff --git a/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb b/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb
> index 75591c31fa..1954b5979c 100644
> --- a/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb
> +++ b/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb
> @@ -1,5 +1,6 @@
>  SUMMARY = "Meta-filesystem packagegroups"
>
> +PACKAGE_ARCH = "${TUNE_PKGARCH}"
>  inherit packagegroup
>
>  PROVIDES = "${PACKAGES}"
> --
> 2.48.1
>
>
> Thanks!
> Logan
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222618): https://lists.openembedded.org/g/openembedded-core/message/222618
> Mute This Topic: https://lists.openembedded.org/mt/114954434/1686489
> Mute #kirkstone:https://lists.openembedded.org/g/openembedded-core/mutehashtag/kirkstone
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

