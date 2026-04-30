Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC037FF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 13:54:37 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21194.1777557271617352145
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 06:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ToI7664g;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4486b5fcf3cso881886f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 06:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777557270; x=1778162070; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHJNYv9rPp6pZBL9AfPyWNCv5qNR68yYgrqV85y9oQw=;
        b=ToI7664gQnPDacsPFiMlWkaE88hhJg4hroKUf4lrmqIyeDhtyFUlA3bZL82yYkEE/i
         MfQ+2wNUjC0HG7JAT6pPdJb5gPxGp8WNJGjTWs69CuDCUN4gquf98W5aBFThs6XyrJAh
         JEkhnx/KuMrxa5twJsEkoZON6qJwpU5Be0FmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777557270; x=1778162070;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KHJNYv9rPp6pZBL9AfPyWNCv5qNR68yYgrqV85y9oQw=;
        b=mnlROpbJTKhylDBr1qBJLr8URZVV1/UlJVfJMHNuIe2wC955ABV88LXjnau92T+XD6
         irBP4gAQ96tZF+nskg3FCeJUaVFbhjUuWqiKTxY2GB8O8i6Yus3eDEnYNc2vL+BgySIB
         XfQPOCCEwLw4u/o38jQNH5bWOkM2pDdYHaCeJ1792nGCROUHVh+HA90ceknUp9X8jLcH
         kD0enLwGixe05oDPeSsy8HwP8cypovnPaw1P4QOTh1vYI4gCxuhTZNActJcmSI4TV+q3
         vSGjMvqfzdt8edcdwcgwIlbe+TIgBrXSbsZ8nF7P15eegf8alqR56f83m9OGMPR46wPv
         lzvw==
X-Forwarded-Encrypted: i=1; AFNElJ8AaFYPU4/WI6K18E3pCGMLZbRTw/K98tMkc3AeBNKh6lyhi9Dz2fCjocgYwCg1Tq2pAHgr/3FOvrjswJVi4H53mw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzr1Zb4nxt/ucw+5+bBVd62VrSAAvMi3RrxMjlCNyP6Dpr9nBT2
	rrw7pxsSOYcc6URQEKDVopqLcBttT4hYmUUXPdASzxktrM0iVfeM1OJ/JWNWupjQWLg=
X-Gm-Gg: AeBDievmxQaFr2PNUmBQKGfh/bvT0vRQNY2HeCJhEpsq9YNX+QV3z4aSWNlDFXxRJVM
	aGKnz7EReDGscQSk7LcQ+d1Os7jcmeAO/uRq2tUKH0PDQlEvN9/TSbALxj1+5Rh9siG5XNW2V5c
	rMhm87wevdY01UOhFeYt7JysNJyvLZ45FJVkRrhiRVMYdOF0dBUBcJPxMZKf76aXxY0y8UaWAvQ
	u1U5Km0Xob9WXEyzpi/UkRfzl7IVYbU/y+RTq5jLZqBT7b5ExqsUon9l6K7SE8oFfKVrSIzS6n+
	7TEw95v0BxkTbC7nHeNw54K9ZqJbpi6JrIdc/nT+hTEPyx2RT6RRFM/6c8awOidn3Cnb+rDv1Gn
	lI/FYQ2S2EJzRSVpgkMXw/U79PLm8w42G+VnhiPQd6tSWbKfFbDuXaEG8dUs23QaJT9wUsmYzzQ
	s2HeOqtKeD+dZ1w8vN2TxIOflTXyq0MDua1AZceQmUrO+bKIeJVBFNMKVW8Zn6dl02hToT2qcbB
	R18D8EhEOVm8Oz3k85z9Ki0
X-Received: by 2002:a05:6000:2407:b0:43d:7854:32e7 with SMTP id ffacd0b85a97d-4493dcd4346mr5123665f8f.15.1777557269637;
        Thu, 30 Apr 2026 06:54:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c98d:ac74:daf:72a1? ([2001:8b0:aba:5f3c:c98d:ac74:daf:72a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca67aesm12628682f8f.33.2026.04.30.06.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 06:54:28 -0700 (PDT)
Message-ID: <ae2eb15dfea13034c01e5159c84a3d33c3379e0e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] package.bbclass: extend package variables
 for multilib variants
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jaeyoon.jung@lge.com, openembedded-core@lists.openembedded.org
Date: Thu, 30 Apr 2026 14:54:28 +0100
In-Reply-To: <20260429143104.684760-4-jaeyoon.jung@lge.com>
References: <20260429143104.684760-1-jaeyoon.jung@lge.com>
	 <20260429143104.684760-4-jaeyoon.jung@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 13:54:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236170

On Wed, 2026-04-29 at 23:31 +0900, Jaeyoon Jung (LGE) via lists.openembedde=
d.org wrote:
> From: Jaeyoon Jung <jaeyoon.jung@lge.com>
>=20
> Ensure PACKAGEVARS are extended for multilib variants during
> do_split_packages so that per-package metadata is correctly
> renamed when BBEXTENDVARIANT is in use.
>=20
> Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
> ---
> =C2=A0meta/classes-global/package.bbclass | 11 +++++++++++
> =C2=A01 file changed, 11 insertions(+)
>=20
> diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pa=
ckage.bbclass
> index 67148fc1ac..d981424290 100644
> --- a/meta/classes-global/package.bbclass
> +++ b/meta/classes-global/package.bbclass
> @@ -169,6 +169,7 @@ def do_split_packages(d, root, file_regex, output_pat=
tern, description, postinst
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 for o in sorted(objs):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 import re, stat
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 import oe.package
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if match_path:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
m =3D re.match(file_regex, o)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
> @@ -225,6 +226,16 @@ def do_split_packages(d, root, file_regex, output_pa=
ttern, description, postinst
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
hook(f, pkg, file_regex, output_pattern, m.group(1))
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 d.setVar('PACKAGES', ' '.join(packages))
> +
> +=C2=A0=C2=A0=C2=A0 variant =3D d.getVar("BBEXTENDVARIANT")
> +=C2=A0=C2=A0=C2=A0 prefixes =3D (d.getVar("MULTILIB_VARIANTS") or "").sp=
lit()
> +
> +=C2=A0=C2=A0=C2=A0 if variant and prefixes:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 import oe.classextend
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Extend package variables fo=
r the given variant if unset
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clsextend =3D oe.classextend.=
ClassExtender(variant, prefixes, d)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clsextend.rename_package_vari=
ables((d.getVar("PACKAGEVARS") or "").split())
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 return list(split_packages)

Firstly, this puts multilib code into generic code, which we've tried
very hard to avoid.

Secondly, this processes all of PACKAGES again.
rename_package_variables is designed to only be called once. Calling it
a second time isn't a good idea. We really should only process the new
split_packages?

Cheers,

Richard



