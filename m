Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 674B2C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 15:46:10 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by mx.groups.io with SMTP id smtpd.web12.21111.1646063169755982228
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 07:46:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QMj5E1XJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.176,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f176.google.com with SMTP id b64so2024563vkf.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 07:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g21+9saW8dz4DaPSZP7WJHG2MFMGnT1sw/8HiD6I5AU=;
        b=QMj5E1XJ+e0oXSkE3wgJstMcCgu9dBcfnzHODygzYaO/Y/bMX+VNiW6vSW6Bi4ZmHT
         FnZWxTTerZqbaMBX4he/OEJXQFmS1Ol6hTA24dw4I66JJ6BHUOqQoN+2uCYxE54k97Ah
         zbF4lEYB7P65KxIPfuhh0h0J4wVq2/V8yQTGnwxkJS0R96DeCBiO/nLUb0MtNMIKGJUs
         Ea+1lyhve7mj6r7LDHLN2KQbvtHNtqLj+8yB7HqYNz/prokQxtt8NKFb8N/nKA19HpGb
         oWy4UE4g63YBXPKPNTZZgc2qUPiB6BsD5fXVUxermvxCuiHCvNA9ozQz8bXxtRbDba9J
         qGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g21+9saW8dz4DaPSZP7WJHG2MFMGnT1sw/8HiD6I5AU=;
        b=LvGqnr89okOzVDutoHxGh++sm20P7PyqJ+3jXBIqYvktdYWiP7Hjei+sm+i3QARBIB
         C5iCMWk6Z6TbJFSvoV4omzENDaRNJh6bozKFdfulbrZu68U5pnaTuSXMdua6eLx/HTk6
         8SgTq2OERfMVmNa7PA2a/vr9vAERO+Y9QO945PxxybUzcc3j+OxqE0f9pwQQJ0WBSvH9
         qGdPwdsdp66FVj7el8FbvStJvWDkUcgx0xWOOgp4QICzcLW2xHSM11NISGq7zEQTLBaN
         yvwnBNk3CtF6z/XoUr5DjRjMrx2RsBQi0v/AR4ha/DSFNOHsRz4GkA17HsKZ8+balQFA
         ZufQ==
X-Gm-Message-State: AOAM532O0E2RYtLjm/AzG2EiwtJYA2mu64GNCWT0JZLJkZdwP8zEy1PK
	cTYXTocWpptAlatG0Z2WkX/FNMB5lTajMlIl8oM=
X-Google-Smtp-Source: 
 ABdhPJyY/N8xLubHC836CHYA3oGMEq6XXfQRP+nfRXAnS8PqSKF76axt/kIKgrvtIc/z8X2txbaucccE/afbdSy4bFA=
X-Received: by 2002:a05:6122:180a:b0:332:61fb:6eac with SMTP id
 ay10-20020a056122180a00b0033261fb6eacmr8034812vkb.21.1646063168830; Mon, 28
 Feb 2022 07:46:08 -0800 (PST)
MIME-Version: 1.0
References: <20220228143948.50809-1-andrew@aj.id.au>
 <20220228143948.50809-4-andrew@aj.id.au>
In-Reply-To: <20220228143948.50809-4-andrew@aj.id.au>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Feb 2022 16:45:57 +0100
Message-ID: 
 <CANNYZj8=MqZPDBROgfAYz93kvtpVFxV5-o6Dcb=ZnibtoRFXDw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] rust: Add snapshot checksums for powerpc64le
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 15:46:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162507

The final call is Richard's but I would still prefer to have this in
core if there is at least one other consumer of it, other than
openbmc.

The downside of .bbappend is that there'll be inevitably a breakage
window where the .bbappend needs to be updated.

Alex

On Mon, 28 Feb 2022 at 15:40, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  meta/recipes-devtools/rust/rust-snapshot.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
> index 173648c889fb..d0c05aec7866 100644
> --- a/meta/recipes-devtools/rust/rust-snapshot.inc
> +++ b/meta/recipes-devtools/rust/rust-snapshot.inc
> @@ -14,6 +14,10 @@ SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "3618da916a0f92f241cf1d67d04bb578
>  SRC_URI[rustc-snapshot-aarch64.sha256sum] = "f26811e48d03c56c125de03d389e1ae7c6df36990953c1670c6a5676bc12d4cb"
>  SRC_URI[cargo-snapshot-aarch64.sha256sum] = "6d11cd94618d80cda273eeeae7285980445f61a49ebacc616777b482a41cbf3f"
>
> +SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "fc07eb3e9f3d227428cc5b53ca868e3de375bc198ce4dce7b87a9246e6fec81a"
> +SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "f43cb99109c3438c77c7079cdce4673df3320e310158e0b4d949c1babc4300fc"
> +SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "599cf1b5a8cdbf76d591621bc9222aefa60e2f5fd378ae71c4dcf4514c47122e"
> +
>  SRC_URI += " \
>      https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \
>      https://static.rust-lang.org/dist/${RUSTC_SNAPSHOT}.tar.xz;name=rustc-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \
> --
> 2.32.0
>

