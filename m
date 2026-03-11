Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07D2103E2E2
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 20:41:08 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6497.1773261661838923608
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 13:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OUaGWrA3;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-798617c0ad5so2381287b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 13:41:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773261661; cv=none;
        d=google.com; s=arc-20240605;
        b=HguFSpIx62iMMMJLLcBqL0aEUhDan2huga/mOJuXryWSNsXtetD+rt8d1mra9NyTUu
         HRK4aT5DTzq0hoTiiLkk+sqFrszgWSVSsHHnvMXQ75vMtRcjdkjFAL/uk1Az6gFNOvom
         Eim1PH4L8CgXS/UpR6vy5Z7DnUkRZQuqaeFIm32vWcgC8aTX5SFNkprSIR0dYQ+/2a3V
         yruvqL8uMmjzODuGhrIzaPV8lHTZRuuy/z0N9WBHqPHhR01iLtz8Rtbwzx+rCRymSwQS
         dm+tX5g4xCXtC/6cwwF7n9if/jwt1m8gzuZ9BKwHJfqblSLeuyXDCMPFAcIWMuptMcoI
         KMVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j42auBECQhlYVYe77WH6q3x59Kwp8EogfuXXAoEuPMY=;
        fh=O40SYvcy1jGEmbceIO96QTsgI2+wv8m09kxalw+zz44=;
        b=Ib1kysB6bbgQuPrz7K0U4HNfZu47qbvgQDcuKTfSl8Vuadec9kAROvRNpfW5UAY1i8
         4WsQ2aBpK+b+Jb3hIcFdjlZRSjrrJqIgNryw/48t2rEBEvhXhaMY0aKHTdeo2ESNPJmF
         sphD9khp124zSMp+Gn6npJLz8Vf8Z/LWrkpB3zT/oHcwbsKN99lqAhjnApdB9TvLCE9I
         UNXqiFiek4H3cppL13z/O4Rwoep/8SV9CdjPhXYElejWfe2qSp1B5E64H98moank9QDz
         2ghPb6lYaRPxN0DZOZ1ezSMlk8M9GYDDk/2LLCBllohfxHdR7rdfMbCC956Qr1yCjNyA
         ovCg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773261661; x=1773866461; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j42auBECQhlYVYe77WH6q3x59Kwp8EogfuXXAoEuPMY=;
        b=OUaGWrA3rdCuJV8QtWvBG+cS/wuo1qeRcqwDSLPI5p6FTjgMBvw4iDL2FLSQuic43v
         twIrQOcMu15pPCLG22RAO2cYptOfZFj8OXWODvDLspFkJOGxEipQtEWPxuiGH9707wJp
         BQSzd+Ni/hQg7qEBVU3XRAYyfGQ3ZwIGrZi34y+1dUn76QKwc1OwtQWyXIaZtcD1mnAR
         gbh1zqdlfX9cxoyySKM6vY5TCbnIuyM7eF+Nk59Pxpe9vBaSIGVt4nHTsKhKvDQsF7pF
         rYcwUiZOSnjwGutXjYn3JnbvCJT3HhD4ZPOf4KXa4a1mX72WVhuELcSR2N4UdooVrbLM
         K28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773261661; x=1773866461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j42auBECQhlYVYe77WH6q3x59Kwp8EogfuXXAoEuPMY=;
        b=CqdR8JsallGVkJGYs3ylCqSahgOIvRgCWCjdHQ+7CYsL1vw0bKGm1wJBFpS1XeMqnN
         5nILJUZLSnFWsSbfrJpgEX48fbY+9YsSgx+vhq63zdg6DEH4njlFs09XpGF9JkXFF01+
         ZtXTQc0awTLQCY4Sea+BSq7h5wc24eq14KG78U9D52FOuWnm+S4a+zB0M0oRYfXzKOnb
         9rPPTy9a5ih8F/8sCt9xQ0J0rVnuDvcpfrZXdo8BRShXyQGZa8OvQwJTmiSijBQhK1O+
         srFphgu/tX9jJbgKmVhTAW7YZpgdwbKlF9bsx/a1R6HwM46Oztb1M5gZhgk1/HNgLMoB
         SyKg==
X-Gm-Message-State: AOJu0YyO9+0gnhB+MKMb/9d3qAxm7WlQQF6k4aoxcvNdsSJhbXbJ7GU3
	k6I/NqRl7ug9a8hfewDl8shEgWaz3O31opE5v9Pc12IOWUTWalC3Oxk3y+N5pxYnaFGjx1MSwk6
	Scj1hh8nMRweuxTN4BI5jJrcXhjIgjLJZyA==
X-Gm-Gg: ATEYQzzKS1XjzwW3smfb+ns1LU5WM5g+RkmOp/o8e805Ehy5Avoh2o2vCv7jkXrDHgp
	NxV6ZSle6Y8Muj8nYHg3nj+nHMd3xg0noU2dNyt75t3fSuwmUwOzsWZlqpNI3dK1WucpgDl7pZS
	WtrIBcV8wS7QHao1T8h4AkXeR3oHmMZ2msGXhFOajucwU+pnRteFfOKcOkyA8E8nhricpE/iD4t
	gbUbwxYUg/UcjChR7TMtHNcwojEkhafMrXTzxw6PHkCW5hozYT4g3r/1ZWOBAXi0qOM5ukm2gAe
	dS01589ULMYGufG4b8bt1w==
