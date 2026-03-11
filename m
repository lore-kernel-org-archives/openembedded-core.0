Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3647103E2E5
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 20:44:21 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6633.1773261859503393064
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 13:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jr9PgcxA;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64caaacb9bcso397583d50.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 13:44:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773261858; cv=none;
        d=google.com; s=arc-20240605;
        b=kQObn7ah1tExrpmDC6tahW4KTi48YYThl8S1R0CHkMYxeevCQgIXhuNYxkr6kn7Q9G
         3LQPLVnXnS5K4YYeKzHxK/qshcRh8+c7ww7w0O1766BtWHnP9989r7YbJNQd3QukMbpr
         95Hp9AV7OgpGF2b3LTzR3L837AnPCA/KDi4xRo+az8r2IQdm2WIkMbMyhi/xsB82Lx9B
         bpD822D6TTuyFwgB+/gNL6k75U5K3fdPeLLku9514iOherHKa5swgx90ez4fWpttNiYN
         JaiOlLjL9NMIeAYSyubTeMGuvjZmqIic10jDcgJKcwRGvhRbFCm55Qcc1Y2JW0S4hD5b
         qveg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FDsCZlUa/vBbHk89aMyyfK8erTw510Ie5wydsc0MB98=;
        fh=O40SYvcy1jGEmbceIO96QTsgI2+wv8m09kxalw+zz44=;
        b=KN9XoXezQCbgaLvNysQDqm3RfCfyY80/FIZAmeJawWJTsKkUGPKX6M30UzOyz//BMR
         Mr0Nkl8959H3jZwHGzvBtLLJFbhRccKdy9NwryfJy+4N2dQAmsuRm8Y4KNx9iPRwRBWA
         oVvqOig7nUw35sjiAdnLAKo0vZqzMRp5Edajq1UTBHVs/WRGjM1FJzwXEa+cxgyIQape
         ScCfYwakT43VIXg2t0+lHZxODuscH/r8O5ZYOrQ/W0aMwEKjk8WoeT5GADPRlkAmQo0Q
         bL3Pj6Dk1VW9QHGxyBS6qEayFyX+mG8HW32EtY3aRIDYhk/xXECFkGKDWyOuZ6YXIHqo
         Wvxw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773261858; x=1773866658; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDsCZlUa/vBbHk89aMyyfK8erTw510Ie5wydsc0MB98=;
        b=Jr9PgcxAJvTj7N6bCcvznu8VZ7e9V2hJbb9tWCkBiVgRojzkAU61ktc+dKt08snQ3N
         x18FbfaVjwET9kKcKyOctZ735FpAgAjLEhWxArL3KwBK85jvBKcbI5f6MV9RqB1yq+CS
         yxVEINsMtxz+JPk5Akfxpb9Iabp4k0pa+xzXuFiy6B/M2nge7Cl40JiNkyz+OG+iggSh
         N1VUkZWHEh50ce2T5Fj/qJ/pLrZyfBYeOw2HUdf1ZNqzkN8g5gsP20/yRm6eUKpDE6Z9
         ln+LN1TL3drGMonormax8mb4CM/9F9LsEvfPwkcagKuZuYpg6c5XudeLmX2y98tY+RK+
         0V5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773261858; x=1773866658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FDsCZlUa/vBbHk89aMyyfK8erTw510Ie5wydsc0MB98=;
        b=Fh2vFCFSs3y+gtMNU3XcOHMJkn00t3nyNiNHD0kzBbK6ijoRZTqPwEUFRnVUhPCRtf
         FbCLh7notGx4A+GrWQ0o0V39VBqi96Zthbg5OLMfKt0H2cBCTZcuxCJZUKgJ5d5tnq88
         0hXXE87Bz4gP+PVjXgB+3fI1eWey8IV+gyXCoURhlgOF2FjTq6fdPsYys27se7XFH29j
         4moCKJeijsCxLKmtJiENt9xKVuFns+nyZ850T8RndnKZS5gg/na3tTnYsv6WBbnBqdZs
         Angqs4Q+8VTsdchSxSnhqFYW4CebxiBIrKt9TtxQD1xsZM+XQP52Iyc0dfDoe8JtORaK
         bECA==
