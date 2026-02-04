Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC09E9D411
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 16:49:48 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25237.1770223786258751691
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 08:49:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uomuzSr8;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-480706554beso64385e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 08:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770223785; x=1770828585; darn=lists.openembedded.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLTwYuVju9KhvTXR12TjY8HUsJdelYSCTRK5nbFhf8Y=;
        b=uomuzSr8cx3gO2c6hx1JOKtSrWh60SjNsrEz4aqyB3dXmERPW9StDFGrknYwxXCvq6
         UCb8QUGRd6i+jyAe1waT4+8jgwbjwgHSX91YlwFZAZ6whkB+0dV1ERtGhzdrsriuGgYB
         mKlrMVkQqw7hApojvA4yZ1B5W3ss6MfoEs/7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770223785; x=1770828585;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLTwYuVju9KhvTXR12TjY8HUsJdelYSCTRK5nbFhf8Y=;
        b=EqFe6eYOaYaHkwyKPmOQq3NRXvcoi4vNNr2OPmaMm8+G8ZqraG0FXYEHzbGaEmty+X
         5vPFgAUDUB5UScqSFXGjImgLj99qiDEaAjS5YU4LOk2SZYZoqGWcoEntEqAG/8FuaWey
         F6GDNyQLFDwk8Dr23vwdKyoCfaFnGj3/PHK9GMMOi3HULrjX2kKp5tK68tKvjE3KEGKd
         ARx0HtNNDnTdHWPSeVyR8iUs5VSumT6oUL7feo/3y4qlwL47ji78BtdnScrWx/N4zxuB
         v4Xxv4Or1xbydmjmWhD4hJsAslGdJeJmewVgtXx4+41n2TVTzAN05quoJrGJJ+92jtYb
         jrlw==
X-Forwarded-Encrypted: i=1; AJvYcCUG2ljmFMkV8vDtezJHs6YIgX3TnS70DRIW/MISsLiptSpoxeF2y0cxiAVoHXT5Dt+uitkvw3zAySm34I/Pcif2Ug==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwhGZeBOk/mV5W0LR0A/GRYG0DwsM7nVyxJw0xmxLtYlUc48HSI
	99WjNrMCsza7lV4KpvSJCEbDvK/m2NDdur9u5zSeu4KKFcwVmpvIrnWK4VHC1MbpnNg=
X-Gm-Gg: AZuq6aIzm/j48KhZB/5wyQc2W2JH86VFSBhZGATQMKNeZAsLOm1KzXAyqOYhfTxwULg
	qqCLTFOYtSg9IQo7mtz80MosMB8dlHgcYVplGgvugyMiMFtHjTozzp/qX5+D8VLJn40nbgf8hGe
	BOHVueYlV+pxhD1aLuNPFktRDwEVKlTiG391JvC174PYLQmzHJxEwa7+vGZb2rrT3nAF+2R7ROD
	xd7GdP6FTe2j4tTBbX6hOfN0WaQRi08quv+0weCA3Sh+JK4agRQtEDDELvLwTuNjntGCBkwrirR
	OlkpgA1MX17sb9w1VPGmJo0z0fCyk1/2dQUilcj9aO63U/SYW4OfjuR3+HbSnZ5OiUq5GzWfHkG
	os+GjOMboGu5aJfxdGCE0JA7XUgYistvEyOk6OlzsoLmU+pzn10QaOiD50l3t2AcYjsfFecbLXc
	lnjhd4DxolD/J3yXBU7fu5ckhYZaN8FJVu24Ris78Mv3ci30aQKXvUzcYJKbZHwD8Lx0w4dDJ2M
	Eg=
X-Received: by 2002:a05:600c:4fd0:b0:480:1e9e:f9d with SMTP id 5b1f17b1804b1-4830e92cbc0mr50735235e9.8.1770223784396;
        Wed, 04 Feb 2026 08:49:44 -0800 (PST)
Received: from localhost (2a01cb001331aa0002b8d20d4b496413.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:2b8:d20d:4b49:6413])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483108d7b1fsm79151265e9.2.2026.02.04.08.49.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 08:49:43 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 17:49:43 +0100
Message-Id: <DG6BYJEIPLBK.2FSCSMFX8XMR2@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] openssl: fix CVE-2025-15467
From: "Yoann Congal" <yoann.congal@smile.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.0
References: <20260130054350.300667-1-hprajapati@mvista.com>
In-Reply-To: <20260130054350.300667-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 16:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230552

On Fri Jan 30, 2026 at 6:43 AM CET, Hitendra Prajapati via lists.openembedd=
ed.org wrote:
> Upstream-Status: Backport from https://github.com/openssl/openssl/commit/=
ce39170276daec87f55c39dad1f629b56344429e && https://github.com/openssl/open=
ssl/commit/cdccf8f2ef17ae020bd69360c43a39306b89c381 && https://github.com/o=
penssl/openssl/commit/e0666f72294691a808443970b654412a6d92fa0f
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../openssl/openssl/CVE-2025-15467-01.patch   |  40 ++++++
>  .../openssl/openssl/CVE-2025-15467-02.patch   |  65 +++++++++
>  .../openssl/openssl/CVE-2025-15467-03.patch   | 128 ++++++++++++++++++
>  .../openssl/openssl_3.2.6.bb                  |   3 +
>  4 files changed, 236 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-15=
467-01.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-15=
467-02.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-15=
467-03.patch

Hello,

Thanks for the patch.

As far as I can tell, CVE-2025-15467 does also impact whinlatter. Can you
send a fix there (either by then backport or maybe an upgrade?)

Thanks!
--=20
Yoann Congal
Smile ECS


