Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57B0E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 22:35:46 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.5519.1736289338994213947
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 14:35:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NX0Ct8Mk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so6081374f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 14:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736289337; x=1736894137; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwKUiUAt/64uxa0p02B11J+PZEd51W1yUid4afDoZqU=;
        b=NX0Ct8Mk3LuK8cvJSfBaiNbfLhGDQSqD9fjZrlnvc1AsXYbBTvABGc9P33q1LvG17/
         eMbktmMQq1DAnec0GY9ZKaJLPKPtxzxyxrwL64gsyaq7mt2/o/Fpmtiop0kayJX+LP8J
         JBOrPtqXXly80Iq2TWfpPoZDn2pb+LuhOxuR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736289337; x=1736894137;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EwKUiUAt/64uxa0p02B11J+PZEd51W1yUid4afDoZqU=;
        b=U0zft+6MKvhEiAyVrwDeSG1B5Bv/w6PvDUmM0Mm+8yhEm4RB2HrY1RwAKoKTYAKDOy
         urjXZRov4rr2PDOAR5ilQpDCL9Bu93YcgSmLeERJgpOiD3Xe5MudJTOgA1+nK6woG0QA
         RD2jGg9+ELX2Ti7NDtlv1BFYx3iTf8H8GMtOr8e+O3zvDXrKcjtg1u2gSl+rujG6yNod
         JHSDVPYTzOhaZxPLdAOJWpWIXb8mD6g9PRMF4SrRR7RMW3li9ijMUldLDnCjmGjsA7pP
         WAbxY1ptJNNS2Hn+GAtBEhiDsEOT7xYkxkWRhrWJBX4JuASEk5x19zH+khuceheJTBBK
         pWfw==
X-Forwarded-Encrypted: i=1; AJvYcCUxtWD+HWAGyze1mKcs5X2qkyJpugPhPXiYuESScFuqsnL1tx8FnXoWv3kdiITIHwPinKFVITqTAD1raFO3Jrg3Hw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwN3LebBLehZcRDwoMtReGFuPqOyGODttes1Jz33fC4GjUMQpjM
	CPaEDlRh55OKTDC82Cd5E+MfI4ZU5Vg79Ssf3L2tFcYK/wWHPLpFkIxyBG78Mq8=
X-Gm-Gg: ASbGncvaJHE9DGH1G1ebYKufCfb0oXrQsNiuE52VMgb9SEgM+t2psoZv32nvDeoBCo6
	LBjdjVj1Xf2G6MFlorRa9JbVKLQZvYtDLFeoZhjz26FXwLCoMzEaM30UYQpMmjhPDKjdXzxtF3U
	4gynAJR4MFqno9qTupPJg7TRP7OObjBt3mtA5kkn161uWIXMhNwnb+s5Ogs5Wj/PNQ5k3+w9DCL
	wJlprlYK4dIwCoJNmtIAPgMvc0eFf2lVL5XO6y1B7rdFpsCVqDrRAmu0/Mk2Y/Gc5U04a6x+d3+
	mXqjHf7RDBSXPRZUrAbGM0LV4p6pVFMZFUh2XIZwK09HZA==
X-Google-Smtp-Source: AGHT+IHH9/QJq+4YKqQTs89T39VHCKq6MBfI4ulRjVTGO2w7apZXrXjTR9WFJdihhoCSPZ6PDMEK7A==
X-Received: by 2002:a5d:598b:0:b0:385:ee40:2d75 with SMTP id ffacd0b85a97d-38a872da8b6mr229926f8f.20.1736289337359;
        Tue, 07 Jan 2025 14:35:37 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4b64:f113:f9ed:a6de? ([2001:8b0:aba:5f3c:4b64:f113:f9ed:a6de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e8a326sm770445e9.35.2025.01.07.14.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 14:35:35 -0800 (PST)
Message-ID: <5f83f87b91961f4c1ba449029b4f904f288c3a6c.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] classes/ptest-python-pytest: simplify python
 ptest file overriding
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: derek@asterius.io, openembedded-core@lists.openembedded.org
Date: Tue, 07 Jan 2025 22:35:34 +0000
In-Reply-To: <20250107203009.3251029-1-derek@asterius.io>
References: <20250107203009.3251029-1-derek@asterius.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 22:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209506

On Tue, 2025-01-07 at 20:30 +0000, Derek Straka via lists.openembedded.org =
wrote:
> The complexity of overriding files from the bbclass made the behavior at
> times hard to follow. This change replaces the default file with a
> heredoc equivalent that creates a default file if the user does not provi=
de their
> own version of run-ptest.
>=20
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
> =C2=A0meta/classes-recipe/ptest-python-pytest.bbclass | 12 +++++-------
> =C2=A0meta/files/ptest-python-pytest/run-ptest=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 3 ---
> =C2=A02 files changed, 5 insertions(+), 10 deletions(-)
> =C2=A0delete mode 100755 meta/files/ptest-python-pytest/run-ptest
>=20
> diff --git a/meta/classes-recipe/ptest-python-pytest.bbclass b/meta/class=
es-recipe/ptest-python-pytest.bbclass
> index 801079e6ab..7ed84584b7 100644
> --- a/meta/classes-recipe/ptest-python-pytest.bbclass
> +++ b/meta/classes-recipe/ptest-python-pytest.bbclass
> @@ -6,19 +6,17 @@
> =C2=A0
> =C2=A0inherit ptest
> =C2=A0
> -FILESEXTRAPATHS:prepend :=3D "${COREBASE}/meta/files:"
> -
> -SRC_URI:append =3D "\
> -=C2=A0=C2=A0=C2=A0 file://ptest-python-pytest/run-ptest=C2=A0\
> -"
> -
> =C2=A0# Overridable configuration for the directory within the source tre=
e
> =C2=A0# containing the pytest files
> =C2=A0PTEST_PYTEST_DIR ?=3D "tests"
> =C2=A0
> =C2=A0do_install_ptest() {
> =C2=A0	if [ ! -f ${D}${PTEST_PATH}/run-ptest ]; then
> -		install -m 0755 ${UNPACKDIR}/ptest-python-pytest/run-ptest ${D}${PTEST=
_PATH}
> +		cat > ${D}${PTEST_PATH}/run-ptest << EOF
> +#!/bin/sh
> +pytest --automake
> +EOF
> +

Do you need to set the exec bit on that file having created it?

Cheers,

Richard


