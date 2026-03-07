Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E628F5510E
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 22:01:46 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18283.1772920904543904535
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 14:01:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ib+G/MMz;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-798374d0f44so150690807b3.0
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 14:01:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772920904; cv=none;
        d=google.com; s=arc-20240605;
        b=bWaUV7FkhV4InUl6pWJkF0dT8sCu81zBjg4sypWvMQNcLatRk9SG59wwY8hPPPZWgW
         6pWyS9j1xDBVdCyDgwFsFME3pWfirdXvKAFQ5KKcIsQIj9GjzB43m/6TYgQiBWTpdFAw
         ypUIdeKeq1ttfE0cPO70v0ZPucUYod2pwCl2g1AHoTT9ucY48OlNw+YPFXye2T8/gM8t
         E9td2IY4Gkf7s0Tp4/pP9JCgivDbP9qn9z3toj4yG59xriJqlHGUJdkuIhL/ZTTI0GTj
         PumbZPbJwmENYr9Jw05p5lkOzPcyMUN1heimu/bMvF2SiTtui+y2qZOc1aUCVr6Y2wfp
         LHfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U9RoMAHYYr3MhpUIIc2UR490ffsNLzvb2tS0ZuLvfDQ=;
        fh=aX9SpBcc1D+i0sBLZeYvRNp2cqEQvxp/jAk+Y+9zDH4=;
        b=L6/4XMIWvuiX0hzpiO9T+xM3/iD5gGAbAWsohFkp3wjwX2P2dtiIyw/1VKCtY7ZbSi
         7isN348e5PZ9LB60DLy51utAu4I/toUYxWo/zdGHFX6tavkLlowkAWlFRDZZQFfiGda4
         TjNy2dvle43ZVhNEam0Laj1C4tcnCWeaSRSEhQYaMj5V6bqhQqIvPZ0UX3y5rfvQtHbC
         fB09ywAv5GogWsYPaEAbvl4yU+3dnaN8hszfpAp9yq2I0RISPPV5E6EuJS8ZboXHDNc7
         3QqbZdzvuvl+lXHdYIZxle8GVS2Z9XmbFQJT4YwdUCZC+hQbeDAC2kEuLZ+Hr9RZbTFC
         MuBQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772920904; x=1773525704; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9RoMAHYYr3MhpUIIc2UR490ffsNLzvb2tS0ZuLvfDQ=;
        b=Ib+G/MMzIjIcFYHjjIZWt4CBtJvRkgBL12bnPVTSZTPeugk6V1J1i6Om3+bNPs4j5k
         J2eve4FTj1qaZ7NJ4eABCcWYaxTrkA5nYuknLNMI3d0qjqU914PTp2R2+CPWKy6quSiV
         ZLVAfAFgY+/uUoxfkLWf2Z0krp/Fh9k2ozGqR1qzi1h9fKR7yglX9/eSxjTXjShkWfB0
         ucbiPrkGnXv2cXUeOXr3mAUs2fCqJCSbvUF1+Fw8guB1q/4PpdL47u7PuNX5WIOr+jcR
         d8l1HGEbE0wZsKJLA9A1+Mn2IyvRMvJDn3kUf4OJgOyH78iMFUZv5VnzoS9OFbJCvn6H
         QGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772920904; x=1773525704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U9RoMAHYYr3MhpUIIc2UR490ffsNLzvb2tS0ZuLvfDQ=;
        b=RYIbqpzccsuadVGFmRM57ndzIEpm+TcBxuuzhj9FvrDtB5oIBRIe9m9Pd8L3n/BM66
         vHy09o6hApkYd0hJf5WOdxKf5amNVW+bbmLiRBECozkSqVpE8mopbx1W5mfyahAt7LL3
         +aoVK32vS0Flgq5IAeV/GefZ66avTFGcXa+wGfE3SFqTE7i2AJXHs/JWp7Wu+3wybLk5
         rbL6XjURO3eNZRvXfh7y4DU6V6LNHB0QBWMSsFBr4K7eVzMAWksnuV32ITf4cEGr5XBZ
         YMH+KrLTy8JugCzI8nG1RpsZqyNq2nHYk5KJcygKymRykBYRdX7BRcb7A0/xPTOT2+FY
         c9zg==
X-Gm-Message-State: AOJu0Yz8siSK4p/keCSU0dp3f12KA2bC6ogBWx0lQOCEZd88m34ABHVC
	yNrkzCtGBz7Qh8KfLuhQPvSt4GMjAivpsl3tyTo7NthuG5SCfR7MOPKobageCSyevDKBbO4NtCd
	gdxf67IOOzLqtvTmBWMocwloNAyFS/fg=
X-Gm-Gg: ATEYQzya0oqFGgv8S5QbAlRX5SommIAqHpY2aujCMD4nU8ddhNMcwe/UrVewKaw0YA0
	fd2A4T3fj5KgUqXEYEHcWG7LVvMjrkcS7JPo93XgnwF/U10Fnco0EY8mM6mBIzfzxtz7cuO+Zh0
	R2sHUbtiqf6K1WAIfO4pjhyiEdcS0wTi+hrMNLyir5VGXNTXPTBFW499hu17hwBHo9iz7lJo6k0
	tWyCVMVa7vFf7FwO+aLdmcwqvh59Wt7w+Wp4V92WgGUo1woyPxBnN7bXNkBszYJscIahbR/gBkA
	ImtiAT4GvyshItoTRbowpg==
