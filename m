Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C70C982D2
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 07:39:49 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6161.1789717185248050604
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 00:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hjMQkq5T;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so2066425e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 00:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789717183; x=1790321983; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VOeKQwNNTxsLuV4MhmmJhFoPN1UjRHBvWxmionXZsQo=;
        b=hjMQkq5TzO61CUR34rjSzd8z4saXpfSZBsd3vQIG8qDOa4UEIKz48uglsLsCR0oIm9
         RQWVI2bP2gScAPvGaMoHSOOofhaMO03p+Qk2Z3F74VHy7JFnOqN5a9GIN/0kaJ7e9UWS
         IbEdlVBo2Xqn84YV9HwS2fiqTQjet6e34XTjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789717183; x=1790321983;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VOeKQwNNTxsLuV4MhmmJhFoPN1UjRHBvWxmionXZsQo=;
        b=vuMxMWg0XkHrcFSFjj5UtjQwqcQS//81UL8BqC1+ZROgCikyzW3AsuS4LHNgvIqJLb
         F6cQmAlhtrAUtK84LF9SZK+unP85KWPfc6nTw6U/yfe95YQ7SO/uvK8QNxo9z0RNDqeT
         CvKuhBeRv2xZEWWgurEUVkJjJs0UFnDiGzO1o4sP30eF/qm/sMdPUxKk8Ap0XqHASofU
         Sk6REn+lfaGjwVMsO4OJRbjnX1On7ScrV5U2oXVOdiVhVWLFn1hybukQZ4d9oTlUlIsP
         Aa2nKY/dcg+yVYnKtVhOa6mAZpAbvZPli6MsVcVweNe0qqTD9zJYPOVfLCenBeCeBnOr
         Dzeg==
X-Forwarded-Encrypted: i=1; AKwUvBx6Uuplchg1Jf40FnnUusJL8uryCy8q64HwVKktrJNbMW46eAkOYeThyutcwFFA+zHBdgvLaOcpUPeogE3kzLilLw==@lists.openembedded.org
X-Gm-Message-State: AFuF++ldGuD9moBWq+MUGkGla2Zyx9HBTFjDDx5nVp8gZoDFSvrdtuaN
	PaMHUquycCqDTEeon4tNkgXoA6kAZucp/XPV9Wr1TqaZ/TGM09QCx9CUQQ7IL7SQdrI=
X-Gm-Gg: AYBFou05V3fkBlCkwYi+sr+Xkx2IokX84UAfEfKGj83OopWTHdk0OJxrbTBDQ/+TAbm
	e/Eocfwr79OJsqHY0K3StZ/RmFQAGw9GfaalMh6U7G5AIRr6w6mxybknTftp0QBh/7k8C4XAoDv
	xHgJRb7LGpjrBgewvWRZxUoeoyo+O35TgQTP7m4hGL6L4u8nN5tUxZQO1e12PIWVs6vRQukaf1c
	WjI/yB3qR0At8MUmEEeBVGEyTjPNIyL5uFc6mlbmJUPIuhi8md4VYLYIJleUDH6KXB4g2FOcPdx
	F/5a0lM5jboGWjs0NX1gjAIO4iiqK4OJLdqeJadjNZoY6RTkNLPKUXSrqL4vpxUEPrw/hA2ZwdU
	Di6+4YTvttuWls7+CGG0Z7Lo87xEwysxhhULUkFK6YE2AQn+lX8LoklPzomd/U9bN6YMduKxJdP
	yH89vdmIvpkVDsh19xB9ObFWMiZPWyX94Om1IJjIDOYj/en4FuZrW5e9WKLqN8bcGRSeQjzkmy/
	8eDwOaL4gXYR+FZ1BCTgI0sz3HJAQJfwYk66kSBR+blDjOLW2Mbo9rOjmiG518h
X-Received: by 2002:a05:600c:4f50:b0:49e:70b2:66ab with SMTP id 5b1f17b1804b1-49fc55947d5mr19804405e9.0.1789717183490;
        Fri, 18 Sep 2026 00:39:43 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd17051fsm137647205e9.0.2026.09.18.00.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 00:39:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 09:39:42 +0200
