Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C48CC54F99
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 23:59:55 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.1542.1700006387612987510
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 15:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=po69sWXb;
 spf=pass (domain: smile.fr, ip: 209.85.218.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9bf86b77a2aso915675466b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 15:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700006386; x=1700611186; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjropA39HNJYgPt8R3uD3TYBpZIDLmkz3kC9+u1CAiE=;
        b=po69sWXbOQ9jyGFByc44bCS3feeIr99auVtqr4tScA/Gis2y1CbpajQtsabLuH2Zd/
         0iG+Yvb4Y31uGgY1lY11Twe3vmbGx193Cj45DX1t/jzGPbRnCEPlF/YojH6KPYFmJRvn
         0VTVEDIWN1iLN0dk48MMM7ukIh1GjbqX3pOOyzON+uhmqOcU94WNA1qmWM/vUycEO57u
         EDP42y3zL33M5kHeyCLz7UKu/qOw4eK6JXXL2OOr2v51EVthvtGV/6dCTXdToL3/CJGX
         3+sqCNmGiGDcpJmwSuhu4LSRjakfPWGeyO6FfNVvnILLaCDy8eqPhXEnIZWZX/PCSVeT
         Ou5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700006386; x=1700611186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EjropA39HNJYgPt8R3uD3TYBpZIDLmkz3kC9+u1CAiE=;
        b=ZKuQlQsJGhOehHmXf5hh9NUCs8uomfjPMXwWqigtjEOwPv6emTHHM1Kk7eF8VbGnHU
         6l+J+WwLNgv7reg2aaWpKSKj0tCi0pNRSSwwq5R5W2Rqx2XDj5sadR+Z2ifYhwZJY82+
         fNOpgQmE+lJlgEFOQqnoOqBe5RShRxF0yUeScoWRtBtCCjz6TYMjH6ePftaCnLjEpOzx
         3agpa/49Tuzk9Kfy8/+Qw5uCKtUwigvv/yFI/5G/Iu7MXGPQtiQIYvOh80gfjnZytFnG
         nV0yz7GHJQZgOufCehusdMWSe9uvChHA5rOGYzJ1DNZN+U9pxtGkN7J7+QffLlsT5lTp
         qR1w==
X-Gm-Message-State: AOJu0YyX/GcGMlP7IDYOFq1AH1FfEvw/8XG24LYpTLMR8sYzKMPYl5RQ
	SOynOUJco9uAT1jzGp1clk931RE1/OkXGH59VeyQJQ==
X-Google-Smtp-Source: AGHT+IFmriZZO23qKqiBksCmoX3JbzH2YV2eHGQR1P8Pa+3QNvSI76A0toY+8oA0weuQbkokM9raf7WVbYnZRYdqcP8=
X-Received: by 2002:a17:906:1341:b0:9dd:8aa0:f7b8 with SMTP id
 x1-20020a170906134100b009dd8aa0f7b8mr8579923ejb.9.1700006386046; Tue, 14 Nov
 2023 15:59:46 -0800 (PST)
MIME-Version: 1.0
References: <20231114233220.2567795-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20231114233220.2567795-1-richard.purdie@linuxfoundation.org>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Wed, 15 Nov 2023 00:59:19 +0100
Message-ID: <CAMSfU+51fpbHyJWQ7RG8KsE5PpqNFh1JEHNh_vpBMYW5XFMZsQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] oeqa/selftest/reproducible: Add
 OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES support
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 23:59:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190527

Hi Richard,

Le mer. 15 nov. 2023 =C3=A0 00:32, Richard Purdie
<richard.purdie@linuxfoundation.org> a =C3=A9crit :
>
> Add a new variable to the reproducible test so the list of excluded
> packages can be extended from the metadata. This might be useful for
> meta-openembedded for example so known issues can be excluded and
> therefore new regressions become more visible.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/selftest/cases/reproducible.py | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)


FYI, this does clash with the patch I've sent from your work on this :
[PATCH] selftest/reproducible: Allow packages exclusion via config
https://lists.openembedded.org/g/openembedded-core/message/190526
--=20
Yoann Congal
Smile ECS - Tech expert

