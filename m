Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF7BC3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 14:58:51 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.16665.1720623524430582497
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 07:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NBsgvQap;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.175, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e039be89de9so6157452276.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 07:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720623523; x=1721228323; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0wuscJNTYbrYMAFImQx8xNcDY1BM70KkDcC4KNJ4Ug=;
        b=NBsgvQapUFJ1ScIdKk0sAY3TV48jY8QEW+7h4rOlMGPf/Op2WhFuWwd0SCHZR11sZm
         4VSkPOkKaKx9aOiSeBkXmE53ESKiMlVL/qSrr/xzQr2A2nFro7+wciFhmLAp3V6pYjno
         mg8TeTmE0EOvZof08F8C0Sws2VkoCle0g3nUW6sYyzpMcBgltMCF5w8Mppo9CRk6iAOQ
         2bZ4iAG5jMiC28sQCxZ+KDNd5ScfX3TheRaVVLh0YdPm1IZ2rxaggLxD740MR6VlgR2s
         or3coqjicXGy11tHEItX9I7Pm5hDopalAsZNwi51E7cY+2Wy4nfvNp3Bcqx6XI1vYcfP
         d1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720623523; x=1721228323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0wuscJNTYbrYMAFImQx8xNcDY1BM70KkDcC4KNJ4Ug=;
        b=Q65LbZ6QSMFU2bvUgMwvRn+dDXqt9PkRh8BhmxavnlW8roaiyO9iJwdp1blH/vw9E7
         YWy5+YIBLbM3oTuGJmnIEaVYzoMPhDRBLqRF/zb+iKoAkfZtRQsE9zjeK/FZAMA3br5j
         NSiPQnrKFDBKuSKjujayfNSidvXzbTrFNOPXs41BcOFuZNdDXLZlfR7UUR0kIhmS1vX2
         voNmq7L4A6vO5EhYYFoP4tqlMA9k6VUN5gIizRYcLs+nm4aEK7XRJdrd+0TNugOh6Klm
         lQzcGINLvdbggjfxiTJHY+xwkrJ/QWA+RlltDYhxC26jqU0v+aMfeZ4rhzi0ncwY7vaF
         igOw==
X-Forwarded-Encrypted: i=1; AJvYcCUFiEwdrDJDiVimwa2hxA7qHd/FNCldjx4FpwIaDuj+NelXOvcViigAKvWISYLDxgwUS7/cgCLrcqoYMXHf7kPvsMoS3jOsjAZyFtw8AL6JD+bQqxAaVl7H
X-Gm-Message-State: AOJu0YxghAb1V5lRZlh6cB8zbH0ShrJ5PLKp5yz5z+byjrxIisXDANbu
	w64e3GPxmsbg8pXUKR0qDqkro91hQPPJ6NN7c6x4HNRoe/j8E8z/Ims6rJqSxJ38+0jpvxLuQy8
	JfYSdYuYrjK+RwH+dIAU1CKDBpsF5x6SvGRke5A==
X-Google-Smtp-Source: AGHT+IHghvrWsMpOLhO7UxIr9XMvUVX8h6Mdzc80FqiXmycu7HQtRFBZQ9+tJttFbj8o+jt4zJM/+51hZ4xlZy7RLfQ=
X-Received: by 2002:a05:690c:dd2:b0:650:c942:ed37 with SMTP id
 00721157ae682-658f09c2fa9mr74058057b3.49.1720623523539; Wed, 10 Jul 2024
 07:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240701123752.237702-1-Deepthi.Hemraj@windriver.com> <140fdc26-b2c7-41fc-a561-a96f04f7b77c@windriver.com>
In-Reply-To: <140fdc26-b2c7-41fc-a561-a96f04f7b77c@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 10 Jul 2024 07:58:32 -0700
Message-ID: <CAOSpxdaDVmdomJM+u3fbxM-_U8Q9nHUzNor6JvUC8z+yaGOVOg@mail.gmail.com>
Subject: Re: [scarthgap][PATCH] llvm: Fix CVE-2024-0151
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com, 
	Sundeep.Kokkonda@windriver.com, Ross Burton <ross.burton@arm.com>, 
	openembedded-core@lists.openembedded.org, Deepthi.Hemraj@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 14:58:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201736

On Tue, Jul 9, 2024 at 1:28=E2=80=AFPM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2024-07-01 8:37 a.m., Deepthi.Hemraj@windriver.com wrote:
>
> From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
>  .../llvm/0002-llvm-Fix-CVE-2024-0151.patch    | 1086 +++++++++++++++++
>  meta/recipes-devtools/llvm/llvm_18.1.5.bb     |    1 +
>  2 files changed, 1087 insertions(+)
>  create mode 100644 meta/recipes-devtools/llvm/llvm/0002-llvm-Fix-CVE-202=
4-0151.patch
>
> diff --git a/meta/recipes-devtools/llvm/llvm/0002-llvm-Fix-CVE-2024-0151.=
patch b/meta/recipes-devtools/llvm/llvm/0002-llvm-Fix-CVE-2024-0151.patch
> new file mode 100644
> index 0000000000..0b8338d35b
> --- /dev/null
> +++ b/meta/recipes-devtools/llvm/llvm/0002-llvm-Fix-CVE-2024-0151.patch
> @@ -0,0 +1,1086 @@
> +commit 78ff617d3f573fb3a9b2fef180fa0fd43d5584ea
> +Author: Lucas Duarte Prates <lucas.prates@arm.com>
> +Date:   Thu Jun 20 10:22:01 2024 +0100
> +
> +    [ARM] CMSE security mitigation on function arguments and returned va=
lues (#89944)
> +
> +    The ABI mandates two things related to function calls:
> +     - Function arguments must be sign- or zero-extended to the register
> +       size by the caller.
> +     - Return values must be sign- or zero-extended to the register size=
 by
> +       the callee.
> +
> +    As consequence, callees can assume that function arguments have been
> +    extended and so can callers with regards to return values.
> +
> +    Here lies the problem: Nonsecure code might deliberately ignore this
> +    mandate with the intent of attempting an exploit. It might try to pa=
ss
> +    values that lie outside the expected type's value range in order to
> +    trigger undefined behaviour, e.g. out of bounds access.
> +
> +    With the mitigation implemented, Secure code always performs extensi=
on
> +    of values passed by Nonsecure code.
> +
> +    This addresses the vulnerability described in CVE-2024-0151.
>
> Hi Steve,
>
> I see that this was queued to your -next branch but isn't merged yet:
>    https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable=
/scarthgap-next
>
> I'm not too concerned about the patch but I have a question about test co=
verage
> that hopefully won't take up too much of everyone's time.
>
> As you can see from:
>
> https://nvd.nist.gov/vuln/detail/CVE-2024-0151
>
> "Insufficient argument checking in Secure state Entry functions in softwa=
re using
> Cortex-M Security Extensions (CMSE), ... "
>
> this CVE only affects systems using Cortex-M Security Extensions.
>
> I don't think Deepthi did any run-time testing that would run code in thi=
s mode but
> I'm not very familiar with such things.
>
> Do we have any tests that would allow us to say that the patch at least r=
uns successfully?
> I suppose we can take it on trust that it's an improvement and that anyon=
e who is using
> such an environment can report problems.

It's always the case that we trust that upstream maintainers test that
their CVE fixes are "good"

It's well beyond the project's ability to verify every CVE fix.  We
don't have the knowledge or staffing, so we've got to trust the
upstream!

Steve

> Thanks,
>
> ../Randy
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux

