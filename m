Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28CACC43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 14:27:05 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70885.1783002423818257435
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 07:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dSN+pGPm;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493be1b9564so14083565e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 07:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783002422; x=1783607222; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FaIdSVtQLX2oE0vHoJqv4v3op27Vp5faJm46Mql7lr0=;
        b=dSN+pGPmWS3xLWYPWxAOn3L4piOm36I8BuUzEUKQFAlPFiukAz9/d700fQEbPLOpUb
         zfbiuJBM0v6n77J+NqVkgBjjQh1tMM4Y2Q05l20La61LIyWixEcoYs4loSL0nx4Qhyc8
         gfEKfaNug03h06t5iJ3aJtrjHb+dbNAngYT20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783002422; x=1783607222;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FaIdSVtQLX2oE0vHoJqv4v3op27Vp5faJm46Mql7lr0=;
        b=QaU/SweY2o0uKVoeW1jveVQ+IXk4qqXEO/G1sxtATo6vn+D/vy/mAKtZ+O8a6ue6Ck
         O/mqFuejQ3KzEnJA0yx1YoCW7ZxzNcDA6K8DlwJz5metlTRFbZl8/AeDmurM6anz9k0u
         SkHVyq2nCY9mjo/ruZMEriGwvroiobuSZKeZBi49Z/0e+uaYw2qMMN3ls1vzEfkF5jNg
         5uBerk8sgxnqPrkerIWmxo0scBkykfd+1VXMxqZXWBkuv2rMPGdOWbCPoATYaehqb4RQ
         sOP+adVGR/DKHxXoKQ9LWbwuKulcuYVuW/cVzio0+/0vLaUziWnEP0wkIwQw7z5HkGld
         PjgA==
X-Forwarded-Encrypted: i=1; AFNElJ8R6DXXNMaNXc34S57qoD7rVehH0kjNE6pptcBnVB4fj1SgsgJ09x0x4Fc4usqDIJJbfphB4mdRGm6d/0GOPKGiVw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyq6ufTiNRTwTddXZ0EMt4MJMC4UymNsaUM/5+HMO3dxWQO7bOh
	ks3IxblGURsQSRMZ43M+NAop8AXOxHAhFmmlFgwA5I+2AVgBwChA8mIl7J87HVauUHI=
X-Gm-Gg: AfdE7cnUxm4GvxlA81WipeIizrsb4FNM8lzbybK8Sdy0cjmY4chffNwXiUCmMCuVJ6P
	lJNh8Xq96AV7PrJi/6QulxqLMJQkGmAPt9CFLDWi6vvgVQBKDwz9y4hid0al42MZsYN0iWlfNVG
	WVLJAnvvC6FhMzWGXjYsZH8GfXDBgqt/0m6KOqYdoULDyDgt2nvczGFEC0ZX6R5pApVmMkwSQ6+
	p62aQeIVbDtOnxlbtKtY351mYniFfXFTLeT//Xi4DoNqBnqE98pCqptnDiE0V9hV61bQMwMrVOT
	Tk2d1DICCwkR4YBQcZu2D7Jqzx6LrVYs4+nL9jp8S8SoVpCJOTkwSU7EudMHmB82tSICpR6NQJQ
	VC3+XtVDhNJIJyn9bfTzDgEzA5BeRLeZKfSmWACDW7BWgpC69ojUwAQ7MhvhFNk91f+L0weU27s
	54vedubNpH2N4+I5D/q5YIiTqEpOjZ5IFsb3s7iowVJs3qK04gSIieUDRZd/hcaTDGcgDp5A4vK
	odlWg==
X-Received: by 2002:a05:600c:154f:b0:493:bd4f:510 with SMTP id 5b1f17b1804b1-493c3cf45d2mr74201325e9.19.1783002421853;
        Thu, 02 Jul 2026 07:27:01 -0700 (PDT)
Received: from localhost (2a01cb001331aa00c56cc01f8c3c1c95.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:c56c:c01f:8c3c:1c95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6364770sm77563635e9.6.2026.07.02.07.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 07:27:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jul 2026 16:27:01 +0200
Message-Id: <DJO5LWEY6LIE.1FJOPKM3IY664@smile.fr>
Subject: Re: [OE-core] [master] [PATCH] apt: mark CVE-2011-3374 as
 not-applicable-config
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <adongare@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260629124541.65290-1-adongare@cisco.com>
In-Reply-To: <20260629124541.65290-1-adongare@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 14:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240056

On Mon Jun 29, 2026 at 2:45 PM CEST, Anil Dongare -X (adongare - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Anil Dongare <adongare@cisco.com>

Hello,

> Details: https://security-tracker.debian.org/tracker/CVE-2011-3374
>
> CVE-2011-3374 describes a design flaw in the legacy apt-key trust model.
>
> This does not apply to the current apt recipe in OE-Core because it uses
> Debian vendor configuration. Debian security tracker notes this issue is =
not
> exploitable in Debian since no keyring URI is defined for the apt-key
> net-update path.
>
> Mark this CVE as not-applicable-config for the recipe. This is a
> configuration-based status, not a fixed-version status.
Why? I tend to disagree. To me, it should be a "fixed-version" because
the impacted code was simply removed, no configuration can bring the
vulnerability back!

(I'm trying to avoid users having to confirm they are not impacted in
their configuration)

This quote of my review of V1 still apply: https://lore.kernel.org/openembe=
dded-core/DJ9HM01CT21Q.2HLOH1RLAP4JN@smile.fr/:
|Also, please add a justification for
|"apt-key net-update is disabled by default"
|In this case, the commit:
|  Use sq in the test suite, remove apt-key
|  https://salsa.debian.org/apt-team/apt/-/commit/a00fbbdb2
|is present since 2.9.19.
|
|Finally, in this case, the "fixed-version" CVE_STATUS might be more
|appropriate. (Maybe reflect the new status in the patch title)

>
> Signed-off-by: Anil Dongare <adongare@cisco.com>
> ---
>  meta/recipes-devtools/apt/apt_3.0.3.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/apt/apt_3.0.3.bb b/meta/recipes-devtoo=
ls/apt/apt_3.0.3.bb
> index 08b6bac2e4..03da3fbcf1 100644
> --- a/meta/recipes-devtools/apt/apt_3.0.3.bb
> +++ b/meta/recipes-devtools/apt/apt_3.0.3.bb
> @@ -34,6 +34,10 @@ UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/a/apt/"
>  # to express 'divisible by 4 plus 2' in regex (that I know of), let's ha=
rdcode a few.
>  UPSTREAM_CHECK_REGEX =3D "[^\d\.](?P<pver>((2\.2)|(2\.6)|(3\.0)|(3\.4)|(=
3\.8)|(4\.2))(\.\d+)+)\.tar"
> =20
> +# Not applicable: this OE-Core apt recipe uses Debian vendor configurati=
on,
> +# which does not define a keyring URI for the apt-key net-update path.
> +CVE_STATUS[CVE-2011-3374] =3D "not-applicable-config: OE-Core apt uses D=
ebian vendor configuration, which defines no keyring URI for the apt-key ne=
t-update path"
I still disagree with "not-applicable-config:" here. I think it should
be "fixed-version:" (with an updated justification)

> +
>  inherit cmake perlnative bash-completion useradd
> =20
>  # User is added to allow apt to drop privs, will runtime warn without

Regards,
--=20
Yoann Congal
Smile ECS


