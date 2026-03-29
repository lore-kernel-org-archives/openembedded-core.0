Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81840FC97FA
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:08:37 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37920.1774822109800657020
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QHZqADzz;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486b9675d36so31662375e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774822108; x=1775426908; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehxnE+LXvFv6Zi1PMRJjB7UXilmthWorFKelS6KcrZk=;
        b=QHZqADzzdueWzn4/6B1FQer7gUcigOD6LK/ad8raV2Q4P0yyQbIfM694OpGDGGTlp2
         V9ycUsPTxM5DeDZ7uTcsJ48BbbvGBpkBCWKfoDMduJ42baNiLBZHmSjng5TiA99DLkYC
         fIb2GaPemLh8ruU4TC05qMCUrFUfkxwDYDUUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774822108; x=1775426908;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ehxnE+LXvFv6Zi1PMRJjB7UXilmthWorFKelS6KcrZk=;
        b=rJHEbUj+WdmT1+q1JO/fGsFSXb/9ddKVm65nFpJVYzETHIwd8uWB8Kc7XhxVXILbxQ
         iGv4EpTL1qGPmqrixZg5/UsOHKbeOk5XZIQw0FJkAf3r+tXfNNSZKetXMPGKYtSqeui9
         jr3EDN6ZuQJ2bqGM88NCa03hq82YiMAk/kAdkY07SPtpOsKCfF50JVzZZ4iOvPqJ4KxD
         M5cnj/Mu8fDt7zfe90XsJovVIOYeKcLvZCcDJL7LccAqok+NtVO8geJTO872SDIVzU1a
         M/GAmJho3Lgbbpp2Y5XAOkgXo5PdAtbrdz3cV/gXtQiyUL+FDAvnuZ7V+nQABdxWK//d
         qHZw==
X-Forwarded-Encrypted: i=1; AJvYcCWLGAHhWWvdutahoF4lJjNCjuSE3dDF+xcT4HQ+DRtOh4cgzIPJXptc7RevrVQ+y0WuIiq7viVhMq10byRIVA6Rew==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz29QcfC6fcPC9AFRWtDOPiGVJ+BD0TWVf57swss9Shu6024i3o
	FGo9QWA7FnntXW+h2749Qi4MKlL/y6l3zAIiPZHPbbEacH5EM3va0KMM5gasS8SZbww=
X-Gm-Gg: ATEYQzzk5vcsKBcl4IZeD0CnsQuM980EyEjedwZub+Njqmzo7RsFWIjwmCyFXnfCJkx
	I8fFZQwqiNQ4AjSjn8DlIEnF/UXsANqXCmUyAuSyQSshRerZaZIvngVvXcWWYIFKatHlK7vg0zk
	nfXIPn8mPqyuKOaRe+hJbm7nm1SqoKo+tOxKK2hlBCAOo5TVbQmUB30MJQGD8VllSHi/tduLDJE
	DC2wIFmAakF4Evv5LeEZ8YL7ABnmJ3LpFM0mGY2wEN6KptfwiaRc6UFcqT6lo35Lj+9WRXlri6E
	jiUkQtBQ3/0AXSecoNfjqigu2TjczeLQW6BZqTidTjtUmMRYll3mCToBBAG43bVwggZGh4mDg9c
	Elqksf9RND1LxtvCbTgPjCm7iU1bd2wolXE9sbwBGTQ5T4NQ1Cg7oNi9+761UqgLtnPlySCebbI
	pWzRSQKpmOkOvACsC8QpvOn7VlYm0bNN2AsKkudeKNLZJk5DldzjDKzHOD5hPjS6N2B2yUYwzyO
	67ESN49g9zjQSs=
X-Received: by 2002:a05:600c:1d15:b0:485:2fc5:3a5 with SMTP id 5b1f17b1804b1-48727edf4f5mr168914075e9.26.1774822107951;
        Sun, 29 Mar 2026 15:08:27 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487271be661sm62157695e9.35.2026.03.29.15.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 15:08:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 00:08:27 +0200
