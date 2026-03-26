Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E8210AB822
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 20:16:10 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57391.1774556164026554986
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 13:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Y9fxRir6;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79885f4a8ffso14010397b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 13:16:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774556163; cv=none;
        d=google.com; s=arc-20240605;
        b=RB/R1H32707Vp7QCVn6qJThZijgDMMmLxRj9NMUzl4scuPe2fqYwGa5xsEko03LQlq
         6ILAcF41SOjwq+mtnzon2csGWyPIkYEH5oVColbwOdQVr8Qq3RST1DUq8Ibt14Jpc09J
         i8FHmvXAhljxI7u06ALQUG5js4cdYa3J2/dmbKQ2sa39ecKGr4lAQidskLhLcs8CzdV+
         3jUMdt4QpMLEWkp/ec6Ne5dKd6JjIHWhtEbwNt85n4E4WPwUEMIDRmsdwcJtlxl8om6N
         nNQsp7IYiO4FG0Vomvv2/zHBf4opny5LcIQkOcLpFHmbmmHYH0qlrPjUyo8wAOAl6Ou7
         ncEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HGzAQ0Ytbp9DMP9qKdST+gwoQBJoq8iQyaGEpDcKzYM=;
        fh=DXi/jZN+Y0f6AuF67U0rstiU79zA7VkJWDisO6OBcA4=;
        b=d7b3LYfR808Q1sYskiVyo/GONsGYzB1X+1GYs7Y1Rt6eg8HKSwdyxxixEM0XSkTTUW
         CmLpcuQF8sCGAA/2obuugliTDVfkCB25mB7Xue2CsbK73YnjlrtgYSr4Kc+l80aeqbLD
         +0lzvlJwCoGp62O2JjebZNaixWw2wD64a583c9VJw636KyiP1C84gfToeY7Xi6exZeoy
         X4TJwSmUyedIuVZcSHgJyGflOn6/S6KkMb1pdsv1gy0wbWLw3dJLC0jqjuRehA1WkH6e
         +/aAZVbyesvxMKvcPtdPtU40BvSCU952APeZoHUhKhT5FbeCacIXblf69vVZgLGBZefD
         uZoA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774556163; x=1775160963; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGzAQ0Ytbp9DMP9qKdST+gwoQBJoq8iQyaGEpDcKzYM=;
        b=Y9fxRir63RUz+zRRjesy6eqzWmQKNWS0Se8JF+x/IXcU9blkwb5IrqJI6Aml7cERwd
         NLtgbXnPbZ1oWMjESTM8WLwErwOEB2mZ/b4pw0wi8ajLz4tzuM4Bl3nMhw1/ofTtfMYW
         f7wW02oMahrZd4xrr7aPIbWnJ0O3ujBm++360v4rsc9vJMRqDRi89PsfaQ3BQ2GeCnap
         P+R3063ACsZl0ybjoKyQKlagvxl/8v6DK+JDb90tZzEbz5t4OFlHftnTgCyxngkBEamK
         9U+7A+g7nZpfFht8Xbu7gYc/vrhjQrCyejSAdtZDYwO1ML46mk7myOFJ3sLU/2oNfxZV
         Ts2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774556163; x=1775160963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HGzAQ0Ytbp9DMP9qKdST+gwoQBJoq8iQyaGEpDcKzYM=;
        b=EELrlY9XCZ5jBn5pqQfJHTzz/BJG3N4/noer7XQZD2cWzMpfLu4hGaz5h+k42ZHqbI
         7eZeWQCsUsi53bzUJZGGPGagZ59FiiIiUzCrZznnHA/1aoKc/JasbcNvuzemTteNX8Sz
         jnduJqdVmSHPBCCBqZfTyOxmMDhHkglPSrn3lEP8LaSmTlzcSAKuxGkxV9nu37OYDNFI
         g2WwBn6t1bEgFEpsyu4DFiSLEOf5sVz9bhP3Ir6RRQdbQFO8XU9HqCOGTkFDlZNRr6ml
         6f8C6YxA1EtGJ18WBFnJrSJFijypDXY2aH/3CNSLomdD5NaEXRqI8z6ScA/iuD1hmrMU
         /HSw==
