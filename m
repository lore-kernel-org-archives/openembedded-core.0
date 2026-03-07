Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA94F55110
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 22:52:06 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19024.1772923917025913942
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 14:51:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BW5CmQzU;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79868cde1eeso115025167b3.2
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 14:51:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772923916; cv=none;
        d=google.com; s=arc-20240605;
        b=VwglL6sNAkUsnPEea6sf8ZsKPh3DnxsR0bNH0x5AXVvXorDF4m9EBdSZ2atWCvRZOe
         tgG4mMR1V/IquVEfSYx/wfba59IsO+5tseMDkfaM3CzZMTKThu/234PeixjKpy42/1yr
         UoKb+mbce6CuS3kCJ8FIng5xoNdfkxyMA7rWC8v130h5XRQnCV5r8CwBAokePe0HubQw
         Bz6SCjcUuQnL2faHpfnOJ88PSArNemglgbPqZQ/UYbLvhTdEFHwDxiITmO8jt6YJrB1o
         1q2gQ4IqTP5Sigm2kP9h4wxKW5VTYcD6RLeO8VU3NiaLvFqZdHkIuQkzeyV2qjiCF7oZ
         Nh+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8JWKCMw01V3gEUONXL6E9nnz+8Fo+pK1Ur43HZpPI9k=;
        fh=aX9SpBcc1D+i0sBLZeYvRNp2cqEQvxp/jAk+Y+9zDH4=;
        b=Po0+wrFYMhJob4x0+i1aBEBHIGA57xyL76Knz0xA/wdD0ox5/AWY+ZF7mmDQ8ZTYXt
         NX3L26okrvJDxjwcJ/TaXzPEdk8E0MBhvL0cltvN3w18dLMNmZEKHJRWQ4bSqPHeBdVV
         5OY1GIoHWuvYGfv894SByEGMfuLDPPIo1LZ4pcYOy0mJ75/d8yalWksTZNnDRNiGHgKy
         +j2YxhmCroMbD15m5zLVy5WjYBEkVsn4jOcSVK9/yRFQUPIsaj1Bjg7iFcrojXDz6xEv
         xEcBk1UIiaQBX/QOQs/Pb0adlRa8BBlZ3fexSPEw05lPQgEKd3tZwUKrCi/JoCpDMg0l
         kENQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772923916; x=1773528716; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JWKCMw01V3gEUONXL6E9nnz+8Fo+pK1Ur43HZpPI9k=;
        b=BW5CmQzUTyOrwNxiHnNGgWoNCxDgBJQYoaUEKz3W43qpfvQS3Rt5sew6pimT4wPrbU
         A5kD/vpqFfO1Yyyg0Qsy8DNDOpLBPyOI+S/z7UQ3dCeEtk6vKVw8helSbNNa5OmjHqCC
         kPbxoWdWJSQC49OAa3Pr6aXnbEv1S/8LkrFejk4wPfGAlTdU7rph0yy+Lx1u6xYZvEyh
         gGS073YT8JG1L0V2/rrIFdmBGzJsBOsHhl3pXGl3Al40NblwyYotJSW3uNKVkDtoq+WQ
         YM6Y8vC4dmOw3PH0l21axCvV4GjCLDrZw3skwtfLoYFQlLltvEF0NMI9OYQESLC5KDnB
         CmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772923916; x=1773528716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8JWKCMw01V3gEUONXL6E9nnz+8Fo+pK1Ur43HZpPI9k=;
        b=tTlpJFiZkuHkAJXV+xXSrEcLe2q0IdE6Uie2sUjWn2Hy5IxG52NmyKs6rO3ZOLEr7Z
         2YOxOLl4eDVqBXX68Sx2FU9awFccvP7loGKJDciRYLXnb7SUUq8wsHIsJjj2fjy/V8U7
         pn9utkclEYVe9N5F8Uy7b/KkjtxQCxBwZ00MNgg+ZmU6UdGFgr+P/+Em2YLnjQealyAx
         1+amFXX5lhJrPjPxXGlAQX12xeB3JEmpoHaT8Q4BjMF7HnCpVToHQsB5UW/bx9lrYu2i
         tC3EUDCoK7EkZ8qJRJBiM1TSGq0B0n4lPVEArW4IkxrfAqvIRHfOnNi/KUwcN05H8zN5
         czKA==
