Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDAAEC4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 12:50:30 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21878.1784638228492628391
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 05:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pltHYrxP;
 spf=pass (domain: smile.fr, ip: 209.85.218.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15f020a223so1475025866b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 05:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784638227; x=1785243027; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJ3BhaDyANGqg0vVPdH8kdzXl/RvWH+W6/EmVf0eXGs=;
        b=pltHYrxP94ri7lu9IbSMWVxW750urSCOsgb/xQjd2IkiHpgLVZky5kA11maX7Q/Yj9
         V0CizRnTzdmbVY0RvdNviAjcsOitlS8OTYBgEfmb3JJl3fPGFXzyeZsm1z3+8SWi4WUV
         AATeEUmIeIrD9iEQRL7zCkzmJGMYar73L3DYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784638227; x=1785243027;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bJ3BhaDyANGqg0vVPdH8kdzXl/RvWH+W6/EmVf0eXGs=;
        b=F3+a3qYLPmfulbMetB45Ml8vV0CHFR7gUIfGHpcUTJxPguefcjoM3nkJYXrLhYQTNG
         Yh/vRuDMaVMo7iD1UbR8wA9xtfuiRLD5WxTE51nCzmJd0OjXpgO496Iq4UyVQWPkqjlb
         PKbDg2bFtDpcO97eYgfGLxfy+ColRCt3MYBURH5C/DQvntNuI2LoIwd73tYpBwIHWMTU
         kosaH7R3Ts3xwskthJPe0DT4VdIsCe3T3F9D52GkGrT2vbrTJKrVSdkJi9WV6lNAnBYY
         SM3tldzyRMbLFcb6bYZ9bb0FMSX0vQ6Ky6q9f5weiAIC624DztUg+j1dQLgO3G9ebBqR
         nqJg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4BWQJKIavMZGNYcNNCo4szm128y2of1hlP9Bh6BVbOJuT6/4y7dUF3hGiUIQ/z+vzkm7q5cSUiEfrfZUB0WBJPA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxM6/2P37e+dREAl2bxRflAu6FIAzZyTyAmkbaQ7FWKiOr+uwAe
	QVP+rj1LEjubLzZDtFor2cTD55su4cKxL5Gwzbue5JGjuGBFTYiIDyH5hXJjJthdx/z39Fr/0Dv
	5AeMEKH4=
X-Gm-Gg: AR+sD10nn4MHqCJZci6QPU4JIcNjRFHvL0Y4EgNYUbx+osbkbrUN3/gSvCxaUDSA8Zo
	fX0kuVB6GKWsl/8S44kycQh5XVsNwUXD799afVJXnCnMxwVHMxKKL2fJYWB1J6eIz2PL2e0isTy
	mBI5X/QVjwPh3ASOW8PZpNzbK+8qAttES5rwBWS8LW0OavNI0+vZwEhbMcCMXFejSUNu33+2p3u
	jzO+1OUXHpSIJKyvxx2CPxlGYvH6JWjURGIXUA+uXW5x1eAK27MR1rgIUHsvmawOc1nSd1x9eyy
	WawmqY1utgOhuWuUeBKStRG3hKFT4Uv+zhCpatUdtuP7dsLSgoQ52aBiFiEkjZyDvuyJUaxcpOX
	NSwjsZXCTG4LY5ngiS3xQjeZ0l2cPuTDpRbVXr4YaAEstbsIwfU7P3MLeuu6HgNl4Cau21p4x7p
	yCnU/lh9CWBqD7JEhrioE4PhOQr3fjefy0VKroL/Y/j0vTycsVJIeh7RtwgBBwKBNPUWO7dvdN
X-Received: by 2002:a17:906:6a1a:b0:c15:d4f8:dade with SMTP id a640c23a62f3a-c16b46ad1b7mr755778066b.2.1784638226748;
        Tue, 21 Jul 2026 05:50:26 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705a08476sm600623166b.17.2026.07.21.05.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 05:50:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Jul 2026 14:50:26 +0200
Message-Id: <DK49GAUJHEI0.3QSAI67N4ZDB5@smile.fr>
To: <adarsh.jagadish.kamini@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH] libssh2: fix CVE-2026-58050
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260717135220.869830-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260717135220.869830-1-adarsh.jagadish.kamini@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 12:50:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241519

On Fri Jul 17, 2026 at 3:52 PM CEST, Adarsh Jagadish Kamini via lists.opene=
mbedded.org wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Backport patch to fix CVE-2026-58050.
> https://nvd.nist.gov/vuln/detail/CVE-2026-58050
>
> Upstream fix:
>   https://github.com/libssh2/libssh2/commit/7c8a170c6dca3cd4cf24de836f43b=
a1a20e662d5
>
> The upstream commit uses the shortened private-symbol namespace
> introduced in commit 076838de2697a4185125bfd601fbcd6e7286bfb6
> ("src: shorten namespace for private functions and macros"), which is
> not present in libssh2 1.11.1. The only change made when backporting was
> to spell the helper calls back to the names used in 1.11.1:
>
>   ssh2_err()     -> _libssh2_error()
>   ssh2_ntohu32() -> _libssh2_ntohu32()
>
> The added "> LIBSSH2_PACKET_MAXPAYLOAD" cap checks were kept as-is,
> written against this tree's existing bounds-check style
> (s + len <=3D data + data_len).
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>  .../libssh2/libssh2/CVE-2026-58050.patch      | 177 ++++++++++++++++++
>  .../recipes-support/libssh2/libssh2_1.11.1.bb |   1 +
>  2 files changed, 178 insertions(+)
>  create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-58050.p=
atch

Same as the wrynose patch. This needs a fix fox master.

Regards,
--=20
Yoann Congal
Smile ECS


