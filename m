Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CADCFD88D4
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 23:56:10 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9400.1773186969501552862
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 16:56:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=H/zIGNwT;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48539d21b76so22667775e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 16:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773186968; x=1773791768; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ssXYv4YJ/jZE8/+XRZthlhlKNAV0tP62PXrqWd9a4M=;
        b=H/zIGNwTYBoTgkMZrWQV1UJ9K5KPPUPYmhxMhyX79Bnz9R/Lt0yfTAhwm2DPmbZprH
         O6WkVngpi5zm9jMAhM5Jb/q+3BqlPeZEnRaVfOO2ksp3KtFr4v3XS9vJzDKK6yHPAMZK
         qw+HhGEdrTO81cwZ3wJLXeOgkBdyManUiNnOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773186968; x=1773791768;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ssXYv4YJ/jZE8/+XRZthlhlKNAV0tP62PXrqWd9a4M=;
        b=HwjTX4c4pVukPto7ZW7RL43WgWPOfpTQrhsPqX+nqFpeSsrCYAk+CRQM1ozhok0rPd
         a2CqipED8TzyTo4og/aUQd2ZPkmi0z7QM9PbGH4HEdi0DS7zbiSyVNn2XfKwhaPU443f
         1tmfXeTDIwB9o1wocyENud0PwrlP7C6Poowd3mWHNK3jbx88IJZYe1XL4y0PohFtREXO
         9XpOp36J6pYo0TmmfcfHFo3l1YbKDgV/jc6UkEOii/rPB5zhjyS7n1vNfxMvjanN20eW
         WmX8TFsNdLVy5/KGwDCP5pi7E3wZzDXh2joQ7K2rp0MGtEeXih3ha9eIRdDHMPiM7M0U
         /gTw==
X-Forwarded-Encrypted: i=1; AJvYcCWnS+tAiLS2o9n6aBFW9QVENEXBoCAnhGuI6bNJL03b99r2/3y8m/rBF+Ih/PnepA+HTZlYAghAv6e5NHAWVI4W4w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw5iskA0LaVB+dTN/pTQUEFZAskRNOBIdAT4umIIXW4+EzPQv0I
	4Ec6+u7JU2EWvKrrWYjwulHlDGIG/h0B7ALu/lBCGjVKQHRyo5S04kjIW2B/6StMkXU=
X-Gm-Gg: ATEYQzx5syBTt3L6C1C73dqv00jOdf9mcKKK07Wznrtoq8Ft1OW2JHaE4CJ/qWbWJa2
	MYvXS/jXEi7qKYqHjJQfcJ6TiT1Ddnf/0Ond4G8spru5ul+7EUHDr6L47pGLQm2ragQXfnGDexa
	Uml8r0c4iA3sTtoqxEc6oXM/Qss5+u8WiQ0oIKFpo4DB6C0guTD0PEF3bT2MrAEuNTBqLOwxBSQ
	KJGQU9dQii0agidMluLkzeSGs0qdLVXGmwM9v6pcwfPfXK+bTU82KcosqlrMs+SZMQYu32swxm4
	aKY2WtiVz6sVO98NdkUz9dC0wpX62hfBMtOfGHdKmeZkC2WLsaJZiedj9W2C4SGqsjCrrWY80LU
	z4Xs/Zb42hdtONVBi/B3C1o9+g2/rJ1pvkTpHcIdWXYgyHdTxwgy6B+Stscc+Hfjv9iJL0TYOY2
	Pej74pkpEgX2WT27oMqFESjlQ2KIrvQcm+4ZIWBGRVpgTRnZxL7z8x6poUkTVEivydqUwjefYWb
	vjQmHtzmbUPYHj9S3fGBrprIw==
X-Received: by 2002:a05:600c:8b0a:b0:485:3ae8:2236 with SMTP id 5b1f17b1804b1-4854b123cd6mr9691785e9.32.1773186967733;
        Tue, 10 Mar 2026 16:56:07 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5f6b95sm9072995e9.6.2026.03.10.16.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 16:56:07 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 00:56:06 +0100
Message-Id: <DGZIBJ142RL4.2CIC58YV2ALPG@smile.fr>
Cc: <xe-linux-external@cisco.com>, <to@cisco.com>
To: <adongare@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [Whinlatter] [PATCH 1/2] vim v9.1.1683: Fix
 CVE-2026-25749
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260309070233.4148849-1-adongare@cisco.com>
In-Reply-To: <20260309070233.4148849-1-adongare@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 23:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232831

