Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12FDCC88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 12:42:28 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13990.1789562538479173371
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 05:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=v6EALM0G;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso6766445e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 05:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789562536; x=1790167336; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eOuv35Tq0pAyenq0xugpez2TZJzAF3r3D6EIoTGSr+g=;
        b=v6EALM0G1sanVDQY6VWY2ytjLxpnBKW1s7jtx0aXL8T6Nk0QQdqgUu+DN+cM2c+5nv
         qY/zFU3v5vhy52LRj3VAkyWZm3sSdulObXtr+z6iWxNHvWsO/po4DuDcn75Sl9pb9pZH
         gAwePpT7KCePPRRclqTS/JOQb/NLbutcjBQh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789562536; x=1790167336;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eOuv35Tq0pAyenq0xugpez2TZJzAF3r3D6EIoTGSr+g=;
        b=FTPUddxidI5/IedxmQsRvwsqVMtlX7g4eTmwAtC8kE1COilk7feWBSut876C7SWsBK
         4RW6OZEhFRK048aQhhxpy8goEaCZOq2YhVHANzENl725+DPXjAwpXFdaxxIQReVB3N2v
         LArkYr6s57JMoqoTnZapcDm2zd/KYHkTpKIMXXfsk0s89RAw+mW93EhKv/f3RLx72tmF
         k6RxDZOqb6g8wM0zO7BV9ygqj/ns3aY8ubkUVInt55UybFgjYjhU/IiZETaENJ5lPsHM
         ZdbPU762A29KZgXLyz4R3c0BnH5GMkQrr+k56eYZT1auptaWEHL5N6VG9MIBixyPrSvX
         ahVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpkagl4dI/V6ZmmAouqX/xGPUATTzJyKKILhm1iqQQhpH/geIyd3qdZlrvl0w7wz8W7a8WUw4DC1bFPtA7WWYlqQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++kapaKLd2bOIsDFo7PY1DfLO+AYULZshpKRU7MWQszV+ABG4qz1
	CqFQWbzMVlCmUGK59BgFRc2rq8XWvzIdEIjlSViJv3f2wv89hGrp6OCE/U1pHr4qL64=
X-Gm-Gg: AYBFou0uRhbs0Y1SOzJPTal99QXmt53WH+mORvTW53y404M9d9VhYDmt7neYLOs29FA
	oR4+09MlNwN0R7DcySbwGeR/jgSzeLmcTl8hfGnEz0bKXJ2Mvm2j5xeD/N1IYrEe8go2fiABfwH
	Apg0sxfdfT8JsfA4xGmQF/1fapksgQ8Mlum23cWEYcri+7ZNherckQ2xaBjtpikVEQr5RkheGP0
	7o40SAQrUDeRDBL7E8J2JI8AMAaloS+EzrZ4kDtc/aRTq8dtXHz2QSuOyKAz7K17y43BW3LET/V
	GFpxqbfNk9irlo+trs+k8F/XtUKiUY3ybM9KVWglspmViHGSJshFk0+jNIPw9rPVHteHyc2Uy1P
	O0J4m9Yr6FbtRSoT2FNna3sYTB4VHpfFkmEpqb0f1NjLdXu6ix4RtrOYw3QoY7WumBzcNIQufTL
	RaWGUj3O8Z5RDWVsJVvaYhOYTZSWoHQKJHCDlMLJCT7Tko5Pt0EMmNGMPEiAKp6g6kdv9Qeh2kf
	OW+QDMZJzxjVfrFJGYB7/pMqbiYqfD4pKn8sXm9JyQ1H4s9oDN1D8PQY88=
X-Received: by 2002:a05:600c:1f8f:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-49eac45ba2cmr29652705e9.2.1789562535107;
        Wed, 16 Sep 2026 05:42:15 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83a8d6e2sm79456815e9.1.2026.09.16.05.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 05:42:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 14:42:14 +0200
Message-Id: <DLGQZ2Y90AYV.JQCTYY5WT1PY@smile.fr>
To: <devanshp@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] vim: Fix CVE-2026-28417 hostname
 regression
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
X-Mailer: aerc 0.20.0
References: <20260826053017.51184-1-devanshp@cisco.com>
In-Reply-To: <20260826053017.51184-1-devanshp@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 12:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245968

