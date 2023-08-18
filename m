Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E74C6C71136
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 10:57:01 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.8687.1692356215619477773
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 03:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=efdaJVN9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-319e93a1594so708325f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 03:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692356214; x=1692961014;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrqD3sHRk4yEu7rtIk6Ou+WOvyS3MOFh0h4R7ORJf4A=;
        b=efdaJVN9nAPWGtqymJdYUOUxEqSlQfMqZQxS9BjMMXLIJSoo6TXTTQWa48oa4sHsxP
         tcX+ucS9mZvtcbI+78u2CaLe9lj+1TRyLj1pCumwx6XsatMfmnOZErABD/vKfbLSC6A7
         zNKHqfMVGU6EonF6z/wsphaw2H+wqFtfERcaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692356214; x=1692961014;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rrqD3sHRk4yEu7rtIk6Ou+WOvyS3MOFh0h4R7ORJf4A=;
        b=KE6b2KYNxNy5UtNbKx2MUBa/aozmNo2NKex/p4pczFhADJqazIPh+bgHaWagW6IbnN
         Tya1tshVQ1gxYHKsXKrr4SUnYOrlxBfLRYrUJOwEv/7fuHxE75v7U7s3/T4C32rH1yoX
         FxTK4PKnL1u/aE+54c+YixWDctF94YvN4d0H7iT917EXrvDyCmJvS4cQ1zDLu1QrZL1e
         HV3rHy3UvhSRDIzIbEiGOkZuYC2Pl3PuR9SjQAoEwd34DoncjtUFRQXkcLl+ZLNtaOhQ
         KZqsnFi/Da/hGYzfzLCz81r3e6LLjyrdNtFYqjo89hBdvj2Zll7t6B5MGeMdmnFakyBV
         5n/w==
X-Gm-Message-State: AOJu0YxszlB2e8GrOF3jtlLz9NkUyunr4kLW716lRpIwekyPx2B7EcbK
	rfI+y0It9mnLplzc2bAQ2TW+ZA==
X-Google-Smtp-Source: AGHT+IFV1aUPzYeqZGycy6f9ft+j+fPJ9YF3vAMK7gDUTFZxGHDHf+aV84nTo7Glqas8n1MOsJAltg==
X-Received: by 2002:adf:e808:0:b0:315:a32d:311f with SMTP id o8-20020adfe808000000b00315a32d311fmr1626863wrm.14.1692356213459;
        Fri, 18 Aug 2023 03:56:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b8a:199f:e210:2fe8? ([2001:8b0:aba:5f3c:b8a:199f:e210:2fe8])
        by smtp.gmail.com with ESMTPSA id i4-20020a5d6304000000b0031431fb40fasm2389236wru.89.2023.08.18.03.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 03:56:53 -0700 (PDT)
Message-ID: <3a0c57f2682fa8f1326be4f11ef4bad443cccf99.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] mdadm: disable strace on rv32 arch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dmitry Baryshkov <dbaryshkov@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 18 Aug 2023 11:56:52 +0100
In-Reply-To: <20230818105008.16113-1-dmitry.baryshkov@linaro.org>
References: <20230818105008.16113-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 10:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186358

On Fri, 2023-08-18 at 13:50 +0300, Dmitry Baryshkov wrote:
> strace program is not yet ported to RiscV 32 arch. Disable corresponding
> dependency and test to remove dependency on the non-existing package,
> which otherwise breaks building of core images:
>=20
> ERROR: Nothing RPROVIDES 'strace' (but /oe/poky/meta/recipes-extended/mda=
dm/mdadm_4.2.bb RDEPENDS on or otherwise requires it)
> strace was skipped: incompatible with host riscv32-poky-linux (not in COM=
PATIBLE_HOST)
> NOTE: Runtime target 'strace' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['strace']
> NOTE: Runtime target 'mdadm' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['mdadm', 'strace']
> NOTE: Runtime target 'matchbox-terminal' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['matchbox-terminal', 'gtk+3=
', 'glib-2.0', 'util-linux', 'mdadm', 'strace']
> ERROR: Required build target 'core-image-weston' has no buildable provide=
rs.
> Missing or unbuildable dependency chain was: ['core-image-weston', 'match=
box-terminal', 'gtk+3', 'glib-2.0', 'util-linux', 'mdadm', 'strace']
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../mdadm/files/broken-strace-rv32.patch               | 10 ++++++++++
>  meta/recipes-extended/mdadm/mdadm_4.2.bb               |  4 ++++
>  2 files changed, 14 insertions(+)
>  create mode 100644 meta/recipes-extended/mdadm/files/broken-strace-rv32.=
patch
>=20
> diff --git a/meta/recipes-extended/mdadm/files/broken-strace-rv32.patch b=
/meta/recipes-extended/mdadm/files/broken-strace-rv32.patch
> new file mode 100644
> index 000000000000..a58495008605
> --- /dev/null
> +++ b/meta/recipes-extended/mdadm/files/broken-strace-rv32.patch
> @@ -0,0 +1,10 @@
> +Index: mdadm-4.2/tests/07revert-inplace.broken
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- /dev/null
> ++++ mdadm-4.2/tests/07revert-inplace.broken
> +@@ -0,0 +1,5 @@
> ++fails on RiscV32
> ++
> ++Fails with the following message:
> ++    strace -o /tmp/str ./mdadm -A /dev/md0 --update=3Drevert-reshape /d=
ev/<...>
> ++    tests/07revert-inplace: line 40: strace: command not found
> diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-exte=
nded/mdadm/mdadm_4.2.bb
> index fa50325f1f71..3085222061f0 100644
> --- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
> +++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
> @@ -126,3 +126,7 @@ RRECOMMENDS:${PN}-ptest +=3D " \
>  "
> =20
>  FILES:${PN} +=3D "${systemd_unitdir}/*"
> +
> +# strace is not yet ported to rv32
> +SRC_URI:riscv32 +=3D "broken-strace-rv32.patch"
> +RDEPENDS:${PN}-ptest:remove:riscv32 =3D "strace"

The patch has no Upstream-Status: entry which makes me wonder how it
was tested as this should have given warnings.

I also suspect it may be easier to just write a
do_install:append:riscv32 that creates the file instead of a patch?

Cheers,

Richard


