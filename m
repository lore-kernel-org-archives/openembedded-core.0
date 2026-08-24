Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11040C5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 14:52:59 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18430.1787583178027560619
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 07:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gTLM8giT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso32990925e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 07:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787583176; x=1788187976; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8HavI87tuUaZa489bUzToBSxLzBbnHbwlMcnCqoP/wo=;
        b=gTLM8giTujBHLsvI7yNlnh0pptc0u5gxgEW+zK03tGRfh/dR0d2jYXaAcYU6c2Q6kV
         mGL87eUfpcN3pTLzkR0i2s38GOUIqyoppab7i5P0raWJJdAYaiI8fQskwdKf6x00asww
         xzEBd/T+VVUVV9fnBgPYaAArqwABpD97QRB6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583176; x=1788187976;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8HavI87tuUaZa489bUzToBSxLzBbnHbwlMcnCqoP/wo=;
        b=T13nY7FIB8odVMqhf98EaiRZ/H8TVJhNUYXpWH5KYhA0JOIPKejUUQm/TFBkJkEVjO
         4LocZ2jRGLZtWG/c7iZQht/qN094WH48XHIUY/JIziqVokFW0UzUjB/ANtlhZB5SjS4q
         0EZOMdfEOu+ae3z8jDqkkOV7g3aV84LUw+AW90qhyfQW/H9wVY6mRYpBkq/MgaDI1/uH
         Tlu50uQY43EG1lpy+jLHiv0DwHI+n8Gd4eqeb7KyHaLOgUMCR7CGjmwaTlMKI5q0zBMk
         Cekj2/YHsLlJCDuL85VA1ve84niVRuTAcppNBV5j2LP2ztIrzYBEG0ppjG4nK9AlA4/R
         4eKQ==
X-Forwarded-Encrypted: i=1; AHgh+RrqeTdUgURoXhZ2Y6xC9hhFzQ3UChXjMYxWEhk/a0GF1+GvcIGyVXHvnikWnkJh3gBda7NmCVPh7P0fCrVnj9URiw==@lists.openembedded.org
X-Gm-Message-State: AFuF++ndvEa/ER3T+/zd7xts6BMXjOEWYTUDiiNJTLQCmYYP6WquFwOu
	q8hucBRMvm8JBgv68eXMcGdbWbKTuPWWXcOWWWf6Pl/X23xdFheTWl6/5fxCyyqIUwU=
X-Gm-Gg: AR+sD10nr3SozKrD5KztoOFChC7eEewfgua/1QdX1CDtVJPDIHPrU+s6K6wvFq6a6v/
	7wkU01ZBkcLLzeccy9DQcUb9Nt1hdEiot8JKJAqL0Wda/QM9RD7T9I7/Eivrd9lqdznbB/Joijb
	Rdd5x48jexxvdTKsN4DaAXAqKhauNsNB9IYjnSoL1iDinLwlv4fF6ETiSOyvK0CYQs+mAnz04eD
	l8g9MfLL/MZ+kuqQPeYKC9t3pq3R0WIBSwd6nygbEwhqOxzZpfRhrz4pxnclkwOp+4wMXjPX72P
	sYQ+tO0NitxpV3c1h6jFbJByloH/RMmcVL5K+DAS6xgxdFQp6VTUjOJ1O1zRu7p1MV7htzcZlHA
	8GZLnF+vhTwJ/EvkGIfbKckoGcEA8JWOG6U5eVgmVFN5b+fEvKeHJRM+/+mdw/3HPFmTGv7h4wg
	zk//BmET7C0Shw54bG0oZfvBfb1J+uWdXgvMF3Yuk2W7I/9I3UqJxGFY/70BEk9ln8BdTdF+3aB
	XS77dxA7BIANkdAIijYsvDT9JDKPxTT5nx5ei89jMzc/tqCrxiRTw==
