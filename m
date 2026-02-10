Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F35EA3F2F
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 09:37:03 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16191.1770716214220833742
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 01:36:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iFtnz3aG;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c5320536bfso59952285a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 01:36:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770716213; cv=none;
        d=google.com; s=arc-20240605;
        b=i6hK6JM0n6xcKCRJY6uCeQKvAVNPTIVR7/8adEEBNrloOH1N6Xdn1AdKPCtQ+b8O6H
         VTe52/A6rKb3P/XGnovQri8o+CBn8tsG11YPR/ou6tWBRxhmiOtEDPGW56ele6ZFE1Ap
         PlE7r1MBIme4D5VVU5r5xCaYa4hwHwziTmmf2kvIjz/KKcxeLPGZKPOWFBEPR+Xsf7b5
         in2KENMmns/ob7usrWIqYJzmm0Rmp5Zdjf5t0L36mx72fuPUS3p7oXROcPXTlN09pJZw
         j6m9r1ZQwJ6LeJbJnWDbodRNI+T+As8Dm5Ago3xvUS0yZd80glLjhSxC0aOMKhZgVBeP
         4KhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3hxtzSEmo+l7+Br8M/WJzpUNavSn9estTdXG/dYY2fs=;
        fh=ROldQr07KtNEAZsrthGgsKDT5quXOnRMI+GNO1CijWo=;
        b=GmIY8CJZwUZNpIVeSykAEMAGafb5CgYybF/TOxzAHrI86dauR5oaQ+OS3jQKACKPel
         QNbuCoOjQWzMkZs9k5jHS3vs5FEwV0isFWNeA3Isnv74eAZCvZ/nMF0r6qldDCtjqzsX
         gpgy1p1Vn/XIb3Z3mresyrVga4ocKUq8zvuUStniLTtEb2oKnpsP+dH3pufD/f+CaZsX
         MsjgSsjWhRPWrGfYYhrCt/bBLGenmTb1rXUti1M9XnQMEVkibfDEvDASLDfLlDVG5c/J
         uyF69JuLkNEuGfa0NNp2pK4QuSiifgGKL40Fl8VzqeBf8Rz62ClmRZpS4Fa02H1LLb/h
         YbUQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770716213; x=1771321013; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3hxtzSEmo+l7+Br8M/WJzpUNavSn9estTdXG/dYY2fs=;
        b=iFtnz3aGGd5tFt3du6KJxSSa+tnGlD5SJkQjKYsr71WFqH9JnthnzxsYDZpa0IOTbB
         jmX6XNUy/kq1JSVt7s7RvZQ9FfU6Spmhblb/TwtbPyq2ppgN+CgvMJIRw3nKWujhllRc
         +Q5BNxFuzoVwUmcyeGQZbAqo9G2evJyuNubyDRyKKlVpfjGJ5k4xFE7ZfaqDP5/KjJeH
         xb+IOrCSwPu1m3nGehLZNC+OcKvqTkpacFxDW1KaGJKh2kFCUqnyFGkkMdr7l+ZrtHRz
         7SsMzpB4OG/7JpVjl/4bOA2NNr0rkMODYPQ72qqVfmtyQ0QGcyITnUrXNeMxOYw/nug7
         hJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716213; x=1771321013;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3hxtzSEmo+l7+Br8M/WJzpUNavSn9estTdXG/dYY2fs=;
        b=CLbp3qERtWSNf7ABnj/O/GTUVXY35k/sRFLPKga45umZ+lWWap66IBNI4f0aDvsK2j
         H9Liyd4GWClO2GBAGBBY9hdfG/GTkEr8HeBXNgn5qdcCYlklheCcYQME0IrHn0ltCzeS
         xDP5C3dT1RBOeqU1FQBhGkDxksskZ4oUB/yWMhDQrfY3ViPGEFprjqjY577/na2ZCuj3
         wKTOtna1f4R2YUKUjTPKQfG1UhLsN8ThlAwfwtAPfJOD5a8NixA44yg4EcSy9TZNyAsd
         8jWLrJvkSz88xLm0aUTBg4IfaCeX5sqjr/nJCKGkdFUmjyk8/DOlBIrzVwRjFo4cU7X6
         rKFg==
