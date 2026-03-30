Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1258B1061B1E
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 20:53:06 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5746.1774903977735554644
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 13:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sp4Z4Uzo;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486b96760easo54366905e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 13:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774903976; x=1775508776; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCsahk6LABA0DiDhUodNWdCQBNAF/+3mfmWYaT3+69s=;
        b=sp4Z4UzomC3KzLTP7mH0u621BxWkrt1IMc8MCy5D2Vn++tsxPrYa6DXEbigClRQQnO
         EahEv9EuH3D7dGUH9eZbeoMy28dTc6kzD9bWjhgVGN2+nGc1xZjQRftmRCecXO8eSQ17
         PmiQaZ8qTSq/z0gtCSQkdTKrZtLUCE0tzImqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774903976; x=1775508776;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DCsahk6LABA0DiDhUodNWdCQBNAF/+3mfmWYaT3+69s=;
        b=dhGirO3/LAAzgXBAfgy82+oHNfb2KNHnOyxExuyXjc5bUmRYkNxSqw6np+rQxgIS1s
         usxESIK8uVdr00TWWJ5gegz1nZMRSi+oHbUUkHANvzNR/WoFK9vxGkIXWLXPcgyCCuz+
         IW5H7iAfrh+zJ7kfLjGNF2SM0mKp270poplk72pdAhRCrAUhPJJp6InAF5B3WC+f+RhD
         8xtBkYQ3DefiazfjApKZDchOf30D+Ft3HaUcsTaqf5cqOEpfLIeOFleo6Z6R+aEC4xzF
         zLVGqbCkp49b60sF/jBbY6BAv+qIr6QY7ie5iaZ73XNelHlcNyG1VM5LAs/CHues8RCj
         JC4A==
X-Forwarded-Encrypted: i=1; AJvYcCUyar5OfgNyjVRKdLbIoeTE+jbMb5+p9cu8LoL+7IH7be0AMPSe8UqmwD3XPCW7IaYNeTtSB5UojXGK96+yBxZGZA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyiBwd5reyWHk7IbnnR/Tc4FylfBs2XUDbElBeoUrvTyeLyMja8
	pOKJ31VcmmjAWj8Lgfy0YRVLPuBhFsj5RK9WIE/UjyF5twKoJRBYO3uyQ8vfaGx51qY=
X-Gm-Gg: ATEYQzwHSgiJiy8Yx8NoWpEmLOBIgNOA7bRawMa35NHI9N2y1r1lyuOa4FkQjBs775k
	Orop0BqgYOgQ65y1TmdgefcftzS54HCuQ1Vl96szlVZNmTAjYyCrP51iXH/bY/L9uPuc1aFo8aF
	+rQKkmUeWxS+TdbhGAq9nwrE0ZPkZaU5A18yZP6NH4+vAngB3I7rJFErh1003IBrNm6KpZ66EVX
	BjlhnrlvV27Yfg6woYkxha4OhmUUl/8A6kFI3wISPbs1pFozAZKt22bZqG1Hu2kowdgAnh5PuDs
	Ny2pBrh8SjcWTszLKcK0ecF5YTTAE3lOHtQwSVblcJ6abSl4N2jUwCKgKeY66O2GGbz22zHd1fq
	KigGHGEqizH1p79DTFX0lC1hslEwn8gvmOqZj5cSPeN45QeKK/SDpmp30qJCSzSzRuBN7VylGUa
	p9RYsraTZXrV2CjFJwqo3O6mQsxntU8vD69/KxtXoirVK2C0w+lq2IH1sYqGpDHVtmZsywaiclr
	rEu2L1xWf77sPQ=
X-Received: by 2002:a05:600c:8485:b0:487:36c:f5ab with SMTP id 5b1f17b1804b1-48727d73464mr266612085e9.10.1774903975747;
        Mon, 30 Mar 2026 13:52:55 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b4d0sm296862775e9.3.2026.03.30.13.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 13:52:55 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 22:52:54 +0200
Message-Id: <DHGEY5KEC0UG.1XDWZWAJC5ZTL@smile.fr>
To: <adongare@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap] [PATCH V2 1/2] vim: Fix CVE-2026-25749
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <131089.1773220389419496773@lists.openembedded.org>
 <20260311094528.2744479-1-adongare@cisco.com>
 <DH75VU1XGMU1.177LB3T02RJF1@smile.fr>
 <173697.1774894874030687760@lists.openembedded.org>
In-Reply-To: <173697.1774894874030687760@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 20:53:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234256

On Mon Mar 30, 2026 at 8:21 PM CEST, Anil Dongare -X (adongare - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> Hi Yoann,
>
> Thank you for reviewing the patch. I have double-checked the formatting a=
gainst the upstream repository.
>
> The context lines starting with tabs rather than a single space exactly m=
atch the original upstream source code indentation in src/tag.c for that sp=
ecific block. I kept the formatting identical to the upstream commit to ens=
ure consistency and avoid introducing any unintended whitespace or indentat=
ion issues.

Hello,

I think I was not clear enough. Let me be more precise.
I'm not talking about indentation style in the upstream file tag.c
(those can be either spaces or tabs, that is perfectly fine).

I'm talking about the format of the patch modifying this file. For
example, your CVE-2026-25749.patch file:

As per
https://www.gnu.org/software/diffutils/manual/html_node/Detailed-Unified.ht=
ml:
> The lines common to both files begin with a space character. The lines
> that actually differ between the two files have one of the following
> indicator characters in the left print column:

But, in you patch you actually got a tab instead of the space meaning
that both before/after state have the same line (in another word: context).

Using "cat -t" to display tab:
 $ cat -nt meta/recipes-support/vim/files/CVE-2026-25749.patch
    33	--- a/src/tag.c
    34	+++ b/src/tag.c
    35	@@ -3348,7 +3348,7 @@ get_tagfname(
    36	^I    if (tnp->tn_hf_idx > tag_fnames.ga_len || *p_hf =3D=3D NUL)
        ^ Here, there is a tab where the format says it should be a
		space to indicate context.

But some lines later this is fine:
    44	diff --git a/src/testdir/test_help.vim b/src/testdir/test_help.vim
    45	index dac153d86..f9e4686bb 100644
    46	--- a/src/testdir/test_help.vim
    47	+++ b/src/testdir/test_help.vim
    48	@@ -222,4 +222,13 @@ func Test_helptag_navigation()
    49	 endfunc
	    ^ here, this is a space to indicate that this line is context.
		(Like every other patch you will find in the oe-core repository)

Is this more clear?

> Please let me know if you would still prefer me to modify it!

Yes, I still like a properly formatted patch please.

I don't know how you generated this patch but I recommend using devtool:
https://docs.yoctoproject.org/dev/ref-manual/devtool-reference.html#updatin=
g-a-recipe

Regards,

>
> Thanks, Anil

--=20
Yoann Congal
Smile ECS