Message-Id: <DLI9SJBJS4BF.28AZGGJ901FO@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 1/2] python3-pyasn1: fix
 CVE-2026-30922
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <yurade@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260827063129.3205882-1-yurade@cisco.com>
In-Reply-To: <20260827063129.3205882-1-yurade@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 07:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246193

On Thu Aug 27, 2026 at 8:31 AM CEST, Yogita Urade -X (yurade - E INFOCHIPS =
PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> This patch applies upstream fix for CVE-2026-30922 as referenced in [2],
> using the upstream commit identified in [1].
>
> [1] https://github.com/pyasn1/pyasn1/commit/25ad481c19fdb006e20485ef3fc2e=
5b3eff30ef0
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-30922
>
> Signed-off-by: Yogita Urade <yurade@cisco.com>
> ---
>  .../recipes-devtools/python/python-pyasn1.inc |   1 +
>  .../python3-pyasn1/CVE-2026-30922.patch       | 260 ++++++++++++++++++
>  2 files changed, 261 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-=
30922.patch
>
> diff --git a/meta/recipes-devtools/python/python-pyasn1.inc b/meta/recipe=
s-devtools/python/python-pyasn1.inc
> index 96b4a3b52a..d69cdf8877 100644
> --- a/meta/recipes-devtools/python/python-pyasn1.inc
> +++ b/meta/recipes-devtools/python/python-pyasn1.inc
> @@ -19,6 +19,7 @@ inherit ptest
>  SRC_URI +=3D " \
>         file://run-ptest \
>         file://CVE-2026-23490.patch \
> +       file://CVE-2026-30922.patch \
>  "
> =20
>  RDEPENDS:${PN}-ptest +=3D " \
> diff --git a/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.p=
atch b/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.patch
> new file mode 100644
> index 0000000000..aad4829f82
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.patch
> @@ -0,0 +1,260 @@
> +From b10f9a671c66a99b91bd916e62a0c81541094dd6 Mon Sep 17 00:00:00 2001
> +From: Simon Pichugin <simon.pichugin@gmail.com>
> +Date: Mon, 16 Mar 2026 17:23:11 -0700
> +Subject: [PATCH] Merge commit from fork
> +
> +CVE: CVE-2026-30922
> +Upstream-Status: Backport [https://github.com/pyasn1/pyasn1/commit/25ad4=
81c19fdb006e20485ef3fc2e5b3eff30ef0]
> +
> +(cherry picked from commit 25ad481c19fdb006e20485ef3fc2e5b3eff30ef0)
> +Signed-off-by: Yogita Urade <yurade@cisco.com>
> +---
> + pyasn1/codec/ber/decoder.py     |  10 +++
> + tests/codec/ber/test_decoder.py | 116 ++++++++++++++++++++++++++++++++
> + tests/codec/cer/test_decoder.py |  24 +++++++
> + tests/codec/der/test_decoder.py |  42 ++++++++++++
> + 4 files changed, 192 insertions(+)

Hello,

Thanks for the patch but it does not apply cleanly (surely a conflict
with the other recent CVE fixes):
    ERROR: python3-pyasn1-0.5.1-r0 do_patch: QA Issue: Fuzz detected:

    Applying patch CVE-2026-30922.patch
    patching file pyasn1/codec/ber/decoder.py
    Hunk #1 succeeded at 38 with fuzz 2.
    Hunk #2 succeeded at 1520 (offset 4 lines).
    patching file tests/codec/ber/test_decoder.py
    Hunk #1 succeeded at 2048 (offset 60 lines).
    patching file tests/codec/cer/test_decoder.py
    Hunk #1 succeeded at 389 (offset 25 lines).
    patching file tests/codec/der/test_decoder.py
    Hunk #1 succeeded at 396 (offset 34 lines).

Can you rebase and send a refreshed v2?

Thanks!
--=20
Yoann Congal
Smile ECS


