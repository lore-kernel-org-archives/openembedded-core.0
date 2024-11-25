Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4025BD5806D
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 11:59:43 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.17037.1732535980046667066
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 03:59:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cUH/iB92;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6ee7a400647so44794897b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 03:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732535979; x=1733140779; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ow7jmKIAtyk2x/zxSF41bYOVQavUJCXSoajGDgvySMU=;
        b=cUH/iB92NbmEundueQNkkJV5+0U3v4KweLsJin6nd3NB4iNeiE5yuvGHljgHiciPxB
         kxLvqQzXvyreUbFQJ4ci3Y5mJ5zCCut+CaRVzNFTDVrdVJZ/Y1jctEqA+W/Rpke3zqpX
         ipwvGh20L3DY7teV0Fczp6wpaKBIvtesY7udeG4r6KwOL7m/aGdmEly9Iu/jNPiLgkU1
         UAvQ4W++mR5luUdJmsWcmUhVXV4/F90CUPyICP6rbI7hiuYPgFq0xWgzWZRRHMhnPhhb
         0d0yTeMi4b66TcwBE3DiNIikddviCqgco7WFnuXZIeJswOVFtHCGPAqUPZrTDG/Amdzb
         NqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732535979; x=1733140779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ow7jmKIAtyk2x/zxSF41bYOVQavUJCXSoajGDgvySMU=;
        b=GLku/iboU+p17lll6CtBmJ+s+3ta3enMZlfE7iwQvzkTuaG6LTgz6kwmU5N2CleDOr
         TebtkOCLAPpcnXo6mb5qPKYTsOQXzwBwF1wJtfVOdw9aeqAaOcyBqUilfjD9mKLx65Yi
         m2I7LCaTwzOsMFIV6mOX14KLcC8LWDpAjvSTSBY4mWZwvNbGD9jEx/MilpBUy1MhnS48
         MFJuvaNNL3qiKT1MRx29gd92tVArau1rPFc7HmBzz/uRciwvvObn1jPnMzmdU+zAolKq
         P5RusgYFI+GCBDkHenatVc0OIt8a1ECieaIhfgiT2F3FwRwLBqDdL4h3VdFBLMIuhpmb
         T1pQ==
X-Gm-Message-State: AOJu0YyS3QkDjWnuEBdMhZ59fnTlh8QrCvCb2Voi+ofjaRVpmDL+bZUM
	fm4fYJS1T09/AED0nzWVIO+/Agv/nX6d0OLyXpqtlns8iQ1uuS9xK+0AeaADFdaz4P301Cn/8tR
	mi0WLMhOX52TgV6cxS495uvY+zwk=
X-Gm-Gg: ASbGncvGfnoKOWtL3n/147dXhk7Gw7s3jXOn22bnZlbrg8RMTgHOj6f4AnWwhUrkqoo
	h/JmARQ5sHZL0e7JcASbwbWTpj/Nte5vE6YTip8dj9NuszSG5Ykap1IFexrSISYhWMQ==
X-Google-Smtp-Source: AGHT+IGaJ4d7VvJB/yczOpTPbHc8Ihl/qOO34tiK3rSIi6Rm/xJiT84gvYPHlFS9cPx44AclcpmmxmJSPkTVnCLqTng=
X-Received: by 2002:a05:690c:3501:b0:6e7:e68b:f883 with SMTP id
 00721157ae682-6eee0a2fa53mr107821527b3.39.1732535979185; Mon, 25 Nov 2024
 03:59:39 -0800 (PST)
MIME-Version: 1.0
References: <2719f782df504dd4bfd191575ee52d01@diehl.com>
In-Reply-To: <2719f782df504dd4bfd191575ee52d01@diehl.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 25 Nov 2024 12:59:28 +0100
Message-ID: <CANNYZj-p6ch3wqdNDuXbK-7L3rphXRR5Egw9PsM+nC+vOhNJoA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] linux-yocto: add WITH Linux-syscall-note to LICENSE
To: denis.osterland@diehl.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 11:59:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207747

Thanks, the patchset is fine, but I wonder if there are other recipes
in oe-core which would benefit from WITH suppport?

Alex

On Mon, 25 Nov 2024 at 12:58, Denis OSTERLAND-HEIM via
lists.openembedded.org
<denis.osterland=diehl.com@lists.openembedded.org> wrote:
>
> According to Linux COPYING file this exception is made to GPL v2.
>
> Signed-off-by: Denis Osterland-Heim <denis.osterland@diehl.com>
> ---
>  meta/files/common-licenses/Linux-syscall-note | 25 +++++++++++++++++++
>  meta/recipes-kernel/linux/linux-yocto.inc     |  2 +-
>  2 files changed, 26 insertions(+), 1 deletion(-)
>  create mode 100644 meta/files/common-licenses/Linux-syscall-note
>
> diff --git a/meta/files/common-licenses/Linux-syscall-note
> b/meta/files/common-licenses/Linux-syscall-note
> new file mode 100644
> index 0000000000..9abdad71fa
> --- /dev/null
> +++ b/meta/files/common-licenses/Linux-syscall-note
> @@ -0,0 +1,25 @@
> +SPDX-Exception-Identifier: Linux-syscall-note
> +SPDX-URL: https://spdx.org/licenses/Linux-syscall-note.html
> +SPDX-Licenses: GPL-2.0, GPL-2.0+, GPL-1.0+, LGPL-2.0, LGPL-2.0+, LGPL-2.1,
> LGPL-2.1+, GPL-2.0-only, GPL-2.0-or-later
> +Usage-Guide:
> +  This exception is used together with one of the above SPDX-Licenses
> +  to mark user space API (uapi) header files so they can be included
> +  into non GPL compliant user space application code.
> +  To use this exception add it with the keyword WITH to one of the
> +  identifiers in the SPDX-Licenses tag:
> +    SPDX-License-Identifier: <SPDX-License> WITH Linux-syscall-note
> +License-Text:
> +
> +   NOTE! This copyright does *not* cover user programs that use kernel
> + services by normal system calls - this is merely considered normal use
> + of the kernel, and does *not* fall under the heading of "derived work".
> + Also note that the GPL below is copyrighted by the Free Software
> + Foundation, but the instance of code that it refers to (the Linux
> + kernel) is copyrighted by me and others who actually wrote it.
> +
> + Also note that the only valid version of the GPL as far as the kernel
> + is concerned is _this_ particular version of the license (ie v2, not
> + v2.2 or v3.x or whatever), unless explicitly otherwise stated.
> +
> +                       Linus Torvalds
> +
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> b/meta/recipes-kernel/linux/linux-yocto.inc
> index 0132fcffb3..3de8318c39 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -1,6 +1,6 @@
>  SUMMARY = "Linux kernel"
>  SECTION = "kernel"
> -LICENSE = "GPL-2.0-only"
> +LICENSE = "GPL-2.0-only + Linux-syscall-note"
>  HOMEPAGE = "https://www.yoctoproject.org/"
>
>  LIC_FILES_CHKSUM ?= "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> --
> 2.45.2
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207746): https://lists.openembedded.org/g/openembedded-core/message/207746
> Mute This Topic: https://lists.openembedded.org/mt/109769586/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

