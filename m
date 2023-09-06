Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD8BEB8FAF
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 05:42:49 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.2231.1693978965277995980
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 22:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=j58e/c1X;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-500b66f8b27so5506256e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 22:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693978963; x=1694583763; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tEkI7aUpp7hfY+ynYwbA8MZocY5o3wTqNKsNGpEYZtQ=;
        b=j58e/c1Xwrue6uf+GCFgmzZYxV8Y5la64z75lqBC0OLr7HV5QgckSdmVr0trFLXzLV
         q0+Kfj5lQFliP4VfjJV99j6ldkeYM3sifdqPOLsa/al573WY/C/Rqn8i168jc2fNihbY
         YZJLCZjpTc90Zh9bE+Mkp6akMSXA7KXhkoY1rPDuR9zClLK5MtsTbgvSE4PPr1f17X4x
         Uk6fk8EjGS1ZxddV/R/R9r8Z9jsZNxIZgN7CXuSs7+eGDH7QSdOgPS/ZkkztI+M5EJlb
         1PCPB8bYFz9VCc8tdeVYP3OzprAVcd2TE4uNTN2Ke3qebg6HqN8fr+rVnJ+zfTBTNsrl
         Wikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693978963; x=1694583763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEkI7aUpp7hfY+ynYwbA8MZocY5o3wTqNKsNGpEYZtQ=;
        b=YzQzkcGPqtmhAA0yeEmRiXiWc6rlw+Oy30fUbbBrz0xeUN9rRUUQnVq8qFK4bCmrQL
         MN6rulCVmGvGvFwbiHAg21tb3EQmPR2U5p49u+DsX1mwhzHng6I/OP1oqxZ2l3erLrdW
         eSJ602Dd7x1awdDyJKYZzAiE248Dmwt5SlDe3nom0Aw4W1sf3hBRuUsReV+YP2BYvjJt
         N1C+MWtzM3f7kZQ0vepzPUWsJ9uEkcsncH88peg9p/LFBlM1apmcJH96lssuLe2sCI26
         e7bD1WaG4SAgnsrJFykhUQjKhkxn/8QdkRpCA9CHOiOmINzPoJDnwTEUZbtHnVPJ1VC8
         1FxQ==
X-Gm-Message-State: AOJu0YzvjZ947qiw8wA6Ujpz2NzcU0zTmb9WQfjsZgZ7q0LASVUu3Kw0
	Wr0iohDyEngos9QjEQ1Dbqhtkgcv58UNMmebtbg=
X-Google-Smtp-Source: AGHT+IG6G1OM8UbRf+DPtjy6gLcUYSgKM0Q6B0FBmbiZxKcVsFvlj00f7fxVBlYDe7eRzTsesF2IuCTU95eHHJZKpkE=
X-Received: by 2002:a05:6512:4020:b0:4fd:f889:b9d2 with SMTP id
 br32-20020a056512402000b004fdf889b9d2mr1738568lfb.38.1693978963165; Tue, 05
 Sep 2023 22:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230906000836.3136078-1-raj.khem@gmail.com>
In-Reply-To: <20230906000836.3136078-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Sep 2023 07:42:31 +0200
Message-ID: <CANNYZj-umFz-wQVuMd6Gqd46QrZTG=eUGy6s3Mfn-wGj2R-MTg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust-target-config: Map rust target to OE target
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 05:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187275

The commit message should say 'powerpc 64 bit rust target'.

Alex

On Wed, 6 Sept 2023 at 02:08, Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes-recipe/rust-target-config.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
> index 9aa1fc4da51..926b0630b1f 100644
> --- a/meta/classes-recipe/rust-target-config.bbclass
> +++ b/meta/classes-recipe/rust-target-config.bbclass
> @@ -296,6 +296,8 @@ def llvm_cpu(d):
>      trans['i586'] = "i586"
>      trans['mips64'] = "mips64"
>      trans['mips64el'] = "mips64"
> +    trans['powerpc64le'] = "ppc64le"
> +    trans['powerpc64'] = "ppc64"
>      trans['riscv64'] = "generic-rv64"
>      trans['riscv32'] = "generic-rv32"
>      trans['loongarch64'] = "la464"
> --
> 2.42.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187260): https://lists.openembedded.org/g/openembedded-core/message/187260
> Mute This Topic: https://lists.openembedded.org/mt/101183376/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

