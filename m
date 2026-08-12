Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E6FC5CFEE
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 15:37:50 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10985.1786549068419737795
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 08:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yaRPBlO+;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so14732555e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 08:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1786549067; x=1787153867; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QC0l7kQ7AOCFyJw8TYqcgYhffZjgI5UUNa2XBi0ORV8=;
        b=yaRPBlO+TJsm+IxqBr335yZe/B2zECdJEHcDEwrq+uQkFfAr3bf+uoyjndJ7qt1V3W
         sauI99vB5hPPondbL458/rwJFoxtE6PlFpjsdX8nmVlMIzxh41oLaGhmfK3lAl4AwMwU
         tEi0ySVsqCSbe3W71Nr3bR/uAb1V94NxHQIy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786549067; x=1787153867;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QC0l7kQ7AOCFyJw8TYqcgYhffZjgI5UUNa2XBi0ORV8=;
        b=n7pul2DCM9IXyS9cHb4ZoHRVOmcmyQWbBV32WRptWs4Lj+RyTwye68CRLnC8BXzGEx
         ZZQy3ifIpWQTnjhOZ+3BRNeaQchJA88eGq0+fDPjb459DHAYyO+QoA5EkuxYvz2ivKxo
         EHX1T5mc9MfSojRB8JwFxOrwkaUG7TL9yTxgqp5ISl/dVec7QeAR+JT7evBbkygt9ama
         dSeVK23eSu9KM1PKg0EX0hbXQPccnVJPTlSkJDFpq6vbtvf7CQIXtZx6mm11sC/PW8Tm
         rQfOARmq/Wh0OwIpV04tELi/mcfCd5Py2qXNdjqgD/W23NwlnbQxCDRjUZhy0wGb+yW1
         hrJA==
X-Forwarded-Encrypted: i=1; AHgh+RogKU3NWoqI7Nao9csCBvQPPryu5qmBdSh/rZyczaNvOkoilvySnaA8CzJMNiIrScckV1Or5+w5lwFfAJfWw3uMQA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwZMqtS7zonjs4T+i0WZI6aLPsRvcs1sBULHYhZ7M6sQnEnnM2P
	xim6m+zonzYhX1xlJjZEtI5rCIj8ux9O2bOUIGUihUFuO8XiMfAQuFtrxTK+liweusA=
X-Gm-Gg: AR+sD13RHQzGlmInzxDSaAGfBYBv3az6e7OpU2d36+6jfv7r0D1pilPbJaBz3MlrkzA
	LmNvAYPSFkI3VJfC+NQSEEmTQbQ0nDS8OoyBg4/JDId9FVgI/B56FR0H/caeEd+YICXGxnN7AoE
	IrbC1whmdMa19eENSga1kPYC8z58XGQFQ5nTtsVrGSmysIY1NkEqV0rPQnooX75LdUTix8Gq6u7
	84IMakUsCOMI3cAaBiCCNVdcuriUXjvsynAUkrC8G7FyzYVT/+lBfnh43124Z25O63E9F3jIiRp
	MJkF8I9tI0nKVKC8Z/upgfZ0bnA7Foo/1RKaeLYOJdsOC4RZevnLg6Go+dX+hFl0hfiOaVp6r7c
	PPGEDn35vN0naNQmlGlzwdWgA7peNZRHqLZ0PRtk0zRCKd3rW3dEmYhAdTQ2RBr22uL8lKyiWlZ
	biOu+YUXxT4TpHg4mWIQJC/SIt3A03OcdaVPt4KvxDDh+Th4aOxEzOrwqalVInQCCpX4M4gS6Nm
	jL+R++wDAboj3RKUCydAQWohbbIG0WK+cUG2yFI4bhg2DxW5zkkr6RWtgAJAapNuouJL5HnjA4S
	1MrSeA4LVs5fOPILu/2PRdquLh1+vi5h6cw=
X-Received: by 2002:a05:600c:4e8e:b0:499:77ba:4b6 with SMTP id 5b1f17b1804b1-49981a18ee4mr78285e9.9.1786549066476;
        Wed, 12 Aug 2026 08:37:46 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c993d80sm59972595e9.12.2026.08.12.08.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 08:37:46 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Aug 2026 17:37:45 +0200
Message-Id: <DKN2SEC32827.35IBSQC8DBN5H@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH] nghttp2: set status for
 CVE-2026-58055
From: "Fabien Thomas" <fabien.thomas@smile.fr>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <20260805080334.2604235-1-deeratho@cisco.com>
In-Reply-To: <20260805080334.2604235-1-deeratho@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 15:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243293

On Wed Aug 5, 2026 at 10:03 AM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> CVE-2026-58055 affects the nghttpx proxy when forwarding HTTP/1.1
> Upgrade requests with a Content-Length header and body.
>
> The default recipe does not build nghttpx. Add a conditional
> CVE_STATUS entry so the CVE remains unpatched if app support is
> enabled, while default builds are marked not-applicable-config.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2026-58055
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
>  meta/recipes-support/nghttp2/nghttp2_1.68.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb b/meta/recipe=
s-support/nghttp2/nghttp2_1.68.1.bb
> index 71d5eef8d6..29a7d26819 100644
> --- a/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
> +++ b/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
> @@ -17,4 +17,6 @@ PACKAGECONFIG[manpages] =3D "-DENABLE_DOC=3DON,-DENABLE=
_DOC=3DOFF"
> =20
>  EXTRA_OECMAKE =3D "-DENABLE_LIB_ONLY=3DON -DENABLE_PYTHON_BINDINGS=3DOFF=
"
> =20
> +CVE_STATUS[CVE-2026-58055] =3D "${@bb.utils.contains('EXTRA_OECMAKE', '-=
DENABLE_LIB_ONLY=3DON', 'not-applicable-config: nghttpx proxy is not built =
in the default nghttp2 configuration', 'unpatched', d)}"
> +
>  BBCLASSEXTEND =3D "native nativesdk"

Hello Deepak,

I'm filling in for Yoann while he's on leave.

We would prefer to avoid conditional CVE_STATUS entries whenever possible.
The risk is that users who enable this feature through other means think th=
ey
are protected but actually no.

Conditional CVE_STATUS should really be a last resort. Could you please che=
ck
if the actual fix for CVE-2026-58055 can be easily backported instead?

Best regards

--=20
Fabien Thomas
Smile ECS