X-Received: by 2002:a05:600c:1f87:b0:499:8ed2:8234 with SMTP id 5b1f17b1804b1-499b82736c4mr328470125e9.0.1787583176189;
        Mon, 24 Aug 2026 07:52:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5c5b:7a15:ab97:8d7f? ([2001:8b0:aba:5f3c:5c5b:7a15:ab97:8d7f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c46cb207sm83733655e9.1.2026.08.24.07.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:52:55 -0700 (PDT)
Message-ID: <7d0a4d1b6fe1c00d4cdf656ba13a5a1c25623a25.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 2/2] populate_sdk_ext: keep SDK_TARGETS so
 SPDX/SBOM tasks remain in locked sigs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: SunilKumar.Dora@windriver.com, openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com, ross.burton@arm.com, saul.wold@windriver.com, 
	hongxu.jia@windriver.com, Qi.Chen@windriver.com,
 Randy.MacLeod@windriver.com, 	Maganuru.Jayasurya@windriver.com,
 Sundeep.Kokkonda@windriver.com
Date: Mon, 24 Aug 2026 15:52:54 +0100
In-Reply-To: <20260429092900.2205617-3-sunilkumar.dora@windriver.com>
References: <20260429092900.2205617-1-sunilkumar.dora@windriver.com>
	 <20260429092900.2205617-3-sunilkumar.dora@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 14:52:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244126

On Wed, 2026-04-29 at 02:29 -0700, Dora, Sunil Kumar via lists.openembedded=
.org wrote:
> From: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>
>=20
> Fixes [YOCTO #15853]
>=20
> The filtering in populate_sdk_ext.bbclass was removing all image targets =
from
> the locked signatures, including the main SDK images (SDK_TARGETS). As a
> result, their tasks including the image SPDX/SBOM tasks were not added to
> locked-sigs.inc.
>=20
> Without these entries, the eSDK lacked the necessary sstate, and the inst=
aller
> attempted to run the missing tasks during installation, leading to unexpe=
cted
> task execution errors.
>=20
> This patch keeps SDK_TARGETS (and their multilib variants) in the locked
> signatures so their SPDX/SBOM tasks are included. With those tasks in the
> sstate cache, the eSDK installs cleanly without needing to re-run anythin=
g.
>=20
> Signed-off-by: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>
> Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> ---
> =C2=A0meta/classes-recipe/populate_sdk_ext.bbclass | 9 +++++++++
> =C2=A01 file changed, 9 insertions(+)
>=20
> diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-=
recipe/populate_sdk_ext.bbclass
> index 071cf959e7..d17fc3af64 100644
> --- a/meta/classes-recipe/populate_sdk_ext.bbclass
> +++ b/meta/classes-recipe/populate_sdk_ext.bbclass
> @@ -461,6 +461,15 @@ def prepare_locked_cache(d, baseoutpath, derivative,=
 conf_initpath):
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 # Filter the locked signatures file to just the =
sstate tasks we are interested in
> =C2=A0=C2=A0=C2=A0=C2=A0 excluded_targets =3D get_sdk_install_targets(d, =
images_only=3DTrue)
> +=C2=A0=C2=A0=C2=A0 sdk_targets =3D d.getVar('SDK_TARGETS')
> +=C2=A0=C2=A0=C2=A0 ext_sdk_target_set =3D set(multilib_pkg_extend(d, sdk=
_targets).split())
> +=C2=A0=C2=A0=C2=A0 excluded_set =3D set(excluded_targets.split())
> +
> +=C2=A0=C2=A0=C2=A0 # Ensure SDK_TARGETS and their image SPDX/SBOM tasks =
are included in the locked signatures,
> +=C2=A0=C2=A0=C2=A0 # as they are required during eSDK installation.
> +=C2=A0=C2=A0=C2=A0 filtered_excluded_set =3D excluded_set - ext_sdk_targ=
et_set
> +=C2=A0=C2=A0=C2=A0 excluded_targets =3D ' '.join(filtered_excluded_set)
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 sigfile =3D d.getVar('WORKDIR') + '/locked-sigs.=
inc'
> =C2=A0=C2=A0=C2=A0=C2=A0 lockedsigs_pruned =3D baseoutpath + '/conf/locke=
d-sigs.inc'
> =C2=A0=C2=A0=C2=A0=C2=A0 #nativesdk-only sigfile to merge into locked-sig=
s.inc

I've commented on the bug for this, I wasn't able to reproduce the
problem. If someone can explain how to reproduce the bug with master,
I'm willing to look at it further.

Having stared at this code a lot, I'm not convinced this patch is right
at all, quite the opposite. SDK_TARGETS are explicitly not included in
the locked sigs and there isn't a rationale for changing that here. In
my own tests, whilst the spdx tasks for the SDK_TARGET do run, they do
so with all the right sstate present so it is all working as designed.

This patch is therefore not right and if there is a problem, I'd like
to see a way to reproduce it.

Cheers,

Richard