X-Received: by 2002:a05:690c:c4f9:b0:798:5cab:cb79 with SMTP id
 00721157ae682-798dd6a9c0fmr57936067b3.2.1772920903637; Sat, 07 Mar 2026
 14:01:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com> <fdb53e8be6a3d57a67979648cd8f6c8f4a65466f.1772805096.git.stefano.tondo.ext@siemens.com>
In-Reply-To: <fdb53e8be6a3d57a67979648cd8f6c8f4a65466f.1772805096.git.stefano.tondo.ext@siemens.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 7 Mar 2026 15:01:32 -0700
X-Gm-Features: AaiRm52JOrh_IAD4Ir6UqJ8ludnX9vE6iJcxr-pUnyJKIirXgUO-TEkDN_ncfOc
Message-ID: <CAJdd5GaUvzSJ7s-R0Kg-Z1LgU8mA3SzryowmeWtKke274aC59A@mail.gmail.com>
Subject: Re: [OE-core][PATCH v7 09/10] cve_check: Escape special characters in
 CPE 2.3 formatted strings
To: stondo@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com, joshua.watt@garmin.com, 
	ross.burton@arm.com, adrian.freihofer@siemens.com, Peter.Marko@siemens.com, 
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 22:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232618

On Fri, Mar 6, 2026 at 7:00=E2=80=AFAM Stefano Tondo via
lists.openembedded.org <stondo=3Dgmail.com@lists.openembedded.org>
wrote:
>
> CPE 2.3 formatted string binding (cpe:2.3:...) requires backslash escapin=
g
> for special meta-characters according to NISTIR 7695. Characters like '++=
'
> and ':' in product names must be properly escaped to pass SBOM validation=
.
>
> The CPE 2.3 specification defines two bindings:
> - URI binding (cpe:/...) uses percent-encoding
> - Formatted string binding (cpe:2.3:...) uses backslash escaping
>
> This patch implements the formatted string binding properly by escaping
> only the required meta-characters with backslash:
> - Backslash (\) -> \\
> - Question mark (?) -> \?
> - Asterisk (*) -> \*
> - Colon (:) -> \:
> - Plus (+) -> \+ (required by some SBOM validators)
>
> All other characters including -, etc. are kept as-is without encoding.
>
> Example CPE identifiers:
> - cpe:2.3:*:*:crow:1.0+x:*:*:*:*:*:*:*
> - cpe:2.3:*:*:sdbus-c++:2.2.1:*:*:*:*:*:*:*
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>

LGTM thanks.

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>


> ---
>  meta/lib/oe/cve_check.py | 37 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
> index ae194f27cf..fa210e2037 100644
> --- a/meta/lib/oe/cve_check.py
> +++ b/meta/lib/oe/cve_check.py
> @@ -205,6 +205,34 @@ def get_patched_cves(d):
>      return patched_cves
>
>
> +def cpe_escape(value):
> +    r"""
> +    Escape special characters for CPE 2.3 formatted string binding.
> +
> +    CPE 2.3 formatted string binding (cpe:2.3:...) uses backslash escapi=
ng
> +    for special meta-characters, NOT percent-encoding. Percent-encoding =
is
> +    only used in the URI binding (cpe:/...).
> +
> +    According to NISTIR 7695, these characters need escaping:
> +    - Backslash (\) -> \\
> +    - Question mark (?) -> \?
> +    - Asterisk (*) -> \*
> +    - Colon (:) -> \:
> +    - Plus (+) -> \+ (required by some SBOM validators)
> +    """
> +    if not value:
> +        return value
> +
> +    # Escape special meta-characters for CPE 2.3 formatted string bindin=
g
> +    # Order matters: escape backslash first to avoid double-escaping
> +    result =3D value.replace('\\', '\\\\')
> +    result =3D result.replace('?', '\\?')
> +    result =3D result.replace('*', '\\*')
> +    result =3D result.replace(':', '\\:')
> +    result =3D result.replace('+', '\\+')
> +
> +    return result
> +
>  def get_cpe_ids(cve_product, version):
>      """
>      Get list of CPE identifiers for the given product and version
> @@ -221,7 +249,14 @@ def get_cpe_ids(cve_product, version):
>          else:
>              vendor =3D "*"
>
> -        cpe_id =3D 'cpe:2.3:*:{}:{}:{}:*:*:*:*:*:*:*'.format(vendor, pro=
duct, version)
> +        # Encode special characters per CPE 2.3 specification
> +        encoded_vendor =3D cpe_escape(vendor) if vendor !=3D "*" else ve=
ndor
> +        encoded_product =3D cpe_escape(product)
> +        encoded_version =3D cpe_escape(version)
> +
> +        cpe_id =3D 'cpe:2.3:*:{}:{}:{}:*:*:*:*:*:*:*'.format(
> +            encoded_vendor, encoded_product, encoded_version
> +        )
>          cpe_ids.append(cpe_id)
>
>      return cpe_ids
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232575): https://lists.openembedded.org/g/openembedde=
d-core/message/232575
> Mute This Topic: https://lists.openembedded.org/mt/118170503/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