X-Gm-Message-State: AOJu0YxOu2cZSH3O4gbTGtd8pbuwCbFQrE6Uj5P+qHrdk6SKW3fJdfot
	AJ5lsaK48rtobGfng2pEXL+vi201HAagy3lNweWAJh+Zw3JJdhpFWCeQZWd/yZhqBwjNXNgtc4p
	nJjwbIpvVyqQYuqtfKnsYm/ZbjuOoun4=
X-Gm-Gg: ATEYQzxuDiy+Z6CdSfSbO1D5ptWE5nh6zKl6pn+r4OjOCDb8M/5HOYPZjQ0bB1fdaNv
	NfElOqiWj9B/aPbRG79EE3algyOVVslIFP59j2lFj5f0RF+g/GgBZcAxwkQ8FZzPsGwmsrs6gZb
	SCoBk2DWc1X8wb15iF6LpPPvZid69pWH/uty1QsfPS76lXYsKFKParC/jt0o9zWlYq8jbfHwfAQ
	pRW6gBiZfo2MWtaNCHDBDiXMkQWqupf4BMmx9vAa7cQXFDV7mztbPyXKVfqPmZbXgSWWgAW+c+N
	TEtdx1NiHncbsavSoAwDYQ==
X-Received: by 2002:a05:690c:c18f:b0:79a:d43a:11f0 with SMTP id
 00721157ae682-79ad43a1bafmr64953507b3.5.1774556162937; Thu, 26 Mar 2026
 13:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260324132958.2316491-1-stondo@gmail.com> <20260324171502.689012-6-stefano.tondo.ext@siemens.com>
In-Reply-To: <20260324171502.689012-6-stefano.tondo.ext@siemens.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 26 Mar 2026 14:15:51 -0600
X-Gm-Features: AQROBzBgSynlP5kiqoopOenHq25l-Ffd4EyL9mR0jfsDHXq-Ebj9jwAlRLzQ0fo
Message-ID: <CAJdd5GaArPg_tw8X45TsM=j2TCd4x5q1LDLU6X9vbiJczVg7eg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v16 5/5] oeqa/selftest: Add tests for source
 download enrichment
To: stondo@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, ross.burton@arm.com, 
	stefano.tondo.ext@siemens.com, peter.marko@siemens.com, 
	adrian.freihofer@siemens.com, mathieu.dubois-briand@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 20:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234051

On Tue, Mar 24, 2026 at 11:15=E2=80=AFAM Stefano Tondo via
lists.openembedded.org <stondo=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Add two new test methods to SPDX30Check:
>
> test_download_location_defensive_handling:
>   Builds m4 and verifies that SPDX generation succeeds and any
>   external references present are properly structured with valid
>   types and locator strings.
>
> test_version_extraction_patterns:
>   Builds opkg-utils (a Git-based recipe) and verifies that source
>   download packages carry the full SHA-1 commit hash as their
>   software_packageVersion.
>

LGTM, thanks

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  meta/lib/oeqa/selftest/cases/spdx.py | 76 ++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftes=
t/cases/spdx.py
> index af1144c1e5..9347e0bf7b 100644
> --- a/meta/lib/oeqa/selftest/cases/spdx.py
> +++ b/meta/lib/oeqa/selftest/cases/spdx.py
> @@ -428,3 +428,79 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase=
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
> +            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/builds/build-m4.spdx.jso=
n",
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
> +        Verifies that Git source downloads carry extracted versions and =
that
> +        the reported version strings are well-formed.
> +        """
> +        objset =3D self.check_recipe_spdx(
> +            "opkg-utils",
> +            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/builds/build-opkg-utils.=
spdx.json",
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
> +        for name, version in packages_with_versions:
> +            self.assertRegex(
> +                version,
> +                r"^[0-9a-f]{40}$",
> +                f"Expected Git source version for {name} to be a full SH=
A-1",
> +            )
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
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233819): https://lists.openembedded.org/g/openembedde=
d-core/message/233819
> Mute This Topic: https://lists.openembedded.org/mt/118487364/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