X-Gm-Message-State: AOJu0Yx4Lb4h6Q3E6iWjFI6BhKZUDhgqGdcbaTtEWJHOePhh/m37m9fh
	WfXDMY06fe7z7rMiZzj/wRabjr23eVOAEkSgOsW+mTOeR3UjnwzcDQBtwHTTK7O560jn8VD7Fds
	cPFrz8UKNWvHr2JxyrPlpSpwDizcObrA=
X-Gm-Gg: ATEYQzyfcfyYvrYUKAezI97Ma0RSI1TVHJZEG5+IftIHvb/fQSTKnI1ubAIjwJZavwW
	q4+zuA2d6PZJJfYy4ZeAnLIOelD88442LfjA6T4N9DL6bPP4bAVr5gXhyL0ptAcNY1D93atWjlG
	WxMJF/4QSbk2NDMaJipf9M4d73bv5l29Kd6XTU/I/G0tk4hlYUQi/9gy4F51H6lXbIfBsBeX7rM
	sVAdaqTwR5pxIzt9sKCSnzc3QoTTExD7Akld4N5zfJvYjNHoLaGasZ4bXjUchv9GSTVMu+jVfbe
	4WVY7ZS5NdV93xrGFe3heg==
X-Received: by 2002:a05:690e:428a:10b0:64a:f177:ef28 with SMTP id
 956f58d0204a3-64d656a8cbbmr3027822d50.2.1773261858622; Wed, 11 Mar 2026
 13:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
 <20260309132854.128375-1-stondo@gmail.com> <20260309132854.128375-7-stondo@gmail.com>
In-Reply-To: <20260309132854.128375-7-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 11 Mar 2026 14:44:07 -0600
X-Gm-Features: AaiRm52y4xSplQjwifzJE8j2sNMe8OxxLT0SNpr6PXW3n3l56bGXuvMfSuW8Smk
Message-ID: <CAJdd5GYpMQUCfry=Btj80CfmmUTNu-80fxyxf6RcnKCtMHxHXw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v8 6/7] cve_check: Escape special characters in
 CPE 2.3 strings
To: stondo@gmail.com
Cc: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com, 
	stefano.tondo.ext@siemens.com, Peter.Marko@siemens.com, 
	adrian.freihofer@siemens.com, mathieu.dubois-briand@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 20:44:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232912

On Mon, Mar 9, 2026 at 7:29=E2=80=AFAM <stondo@gmail.com> wrote:
>
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> CPE 2.3 formatted string binding (cpe:2.3:...) requires
> backslash escaping for special meta-characters per NISTIR 7695.
> Characters like '++' and ':' in product names must be escaped.
>
> The CPE 2.3 specification defines two bindings:
> - URI binding (cpe:/...) uses percent-encoding
> - Formatted string (cpe:2.3:...) uses backslash escaping
>
> Escape the required meta-characters with backslash:
> - Backslash (\) -> \\
> - Question mark (?) -> \?
> - Asterisk (*) -> \*
> - Colon (:) -> \:
> - Plus (+) -> \+
>
> All other characters are kept as-is without encoding.
>
> Example CPE identifiers:
> - cpe:2.3:*:*:crow:1.0\+x:*:*:*:*:*:*:*
> - cpe:2.3:*:*:sdbus-c\+\+:2.2.1:*:*:*:*:*:*:*
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>

LGTM

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

Note: This can be merged without needing to wait for the preceding
changes in this patch series

> ---
>  meta/lib/oe/cve_check.py | 38 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
> index ae194f27cf..6555743514 100644
> --- a/meta/lib/oe/cve_check.py
> +++ b/meta/lib/oe/cve_check.py
> @@ -205,6 +205,35 @@ def get_patched_cves(d):
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
> +
>  def get_cpe_ids(cve_product, version):
>      """
>      Get list of CPE identifiers for the given product and version
> @@ -221,7 +250,14 @@ def get_cpe_ids(cve_product, version):
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

