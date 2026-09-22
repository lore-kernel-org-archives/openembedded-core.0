Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E1EFC98302
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 16:54:42 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.729.1790096075940414669
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 09:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yQtE/vqE;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so24632465e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 09:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790096074; x=1790700874; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1bojwEDTVLyebfZGDLlmkBkJCYa9/3OtM/Q1gM4goiw=;
        b=yQtE/vqEGD+g3Zk973eX2x32EW7VzN/0YeTL95tJYm+uEycu8VJrE86Zv0jlUypuLB
         mokkvElRFXNHvk3qoRGY19dHVgkZk115u9cmww0t3h9lPJZo+5J+aYU0wTusgGj8sK6L
         HY2w3mmFa2OENQQrmUxaT8AzoZkOpkMJiq6CQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790096074; x=1790700874;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1bojwEDTVLyebfZGDLlmkBkJCYa9/3OtM/Q1gM4goiw=;
        b=FdZQe3HbFfC6mAnGBnuGXuv+dYppvx7p3n7GHlBJxkQrrATNYV/f49wNk0vC9x/pbR
         3nj2n6xYiV6h5bcyFTxmpLYd3NDU3KH2rBMfuCQJ72jSCIBYeGNkWHJwPs6s9z6C64tT
         nGpBipSul4XwtseRJmVtydCcZ1LvsHRfpVmwdJlPKCkEzMjeaG2g3ju+veP+4sfXEpfr
         0NpY96W5PboNoDAbKOvdpBGje0/7VaiYkuO6se7SvYnVJlABaEDc5t5sbUuPLiaUFwGk
         5ZESdpL2ROSP3U6n5c67YoO74J5dy2D5zTE92auNycIUWvG0sZLbs1BbDsPfHBjF2BMG
         faGA==
X-Forwarded-Encrypted: i=1; AKwUvBzo8VyKMcYCzNR4q3lkUKfvu5N+7dkzNksx0fjwbwP7E/VSfGPYLsEiFf9BhRvX3qjcgiABM4gwzYyLtOloJWxnTQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++mviM1bqCc9llmika/ucZc9lloacfkO9+yoNFm463ENkODvD2zL
	EzfQiynIuIwTdSwrkpfAFxWmDKr2nJxmMyv9U5diQcbdj67HyQ5qFGOLzHfNlI6L+Yg=
X-Gm-Gg: AYBFou3wbyNBWQgrMTMh2a7ldAZo8a3ixaEGVWzbvo9ojhUImBk67ldF8+mbTzp4yrW
	7AJmqzutK65EMiOMGxHukVTXddcmA6/f/dGsU9qFPLVqGV/U1By5tdSe+aXGDaRRunDyybTfI3a
	dRLkSbrCoTPbxF6rBlW/mjsVKemAYcZ2Ew0/7h8H/vL9Got/YYKg26FnXheQMZHurVu9hMtUZ1T
	pMMBEYnSHCUYGyrn8ehy79o1gFtKLVRhWk9FLhI7zs5f6oCElEQL0+pY/c9tiSI1WKU9Uym0nlQ
	1woOni30h98xpp/FwfxAI05NLSnRqY+HEbZP5bgXITRpkuVhynb41kqrt45I2noHcJ1QQbzGJSZ
	khQfZQ7MgeirS1q3RwqMwvxYefWzKC7LAriHUeKxuAHA81QWgtLPbglESH7hmotN2klbu2Dzemt
	ovVZvh7Gu3eCInG0+8Qi+RKegfhXjVmK2zRLrDJTHlzZHhQu4CSRnewQTZXx3VDT2nOFRNNzSQg
	KEsGVjyc9F7v+PAyjsBF6HjYfWC09x+INl+tE5vRyzW8SAuz8YeBFLEAjZA
X-Received: by 2002:a05:600c:314a:b0:49f:ce73:7aa with SMTP id 5b1f17b1804b1-49fce730865mr153228995e9.35.1790096074149;
        Tue, 22 Sep 2026 09:54:34 -0700 (PDT)
Received: from localhost (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdab0e46fsm15531075e9.3.2026.09.22.09.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 09:54:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 18:54:32 +0200
Message-Id: <DLM03IYYPA5B.304J2S45AP5AL@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] vim: Fix for CVE-2026-73076
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260916125925.241119-1-hprajapati@mvista.com>
In-Reply-To: <20260916125925.241119-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 16:54:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246425

On Wed Sep 16, 2026 at 2:59 PM CEST, Hitendra Prajapati via lists.openembed=
ded.org wrote:
> Pick the patch from [1], also referenced in the NVD report [2].
>
> [1] https://github.com/vim/vim/commit/581a2f3ac9c6f96a26324f6b2c8c11415fd=
0d452
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-73076
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../vim/files/CVE-2026-73076.patch            | 136 ++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |   1 +
>  2 files changed, 137 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-73076.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2026-73076.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-73076.patch
> new file mode 100644
> index 0000000000..92c9e10c4a
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-73076.patch
> @@ -0,0 +1,136 @@
> +From 581a2f3ac9c6f96a26324f6b2c8c11415fd0d452 Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Fri, 24 Jul 2026 17:43:51 +0200
> +Subject: [PATCH] patch 9.2.0847: [security]: vimball: code execution via
> + .VimballRecord file
> +
> +Problem:  [security]: vimball: code execution via .VimballRecord file
> +          (tdjackey)
> +Solution: Forbid arbitrary commands, fix broken directory deletion code,
> +          refactor code
> +
> +Github Security Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-r22p-fhw4-84p2
> +
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +
> +CVE: CVE-2026-73076
> +Upstream-Status: Backport from https://github.com/vim/vim/commit/581a2f3=
ac9c6f96a26324f6b2c8c11415fd0d452

I don't think this is the correct format for Upstream-Status: Backport.
Patchtest should have failed for this patch.
Can you try running patchtest on your sent patches?

Regards,
--=20
Yoann Congal
Smile ECS


