Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC6CC61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 15:24:25 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3304.1787930659843241432
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 08:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pQx4P203;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so7820325e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 08:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787930658; x=1788535458; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJwoib2X5iLIs/2a97B4L3dvpXwNUO8DgmwUURBJC2I=;
        b=pQx4P203ScVmO4ZlgXoX2q6YGrY0Oj91LKGE7sltkl4hIJL/lRBmViSK1B+4uNe9xD
         I+WCTMSlN7WUvhc//Mz7RQvBti8xEwprfcYKdesGbMsqZXV0XrLrzZEOpNGgllpZGQVh
         MlJctvWYXi9j8v/PsUO/n8qHEJ8oaazH1dBFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787930658; x=1788535458;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TJwoib2X5iLIs/2a97B4L3dvpXwNUO8DgmwUURBJC2I=;
        b=gi+bfOoQXIVzwkgXESJWh3x4gnAp6AyFdH5tVSkDEgHSxQtg80kfmkuP0CQLdeGLz+
         1zPG9QqAD7RjSmWDTOy3uXwf0eoHRiNlZDA+r9WTvIEu/GZPaDYXRuNS8JkxYJdOmKkF
         kvKe+mq2HsrpO5aTVLlKad1e6G2pcU2MN9lqHVGXHl6trkgX2Vt+FHkhlf8embGTV+Sv
         5RmBBVluEuoRVTfnm50Oam1J/zTCSqsDc4kWAwfHKb7I0NqeJR9SRemf2PIPnV8xWU56
         qpJWZJ0fMKbrdN+6DVDa9YQuxV790/QeBHn3nPrBVYPVjoeiQlGG4pZJXV4wHPkDSulB
         fXNQ==
X-Forwarded-Encrypted: i=1; AHgh+Roo8gFyuCiAZODa2ln2QzPIhezVAB8SkM/SGq7TnDO1gAp28WGHcDoi3cuyHF8W/STzEFWIIYFY5+fRHRyqlKJYjA==@lists.openembedded.org
X-Gm-Message-State: AFuF++kl3fkCqy1HGFxxR7r+Dzz42EYZ+0zcpUXNvBAfrtdbvkYKRRNf
	uhvCQRKXdFQE5vlpB8/KUQ+dJuY9+SyZJqn0VbjVg00ZNQDsFGv+SjXdFy6urckn5Yo=
X-Gm-Gg: AR+sD12RZaptAvLnQTvHM7nyoLEx1Nqwc5vMX4m74pn8N/zrjDTPDyEwwpJnMSmg3rb
	/2jF7uUXsiUAyXlJAAbsaf7RO+EKNVNmtYwLWo+18o0PXpHKIsvSfsl1cPAhG8qYTNt5THX6tdN
	fZN2QDm9kA0Wo9HBbF9nrV5SC2aPMGOVFIoPYr1rHAtk0F4jbjFGIhsDBq74eqisK3qMt+dLFrV
	oAdXLpvDPXF2AzXPL7aJf+nHiOg8d0xzGHd5KjkzVTWpddvr6b2qYRqw+iKedIpfwtjUT5bKKvC
	zjMcaSJ+dUXy0Vo6vfZ4VsPaN9+o+UFK2EcJlGwp3trWQSl2N+SQFmilVYJE0DYMcsox6exjP7I
	HDqigJj4fTQaAoCqKExw+L0NEKCFrdD8fXj3YCTcUzhr69OQnU49kwjvBmegsX20cgqTPb1d6Pc
	WJbIo5UCUWG2nf/spT1xITkfO8F61n6nPxxIzacpgRnT5PoPVY06o893CLwxj3ddX/wV3NZG8e7
	g4cZKSuN2j8vc8DZEat1g4/+9ncNriL/DafqzO3+kKt+fVeJJoN
X-Received: by 2002:a05:600c:4715:b0:499:cd34:f7c with SMTP id 5b1f17b1804b1-49b91c26a01mr114822775e9.5.1787930658093;
        Fri, 28 Aug 2026 08:24:18 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dd2517sm60001155e9.7.2026.08.28.08.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 08:24:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Aug 2026 17:24:15 +0200
Message-Id: <DL0OISA3XTZ0.1FABX40IWA0V6@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 6/8] curl: fix CVE-2026-11856
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260805083103.2633995-1-deeratho@cisco.com>
 <20260805083103.2633995-7-deeratho@cisco.com>
In-Reply-To: <20260805083103.2633995-7-deeratho@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 15:24:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244552

On Wed Aug 5, 2026 at 10:31 AM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> This patch applies the upstream curl security backports for
> CVE-2026-11856. The main fix commit is referenced in [1], the
> Digest proxy-state follow-up is referenced in [2], and the public
> curl advisory is referenced in [3]. The individual backported commit
> links are recorded in the embedded patch headers.
>
> [1] https://github.com/curl/curl/commit/5c6b4880357ab3e72967c1c45cae0f96f=
fabc535
> [2] https://github.com/curl/curl/commit/7ec25148c06b049d3252172ff17fae85b=
19c54c9
> [3] https://curl.se/docs/CVE-2026-11856.html
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
>  .../curl/curl/CVE-2026-11856_p1.patch         | 372 ++++++++++++++++++
>  .../curl/curl/CVE-2026-11856_p2.patch         |  72 ++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |   2 +
>  3 files changed, 446 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-11856_p1.patc=
h
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-11856_p2.patc=
h
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-11856_p1.patch b/met=
a/recipes-support/curl/curl/CVE-2026-11856_p1.patch
> new file mode 100644
> index 0000000000..80fb18a7c1
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-11856_p1.patch
> @@ -0,0 +1,372 @@
> +From 3349fbcb7876456cadc3cc3a8d3e8aff29406906 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Mon, 13 Jul 2026 23:17:23 -0700
> +Subject: [PATCH] digest: flush state on origin or credential change
> +
> +Verified by test 1686
> +
> +Closes #21944
> +
> +CVE: CVE-2026-11856
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/5c6b48803=
57ab3e72967c1c45cae0f96ffabc535]
> +
> +Backport Changes:
> +- Wrynose curl 8.19.0 does not have upstream Curl_peer or
> +  struct Curl_creds. This backport stores the host Digest origin
> +  and user/password on digestdata, then flushes stale host Digest
> +  state before reuse when either value changes.
> +- Kept Wrynose test-list ordering and added only the upstream
> +  test1686/lib1686 regression coverage.

Same as previous patch of the series, this is new code that does not
look like the fix from upstream (I can't accept/understand backporting
adaptation but here, I feel like this is too much)

I'll hold this one as well.

Regards,
--=20
Yoann Congal
Smile ECS


