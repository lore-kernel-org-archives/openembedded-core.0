Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9F1CA9EBB
	for <webhook@archiver.kernel.org>; Sat, 10 Oct 2026 00:03:37 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.805.1791590609579944830
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2026 17:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=keprtW6L;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso3845105e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 17:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791590608; x=1792195408; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k0KT/uorS9XmoY5IFwj6u1ezzMAvhrXJsPdJQHGiVmc=;
        b=keprtW6Lis1U84cPK9tXD8U005Dg2tb4M4KBQSXr6mCcI3Ua5bUDq1AqEnTjvcYr6l
         Hw8TI0Ukt3wjx/yn+P0nv4/JmaAdHvDImU877JcSBBd+ac/FFWZC18CosN/9dRTyC4Om
         Y/Tr/HTfjPBbEihp28UdgSCO4MoFSzw5EXyxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791590608; x=1792195408;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k0KT/uorS9XmoY5IFwj6u1ezzMAvhrXJsPdJQHGiVmc=;
        b=VdLMVZ6DJu9kIt/R78HR8sthF5YpA7gCW0YW/xHYtSGYziG+q20NA/QYa2n5M56Pha
         94fVQtF2FfUuGwU9VHJKELEwl1x3LGfN96tuRv2k7f1YCs5xtZ/t7iS5Gi8e7+8XAA9d
         2bQm9jF43jw+E4uA5OX+UCdlncNXcJLNYPWsEKO7WZOy8AtHsYRMHgSnc3peIn2Ak8+K
         tg38hxo8K9tWAH6bYI7cwi/nTYfXW3zkt8qSzFMpvTCXSc4LVHu0vV8W4GAA9CF+1eI4
         cpLfz+PXQtyi4aB1glHk+aulZkSZUGj+DaVuAkalMpni7VZ7EhCh4D4pu1vaxJGc1NKj
         AqOg==
X-Forwarded-Encrypted: i=1; AKwUvBw3tZn7zVVU+BU6nzkcuHTo+u6RUbMKLvschEWp5un3p9Q0kjqYtJ4UbAkucyfrqsaccU5ExzWpoOWXLtj4phauEw==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJML0z4EBRPq4HFrXWWv6W5SVmAI9edYyJbmFhnFzHK4ZvXCIWg
	vKdTDn2ouqH+kOC9HqP48vbK6T5B6e1KwmSJEOoB1PLHhGw4FYIdUgpwUSFcnq3qf8k=
X-Gm-Gg: AYBFou2sIB6Vu+bMWw1JaBSSQAzWjBwXUnWVAuCxct5GRaxTEXQnZscE1SFKOWV0AcT
	nc+ZISoLn+RqGQCoMrXTBReX6Tc49miDi3jlPGcXPR6NVEKvE8lnlPOEamfJB0Te14CP9H0qo7R
	hqLl6qXgFO1y2y8PaYNtXEbfn/edl8JVM8lZDeD+C84DFFhmfG89z18Af1sgSn4kT/WrtdFoa6N
	gD9t7WrtazVzXp6nkSyb5izbul+QVTDeGEFYW4M1WX/PMNu1BVCH/W5gj9IAGoMG/aTP9xkuEIf
	IiJ5gn+3xpRMeh+JrlaFFPKXzfroreWuM+u2+W3aXnXrehSFXAwPuloD4RQzdMuYR/WSvu7/aQf
	Frl1JZOEr+VIA0kift5oYhiBH0iEpdMTS5qyMdnMFSslnJ4AbWQbOVAeyLuXzs6DCuxOhozO4pB
	f+wv9XJRYIxy7mktafphlu4/SBvoX5INQU3yNk/YS024VfgQyrRMT0ha679sRm/ZM+mgfgAolzA
	ZCT1oKt7bUe4RwZvQAr54IBmiimZdP3Wz88IsoTx7OWI9kyY2TBHnHPKHyXxg==
X-Received: by 2002:a05:600c:6994:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-4a18e446f3bmr68430225e9.2.1791590607600;
        Fri, 09 Oct 2026 17:03:27 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea0f1csm139290795e9.9.2026.10.09.17.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 17:03:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 10 Oct 2026 02:03:26 +0200
Message-Id: <DM0PV6GBLQRC.2A5C3G8COEK0R@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH 6/6] expat: patch CVE-2026-77214
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261006193638.2018393-1-peter.marko@siemens.com>
 <20261006193638.2018393-6-peter.marko@siemens.com>
In-Reply-To: <20261006193638.2018393-6-peter.marko@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2026 00:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247487

On Tue Oct 6, 2026 at 9:36 PM CEST, Peter Marko via lists.openembedded.org =
wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Pick patch per [1].
>
> [1] https://security-tracker.debian.org/tracker/CVE-2026-77214
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../expat/expat/CVE-2026-77214.patch          | 106 ++++++++++++++++++
>  meta/recipes-core/expat/expat_2.8.3.bb        |   1 +
>  2 files changed, 107 insertions(+)
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-77214.patch
>
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-77214.patch b/meta/re=
cipes-core/expat/expat/CVE-2026-77214.patch
> new file mode 100644
> index 0000000000..6d74648705
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-77214.patch
> @@ -0,0 +1,106 @@
> +From 4d9b1c499ecb66323260a7274edcf86c5eab0517 Mon Sep 17 00:00:00 2001
> +From: Filippo Tedeschi <filippotedeschi98@gmail.com>
> +Date: Fri, 25 Sep 2026 19:51:10 +0200
> +Subject: [PATCH] lib|tests: Validate len against buffer capacity in
> + XML_ParseBuffer
> +
> +In XML_ParseBuffer(), if len exceeds the unoccupied capacity of the
> +internal buffer (EXPAT_SAFE_PTR_DIFF(m_bufferLim, m_bufferEnd)),
> +parser->m_bufferEnd was previously advanced past parser->m_bufferLim.
> +This violated the parser's internal pointer invariant (m_bufferEnd <=3D
> +m_bufferLim) and caused callProcessor() to read unallocated or
> +uninitialized heap memory beyond the buffer bounds.
> +
> +Validate that len <=3D EXPAT_SAFE_PTR_DIFF(m_bufferLim, m_bufferEnd) for
> +both XML_INITIALIZED and XML_PARSING states. If len exceeds the
> +available buffer capacity, return XML_STATUS_ERROR with
> +XML_ERROR_INVALID_ARGUMENT.
> +
> +Also add test_parse_buffer_exceeds_buffer in tests/basic_tests.c.
> +
> +Co-authored-by: Sebastian Pipping <sebastian@pipping.org>
> +Signed-off-by: Filippo Tedeschi <filippotedeschi98@gmail.com>
> +
> +CVE: CVE-2026-77214
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/4=
d9b1c499ecb66323260a7274edcf86c5eab0517]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + lib/xmlparse.c      |  5 +++++
> + tests/basic_tests.c | 41 +++++++++++++++++++++++++++++++++++++++++
> + 2 files changed, 46 insertions(+)

I also believe this one is needed on blacksail.

Regards,
--=20
Yoann Congal
Smile ECS