X-Gm-Message-State: AOJu0YxxRKReModPWUQC2Tvx/OUEQUC3/kNyf3USAmlryqOSwP7RJuJJ
	I62bjek6l9L+rOE4hiyq3xQt9J7pmdUdOO5qeaRcAWUbrUoGBD0WwsrKlX+x2Zgo0GfznbyKnbF
	SDWSM3yEz77Rr+WCUeRFsX/dw5Jik3Og=
X-Gm-Gg: ATEYQzzZ1pPbFczTc+g6Kgx1HuJd1opGf32aDEtzpvpzIHDZQmYP9f+bE+6Jx7BL11x
	HrXjkGMz+HyF9ioMOQqVF6Z/S4EEAIy3KSM6+e1PWkFWx44FZIPRuvFuzXbRzi8A2rBQ9sOqw4Z
	b8LIXukirvHPwxrwIDdd8pfUcdV/Y2a3lq3Z2GvYeKNjfj/GO2CVi4OiJ59BQMkI+XRtp3tqmbt
	ty5fVzulkbUIajiBejci5+0nwC4HJ6wPC747HdycBLKtE+J/ny4l5RtBkjIT1PLCPBdFasbsmIf
	6DXxs5ahN2PTpAcClPH2DQ==
X-Received: by 2002:a05:690c:6e87:b0:798:2cd4:5567 with SMTP id
 00721157ae682-798dd79a428mr63812507b3.56.1772923916089; Sat, 07 Mar 2026
 14:51:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com> <cf5163cfab3cf40b250dc77aefc0d91948b6c14e.1772805096.git.stefano.tondo.ext@siemens.com>
In-Reply-To: <cf5163cfab3cf40b250dc77aefc0d91948b6c14e.1772805096.git.stefano.tondo.ext@siemens.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 7 Mar 2026 15:51:44 -0700
X-Gm-Features: AaiRm512k-U6MCkJuERLHc__oXuV_Nm8bXWpcb3lPp4puyabqGxI8SpJpgsikbI
Message-ID: <CAJdd5GZV50U0tMkvL1_mEdg5q03WOV=5Jx0uVWU3ekX2_cOnTg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v7 08/10] spdx.py: Add test for version
 extraction patterns
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
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 22:52:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232624

On Fri, Mar 6, 2026 at 7:00=E2=80=AFAM Stefano Tondo via
lists.openembedded.org <stondo=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Add test verifying that version extraction patterns work correctly for:
> - Rust crates (.crate files)
> - Go modules
> - Python packages (PyPI)
> - Generic tarball formats
> - Git revision hashes
>
> Test builds tar recipe and validates that all packages have proper
> version strings extracted from their filenames.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  meta/lib/oeqa/selftest/cases/spdx.py | 53 ++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftes=
t/cases/spdx.py
> index 9b6fcd335c..14a50205d5 100644
> --- a/meta/lib/oeqa/selftest/cases/spdx.py
> +++ b/meta/lib/oeqa/selftest/cases/spdx.py
> @@ -448,3 +448,56 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase=
):
>              f"External references {'found' if found_external_refs else '=
not found'} "
>              f"in SPDX output (defensive handling verified)"
>          )
> +
> +    def test_version_extraction_patterns(self):
> +        """
> +        Test that version extraction works for various package formats.
> +
> +        This test verifies that version patterns correctly extract versi=
ons from:
> +        1. Rust crates (.crate files)
> +        2. Go modules
> +        3. Python packages (PyPI)
> +        4. Generic tarball formats
> +        5. Git revision hashes
> +        """
> +        # Build a package that has dependencies with various formats
> +        objset =3D self.check_recipe_spdx(
> +            "tar",
> +            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/recipes/recipe-tar.spdx.=
json",
> +            # Use a unique namespace prefix to ensure do_create_spdx run=
s
> +            # fresh regardless of sstate from prior tests in the same
> +            # oe-selftest worker (see test_extra_opts for rationale)
> +            extraconf=3D"""\
> +                SPDX_NAMESPACE_PREFIX =3D "http://spdx.org/spdxdocs/test=
-version-extract"
> +                """,
> +        )

Again, you aren't changing anything so this should work just fine when
pulled from sstate.

> +
> +        # Collect all packages with versions
> +        packages_with_versions =3D []
> +        for pkg in objset.foreach_type(oe.spdx30.software_Package):
> +            if hasattr(pkg, 'software_packageVersion') and pkg.software_=
packageVersion:

hasattr is redundant.

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
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232574): https://lists.openembedded.org/g/openembedde=
d-core/message/232574
> Mute This Topic: https://lists.openembedded.org/mt/118170502/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