X-Gm-Message-State: AOJu0Yz69MR7tjJljcgONo48og080Bxl+mlR50gk9RxEq9Htbo4T642P
	kWIH/QhTwNDKEUX6uN79g3GyUarc7E+FXuJZaknsiZ5/bfXO+untpaIiYP6KSoV7Ov9LLr4w1Sf
	kGHPq14muCmnMb22lm+0o77oKka08dxY=
X-Gm-Gg: AZuq6aK4OKfWAq0WW9PjQcr6Ur8jcCM5uzaCzVnRj91XwCsmHIKKVzR3KKFFOy9v9Gq
	LmlVF6Jarh6j4FHqPzqEkIKJ+D7/kiYhhcc1foK86dw6wE5FNrdRZycD2o/WiiJu0AN5DhcOb+2
	HVDFaN3IOreXaYGMgmQp1//GLDEOmZqnllZUvJhXqfZscAC82boQZK7IqnvTs6h10unQJYxL/8p
	ov/x14mZ22KBDV+VFt8C9HwXaNXg33DGEYtFnumOGtiTdskByr4P4muh8pLLDMU4R+NLkVVsfkt
	hh1ktsqbR4Tj+K9P5ETtLxzZbWRUMqL/0rkYHsqDq6cqXc0xMPtC
X-Received: by 2002:a05:620a:462c:b0:8c7:7a3:501b with SMTP id
 af79cd13be357-8caef7e7735mr1854933385a.26.1770716213236; Tue, 10 Feb 2026
 01:36:53 -0800 (PST)
MIME-Version: 1.0
References: <20260209224444.17275-1-logan.gallois@gmail.com> <20260209233019.1981-1-logan.gallois@gmail.com>
In-Reply-To: <20260209233019.1981-1-logan.gallois@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Feb 2026 10:36:42 +0100
X-Gm-Features: AZwV_QgTfhGa0mB6oNhLfmvXq8fibydUoZkGZRinW1hFbtB9VgzQZXAJ8-XU15M
Message-ID: <CANNYZj9t+bSCwxvs05FxU8mNbD1t6RLsbov1ALt61iPFQcWPMQ@mail.gmail.com>
Subject: Re: [PATCH v5] oe-setup-build: TEMPLATECONF were not applied correctly
To: Logan Gallois <logan.gallois@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Logan Gallois <logan.gallois@hexagon.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 09:37:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230870

On Tue, 10 Feb 2026 at 00:30, Logan Gallois <logan.gallois@gmail.com> wrote:
>
> When using the new bitbake-setup tool, an oe-template created in a
> custom layer was ignored because the TEMPLATECONF variable was not passed to the source file.
>
> Signed-off-by: Logan Gallois <logan.gallois@hexagon.com>
> ---
>  scripts/oe-setup-build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
> index b391f3b9254..ab543506451 100755
> --- a/scripts/oe-setup-build
> +++ b/scripts/oe-setup-build
> @@ -101,7 +101,7 @@ def setup_build_env(args):
>              f.write(cmd_base)
>      print("\nRun '. {}' to initialize the build in a current shell session.\n".format(initbuild))
>
> -    cmd = "TEMPLATECONF={} {}".format(template["templatepath"], cmd_base)
> +    cmd = "TEMPLATECONF={}\n{}".format(template["templatepath"], cmd_base)

Thanks, I took a proper look, and yes the issue is real and the patch
is correct. Can you adjust the commit message?

Something like:

Since a recent change to support dash, cmd_base is a set of several
commands, separated by newlines.
TEMPLATECONF was only effective for the first command in that set,
which is not where it's needed.
Putting it on its own line will ensure that it's present for
everything in cmd_base.

Alex

