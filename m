Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B584C43458
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 16:17:16 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3835.1782577027256519606
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2026 09:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=r55n0GRG;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-664bb15d05dso338634d50.3
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 09:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782577026; cv=none;
        d=google.com; s=arc-20260327;
        b=sJK98RLpchSMtQ6Qzui4dK5LPbQsFjsvbjHH0x6M3uebhSfKZ83ECblEDQvNFq2FeE
         mdG39C0PqTy86RIjMR8DO+jo02EMWKjySykUad4Isbv5GMDE1U8Dutq16H6bw7IwGulR
         qTBrO/QLCXLw6Gb8gwayLgQ6+yCboXf78TzZ6s0b9T95BVI/cyoUWkgD3Kd6rOvXWmx9
         iNZ1O4KKc6xKdd7vPiWmCmxHqX1oQ6eEv1lmrV/+R6/c3sBQHCcACXG3RixQDG2XaxO2
         dahRR6DRr1hLeZuyvLXrbMZZTNMMbXE+5c3PYQ48/fWb4v4Ac05+aW5JC5NyHHTjF5xo
         ODew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2639EDJ+RGwy7vGvUnbvq6GEraOp3sdtl9wzKwz3eFg=;
        fh=v4HrjAi87NrT32cmuSmvgjPf8SLEBZw9gUrgmdobrKU=;
        b=FYcD9iCfuJ//E2tbVCOrRlr0PGsGMKX14ElkjmEKUZd42K1Rr0Gkg6PZsrytmfXADI
         ijwxEFm7U9FOcdM1K+SCA9eECzvIk0CR1ebTsew/zG15GadTQEubE+XCwTiqVJuNTgS4
         wdqc3KUlNyNyvJDZmSNjCv7imeRxocFmVRhGMkF2OMwNm57p3rD8hblh4HBnx9R8b7MG
         NOBn0nJ8874Gprn5X5TURWP0vg4ew5jMTeZzDhBJG444np+cUhvJEydnqNk5f1pHBf3T
         5lbJeJWIMMjv5/Ea9nGz2cM1INXooRqFNNY/0CH3AjftATp4WehJjOkZ0NMggl7l+19F
         qXlA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782577026; x=1783181826; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2639EDJ+RGwy7vGvUnbvq6GEraOp3sdtl9wzKwz3eFg=;
        b=r55n0GRGQkF294BoH2/JGWAb8Qgr7dbyR+TY1n4IAyigSZ/m8hOSEw133vROJUMsD5
         jdeGT/v56G0yaf5BKkQ3tjmuwGn50L2Novmkh3QAbHv2EwCYYErTEX5vDoGGKn++L7RE
         IciwWZNXigcshZqWW3V8dBtYIBNNT9WUVFts64xEoZeH4FlskwFdwp1XiprsWGGEo69a
         dvxxLGtk4orU3QOx0bHkx2en8ocUEcH7VbsYWmkJwqNtTPXHzBUKvdvhGcgGzorzy19R
         jUOyaMmV2OXfes5btE3E2CSvNwrbVldrsqXu2HZbArkxnbKnrg9DJiDHaFzNZTxMpHh2
         THqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782577026; x=1783181826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2639EDJ+RGwy7vGvUnbvq6GEraOp3sdtl9wzKwz3eFg=;
        b=UG+jtooULalQTrZMdtg9qUSgOCSm9tPaUacWakBeK/OKW1UCgdNaJqWYxKQek3Tivp
         9H7AOYeSgWAfuSqH5cfH2CHr2TGpoHMnLckHDa5sCAQnbcB5k/G2pNudRk4xnC3hAKGb
         nVdHyLtlK2XZW1bZfUmyalZOUp/1mM/hStBRL3PRZ5cnCdIsSBd9qjXd9AZWTyuXcOPV
         mXd0wdBZbPbY43HmKNllD1wxLhauQLJZ3Z/b5OFMZIXFSH89MHoxvTUn6fJJ8R8VvqXi
         F+jQLdghneTvTYCrTBZXFjg6FnwPhRIg5YaCGCNKXxRf1GYQM86ymZGV7wMUA2eJvd7W
         jOkg==
X-Gm-Message-State: AOJu0Yz5/bmemt4iBcZNk2IBDyT+ocfqEuu9HYH6KKe8FuVP8uQTibaY
	h8ORi1tAkBx/puyXCTLOFEfz8//e3n50vM8zHDdKJvi/UiQAg/cSL1UhKzywjIF0BNCLRw37NkT
	P9HPVeELwi0d5ihmViDTEFEjhog/xBz4=
