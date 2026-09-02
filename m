Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86782C624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 12:26:04 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11239.1788351955401305128
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 05:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ysrj5T8j;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b8687630fso7641495e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788351954; x=1788956754; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4b2+A/fonZao9YCEWl985gN9C+/J0HBnTXZePKchRE=;
        b=ysrj5T8j21GLFqnhizR5YWLDoD2QOtu5vMA9D3m3yO6Uom+6HF/sRwx0mW0Le2hakM
         D9O9KwTiTeSD1UgjII+Ql0DC0rmZnqTY3Y8OOmB919QeA+fkC1+KhRGouQag97xzo6PX
         H8bRwGc0igrgEXoTl1J814r/zXPyuPgV/OUcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788351954; x=1788956754;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C4b2+A/fonZao9YCEWl985gN9C+/J0HBnTXZePKchRE=;
        b=GdGoEjcykMKvTHACEkraTsmXx5oJ/gsYBsbMh/1Gobl9VDgeCzAyxjwsEQNuSCN47y
         VGyOME0gGVlqY6egMKM4PVbLHF38JBARhUUGyIPAtWVJu6+oI1Ql61FXeZv65glkPwZe
         PWXwE4KZHRWdoKlJSWBeHwb+f1GaAkSaBpGlqC6v2sEU5w9zh70xwGragK2yKKCKPNXI
         PuvIUFxLVmDAji2Uj9672Cyq5b7CfSoyXsR5tvXkUJyuey44NnHfUhC+9Uh1e1qyDmdf
         TFMn1pr6jxUVLP3LvH/TJrMSCqwpp5YuXnCeKx4M/ywwWPPwXlNEAq1CNb9j+/I+qQhU
         lkcA==
X-Forwarded-Encrypted: i=1; AHgh+RpIvLr5nPCIZ4fSKt1VFCrvV4TRUvAwYAVwDnmGPQEvy+jLjGt/rFNkWtK9cgOcIXeCVl3XEA621i76IxWozb0Vig==@lists.openembedded.org
X-Gm-Message-State: AFuF++kM+ckFSva2rxp3xk8CkQWzAwYWFPzZcC0jerXRiO3iSZocuYjz
	Ru/3Qf9rMGhggGyOIdvIOa8NYOSUj5V/wdQrOP+wnNg/MWawfsPTUUKidvAnTSDIayA=
X-Gm-Gg: AR+sD12QqB3LBz6xUIzEhO/FnfCIJqzJx6kBMftowVl1M5Lhg4bmmPmcU+bRpsSBQEi
	8axrQq7LOr9di6ih9DpTSmzS28sKVJKnQs+/C7aiNEENzj2JFCDS4eKzsKitnJ6kl40EpcG/MGM
	xuq9ikauJBJ4rvuxo6DqbLtDbSPKZwywDbtUCcuRplRIpxKg/Qg1KSgK8gGwaVhrlnj5VBYszJZ
	EmizoKxlz2MQEptNhzLGMXSrUu9YBCcLa/V8MKi6jKSVtjTIGnUqA4BeQhIMlLsp+Q1LUu4bfjV
	fcql/etCOXUpIx2An7WySuonfLt0Ec5OmdPF/bDIcdwqXtI53s5gA9o5J3p8GML03ce1LbBaJup
	ALEF0vDbzBYDqjaLLPHV3q/m9+fck2Su6Q7ueqwr1mX3UJxzWyUCsUMyfutic5MLnLVJGT1YB5I
	RXH6CRDUpSPCiO4ksJJBOqlZf0s5s4hYUWMOanajx9yZDPimEz3j58LwxDcKIigR/RWrHZoYr74
	OLdWk43ZvWFqaOFzZZLF775ZNOdFHoHqMFpC+w/NiCFC89L
X-Received: by 2002:a05:600c:8a17:20b0:49c:d818:8771 with SMTP id 5b1f17b1804b1-49ce5808d4dmr63677475e9.7.1788351953455;
        Wed, 02 Sep 2026 05:25:53 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e13db0sm6565164f8f.0.2026.09.02.05.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:25:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 14:25:52 +0200
Message-Id: <DL4TUXARXU2C.FKDEUMNVUYGJ@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH] python3-lxml: fix CVE-2026-41066
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260819103604.107840-1-dkelaiya@cisco.com>
In-Reply-To: <20260819103604.107840-1-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 12:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244942

On Wed Aug 19, 2026 at 12:36 PM CEST, Darsh Kelaiya -X (dkelaiya - E INFOCH=
IPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> This patch applies the upstream fix as referenced in [2], using the
> commit shown in [1].
>
> [1] https://github.com/lxml/lxml/commit/ab431ea0b9a7357d968f1d1c5c614649e=
9aaf358
> [2] https://github.com/lxml/lxml/security/advisories/GHSA-vfmq-68hx-4jfw
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  .../python/python3-lxml/CVE-2026-41066.patch  | 87 +++++++++++++++++++
>  .../python/python3-lxml_6.0.2.bb              |  4 +-
>  2 files changed, 90 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/python/python3-lxml/CVE-2026-41=
066.patch
>
> diff --git a/meta/recipes-devtools/python/python3-lxml/CVE-2026-41066.pat=
ch b/meta/recipes-devtools/python/python3-lxml/CVE-2026-41066.patch
> new file mode 100644
> index 0000000000..c619b2b2b5
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-lxml/CVE-2026-41066.patch
> @@ -0,0 +1,87 @@
> +From 2851ff7d51681201c950554d52697429413835b5 Mon Sep 17 00:00:00 2001
> +From: Stefan Behnel <stefan_ml@behnel.de>
> +Date: Fri, 10 Apr 2026 10:13:03 +0200
> +Subject: [PATCH] LP#2146291: Set "resolve_entities=3D'internal'" as defa=
ult for
> + all parser subclasses.
> +
> +CVE: CVE-2026-41066
> +Upstream-Status: Backport [https://github.com/lxml/lxml/commit/ab431ea0b=
9a7357d968f1d1c5c614649e9aaf358]
> +
> +(cherry picked from commit ab431ea0b9a7357d968f1d1c5c614649e9aaf358)
> +Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> +---
> + src/lxml/iterparse.pxi | 10 ++++++----
> + src/lxml/parser.pxi    |  6 +++---
> + 2 files changed, 9 insertions(+), 7 deletions(-)
> [...]

Hello,

The equivalent scarthgap patch does regenerate etree.c but this one does
not. I've look at build log a bit, and I can't see it regenerated in
wrynose.

Can you check?

Also, if we go through with regenerating etree.c with cython. I'd
appreciate:
* some info about how it was done,
* a little effort to decrease patch size (the scarthgap one had a lot of
  meaningless line number changes): I'd accept a patch format change from
  upstream if that results in a small etree.c patch.

Regards,
--=20
Yoann Congal
Smile ECS


