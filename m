Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A89C61DCB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 15:07:25 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2894.1787929636527642853
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 08:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HRejrzTU;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-482fc3327fdso405627f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 08:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787929635; x=1788534435; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9g4rOzq+kP6l+jm2VtN18fro8SRMwWOjwhDA/namzX8=;
        b=HRejrzTUmwJY5N9gq76001+GCkzld2pWlljWyU9tBLniVEYAfgYjE01QF7P8rBZNf2
         34hFAiqR4szstVI1KG5VJlLmwP/ifRW8idT9irlDRsPU3orI+T1zAmBubNu7AA09Qrff
         +pKsQ+o+6nXEyvvx6DcLcZZWskHdhwfJW77U8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787929635; x=1788534435;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9g4rOzq+kP6l+jm2VtN18fro8SRMwWOjwhDA/namzX8=;
        b=QOEN/pfo/RJyQIaYDim+Jv9M+skp1nuVeLgwyWJDhn65/zT1yRnzCtAJOqFiD/yiv1
         SPi54qbH2v3HVTg1Rs6sQDyv6/HZbSrALUWNWeYZs9kwUTZgdSz7+Hd5GjSV6vHCsOrH
         vyYa7bFmgtc+e5Y6e2uNSEyhnpPCiq7OFnIsddsjXjMmcW93799l0w5yHDHDByjz+/rn
         yFU8G3GOWXEOMYKXgwCDzkLVBnCMhSsXSuKKtCPSGkyzm39Vh5eZ4n/gGbaSjUKZFOCN
         iZ2eoqj4uraQoFLwQwoQm++b7WdmtC1ZPhSRwba+ydw/1HPPTTg8E98DmT2cYaj3gA8Y
         m0hg==
X-Forwarded-Encrypted: i=1; AHgh+RoUyHTU9pDAdo9NJhHtglVgZkXcnREE3Ofgms4zLKIE+tAPi0KIXFAxkCIK9T0wY7/cnhxSHu3+Fb1Gylq1El3nUw==@lists.openembedded.org
X-Gm-Message-State: AFuF++lXi1mFt2aaTVKt1t8fCDpCveuaEU9uu4CaZhKuas3Ba0/JYk3X
	Q3RcxPC8ixh2UOZH11e+Gvw0oV3EYPZBlNJ0zno9XLuKm4Mu3nK9zutXFDog2Ju4Qzc=
X-Gm-Gg: AR+sD10dxhWzyTltMVssrddPFDCV0LKhdemjco3b4OO7M2CUfm5bXqKN2ulE8+5WV5x
	A3eXoExZXibD26t2w/xrIcpOtE1XHTwBxBl3RmdReTI646z5nDeBYO99DIJEYkzVsjmAFo34MQW
	oMRXs3W7KJ5yG+WoDf1T5O1YcL7/y5jcoE6I8Ke0juytKk2xsFZfKI4QgQEdje28ejdPDv+CxD1
	PGyt3Pe0o8007rUVxZWnue38zpE8y8GxQQXFPcWvg1d2DQUF4eRX2egPPZjHT3z9nLPT7j6i+UF
	X9L+3Ng/t8cFLsnx3ZG3MPPBS+WzwKaFcJwsR87eUFQ0h+NqsewuP/tjc7pwJW1GUPTRBqdrS+H
	XO+HXLiXVjXYSJ0Yhg3MCIGFkr8S1XkN/2xvu8DhQ3OSGp12xAriLv1t3EH33Rlk/yf1LAr7sYM
	A7H31MxJnGh411HqHUyR4cogAoj/MMLghfMAVLFKjzy8IKmhQ2qD1jBM0MQlyyfdmP4gQ69LJiU
	HUUG6viMYAXfFS6aPq6f5XLJWthZzL1qXXLjRwDKPHQmpp34gAE
X-Received: by 2002:a5d:64c5:0:b0:47f:8b24:ef01 with SMTP id ffacd0b85a97d-482f7977aabmr11520289f8f.1.1787929634667;
        Fri, 28 Aug 2026 08:07:14 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac7c01sm4558719f8f.14.2026.08.28.08.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 08:07:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Aug 2026 17:07:13 +0200
Message-Id: <DL0O5QQ1WOZH.1U9GTXHUPTC79@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 5/8] curl: fix CVE-2026-8458
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260805083103.2633995-1-deeratho@cisco.com>
 <20260805083103.2633995-6-deeratho@cisco.com>
In-Reply-To: <20260805083103.2633995-6-deeratho@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 15:07:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244551

On Wed Aug 5, 2026 at 10:31 AM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> This patch applies the upstream curl security fix backport for
> CVE-2026-8458. The upstream fix commit is referenced in [1],
> and the public curl advisory is referenced in [2]. The backported
> commit link is also recorded in the embedded patch header.
>
> [1] https://github.com/curl/curl/commit/5e99b73cf441d9c369768b9cd48b5389b=
9a2503d
> [2] https://curl.se/docs/CVE-2026-8458.html
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
>  .../curl/curl/CVE-2026-8458.patch             | 202 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
>  2 files changed, 203 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8458.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-8458.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-8458.patch
> new file mode 100644
> index 0000000000..6340f5305f
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-8458.patch
> @@ -0,0 +1,202 @@
> +From 01ce94b67888e6efa4196247302e59cf68e77b2d Mon Sep 17 00:00:00 2001
> +From: Stefan Eissing <stefan@eissing.org>
> +Date: Mon, 13 Jul 2026 23:13:37 -0700
> +Subject: [PATCH] creds: add sasl service name
> +
> +The SASL service name, used in authentication, is part of curl's credent=
ials
> +when authenticating to a server/proxy. Make it part of `struct Curl_cred=
s`.
> +
> +Change code to use `creds` to obtain a service name. By tying creds used
> +to the connection, connection reuse is also only allowed when the servic=
e
> +name matches.
> +
> +Closes #21585
> +
> +CVE: CVE-2026-8458
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/5e99b73cf=
441d9c369768b9cd48b5389b9a2503d]
> +
> +Backport Changes:
> +- Wrynose curl 8.19.0 does not have upstream struct Curl_creds.
> +  This backport stores the optional SASL service name on the existing
> +  connectdata/proxy_info structures and compares it during connection
> +  reuse for the same security behavior.
> +- Omitted the upstream unit1304 Curl_creds_create() signature
> +  adjustment because Wrynose 8.19.0 does not contain Curl_creds.
> +
> +(cherry picked from commit 5e99b73cf441d9c369768b9cd48b5389b9a2503d)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + lib/url.c     | 61 ++++++++++++++++++++++++++++++++++++++++++++++-----
> + lib/urldata.h |  2 ++
> + 2 files changed, 58 insertions(+), 5 deletions(-)

This patch looks nothing like the upstream patch and is basically new
code. I'm not confortable merging this.

I'll hold this one for now and continue with the rest of the series.

Regards,
--=20
Yoann Congal
Smile ECS


