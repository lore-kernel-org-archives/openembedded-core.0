Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 737BBF54ACB
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 14:48:58 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21517.1774363729038018664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 07:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TPbYuGS3;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64ad46a44easo5124422d50.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 07:48:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774363728; cv=none;
        d=google.com; s=arc-20240605;
        b=GXKiEa/OjGOmMAAGEMiRw+/ZXK/2rVj6MelwNfHhZbDEnrTmD33DoOa/5zQQ1uYkes
         zmskvTUayAdQZGH1fqbJODOr2wCXKMTeafGj5Eg2aTarxK53sEzAPN2YHe09cusUtkn7
         6Dt6UdFgAn6bvY5Js14ZqAALHkKaxDGkyWl04AxVt/IeyDn2ja1uzomSKhPnNXZnudUw
         DQrIyu1Snox0ByIOQsBbIQ+OqGLQ1ID5y0fMwil5XjpWTeut0nAjnoEs8lUxG2cO2uOk
         iX8ARsTKQB2qQAiLrV+TgRzXcGTWmuqL8lYCi9zNX+1QJTT9IgQXm8R7OIZCC6wiwatU
         +a9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HP8HP4SCXQAsqCmftiEmD+f8kftEdNZeemyT7sPW630=;
        fh=XL+ydw4zRzqZKs8yhWIx30/frJay1bXF2X1wuGsnf7M=;
        b=JY9phSCLUCjzfjBarS6XoES2wlOgsiUaScIjpyJKescZSKXZ50GvEvMIuqhzZg5V9h
         Z8p/p6ZBMNS9SwGY1lzHDUZ/GNhaeWV12zllqyKbuBBXS62jyVPIacNX6Xv1pn2keEyc
         /0BSrw76Qi3y19iJSP7Bay2AJsQG2DTek+v83dIBuARNK7sUr4wOXgG9UhEkYmdvEUuX
         txqglIbtRKXyR+7MsV2t9VPlpkbDPPRZSW2lfc0avWrVfHD5f9rLW508RtZylWcUQ2uF
         c586Z0LBN+26AJwSbBxs2zU/MYQyeJOiFYPUZoTO1lcqkCnEg8KA3j5gMIhd3VCnfwaI
         OHvQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774363728; x=1774968528; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HP8HP4SCXQAsqCmftiEmD+f8kftEdNZeemyT7sPW630=;
        b=TPbYuGS3K2efRz9vID+Gyb5mcD6NJBSiilPSsQovAQp5FHfbHKTyJItbital4+RVgF
         HdBk60PuHahQG9avd9y4pXN/Lj67jp4j5zdzVXD7gZyjKUbDRVG5p9LtC+kkMC8gfIkm
         EH4LLiDBChTFe++XnBDHbq1pBWAsR/1QYMJkpTyhzKmgWPEsgn8rWAANnmf7EhQsSMq9
         cehCZoHciEDPGHMke6HHJuBpZ2T0zfD4gLNr6/1wQ9z96bNmLArvLAL4BXofj/9MFtRV
         tb8TzIbOwSKav8mE5N5tl0JylOiCJnQU3Cn7lqFY+9P+eNmssL7pwZMmMbYQh7yetwAY
         s9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774363728; x=1774968528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HP8HP4SCXQAsqCmftiEmD+f8kftEdNZeemyT7sPW630=;
        b=TqzrnC+AQs7zX7UjYG6RzuRtNCDYXl71zGQBtpZ4agg1fYh/Gpp7p30YxuvbKG0ia9
         eIdeeH0rCvHZ2r63CLho/r+47JuzwsE/1ckXeyFAU0aHeWVtFl33X05ykAQsVz3C4ZtX
         DzU6t5KV2NaPPH4rMOLjMa4UoWo4DYNKdvzRXD2nBiQQD045VU9PUIez6eHh68j3CBaF
         wo386LIn8Q/JyP1XudQDFCAuvH1ypaoSv1hwdTke5PlIJLOpPQHmsd9BqXs0qebk7vrT
         XocAW07rnLPCrBZkfzhy5wilJxc3UJuzOv1nOIJttS31OY5AITieNnVhd+zmf0Coly82
         qcKw==
X-Gm-Message-State: AOJu0Yzm5Eo/G4j3hpj+/Z7Feyk04q2o6BHaWRRYpyOOqLVy3Wdf1ONu
	R6X4LeGvm/S9sgivzmaUgdUPFB+WJFhHBg+ix7mgB4sP6dQNr4H3XsuiVlZMxWxHT3LgbyeM/EL
	iQTMro2j8MPrvI4w4miAo7+qbbbpFr1M=
X-Gm-Gg: ATEYQzyElFbcDxDfaRHHn+/XyWxlRI3kByYecBo/kcyi25ew9YtM0XGx33zp4hR3zNF
	A4KwVGyaEMp+3MQdiwbfWE1nsOl1cDJfFKaTN/BH8WvzhoUx4ziTtcqeZl1fa1UfE32iIEfR59H
	LKvIEIE9Mq89zQitXGrxIupr86/9l1GrRqnmQPKsx1p6tkwl/DWU/hq6xEAQ2KFVDpTLz+QKn2i
	wqZDeJO1U1S+lQa2dZ5u2Uid/y0VpB3rXcV9DgcU87FjGTSHdLIdyh1GKQNJ9RZaUqB63egHXI4
	L1tVHid2Evm/ED++FXw2OQ==
X-Received: by 2002:a53:c051:0:10b0:64e:a969:fd10 with SMTP id
 956f58d0204a3-64eaa6df2e5mr12580810d50.32.1774363727828; Tue, 24 Mar 2026
 07:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260323210745.1337169-1-stefano.tondo.ext@siemens.com> <20260323210745.1337169-5-stefano.tondo.ext@siemens.com>