On Wed Aug 26, 2026 at 7:30 AM CEST, Devansh Patel via lists.openembedded.o=
rg wrote:
> From: Devansh Patel <devanshp@cisco.com>
>
> The older Vim patch 9.2.0073 fixed CVE-2026-28417 by tightening netrw
> hostname validation. That CVE fix requires follow-up regression patches
> because it rejects valid hostnames containing optional ports or
> underscores.
>
> Vim 9.2.0340 already contains that CVE fix and patch 9.2.0089, which
> corrects optional-port handling. It still needs patch 9.2.0553 to accept
> underscores, so backport that commit and retain its _gateway regression
> test.
>
> The netrw history hunk is adapted to preserve Wrynose's existing
> multi-line history and append the upstream 2026 May 28 entry. The
> src/version.c hunk is omitted because this backport does not change the
> recipe version or Vim's upstream patch-number table.
>
> [1] https://github.com/vim/vim/commit/79348dbbc09332130f4c86045e1541d6851=
4fcc1
> [2] https://github.com/vim/vim/commit/a6198523fb28a50d96945458792cdb4787d=
3cdda
> [3] https://github.com/vim/vim/commit/93d177cd2b69bac58fc51a5a514d7bc71e2=
64b11
> [4] https://github.com/vim/vim/security/advisories/GHSA-m3xh-9434-g336
>
> Signed-off-by: Devansh Patel <devanshp@cisco.com>
> ---
>  .../files/CVE-2026-28417-regression_p1.patch  | 64 +++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |  1 +
>  2 files changed, 65 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-28417-regress=
ion_p1.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2026-28417-regression_p1.=
patch b/meta/recipes-support/vim/files/CVE-2026-28417-regression_p1.patch
> new file mode 100644
> index 0000000000..e6b81cc0ae
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-28417-regression_p1.patch
> @@ -0,0 +1,64 @@
> +From 2a49c9624cdd552ec975ee8b4f1853a0e4c2a78e Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Thu, 28 May 2026 20:53:53 +0000
> +Subject: [PATCH] patch 9.2.0553: runtime(netrw): netrw rejects hostnames
> + containing _
> +
> +Problem:  runtime(netrw): netrw rejects hostnames containing _
> +          (lilydjwg)
> +Solution: Relax the restriction and allow the underscore
> +
> +fixes: #20344
> +
> +CVE: CVE-2026-28417
> +Upstream-Status: Backport [https://github.com/vim/vim/commit/93d177cd2b6=
9bac58fc51a5a514d7bc71e264b11]
> +
> +Backport Changes:
> +- Preserved Wrynose's multi-line netrw change history and appended the
> +  upstream 2026 May 28 change instead of replacing it with a single date=
.
> +- Omitted src/version.c because this backport does not change the recipe=
's
> +  Vim version or its upstream patch-number table.
> +
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +(cherry picked from commit 93d177cd2b69bac58fc51a5a514d7bc71e264b11)
> +Signed-off-by: Devansh Patel <devanshp@cisco.com>
> +---
> + runtime/pack/dist/opt/netrw/autoload/netrw.vim | 5 +++--
> + src/testdir/test_plugin_netrw.vim              | 1 +
> + 2 files changed, 4 insertions(+), 2 deletions(-)

Hello,

Sorry, but this patch now fails to apply:
    ERROR: vim-9.2.0340-r0 do_patch: Applying patch 'meta/recipes-support/v=
im/files/CVE-2026-28417-regression_p1.patch' on target directory 'bitbake-b=
uilds/wrynose/tmp/work/x86-64-v3-oe-linux/vim/9.2.0340/sources/vim-9.2.0340=
'
    CmdError('quilt --quiltrc bitbake-builds/wrynose/tmp/work/x86-64-v3-oe-=
linux/vim/9.2.0340/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: App=
lying patch CVE-2026-28417-regression_p1.patch
    patching file runtime/pack/dist/opt/netrw/autoload/netrw.vim
    Hunk #1 FAILED at 24.
    Hunk #2 succeeded at 2604 (offset 1 line).
    1 out of 2 hunks FAILED -- rejects in file runtime/pack/dist/opt/netrw/=
autoload/netrw.vim
    patching file src/testdir/test_plugin_netrw.vim
    Patch CVE-2026-28417-regression_p1.patch does not apply (enforce with -=
f)

    stderr: ')

Can you refresh and resend?

Thanks!
--=20
Yoann Congal
Smile ECS


