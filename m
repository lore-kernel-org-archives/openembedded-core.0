Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6881C5DF71
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 08:21:09 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20214.1780388468560716285
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 01:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gRv26eMd;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso11597365e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 01:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780388467; x=1780993267; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZrTVBXMHvRwAUEKvpv5XIL9cpfk3jtfRWfW3IA6ErA=;
        b=gRv26eMd5tYuzMqeh5Ie45RGaLvffCTfvUeZBt91ZeXJHO22mT46Xov9d0Ue9kKbku
         nxLd866PPKZT8F9iXdjtpMtT0AKdxdd9+LGU54fcVXeS3G6H/OPT5B9ag67z/9dJC7/4
         Y/+iCn8xiRFIGvB6yQtuh6/WzBxsVE9eewZ8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780388467; x=1780993267;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ZrTVBXMHvRwAUEKvpv5XIL9cpfk3jtfRWfW3IA6ErA=;
        b=Fyp5uxS/sqF5eZyE/ybaqYcnt63xWvvp8zNBEg8vU4RDvAtJJJr77MV51yyx6KNZr4
         vWcslVh11YUFOUsb9QM9EsUyZc/3TAayY7I+9NT/zAEKyzARt+5imHw9ttocVamGyGcE
         RxMu2uHxV8M1GNvrwq8O5GtB+pp5DC1LH8sc5VwT90V9pe9PtkJYY4KYkIbjkocWlan8
         w1UBQDGx7JBv9h26bT6e/d1ly+ZVmaG3xeSEJx0g4q762Oo6FaTvMw7+MOfBO/tCnUKg
         ZJ0UHHEd+7PvO3k1CtfhlFgb9Trpj1oFjDJXbbMe+lhOt0GzJM/i4xhF7BfRt77H1CQH
         YFhQ==
X-Forwarded-Encrypted: i=1; AFNElJ/K/sQknnNVqPSEiibIyvQp+1RIdL/5z3n1QH1GVyUnX8zA+9TobMUS283lEgRIXlPlUdfjCvJHP4TI9pJ8e4DLpg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy9oS45Y1YmBQn/X9it3nzPGZ4N8PB30t5WhzXWvhnATu2HaSZR
	1LvY6SZKczQVmw88VIMKdCVGqM7TQ+XM4EeyRcLVMTeN9+rHrzR30fpex9PwBQ83lo4=
X-Gm-Gg: Acq92OExSVHSZ0wMCqiHRQPF2tnl+24eO7DIwB23C4OndQewzubusaBgxeM6dVVhs1p
	opS0TzOw8bic+kKenpnCGqlirP2gg19bD9h2OerYS5+9Zkha4aoK12XhUKooOtJWz+8eg4zQO4d
	JsI9y2w2Y3gBEGbBfyrM12OUGpQ8MkUstYyQFEaSJE3rMKcrQHgAuvYMmZdTLqVxUWhYDWRG6k0
	w+WAp2cMG7llBSINQNnmyjo6VLPG+G5UF2jdWi/84K1WHvlCS3nB+/iizRJZ8//I7DmqyIFUW/g
	ufw25/P+0Bg1faPaBoYVuMWq2nY1A5Z6wLVOyVbvhYZVgC6BVPgDnsJzL5LnscEmRk34Up/fXuP
	I+GlJ+6upTj8+XherbAgCBxrnsxgbuh0qul7ipeTEdz3+U1A6FPAetmBo+NNP4uxbwKjQANv9HS
	i3YU+Qnk4I4Lcz3Ux+YlokUxibxzBP0h0xAiPrvFXB+xrOzG6y2fX0OIp7dkh59yHmROnQIO8sl
	jV4phiS0/Ism+/1ANbqAw==
X-Received: by 2002:a05:600c:8508:b0:490:9d1b:f07f with SMTP id 5b1f17b1804b1-490a290ece2mr269784155e9.12.1780388466849;
        Tue, 02 Jun 2026 01:21:06 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e88fdesm52829035e9.14.2026.06.02.01.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 01:21:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 10:21:06 +0200
Message-Id: <DIYF1E7O5JV0.8F9SHGFX5ZHY@smile.fr>
Subject: Re: [PATCH v5 1/4] oe/qa.py: add check_uri_srcrev() helper for SCM
 URI SRCREV validation
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <corentin.guillevic@smile.fr>, <martin@geanix.com>, <paul@pbarker.dev>,
 <mathieu.dubois-briand@bootlin.com>
