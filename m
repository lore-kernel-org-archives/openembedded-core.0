Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B7F2C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 17:58:24 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.30061.1644429503036689551
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:58:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gly1gDNu;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id o12so2282756qke.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/tE1saSLdsJ/z23/IZAFnlujX5/vdQq+nGTloY3IUUY=;
        b=Gly1gDNuJhiHN52Bg37ziRHzlj5zlZ4iOj9tJrG3n9mPWarXeUj136JVH27UaHBalF
         IJH4ylRW0Ocb0BMNVP8wKSHpsxp69WUSsWgvy01eb+JFdlsOXRtSkcFqFBQ1Q27cvmMy
         V4Ob8dikZsa2WNP4NQilwNCD/F4xpr5nQxyiw9fqocivdPFWaR0SvXl3we2OoeaYNFLI
         aE3ZfRC5aEWGd3EKkUDskQesBF00+RxyMTY8TVaPxggoD1XmWdqKwWBZk5siJGYqjU2x
         LJ9d/IIp6cqjJR6VmqV7SdcEbgsdaqOHF+gsnbrLZfKySYxWGT+v6yMJj8gHL4wqRkZ9
         SK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/tE1saSLdsJ/z23/IZAFnlujX5/vdQq+nGTloY3IUUY=;
        b=gdhDJxzYSmS8ixMGyY4g1GhLuJNGCJOytYTs9ih8+aQjkz3Uy6z2JwOaoW1eZJ/kC+
         DQQDVScH6/+1ok1CGNqujIR3ogywQCVvqncHd/U8YNcH1D/GzG+qDYkM4HlQG99YcLl1
         XExIQd7eDpmqh8AN0RcCDtI/8T5ogKPnXrVvvpaDElB1hbgkkRtqkoAq70v/KySi4MLN
         iNathShK9RXmg0szEGVnEohjkVTs0clLvc8VrzT1/iq1E2jF1ALvCwz8YlhGmQcLND23
         tE00/QTQcqi/ShWkLlROTyBtkXyOC/rwJXfZL9Ixz0c/ozXAwR0I5plwOQiliiRg+nNk
         PP+w==
X-Gm-Message-State: AOAM530/BT5eK+WvISWa/dYwH4udQ2WPpZGqYlTJK+VuEdnkVum8U7N7
	g2RdOXjxjeinzYIM3nl4Wzla6ibN4+tUJtr1jOE=
X-Google-Smtp-Source: 
 ABdhPJxONW/W7CV+L2G3aGms0U+QcnxBnldW/ot9OjRuF6E158/6DAqaT+xRWYLiwhRuS6qqsmLMrEP0Ef1O8M1oGeQ=
X-Received: by 2002:a05:620a:2010:: with SMTP id
 c16mr1795101qka.149.1644429501994;
 Wed, 09 Feb 2022 09:58:21 -0800 (PST)
MIME-Version: 1.0
References: <20220209173014.1389378-1-jdmason@kudzu.us>
 <20220209173014.1389378-6-jdmason@kudzu.us>
In-Reply-To: <20220209173014.1389378-6-jdmason@kudzu.us>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Feb 2022 09:57:56 -0800
Message-ID: 
 <CAMKF1sppTrtazYKeNscLgttP-dekm=uqvygGFfx-2PLdjkhPDA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] poky-tiny: enable qemuarmv5/qemuarm64 and
 cleanups
To: Jon Mason <jdmason@kudzu.us>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 17:58:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161583

On Wed, Feb 9, 2022 at 9:30 AM Jon Mason <jdmason@kudzu.us> wrote:
>
> Add support for qemuarmv5 and qemuarm64, and remove qemuarm specific
> entries, as it should be generic now.
>
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> index 2c81e3c00506..e146ecddceb9 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> @@ -1,5 +1,4 @@
>  KBRANCH ?= "v5.15/standard/tiny/base"
> -KBRANCH:qemuarm  ?= "v5.15/standard/tiny/arm-versatile-926ejs"
>
>  LINUX_KERNEL_TYPE = "tiny"
>  KCONFIG_MODE = "--allnoconfig"
> @@ -15,16 +14,16 @@ DEPENDS += "openssl-native util-linux-native"
>  KMETA = "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>
> -SRCREV_machine:qemuarm ?= "67b4c868eafbd63c437d0e79523c3bdc5f3aa834"
>  SRCREV_machine ?= "f46816a75d738acbe4b1211153badf2f8e412780"
>  SRCREV_meta ?= "26e884f8c2d22607e97900d22ad52a290f555fd7"
>
> +

spurious line :)

>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
>
> -COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
> +COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5"
>
>  # Functionality flags
>  KERNEL_FEATURES = ""
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161574): https://lists.openembedded.org/g/openembedded-core/message/161574
> Mute This Topic: https://lists.openembedded.org/mt/89026732/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

