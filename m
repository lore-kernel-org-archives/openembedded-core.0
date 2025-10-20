Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0490CCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 12:09:36 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.16603.1760962166920392537
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 05:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NCLYdRyp;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-87c20106cbeso61309846d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 05:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760962166; x=1761566966; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LB7J3bOTcp4O9ymiEC2BsxVSacM24oEMNDatsXTWexo=;
        b=NCLYdRypVqMRXDDn/ESB+23K/1cLd+eqdTMnWyfepd57BK/bioWN+dU34VFgbjFLKx
         HwdJGYZpDGpKZg4NrIqQCAfG91qZiZYPJVUwm/aeG55E7w47VnM3cQdQtflBBQFLFyO6
         PYjmRbnkg18VOj1G97RhORMfD4kjxIm3Ar12Hl8P9WCHc4EpxIuQ4E4ffcUZzNKeWENQ
         vakyKWYxrpS0NJl9EC4//cbq7bLqNy2fzVEGLBbGYeiynFfz7ln360Xb6LP/67CKGmFe
         APxadgzDjHjBzOJV9Hp0k2EOGZAne4kdT3UTmstYib7b802ryXVHT6KZDcivF4Vid9kh
         uVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760962166; x=1761566966;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LB7J3bOTcp4O9ymiEC2BsxVSacM24oEMNDatsXTWexo=;
        b=YfQSNl1Bn9o24jC8wFm7mG9NIoL4gAAxCzwR1lxDNleFHR9aClgSRu3s13LHvEB4EW
         7Uo9fE4TbWU+ce/XriPEeEqQ3/9aj5LIo4dSUoi9c4cWj1QG6SnjD3q8VDtSdiOmxYUR
         G46sAZTesL26Uug4Jm2pgXe6oK0UflAE/lzTwXLKzNRCd1XeXERQvEopULOlV1X8adAT
         d5pBWyR0rmaPLqgM4GuKrctTVvMya7VDxwzixC7VyzOkRx56yosXwD9Xnv3K+8/nqvMB
         xLYa5AYF2e4RnKohj9IBGXqu60Qk0E3HL5fdSjYIv+CI7nD7XcqDgP0/WTCaH4tWCInj
         TMZg==
X-Gm-Message-State: AOJu0Yzyp9wnUbnFiyhYs9iaPmbPSl2c8XD/OB2Fe0gRhFAxg5XEqhyq
	jhorqUZrRU7lokTYbTGS28lp2m1fKKYnT3VVvHxicTHe+Nx2xjzLVZuYuKTmBKsI2c+73Gz65xN
	b7VC5AsNVMjdnh6qSDY1lgcZtoFnDGYI=
X-Gm-Gg: ASbGnctV63edeGnwNs7naOxyb4uvRniOeNWg0F3IBkdiLx1ZOirLXMLBckGj5lAZ6Li
	Z3gt1woB4aPer8peJ3tUdlAnBUVxBcTJ+pClh7BGz23Ht1maG2By1qNlpAJewSobFtjEds4e2w+
	8Z19JSS/3TOBzJdih0Ddks9wQit/v41N1Bz26VUaDDm0pBDiQ1f86z1EJrrKA9jA7dDmIAQdXAl
	jB0TmdEvaqPZBkqhXrQfVr3Q/bYBmDdAR1V0i71bbad4WJhIS4xQEnSNO5AK7H5ywkTnAuFKQkx
	azFhfOPPqiyEkIxv8eK1Db26RfWwMqmaEyp7vnY4OIr5PeGPkNYqVmxz5adjLmXVA+2n/vEltu2
	w4ou4GYnbJGzLzBXkK/Uys9TeO9Yv
X-Google-Smtp-Source: AGHT+IFGDTQV9oKq+k1opv2ulYU+5ecqDpGpJakN8/zxd9OfkgBHiq+W26liTmz9/XIzx1a0GCIQgR85u3Bm7myuCEg=
X-Received: by 2002:a05:6214:19cc:b0:87c:2967:fd52 with SMTP id
 6a1803df08f44-87c296800c8mr138409416d6.17.1760962165851; Mon, 20 Oct 2025
 05:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <DDM7O4JOPS0Y.1YQP1AS47WNL7@bootlin.com> <20251019153922.27208-1-dani.barra25@gmail.com>
 <20251019153922.27208-2-dani.barra25@gmail.com>
In-Reply-To: <20251019153922.27208-2-dani.barra25@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 20 Oct 2025 14:09:13 +0200
X-Gm-Features: AS18NWDIBC8OWyNggdmwvEzF2-nb9488FRilgKzEyvMmf9v5EFDrLtZ-quw59oI
Message-ID: <CANNYZj_MZwiUEYPJ2XpMeKpKPm0rDMNguDn+7RnW10H3Z=xuxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Fstab xattrs: This update ensures that fstab
 xattrs are correctly updated without adding a lock to the database.
To: dani.barra25@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 12:09:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225116

On Sun, 19 Oct 2025 at 23:45, dani.barra25 via lists.openembedded.org
<dani.barra25=gmail.com@lists.openembedded.org> wrote:

> +                    pseudo_prefix = cls.__get_pseudo(native_sysroot, new_rootfs, new_pseudo)
> +
> +                    # Shutdown any existing pseudo server
> +                    # This ensures no other processes are using the database
> +                    shutdown_cmd = "%s -S" % pseudo_prefix
> +                    exec_native_cmd(shutdown_cmd, native_sysroot)
> +
> +                    # Database is not locked anymore
> +                    # Repairs inodes related to fstab. This way xattrs and metadata is correctly applied to the new file
> +                    repair_cmd = "%s -B" % pseudo_prefix
> +                    exec_native_cmd(repair_cmd, native_sysroot)
> +

Is it possible to describe how to reproduce and observe the issue that
this patch aims to fix? This snippet makes me *very* nervous as pseudo
is used by mulitple bitbake tasks in parallel, and doing shutdowns and
repairs in the middle of it can blow up spectacularly.

Alex