To: "Sai Sneha" <saisneha196@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260602062940.3107241-1-saisneha196@gmail.com>
 <20260602062940.3107241-2-saisneha196@gmail.com>
In-Reply-To: <20260602062940.3107241-2-saisneha196@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 08:21:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238017

Hello,

On Tue Jun 2, 2026 at 8:29 AM CEST, Sai Sneha wrote:
> Add a shared helper function check_uri_srcrev() that checks whether
> a single SCM URI has a valid SRCREV set in the datastore.
>
> The function uses unexpanded getVar() calls (False flag) to safely
> inspect SRCREV without triggering AUTOREV expansion or live network
> fetches. It mirrors BitBake's internal SRCREV resolution fallback
> chain exactly:
>   SRCREV_<name>:pn-<recipe>, SRCREV_<name>, SRCREV:pn-<recipe>, SRCREV
That sounds wrong. Bitbake uses the *expanded* value:
lib/bb/fetch2/__init__.py:
1256         srcrev =3D d.getVar(a)

It needs the expansion to handle every possible overrides (for example,
MACHINE or DISTRO, but those are not the only one)

>
> Returns:
>   - The revision string if a valid SRCREV is found
>   - '' for non-SCM URIs or URIs with inline rev=3D or tag=3D parameter (s=
kip)
>   - None if SRCREV is missing or INVALID
>
> This shared helper is used by base.bbclass, insane.bbclass and
> yocto-check-layer.bbclass to avoid duplicating the same logic.
>
> Reported-by: Yoann Congal <yoann.congal@smile.fr>
> Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16051
> AI-Generated: Developed with assistance from Anthropic Claude
> Signed-off-by: Sai Sneha <saisneha196@gmail.com>
> ---
>
> Changes in v5:
> - Add tag=3D to skip condition alongside rev=3D to fix selftest breakage
>   (test_git_unpack_nonetwork) reported by Mathieu Dubois-Briand
> - Update docstring to mention tag=3D parameter
>
> Changes in v4:
> - New patch: factored common SRCREV checking logic into shared helper
> - Eliminates code duplication across base.bbclass, insane.bbclass
>   and yocto-check-layer.bbclass
> - Uses for-else pattern, f-strings, simplified name lookup
> - Adds docstring explaining return values
>
> Changes in v3:
> - Added AI-Generated disclosure and Reported-by tag
>
> Changes in v2:
> - Initial public submission
>  meta/lib/oe/qa.py | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
> index cd36cb5070..0987aaf2c4 100644
> --- a/meta/lib/oe/qa.py
> +++ b/meta/lib/oe/qa.py
> @@ -240,6 +240,36 @@ def check_upstream_status(fullpath):
>              else:
>                  return "Missing Upstream-Status in patch\n%s\nPlease add=
 according to %s ." % (fullpath, guidelines)
> =20
> +def check_uri_srcrev(pn, uri, d):
> +    """
> +    Check that a single SCM URI has a valid SRCREV set.
> +
> +    Returns the resolved revision string if valid (including '${AUTOREV}=
').
> +    Returns '' for non-SCM URIs or URIs with inline rev=3D parameter (sk=
ip).
> +    Returns None if SRCREV is missing or INVALID.
> +    """
> +    import bb.fetch2
> +    try:
> +        (scheme, _, _, _, _, params) =3D bb.fetch2.decodeurl(uri)
> +    except Exception:
> +        return ''
> +    if scheme not in ('git', 'gitsm', 'hg', 'svn'):
> +        return ''
> +    if params.get('rev', '') or params.get('tag', ''):
> +        return ''

Sorry but I'm not sure "skipping the check for tag=3D... SRC_URI" is the ri=
ght fix.

A SRC_URI with tag=3D... but no SRCREV is a situation we want to avoid in
OE-core so the check must remain enabled by default.
How about disabling the check in the test instead?

> +    name =3D params.get('name', 'default')
> +    candidates =3D [
> +        f'SRCREV_{name}:pn-{pn}',
> +        f'SRCREV_{name}',
> +        f'SRCREV:pn-{pn}',
> +        'SRCREV',
> +    ]
> +    for candidate in candidates:
> +        rev =3D d.getVar(candidate, False)

This code will miss many overrides (e.g MACHINE or DISTRO)

> +        if rev and rev !=3D 'INVALID':
> +            return rev
> +    return None
> +
>  if __name__ =3D=3D "__main__":
>      import sys
> =20


--=20
Yoann Congal
Smile ECS