Hello,

Thank for the patches, they both looks right but the form need
improvment (review should apply to both patches)

The subject should just say "vim: Fix CVE-2026-25749" (no version
before ":")

On Mon Mar 9, 2026 at 8:02 AM CET, Anil Dongare -X (adongare - E INFOCHIPS =
PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Anil Dongare <adongare@cisco.com>
>
> Upstream Repository: https://github.com/vim/vim.git
>=20
> Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2026-25749
> Type: Security Fix
> CVE: CVE-2026-25749
> Score: 6.6
> Patch: https://github.com/vim/vim/commit/0714b15940b2

There is a lot of useless/redundant information in this commit message.
The thing I look for in a commit message for a CVE fix like this, is
"how do you go from the CVE to the patch you apply". Here, this is quite
simple, you apply the fix cited in the CVE NVD page (the URL to the NVD
page is appreciated).

> Signed-off-by: Anil Dongare <adongare@cisco.com>


> ---
>  .../vim/files/CVE-2026-25749.patch            | 57 +++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |  1 +
>  2 files changed, 58 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-25749.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2026-25749.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-25749.patch
> new file mode 100644
> index 0000000000..1e3779d3c4
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-25749.patch
> @@ -0,0 +1,57 @@
> +From 04c5e03c2c638e6c82c250f7b612eab29fe7d9ba Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Thu, 5 Feb 2026 18:51:54 +0000
> +Subject: [PATCH] patch 9.1.2132: [security]: buffer-overflow in 'helpfil=
e'
> + option handling
> +
> +Problem:  [security]: buffer-overflow in 'helpfile' option handling by
> +          using strcpy without bound checks (Rahul Hoysala)
> +Solution: Limit strncpy to the length of the buffer (MAXPATHL)
> +
> +Github Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-5w93-4g67-mm43
> +
> +CVE: CVE-2026-25749
> +Upstream-Status: Backport [https://github.com/vim/vim/commit/0714b15940b=
2]

Please use the full hash instead.

> +
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +(cherry picked from commit 0714b15940b245108e6e9d7aa2260dd849a26fa9)
> +Signed-off-by: Anil Dongare <adongare@cisco.com>
> +---
> + src/tag.c                 | 2 +-
> + src/testdir/test_help.vim | 9 +++++++++
> + 2 files changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/tag.c b/src/tag.c
> +index 6912e8743..a32bbb245 100644
> +--- a/src/tag.c
> ++++ b/src/tag.c
> +@@ -3348,7 +3348,7 @@ get_tagfname(
> +	    if (tnp->tn_hf_idx > tag_fnames.ga_len || *p_hf =3D=3D NUL)
> +		return FAIL;
> +	    ++tnp->tn_hf_idx;
> +-	    STRCPY(buf, p_hf);
> ++	    vim_strncpy(buf, p_hf, MAXPATHL - 1);
> +	    STRCPY(gettail(buf), "tags");
> + #ifdef BACKSLASH_IN_FILENAME
> +	    slash_adjust(buf);
> +diff --git a/src/testdir/test_help.vim b/src/testdir/test_help.vim
> +index dac153d86..f9e4686bb 100644
> +--- a/src/testdir/test_help.vim
> ++++ b/src/testdir/test_help.vim
> +@@ -222,4 +222,13 @@ func Test_helptag_navigation()
> + endfunc
> +
> +
> ++" This caused a buffer overflow
> ++func Test_helpfile_overflow()
> ++  let _helpfile =3D &helpfile
> ++  let &helpfile =3D repeat('A', 5000)
> ++  help
> ++  helpclose
> ++  let &helpfile =3D _helpfile
> ++endfunc
> ++
> + " vim: shiftwidth=3D2 sts=3D2 expandtab
> +--
> +2.43.7
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
> index c730f1d0cf..044117a57f 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -16,6 +16,7 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmast=
er;protocol=3Dhttps;tag=3Dv${PV}
>             file://disable_acl_header_check.patch \
>             file://0001-src-Makefile-improve-reproducibility.patch \
>             file://no-path-adjust.patch \
> +           file://CVE-2026-25749.patch \
>             "
> =20
>  PV .=3D ".1683"

--=20
Yoann Congal
Smile ECS


