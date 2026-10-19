Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19344CCF2E5
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 14:49:32 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36658.1792421369803073777
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 07:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gVK+Yt7K;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e04773687so554591f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 07:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792421368; x=1793026168; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kdp8kHzuq9iO0ZH+V0Hn7nobbAhEn1mgJ19yjnDZ2A0=;
        b=gVK+Yt7KrmanWlyYy6j8f4DOTGTtyFu6nGR6skAnHUtbFIhjgSglSrOb/MeZfEozBb
         oBXqcTx5611WMSS2IQaYeHrQs/lGfII7AGXGu7A4ttKp9DviCLxRxIbMBHMJ3Xhk34LV
         etbTLjxIg94TgqbUgdaiF8gfyazwcztTMtwPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421368; x=1793026168;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kdp8kHzuq9iO0ZH+V0Hn7nobbAhEn1mgJ19yjnDZ2A0=;
        b=eRU0LaubpWUICLXG9pLj4WpqMjctW/yz8qXzQc3EBIMxszbp5GtuasGU2p8EhLxOBV
         3qgJW1e+d+DoNhs4xwgZsEHedH2CjJnf4GrguMfejgA1u+40JMGTCDazYT4/5ODXttwK
         yGOR7qf8fDfFjbQSUd0XmxSQS7oa5/hU5xZ6EATnQbZ/FI+6QUMvT4g8f8hpfxT03pzu
         c3TmXftJCpMi9qnXOMrU2hsLjIVHOHPClfCcVCezuo3SpVuIf9dppgD1o50ia/gjhsQ8
         Dykdc7f2pSbLlGm/EN9SzrLgbVTHgPkrIopkDL9jbWbzJrKlFtVs0BheaebRzESCb6TR
         rYkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfXF3UcWRmUaznKyX7nhXZJiSCw5y3Yg7A2LInml3aK1PX9yKsSqFvSs+B4+KAfu51sHmnkLCx3vKXd23c9f4ATw==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKqWHY1j70JxK4ukw6hFFQMOE00g6tfriulEL3/Zs+MY7Hoi8vH
	zXj6k2T0QdcPN1wniTtw4Prbn98XQRdfSJ/vY98fmLoDynJaanrpHASQNah2u1O4e0g=
X-Gm-Gg: AYBFou1e6lHRs3ARH5AdSw/bHkvP3ryLKrAMCqMNSwn1CKzkJOnn997T/QpdhoAU4DI
	/UduBsDaMbhHYTiJGXA/Wr8rQpIvxtzHp/cWVtww/leB8CDmlsZ3TmIehKaPuCFZXD1FYRX/Tlm
	iL4hamgj0bEWzCxYAI1+PhEONgXW+RMMGtrz3BYOoj77TqLWA9tiGgOjY1soX/1DSiLMX61Cpgz
	ml0EHwsmSGOnFOFwxkgTe+jB2F16O48TS+ULIQ+CUEcNyJ8OZz49DO5p1O/lTSQQjBA4cx8AlCN
	TXDOfwNG1YvEeFbtA1tpdA7NCQDjpGy9ZTyPh2iag0fNm9Dc7zg7KTN//7tk8Nn3UvDULiy0UcX
	7LaygJGvfMKAxIqHwUIhhxVb+RYNT3NN8dvT/N4nlttWpkJ42sG2JEicLlC1jSCbAMNRvaiQXFe
	rKr+2UhKmdPkd4H0TqoTgwolla5sSzaUWmBgEbnl/LYauGvhb9P13LBVIVnyJ0Fx+OQkJWSjWzB
	woEScCaLJatj+r3fNOYb5hqzaBec2qWg3KCydq1z4HpWN5SvvT3M7sMP2riDA==
X-Received: by 2002:a05:6000:24c5:b0:488:7b66:140c with SMTP id ffacd0b85a97d-48e07bc17f7mr13763671f8f.28.1792421367634;
        Mon, 19 Oct 2026 07:49:27 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1afbf534sm2162501f8f.35.2026.10.19.07.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:49:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 16:49:27 +0200
Message-Id: <DM8WCGGVI4ZL.3I5WIFP214YLF@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 1/3] busybox: fix CVE-2026-38752
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261016065314.3923094-1-dkelaiya@cisco.com>
In-Reply-To: <20261016065314.3923094-1-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 14:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248180

On Fri Oct 16, 2026 at 8:53 AM CEST, Darsh Kelaiya -X (dkelaiya - E INFOCHI=
PS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> This patch applies the upstream fix shown in [1].
> The advisory identifying the fix is referenced in [2].
>
> [1] https://lists.busybox.net/pipermail/busybox/2026-June/092351.html
> [2] https://nvd.nist.gov/vuln/detail/cve-2026-38752
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  .../busybox/busybox/CVE-2026-38752.patch      | 83 +++++++++++++++++++
>  meta/recipes-core/busybox/busybox_1.37.0.bb   |  1 +
>  2 files changed, 84 insertions(+)
>  create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-38752.patc=
h
>
> diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-38752.patch b/met=
a/recipes-core/busybox/busybox/CVE-2026-38752.patch
> new file mode 100644
> index 00000000000..52cba2417e7
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/CVE-2026-38752.patch
> @@ -0,0 +1,83 @@
> +From e886726a2f0ad397666687a5fc65c4e80240f964 Mon Sep 17 00:00:00 2001
> +From: Sanghyun Park <sanghyun.park.cnu@gmail.com>
> +Date: Tue, 16 Jun 2026 12:16:05 +0900
> +Subject: [PATCH] awk: fix stack overflow in evaluate()
> +
> +Recursive awk functions can keep re-entering evaluate() until the
> +process stack is exhausted. Track active function-call depth and report =
a
> +normal awk error once the limit is reached instead of overflowing the
> +stack.
> +
> +CVE: CVE-2026-38752
> +Upstream-Status: Submitted [https://lists.busybox.net/pipermail/busybox/=
2026-June/092351.html]
> +
> +Signed-off-by: Sanghyun Park <sanghyun.park.cnu@gmail.com>
> +Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>

Hello,

For the whole series:
Those patches are needed for master and blacksail.

Also, I don't like using new "Submitted" patches in stable for maintained
project. I know busybox maintenance is not ideal right now but maybe we
should ping/help upstream to get these fixes merged?

Regards,
--=20
Yoann Congal
Smile ECS


