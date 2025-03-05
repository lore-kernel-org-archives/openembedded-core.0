Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EEEAC19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 10:37:22 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.10490.1741171038359318217
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 02:37:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZZnxeBvT;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c3be0d212fso386146485a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 02:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741171037; x=1741775837; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dtjdSgVqRHuPC8dEV6h3HEN2udCjSMOna94OJ5XFHXs=;
        b=ZZnxeBvTYofPnPl0zhpQKqz9QX9kv46eQ3m4dd4BMnhVJEdu5klV/xgjAc9ZfFIvVA
         9UrI3f01OcBbyQXnnTXTcwfJstfNzkUddIEnPsn9Oj4j9CCBSnDUtMd3QBN11sE/H7WW
         sl4R87bmOy5bo8l2KIsbXzy74trnWMk3vWccqt49xVTfZIQn4B12N0XtqZO3H8GPt0Iy
         moGYxmTyZx8RlRzAwZc4dL7FUtLwYlTAs6iHmYU/WVoqYO/0bZkSPyiXPEZKNJgZw53v
         caV93ui+c39OI0KSJlGohMd4e7a+ne+KlO4VjFOKydrjNjIlmHmHSMcIhHeQnUrrxArr
         8RGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741171037; x=1741775837;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dtjdSgVqRHuPC8dEV6h3HEN2udCjSMOna94OJ5XFHXs=;
        b=elMZCPSfhwWaJ0R1L3+iT/Ld1udyXEIhOMHxKdolWxt2qFcHRsyGEZrmkLoAJWsXt9
         /yJ37tFOAYoQnSIGkojbRykvuoFdRVSGrDHPJCdvaZp35BXiLIhODUTxH6lhbxt+NiIg
         4V1+jBKKlQ5H85afGCJZAQh2siSWa6zwTCdAPsK40iSjS5dRfTi93ANOKtH1fdYQjTlj
         2aJ6JNgqZVDMzJRzKsmVtvLzh0+CNh8kitnTifEFDkFZiUe7+8nR4ktvuPTeGnp5+73B
         i4W1DOoxJDyqylDjgne6SZSTkNChyDrWv2BZa1o9dNvJz66QVAYyUpE5narFabkaOPj2
         KudQ==
X-Gm-Message-State: AOJu0YwTiElnTEY/3Dk9xRlI/K6lZdMQkjrUvvDKw+6kJLsj1jA7/jPi
	TdXUFhdo+UHHuf04GHtBrMJcDMsg60nRvopX9sun5T2Pup1ZWgEbRosPO9mno/5LAQ2SbGcRf2F
	/n2H77g9bKhMzzOjj/qyG7EDFFLo=
X-Gm-Gg: ASbGncvEcQN+I99pkMU8BgFm/1GIUflAm1XJEkpjC+6wxjdD78tdv+F5iXjHR2yaA0q
	RYi7y/ujT5YWBgXwFR9DeCzzYGBUo9/04cMxkYxHIdV5qrkZNgI9+zME1/n8LJwzqZCC5YGLs2g
	+6ZDQjPT0+evdLL2h8B3mntjDdcmuC/tpgIaNidf3foVgXW6YKeZcUuFVhDT4G
X-Google-Smtp-Source: AGHT+IEinxKDU8aGQdXvWKRsqTW0WzsqD7zxzEnspqJn5Mf7Z8xPB3wnLagAf6WeI6Ze/+4yLScSsKE9+iDc37gznh4=
X-Received: by 2002:ad4:5f08:0:b0:6e6:666b:6c28 with SMTP id
 6a1803df08f44-6e8e6d650ddmr36896106d6.19.1741171037223; Wed, 05 Mar 2025
 02:37:17 -0800 (PST)
MIME-Version: 1.0
References: <20250305060202.2477305-1-Deepesh.Varatharajan@windriver.com> <20250305060202.2477305-2-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250305060202.2477305-2-Deepesh.Varatharajan@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Mar 2025 11:37:06 +0100
X-Gm-Features: AQ5f1JrvMRHcwulDqLcJoh-WAP8oKZdlf2yJvynHlpOOeao_Eg20H6xyEmvhijM
Message-ID: <CANNYZj_F8LKutEXB1UpDPd8y6qKTYKaPwEefYJ+L3RdWrG4HMA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V3 2/3] rust: Fix build break because of download-ci-llvm
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 10:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212303

On Wed, 5 Mar 2025 at 07:02, Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Previously, download-ci-llvm was set to false. However, with the following commit:
> https://github.com/rust-lang/rust/commit/7d579046c80d3de3143dcb8b2db5640f95b5383c ,
> which has been present from rust_1.83, it was changed to true. As a result, after
> updating to rust_1.83, we encountered the following error during the build:
>
> -------------------------------------------------------------------------------
> | thread 'main' panicked at src/core/config/config.rs:2047:13:
> | setting build-target.llvm-config is incompatible with download-ci-llvm.
> | note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
> -------------------------------------------------------------------------------
>
> To resolve this issue, we are setting download-ci-llvm back to false.
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/recipes-devtools/rust/rust_1.83.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/rust/rust_1.83.0.bb b/meta/recipes-devtools/rust/rust_1.83.0.bb
> index c4f8ee7108..cd470b1883 100644
> --- a/meta/recipes-devtools/rust/rust_1.83.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.83.0.bb
> @@ -129,6 +129,7 @@ python do_configure() {
>      # [llvm]
>      config.add_section("llvm")
>      config.set("llvm", "static-libstdcpp", e(False))
> +    config.set("llvm", "download-ci-llvm", e(False))
>      if "llvm" in (d.getVar('TC_CXX_RUNTIME') or ""):
>          config.set("llvm", "use-libcxx", e(True))

The fix and the explanation is fine, but the ordering of commits isn't
- if you place it after the version update, then anyone bisecting the
build and landing on the update commit will see this breakage. It's
better to make this the first commit, or to squash it into the update
(preserving the explanation).

Alex