In-Reply-To: <20260323210745.1337169-5-stefano.tondo.ext@siemens.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 24 Mar 2026 08:48:35 -0600
X-Gm-Features: AaiRm505d_hci0S8yx2TeORUsLM94nQSxygZxt7V_ifIkKwFFdUKRSMRVU3IC5I
Message-ID: <CAJdd5GbsEJ3ms1DiuqG3R2Z5Nn1hCJ1_GrhAhNL5qfCV8yRO5A@mail.gmail.com>
Subject: Re: [PATCH v13 4/4] oeqa/selftest: Add tests for source download enrichment
To: Stefano Tondo <stondo@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, ross.burton@arm.com, 
	stefano.tondo.ext@siemens.com, peter.marko@siemens.com, 
	adrian.freihofer@siemens.com, mathieu.dubois-briand@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 14:48:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233805

On Mon, Mar 23, 2026 at 3:07=E2=80=AFPM Stefano Tondo <stondo@gmail.com> wr=
ote:
>
> Add comprehensive tests for the new source download SPDX features:
>
> test_download_location_defensive_handling:
>   Verify that packages with no download location (e.g. packagegroups,
>   images, virtual providers) are handled gracefully without crashing
>   the SPDX generation pipeline.
>
> test_version_extraction_patterns:
>   Verify that Git source packages get SRCREV as their version in the
>   SPDX output, rather than the recipe PV.
>
> test_packageconfig_spdx:
>   Verify that PACKAGECONFIG features are correctly recorded in SPDX
>   build parameters when SPDX_INCLUDE_PACKAGECONFIG is enabled.

The tests look good, but the merge went wrong

>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  meta/lib/oeqa/selftest/cases/spdx.py | 104 +++++++++++++++++++++------
>  1 file changed, 83 insertions(+), 21 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftes=
t/cases/spdx.py
> index af1144c1e5..140d3debba 100644
> --- a/meta/lib/oeqa/selftest/cases/spdx.py
> +++ b/meta/lib/oeqa/selftest/cases/spdx.py
> @@ -141,29 +141,15 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCas=
e):
>      SPDX_CLASS =3D "create-spdx-3.0"
>
>      def test_base_files(self):
> -        self.check_recipe_spdx(
> -            "base-files",
> -            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/static/static-base-files.s=
pdx.json",
> -            task=3D"create_recipe_spdx",
> -        )

I think your merge went wrong here, since you removed my changes
instead of keeping them :)

>          self.check_recipe_spdx(
>              "base-files",
>              "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/packages/package-base-file=
s.spdx.json",
>          )
>
> -    def test_world_sbom(self):
> -        objset =3D self.check_recipe_spdx(
> -            "meta-world-recipe-sbom",
> -            "{DEPLOY_DIR_IMAGE}/world-recipe-sbom.spdx.json",
> -        )
> -
> -        # Document should be fully linked
> -        self.check_objset_missing_ids(objset)
> -

ditto.

>      def test_gcc_include_source(self):
>          objset =3D self.check_recipe_spdx(
>              "gcc",
> -            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/builds/build-gcc.spdx.js=
on",
> +            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/recipes/recipe-gcc.spdx.=
json",
>              extraconf=3D"""\
>                  SPDX_INCLUDE_SOURCES =3D "1"
>                  """,
> @@ -176,12 +162,12 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCas=
e):
>              if software_file.name =3D=3D filename:
>                  found =3D True
>                  self.logger.info(
> -                    f"The spdxId of {filename} in build-gcc.spdx.json is=
 {software_file.spdxId}"
> +                    f"The spdxId of {filename} in recipe-gcc.spdx.json i=
s {software_file.spdxId}"
>                  )
>                  break
>
>          self.assertTrue(
> -            found, f"Not found source file {filename} in build-gcc.spdx.=
json\n"
> +            found, f"Not found source file {filename} in recipe-gcc.spdx=
.json\n"
>          )
>
>      def test_core_image_minimal(self):
> @@ -319,7 +305,7 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase)=
:
>          # This will fail with NameError if new_annotation() is called in=
correctly
>          objset =3D self.check_recipe_spdx(
>              "base-files",
> -            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/builds/build-base-files.sp=
dx.json",
> +            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/recipes/recipe-base-files.=
spdx.json",
>              extraconf=3Dtextwrap.dedent(
>                  f"""\
>                  ANNOTATION1 =3D "{ANNOTATION_VAR1}"
> @@ -374,8 +360,8 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase)=
:
>
>      def test_kernel_config_spdx(self):
>          kernel_recipe =3D get_bb_var("PREFERRED_PROVIDER_virtual/kernel"=
)
> -        spdx_file =3D f"build-{kernel_recipe}.spdx.json"
> -        spdx_path =3D f"{{DEPLOY_DIR_SPDX}}/{{SSTATE_PKGARCH}}/builds/{s=
pdx_file}"
> +        spdx_file =3D f"recipe-{kernel_recipe}.spdx.json"
> +        spdx_path =3D f"{{DEPLOY_DIR_SPDX}}/{{SSTATE_PKGARCH}}/recipes/{=
spdx_file}"
>
>          # Make sure kernel is configured first
>          bitbake(f"-c configure {kernel_recipe}")
> @@ -383,7 +369,7 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase)=
:
>          objset =3D self.check_recipe_spdx(
>              kernel_recipe,
>              spdx_path,
> -            task=3D"do_create_spdx",
> +            task=3D"do_create_kernel_config_spdx",
>              extraconf=3D"""\
>                  INHERIT +=3D "create-spdx"
>                  SPDX_INCLUDE_KERNEL_CONFIG =3D "1"
> @@ -428,3 +414,79 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase=
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