Message-Id: <DHFLXG1K82R7.3EOQRZ2H6KW8Q@smile.fr>
Subject: Re: [OE-core][scarthgap][patch] gnutls: Fix CVE-2025-14831
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260217081454.864791-1-vanusuri@mvista.com>
In-Reply-To: <20260217081454.864791-1-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234157

On Tue Feb 17, 2026 at 9:14 AM CET, Vijay Anusuri via lists.openembedded.or=
g wrote:
> Picked commits which mentions this CVE per [1].
>
> [1] https://ubuntu.com/security/CVE-2025-14831
> [2] https://security-tracker.debian.org/tracker/CVE-2025-14831
> [3] https://gitlab.com/gnutls/gnutls/-/issues/1773
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../gnutls/gnutls/CVE-2025-14831-1.patch      |  61 +++
>  .../gnutls/gnutls/CVE-2025-14831-2.patch      |  30 ++
>  .../gnutls/gnutls/CVE-2025-14831-3.patch      |  45 ++
>  .../gnutls/gnutls/CVE-2025-14831-4.patch      | 200 +++++++
>  .../gnutls/gnutls/CVE-2025-14831-5.patch      | 500 ++++++++++++++++++
>  .../gnutls/gnutls/CVE-2025-14831-6.patch      | 119 +++++
>  .../gnutls/gnutls/CVE-2025-14831-7.patch      | 150 ++++++
>  .../gnutls/gnutls/CVE-2025-14831-8.patch      | 105 ++++
>  .../gnutls/gnutls/CVE-2025-14831-9.patch      | 437 +++++++++++++++
>  meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   9 +
>  10 files changed, 1656 insertions(+)
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-1.p=
atch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-2.p=
atch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-3.p=
atch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-4.p=
atch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-5.p=
atch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-6.p=
atch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-7.p=
atch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-8.p=
atch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.p=
atch
>
> [...]
> diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch b/=
meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch
> new file mode 100644
> index 0000000000..27ed995d8d
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch
> @@ -0,0 +1,437 @@
> +Backport of:
> +
> +From d6054f0016db05fb5c82177ddbd0a4e8331059a1 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin <asosedkin@redhat.com>
> +Date: Wed, 4 Feb 2026 20:03:49 +0100
> +Subject: [PATCH] x509/name_constraints: name_constraints_node_list_inter=
sect
> + over sorted
> +
> +Fixes: #1773
> +Fixes: GNUTLS-SA-2026-02-09-2
> +Fixes: CVE-2025-14831
> +
> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> +
> +Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/d60=
54f0016db05fb5c82177ddbd0a4e8331059a1]
> +CVE: CVE-2025-14831
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + NEWS                        |   7 +
> + lib/x509/name_constraints.c | 350 ++++++++++++++----------------------
> + 2 files changed, 142 insertions(+), 215 deletions(-)
> +
> +#diff --git a/NEWS b/NEWS
> +#index e506db547a..96b7484fdf 100644
> +#--- a/NEWS
> +#+++ b/NEWS
> +#@@ -14,6 +14,13 @@ See the end for copying conditions.
> +#    Reported by Jaehun Lee.
> +#    [Fixes: GNUTLS-SA-2026-02-09-1, CVSS: high] [CVE-2026-1584]
> +#=20
> +#+** libgnutls: Fix name constraint processing performance issue
> +#+   Verifying certificates with pathological amounts of name constraint=
s
> +#+   could lead to a denial of service attack via resource exhaustion.
> +#+   Reworked processing algorithms exhibit better performance character=
istics.
> +#+   Reported by Tim Scheckenbach.
> +#+   [Fixes: GNUTLS-SA-2026-02-09-2, CVSS: medium] [CVE-2025-14831]
> +#+
> +# ** libgnutls: Fix multiple unexploitable overflows
> +#    Reported by Tim R=C3=BChsen (#1783, #1786).
> +#=20

Hello,

When I reviewed this patch for whinlatter, I asked for this commented
hunk to be removed. Can you also remove it here as well?

Generally, since you often send patches for multiple stable branches in
parallel, when you get a review for one branch that applies for your
others patches, please fix those as well.

Thanks!
--=20
Yoann Congal
Smile ECS


