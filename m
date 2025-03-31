Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC1EC3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 14:11:52 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.53003.1743430309518362026
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 07:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z7hgnc8G;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so5361499e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 07:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743430307; x=1744035107; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrPNMi+oC+pCNZ+h5lGSIdvkz5H1GWJyTI6hkL15dls=;
        b=Z7hgnc8Gx26XJ+eqDcVToZa2Sb6Jn2FyYvPDd0S8yw/9q2PP+5WQlJraviBN22YkmP
         to48hIDiybZfbPvq1qC+Qf4GpnbXnPCEAauyaDZphmZRpYc3VetBvC1bFXT3049hRit9
         NM+Y+JhcAuZsbCXo8PbS2wRKCtZ7RXgj9iDaYfcU4qT2FtLOlI/qi6OTaHbUsXwcNGzd
         X5lwhy2R0VNiDycrWLUp8nqG9Tgq+s4BEsj2g5hsnY3JWQktpBJMj1R6+m3L/sBKEivX
         qTSG83plkVd20eLSc3t35gEW7WrWz0WuoZ7yQhHVcEP9WhpaDxlTdrK8Fnctj7+NGNKx
         GFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743430307; x=1744035107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrPNMi+oC+pCNZ+h5lGSIdvkz5H1GWJyTI6hkL15dls=;
        b=jEqXL0S9ZryTVupwU/0J8yt/kBWW1gTVsrGosRJVNBqphqbCz8pRUguaGs4CMb/4zc
         g8E+bBdZxGkqFVJdlTIYWJULJ0yvoZG+2HRQytVMF85qR51Tj1pbGXMusF0zl3TNbMAk
         jxexxqTcIrClseMreVlNJ5DNzku4kNX1PokWbEwxLtGz0SHBkjpuJs9fM+3b+CrT4yDL
         Zx9XOpIyFlBupeHEKs3mUd4u/iC51RsI1hiRr+lzwbFhk2RhJ3TiDW6unXiw5gGh03cf
         AHqGwzCukPy/9kgLde9/6MpWxU3Xnz6RoGn5BIRl/XuIMzphsr/qm8iYVo1CJfPAWuiu
         cg8A==
X-Gm-Message-State: AOJu0YwxsQ0y6qnZqArPOrktj+eqgUo97GkQ0pDPhi32+4vIPy6GzZxm
	e3gl7egmmzSoWHSHYVyP8TTa+B09syHT9uDQZoPBfbFgg3YzhaFwbx8/kleGn+g78/P+3VtAN1Y
	VFSXaFhzX6obf3tHQGioxLIUyOzk=
X-Gm-Gg: ASbGncu50Mg450b3wYm/QS/Ct93bh9wJJmZzvFVKdTkJd7u0n/UZgtTBz3byLiTZMCD
	vwooRZnSqrp+/GSO9s3n/VSgmURdPNrWrBLpMZd4Yi2NxtnNe+r7qCx9j5w5NrrSAx77rlHzdiH
	iBgbPkND7DQvELVhHZuVU8F+h2vuMUU4Y39+n4jqJJ
X-Google-Smtp-Source: AGHT+IHVwWjZNKyi7hvbNY+C8sMCtFXLT2fV8/TBf2qUd7ifObxBv4mFuSdT1RuKUqE0lqeOZ/bczdHGHAkQNP32u1Y=
X-Received: by 2002:a05:6512:3e14:b0:54a:f7a7:6800 with SMTP id
 2adb3069b0e04-54b1110d6c7mr3069521e87.41.1743430307210; Mon, 31 Mar 2025
 07:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250331111128.317469-1-peter.marko@siemens.com>
In-Reply-To: <20250331111128.317469-1-peter.marko@siemens.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 31 Mar 2025 08:11:32 -0600
X-Gm-Features: AQ5f1JoK_lhMahDhRAlchXfA95cWmklLq_gz5ORFeUARpsm6BleZRLGN-h5zL9M
Message-ID: <CAJdd5GZQZSb3NC3DRuW8rXGN610hKmHc9sOSQigc-qkm6RXjew@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] create-spdx-3.0: make create_spdx depend on CVE_STATUS
To: Peter Marko <peter.marko@siemens.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 14:11:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213980

On Mon, Mar 31, 2025 at 5:12=E2=80=AFAM Peter Marko <peter.marko@siemens.co=
m> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> SPDX3 classes now add CVE_STATUS information to spdx.
> So the task needs to be rebuilt when CVE_STATUS changes.
>
> This is true since commit 1ff496546279d8a97df5ec475007cfb095c2a0bc
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> cc: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/create-spdx-3.0.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
> index 044517d9f7..235bd804bd 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -138,6 +138,7 @@ python do_create_spdx() {
>      oe.spdx30_tasks.create_spdx(d)
>  }
>  do_create_spdx[vardeps] +=3D "\
> +    CVE_STATUS \

Seems fine to me, unless RP thinks we should add cve_check to BBIMPORTS ins=
tead?

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>


>      SPDX_INCLUDE_BITBAKE_PARENT_BUILD \
>      SPDX_PACKAGE_ADDITIONAL_PURPOSE \
>      SPDX_PROFILES \