X-Received: by 2002:a05:690c:dc4:b0:799:330:79dd with SMTP id
 00721157ae682-79917fcf8c7mr38607897b3.46.1773261660946; Wed, 11 Mar 2026
 13:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
 <20260309132854.128375-1-stondo@gmail.com> <20260309132854.128375-6-stondo@gmail.com>
In-Reply-To: <20260309132854.128375-6-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 11 Mar 2026 14:40:48 -0600
X-Gm-Features: AaiRm535OkXlsNkHI3fjiGTnb0dxzI-uXsb9_ZeX1vCrxdmgkKjWOrl86etG9P8
Message-ID: <CAJdd5GZxnNKfi8jqF-_tWTLL172BVJ540_Ozgc7zrDr=uJzpJw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v8 5/7] oeqa/selftest: Add tests for source
 download enrichment
To: stondo@gmail.com
Cc: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com, 
	stefano.tondo.ext@siemens.com, Peter.Marko@siemens.com, 
	adrian.freihofer@siemens.com, mathieu.dubois-briand@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 20:41:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232910

On Mon, Mar 9, 2026 at 7:29=E2=80=AFAM <stondo@gmail.com> wrote:
>
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> Add two new SPDX 3.0 selftest cases:
>
> test_download_location_defensive_handling:
>   Verifies SPDX generation succeeds for recipes with tarball sources
>   and that external references are properly structured (ExternalRef
>   locator is a list of strings per SPDX 3.0 spec).
>
> test_version_extraction_patterns:
>   Verifies that version extraction works correctly and all source
>   packages have proper version strings containing digits.
>
> These tests validate the source download enrichment added in the
> previous commit.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  meta/lib/oeqa/selftest/cases/spdx.py | 69 ++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftes=
t/cases/spdx.py
> index 41ef52fce1..7ce2ea57b1 100644
> --- a/meta/lib/oeqa/selftest/cases/spdx.py
> +++ b/meta/lib/oeqa/selftest/cases/spdx.py
> @@ -414,3 +414,72 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase=
):
>                  value, ["enabled", "disabled"],
>                  f"Unexpected PACKAGECONFIG value '{value}' for {key}"
>              )
> +
> +    def test_download_location_defensive_handling(self):
> +        """Test that download_location handling is defensive.
> +
> +        Verifies SPDX generation succeeds and external references are
> +        properly structured when download_location retrieval works.
> +        """
> +        objset =3D self.check_recipe_spdx(
> +            "m4",
> +            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/recipes/recipe-m4.spdx.j=
son",

SInce you'll need another revision, please change "recipe-" to
"build-" to align with my recent changes

> +        )
> +
> +        found_external_refs =3D False
> +        for pkg in objset.foreach_type(oe.spdx30.software_Package):
> +            if pkg.externalRef:
> +                found_external_refs =3D True
> +                for ref in pkg.externalRef:
> +                    self.assertIsNotNone(ref.externalRefType)
> +                    self.assertIsNotNone(ref.locator)
> +                    self.assertGreater(len(ref.locator), 0, "Locator sho=
uld have at least one entry")
> +                    for loc in ref.locator:
> +                        self.assertIsInstance(loc, str)
> +                break
> +
> +        self.logger.info(
> +            f"External references {'found' if found_external_refs else '=
not found'} "
> +            f"in SPDX output (defensive handling verified)"
> +        )
> +
> +    def test_version_extraction_patterns(self):
> +        """Test that version extraction works for various package format=
s.
> +
> +        Verifies that version patterns correctly extract versions from
> +        tarball sources and that all packages have proper version string=
s.
> +        """
> +        objset =3D self.check_recipe_spdx(
> +            "tar",
> +            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/recipes/recipe-tar.spdx.=
json",

same here

> +        )
> +
> +        # Collect all packages with versions
> +        packages_with_versions =3D []
> +        for pkg in objset.foreach_type(oe.spdx30.software_Package):
> +            if pkg.software_packageVersion:
> +                packages_with_versions.append((pkg.name, pkg.software_pa=
ckageVersion))
> +
> +        self.assertGreater(
> +            len(packages_with_versions), 0,
> +            "Should find packages with extracted versions"
> +        )
> +
> +        self.logger.info(f"Found {len(packages_with_versions)} packages =
with versions")
> +
> +        # Log some examples for debugging
> +        for name, version in packages_with_versions[:5]:
> +            self.logger.info(f"  {name}: {version}")
> +
> +        # Verify that versions follow expected patterns
> +        for name, version in packages_with_versions:
> +            # Version should not be empty
> +            self.assertIsNotNone(version)
> +            self.assertNotEqual(version, "")
> +
> +            # Version should contain digits
> +            self.assertRegex(
> +                version,
> +                r'\d',
> +                f"Version '{version}' for package '{name}' should contai=
n digits"
> +            )
> --
> 2.53.0
>