X-Gm-Gg: AfdE7clmS7vRz4X2dS+vCcJvLm4FQIBpqZoClyqSZ6Os00vNYdpDRXNKSgjzqa4Q2Tm
	l6hkWlhAYyDTLR/X/XiUT62NrZiOZthBLqr+SA3uZ5zyyF3hXFQixx9BcGnnihBCxKFz3nkK3Oh
	iUBvKRpLJOBDx4BIYPcm86sAZDx9TVuwewmX/suSLOflTVSiXxiOS2B6IIqB12Nf1UQLfCqmyqA
	PFahNS1Dkc+i2NBfoC2xjDLb+lulBhYhlW3WSxemj655c66DFQBx76Trh95hLrRjyZ7txRGve9H
	n3SmsuYawYvHry2ke7dpfRd3GgOygGu0kOSKEWzFtB7p/X6HKK8+wWOnd9mexA==
X-Received: by 2002:a05:690e:bc7:b0:664:c429:fbf with SMTP id
 956f58d0204a3-664c429134fmr1080492d50.6.1782577026215; Sat, 27 Jun 2026
 09:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <18BCFAD7F631814B.1079487@lists.openembedded.org>
In-Reply-To: <18BCFAD7F631814B.1079487@lists.openembedded.org>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Sat, 27 Jun 2026 18:16:55 +0200
X-Gm-Features: AVVi8CdG_Di5rUqjMIA2jGiWKYFswxB3WY-ECMNjuziyoRafEXkMJSwiI7i3jS4
Message-ID: <CABF_=yhGJTj4H5LDZicz+h4C2AMP3dtRtiEJVUJ_vfww3b+xtw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pull-spdx-license.py: add the SPDX licenses exceptions
To: jan.vermaete@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 16:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239698

Please consider this as an example.  It does generate the extra
license file. But I could not verify anything else.
see: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16294

On Sat, Jun 27, 2026 at 5:49=E2=80=AFPM Jan Vermaete via
lists.openembedded.org <jan.vermaete=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Fetch and extract the SPDX exception licenses as the normal licenses are =
handled.
>
> [YOCTO #16294]
>
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>  scripts/pull-spdx-licenses.py | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/scripts/pull-spdx-licenses.py b/scripts/pull-spdx-licenses.p=
y
> index 597a62133f..de1f5b7bad 100755
> --- a/scripts/pull-spdx-licenses.py
> +++ b/scripts/pull-spdx-licenses.py
> @@ -55,20 +55,22 @@ def main():
>              data =3D json.load(response)
>              version =3D data["tag_name"]
>
> -    print(f"Pulling SPDX license list version {version}")
> -    req =3D urllib.request.Request(
> -        f"https://raw.githubusercontent.com/spdx/license-list-data/{vers=
ion}/json/licenses.json"
> -    )
> -    with urllib.request.urlopen(req) as response:
> -        spdx_licenses =3D json.load(response)
> +    spdx_licenses =3D {}
> +    for jsonfile in ["licenses.json", "exceptions.json"]:
> +        req =3D urllib.request.Request(
> +            f"https://raw.githubusercontent.com/spdx/license-list-data/{=
version}/json/{jsonfile}"
> +        )
> +        with urllib.request.urlopen(req) as response:
> +            spdx_licenses.update(json.load(response))
> +            print(len(spdx_licenses))
>
>      with (TOP_DIR / "meta" / "files" / "spdx-licenses.json").open("w") a=
s f:
>          json.dump(spdx_licenses, f, sort_keys=3DTrue, indent=3D2)
>
> -    total_count =3D len(spdx_licenses["licenses"])
> +    total_count =3D len(spdx_licenses["licenses"] + spdx_licenses["excep=
tions"])
>      updated =3D 0
> -    for idx, lic in enumerate(spdx_licenses["licenses"]):
> -        lic_id =3D lic["licenseId"]
> +    for idx, lic in enumerate(spdx_licenses["licenses"] + spdx_licenses[=
"exceptions"]):
> +        lic_id =3D lic.get("licenseId") or lic.get("licenseExceptionId")
>
>          print(f"[{idx + 1} of {total_count}] ", end=3D"")
>
> @@ -88,7 +90,7 @@ def main():
>              continue
>
>          with dest_license_file.open("w") as f:
> -            f.write(lic_data["licenseText"])
> +            f.write(lic_data.get("licenseText") or lic_data.get("license=
ExceptionText"))
>          updated +=3D 1
>          print("done")
>
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239697): https://lists.openembedded.org/g/openembedde=
d-core/message/239697
> Mute This Topic: https://lists.openembedded.org/mt/120005594/2167232
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ja=
n.vermaete@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

