Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F37C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 15:52:34 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34517.1785167551700510127
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 08:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=G+R6ZCut;
 spf=pass (domain: smile.fr, ip: 209.85.218.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c197eaaab00so449731566b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 08:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785167550; x=1785772350; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PMY1XOpPYHmJvPSxU7pwmNCjDdqSW7htNrMLDyQOrnc=;
        b=G+R6ZCutedKtYoz/YleLxUWu+HoEYSCKlnOqgZKlOA26oyRd/scZDvJnfQKWjbQZ5d
         A3tmSrg2GZSrpz2Nd/oKc8xhhagbyiMTECBSzMKwNgrW2tCKGjGaa+xTF6CZA/emf4l1
         iZrSz6VCAp/6862mgW4pOeHiCl73VOEl/YJnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167550; x=1785772350;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PMY1XOpPYHmJvPSxU7pwmNCjDdqSW7htNrMLDyQOrnc=;
        b=cN7NgjNG9TXHtBa9mSLUD9sBco+zmw4xhqTYUilgoseHxzPa9KIVI7WL6/STxqMUWd
         v6K9mpH8hvtfO5o8wwzwX2uqJQ3xPF+Sgu6qj+EuxoNFefOkGY+bIGe4KpaS6oO4nT2P
         6wdfiOgWOjvVULxcsno5aU9L/7PFSyj5rYk2liW+8vzJfg4X6k6cobgzzLGIcNGT4VRX
         Y6TCHhZ+o6sphuIlKeO9+HNmRalNKJS3s91MsFhElB4UdrHwqUwLMkr79T+iepQ0n54s
         7sTALPw29TCgBtyDRd+o9nl6JnZ4pipQQbrLpFnbUJn1eQcd/vCcrBZ+7jbhJC7MyzEp
         sUGw==
X-Forwarded-Encrypted: i=1; AHgh+RpK6p8Y8AUf7F3TvsXV1nXd/hfC16zgjpoZ1t5yDFXcHILIH8kByGklu50VG47HCT/yJG2Wm7YddvEOLmRTH/hX9g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyjirMiCyMnhVHbl2pJjsgHv1/AtLgKZkKzGdXjerfv/8yOJ11S
	bEr6NdDSCDYQnQS9mhc2YtcKXNwjlAO1uSY3K677nSSdoPA1TG8JbK3jZHmivsyhviY=
X-Gm-Gg: AR+sD11BAQQWrlnRUFCz/9FWE5Z6+w3egNiTO9tcFQ3Nkq9Q/sdJKo1wZfPg4if75um
	dnoSRURlJY51v09ikzXKKCLB2hx5h1xHrjTyG0u4GtlOF6c1I+JmWiRk7/c8Q2UGFQfxAjsuSt9
	BU4EPt/gfOnw4jdPtSQ+DGNjJZPMvB93Xz9nmbt4FlCp4MjxmPpmOLknSWrlqV/p7HdZFQ7utDZ
	50m5kIMy8hyO8z9R9aLC2iyzCA3CI6VcDluPZQ9X41yMO2lwapI65gymBEXgcWN+IUzg6AW7yDn
	ATLQOy1HRrJvWYyaM+dyUY8CMevhEXGhtXtMpgdcvZza+6Fj+GgCy1SbUTj9ueUVlSyFJKbXmMb
	r2g+9GF14u+/8Xf0S1RgBHq+ZD6zW6yaJsAAU2tNVbiQWhBvC/QvXZaAGcErrbi16TC7C0vtXd7
	F1E1DWb6xDW7vD6r9lEU1aShc43o2UVW+0SIDjjWx3KBsWsdc0cjEB3O44rxu53A==
X-Received: by 2002:a17:907:7250:b0:c04:fc6:d6bc with SMTP id a640c23a62f3a-c1f1f15cc0amr427022266b.36.1785167549791;
        Mon, 27 Jul 2026 08:52:29 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f13c96sm656970166b.62.2026.07.27.08.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 08:52:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 17:52:29 +0200
Message-Id: <DK9H2YI244II.24Y3HDUG82B6G@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] python3: fix CVE-2026-15308
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260723134304.2505230-1-deeratho@cisco.com>
In-Reply-To: <20260723134304.2505230-1-deeratho@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:52:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242101

On Thu Jul 23, 2026 at 3:43 PM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> Backport the upstream CPython fix for CVE-2026-15308 to Python
> 3.12.13. The issue is a CPU denial of service in incremental
> html.parser.HTMLParser parsing, where repeated feed() calls with
> unterminated markup could repeatedly rescan and concatenate a growing
> buffer.
>
> The embedded patch is based on the Python 3.13 backport in [1]. The
> public CVE advisory is referenced in [2]. Scarthgap-specific source
> differences are recorded under Backport Changes in the embedded patch
> header.
>
> [1] https://github.com/python/cpython/commit/7933f4bf7131aa4140750f9404f5=
de0aa2969ced
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-15308
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>

Hello,

As far as I can tell, this patch is not released on the 3.14 branch yet.
I hold it until it is applied to master (upgrade or backport) and
backported to wrynose.

Regards,
--=20
Yoann Congal
Smile ECS


