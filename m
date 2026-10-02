Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 659C7CA5FC4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 14:54:42 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14130.1790952877249898406
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 07:54:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=u4t2j2Ep;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso948845e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 07:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790952875; x=1791557675; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pc178Tne1jq+ie4BKdhIE2LMl2/8yaX5KUNjt29bWKA=;
        b=u4t2j2EpoJCk4YjFVAkOo2s36MIzfP1sNoOgfb/wqQU3BiXMGPhD3vix6Ytydcmz5O
         d6Tq+STZK+C3TsxilCVcVZalo2AOlni2frcjm6011ElWtDHfG6JZjDdFNYUdINU7IE2V
         x+c1836mPNCm8oy4Mhu3t/PkZSbBB1ClsfT9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952875; x=1791557675;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pc178Tne1jq+ie4BKdhIE2LMl2/8yaX5KUNjt29bWKA=;
        b=zZR+xpyAac0KTkomCyOwXSw3se4200GSu90ig7hi3zLNZwmeOsCgqx/leOeEq8Qfao
         cnB6kjrZjcUyaOz6incdd1KEsfhkZTgmtn//ynK4ag19G7Ij3R7qWPv7q1s6jlprg5G3
         kqiU+SKpyCeW28RKZxEXXtuSdyphCrqac7rego301PqMxmUD+v/y7RBmVuYdSElGx+37
         akSWlY8zJWrJHiSajc3h7Tbamc/cKA5iYq9FaYBzwxO2YXkDPaTpSbyvyIiBBxOCaPfo
         BkrNDXBHIGkFPFDjmAw87hRCc6r/BtnWVWIxnaergif+Hxm5e6xFzuX1EKxcCD/CvzFc
         c1Lg==
X-Forwarded-Encrypted: i=1; AKwUvBzIlF5ZkWSr/4RUS7ZIBbGjEO9LFr2GUoQZxnMWaBv5eogmRZmb1UM9Uoya7fy4DSF22jRdn2PEbxRP4+pUUteCww==@lists.openembedded.org
X-Gm-Message-State: AFuF++nWDg12dlk9D771wnzPTW1lpzvZaNwOWtZDa/+wFOY5uvmgcsf2
	dcXfh4o4nl3l6UL0WBoCRi0Ltu1zA8x9rFb8TCEdt2WLdsiK90abWrxPkEdgZAAp7ic=
X-Gm-Gg: AYBFou2SQB6FywiWlmn/MjKyHLsApCz/r0OYtmsfRHhvs2qvU1dDv+pJl0EojIuf+xu
	IDSr9gVuTFmmLNXHfQKwMNoZyXbXKbWjbUGlvEfp0gMuQHKkImPo+iCE6o+1uQzhCisD0O4Ok1v
	ZC6P3vrE4bd++ATHKx8LhbQvKz/5XO++6ZrRNeNq+bcytabU0P7j1ZWgPKcM+sLhEryA1wHMA8c
	n9lOszSLfuOPoWMECWmUFtqOuw+h5U4tzmYpu8m9dyEVkmYWnE2I94LCWZjntRU/G5AMms5RsjC
	CRUNvKDHK9N9ZXKVyqXNivMMdC+R/wO+UCRYAjMmwuTgxczuthRauc563V8mKk3Y1ahzfj7KOOZ
	frtZE6w8DBoh3rtAZyREUHlXwL3mNKZraISYoQo9+DOtb5ZP9cNVV35VgYHPJ+o/Esh2nbRwTFR
	CetJOnStWNmarxhhNFsqS7V7tcYFhbImyyRpdzpXeaU8jtsPZuzBuiOXg9Tq5GvqH/eI2PyFUyL
	7Ftn7aXHw8eeItbEBBSDScgnqztDY/7F4/7hSlOmYZP5+xl7u1FsiPE6KhEhg==
X-Received: by 2002:a05:600c:4ecf:b0:49f:ce78:3567 with SMTP id 5b1f17b1804b1-4a02769ceefmr57846575e9.24.1790952875479;
        Fri, 02 Oct 2026 07:54:35 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03043fae5sm49804375e9.0.2026.10.02.07.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 07:54:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 16:54:34 +0200
Message-Id: <DLUFT4G4X0QQ.1WWAWI0DCK1AW@smile.fr>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 7/8] libxml2: Fix CVE-2026-86143
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260929041836.2217090-1-hthakar@cisco.com>
 <20260929041836.2217090-7-hthakar@cisco.com>
In-Reply-To: <20260929041836.2217090-7-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 14:54:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247125

On Tue Sep 29, 2026 at 6:18 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> [1] https://github.com/GNOME/libxml2/commit/90f293ba74d28b1d570920382e707=
586f68ebf35
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-86143
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  .../libxml/libxml2/CVE-2026-86143.patch       | 91 +++++++++++++++++++
>  meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
>  2 files changed, 92 insertions(+)
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86143.patch
>
> diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86143.patch b/meta=
/recipes-core/libxml/libxml2/CVE-2026-86143.patch
> new file mode 100644
> index 0000000000..228b5136bb
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86143.patch
> @@ -0,0 +1,91 @@
> +From 83259eee08067b547d2aaedd436504939b2c343b Mon Sep 17 00:00:00 2001
> +From: Daniel Garcia Moreno <daniel.garcia@suse.com>
> +Date: Mon, 4 May 2026 09:54:34 +0200
> +Subject: [PATCH] xmlIO: Check for int overflow before calling writecallb=
ack
> +
> +Fix https://gitlab.gnome.org/GNOME/libxml2/-/work_items/1111
> +
> +CVE: CVE-2026-86143
> +Upstream-Status: Backport [https://github.com/GNOME/libxml2/commit/90f29=
3ba74d28b1d570920382e707586f68ebf35]
> +
> +Backport Changes:
> +- Change nbchars to size_t in both Scarthgap write functions before assi=
gning the size_t result of xmlBufUse(). Add the INT_MAX guard to both xmlOu=
tputBufferWrite() callback paths. The upstream commit assumes earlier refac=
toring that changed nbchars to size_t and routed xmlOutputBufferWriteEscape=
() through the protected write path; the existing flush guards are retained=
.
	 ^ wrap at 80 chars please. Also, this is not easy to understand,
can you make it clearer?

> +
> +(cherry picked from commit 90f293ba74d28b1d570920382e707586f68ebf35)
> +Signed-off-by: Hetvi Thakar <hthakar@cisco.com>

Thanks!
--=20
Yoann Congal
Smile ECS


